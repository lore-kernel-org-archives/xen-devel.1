From: Rich Persaud <persaur@gmail.com>
Subject: Re: Xen Project Spectre/Meltdown FAQ
Date: Fri, 5 Jan 2018 13:16:40 -0500
Message-ID: <888C1DAE-2B56-4D59-8529-D9DEA410BB9E@gmail.com>
References: <B3F5B430-F55E-446C-A7C5-7830F2CEDFCD@gmail.com>
Mime-Version: 1.0 (1.0)
Content-Type: multipart/mixed; boundary="===============1691440256514123145=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=+n0q=ea=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1eXWXs-0005Q7-IZ
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2018 18:16:44 +0000
Received: by mail-it0-x22c.google.com with SMTP id b5so2500497itc.3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jan 2018 10:16:42 -0800 (PST)
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============1691440256514123145==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-68A814C5-D431-46F0-9E68-268F8DA1AE94
Content-Transfer-Encoding: 7bit


--Apple-Mail-68A814C5-D431-46F0-9E68-268F8DA1AE94
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

> On Jan 5, 2018, at 06:35, Lars Kurth <lars.kurth.xen@gmail.com> wrote:
>=20
> Hi all, this is a repost of https://blog.xenproject.org/2018/01/04/xen-pro=
ject-spectremeltdown-faq/ for xen-users/xen-devel. If you have questions, pl=
ease reply to this thread and we will try and improve the FAQ based on quest=
ions.

Very helpful, thanks.

> Regards
> Lars
>=20
>=20
> Google=E2=80=99s Project Zero announced several information leak vulnerabi=
lities affecting all modern superscalar processors. Details can be found on t=
heir blog, and in the Xen Project Advisory 254 [1]. To help our users unders=
tand the impact and our next steps forward, we put together the following FA=
Q.
>=20
> Note that we will update the FAQ as new information surfaces.
>=20
> =3D Is Xen impacted by Meltdown and Spectre? =3D
>=20
> There are two angles to consider for this question:
>=20
> * Can an untrusted guest attack the hypervisor using Meltdown or Spectre?
> * Can a guest user-space program attack a guest kernel using Meltdown or S=
pectre?
>=20
> Systems running Xen, like all operating systems and hypervisors, are poten=
tially affected by Spectre (referred to as SP1 and SP2 in Advisory 254 [1]).=
 For Arm Processors information, you can find which processors are impacted h=
ere [2].  In general, both the hypervisor and a guest kernel are vulnerable t=
o attack via SP1 and SP2.
>=20
> Only Intel processors are impacted by Meltdown (referred to as SP3 in Advi=
sory 254 [1]). On Intel processors, only 64-bit PV mode guests can attack Xe=
n. Guests running in 32-bit PV mode, HVM mode, and PVH mode cannot attack th=
e hypervisor using SP3. However, in 32-bit PV mode, HVM mode, and PVH mode, g=
uest userspaces can attack guest kernels using SP3; so updating guest kernel=
s is advisable.
>=20
> Interestingly, guest kernels running in 64-bit PV mode are not vulnerable t=
o attack using SP3, because 64-bit PV guests already run in a KPTI-like mode=
.
>=20
> =3D Is there any risk of privilege escalation? =3D
>=20
> Meltdown and Spectre are, by themselves, only information leaks. There is n=
o suggestion that speculative execution can be used to modify memory or caus=
e a system to do anything it might not have done already.
>=20
> =3D Where can I find more information? =3D
>=20
> We will update this blog post and Advisory 254 [1] as new information beco=
mes available. Updates will also be published on xen-announce@.
>=20
> We will also maintain a technical FAQ on our wiki [3] for answers to more d=
etailed technical questions that emerge on xen-devel@ and other communicatio=
n channels.
>=20
> =3D Are there any patches for the vulnerability? =3D
>=20
> We have prototype patches for a mitigation for Meltdown on Intel CPUs and a=
 Mitigation for SP2/CVE-2017-5715, which are functional but have not undergo=
ne rigorous review and have not been backported to all supported Xen Project=
 releases.
>=20
> As information related to Meltdown and Spectre is now public, development w=
ill continue in public on xen-devel@ and patches will be posted and attached=
 to Advisory 254 [1] as they become available in the next few days.
>=20
> =3D Can SP1/SP2 be fixed at all? What plans are there to mitigate them? =3D=

>=20
> SP2 can be mitigated in two ways, both of which essentially prevent specul=
ative execution of indirect branches. The first is to flush the branch predi=
ction logic on entry into the hypervisor. This requires microcode updates, w=
hich Intel and AMD are in the process of preparing, as well as patches to th=
e hypervisor which are also in process and should be available soon.

