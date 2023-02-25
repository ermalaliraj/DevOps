#!/bin/bash

cp *.service /lib/systemd/system

systemctl enable my-api
systemctl enable authJwt

systemctl daemon-reload

systemctl unmask authJwt