From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: Xen 4.12 release planning
Date: Fri, 27 Jul 2018 11:32:09 +0100
Message-ID: <1509DACB-8574-4255-BE57-4C8C47C46C3F@xenproject.org>
References: <6a766b09-d5fe-a9ce-cacf-546c998ab803@suse.com>
 <alpine.DEB.2.10.1807261510301.20701@sstabellini-ThinkPad-X260>
 <f78a2c5a-6f78-d11d-0f13-6240d47c6642@suse.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: multipart/mixed; boundary="===============1168401095146227040=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tp6w=kl=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1fj02g-0005KN-EN
 for xen-devel@lists.xenproject.org; Fri, 27 Jul 2018 10:32:14 +0000
Received: by mail-wr1-x431.google.com with SMTP id t13-v6so4547296wrv.12
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jul 2018 03:32:12 -0700 (PDT)
In-Reply-To: <f78a2c5a-6f78-d11d-0f13-6240d47c6642@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org


--===============1168401095146227040==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_55B2AC7B-3F2D-454B-8D6F-65EABD561214"


--Apple-Mail=_55B2AC7B-3F2D-454B-8D6F-65EABD561214
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 27 Jul 2018, at 08:51, Juergen Gross <jgross@suse.com> wrote:
>=20
> On 27/07/18 00:13, Stefano Stabellini wrote:
>> On Wed, 25 Jul 2018, Juergen Gross wrote:
>>> Its time to plan the Xen 4.12 release dates.
>>>=20
>>> There have been concerns with the schedule of 6 months between =
releases,
>>> as this scheme is leading to too many supported versions of Xen at a
>>> time. The needed resources to backport bug fixes and security fixes =
as
>>> well as doing the tests for all those releases are a limiting factor =
to
>>> push out the current main release as well as point releases on time.
>>>=20
>>> After some discussions at the Xen developer summit, on xen-devel and
>>> between the committers a slightly longer release cycle of 8 or 9 =
months
>>> was suggested.
>>>=20
>>> With 18 months of full support and 36 months of security support the
>>> number of concurrent supported releases will be the same with either =
8
>>> or 9 months release cycles, so I have chosen an 8 month cycle for =
now.
>>> Having only 3 possible times in the year for a release will make it
>>> easier to avoid major holiday seasons.
>>>=20
>>> In case there is no objection I'm planning Xen 4.12 with:
>>>=20
>>> * Last posting date: December 14th, 2018
>>> * Hard code freeze: January 11th, 2019
>>> * Release: March 7th, 2019
>>>=20
>>> Release of Xen 4.13 would then be early November 2019, 4.14 at early
>>> July 2020.
>>=20
>> Given the holdidays season (it is not just Julien going on vacation =
but
>> pretty much everybody), wouldn't it be better to move the hard code
>> freeze by a couple of weeks? For instance Jan 25th? We can still keep
>> the release date as Mar 7th, there should be still enough time?
>=20
> I don't think planning with a 6 week freeze period is a good idea. The
> last releases took longer than 2 months.
>=20
> We could slip the complete release by 2 weeks, of course. In this case
> I'd move the last posting date to January. So something like:
>=20
> * Last posting date: January 11th, 2019
> * Hard code freeze: January 25th, 2019
> * Release: March 21st, 2019

Another alternative would be to move the dates backwards rather than =
forward. The 4.12 development window effectively opened 21-06-18, so a =
last posting data and hard code freeze before Xmas should be OK. Then =
assume that there won't be RC's for at last 2 (maybe 3) weeks during the =
winter holidays. But as long as someone is there to keep an eye on =
OSSTEST and to do a force push and build an RC1 before Xmas that may be =
OK: but it would probably still be OK if RC1 slipped until just after =
New Years Eve.

> Risks for that schedule are:
> - last posting date short after holiday season - is that really a
>  problem?
> - Chinese new year rather soon after start of freeze period
> - planned release date rather close to eastern
>=20
> Opinions?

With this in mind. The only problem is that there will be Chinese New =
Year for some of the late to middle RCs ... Looking at possible RC dates
RC1: wk Jan 1st=20
RC2: wk Jan 8th
RC3: wk Jan 15th
RC4: wk Jan 22nd
RC5: wk Jan 29th
RC6: wk Feb 5th (Chinese New Year)
RC7: wk Feb 12th
RC8: wk Feb 19th

Lars

=20=

