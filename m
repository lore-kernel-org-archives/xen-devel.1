From: Anil Madhavapeddy <anil@recoil.org>
Subject: Re: [MirageOS-devel] [Minios-devel] Preparing for GSoC
 and Outreachy : getting Outreach Program Projects into good shape
Date: Wed, 24 Jan 2018 10:22:50 +0000
Message-ID: <8B6E674A-1AF1-454F-94F1-1178BB96CC57__24461.9851968766$1516791084$gmane$org@recoil.org>
References: <219B4CE4-9E0A-47CC-BD7B-261BE9FA6F91@gmail.com>
 <7B17E6EE-A4B3-44F9-BC41-3B63C6DEACD4@gmail.com>
 <8cea3e1b-f3e0-b6bb-e7f2-f2e7392387db@neclab.eu>
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Content-Type: multipart/mixed; boundary="===============3094239226993383057=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=omo3=et=recoil.org=anil@srs-us1.protection.inumbo.net>)
 id 1eeIcd-0003wv-46
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2018 10:49:39 +0000
In-Reply-To: <8cea3e1b-f3e0-b6bb-e7f2-f2e7392387db@neclab.eu>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Simon Kuenzer <simon.kuenzer@neclab.eu>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Lars Kurth <lars.kurth.xen@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Doug Goldstein <cardoe@cardoe.com>, George Dunlap <george.dunlap@citrix.com>, xen-xapl@lists.xenproject.org, minios-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, "Jesus M. Gonzalez-Barahona" <jgb@bitergia.com>, mirageos-devel <mirageos-devel@lists.xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>, win-pv-devel@lists.xenproject.org, paul.durrant@citrix.com, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============3094239226993383057==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_3332E6E1-D160-40DE-8361-796F538F46F9"


--Apple-Mail=_3332E6E1-D160-40DE-8361-796F538F46F9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Looks good to me. The difficulties are all =E2=80=98medium=E2=80=99 =
though.  Perhaps break up the =E2=80=9Cnew execution targets=E2=80=9D =
into medium/hard for the various backends? For example, Xen/ARM is =
probably easier than bare metal ARM, and I imagine HyperV is quite =
complex due to the extra coordination code that is required.

regards
Anil

> On 24 Jan 2018, at 09:40, Simon Kuenzer <simon.kuenzer@neclab.eu> =
wrote:
>=20
> Hi all,
>=20
> since we are participating the first time to GSoC, we are happy to =
receive any feedback from you regarding our proposed Unikraft projects!
>=20
> https://wiki.xenproject.org/wiki/Outreach_Program_Projects#Unikraft =
<https://wiki.xenproject.org/wiki/Outreach_Program_Projects#Unikraft>
>=20
> Thanks,
>=20
> Simon
>=20
> On 23.01.2018 10:16, Lars Kurth wrote:
>> Hi all,
>> just a quick note that I submitted the application for GSoC.
>> The project list is not perfect and I removed a number of projects =
because I believe they were completed (or at least started by others). A =
Thank You to Mirage OS and Unikraft folks for adding new projects
>> If we do get accepted, we will have to have another go at the project =
list
>> Best Regards
>> Lars
>>> On 8 Jan 2018, at 15:19, Lars Kurth <lars.kurth.xen@gmail.com> =
wrote:
>>>=20
>>> Hi All,
>>>=20
>>> it's this time of the year again to prepare for GSoC/Outreachy! The =
application deadline for orgs is January 23 - February 11: ideally we =
will have a good updated lists of projects by then as Google will look =
at the quality of the project list. I will also need co-org admins: =
@Mindy are you willing to do this again? Maybe also someone from the =
Unikraft project. That helps ensure that we have reps from various =
subproject that ensure that we don't miss deadlines.
>>>=20
>>>=20
>>> Best Regards
>>> Lars
>>>=20
>>> Existing Projects (for people on the CC list)
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> If you are CC'ed you have one or several projects listed on =
https://wiki.xenproject.org/wiki/Outreach_Program_Projects ... What I =
need you to do is to
>>>=20
>>> a) Weed out any projects that have been completed or are not =
relevant any more
>>>   @Mindy: For MirageOS folks, please check and update =
https://github.com/mirage/mirage-www/wiki/Pioneer-Projects and do the =
same
>>>=20
>>> b) Decide whether you still want to mentor:
>>>   This requires some of your bandwidth from mid-Feb to March 2018 to =
work on small projects
>>>   The actual work happens from May 14 - Aug 14
>>>=20
>>>   If not, please reply and list projects affected
>>>   If yes, please also do so and I will update the Verified field =
accordingly
>>>=20
>>> c) Add any new information to existing projects as relevant.
>>>=20
>>>=20
>>> New Projects
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> Feel free to add new projects to the list, but if you do so please =
let the list know. We are not going to be very strict with =
https://wiki.xenproject.org/wiki/Outreach_Program_Projects#Conventions_for=
_Projects_and_Project_Mentors, but getting someone else to review your =
proposal is a good idea.
>>>=20
>>> Unikraft
>>> --------
>>> I created a place-holder for Unikraft at =
https://wiki.xenproject.org/wiki/Outreach_Program_Projects#Unikraft as =
Unikraft project members indicated they want to participate.
>>> You probably do want to set expectations with regards to start-up =
tasks and come up with a set of tasks to act as a filter for applicants =
(e.g. showing that they set up the environment, etc.)
>>>=20
>>>=20
>>> Specific Improvements to the project documentation
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>>>=20
>>> Hypervisor start-up tasks
>>> -------------------------
>>> https://wiki.xenproject.org/wiki/Xen_Project_Development_Projects =
contains: "An easy way to get started (and show that you can set up the =
Xen Development Environment, fix an issue, build and test Xen, submit a =
patch, etc.) is to address a suitable number of Coverity Scan issues. =
Ask on xen-devel@ for a set of suitable Coverity issues. Note that this =
does not require any access to the Coverity scan results. Open bugs to =
fix under the Small Code Contribution Requirement can also be found on =
bugs.xenproject.org"
>>>=20
>>> Do we want to change this? Finding small get started projects is =
always a little bit of a problem. Maybe we can prepare a better list =
somewhere.
>>>=20
>>> In-tree vs. Wiki based projects
>>> -------------------------------
>>> We could also decide to move Hypervisor related ideas in-tree =
somewhere and generate a list if that makes things easier. But this is =
not necessary, in particular given with everything that is going on. I =
just wanted to raise this as an option: I am not particularly wedded to =
using the wiki.
>>>=20
>> _______________________________________________
>> Minios-devel mailing list
>> Minios-devel@lists.xenproject.org =
<mailto:Minios-devel@lists.xenproject.org>
>> https://lists.xenproject.org/mailman/listinfo/minios-devel =
<https://lists.xenproject.org/mailman/listinfo/minios-devel>
>=20
> _______________________________________________
> MirageOS-devel mailing list
> MirageOS-devel@lists.xenproject.org =
<mailto:MirageOS-devel@lists.xenproject.org>
> https://lists.xenproject.org/mailman/listinfo/mirageos-devel =
<https://lists.xenproject.org/mailman/listinfo/mirageos-devel>

