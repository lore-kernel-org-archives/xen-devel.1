From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: [Minios-devel] automation: Creating a patchwork
 instance to improve pre-commit build testing
Date: Tue, 24 Jul 2018 10:38:24 +0100
Message-ID: <07A3F9EF-AF5C-4E46-BBA0-31A77C90D3F9@xenproject.org>
References: <DD622B30-B54C-4B9A-AA24-05329BD800B9@citrix.com>
 <5B56EC0002000078001D708C@prv1-mh.provo.novell.com>
 <20180724092430.puacbfkbimdm5anz@citrix.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: multipart/mixed; boundary="===============5866089904277912248=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=c4h+=ki=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1fhtm2-0002SJ-KA
 for xen-devel@lists.xenproject.org; Tue, 24 Jul 2018 09:38:30 +0000
In-Reply-To: <20180724092430.puacbfkbimdm5anz@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
Cc: Lars Kurth <lars.kurth@citrix.com>, Iurii Artemenko <Iurii_Artemenko@epam.com>, Minios-devel <minios-devel@lists.xenproject.org>, Committers <committers@xenproject.org>, 'Jan Beulich' <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Matt Spencer <Matt.Spencer@arm.com>
List-Id: xen-devel@lists.xenproject.org


--===============5866089904277912248==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_6277AF9D-944F-49D4-9EE2-1C2FF0410E00"


--Apple-Mail=_6277AF9D-944F-49D4-9EE2-1C2FF0410E00
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 24 Jul 2018, at 10:24, Wei Liu <wei.liu2@citrix.com> wrote:
>=20
> On Tue, Jul 24, 2018 at 03:06:08AM -0600, Jan Beulich wrote:
>>>>> On 23.07.18 at 18:40, <lars.kurth@citrix.com> wrote:
>>> # How does this impact me?
>>> The contribution workflow is *not* impacted by this change, but once =
up and=20
>>> running the following will happen once you post a patch or patch =
series to=20
>>> xen-devel:
>>> * Patchwork will take patch series from the mailing list and applies =
it
>>> * CI/DC testing is triggered
>>> * A test report will be sent as a mail to the patch or the series =
(aka the 00 patch of the series)
>>>=20
>>> This does mean though that series which do not build or show other =
issues,=20
>>> will likely not be reviewed until the tests pass. This would lessen =
the=20
>>> burden on reviewers, as they will know whether the code submitted =
builds on a=20
>>> wide array of environments.=20
>>=20
>> So how are dependencies between series intended to be dealt with? It
>> is not uncommon for someone to say "applies only on top of xyz". The
>> implication of "will likely not be reviewed until the tests pass" =
seems
>> unsuitable to me in such a case.
>>=20
>=20
> We have been asking everyone to rebase to staging before posting a new
> version for a long time.  It is natural for the bot to assume that
> everything should apply on top of staging. That would provide most =
value
> to the community.
>=20
> For special cases like you just mention, we should aim to provide
> mechanisms to manually appoint a branch to be tested.

Wei, Doug: I have another question, which is mainly for my own =
understanding.=20

Right now we allow posting of patches to Linux, Qemu, xen.git, OSSTEST, =
... to xen-devel. The planned CI infrastructure only applies to xen.git. =
Have you thought about how to handle such cases?=20

We probably don't want to spam Linux and Qemu lists with results from a =
test bot.=20
And we want to minimise false positives. Some patches may be =
identifiable through subject lines (e.g. OSSTEST in subject lines)

Lars



--Apple-Mail=_6277AF9D-944F-49D4-9EE2-1C2FF0410E00
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 24 Jul 2018, at 10:24, Wei Liu &lt;<a =
href=3D"mailto:wei.liu2@citrix.com" class=3D"">wei.liu2@citrix.com</a>&gt;=
 wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><span=
 style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">On Tue, Jul =
24, 2018 at 03:06:08AM -0600, Jan Beulich wrote:</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" class=3D""><blockquote type=3D"cite" =
class=3D""><blockquote type=3D"cite" class=3D"">On 23.07.18 at 18:40, =
&lt;<a href=3D"mailto:lars.kurth@citrix.com" =
class=3D"">lars.kurth@citrix.com</a>&gt; wrote:<br =
class=3D""></blockquote></blockquote># How does this impact me?<br =
class=3D"">The contribution workflow is *not* impacted by this change, =
but once up and<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">running the following will happen once you post a patch or =
patch series to<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">xen-devel:<br class=3D"">* Patchwork will take patch series =
from the mailing list and applies it<br class=3D"">* CI/DC testing is =
triggered<br class=3D"">* A test report will be sent as a mail to the =
patch or the series (aka the 00 patch of the series)<br class=3D""><br =
class=3D"">This does mean though that series which do not build or show =
other issues,<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">will likely not be reviewed until the tests pass. This would =
lessen the<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D"">burden on reviewers, as they will know whether the code =
submitted builds on a<span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D"">wide array =
of environments.<span class=3D"Apple-converted-space">&nbsp;</span><br =
class=3D""></blockquote><br class=3D"">So how are dependencies between =
series intended to be dealt with? It<br class=3D"">is not uncommon for =
someone to say "applies only on top of xyz". The<br class=3D"">implication=
 of "will likely not be reviewed until the tests pass" seems<br =
class=3D"">unsuitable to me in such a case.<br class=3D""><br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">We have been asking everyone to rebase to staging before =
posting a new</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">version for a =
long time. &nbsp;It is natural for the bot to assume that</span><br =
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
none; float: none; display: inline !important;" class=3D"">everything =
should apply on top of staging. That would provide most value</span><br =
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
none; float: none; display: inline !important;" class=3D"">to the =
community.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
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
none; float: none; display: inline !important;" class=3D"">For special =
cases like you just mention, we should aim to provide</span><br =
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
none; float: none; display: inline !important;" class=3D"">mechanisms to =
manually appoint a branch to be tested.</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""></div></blockquote><br =
class=3D""></div><div>Wei, Doug: I have another question, which is =
mainly for my own understanding.&nbsp;</div><div><br =
class=3D""></div><div>Right now we allow posting of patches to Linux, =
Qemu, xen.git, OSSTEST, ... to xen-devel. The planned CI infrastructure =
only applies to xen.git. Have you thought about how to handle such =
cases?&nbsp;</div><div><br class=3D""></div><div>We probably don't want =
to spam Linux and Qemu lists with results from a test =
bot.&nbsp;</div><div>And we want to minimise false positives. Some =
patches may be identifiable through subject lines (e.g. OSSTEST in =
subject lines)</div><div><br class=3D""></div><div>Lars</div><div><br =
class=3D""></div><br class=3D""></body></html>=

--Apple-Mail=_6277AF9D-944F-49D4-9EE2-1C2FF0410E00--


--===============5866089904277912248==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5866089904277912248==--
