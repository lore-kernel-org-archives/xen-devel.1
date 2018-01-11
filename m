From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: Xen Project Spectre/Meltdown FAQ
Date: Thu, 11 Jan 2018 09:15:21 +0000
Message-ID: <4A0D5682-1292-43E9-BBDA-331B3CEF15A4@gmail.com>
References: <B3F5B430-F55E-446C-A7C5-7830F2CEDFCD@gmail.com>
 <888C1DAE-2B56-4D59-8529-D9DEA410BB9E@gmail.com>
 <edec8de6-c678-2aa1-5c50-97533c14f8f6@citrix.com>
 <20180107150029.GA2935@mail-itl>
 <alpine.DEB.2.10.1801081804150.4603@sstabellini-ThinkPad-X260>
 <2ff9538c98ece66b66da2484a7b7d67c@randomwebstuff.com>
 <30d1c766-eee6-9af3-3770-05dad888294b@suse.com>
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Content-Type: multipart/mixed; boundary="===============6747218478683384238=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=mgwv=eg=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1eZYxK-0000DO-UU
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2018 09:15:27 +0000
Received: by mail-wm0-x233.google.com with SMTP id b141so4041201wme.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2018 01:15:25 -0800 (PST)
In-Reply-To: <30d1c766-eee6-9af3-3770-05dad888294b@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>, Peter <xen@randomwebstuff.com>
List-Id: xen-devel@lists.xenproject.org


--===============6747218478683384238==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_D1ACD5DE-9697-4E21-898B-19C395E4275F"


--Apple-Mail=_D1ACD5DE-9697-4E21-898B-19C395E4275F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

I am wondering whether something like the attached table would make =
understanding the FAQ easier. Page 1 is clearly what is Xen specific and =
we definitely should cover.
Page 2 in general covers Linux and guests. The first block is relatively =
straightforward.

The 2nd and 3rd block is based on information from Doug: as there are =
many gaps, I would be uneasy about publishing these somewhere prominent.=20=


Also
> As this is really guest specific this information can't be provided by
> Xen.
which carries a risk that any analysis made by anyone might only apply =
to the context in which the analysis was done.

But the question keeps coming up, so making this clearer is maybe =
sensible.

Best Regards
Lars

> On 10 Jan 2018, at 06:03, Juergen Gross <jgross@suse.com> wrote:
>=20
> On 10/01/18 04:58, Peter wrote:
>> On 2018-01-09 15:04, Stefano Stabellini wrote:
>>> On Sun, 7 Jan 2018, Marek Marczykowski-G=C3=B3recki wrote:
>>>> On Fri, Jan 05, 2018 at 07:05:56PM +0000, Andrew Cooper wrote:
>>>>> On 05/01/18 18:16, Rich Persaud wrote:
>>>>>>> On Jan 5, 2018, at 06:35, Lars Kurth <lars.kurth.xen@gmail.com
>>>>>>> <mailto:lars.kurth.xen@gmail.com>> wrote:
>>>>>>> Linux=E2=80=99s KPTI series is designed to address SP3 only.  =
For Xen
>>>> guests,
>>>>>>> only 64-bit PV guests are affected by SP3. A KPTI-like approach =
was
>>>>>>> explored initially, but required significant ABI changes. =20
>>>>=20
>>>> Is some partial KPTI-like approach feasible? Like unmapping memory =
owned
>>>> by other guests, but keeping Xen areas mapped? This will still =
allow
>>>> leaking Xen memory, but there are very few secrets there (vCPUs =
state,
>>>> anything else?), so overall impact will be much lower.
>>>=20
>>> +1
>>>=20
>>=20
>> I believe
>> =
https://blog.xenproject.org/2018/01/04/xen-project-spectremeltdown-faq/
>> is clear re VMs attacking/accessing the host/dom0/hypervisor and the
>> mitigations for that.
>>=20
>> However the page seems ambiguous about whether 64 bit VMs running as
>> PVHv2 with host provided kernels are protected or not (from each VM's
>> own processes).
>=20
> PVHv2 is using exactly the same runtime environment as HVM seen from =
the
> hypervisor. So a guest running as PVHv2 needs a PTI like approach like
> HVM in its kernel.
>=20
>> Can the page be updated to be more explicit and perhaps describe how =
the
>> VM kernel or how the PVHv2 virtualization provides that protection.  =
And
>> ideally how that could be checked from the VM itself.  e.g. grep pti
>> /proc/cpuinfo?
>=20
> As this is really guest specific this information can't be provided by
> Xen.
>=20
>> e.g. the page says: "Guest kernels running in 64-bit PV mode are not
>> directly vulnerable to attack using SP3, because 64-bit PV guests
>> already run in a KPTI-like mode." but it does not mention PVHv2 for
>> that.  Is it protected under PVHv2?  Does it depend on the kernel?  =
Is
>> so what is the patchset/option/mechanism that protects the VM from =
its
>> own processes?
>=20
> This question should have been answered above already.
>=20
>=20
> Juergen
>=20
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org <mailto:Xen-devel@lists.xenproject.org>
> https://lists.xenproject.org/mailman/listinfo/xen-devel =
<https://lists.xenproject.org/mailman/listinfo/xen-devel>