The Linux kernel's IBRS patchset has a doc link which compares retpoline, IB=
RS Dynamic ("opt-in") and IBRS Always On ("opt-in if more paranoid"). =20

https://lkml.org/lkml/2018/1/4/615

https://docs.google.com/document/d/e/2PACX-1vSMrwkaoSUBAFc6Fjd19F18c1O9pudkf=
AY-7lGYGOTN8mc9ul-J6pWadcAaBJZcVA7W_3jlLKRtKRbd/pub

Would be nice to have that comparison for other CPU vendors.  Some informati=
on is aggregated at https://github.com/marcan/speculation-bugs:

"This repo is an attempt to collect information on the class of information d=
isclosure vulnerabilities caused by CPU speculative execution that were disc=
losed on January 3rd, 2018.  Existing nomenclature is inconsistent and there=
 is no agreed-upon name for the entire class of bugs, but the names Spectre a=
nd Meltdown have been used for subclasses of attacks.  This is a combination=
 of publicly available information and educated guesses/ speculation based o=
n the nature of the attacks. Pull requests with corrections or discussion ar=
e welcome."

> The second is to do indirect jumps in a way which is not subject to specul=
ative execution. This requires the hypervisor to be recompiled with a compil=
er that contains special new features. These new compiler features are also i=
n the process of being prepared for both gcc and clang, and should be availa=
ble soon.
>=20
> SP1 is much more difficult to mitigate. We have some ideas we=E2=80=99re e=
xploring, but they=E2=80=99re still at the design stage at this point.
>=20
> =3D Does Xen have any equivalent to Linux=E2=80=99s KPTI series? =3D
>=20
> Linux=E2=80=99s KPTI series is designed to address SP3 only.  For Xen gues=
ts, only 64-bit PV guests are affected by SP3. A KPTI-like approach was expl=
ored initially, but required significant ABI changes.  Instead we=E2=80=99ve=
 decided to go with an alternate approach, which is less disruptive and less=
 complex to implement. The chosen approach runs PV guests in a PVH container=
, which ensures that PV guests continue to behave as before, while providing=
 the isolation that protects the hypervisor from SP3. This works well for Xe=
n 4.8 to Xen 4.10, which is currently our priority.

Since PVH does not yet support PCI passthrough, are there other recommended S=
P3 mitigations for 64-bit PV driver domains?  Would CPU pinning of an untrus=
ted guest driver domain reduce its ability to attack the host?

Since 32-bit PV guests are not affected by SP3, will they continue to run wi=
thout a PVH container, so that PCI passthrough continues to function?

Rich

> For Xen 4.6 and 4.7, we are evaluating several options, but we have not ye=
t finalized the best solution.
>=20
> =3D Devicemodel stub domains run in PV mode, so is it still more safe to r=
un device models in a stub domain than in domain 0? =3D
>=20
> The short answer is, yes, it is still safer to run stub domains than other=
wise.
>=20
> If an attacker can gain control of the device model running in a stub doma=
in, it can indeed attempt to use these processor vulnerabilities to read inf=
ormation from Xen.
>=20
> However, if an attacker can gain control of a device model running in doma=
in 0 without deprivileging, the attacker can gain control of the entire syst=
em.  Even with qemu deprivileging, the qemu process may be able to execute s=
peculative execution attacks against the hypervisor.
>=20
> So although XSA-254 does affect device model stub domains, they are still s=
afer than not running with a stub domain.
>=20
> =3D What is the Xen Project=E2=80=99s plan going forward? =3D
>=20
> The Xen Project is working on finalizing solutions for SP3 and SP2 and eva=
luating options for SP1. If you would like to stay abreast on our progress, p=
lease sign up to xen-announce@. We will update this FAQ as soon as we have m=
ore news and updated information. Answers to more detailed technical questio=
ns will be maintained in a technical FAQ on our wiki [3]. Thank you for your=
 patience.
