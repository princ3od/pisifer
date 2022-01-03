import re
from gensim.models.doc2vec import Doc2Vec
from nltk.tokenize import word_tokenize
from gensim.parsing.preprocessing import STOPWORDS
from datetime import date


def load_model(filename='d2v_2.model'):
    global model
    model = Doc2Vec.load(filename)
    return model


def rm_stopwords(tokenized_doc):
    tok_without_sw = []
    for txt_tokens in tokenized_doc:
        tok_without_sw = [
            word for word in tokenized_doc if not word.lower() in STOPWORDS]
    return tok_without_sw

def remove_punctuation(raw_text):
    text = re.sub(r'[^\w\s]', '', raw_text)
    return text

def remove_number(raw_text):
    text = re.sub(r'\d+', '', raw_text)
    return text

def infer(text, top=3, remove_num=False):
    if top > 7:
        top = 7
    if top < 1:
        top = 1
    text = text.replace('\n', ' ')
    text = remove_punctuation(text)
    if remove_num:
        text = remove_number(text)
    processed_text = word_tokenize(text.lower())
    processed_text = rm_stopwords(processed_text)
    raw_result = model.docvecs.most_similar(
        positive=[model.infer_vector(processed_text)], topn=top)
    result = []
    for i in range(top):
        result.append({raw_result[i][0]: round(raw_result[i][1], 4)})
    return {
        'output': result,
        'processed_text': ' '.join(processed_text),
        'time': date.today(),
    }
