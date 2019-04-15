From: Matt Leinhos <matthew.leinhos@gmail.com>
Subject: Xen 4.11.1: guest uses altp2m to crash host
Date: Mon, 15 Apr 2019 08:34:00 -0500
Message-ID: <CAFLDOk8Egs_gJmx1Yg386eEkmq4gNcbBxVGkjC7Wofhz8zCe1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6723911994843986981=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HI6c=SR=gmail.com=matthew.leinhos@srs-us1.protection.inumbo.net>)
 id 1hG1kU-0000qn-Fu
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 13:34:14 +0000
Received: by mail-wm1-x32b.google.com with SMTP id c1so20670109wml.4
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2019 06:34:13 -0700 (PDT)
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

--===============6723911994843986981==
Content-Type: multipart/alternative; boundary="0000000000002e7aea058691b505"

--0000000000002e7aea058691b505
Content-Type: text/plain; charset="UTF-8"

Greetings,

I've found a way to crash a host from a misbehaving guest, using altp2m.
This is on a recent Intel core i7 chip. I've crashed two systems running
4.11.1. This behavior is not exhibited on 4.12, and since altp2m is a tech
preview in 4.11.1, this is not covered by security support. However, I
believe that the divergence between software and hardware state, as
mentioned below, is still present in 4.12.

On Xen 4.11.1 with altp2m enabled, follow these steps in the guest, whose
config file includes `altp2m = "mixed":
1. Allocate page P (GFN G)
2. Enable altp2m
3. Enable #VE notification, setting to G
4. Disable altp2m
5. Enable altp2m
6. Enable #VE notification, setting to G

At this point the entire system is unresponsive; #6 does not return control
to the guest. Note that step 3 is required, thus indicating some incomplete
cleanup after 4 that leads to a crash at 6. I've noticed a problem in the
Xen source at step 4, where the software and hardware states diverge. See
below for my notes on pertinent code.

I hope this is helpful and would appreciate it if you could fill me in on
why the entire host goes down - I suspect Xen is interacting with the VMCS
incorrectly, but I don't know the details and would like to understand.

1. Allocate page P (GFN G)

2. HVMOP_altp2m_set_domain_state(true)
    set d->arch.altp2m_active = true
    if first time:
       p2m_init_altp2m_by_id()
    for each vcpu V:
       altp2m_vcpu_initialise(V)
          reset (av->p2midx = INVALID_ALTP2M,
                 av->veinfo_gfn = INVALID_GFN)
          altp2m_vcpu_update_p2m(V)

3. HVMOP_altp2m_vcpu_enable_notify(G)
     checks: only toggling between INVALID_GFN and another value is
permitted
     set vcpu_altp2m(curr).veinfo_gfn = G
     altp2m_vcpu_update_vmfunc_ve()

4. HVMOP_altp2m_set_domain_state(false)
     set d->arch.altp2m_active = false
     for each vcpu V:
        altp2m_vcpu_destroy()
          reset (av->p2midx = INVALID_ALTP2M,
                 av->veinfo_gfn = INVALID_GFN)
          altp2m_vcpu_update_p2m(V)
              ****** Does not update VMCS because altp2m_active() evals to
false *****

Now the software (Xen) thinks altp2m is disabled, but the hardware has
these features registered/enabled:
   VM_FUNCTION_CONTROL
   EPTP_LIST_ADDR
   VIRT_EXCEPTION_INFO

5. HVMOP_altp2m_set_domain_state(true)
      see above

6. HVMOP_altp2m_vcpu_enable_notify(not INVALID_GFN):
     checks: only toggling between INVALID_GFN and another value is
permitted
       -succeeds because reset() was called above
     set vcpu_altp2m(curr).veinfo_gfn = G
     altp2m_vcpu_update_vmfunc_ve()

I claim that something in step 6 causes an unhandled exception. Please note
that the guest does not register a #VE ISR.

Kind regards,
Matt Leinhos

--0000000000002e7aea058691b505
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Greetings,</div><div dir=3D"ltr"><br></di=
v><div dir=3D"ltr">I&#39;ve found a way to crash a host from a misbehaving =
guest,=20
using altp2m. This is on a recent Intel core i7 chip. I&#39;ve crashed two=
=20
systems running 4.11.1. This behavior is not exhibited on 4.12, and since a=
ltp2m is a tech preview in 4.11.1, this is not covered by security support.=
 However, I believe that the divergence between software and hardware state=
, as mentioned below, is still present in 4.12.<br><br>On Xen 4.11.1 with a=
ltp2m enabled, follow these steps in the guest, whose config file includes =
`altp2m =3D &quot;mixed&quot;:<br>1. Allocate page P (GFN G)<br>2. Enable a=
ltp2m<br>3. Enable #VE notification, setting to G<br>4. Disable altp2m<br>5=
. Enable altp2m<br>6. Enable #VE notification, setting to G<br><br>At
 this point the entire system is unresponsive; #6 does not return=20