>=20
> =3D How can I ask further questions? =3D
> Please respond to this e-mail thread on xen-devel@ or xen-users@
>=20
> References
> [1] http://xenbits.xen.org/xsa/advisory-254.html
> [2] https://developer.arm.com/support/security-update
> [3] https://wiki.xenproject.org/wiki/Xen_Project_Meltdown_and_Spectre_Tech=
nical_FAQ
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--Apple-Mail-68A814C5-D431-46F0-9E68-268F8DA1AE94
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div><span></span></div><div><meta http-equ=
iv=3D"content-type" content=3D"text/html; charset=3Dutf-8"><div><span></span=
></div><div><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"><div><span></span></div><div><div></div><blockquote type=3D"cite"><sp=
an>On Jan 5, 2018, at 06:35, Lars Kurth &lt;<a href=3D"mailto:lars.kurth.xen=
@gmail.com">lars.kurth.xen@gmail.com</a>&gt; wrote:</span><br></blockquote><=
blockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"c=
ite"><span>Hi all, this is a repost of <a href=3D"https://blog.xenproject.or=
g/2018/01/04/xen-project-spectremeltdown-faq/">https://blog.xenproject.org/2=
018/01/04/xen-project-spectremeltdown-faq/</a> for xen-users/xen-devel. If y=
ou have questions, please reply to this thread and we will try and improve t=
he FAQ based on questions.</span></blockquote><div><br></div><div>Very helpf=
ul, thanks.</div><br><blockquote type=3D"cite"><span>Regards</span><br></blo=
ckquote><blockquote type=3D"cite"><span>Lars</span><br></blockquote><blockqu=
ote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><s=
pan></span><br></blockquote><blockquote type=3D"cite"><span>Google=E2=80=99s=
 Project Zero announced several information leak vulnerabilities affecting a=
ll modern superscalar processors. Details can be found on their blog, and in=
 the Xen Project Advisory 254 [1]. To help our users understand the impact a=
nd our next steps forward, we put together the following FAQ.</span><br></bl=
ockquote><blockquote type=3D"cite"><span></span><br></blockquote><blockquote=
 type=3D"cite"><span>Note that we will update the FAQ as new information sur=
faces.</span><br></blockquote><blockquote type=3D"cite"><span></span><br></b=
lockquote><blockquote type=3D"cite"><span>=3D Is Xen impacted by Meltdown an=
d Spectre? =3D</span><br></blockquote><blockquote type=3D"cite"><span></span=
><br></blockquote><blockquote type=3D"cite"><span>There are two angles to co=
nsider for this question:</span><br></blockquote><blockquote type=3D"cite"><=
span></span><br></blockquote><blockquote type=3D"cite"><span>* Can an untrus=
ted guest attack the hypervisor using Meltdown or Spectre?</span><br></block=
quote><blockquote type=3D"cite"><span>* Can a guest user-space program attac=
k a guest kernel using Meltdown or Spectre?</span><br></blockquote><blockquo=
te type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><sp=
an>Systems running Xen, like all operating systems and hypervisors, are pote=
ntially affected by Spectre (referred to as SP1 and SP2 in Advisory 254 [1])=
. For Arm Processors information, you can find which processors are impacted=
 here [2]. &nbsp;In general, both the hypervisor and a guest kernel are vuln=
erable to attack via SP1 and SP2.</span><br></blockquote><blockquote type=3D=
"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>Only In=
tel processors are impacted by Meltdown (referred to as SP3 in Advisory 254 [=
1]). On Intel processors, only 64-bit PV mode guests can attack Xen. Guests r=
unning in 32-bit PV mode, HVM mode, and PVH mode cannot attack the hyperviso=
r using SP3. However, in 32-bit PV mode, HVM mode, and PVH mode, guest users=
paces can attack guest kernels using SP3; so updating guest kernels is advis=
able.</span><br></blockquote><blockquote type=3D"cite"><span></span><br></bl=
ockquote><blockquote type=3D"cite"><span>Interestingly, guest kernels runnin=
g in 64-bit PV mode are not vulnerable to attack using SP3, because 64-bit P=
V guests already run in a KPTI-like mode.</span><br></blockquote><blockquote=
 type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span=
>=3D Is there any risk of privilege escalation? =3D</span><br></blockquote><=
blockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"c=
ite"><span>Meltdown and Spectre are, by themselves, only information leaks. T=
here is no suggestion that speculative execution can be used to modify memor=
y or cause a system to do anything it might not have done already.</span><br=
></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><block=
quote type=3D"cite"><span>=3D Where can I find more information? =3D</span><=
br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><blo=
ckquote type=3D"cite"><span>We will update this blog post and Advisory 254 [=
1] as new information becomes available. Updates will also be published on x=
en-announce@.</span><br></blockquote><blockquote type=3D"cite"><span></span>=
<br></blockquote><blockquote type=3D"cite"><span>We will also maintain a tec=
hnical FAQ on our wiki [3] for answers to more detailed technical questions t=
hat emerge on xen-devel@ and other communication channels.</span><br></block=
quote><blockquote type=3D"cite"><span></span><br></blockquote><blockquote ty=
pe=3D"cite"><span>=3D Are there any patches for the vulnerability? =3D</span=
><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><b=
lockquote type=3D"cite"><span>We have prototype patches for a mitigation for=
 Meltdown on Intel CPUs and a Mitigation for SP2/CVE-2017-5715, which are fu=
