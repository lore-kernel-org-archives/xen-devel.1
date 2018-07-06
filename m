From: Saeed Mirzamohammadi <saeed.mzmd@gmail.com>
Subject: Routing physical interrupts to EL1
Date: Thu, 5 Jul 2018 20:51:13 -0700
Message-ID: <CALPKaJ=qbh0rLK+MC=fC966=D50+_3eOCTYbQcbCyqm1psaYcg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3320556772402159558=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=e0qm=jw=gmail.com=saeed.mzmd@srs-us1.protection.inumbo.net>)
 id 1fbHm8-0002yw-3o
 for xen-devel@lists.xenproject.org; Fri, 06 Jul 2018 03:51:16 +0000
Received: by mail-qk0-x232.google.com with SMTP id d22-v6so5647143qkc.8
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jul 2018 20:51:14 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

--===============3320556772402159558==
Content-Type: multipart/alternative; boundary="0000000000003fa46805704c93fe"

--0000000000003fa46805704c93fe
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm trying to route all the physical interrupts to the guest domain rather
than being trapped in the Xen. I would like to know what is the right way
to do that?

I know that HCR_IMO bit in the HCR_EL2 register is supposed to be for
routing the interrupts to the guest (Routing to EL1 instead of EL2).
link to the datasheet:
http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.ddi0500d/CIHJHAAG.html

So, I have tried doing the following in the leave_hypervisor_tail. I run a
simple hypercall and do the following lines before return (which is I guess
the last point of exit to the guest from hypervisor):
---------------------
*current->arch.hcr_el2 &= ~HCR_IMO;*
*WRITE_SYSREG(current->arch.hcr_el2, HCR_EL2);*
*isb();*
*----------------------*


*It looks like to be doing it right for all the vcpus but gets stuck after
return from leave_hypervisor_tail for the last vcpu.*

Any help is appreciated,
Thanks,


-- 
Saeed Mirzamohammadi
PhD Student
Department of Computer Science
University of California, Irvine
Irvine, CA 92617
saeed@uci.edu <smirzamo@uci.edu>
http://www.ics.uci.edu/~saeed/ <http://www.ics.uci.edu/~smirzamo/>

--0000000000003fa46805704c93fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I&#39;m trying to route all the phy=
sical interrupts to the guest domain rather than being trapped in the Xen. =
I would like to know what is the right way to do that?</div><div><br></div>=
<div>I know that HCR_IMO bit in the HCR_EL2 register is supposed to be for =
routing the interrupts to the guest (Routing to EL1 instead of EL2).</div><=
div>link to the datasheet:=C2=A0<a href=3D"http://infocenter.arm.com/help/i=
ndex.jsp?topic=3D/com.arm.doc.ddi0500d/CIHJHAAG.html">http://infocenter.arm=
.com/help/index.jsp?topic=3D/com.arm.doc.ddi0500d/CIHJHAAG.html</a></div><d=
iv><br></div><div>So, I have tried doing the following in the=C2=A0leave_hy=
pervisor_tail. I run a simple hypercall=C2=A0and do the following lines bef=
ore return (which is I guess the last point of exit to the guest from hyper=
visor):</div><div><div><div>---------------------</div><div><i>current-&gt;=
arch.hcr_el2 &amp;=3D ~HCR_IMO;</i></div><div><i>WRITE_SYSREG(current-&gt;a=
rch.hcr_el2, HCR_EL2);</i></div><div><i>isb();</i><br></div></div><div><i>-=
---------------------</i></div><div><i><span style=3D"font-size:small;font-=
style:normal;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial;float:none;display:inline"><br></span></i><=
/div><div><i><span style=3D"font-size:small;font-style:normal;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial;float:none;display:inline">It looks like to be doing it right for all=
 the<span>=C2=A0</span></span><span class=3D"gmail-gr_ gmail-gr_1111 gmail-=
gr-alert gmail-gr_spell gmail-gr_inline_cards gmail-gr_disable_anim_appear =
gmail-ContextualSpelling" id=3D"gmail-1111" style=3D"display:inline;font-si=
ze:small;border-bottom:2px solid transparent;background-repeat:no-repeat;fo=
nt-style:normal;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial">vcpus</span><span style=3D"font-size:sm=
all;font-style:normal;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial;float:none;display:inline">=C2=A0b=
ut<span>=C2=A0</span></span><span class=3D"gmail-gr_ gmail-gr_1122 gmail-gr=
-alert gmail-gr_gramm gmail-gr_inline_cards gmail-gr_disable_anim_appear gm=
ail-Grammar gmail-multiReplace" id=3D"gmail-1122" style=3D"display:inline;f=
ont-size:small;border-bottom:2px solid transparent;background-repeat:no-rep=
eat;font-style:normal;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial">gets</span><span style=3D"font-si=
ze:small;font-style:normal;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial;float:none;display:inline">=
=C2=A0stuck after return from=C2=A0</span><span style=3D"font-size:small;fo=
nt-style:normal;text-decoration-style:initial;text-decoration-color:initial=
;background-color:rgb(255,255,255);float:none;display:inline">leave_hypervi=
sor_tail for the last<span>=C2=A0</span><span class=3D"gmail-gr_ gmail-gr_1=
195 gmail-gr-alert gmail-gr_spell gmail-gr_inline_cards gmail-gr_disable_an=
im_appear gmail-ContextualSpelling" id=3D"gmail-1195" style=3D"display:inli=
ne;border-bottom:2px solid transparent;background-repeat:no-repeat;color:in=
herit;font-size:inherit">vcpu</span>.</span><br></i></div><div><i><br></i><=
/div><div>Any help is appreciated,</div><div>Thanks,</div><div><br></div><d=
iv><br></div>-- <br><div class=3D"gmail_signature"><div dir=3D"ltr"><div><d=
iv dir=3D"ltr">Saeed Mirzamohammadi<div>PhD Student<br style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(2=
55,255,255)"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:13px;background-color:rgb(255,255,255)">Department of Computer =
Science</span><br><div><span style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:13px;background-color:rgb(255,255,255)">University of=
 California, Irvine</span></div><div><span style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)"=
>Irvine, CA 92617</span></div><div><span style=3D"color:rgb(34,34,34);font-=
family:arial,sans-serif;font-size:13px;background-color:rgb(255,255,255)"><=
a href=3D"mailto:smirzamo@uci.edu" target=3D"_blank">saeed@uci.edu</a></spa=
n></div><div><span style=3D"background-color:rgb(255,255,255)"><a href=3D"h=
ttp://www.ics.uci.edu/~smirzamo/" target=3D"_blank">http://www.ics.uci.edu/=
~saeed/</a></span></div></div></div></div></div></div>
</div></div>

--0000000000003fa46805704c93fe--


--===============3320556772402159558==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3320556772402159558==--
