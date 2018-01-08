From: Lars Kurth <lars.kurth.xen@gmail.com>
Subject: Re: Xen Project Spectre/Meltdown FAQ
Date: Mon, 8 Jan 2018 10:11:50 +0000
Message-ID: <584F1369-C4C7-429D-815B-FC3167AE3F07@gmail.com>
References: <B3F5B430-F55E-446C-A7C5-7830F2CEDFCD@gmail.com>
 <903ef3c9-f5c6-a7e8-f9c0-3961d627413a@knorrie.org>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Content-Type: multipart/mixed; boundary="===============6865338805026530481=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=boe9=ed=gmail.com=lars.kurth.xen@srs-us1.protection.inumbo.net>)
 id 1eYUPM-00065e-9V
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 10:11:56 +0000
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


--===============6865338805026530481==
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_D6EAD6D7-D39D-4455-A99B-D6244034ED49"


--Apple-Mail=_D6EAD6D7-D39D-4455-A99B-D6244034ED49
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hans,
I updated the FAQ on the blog. Thank you for your input.=20
Lars

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
>=20
>> Google=E2=80=99s Project Zero announced several information leak
>> vulnerabilities affecting all modern superscalar processors. Details
>> can be found on their blog, and in the Xen Project Advisory 254 [1].
>> To help our users understand the impact and our next steps forward,
>> we put together the following FAQ.
>>=20
>> Note that we will update the FAQ as new information surfaces.
>>=20
>> =3D Is Xen impacted by Meltdown and Spectre? =3D
>>=20
>> There are two angles to consider for this question:
>>=20
>> * Can an untrusted guest attack the hypervisor using Meltdown or
>> Spectre?
>> * Can a guest user-space program attack a guest kernel using
>> Meltdown or Spectre?
>=20
>> Systems running Xen, like all operating systems and hypervisors, are
>> potentially affected by Spectre (referred to as SP1 and SP2 in
>> Advisory 254 [1]). For Arm Processors information, you can find which
>> processors are impacted here [2].  In general, both the hypervisor
>> and a guest kernel are vulnerable to attack via SP1 and SP2.
>>=20
>> Only Intel processors are impacted by Meltdown (referred to as SP3 in
>> Advisory 254 [1]).
>=20
>> On Intel processors, only 64-bit PV mode guests can attack Xen.
>=20
> "On Intel processors an attack at Xen using SP3 can only be done by
> 64-bit PV mode guests."
>=20
> Even if it looks super-redundant, I think keeping explicit information
> in every sentence is preferable, so they cannot be misinterpreted or
> accidentally be taken out of context.
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
>=20
>> =3D Is there any risk of privilege escalation? =3D
>>=20
>> Meltdown and Spectre are, by themselves, only information leaks.
>> There is no suggestion that speculative execution can be used to
>> modify memory or cause a system to do anything it might not have done
>> already.
>>=20
>> =3D Where can I find more information? =3D
>>=20
>> We will update this blog post and Advisory 254 [1] as new information
>> becomes available. Updates will also be published on xen-announce@.
>>=20
>> We will also maintain a technical FAQ on our wiki [3] for answers to
>> more detailed technical questions that emerge on xen-devel@ and other
>> communication channels.
>>=20
>> =3D Are there any patches for the vulnerability? =3D
>>=20
>> We have prototype patches for a mitigation for Meltdown on Intel CPUs
>> and a Mitigation for SP2/CVE-2017-5715, which are functional but have
>> not undergone rigorous review and have not been backported to all
>> supported Xen Project releases.
>>=20
>> As information related to Meltdown and Spectre is now public,
>> development will continue in public on xen-devel@ and patches will be
>> posted and attached to Advisory 254 [1] as they become available in
>> the next few days.
>>=20
>> =3D Can SP1/SP2 be fixed at all? What plans are there to mitigate =
them?
>> =3D
>>=20
>> SP2 can be mitigated in two ways, both of which essentially prevent
>> speculative execution of indirect branches. The first is to flush the
>> branch prediction logic on entry into the hypervisor. This requires
>> microcode updates, which Intel and AMD are in the process of
>> preparing, as well as patches to the hypervisor which are also in
>> process and should be available soon.
>>=20
>> The second is to do indirect jumps in a way which is not subject to
>> speculative execution. This requires the hypervisor to be recompiled
>> with a compiler that contains special new features. These new
>> compiler features are also in the process of being prepared for both
>> gcc and clang, and should be available soon.
>>=20
>> SP1 is much more difficult to mitigate. We have some ideas we=E2=80=99r=
e
>> exploring, but they=E2=80=99re still at the design stage at this =
point.
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
>=20
>> A KPTI-like approach was
>> explored initially, but required significant ABI changes.  Instead
>> we=E2=80=99ve decided to go with an alternate approach, which is less
>> disruptive and less complex to implement. The chosen approach runs PV
>> guests in a PVH container, which ensures that PV guests continue to
>> behave as before, while providing the isolation that protects the
>> hypervisor from SP3. This works well for Xen 4.8 to Xen 4.10, which
>> is currently our priority.
>>=20
>> For Xen 4.6 and 4.7, we are evaluating several options, but we have
>> not yet finalized the best solution.
>>=20
>> =3D Devicemodel stub domains run in PV mode, so is it still more safe
>> to run device models in a stub domain than in domain 0? =3D
>>=20
>> The short answer is, yes, it is still safer to run stub domains than
>> otherwise.
>>=20
>> If an attacker can gain control of the device model running in a stub
>> domain, it can indeed attempt to use these processor vulnerabilities
>> to read information from Xen.
>>=20
>> However, if an attacker can gain control of a device model running in
>> domain 0 without deprivileging, the attacker can gain control of the
>> entire system.  Even with qemu deprivileging, the qemu process may be
>> able to execute speculative execution attacks against the
>> hypervisor.
>>=20
>> So although XSA-254 does affect device model stub domains, they are
>> still safer than not running with a stub domain.
>>=20
>> =3D What is the Xen Project=E2=80=99s plan going forward? =3D
>>=20
>> The Xen Project is working on finalizing solutions for SP3 and SP2
>> and evaluating options for SP1. If you would like to stay abreast on
>> our progress, please sign up to xen-announce@. We will update this
>> FAQ as soon as we have more news and updated information. Answers to
>> more detailed technical questions will be maintained in a technical
>> FAQ on our wiki [3]. Thank you for your patience.
>>=20
>> =3D How can I ask further questions? =3D Please respond to this =
e-mail
>> thread on xen-devel@ or xen-users@
>>=20
>> References [1] http://xenbits.xen.org/xsa/advisory-254.html [2]
>> https://developer.arm.com/support/security-update [3]
>> =
https://wiki.xenproject.org/wiki/Xen_Project_Meltdown_and_Spectre_Technica=
l_FAQ
>>=20
>>=20
> _______________________________________________
>> Xen-devel mailing list Xen-devel@lists.xenproject.org =
<mailto:Xen-devel@lists.xenproject.org>=20
>> https://lists.xenproject.org/mailman/listinfo/xen-devel =
<https://lists.xenproject.org/mailman/listinfo/xen-devel>

