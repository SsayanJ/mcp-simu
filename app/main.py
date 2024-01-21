# create fastapi to simulate a machine with an ON/OFF status and endpoints to change the status
# Includes a streamlit front with a button to change the status
from fastapi import FastAPI

# create the fastapi app    

app = FastAPI()

status = False

@app.get("/status")
async def get_status():
    return {"status": status}

@app.post("/on")
async def turn_on():
    global status
    status = True
    return {"status": status}

@app.post("/off")
async def turn_off():
    global status
    status = False
    return {"status": status}





if __name__ == "__main__":
    import uvicorn
    # run the fastapi app
    uvicorn.run(app, host="127.0.0.1", port=8000)

