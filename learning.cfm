<!DOCTYPE html>
<html>
	
	
<h1>Hello World</h1>

<cfset firstname="Sean">
<cfset lastname="Rudd">
<cfset fullname=firstname & " " & lastname>

<cfoutput> My full name is #fullname#.</cfoutput>

<!-- CF if statements -->
<cfset firstName="Gary" />
<cfif (4==4)>
    <cfdump  var="Gary">
</cfif>

<!-- Explicitly creating a struct -->
<cfset user = structNew() />
<cfset user.firstName = "John" />
<cfset user.lastName = "Smith" />
<cfset user.age = 25 />
<cfset user.hobby = "League of Legends" />

<cfdump var="#user#" label="Waddup" />
<br/>

<!-- Implicitly creating a struct -->
<cfset implicitUser= {firstName="Sean", lastName="Rudd", age=31} />

<!-- Deleteing key/value from struct -->
<cfset structDelete(implicitUser, "age") />

<cfdump var="#implicitUser#" />

<!-- structCount() shows how many keys in the structure -->
<cfoutput>
    #structCount(user)#
</cfoutput>

<!-- Querying data from MySQL -->
<cfquery datasource="toDoApp_DB" name="toDoApp_DB">
    SELECT id, title, descriptive, created_at
    FROM toDos
</cfquery>

<cfdump  var="#toDoApp_DB#">
<cfdump  var="#toDoApp_DB.descriptive#"></br></br>

<!-- Can loop through a table in CF.  Also cool date and time formats -->
<cfoutput query="toDoApp_DB">
    <table>
      <tr>
            <td>#dateFormat(created_at, "m/d/y")# #timeFormat(created_at, "K:nntt")#</td>
            <td>#title#</td>
            <td>#descriptive#</td>
        </tr>
    </table>
</cfoutput>

</br></br>

<!-- Looping through data -->
<cfoutput>
    <cfloop query="toDoApp_DB">
        #title# - #descriptive# - #dateFormat(created_at, "m/d/y")# #timeFormat(created_at, "K:nntt")#<br/>
    </cfloop>
</cfoutput>

<!-- Inserting into a table -->
<!--- <cfparam name="insertTitle" default="" type="string">
<cfparam name="insertDescriptive" default="" type="string">
<cfset insertTitle = "Chasing Squirrels">
<cfset insertDescriptive = "You know, just gotta chase some crazy squirrels">
<cfoutput>
    <cfquery name="myQuery" datasource="toDoApp_DB">
        INSERT INTO toDos (title, descriptive)
        VALUES(<cfqueryparam value="#insertTitle#" cfsqltype="CF_SQL_VARCHAR">, <cfqueryparam value="#insertDescriptive#" cfsqltype="CF_SQL_VARCHAR">)
    </cfquery>
</cfoutput> --->

<!-- Deleteing by id -->
<!--- <cfparam name="deleteByID" default="" type="string">  
<cfset deleteByID = 24>
<cfoutput>
    <cfquery name="myQuery" datasource="toDoApp_DB">
        DELETE FROM toDos
        WHERE id = <cfqueryparam value="#deleteByID#" cfsqltype="CF_SQL_INTEGER">
    </cfquery>
</cfoutput>--->

<cffunction name="TEST" returntype="string" output="false">
    <cfreturn "This is test. The time is " & timeformat(now(), "HH:MM:SS")>
</cffunction>

<cfif isDefined("form.test")>
<cfoutput>#test()#</cfoutput><br>
</cfif>

<cfform>
<cfinput name="TEST" type="submit" value="Call test()">
</cfform>

<button id="1" onClick="reply_click(this.id)">B1</button>
<button id="2" onClick="reply_click(this.id)">B2</button>
<button id="3" onClick="reply_click(this.id)">B3</button>
    
<script type="text/javascript">
  function reply_click(clicked_id)
  {
      alert(clicked_id);
  }
</script>

</html>