--Apple-Mail=_D6EAD6D7-D39D-4455-A99B-D6244034ED49
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D"">Hans,<div class=3D"">I updated the FAQ on the blog. Thank you =
for your input.&nbsp;</div><div class=3D"">Lars</div><div class=3D""><br =
class=3D""><div><blockquote type=3D"cite" class=3D""><div class=3D"">On =
5 Jan 2018, at 15:55, Hans van Kranenburg &lt;<a =
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
by being more explicit.</span><br style=3D"font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><br =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D"">Google=E2=80=99s Project =
Zero announced several information leak<br class=3D"">vulnerabilities =
affecting all modern superscalar processors. Details<br class=3D"">can =
be found on their blog, and in the Xen Project Advisory 254 [1].<br =
class=3D"">To help our users understand the impact and our next steps =
forward,<br class=3D"">we put together the following FAQ.<br =
class=3D""><br class=3D"">Note that we will update the FAQ as new =
information surfaces.<br class=3D""><br class=3D"">=3D Is Xen impacted =
by Meltdown and Spectre? =3D<br class=3D""><br class=3D"">There are two =
angles to consider for this question:<br class=3D""><br class=3D"">* Can =
an untrusted guest attack the hypervisor using Meltdown or<br =
class=3D"">Spectre?<br class=3D"">* Can a guest user-space program =
attack a guest kernel using<br class=3D"">Meltdown or Spectre?<br =
class=3D""></blockquote><br style=3D"font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><blockquote=
 type=3D"cite" style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D"">Systems running Xen, like =