--Apple-Mail=_D1ACD5DE-9697-4E21-898B-19C395E4275F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">I =
am wondering whether something like the attached table would make =
understanding the FAQ easier. Page 1 is clearly what is Xen specific and =
we definitely should cover.<div class=3D"">Page 2 in general covers =
Linux and guests. The first block is relatively =
straightforward.</div><div class=3D""><br class=3D""></div><div =
class=3D"">The 2nd and 3rd block is based on information from Doug: as =
there are many gaps, I would be uneasy about publishing these somewhere =
prominent.&nbsp;</div><div class=3D""><br class=3D""></div><div =
class=3D"">Also</div><div class=3D""><blockquote type=3D"cite" =
class=3D""><span class=3D"" style=3D"font-family: Menlo-Regular; =
font-size: 11px; float: none; display: inline !important;">As this is =
really guest specific this information can't be provided by</span><br =
class=3D"" style=3D"font-family: Menlo-Regular; font-size: 11px;"><span =
class=3D"" style=3D"font-family: Menlo-Regular; font-size: 11px; float: =
none; display: inline !important;">Xen.</span></blockquote><div =
class=3D"">which carries a risk that any analysis made by anyone might =
only apply to the context in which the analysis was done.</div><div =
class=3D""><br class=3D""></div>But the question keeps coming up, so =
making this clearer is maybe sensible.</div><div class=3D""><br =
class=3D""></div><div class=3D"">Best Regards</div><div class=3D"">Lars<br=
 class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 10 Jan 2018, at 06:03, Juergen Gross &lt;<a =
href=3D"mailto:jgross@suse.com" class=3D"">jgross@suse.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><span =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">On 10/01/18 04:58, =
Peter wrote:</span><br style=3D"font-family: Menlo-Regular; font-size: =
11px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">On 2018-01-09 15:04, Stefano Stabellini wrote:<br =
class=3D""><blockquote type=3D"cite" class=3D"">On Sun, 7 Jan 2018, =
Marek Marczykowski-G=C3=B3recki wrote:<br class=3D""><blockquote =
type=3D"cite" class=3D"">On Fri, Jan 05, 2018 at 07:05:56PM +0000, =
Andrew Cooper wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">On=
 05/01/18 18:16, Rich Persaud wrote:<br class=3D""><blockquote =
type=3D"cite" class=3D""><blockquote type=3D"cite" class=3D"">On Jan 5, =
2018, at 06:35, Lars Kurth &lt;<a href=3D"mailto:lars.kurth.xen@gmail.com"=
 class=3D"">lars.kurth.xen@gmail.com</a><br class=3D"">&lt;<a =
