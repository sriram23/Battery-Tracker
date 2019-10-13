#!/usr/bin/python

import sys
import time
import Tkinter as tk
import tkMessageBox
root = tk.Tk()
root.withdraw()
path = str(sys.argv[1])
print path

def powerFunction():
	current_stat=open(path+"/capacity","r").readline().strip()
	return current_stat

def chargeState():
	charge_state=open(path+"/status","r").readline().strip()
	return charge_state
powerStat = 100
print powerStat
tkMessageBox.showinfo("Running!","Battry Status Tracker is now running on machine")
while int(powerStat)>=30:
	powerStat = powerFunction()
	chargeStat = chargeState()
	print "Battery Tracking"
	if int(powerStat)<=30 and chargeStat == "Discharging":
		tkMessageBox.showwarning("Alert!","Battery Low!\nCharging Required!\nYour Battery Status:"+powerStat+"% ("+chargeStat+")")
	if int(powerStat)==100 and chargeStat == "Full":
		tkMessageBox.showinfo("Alert!","Battery Full!\n"+powerStat+"% ("+chargeStat+")\nUnplug the charger to save your battery life.")
	time.sleep(300)