--Apple-Mail=_55B2AC7B-3F2D-454B-8D6F-65EABD561214
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 27 Jul 2018, at 08:51, Juergen Gross &lt;<a =
href=3D"mailto:jgross@suse.com" class=3D"">jgross@suse.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">On 27/07/18 =
00:13, Stefano Stabellini wrote:</span><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">On Wed, 25 Jul 2018, Juergen Gross =
wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">Its time to =
plan the Xen 4.12 release dates.<br class=3D""><br class=3D"">There have =
been concerns with the schedule of 6 months between releases,<br =
class=3D"">as this scheme is leading to too many supported versions of =
Xen at a<br class=3D"">time. The needed resources to backport bug fixes =
and security fixes as<br class=3D"">well as doing the tests for all =
those releases are a limiting factor to<br class=3D"">push out the =
current main release as well as point releases on time.<br class=3D""><br =
class=3D"">After some discussions at the Xen developer summit, on =
xen-devel and<br class=3D"">between the committers a slightly longer =
release cycle of 8 or 9 months<br class=3D"">was suggested.<br =
class=3D""><br class=3D"">With 18 months of full support and 36 months =
of security support the<br class=3D"">number of concurrent supported =
releases will be the same with either 8<br class=3D"">or 9 months =
release cycles, so I have chosen an 8 month cycle for now.<br =
class=3D"">Having only 3 possible times in the year for a release will =
make it<br class=3D"">easier to avoid major holiday seasons.<br =
class=3D""><br class=3D"">In case there is no objection I'm planning Xen =
4.12 with:<br class=3D""><br class=3D"">* Last posting date: December =
14th, 2018<br class=3D"">* Hard code freeze: January 11th, 2019<br =
class=3D"">* Release: March 7th, 2019<br class=3D""><br class=3D"">Release=
 of Xen 4.13 would then be early November 2019, 4.14 at early<br =
class=3D"">July 2020.<br class=3D""></blockquote><br class=3D"">Given =
the holdidays season (it is not just Julien going on vacation but<br =
class=3D"">pretty much everybody), wouldn't it be better to move the =
hard code<br class=3D"">freeze by a couple of weeks? For instance Jan =
25th? We can still keep<br class=3D"">the release date as Mar 7th, there =
should be still enough time?<br class=3D""></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">I don't think =
planning with a 6 week freeze period is a good idea. The</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">last releases =
took longer than 2 months.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">We could slip the complete release by 2 weeks, of course. In =
this case</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">I'd move the =
last posting date to January. So something like:</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">* Last =
posting date: January 11th, 2019</span><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">* Hard code freeze: January 25th, 2019</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">* Release: =
March 21st, 2019</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><div><br =
class=3D""></div>Another alternative would be to move the dates =
backwards rather than forward. The 4.12 development window effectively =
opened 21-06-18, so a last posting data and hard code freeze before Xmas =
should be OK. Then assume that there won't be RC's for at last 2 (maybe =
3) weeks during the winter holidays. But as long as someone is there to =
keep an eye on OSSTEST and to do a force push and build an RC1 before =
Xmas that may be OK: but it would probably still be OK if RC1 slipped =
until just after New Years Eve.</div><div><br =
class=3D""></div><div><blockquote type=3D"cite" class=3D""><span =
class=3D"" style=3D"font-family: Menlo-Regular; font-size: 11px; float: =
none; display: inline !important;">Risks for that schedule =
are:</span><br class=3D"" style=3D"font-family: Menlo-Regular; =
font-size: 11px;"><span class=3D"" style=3D"font-family: Menlo-Regular; =
font-size: 11px; float: none; display: inline !important;">- last =
posting date short after holiday season - is that really a</span><br =
class=3D"" style=3D"font-family: Menlo-Regular; font-size: 11px;"><span =
class=3D"" style=3D"font-family: Menlo-Regular; font-size: 11px; float: =
none; display: inline !important;">&nbsp;problem?</span><br class=3D"" =
style=3D"font-family: Menlo-Regular; font-size: 11px;"><span class=3D"" =
style=3D"font-family: Menlo-Regular; font-size: 11px; float: none; =
display: inline !important;">- Chinese new year rather soon after start =
of freeze period</span><br class=3D"" style=3D"font-family: =
Menlo-Regular; font-size: 11px;"><span class=3D"" style=3D"font-family: =
Menlo-Regular; font-size: 11px; float: none; display: inline =
!important;">- planned release date rather close to eastern</span><br =
class=3D"" style=3D"font-family: Menlo-Regular; font-size: 11px;"><br =
class=3D"" style=3D"font-family: Menlo-Regular; font-size: 11px;"><span =
class=3D"" style=3D"font-family: Menlo-Regular; font-size: 11px; float: =
none; display: inline !important;">Opinions?</span><br class=3D"" =
style=3D"font-family: Menlo-Regular; font-size: 11px;"></blockquote><br =
class=3D""></div><div>With this in mind. The only problem is that there =
will be Chinese New Year for some of the late to middle RCs ... Looking =
at possible RC dates</div><div>RC1: wk Jan 1st&nbsp;</div><div>RC2: wk =
Jan 8th</div><div>RC3: wk Jan 15th</div><div>RC4: wk Jan =
22nd</div><div>RC5: wk Jan 29th</div><div>RC6: wk Feb 5th (Chinese New =
Year)</div><div>RC7: wk Feb 12th</div><div><div>RC8: wk Feb =
19th</div><div><br class=3D""></div><div>Lars</div><div class=3D""><br =
class=3D""></div></div><div>&nbsp;</div></body></html>=

--Apple-Mail=_55B2AC7B-3F2D-454B-8D6F-65EABD561214--


--===============1168401095146227040==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1168401095146227040==--
