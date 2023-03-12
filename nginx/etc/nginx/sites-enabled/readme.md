## sites-enabled

Real server configurations are defined inside 'sites-available
For each server create here a link to be seen from Ngnix. Example: 

    ln -s ../sites-available/default default
    ln -s ../sites-available/admin.campus.com admin.campus.com
