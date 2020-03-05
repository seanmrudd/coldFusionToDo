<!DOCTYPE html>
<html>

<head>
    <title>To Do</title>
	<link rel="stylesheet" href="style.css">
</head>

<body>

<div class="content">
    <h1>To Do App</h1>

<!--- Input form for To Dos --->
    <cfform>
        <p>Title: <cfinput type="text" name="title" size="35" ></p>
        <p>Description: <cftextarea name="textarea" rows="1" cols="31" wrap="off"></cftextarea></p>
        <cfinput type="submit" name="submitForm" value="submit">
    </cfform>

<!--- If statement that posts data to sql database --->
    <cfif IsDefined("Form.submitForm")>
		<cfset insertTitle="#title#">
		<cfset insertDescriptive="#textarea#">
		<cfparam name="insertTitle" type="string">
		<cfparam name="insertDescriptive" type="string">
		<cfoutput>
			<cfquery name="myQuery" datasource="toDoApp_DB">
				INSERT INTO toDos (title, descriptive)
				VALUES(<cfqueryparam value="#insertTitle#" cfsqltype="CF_SQL_VARCHAR" null="no">, <cfqueryparam value="#insertDescriptive#" cfsqltype="CF_SQL_VARCHAR" null="no">)
			</cfquery>
		</cfoutput>
    </cfif>

<!--- If Statement to delete entry by id from database (still working on this) --->
	<cfif isDefined("Form.deleteBtn")>
		<cfparam name="deleteByID" default="" type="string">  
		<cfset deleteByID = 3>
		<cfoutput>
    		<cfquery name="myQuery" datasource="toDoApp_DB">
        		DELETE FROM toDos
        		WHERE id = <cfqueryparam value="#deleteByID#" cfsqltype="CF_SQL_INTEGER">
    		</cfquery>
		</cfoutput>
	</cfif>

<!--- Query to grab data from database --->
	<cfquery datasource="toDoApp_DB" name="toDoApp_DB">
    	SELECT id, title, descriptive, created_at
    	FROM toDos
	</cfquery>

<!--- Table to display To Do Lists --->
    <table width="50%" border="2" cellspacing="0" cellpadding="2">
    	<tr>
	    	<th>Date Created</th>
	    	<th>Title</th>
	    	<th>Description</th>
	    	<th>Delete</th>
    	</tr>
	<!--- Utilizing data pulled from query.  Looping through data using table tags --->
    	<cfoutput query="toDoApp_DB" group="created_at">
	    	<tr>
	           <td>#dateFormat(created_at, "m/d/y")# #timeFormat(created_at, "K:nntt")#</td>
	           <td>#title#</td>
	           <td>#descriptive#</td>
	           <td><cfform><input type="submit" name="deleteBtn" value="delete" id="#id#" onClick="reply_click(this.id)"></input></cfform></td>
	       </tr>
		</cfoutput>
    </table>

</div>

  	<!--- 	<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script> 
	<script> 
		$(".deleteBtn").click(function(){
			let value = $(".deleteBtn").attr("data-value");
			alert(value)
		})
	</script>
	<script type="text/javascript">
  		function reply_click(clicked_id){
      		alert(clicked_id);
  		}
	</script>--->

</body>

</html>