all operating systems and hypervisors, are<br class=3D"">potentially =
affected by Spectre (referred to as SP1 and SP2 in<br class=3D"">Advisory =
254 [1]). For Arm Processors information, you can find which<br =
class=3D"">processors are impacted here [2]. &nbsp;In general, both the =
hypervisor<br class=3D"">and a guest kernel are vulnerable to attack via =
SP1 and SP2.<br class=3D""><br class=3D"">Only Intel processors are =
impacted by Meltdown (referred to as SP3 in<br class=3D"">Advisory 254 =
[1]).<br class=3D""></blockquote><br style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><blockquote=
 type=3D"cite" style=3D"font-family: Menlo-Regular; font-size: 11px; =
font-style: normal; font-variant-caps: normal; font-weight: normal; =
letter-spacing: normal; orphans: auto; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; widows: auto; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
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
guests."</span><br style=3D"font-family: Menlo-Regular; font-size: 11px; =
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
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><br =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
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
word-spacing: 0px; -webkit-text-stroke-width: 0px;" class=3D""><br =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D"">=3D Is there any risk of =
privilege escalation? =3D<br class=3D""><br class=3D"">Meltdown and =
Spectre are, by themselves, only information leaks.<br class=3D"">There =
is no suggestion that speculative execution can be used to<br =
class=3D"">modify memory or cause a system to do anything it might not =
have done<br class=3D"">already.<br class=3D""><br class=3D"">=3D Where =
can I find more information? =3D<br class=3D""><br class=3D"">We will =
update this blog post and Advisory 254 [1] as new information<br =
class=3D"">becomes available. Updates will also be published on =
xen-announce@.<br class=3D""><br class=3D"">We will also maintain a =
technical FAQ on our wiki [3] for answers to<br class=3D"">more detailed =
technical questions that emerge on xen-devel@ and other<br =
class=3D"">communication channels.<br class=3D""><br class=3D"">=3D Are =
there any patches for the vulnerability? =3D<br class=3D""><br =
class=3D"">We have prototype patches for a mitigation for Meltdown on =
Intel CPUs<br class=3D"">and a Mitigation for SP2/CVE-2017-5715, which =
are functional but have<br class=3D"">not undergone rigorous review and =
have not been backported to all<br class=3D"">supported Xen Project =
releases.<br class=3D""><br class=3D"">As information related to =
Meltdown and Spectre is now public,<br class=3D"">development will =
continue in public on xen-devel@ and patches will be<br class=3D"">posted =
and attached to Advisory 254 [1] as they become available in<br =
class=3D"">the next few days.<br class=3D""><br class=3D"">=3D Can =
SP1/SP2 be fixed at all? What plans are there to mitigate them?<br =
class=3D"">=3D<br class=3D""><br class=3D"">SP2 can be mitigated in two =
ways, both of which essentially prevent<br class=3D"">speculative =
execution of indirect branches. The first is to flush the<br =
class=3D"">branch prediction logic on entry into the hypervisor. This =
requires<br class=3D"">microcode updates, which Intel and AMD are in the =
process of<br class=3D"">preparing, as well as patches to the hypervisor =
which are also in<br class=3D"">process and should be available soon.<br =
class=3D""><br class=3D"">The second is to do indirect jumps in a way =
which is not subject to<br class=3D"">speculative execution. This =
requires the hypervisor to be recompiled<br class=3D"">with a compiler =
that contains special new features. These new<br class=3D"">compiler =
features are also in the process of being prepared for both<br =
class=3D"">gcc and clang, and should be available soon.<br class=3D""><br =
class=3D"">SP1 is much more difficult to mitigate. We have some ideas =
we=E2=80=99re<br class=3D"">exploring, but they=E2=80=99re still at the =
design stage at this point.<br class=3D""><br class=3D"">=3D Does Xen =
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
class=3D"">A KPTI-like approach was<br class=3D"">explored initially, =
but required significant ABI changes. &nbsp;Instead<br class=3D"">we=E2=80=
=99ve decided to go with an alternate approach, which is less<br =
class=3D"">disruptive and less complex to implement. The chosen approach =
runs PV<br class=3D"">guests in a PVH container, which ensures that PV =
guests continue to<br class=3D"">behave as before, while providing the =
isolation that protects the<br class=3D"">hypervisor from SP3. This =
works well for Xen 4.8 to Xen 4.10, which<br class=3D"">is currently our =
priority.<br class=3D""><br class=3D"">For Xen 4.6 and 4.7, we are =
evaluating several options, but we have<br class=3D"">not yet finalized =
the best solution.<br class=3D""><br class=3D"">=3D Devicemodel stub =
domains run in PV mode, so is it still more safe<br class=3D"">to run =
device models in a stub domain than in domain 0? =3D<br class=3D""><br =
class=3D"">The short answer is, yes, it is still safer to run stub =
domains than<br class=3D"">otherwise.<br class=3D""><br class=3D"">If an =
attacker can gain control of the device model running in a stub<br =
class=3D"">domain, it can indeed attempt to use these processor =
vulnerabilities<br class=3D"">to read information from Xen.<br =
class=3D""><br class=3D"">However, if an attacker can gain control of a =
device model running in<br class=3D"">domain 0 without deprivileging, =
the attacker can gain control of the<br class=3D"">entire system. =
&nbsp;Even with qemu deprivileging, the qemu process may be<br =
class=3D"">able to execute speculative execution attacks against the<br =
class=3D"">hypervisor.<br class=3D""><br class=3D"">So although XSA-254 =
does affect device model stub domains, they are<br class=3D"">still =
safer than not running with a stub domain.<br class=3D""><br class=3D"">=3D=
 What is the Xen Project=E2=80=99s plan going forward? =3D<br =
