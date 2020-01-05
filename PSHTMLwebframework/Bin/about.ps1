$page  = $MyInvocation.MyCommand.Name -replace '.ps1'
$Label = (Get-Culture).TextInfo.ToTitleCase($page.ToLower())
$Title = "PSHTML Webexample"

$HTML = html {

    head {
        
        Meta -name viewport -content_tag "width=device-width, initial-scale=1.0"
        link -rel 'icon' -href 'https://avatars1.githubusercontent.com/u/56639134?s=400&u=9c1a1dc1a8d8718534bf7d455042c7382cc419a0&v=4' -type 'image/x-icon'
        Link -href "Style/style.css" -rel stylesheet
        Link -href "Assets/BootStrap/bootstrap.min.css" -rel stylesheet
        Script -src "Assets/BootStrap/bootstrap.min.js"
        link -href "https://fonts.googleapis.com/css?family=Quicksand&display=swap" -rel "stylesheet"
        
        Title "$($page.ToUpper()) | $($Title)"
    }

    body {

        div -Class "container pt-4" -Content {

            header {

                nav -class "navbar navbar-expand-sm bg-dark fixed-top" -content {

                    ul -class "navbar-nav" -content {

                        Include navbar

                        #FixedLinks
                        li -class "nav-item" -content {
                            a -class "nav-link" -href "https://pshtml.readthedocs.io/" -Target _blank -content { "PSHTML" }
                        }
                
                        li -class "nav-item" -content {
                            a -class "nav-link" -href "https://getbootstrap.com/" -Target _blank -content { "Bootstrap" }
                        }
                
                        li -class "nav-item" -content {
                            a -class "nav-link" -href "https://www.w3schools.com/" -Target _blank -content { "w3schools" }
                        }
                
                    }

                }

            }

            #region jumbotron
            div -id "j1" -class 'jumbotron text-center' -content {
        
                p {
                    h1 "$($Title)"
                }

                hr

                p {
                    "Automatically created website "
                    b { $($Label) }
                    $link = a {"PSHTMLwebframework"} -href "https://github.com/tinuwalther/PSHTMLwebframework/blob/develop/README.md" -Target _blank
                    " | Generated with $($link)"
                }
            } 
            #endregion

            #region Section
            div -id "1" -class 'container-fluid' -Content {

                h1 "$($Label) PSHTML Webframework"

                p { "The PSHTMLwebframework builds HTML-Files with PSHTML from native PowerShell-Scripts." }

                h2 "Create the Webframework"

                p { "To create the Webframework with PSHTMLwebframework, run the following commands:" }
                p { "1. git clone https://github.com/tinuwalther/PSHTMLwebframework.git" } -class "text-monospace"
                p { "2. git checkout develop" } -class "text-monospace"
                p { "3. git pull" } -class "text-monospace"

                h2 "Build the Home page"

                p { "To build the Home page (index.html), run the following commands:" }
                p { "1. Import-Module -Name .\PSHTMLwebframework.psd1" } -class "text-monospace"
                p { "2. Run Publish-WEBHtmlPages" } -class "text-monospace"

                h2 "Create a new Webpage"

                p { "To create a new Webpage from the Template, run the following commands:" }
                p { "1. Run New-WEBPage -newpage Page1" } -class "text-monospace"
                p { "2. Modify the new Page1.ps1" } -class "text-monospace"
                p { "3. Run Publish-WEBHtmlPages" } -class "text-monospace"
                p { "After each changes on one or more Script-Page, you must run Publish-WEBHtmlPages to publish the changes to the HTML-File." }
                p { 
                    "For more information read about "
                    a {"PSHTMLwebframework"} -href "https://github.com/tinuwalther/PSHTMLwebframework/blob/develop/README.md" -Target _blank
                    " on github.com"
                }
            }
            #endregion
            
            Footer {
            
                Include -Name footer
                
            }
                
        } 
    
    }
    
}

$HTML | out-File -Filepath ..\$($page).html -Encoding utf8
