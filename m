From: Julien Grall <julien.grall@linaro.org>
Subject: Re: Xen Project Spectre/Meltdown FAQ
Date: Fri, 5 Jan 2018 14:40:47 +0000
Message-ID: <CAEC2CxqA9DagoV=qibqW=ucuhPymRcRH61kb9r5M0PiG+1dmuA@mail.gmail.com>
References: <B3F5B430-F55E-446C-A7C5-7830F2CEDFCD@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5120425692999939553=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=w6rp=ea=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1eXTAw-0004jL-7B
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2018 14:40:50 +0000
Received: by mail-qk0-x231.google.com with SMTP id g81so6150696qke.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jan 2018 06:40:48 -0800 (PST)
In-Reply-To: <B3F5B430-F55E-446C-A7C5-7830F2CEDFCD@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Lars Kurth <lars.kurth.xen@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, George Dunlap <george.dunlap@citrix.com>, xen-users@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============5120425692999939553==
Content-Type: multipart/alternative; boundary="001a11465d902693910562086f3b"

--001a11465d902693910562086f3b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(apologies for the formatting)

Hi Lars,

Thank you for putting together an FAQ.

Few comments below around Arm.


On 5 Jan 2018 13:37, "Lars Kurth" <lars.kurth.xen@gmail.com> wrote:

Hi all, this is a repost of https://blog.xenproject.org/
2018/01/04/xen-project-spectremeltdown-faq/ for xen-users/xen-devel. If you
have questions, please reply to this thread and we will try and improve the
FAQ based on questions.
Regards
Lars


Google=E2=80=99s Project Zero announced several information leak vulnerabil=
ities
affecting all modern superscalar processors. Details can be found on their
blog, and in the Xen Project Advisory 254 [1]. To help our users understand
the impact and our next steps forward, we put together the following FAQ.

Note that we will update the FAQ as new information surfaces.

=3D Is Xen impacted by Meltdown and Spectre? =3D

There are two angles to consider for this question:

* Can an untrusted guest attack the hypervisor using Meltdown or Spectre?
* Can a guest user-space program attack a guest kernel using Meltdown or
Spectre?

Systems running Xen, like all operating systems and hypervisors, are
potentially affected by Spectre (referred to as SP1 and SP2 in Advisory 254
[1]). For Arm Processors information, you can find which processors are
impacted here [2].  In general, both the hypervisor and a guest kernel are
vulnerable to attack via SP1 and SP2.


The website list processors designed by Arm (i.e Cortex family). It does
not include processors made by Arm licensees. I will leave the various
licensees speak for themselves here.

Regarding Arm-designed processors, most of them are not vulnerable to any
variant. Those affected will mostly be vulnerable to attack via SP1 and SP2=
.

But this does not rule out attack via SP3 on Arm. From the website, one
Cortex processor is affected.

While this will not affect Xen (the hypervisor is using a different set  of
page-tables). Guest kernel will be vulnerable to it.


Only Intel processors are impacted by Meltdown (referred to as SP3 in
Advisory 254 [1]). On Intel processors, only 64-bit PV mode guests can
attack Xen. Guests running in 32-bit PV mode, HVM mode, and PVH mode cannot
attack the hypervisor using SP3. However, in 32-bit PV mode, HVM mode, and
PVH mode, guest userspaces can attack guest kernels using SP3; so updating
guest kernels is advisable.


Interestingly, guest kernels running in 64-bit PV mode are not vulnerable
to attack using SP3, because 64-bit PV guests already run in a KPTI-like
mode.

=3D Is there any risk of privilege escalation? =3D

Meltdown and Spectre are, by themselves, only information leaks. There is
no suggestion that speculative execution can be used to modify memory or
cause a system to do anything it might not have done already.

=3D Where can I find more information? =3D

We will update this blog post and Advisory 254 [1] as new information
becomes available. Updates will also be published on xen-announce@.

We will also maintain a technical FAQ on our wiki [3] for answers to more
detailed technical questions that emerge on xen-devel@ and other
communication channels.

=3D Are there any patches for the vulnerability? =3D