class=3D""><br class=3D"">The Xen Project is working on finalizing =
solutions for SP3 and SP2<br class=3D"">and evaluating options for SP1. =
If you would like to stay abreast on<br class=3D"">our progress, please =
sign up to xen-announce@. We will update this<br class=3D"">FAQ as soon =
as we have more news and updated information. Answers to<br =
class=3D"">more detailed technical questions will be maintained in a =
technical<br class=3D"">FAQ on our wiki [3]. Thank you for your =
patience.<br class=3D""><br class=3D"">=3D How can I ask further =
questions? =3D Please respond to this e-mail<br class=3D"">thread on =
xen-devel@ or xen-users@<br class=3D""><br class=3D"">References [1] <a =
href=3D"http://xenbits.xen.org/xsa/advisory-254.html" =
class=3D"">http://xenbits.xen.org/xsa/advisory-254.html</a> [2]<br =
class=3D""><a href=3D"https://developer.arm.com/support/security-update" =
class=3D"">https://developer.arm.com/support/security-update</a> [3]<br =
class=3D""><a =
href=3D"https://wiki.xenproject.org/wiki/Xen_Project_Meltdown_and_Spectre_=
Technical_FAQ" =
class=3D"">https://wiki.xenproject.org/wiki/Xen_Project_Meltdown_and_Spect=
re_Technical_FAQ</a><br class=3D""><br class=3D""><br =
class=3D""></blockquote><span style=3D"font-family: Menlo-Regular; =
font-size: 11px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: =
inline !important;" =
class=3D"">_______________________________________________</span><br =
style=3D"font-family: Menlo-Regular; font-size: 11px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Menlo-Regular; font-size: 11px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D"">Xen-devel mailing list<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"mailto:Xen-devel@lists.xenproject.org" =
class=3D"">Xen-devel@lists.xenproject.org</a><span =
class=3D"Apple-converted-space">&nbsp;</span><br class=3D""><a =
href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" =
class=3D"">https://lists.xenproject.org/mailman/listinfo/xen-devel</a></bl=
ockquote></div></blockquote></div><br class=3D""></div></body></html>=

--Apple-Mail=_D6EAD6D7-D39D-4455-A99B-D6244034ED49--


--===============6865338805026530481==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6865338805026530481==--
