From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: Xen (both x86 and Arm) Community Call: Jan 9 -
 16:00 - 17:00 UTC - Call for Agenda Items
Date: Tue, 8 Jan 2019 12:29:05 +0000
Message-ID: <7B0D908C-5214-428D-8318-F6E879D53849@gmail.com>
References: <13380756-2FA8-4F12-ADAC-1AF590578F3E@xenproject.org>
 <b0d70001-d8b4-f17f-63a6-8e992c87e32a@suse.com>
 <alpine.DEB.2.10.1901071030060.800@sstabellini-ThinkPad-X260>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Type: multipart/mixed; boundary="===============8079480560519179516=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XFSl=PQ=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1ggqVM-0002fw-EA
 for xen-devel@lists.xenproject.org; Tue, 08 Jan 2019 12:29:12 +0000
Received: by mail-wr1-x429.google.com with SMTP id t27so3857333wra.6
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jan 2019 04:29:10 -0800 (PST)
In-Reply-To: <alpine.DEB.2.10.1901071030060.800@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "davorin.mista@aggios.com" <davorin.mista@aggios.com>, "dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>, "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>, "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, "Ji,
 John" <john.ji@intel.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>, "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, Matt Spencer <Matt.Spencer@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Artem Mygaiev <Artem_Mygaiev@epam.com>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>, Christopher Clark <christopher.w.clark@gmail.com>, Paul Durrant <Paul.Durrant@citrix.com>, "committers@xenproject.org" <committers@xenproject.org>, "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>, "intel-xen@intel.com" <intel-xen@intel.com>
List-Id: xen-devel@lists.xenproject.org


--===============8079480560519179516==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_5B9935B5-2908-4779-95F3-5A364E80CE8F"


--Apple-Mail=_5B9935B5-2908-4779-95F3-5A364E80CE8F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Did anyone have any agenda items *NOT* related to 4.12?=20
As an aside: I added the following to the agenda
* 4.12 what headline features made it
* Face 2 face to discuss a plan and implications for safety =
certification (separate e-mail will follow today)

Regards
Lars

> On 7 Jan 2019, at 18:33, Stefano Stabellini <sstabellini@kernel.org> =
wrote:
>=20
> On Mon, 7 Jan 2019, Juergen Gross wrote:
>> On 03/01/2019 15:28, Lars Kurth wrote:
>>> Hi all,
>>>=20
>>> based on Stefano's and Julien's suggestion that it may make sense to =
merge the x86 and arm calls, I am willing to try. It also makes sense =
this time in particular because we are approaching freeze time.
>>>=20
>>>=20
>>> As per request the meeting is 1 hour later than normal. Also, =
because there were NO attendees from China on the last 3 calls. For =
Chinese attendees: if you plan to attend, please confirm you are =
attending and we can discuss moving the meeting to earlier.
>>>=20
>>> @Juergen, @Jan: we can discuss the timing of future meetings going =
forward if 17:00-18:00 is a problem for you.
>>>=20
>>> Please propose topics by either editing the running agenda document =
at =
https://docs.google.com/document/d/1Ufv9XcQO0zIAVeFbFCAHAeEIB9Ap4Y4srAm4vI=
8I01I/edit# or by replying to the mail. Ideally by next Tuesday!
>>=20
>> I'd like to discuss status of the current pending patch series:
>>=20
>> Series                               Author                 Status
>> Per-cpu tasklet                      Konrad Rzeszutek Wilk  ->4.13?
>> Improvements to domain creation (v2) Andrew Cooper          ?
>> Argo (inter-VM communication) (v3)   Christopher Clark      ?
>> Core aware sched (RFC v1)            Dario Faggioli         ->4.13?
>> Core aware sched credit2 (RFC v1)    Dario Faggioli         ->4.13?
>> x86 instr emulator add AVX512 (v7)   Jan Beulich            finished?
>> HVM guest CPU topology support (RFC) Chao Gao               ->4.13?
>> Intel Trace virt. enabling (v1)      Luwei Kang             ->4.13?
>> Linux stub domains (RFC v2)          Marek Marczykowski-G.  ->4.13?
>> qemu deprivilege (v4)                George Dunlap          finished?
>> Improve late microcode loading (v4)  Chao Gao               ?
>> Fixes to #DB injection               Andrew Cooper          ->4.13?
>> CPUID/MSR Xen/toolstack improvements Andrew Cooper          ->4.13?
>> Improvements to domain_crash()       Andrew Cooper          ->4.13?
>> Fix VGA logdirty with altp2m (v11)   Razvan Cojocaru        ?
>> dom0less (v4)                        Stefano Stabellini     ?
>=20
> Dom0less is already in. "Dom0less device assignment" missed the window
> by only a couple of days (I forgot to send it in time -- too bad.)
>=20
> I have another outstanding series for 4.12: "misc safety certification
> fixes".
>=20
>=20
>> Implement Set/Way operations (RFC)   Julien Grall           ?
>=20
> Also already committed
>=20
>=20
>> TEE mediator support in XEN (v2)     Volodymyr Babchuk      ?