We have prototype patches for a mitigation for Meltdown on Intel CPUs and a
Mitigation for SP2/CVE-2017-5715, which are functional but have not
undergone rigorous review and have not been backported to all supported Xen
Project releases.

As information related to Meltdown and Spectre is now public, development
will continue in public on xen-devel@ and patches will be posted and
attached to Advisory 254 [1] as they become available in the next few days.

=3D Can SP1/SP2 be fixed at all? What plans are there to mitigate them? =3D

SP2 can be mitigated in two ways, both of which essentially prevent
speculative execution of indirect branches. The first is to flush the
branch prediction logic on entry into the hypervisor. This requires
microcode updates, which Intel and AMD are in the process of preparing, as
well as patches to the hypervisor which are also in process and should be
available soon.

The second is to do indirect jumps in a way which is not subject to
speculative execution. This requires the hypervisor to be recompiled with a
compiler that contains special new features. These new compiler features
are also in the process of being prepared for both gcc and clang, and
should be available soon.

SP1 is much more difficult to mitigate. We have some ideas we=E2=80=99re ex=
ploring,
but they=E2=80=99re still at the design stage at this point.

=3D Does Xen have any equivalent to Linux=E2=80=99s KPTI series? =3D

Linux=E2=80=99s KPTI series is designed to address SP3 only.  For Xen guest=
s, only
64-bit PV guests are affected by SP3. A KPTI-like approach was explored
initially, but required significant ABI changes.  Instead we=E2=80=99ve dec=
ided to
go with an alternate approach, which is less disruptive and less complex to
implement. The chosen approach runs PV guests in a PVH container, which
ensures that PV guests continue to behave as before, while providing the
isolation that protects the hypervisor from SP3. This works well for Xen
4.8 to Xen 4.10, which is currently our priority.

For Xen 4.6 and 4.7, we are evaluating several options, but we have not yet
finalized the best solution.

=3D Devicemodel stub domains run in PV mode, so is it still more safe to ru=
n
device models in a stub domain than in domain 0? =3D

The short answer is, yes, it is still safer to run stub domains than
otherwise.

If an attacker can gain control of the device model running in a stub
domain, it can indeed attempt to use these processor vulnerabilities to
read information from Xen.

However, if an attacker can gain control of a device model running in
domain 0 without deprivileging, the attacker can gain control of the entire
system.  Even with qemu deprivileging, the qemu process may be able to
execute speculative execution attacks against the hypervisor.

So although XSA-254 does affect device model stub domains, they are still
safer than not running with a stub domain.

=3D What is the Xen Project=E2=80=99s plan going forward? =3D

The Xen Project is working on finalizing solutions for SP3 and SP2 and
evaluating options for SP1. If you would like to stay abreast on our
progress, please sign up to xen-announce@. We will update this FAQ as soon
as we have more news and updated information. Answers to more detailed
technical questions will be maintained in a technical FAQ on our wiki [3].
Thank you for your patience.

=3D How can I ask further questions? =3D
Please respond to this e-mail thread on xen-devel@ or xen-users@

References
[1] http://xenbits.xen.org/xsa/advisory-254.html
[2] https://developer.arm.com/support/security-update
[3] https://wiki.xenproject.org/wiki/Xen_Project_Meltdown_and_
Spectre_Technical_FAQ
_______________________________________________
Xen-devel mailing list
Xen-devel@lists.xenproject.org
https://lists.xenproject.org/mailman/listinfo/xen-devel

