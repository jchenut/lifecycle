<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_Acc_Caution</fullName>
        <field>Caution__c</field>
        <formula>&quot;HIGH RISK Production sites&quot;</formula>
        <name>Update Acc-Caution</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Account__c</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>High Risk notification</fullName>
        <actions>
            <name>Update_Acc_Caution</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Site__c.Capacity__c</field>
            <operation>greaterOrEqual</operation>
            <value>10000</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