--Apple-Mail=_3332E6E1-D160-40DE-8361-796F538F46F9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Looks=
 good to me. The difficulties are all =E2=80=98medium=E2=80=99 though. =
&nbsp;Perhaps break up the =E2=80=9Cnew execution targets=E2=80=9D into =
medium/hard for the various backends? For example, Xen/ARM is probably =
easier than bare metal ARM, and I imagine HyperV is quite complex due to =
the extra coordination code that is required.<div class=3D""><br =
class=3D""></div><div class=3D"">regards</div><div =
class=3D"">Anil</div><div class=3D""><div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D"">On 24 Jan 2018, at 09:40, Simon =
Kuenzer &lt;<a href=3D"mailto:simon.kuenzer@neclab.eu" =
class=3D"">simon.kuenzer@neclab.eu</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; =
display: inline !important;" class=3D"">Hi all,</span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><br=
 style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">since we are participating the first time to =
GSoC, we are happy to receive any feedback from you regarding our =
proposed Unikraft projects!</span><br style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><a =
href=3D"https://wiki.xenproject.org/wiki/Outreach_Program_Projects#Unikraf=
t" style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">https://wiki.xenproject.org/wiki/Outreach_Program_Projects#Unik=
raft</a><br style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><br style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; =
display: inline !important;" class=3D"">Thanks,</span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><br=
 style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">Simon</span><br style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">On 23.01.2018 10:16, Lars Kurth wrote:</span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D"">Hi all,<br class=3D"">just a =
