From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: Xen Project Spectre/Meltdown FAQ
Date: Fri, 5 Jan 2018 17:34:29 +0000
Message-ID: <DB497EF9-BEC0-4BA5-BF62-AAE396DD4F11@gmail.com>
References: <B3F5B430-F55E-446C-A7C5-7830F2CEDFCD@gmail.com>
 <903ef3c9-f5c6-a7e8-f9c0-3961d627413a@knorrie.org>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Type: multipart/mixed; boundary="===============1903392864266931844=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wlwn=ea=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1eXVt4-0002G9-EX
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2018 17:34:34 +0000
In-Reply-To: <903ef3c9-f5c6-a7e8-f9c0-3961d627413a@knorrie.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Hans van Kranenburg <hans@knorrie.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, George Dunlap <george.dunlap@citrix.com>, xen-users@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============1903392864266931844==
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_616619D5-E831-4A6B-BAED-A169E234DF1D"


--Apple-Mail=_616619D5-E831-4A6B-BAED-A169E234DF1D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On 5 Jan 2018, at 15:55, Hans van Kranenburg <hans@knorrie.org> wrote:
>=20
> On 01/05/2018 12:35 PM, Lars Kurth wrote:
>> Hi all, this is a repost of
>> =
https://blog.xenproject.org/2018/01/04/xen-project-spectremeltdown-faq/ =
<https://blog.xenproject.org/2018/01/04/xen-project-spectremeltdown-faq/>
>> for xen-users/xen-devel. If you have questions, please reply to this
>> thread and we will try and improve the FAQ based on questions.=20
>> Regards Lars
>=20
> Thanks for the writeup.
>=20
> The main reason for the reader to get confused is the amount of
> different combinations of situations that are possible, which all =
again
> have their own set of vulnerabilities and also their own (maybe even
> different) set of possibilities to be used as environment for =
executing
> an attack.
>=20
> So let's help them by being more explicit.

That sounds reasonable

>> On Intel processors, only 64-bit PV mode guests can attack Xen.
>=20
> "On Intel processors an attack at Xen using SP3 can only be done by
> 64-bit PV mode guests."
>=20
> Even if it looks super-redundant, I think keeping explicit information
> in every sentence is preferable, so they cannot be misinterpreted or
> accidentally be taken out of context.

Alright: I think I prefer "On Intel processors, only 64-bit PV mode =
guests can attack Xen using SP3."

>=20
>> Guests running in 32-bit PV mode, HVM mode, and PVH
>> mode cannot attack the hypervisor using SP3. However, in 32-bit PV
>> mode, HVM mode, and PVH mode, guest userspaces can attack guest
>> kernels using SP3; so updating guest kernels is advisable.
>=20
>> Interestingly, guest kernels running in 64-bit PV mode are not
>> vulnerable to attack using SP3, because 64-bit PV guests already run
>> in a KPTI-like mode.
>=20
> Like Juergen already mentioned, additionally: "However, keep in mind
> that a succesful attack on the hypervisor can still be used to recover
> information about the same guest from physical memory."

Good suggestion.

>>=20
>> =3D Does Xen have any equivalent to Linux=E2=80=99s KPTI series? =3D
>>=20
>> Linux=E2=80=99s KPTI series is designed to address SP3 only.
>=20
> This one...
>=20
>> For Xen guests, only 64-bit PV guests are affected by SP3.
>=20
> ...should be more explicit. The words "affected" and "impacted" do not
> tell the reader if it's about being an attacker, or about being the
> victim and what is attacked or attacking.
>=20
> "For Xen guests, only 64-bit PV guests are able to execute a SP3 =
attack
> against the hypervisor."

Sounds fine

I will update the blog post sometimes tomorrow or Monday. There were a =
few further comments, which may be worth rolling into a change

Lars


--Apple-Mail=_616619D5-E831-4A6B-BAED-A169E234DF1D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 5 Jan 2018, at 15:55, Hans van Kranenburg &lt;<a =
href=3D"mailto:hans@knorrie.org" class=3D"">hans@knorrie.org</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">On 01/05/2018 12:35 =
PM, Lars Kurth wrote:</span><br style=3D"font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><blockquote=
 type=3D"cite" style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D"">Hi all, this is a repost =
