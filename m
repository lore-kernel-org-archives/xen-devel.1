Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B800DC10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 13:34:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 834DB20833
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 13:34:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSXmqqe8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 834DB20833
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG1kW-0000rC-Hl; Mon, 15 Apr 2019 13:34:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HI6c=SR=gmail.com=matthew.leinhos@srs-us1.protection.inumbo.net>)
 id 1hG1kU-0000qn-Fu
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 13:34:14 +0000
X-Inumbo-ID: 27ce4e94-5f83-11e9-92d7-bc764e045a96
Received: from mail-wm1-x32b.google.com (unknown [2a00:1450:4864:20::32b])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 27ce4e94-5f83-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 13:34:13 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id c1so20670109wml.4
 for <xen-devel@lists.xenproject.org>; Mon, 15 Apr 2019 06:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=1sADA0ToQMIi1s9yNdCwZ90y1Sj/T02PTUgvrxxLsuw=;
 b=jSXmqqe86gQIXV6THPmUGpPUVyroVaHH9WjdkuLh428M9kFYda4OtE2VhmJNfEZOBS
 a5wsYpl5TWlAPDDvgcKbAuBeiyWpRBfZH5XI/jK6OQpFH2PEOCEAm0bXZHPZAIyp9YNw
 TLx5sTIP85fjsqmAuPi6uF0sld0SktS34yct937QZ84+RLvh4LAcjNUQJyJe+II8Mthi
 0PYxACmn3fDVtotS+vF05FoiLlJL0L+jD3FiucFD7ZXEW3YU2gfi/F+SlnREeLnX8ShR
 uQhaWRR27hQTdynEOJs/M9/ZEZk1HgsRjZSXnGoWS49HZe/gYb6nPabB3A0RBWtin4Vw
 Xv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=1sADA0ToQMIi1s9yNdCwZ90y1Sj/T02PTUgvrxxLsuw=;
 b=mb+tfyu8JNxN9cbEvNIR1K2aYxsgMPQJnRUCPHdNzulnT0lbzB0UJfMPcTG94dGNu9
 XNR9qrTaRW73qX5n8NuRcKaaeEfNs2vkoklHsZK1R3GLKKycAIKAMNuMo5V9+ZwqBEdU
 olimseOGrn89QVBK2NUucIzeEAt6jM/qUmBsGSwlyGtbh0tJff/30tPvdAIAfdIu6d4l
 Dw0fUDrvJHDxxwqcagKVyAIzAZd4QU6lQ6ri1YLM1kORclatMoIgfWbGpqMNIxwUI51n
 8QPbIByg5zG0zG77QBFv+ra3eg6eJBwtOfY5rbbWrjbzBIFVlqv5KpQcv4/nKLJyP9ax
 eGyg==
X-Gm-Message-State: APjAAAUAYb4oMBAR7F7AfS87Mn7jrTgzUAD1fJOXKYkioK4DSJmM3pZa
 NhQjFZ5bk5tf6nV1q5dLNvTemn41IBjocsQ+uHoYwKsy
X-Google-Smtp-Source: APXvYqyHg9TJnXiaxObAAO/6vqZWGdLQxw+7U+I482ErJyMuNYUVs6AtiUQFQZpA4KZ6svkARsxkDiJq8TZ0EPMHYN0=
X-Received: by 2002:a7b:c257:: with SMTP id b23mr21580334wmj.83.1555335251654; 
 Mon, 15 Apr 2019 06:34:11 -0700 (PDT)
MIME-Version: 1.0
From: Matt Leinhos <matthew.leinhos@gmail.com>
Date: Mon, 15 Apr 2019 08:34:00 -0500
Message-ID:
 <CAFLDOk8Egs_gJmx1Yg386eEkmq4gNcbBxVGkjC7Wofhz8zCe1w@mail.gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [Xen-devel] Xen 4.11.1: guest uses altp2m to crash host
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6723911994843986981=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415133400.-clUPqdla1LNttSi4zNvohpT4xBn8-nCD2hHfHTt1_s@z>

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