quick note that I submitted the application for GSoC.<br class=3D"">The =
project list is not perfect and I removed a number of projects because I =
believe they were completed (or at least started by others). A Thank You =
to Mirage OS and Unikraft folks for adding new projects<br class=3D"">If =
we do get accepted, we will have to have another go at the project =
list<br class=3D"">Best Regards<br class=3D"">Lars<br =
class=3D""><blockquote type=3D"cite" class=3D"">On 8 Jan 2018, at 15:19, =
Lars Kurth &lt;<a href=3D"mailto:lars.kurth.xen@gmail.com" =
class=3D"">lars.kurth.xen@gmail.com</a>&gt; wrote:<br class=3D""><br =
class=3D"">Hi All,<br class=3D""><br class=3D"">it's this time of the =
year again to prepare for GSoC/Outreachy! The application deadline for =
orgs is January 23 - February 11: ideally we will have a good updated =
lists of projects by then as Google will look at the quality of the =
project list. I will also need co-org admins: @Mindy are you willing to =
do this again? Maybe also someone from the Unikraft project. That helps =
ensure that we have reps from various subproject that ensure that we =
don't miss deadlines.<br class=3D""><br class=3D""><br class=3D"">Best =
Regards<br class=3D"">Lars<br class=3D""><br class=3D"">Existing =
Projects (for people on the CC list)<br class=3D"">=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D<br class=3D"">If you are CC'ed you have one =
or several projects listed on <a =
href=3D"https://wiki.xenproject.org/wiki/Outreach_Program_Projects" =
class=3D"">https://wiki.xenproject.org/wiki/Outreach_Program_Projects</a> =
... What I need you to do is to<br class=3D""><br class=3D"">a) Weed out =
any projects that have been completed or are not relevant any more<br =
class=3D"">&nbsp;&nbsp;@Mindy: For MirageOS folks, please check and =
update <a =
href=3D"https://github.com/mirage/mirage-www/wiki/Pioneer-Projects" =
class=3D"">https://github.com/mirage/mirage-www/wiki/Pioneer-Projects</a> =
and do the same<br class=3D""><br class=3D"">b) Decide whether you still =
want to mentor:<br class=3D"">&nbsp;&nbsp;This requires some of your =
bandwidth from mid-Feb to March 2018 to work on small projects<br =
class=3D"">&nbsp;&nbsp;The actual work happens from May 14 - Aug 14<br =
class=3D""><br class=3D"">&nbsp;&nbsp;If not, please reply and list =
projects affected<br class=3D"">&nbsp;&nbsp;If yes, please also do so =
and I will update the Verified field accordingly<br class=3D""><br =
class=3D"">c) Add any new information to existing projects as =
relevant.<br class=3D""><br class=3D""><br class=3D"">New Projects<br =
class=3D"">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br class=3D"">Feel free =
to add new projects to the list, but if you do so please let the list =
know. We are not going to be very strict with <a =
href=3D"https://wiki.xenproject.org/wiki/Outreach_Program_Projects#Convent=
ions_for_Projects_and_Project_Mentors" =
class=3D"">https://wiki.xenproject.org/wiki/Outreach_Program_Projects#Conv=
entions_for_Projects_and_Project_Mentors</a>, but getting someone else =
to review your proposal is a good idea.<br class=3D""><br =
class=3D"">Unikraft<br class=3D"">--------<br class=3D"">I created a =
place-holder for Unikraft at <a =
href=3D"https://wiki.xenproject.org/wiki/Outreach_Program_Projects#Unikraf=
t" =
class=3D"">https://wiki.xenproject.org/wiki/Outreach_Program_Projects#Unik=
raft</a> as Unikraft project members indicated they want to =
participate.<br class=3D"">You probably do want to set expectations with =
regards to start-up tasks and come up with a set of tasks to act as a =
filter for applicants (e.g. showing that they set up the environment, =
etc.)<br class=3D""><br class=3D""><br class=3D"">Specific Improvements =
to the project documentation<br =
class=3D"">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D<br class=3D""><br class=3D"">Hypervisor start-up tasks<br =
class=3D"">-------------------------<br class=3D""><a =
href=3D"https://wiki.xenproject.org/wiki/Xen_Project_Development_Projects"=
 =
class=3D"">https://wiki.xenproject.org/wiki/Xen_Project_Development_Projec=
ts</a> contains: "An easy way to get started (and show that you can set =
up the Xen Development Environment, fix an issue, build and test Xen, =
submit a patch, etc.) is to address a suitable number of Coverity Scan =
issues. Ask on xen-devel@ for a set of suitable Coverity issues. Note =
that this does not require any access to the Coverity scan results. Open =
bugs to fix under the Small Code Contribution Requirement can also be =
found on <a href=3D"http://bugs.xenproject.org" =
class=3D"">bugs.xenproject.org</a>"<br class=3D""><br class=3D"">Do we =
want to change this? Finding small get started projects is always a =
little bit of a problem. Maybe we can prepare a better list =
somewhere.<br class=3D""><br class=3D"">In-tree vs. Wiki based =
projects<br class=3D"">-------------------------------<br class=3D"">We =
could also decide to move Hypervisor related ideas in-tree somewhere and =
generate a list if that makes things easier. But this is not necessary, =
in particular given with everything that is going on. I just wanted to =
raise this as an option: I am not particularly wedded to using the =
wiki.<br class=3D""><br =
class=3D""></blockquote>_______________________________________________<br=
 class=3D"">Minios-devel mailing list<br class=3D""><a =
href=3D"mailto:Minios-devel@lists.xenproject.org" =
class=3D"">Minios-devel@lists.xenproject.org</a><br class=3D""><a =
href=3D"https://lists.xenproject.org/mailman/listinfo/minios-devel" =
class=3D"">https://lists.xenproject.org/mailman/listinfo/minios-devel</a><=
br class=3D""></blockquote><br style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; =
display: inline !important;" =
class=3D"">_______________________________________________</span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">MirageOS-devel mailing list</span><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><a =
href=3D"mailto:MirageOS-devel@lists.xenproject.org" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" =
class=3D"">MirageOS-devel@lists.xenproject.org</a><br =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><a =
href=3D"https://lists.xenproject.org/mailman/listinfo/mirageos-devel" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">https://lists.xenproject.org/mailman/listinfo/mirageos-devel</a=
></div></blockquote></div><br class=3D""></div></body></html>=

--Apple-Mail=_3332E6E1-D160-40DE-8361-796F538F46F9--


--===============3094239226993383057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3094239226993383057==--
