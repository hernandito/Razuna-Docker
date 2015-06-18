<cfscript>
	// usage:
	//		<reactor:list
	//				object="dbObject"
	//				query="cfQueryVar" />
	if (fb_.verbInfo.executionMode is "start") {
		// validate attributes
		// object - string
		if (not structKeyExists(fb_.verbInfo.attributes,"object")) {
			fb_throw("fusebox.badGrammar.requiredAttributeMissing",
						"Required attribute is missing",
						"The attribute 'object' is required, for a 'init' verb in fuseaction #fb_.verbInfo.circuit#.#fb_.verbInfo.fuseaction#.");
		}
		// query - string
		if (not structKeyExists(fb_.verbInfo.attributes,"query")) {
			fb_throw("fusebox.badGrammar.requiredAttributeMissing",
						"Required attribute is missing",
						"The attribute 'query' is required, for a 'init' verb in fuseaction #fb_.verbInfo.circuit#.#fb_.verbInfo.fuseaction#.");
		}
		// generate code:
		fb_appendLine('<cfset #fb_.verbInfo.attributes.query# = ' &
				'myFusebox.getApplication().getApplicationData().reactorFactory.createGateway("#fb_.verbInfo.attributes.object#").getAll() />');
		fb_appendLine('<cfset myFusebox.trace("Reactor","Listed Records") />');

	} else {
	}
</cfscript>