nctional but have not undergone rigorous review and have not been backported=
 to all supported Xen Project releases.</span><br></blockquote><blockquote t=
ype=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>A=
s information related to Meltdown and Spectre is now public, development wil=
l continue in public on xen-devel@ and patches will be posted and attached t=
o Advisory 254 [1] as they become available in the next few days.</span><br>=
</blockquote><blockquote type=3D"cite"><span></span><br></blockquote><blockq=
uote type=3D"cite"><span>=3D Can SP1/SP2 be fixed at all? What plans are the=
re to mitigate them? =3D</span><br></blockquote><blockquote type=3D"cite"><s=
pan></span><br></blockquote><blockquote type=3D"cite"><span>SP2 can be mitig=
ated in two ways, both of which essentially prevent speculative execution of=
 indirect branches. The first is to flush the branch prediction logic on ent=
ry into the hypervisor. This requires microcode updates, which Intel and AMD=
 are in the process of preparing, as well as patches to the hypervisor which=
 are also in process and should be available soon.</span><br></blockquote><d=
iv><br></div><div>The Linux kernel's IBRS patchset has a doc link which comp=
ares retpoline, IBRS Dynamic ("opt-in") and IBRS Always On ("opt-in if more p=
aranoid"). &nbsp;</div><div><br></div><div><a href=3D"https://lkml.org/lkml/=
2018/1/4/615">https://lkml.org/lkml/2018/1/4/615</a></div><div><br></div><di=
v><a href=3D"https://docs.google.com/document/d/e/2PACX-1vSMrwkaoSUBAFc6Fjd1=
9F18c1O9pudkfAY-7lGYGOTN8mc9ul-J6pWadcAaBJZcVA7W_3jlLKRtKRbd/pub">https://do=
cs.google.com/document/d/e/2PACX-1vSMrwkaoSUBAFc6Fjd19F18c1O9pudkfAY-7lGYGOT=
N8mc9ul-J6pWadcAaBJZcVA7W_3jlLKRtKRbd/pub</a></div><div><br></div><div>Would=
 be nice to have that comparison for other CPU vendors. &nbsp;Some informati=
on is aggregated at <a href=3D"https://github.com/marcan/speculation-bugs">h=
ttps://github.com/marcan/speculation-bugs</a>:</div><div><br></div><div>"<sp=
an style=3D"background-color: rgba(255, 255, 255, 0);">This repo is an attem=
pt to collect information on the class of information disclosure vulnerabili=
ties caused by CPU speculative execution that were disclosed on January 3rd,=
 2018. &nbsp;</span><span style=3D"background-color: rgba(255, 255, 255, 0);=
">Existing nomenclature is inconsistent and there is no agreed-upon name for=
 the entire class of bugs, but the names Spectre and Meltdown have been used=
 for subclasses of attacks. &nbsp;</span><span style=3D"background-color: rg=
ba(255, 255, 255, 0);">This is a combination of publicly available informati=
on and educated guesses/ speculation based on the nature of the attacks. Pul=
l requests with corrections or discussion are welcome."</span></div><br><blo=
ckquote type=3D"cite"><span></span></blockquote><blockquote type=3D"cite"><s=
pan>The second is to do indirect jumps in a way which is not subject to spec=
ulative execution. This requires the hypervisor to be recompiled with a comp=
iler that contains special new features. These new compiler features are als=
o in the process of being prepared for both gcc and clang, and should be ava=
ilable soon.</span><br></blockquote><blockquote type=3D"cite"><span></span><=
br></blockquote><blockquote type=3D"cite"><span>SP1 is much more difficult t=
o mitigate. We have some ideas we=E2=80=99re exploring, but they=E2=80=99re s=
till at the design stage at this point.</span><br></blockquote><blockquote t=
ype=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>=3D=
 Does Xen have any equivalent to Linux=E2=80=99s KPTI series? =3D</span><br>=
</blockquote><blockquote type=3D"cite"><span></span><br></blockquote><blockq=
uote type=3D"cite"><span>Linux=E2=80=99s KPTI series is designed to address S=
P3 only. &nbsp;For Xen guests, only 64-bit PV guests are affected by SP3. A K=
PTI-like approach was explored initially, but required significant ABI chang=
es. &nbsp;Instead we=E2=80=99ve decided to go with an alternate approach, wh=
ich is less disruptive and less complex to implement. The chosen approach ru=
ns PV guests in a PVH container, which ensures that PV guests continue to be=
have as before, while providing the isolation that protects the hypervisor f=
rom SP3. This works well for Xen 4.8 to Xen 4.10, which is currently our pri=
ority.</span><br></blockquote><span></span><div><br></div>Since PVH does not=
 yet support PCI passthrough, are there other recommended SP3 mitigations fo=
r 64-bit PV driver domains? &nbsp;Would CPU pinning of an untrusted guest dr=
iver domain reduce its ability to attack the host?</div><div><br></div><div>=
Since 32-bit PV guests are not affected by SP3, will they continue to run wi=
thout a PVH container, so that PCI passthrough continues to function?</div><=
div><br></div><div>Rich</div><div><span></span><br><blockquote type=3D"cite"=
><span>For Xen 4.6 and 4.7, we are evaluating several options, but we have n=
ot yet finalized the best solution.</span><br></blockquote><blockquote type=3D=
"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>=3D Dev=
icemodel stub domains run in PV mode, so is it still more safe to run device=
 models in a stub domain than in domain 0? =3D</span><br></blockquote><block=
quote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite">=
<span>The short answer is, yes, it is still safer to run stub domains than o=
therwise.</span><br></blockquote><blockquote type=3D"cite"><span></span><br>=
</blockquote><blockquote type=3D"cite"><span>If an attacker can gain control=
 of the device model running in a stub domain, it can indeed attempt to use t=
hese processor vulnerabilities to read information from Xen.</span><br></blo=
ckquote><blockquote type=3D"cite"><span></span><br></blockquote><blockquote t=
ype=3D"cite"><span>However, if an attacker can gain control of a device mode=
l running in domain 0 without deprivileging, the attacker can gain control o=
f the entire system. &nbsp;Even with qemu deprivileging, the qemu process ma=
y be able to execute speculative execution attacks against the hypervisor.</=
span><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquot=
e><blockquote type=3D"cite"><span>So although XSA-254 does affect device mod=
el stub domains, they are still safer than not running with a stub domain.</=
span><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquot=
e><blockquote type=3D"cite"><span>=3D What is the Xen Project=E2=80=99s plan=
 going forward? =3D</span><br></blockquote><blockquote type=3D"cite"><span><=
/span><br></blockquote><blockquote type=3D"cite"><span>The Xen Project is wo=
rking on finalizing solutions for SP3 and SP2 and evaluating options for SP1=
. If you would like to stay abreast on our progress, please sign up to xen-a=
nnounce@. We will update this FAQ as soon as we have more news and updated i=
nformation. Answers to more detailed technical questions will be maintained i=
n a technical FAQ on our wiki [3]. Thank you for your patience.</span><br></=
blockquote><blockquote type=3D"cite"><span></span><br></blockquote><blockquo=
te type=3D"cite"><span>=3D How can I ask further questions? =3D</span><br></=
blockquote><blockquote type=3D"cite"><span>Please respond to this e-mail thr=
ead on xen-devel@ or xen-users@</span><br></blockquote><blockquote type=3D"c=
ite"><span></span><br></blockquote><blockquote type=3D"cite"><span>Reference=
s</span><br></blockquote><blockquote type=3D"cite"><span>[1] <a href=3D"http=
://xenbits.xen.org/xsa/advisory-254.html">http://xenbits.xen.org/xsa/advisor=
y-254.html</a></span><br></blockquote><blockquote type=3D"cite"><span>[2] <a=
 href=3D"https://developer.arm.com/support/security-update">https://develope=
r.arm.com/support/security-update</a></span><br></blockquote><blockquote typ=
e=3D"cite"><span>[3] <a href=3D"https://wiki.xenproject.org/wiki/Xen_Project=
_Meltdown_and_Spectre_Technical_FAQ">https://wiki.xenproject.org/wiki/Xen_Pr=
oject_Meltdown_and_Spectre_Technical_FAQ</a></span><br></blockquote><blockqu=
ote type=3D"cite"><span>_______________________________________________</spa=
n><br></blockquote><blockquote type=3D"cite"><span>Xen-devel mailing list</s=
pan><br></blockquote><blockquote type=3D"cite"><span><a href=3D"mailto:Xen-d=
evel@lists.xenproject.org">Xen-devel@lists.xenproject.org</a></span><br></bl=
ockquote><blockquote type=3D"cite"><span><a href=3D"https://lists.xenproject=
.org/mailman/listinfo/xen-devel">https://lists.xenproject.org/mailman/listin=
fo/xen-devel</a></span><br></blockquote></div></div></div></body></html>=

--Apple-Mail-68A814C5-D431-46F0-9E68-268F8DA1AE94--


--===============1691440256514123145==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1691440256514123145==--
