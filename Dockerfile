# using the offical python 3.12.1 image
from python:3.12.1
# set  the working directory to / code 
WORKDIR / code
#copy the current directoy contentents in container at / code
copy ./ requirements.txt/code/ requirements.txt
# install the  requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
# set up a new user name "user"
RUN useradd user

USER user
# set home  to home user's  directory 
ENV HOME=/home/user \ 
    PATH=/home/user/.local/bin:$PATH
# Set the working directory in the container to the home directory of the new user
WORKDIR $HOME/app

# Set the working directory in the container to the home directory of the new user
WORKDIR $HOME/app
# Change the ownership of the copied files to the new user
COPY --chown=user .$HOME/app

# Start FastAPI with uvicorn
CMD ["uvicorn", "app:app", "--host" , "0.0.0.0", "--port", "7860"]