of<br class=3D""><a =
href=3D"https://blog.xenproject.org/2018/01/04/xen-project-spectremeltdown=
-faq/" =
class=3D"">https://blog.xenproject.org/2018/01/04/xen-project-spectremeltd=
own-faq/</a><br class=3D"">for xen-users/xen-devel. If you have =
questions, please reply to this<br class=3D"">thread and we will try and =
improve the FAQ based on questions.<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">Regards =
Lars<br class=3D""></blockquote><br style=3D"font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">Thanks for the =
writeup.</span><br style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><br style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">The main reason for =
the reader to get confused is the amount of</span><br =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">different combinations of situations that are =
possible, which all again</span><br style=3D"font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">have their own set =
of vulnerabilities and also their own (maybe even</span><br =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">different) set of possibilities to be used as =
environment for executing</span><br style=3D"font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">an =
attack.</span><br style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><br style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">So let's help them =
by being more explicit.</span><br class=3D""></div></blockquote><div><br =
class=3D""></div>That sounds reasonable</div><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D"">On Intel processors, only =
64-bit PV mode guests can attack Xen.<br class=3D""></blockquote><br =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">"On Intel processors an attack at Xen using SP3 =
can only be done by</span><br style=3D"font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">64-bit PV mode =
guests."</span></div></blockquote><blockquote type=3D"cite" =
class=3D""><div class=3D""><br style=3D"font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">Even if it looks =
super-redundant, I think keeping explicit information</span><br =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">in every sentence is preferable, so they cannot =
be misinterpreted or</span><br style=3D"font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">accidentally be =
taken out of context.</span><br style=3D"font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""></div></blockquote><div><br class=3D""></div>Alright: I think =
I prefer "On Intel processors, only 64-bit PV mode guests can attack Xen =
using SP3."</div><div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><br style=3D"font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><blockquote=
 type=3D"cite" style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D"">Guests running in 32-bit PV =
mode, HVM mode, and PVH<br class=3D"">mode cannot attack the hypervisor =
using SP3. However, in 32-bit PV<br class=3D"">mode, HVM mode, and PVH =
mode, guest userspaces can attack guest<br class=3D"">kernels using SP3; =
so updating guest kernels is advisable.<br class=3D""></blockquote><br =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D"">Interestingly, guest kernels =
running in 64-bit PV mode are not<br class=3D"">vulnerable to attack =
using SP3, because 64-bit PV guests already run<br class=3D"">in a =
KPTI-like mode.<br class=3D""></blockquote><br style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">Like Juergen =
already mentioned, additionally: "However, keep in mind</span><br =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">that a succesful attack on the hypervisor can =
still be used to recover</span><br style=3D"font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">information about =
the same guest from physical memory."</span><br style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""></div></blockquote><div><br class=3D""></div>Good =
suggestion.</div><div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><blockquote type=3D"cite" style=3D"font-family:=
 Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D""><br class=3D"">=3D Does Xen =
have any equivalent to Linux=E2=80=99s KPTI series? =3D<br class=3D""><br =
class=3D"">Linux=E2=80=99s KPTI series is designed to address SP3 =
only.<br class=3D""></blockquote><br style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">This =
one...</span><br style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><br style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><blockquote=
 type=3D"cite" style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D"">For Xen guests, only 64-bit =
PV guests are affected by SP3.<br class=3D""></blockquote><br =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">...should be more explicit. The words "affected" =
and "impacted" do not</span><br style=3D"font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">tell the reader if =
it's about being an attacker, or about being the</span><br =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">victim and what is attacked or =
attacking.</span><br style=3D"font-family: Menlo-Regular; font-size: =
11px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><br style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">"For Xen guests, =
only 64-bit PV guests are able to execute a SP3 attack</span><br =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">against the hypervisor."</span><br =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""></div></blockquote><div><br class=3D""></div>Sounds =
fine</div><div><br class=3D""></div><div>I will update the blog post =
sometimes tomorrow or Monday. There were a few further comments, which =
may be worth rolling into a change</div><div><br =
class=3D""></div><div>Lars</div><div><br class=3D""></div></body></html>=

--Apple-Mail=_616619D5-E831-4A6B-BAED-A169E234DF1D--


--===============1903392864266931844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1903392864266931844==--
