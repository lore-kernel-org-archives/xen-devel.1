From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: [RFC PATCH] Make Security Policy Doc ready to
 become a CNA
Date: Wed, 21 Mar 2018 09:17:29 +0100
Message-ID: <92CFADDD-DE84-4A83-BCD3-BA11662D4F4D@xenproject.org>
References: <F465E328-FB40-4F0C-A3CE-391A44CF6C0E@citrix.com>
 <e180a4e3-9d4a-fc4c-e1af-c24546a60042@citrix.com>
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Content-Type: multipart/mixed; boundary="===============7507918400556391213=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=/6yh=gl=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1eyYwB-0000FU-Ah
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 08:17:35 +0000
Received: by mail-wm0-x22c.google.com with SMTP id h76so8009613wme.4
 for <xen-devel@lists.xenproject.org>; Wed, 21 Mar 2018 01:17:33 -0700 (PDT)
In-Reply-To: <e180a4e3-9d4a-fc4c-e1af-c24546a60042@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, "committers@xenproject.org" <committers@xenproject.org>, "security@xenproject.org" <security@xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============7507918400556391213==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_0500AEB4-E977-47D9-8234-A797A70DA30A"


--Apple-Mail=_0500AEB4-E977-47D9-8234-A797A70DA30A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 20 Mar 2018, at 17:38, George Dunlap <george.dunlap@citrix.com> =
wrote:
>=20
> On 03/19/2018 04:37 PM, Lars Kurth wrote:
>> And this time with patch: note to myself - never try sendmail with =
--compose again (-;
>>=20
>> This patch contains a proposal to change =
https://xenproject.org/security-policy.html=20
>> such that it points to SUPPORT.md. Having scope and process =
information is necessary
>> to become a CNA. This is the last piece, before formally asking to =
become a CNA.
>>=20
>> To make the review of this easier, I based it on =
xenbits:/larsk/governance.git
>> (contains the pandoc as published today and the html)
>>=20
>> Regards
>> Lars
>> ---
>> [PATCH] Make Security Policy Doc ready to become a CNA
>>=20
>> To become a CNA, we need to more clearly specifiy the scope of
>> security support. This change updates the document and points
>> to SUPPORT.md and pages generated from SUPPORT.md
>>=20
>> Expected changes:
>> - Resend once the URL that is currently open has been agreed
>>  with Ian Jackson
>>=20
>> Signed-off-by: Lars Kurth <lars.kurth@citrix.com>
>> ---
>> security-policy.pandoc | 10 +++++++++-
>> 1 file changed, 9 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/security-policy.pandoc b/security-policy.pandoc
>> index 5783183..22e274b 100644
>> --- a/security-policy.pandoc
>> +++ b/security-policy.pandoc
>> @@ -19,6 +19,14 @@ Scope of this process
>>=20
>> This process primarily covers the [Xen Hypervisor
>> =
Project](index.php?option=3Dcom_content&view=3Darticle&id=3D82:xen-hypervi=
sor&catid=3D80:developers&Itemid=3D484).
>> +Specific information about features with security support can be =
found in
>> +
>> +1.  =
[SUPPORT.md](http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3DSUPPO=
RT.md)
>> +    in the releases' tar ball and its xen.git tree and on
>> +    [web pages generated from the SUPPORT.md file](add URL)
>=20
> Not sure we should include the direct (ugly) link.  Other than that
> looks OK to me.

No strong opinion either way. There is no real harm in having it and =
it's just a link on the final document
Lars=

--Apple-Mail=_0500AEB4-E977-47D9-8234-A797A70DA30A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 20 Mar 2018, at 17:38, George Dunlap &lt;<a =
href=3D"mailto:george.dunlap@citrix.com" =
class=3D"">george.dunlap@citrix.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">On 03/19/2018 04:37 =
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
-webkit-text-stroke-width: 0px;" class=3D"">And this time with patch: =
note to myself - never try sendmail with --compose again (-;<br =
class=3D""><br class=3D"">This patch contains a proposal to change <a =
href=3D"https://xenproject.org/security-policy.html" =
class=3D"">https://xenproject.org/security-policy.html</a><span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">such&nbsp;that=
 it points to SUPPORT.md. Having scope and process information is =
necessary<br class=3D"">to become a CNA. This is the last piece, before =
formally asking to become a CNA.<br class=3D""><br class=3D"">To make =
the review of this easier, I based it on =
xenbits:/larsk/governance.git<br class=3D"">(contains the pandoc as =
published today and the html)<br class=3D""><br class=3D"">Regards<br =
class=3D"">Lars<br class=3D"">---<br class=3D"">[PATCH] Make Security =
Policy Doc ready to become a CNA<br class=3D""><br class=3D"">To become =
a CNA, we need to more clearly specifiy the scope of<br =
class=3D"">security support. This change updates the document and =
points<br class=3D"">to SUPPORT.md and pages generated from =
SUPPORT.md<br class=3D""><br class=3D"">Expected changes:<br class=3D"">- =
Resend once the URL that is currently open has been agreed<br =
class=3D"">&nbsp;with Ian Jackson<br class=3D""><br =
class=3D"">Signed-off-by: Lars Kurth &lt;<a =
href=3D"mailto:lars.kurth@citrix.com" =
class=3D"">lars.kurth@citrix.com</a>&gt;<br class=3D"">---<br =
class=3D"">security-policy.pandoc | 10 +++++++++-<br class=3D"">1 file =
changed, 9 insertions(+), 1 deletion(-)<br class=3D""><br class=3D"">diff =
--git a/security-policy.pandoc b/security-policy.pandoc<br =
class=3D"">index 5783183..22e274b 100644<br class=3D"">--- =
a/security-policy.pandoc<br class=3D"">+++ b/security-policy.pandoc<br =
class=3D"">@@ -19,6 +19,14 @@ Scope of this process<br class=3D""><br =
class=3D"">This process primarily covers the [Xen Hypervisor<br =
class=3D"">Project](index.php?option=3Dcom_content&amp;view=3Darticle&amp;=
id=3D82:xen-hypervisor&amp;catid=3D80:developers&amp;Itemid=3D484).<br =
class=3D"">+Specific information about features with security support =
can be found in<br class=3D"">+<br class=3D"">+1. &nbsp;[SUPPORT.md](<a =
href=3D"http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3DSUPPORT.md=
" =
class=3D"">http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3DSUPPORT=
.md</a>)<br class=3D"">+ &nbsp;&nbsp;&nbsp;in the releases' tar ball and =
its xen.git tree and on<br class=3D"">+ &nbsp;&nbsp;&nbsp;[web pages =
generated from the SUPPORT.md file](add URL)<br =
class=3D""></blockquote><br style=3D"font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">Not sure we should =
include the direct (ugly) link. &nbsp;Other than that</span><br =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">looks OK to me.</span><br style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""></div></blockquote></div><br class=3D""><div class=3D"">No =
strong opinion either way. There is no real harm in having it and it's =
just a link on the final document</div><div =
class=3D"">Lars</div></body></html>=

--Apple-Mail=_0500AEB4-E977-47D9-8234-A797A70DA30A--


--===============7507918400556391213==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7507918400556391213==--