href=3D"mailto:lars.kurth.xen@gmail.com" =
class=3D"">mailto:lars.kurth.xen@gmail.com</a>&gt;&gt; wrote:<br =
class=3D"">Linux=E2=80=99s KPTI series is designed to address SP3 only. =
&nbsp;For Xen<br =
class=3D""></blockquote></blockquote></blockquote>guests,<br =
class=3D""><blockquote type=3D"cite" class=3D""><blockquote type=3D"cite" =
class=3D""><blockquote type=3D"cite" class=3D"">only 64-bit PV guests =
are affected by SP3. A KPTI-like approach was<br class=3D"">explored =
initially, but required significant ABI changes. &nbsp;<br =
class=3D""></blockquote></blockquote></blockquote><br class=3D"">Is some =
partial KPTI-like approach feasible? Like unmapping memory owned<br =
class=3D"">by other guests, but keeping Xen areas mapped? This will =
still allow<br class=3D"">leaking Xen memory, but there are very few =
secrets there (vCPUs state,<br class=3D"">anything else?), so overall =
impact will be much lower.<br class=3D""></blockquote><br class=3D"">+1<br=
 class=3D""><br class=3D""></blockquote><br class=3D"">I believe<br =
class=3D""><a =
href=3D"https://blog.xenproject.org/2018/01/04/xen-project-spectremeltdown=
-faq/" =
class=3D"">https://blog.xenproject.org/2018/01/04/xen-project-spectremeltd=
own-faq/</a><br class=3D"">is clear re VMs attacking/accessing the =
host/dom0/hypervisor and the<br class=3D"">mitigations for that.<br =
class=3D""><br class=3D"">However the page seems ambiguous about whether =
64 bit VMs running as<br class=3D"">PVHv2 with host provided kernels are =
protected or not (from each VM's<br class=3D"">own processes).<br =
class=3D""></blockquote><br style=3D"font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">PVHv2 is using =
exactly the same runtime environment as HVM seen from the</span><br =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">hypervisor. So a guest running as PVHv2 needs a =
PTI like approach like</span><br style=3D"font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">HVM in its =
kernel.</span><br style=3D"font-family: Menlo-Regular; font-size: 11px; =
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
-webkit-text-stroke-width: 0px;" class=3D"">Can the page be updated to =
be more explicit and perhaps describe how the<br class=3D"">VM kernel or =
how the PVHv2 virtualization provides that protection.&nbsp; And<br =
class=3D"">ideally how that could be checked from the VM itself.&nbsp; =
e.g. grep pti<br class=3D"">/proc/cpuinfo?<br class=3D""></blockquote><br =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">As this is really guest specific this =
information can't be provided by</span><br style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><span =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
float: none; display: inline !important;" class=3D"">Xen.</span><br =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><br style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">e.g. the page says: "Guest kernels running in 64-bit PV mode =
are not<br class=3D"">directly vulnerable to attack using SP3, because =
64-bit PV guests<br class=3D"">already run in a KPTI-like mode." but it =
does not mention PVHv2 for<br class=3D"">that.&nbsp; Is it protected =
under PVHv2?&nbsp; Does it depend on the kernel?&nbsp; Is<br class=3D"">so=
 what is the patchset/option/mechanism that protects the VM from its<br =
class=3D"">own processes?<br class=3D""></blockquote><br =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">This question should have been answered above =
already.</span><br style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px;" class=3D""><br style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><br =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">Juergen</span><br style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><br =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" =
class=3D"">_______________________________________________</span><br =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><span style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; float: none; display: inline =
!important;" class=3D"">Xen-devel mailing list</span><br =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><a href=3D"mailto:Xen-devel@lists.xenproject.org" =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">Xen-devel@lists.xenproject.org</a><br style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><a =
href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: auto; word-spacing: =
0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">https://lists.xenproject.org/mailman/listinfo/xen-devel</a></di=
v></blockquote></div><br class=3D""></div></body></html>=

--Apple-Mail=_D1ACD5DE-9697-4E21-898B-19C395E4275F--


--===============6747218478683384238==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6747218478683384238==--
