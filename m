From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: X86 Community Call: Wed March 14,
 15:00 - 16:00 UTC - Meeting Minutes
Date: Thu, 12 Apr 2018 09:22:58 +0100
Message-ID: <92DCBECD-1C7A-46F6-9DF9-73EB3AAF3370@xenproject.org>
References: <F3DB153A-A358-4DFE-A054-D436270FC8B9@citrix.com>
 <20180412011831.GA177943@skl-4s-chao.sh.intel.com>
 <46762923-FAE4-428D-9AD7-D8551D676085@citrix.com>
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.18\))
Content-Type: multipart/mixed; boundary="===============0813339584615928046=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zrxr=hb=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1f6XVX-00038t-Vd
 for xen-devel@lists.xenproject.org; Thu, 12 Apr 2018 08:23:04 +0000
Received: by mail-wm0-x234.google.com with SMTP id l16so4351096wmh.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Apr 2018 01:23:01 -0700 (PDT)
In-Reply-To: <46762923-FAE4-428D-9AD7-D8551D676085@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, "Peng,
 Chao P" <chao.p.peng@intel.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <dunlapg@umich.edu>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <royger@freebsd.org>, Christopher Clark <christopher.w.clark@gmail.com>, "Ji,
 John" <john.ji@intel.com>, Rich Persaud <persaur@gmail.com>, Tamas K Lengyel <tamas@tklengyel.com>, "committers@xenproject.org" <committers@xenproject.org>, 'Jan Beulich' <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Janakarajan Natarajan <jnataraj@amd.com>, Brian Woods <brian.woods@amd.com>, Daniel Kiper <daniel.kiper@oracle.com>, Paul Durrant <Paul.Durrant@citrix.com>, Chao Gao <chao.gao@intel.com>
List-Id: xen-devel@lists.xenproject.org


--===============0813339584615928046==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_CB97AF09-A379-4FE8-B12F-A19C4E9BDE24"


--Apple-Mail=_CB97AF09-A379-4FE8-B12F-A19C4E9BDE24
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 12 Apr 2018, at 08:32, George Dunlap <george.dunlap@citrix.com> =
wrote:
>=20
>=20
>=20
>> On Apr 12, 2018, at 2:18 AM, Chao Gao <chao.gao@intel.com> wrote:
>>=20
>> On Wed, Apr 11, 2018 at 05:10:40PM +0000, Lars Kurth wrote:
>>> ## Longer Term - Agreed to Pause
>>>=20
>>> ### [PATCH v4 00/28] add vIOMMU support with irq remapping function =
of
>>> ### virtual VT-d
>>>=20
>>> Sent in for meeting agenda by George
>>> v3 posted by Lan Tianyu on 22 September 2017: =
=E2=80=8Bmarc.info/?l=3Dxen-devel&m=3D
>>> v4 posted by Chao Gao: =
=E2=80=8Bhttps://xen.markmail.org/thread/wfyorbn3nzsio6s
>>> **Seems to have had review by Roger Pau Monne (1 ACK)
>>> No issues**
>>> Primarily needs George as reviewer
>>> Agreed to park this, because NVDIMM work is more important
>>=20
>> I want to clarify that I will continue to working on this, i.e. send =
out
>> patches and respond to comments. "Pause" here only means review will =
be
>> paused because George and Roger who are willing to review this series
>> have to finish NVDIMM work first.
>=20
> Er, I think this comment was misplaced =E2=80=94 it was the SPP series =
that I need to be the primary reviewer on.  I wasn=E2=80=99t aware that =
the vIOMMU series had anything specific to do with the mm code.

I may have recorded this incorrectly in that Royger would be the primary =
reviewer. I can't recall. In any case, the effect is the same, as Royger =
is also on the critical path for NVDIMM

@John, @Chao: I agree with your clarification: that is what I meant. I =
recorded it inaccurately.

As an aside, I will take the replies to this thread and copy it into the =
google doc (but I won't send out PDFs for it)

Regards
Lars=

--Apple-Mail=_CB97AF09-A379-4FE8-B12F-A19C4E9BDE24
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 12 Apr 2018, at 08:32, George Dunlap &lt;<a =
href=3D"mailto:george.dunlap@citrix.com" =
class=3D"">george.dunlap@citrix.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><br =
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
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">On =
Apr 12, 2018, at 2:18 AM, Chao Gao &lt;<a =
href=3D"mailto:chao.gao@intel.com" class=3D"">chao.gao@intel.com</a>&gt; =
wrote:<br class=3D""><br class=3D"">On Wed, Apr 11, 2018 at 05:10:40PM =
+0000, Lars Kurth wrote:<br class=3D""><blockquote type=3D"cite" =
class=3D"">## Longer Term - Agreed to Pause<br class=3D""><br =
class=3D"">### [PATCH v4 00/28] add vIOMMU support with irq remapping =
function of<br class=3D"">### virtual VT-d<br class=3D""><br =
class=3D"">Sent in for meeting agenda by George<br class=3D"">v3 posted =
by Lan Tianyu on 22 September 2017: =E2=80=8B<a =
href=3D"http://marc.info/?l=3Dxen-devel&amp;m=3D" =
class=3D"">marc.info/?l=3Dxen-devel&amp;m=3D</a><br class=3D"">v4 posted =
by Chao Gao: =E2=80=8B<a =
href=3D"https://xen.markmail.org/thread/wfyorbn3nzsio6s" =
class=3D"">https://xen.markmail.org/thread/wfyorbn3nzsio6s</a><br =
class=3D"">**Seems to have had review by Roger Pau Monne (1 ACK)<br =
class=3D"">No issues**<br class=3D"">Primarily needs George as =
reviewer<br class=3D"">Agreed to park this, because NVDIMM work is more =
important<br class=3D""></blockquote><br class=3D"">I want to clarify =
that I will continue to working on this, i.e. send out<br =
class=3D"">patches and respond to comments. "Pause" here only means =
review will be<br class=3D"">paused because George and Roger who are =
willing to review this series<br class=3D"">have to finish NVDIMM work =
first.<br class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, =
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
class=3D"">Er, I think this comment was misplaced =E2=80=94 it was the =
SPP series that I need to be the primary reviewer on. &nbsp;I wasn=E2=80=99=
t aware that the vIOMMU series had anything specific to do with the mm =
code.</span><br class=3D""></div></blockquote><br class=3D""></div><div>I =
may have recorded this incorrectly in that Royger would be the primary =
reviewer. I can't recall. In any case, the effect is the same, as Royger =
is also on the critical path for NVDIMM</div><div><br =
class=3D""></div><div>@John, @Chao: I agree with your clarification: =
that is what I meant. I recorded it inaccurately.</div><div><br =
class=3D""></div><div>As an aside, I will take the replies to this =
thread and copy it into the google doc (but I won't send out PDFs for =
it)</div><div><br class=3D""></div>Regards<div =
class=3D"">Lars</div></body></html>=

--Apple-Mail=_CB97AF09-A379-4FE8-B12F-A19C4E9BDE24--


--===============0813339584615928046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0813339584615928046==--