--001a11465d902693910562086f3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">(apologies for the formatting)</div><di=
v dir=3D"auto"><br></div><div>Hi Lars,</div><div dir=3D"auto"><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Thank you for putting together an FAQ.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Few comments below around A=
rm.</div><br><div class=3D"gmail_extra" dir=3D"auto"><br><div class=3D"gmai=
l_quote">On 5 Jan 2018 13:37, &quot;Lars Kurth&quot; &lt;<a href=3D"mailto:=
lars.kurth.xen@gmail.com">lars.kurth.xen@gmail.com</a>&gt; wrote:<br type=
=3D"attribution"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">Hi all, this is a repost of <a hr=
ef=3D"https://blog.xenproject.org/2018/01/04/xen-project-spectremeltdown-fa=
q/" rel=3D"noreferrer" target=3D"_blank">https://blog.xenproject.org/<wbr>2=
018/01/04/xen-project-<wbr>spectremeltdown-faq/</a> for xen-users/xen-devel=
. If you have questions, please reply to this thread and we will try and im=
prove the FAQ based on questions.<br>
Regards<br>
Lars<br>
<br>
<br>
Google=E2=80=99s Project Zero announced several information leak vulnerabil=
ities affecting all modern superscalar processors. Details can be found on =
their blog, and in the Xen Project Advisory 254 [1]. To help our users unde=
rstand the impact and our next steps forward, we put together the following=
 FAQ.<br>
<br>
Note that we will update the FAQ as new information surfaces.<br>
<br>
=3D Is Xen impacted by Meltdown and Spectre? =3D<br>
<br>
There are two angles to consider for this question:<br>
<br>
* Can an untrusted guest attack the hypervisor using Meltdown or Spectre?<b=
r>
* Can a guest user-space program attack a guest kernel using Meltdown or Sp=
ectre?<br>
<br>
Systems running Xen, like all operating systems and hypervisors, are potent=
ially affected by Spectre (referred to as SP1 and SP2 in Advisory 254 [1]).=
 For Arm Processors information, you can find which processors are impacted=
 here [2].=C2=A0 In general, both the hypervisor and a guest kernel are vul=
nerable to attack via SP1 and SP2.</blockquote></div></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto"></div><div dir=3D"auto">The website l=
ist processors designed by Arm (i.e Cortex family). It does not include pro=
cessors made by Arm licensees. I will leave the various licensees speak for=
 themselves here.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Regard=
ing Arm-designed processors, most of them are not vulnerable to any variant=
. Those affected will mostly be vulnerable to attack via SP1 and SP2.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">But this does not rule out at=
tack via SP3 on Arm. From the website, one Cortex processor is affected.</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">While this will not affect=
 Xen (the hypervisor is using a different set=C2=A0 of page-tables). Guest =
kernel will be vulnerable to it.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote=
 class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
Only Intel processors are impacted by Meltdown (referred to as SP3 in Advis=
ory 254 [1]). On Intel processors, only 64-bit PV mode guests can attack Xe=
n. Guests running in 32-bit PV mode, HVM mode, and PVH mode cannot attack t=
he hypervisor using SP3. However, in 32-bit PV mode, HVM mode, and PVH mode=
, guest userspaces can attack guest kernels using SP3; so updating guest ke=
rnels is advisable.</blockquote></div></div></div><div dir=3D"auto"><div cl=
ass=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Interestingly, guest kernels running in 64-bit PV mode are not vulnerable t=
o attack using SP3, because 64-bit PV guests already run in a KPTI-like mod=
e.<br>
<br>
=3D Is there any risk of privilege escalation? =3D<br>
<br>
Meltdown and Spectre are, by themselves, only information leaks. There is n=
o suggestion that speculative execution can be used to modify memory or cau=
se a system to do anything it might not have done already.<br>
<br>
=3D Where can I find more information? =3D<br>
<br>
We will update this blog post and Advisory 254 [1] as new information becom=
es available. Updates will also be published on xen-announce@.<br>
<br>
We will also maintain a technical FAQ on our wiki [3] for answers to more d=
etailed technical questions that emerge on xen-devel@ and other communicati=
on channels.<br>
<br>
=3D Are there any patches for the vulnerability? =3D<br>
<br>
We have prototype patches for a mitigation for Meltdown on Intel CPUs and a=
 Mitigation for SP2/CVE-2017-5715, which are functional but have not underg=