--Apple-Mail=_5B9935B5-2908-4779-95F3-5A364E80CE8F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Did =
anyone have any agenda items *NOT* related to 4.12?&nbsp;<div =
class=3D"">As an aside: I added the following to the agenda</div><div =
class=3D"">* 4.12 what headline features made it</div><div =
class=3D"">*&nbsp;Face 2 face to discuss a plan and implications for =
safety certification (separate e-mail will follow today)</div><div =
class=3D""><br class=3D""></div><div class=3D"">Regards</div><div =
class=3D"">Lars<br class=3D""><div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D"">On 7 Jan 2019, at 18:33, =
Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" =
class=3D"">sstabellini@kernel.org</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">On Mon, 7 Jan =
2019, Juergen Gross wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">On 03/01/2019 15:28, Lars Kurth =
wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">Hi all,<br =
class=3D""><br class=3D"">based on Stefano's and Julien's suggestion =
that it may make sense to merge the x86 and arm calls, I am willing to =
try. It also makes sense this time in particular because we are =
approaching freeze time.<br class=3D""><br class=3D""><br class=3D"">As =
per request the meeting is 1 hour later than normal. Also, because there =
were NO attendees from China on the last 3 calls. For Chinese attendees: =
if you plan to attend, please confirm you are attending and we can =
discuss moving the meeting to earlier.<br class=3D""><br =
class=3D"">@Juergen, @Jan: we can discuss the timing of future meetings =
going forward if 17:00-18:00 is a problem for you.<br class=3D""><br =
class=3D"">Please propose topics by either editing the running agenda =
document at <a =
href=3D"https://docs.google.com/document/d/1Ufv9XcQO0zIAVeFbFCAHAeEIB9Ap4Y=
4srAm4vI8I01I/edit#" =
class=3D"">https://docs.google.com/document/d/1Ufv9XcQO0zIAVeFbFCAHAeEIB9A=
p4Y4srAm4vI8I01I/edit#</a> or by replying to the mail. Ideally by next =
Tuesday!<br class=3D""></blockquote><br class=3D"">I'd like to discuss =
status of the current pending patch series:<br class=3D""><br =
class=3D"">Series =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Author =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;Status<br class=3D"">Per-cpu tasklet =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Konrad Rzeszutek =
Wilk &nbsp;-&gt;4.13?<br class=3D"">Improvements to domain creation (v2) =
Andrew Cooper &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?<br =
class=3D"">Argo (inter-VM communication) (v3) &nbsp;&nbsp;Christopher =
Clark &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?<br class=3D"">Core aware sched =
(RFC v1) =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Dario =
Faggioli &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&gt;4.13?<br =
class=3D"">Core aware sched credit2 (RFC v1) &nbsp;&nbsp;&nbsp;Dario =
Faggioli &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&gt;4.13?<br =
class=3D"">x86 instr emulator add AVX512 (v7) &nbsp;&nbsp;Jan Beulich =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;finished=
?<br class=3D"">HVM guest CPU topology support (RFC) Chao Gao =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;-&gt;4.13?<br class=3D"">Intel Trace virt. enabling (v1) =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Luwei Kang =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&=
gt;4.13?<br class=3D"">Linux stub domains (RFC v2) =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Marek =
Marczykowski-G. &nbsp;-&gt;4.13?<br class=3D"">qemu deprivilege (v4) =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;George Dunlap =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;finished?<br =
class=3D"">Improve late microcode loading (v4) &nbsp;Chao Gao =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;?<br class=3D"">Fixes to #DB injection =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;Andrew Cooper =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&gt;4.13?<br =
class=3D"">CPUID/MSR Xen/toolstack improvements Andrew Cooper =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&gt;4.13?<br =
class=3D"">Improvements to domain_crash() =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Andrew Cooper =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&gt;4.13?<br =
class=3D"">Fix VGA logdirty with altp2m (v11) &nbsp;&nbsp;Razvan =
Cojocaru &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?<br =
class=3D"">dom0less (v4) =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Stefano =
Stabellini &nbsp;&nbsp;&nbsp;&nbsp;?<br class=3D""></blockquote><br =
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
none; float: none; display: inline !important;" class=3D"">Dom0less is =
already in. "Dom0less device assignment" missed the window</span><br =
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
none; float: none; display: inline !important;" class=3D"">by only a =
couple of days (I forgot to send it in time -- too bad.)</span><br =
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
none; float: none; display: inline !important;" class=3D"">I have =
another outstanding series for 4.12: "misc safety =
certification</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">fixes".</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">Implement Set/Way operations (RFC) =
&nbsp;&nbsp;Julien Grall =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?<br =
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
class=3D"">Also already committed</span><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Menlo-Regular; font-size: 11px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">TEE mediator support in XEN (v2) =
&nbsp;&nbsp;&nbsp;&nbsp;Volodymyr Babchuk =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;?</blockquote></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_5B9935B5-2908-4779-95F3-5A364E80CE8F--


--===============8079480560519179516==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8079480560519179516==--