control to the guest. Note that step 3 is required, thus indicating some
 incomplete cleanup after 4 that leads to a crash at 6. I&#39;ve noticed a=
=20
problem in the Xen source at step 4, where the software and hardware=20
states diverge. See below for my notes on pertinent code. <br></div><div di=
r=3D"ltr"><br></div><div dir=3D"ltr">I
 hope this is helpful and would appreciate it if you could fill me in on
 why the entire host goes down - I suspect Xen is interacting with the=20
VMCS incorrectly, but I don&#39;t know the details and would like to=20
understand.<br><br>1. Allocate page P (GFN G)<br><br>2. HVMOP_altp2m_set_do=
main_state(true)<br>=C2=A0=C2=A0=C2=A0 set d-&gt;arch.altp2m_active =3D tru=
e<br>=C2=A0=C2=A0=C2=A0 if first time:<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 p2m_init_altp2m_by_id()<br>=C2=A0=C2=A0=C2=A0 for each vcpu V:<br>=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 altp2m_vcpu_initialise(V)<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reset (av-&gt;p2midx =3D INVALID=
_ALTP2M,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 av-&gt;veinfo_gfn =3D INVALID_GFN)<br>=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 altp2m_vcpu_update_p2m(=
V)<br><br>3. HVMOP_altp2m_vcpu_enable_notify(G)<br>=C2=A0=C2=A0=C2=A0=C2=A0=
 checks: only toggling between INVALID_GFN and another value is permitted<b=
r>=C2=A0=C2=A0=C2=A0=C2=A0 set vcpu_altp2m(curr).veinfo_gfn =3D G<br>=C2=A0=
=C2=A0=C2=A0=C2=A0 altp2m_vcpu_update_vmfunc_ve()<br><br>4. HVMOP_altp2m_se=
t_domain_state(false)<br>=C2=A0=C2=A0=C2=A0=C2=A0 set d-&gt;arch.altp2m_act=
ive =3D false<br>=C2=A0=C2=A0=C2=A0=C2=A0 for each vcpu V:<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 altp2m_vcpu_destroy()<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reset (av-&gt;p2midx =3D INVALID_ALTP2=
M,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 av-&gt;veinfo_gfn =3D INVALID_GFN)<br>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 altp2m_vcpu_update_p2m(V)<br>=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ****** Does not update VMCS because altp2m_active() evals to false ****=
*<br><br>Now the software (Xen) thinks altp2m is disabled, but the hardware=
 has these features registered/enabled:<br>=C2=A0=C2=A0 VM_FUNCTION_CONTROL=
<br>=C2=A0=C2=A0 EPTP_LIST_ADDR<br>=C2=A0=C2=A0 VIRT_EXCEPTION_INFO<br><br>=
5. HVMOP_altp2m_set_domain_state(true)<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 se=
e above<br><br>6. HVMOP_altp2m_vcpu_enable_notify(not INVALID_GFN):<br>=C2=
=A0=C2=A0=C2=A0=C2=A0 checks: only toggling between INVALID_GFN and another=
 value is permitted<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -succeeds becau=
se reset() was called above<br>=C2=A0=C2=A0=C2=A0=C2=A0 set vcpu_altp2m(cur=
r).veinfo_gfn =3D G<br>=C2=A0=C2=A0=C2=A0=C2=A0 altp2m_vcpu_update_vmfunc_v=
e()<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">I claim that somet=
hing in step 6 causes an unhandled exception. Please note that the guest do=
es not register a #VE ISR.<br><br></div><div>Kind regards,</div><div>Matt L=
einhos</div></div>

--0000000000002e7aea058691b505--


--===============6723911994843986981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6723911994843986981==--
