import { LightningElement } from 'lwc';

export default class IteratingFormation extends LightningElement {
    taskList=[
        {taskId:1,taskName:'Prepare video script',taskPriority:'High',taskStatus:'In-Progress'},
        {taskId:2,taskName:'Record Tutorial',taskPriority:'Medium',taskStatus:'Pending'},
        {taskId:3,taskName:'Edit & Upload',taskPriority:'Low',taskStatus:'Pending'}
    ];
}