one rigorous review and have not been backported to all supported Xen Proje=
ct releases.<br>
<br>
As information related to Meltdown and Spectre is now public, development w=
ill continue in public on xen-devel@ and patches will be posted and attache=
d to Advisory 254 [1] as they become available in the next few days.<br>
<br>
=3D Can SP1/SP2 be fixed at all? What plans are there to mitigate them? =3D=
<br>
<br>
SP2 can be mitigated in two ways, both of which essentially prevent specula=
tive execution of indirect branches. The first is to flush the branch predi=
ction logic on entry into the hypervisor. This requires microcode updates, =
which Intel and AMD are in the process of preparing, as well as patches to =
the hypervisor which are also in process and should be available soon.<br>
<br>
The second is to do indirect jumps in a way which is not subject to specula=
tive execution. This requires the hypervisor to be recompiled with a compil=
er that contains special new features. These new compiler features are also=
 in the process of being prepared for both gcc and clang, and should be ava=
ilable soon.<br>
<br>
SP1 is much more difficult to mitigate. We have some ideas we=E2=80=99re ex=
ploring, but they=E2=80=99re still at the design stage at this point.<br>
<br>
=3D Does Xen have any equivalent to Linux=E2=80=99s KPTI series? =3D<br>
<br>
Linux=E2=80=99s KPTI series is designed to address SP3 only.=C2=A0 For Xen =
guests, only 64-bit PV guests are affected by SP3. A KPTI-like approach was=
 explored initially, but required significant ABI changes.=C2=A0 Instead we=
=E2=80=99ve decided to go with an alternate approach, which is less disrupt=
ive and less complex to implement. The chosen approach runs PV guests in a =
PVH container, which ensures that PV guests continue to behave as before, w=
hile providing the isolation that protects the hypervisor from SP3. This wo=
rks well for Xen 4.8 to Xen 4.10, which is currently our priority.<br>
<br>
For Xen 4.6 and 4.7, we are evaluating several options, but we have not yet=
 finalized the best solution.<br>
<br>
=3D Devicemodel stub domains run in PV mode, so is it still more safe to ru=
n device models in a stub domain than in domain 0? =3D<br>
<br>
The short answer is, yes, it is still safer to run stub domains than otherw=
ise.<br>
<br>
If an attacker can gain control of the device model running in a stub domai=
n, it can indeed attempt to use these processor vulnerabilities to read inf=
ormation from Xen.<br>
<br>
However, if an attacker can gain control of a device model running in domai=
n 0 without deprivileging, the attacker can gain control of the entire syst=
em.=C2=A0 Even with qemu deprivileging, the qemu process may be able to exe=
cute speculative execution attacks against the hypervisor.<br>
<br>
So although XSA-254 does affect device model stub domains, they are still s=
afer than not running with a stub domain.<br>
<br>
=3D What is the Xen Project=E2=80=99s plan going forward? =3D<br>
<br>
The Xen Project is working on finalizing solutions for SP3 and SP2 and eval=
uating options for SP1. If you would like to stay abreast on our progress, =
please sign up to xen-announce@. We will update this FAQ as soon as we have=
 more news and updated information. Answers to more detailed technical ques=
tions will be maintained in a technical FAQ on our wiki [3]. Thank you for =
your patience.<br>
<br>
=3D How can I ask further questions? =3D<br>
Please respond to this e-mail thread on xen-devel@ or xen-users@<br>
<br>
References<br>
[1] <a href=3D"http://xenbits.xen.org/xsa/advisory-254.html" rel=3D"norefer=
rer" target=3D"_blank">http://xenbits.xen.org/xsa/<wbr>advisory-254.html</a=
><br>
[2] <a href=3D"https://developer.arm.com/support/security-update" rel=3D"no=
referrer" target=3D"_blank">https://developer.arm.com/<wbr>support/security=
-update</a><br>
[3] <a href=3D"https://wiki.xenproject.org/wiki/Xen_Project_Meltdown_and_Sp=
ectre_Technical_FAQ" rel=3D"noreferrer" target=3D"_blank">https://wiki.xenp=
roject.org/<wbr>wiki/Xen_Project_Meltdown_and_<wbr>Spectre_Technical_FAQ</a=
><br>
______________________________<wbr>_________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org">Xen-devel@lists.xenprojec=
t.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer" target=3D"_blank">https://lists.xenproject.org/<wbr>mailman/lis=
tinfo/xen-devel</a></blockquote></div><br></div></div></div>

--001a11465d902693910562086f3b--


--===============5120425692999939553==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5120425692999939553==--
