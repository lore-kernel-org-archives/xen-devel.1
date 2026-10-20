Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2E9606A321
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 18:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kOYevv0r
Received: from list by lists.xenproject.org with outflank-mailman.1456143.1669677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJEsl-00076V-1s; Tue, 20 Oct 2026 18:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456143.1669677; Tue, 20 Oct 2026 18:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJEsk-00076O-Uc; Tue, 20 Oct 2026 18:48:18 +0000
Received: by outflank-mailman (input) for mailman id 1456143;
 Tue, 20 Oct 2026 18:48:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <shentey@gmail.com>) id 1xJEsj-00076I-R7
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 18:48:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJEsi-00GFvr-U2
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 20:48:16 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <shentey@gmail.com>)
 id 6ad7b741-bab6-0a2a0a5309dd-0a2a45099b58-40
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 20:48:16 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <shentey@gmail.com>)
 id 6ad7b770-be1a-0a2a45090019-d155dd33b99f-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 20:48:16 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-48e0d885929so2775928f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 11:48:16 -0700 (PDT)
Received: from ehlo.thunderbird.net
 (dynamic-2a02-3100-18af-d500-ec6b-a832-f355-434e.310.pool.telefonica.de.
 [2a02:3100:18af:d500:ec6b:a832:f355:434e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e2584afe1sm183030f8f.56.2026.10.20.11.48.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2026 11:48:15 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792522096; x=1793126896; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6FwV03BnljHvrYkJf+lErNTezJD62CanPfxXQ6NNZ5U=;
        b=kOYevv0r3Rb0nEI6cH6T4ZJqwv5Zc38Gfd9dY6usBSIXnl2xQCCb7saXki+JyeO59d
         ewir+Sh2XRWvr2IKU/mdI3sjB6CQn2IKtUrO5w+AehTsIbjvblBDGl1AqKfPU7UAq2bi
         lVCHKzUmgoQZf3c5ieAEM6QMPZrytjGB0IMLdh80fq+g1IsZ86O90NReF4BA1iwDizmO
         bJQNlNtO30CeS+9ZeUATMJRdScNUddXJFZWMsgv2lnntmJzubeDUob5JlASBGI4+eyo2
         l317n94PNB8CorLnxxnOdIUNjT+TuStgZP4bkVXoWPT9Tw0EvoWHDKF8OalBrdiWS66y
         wZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792522096; x=1793126896;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6FwV03BnljHvrYkJf+lErNTezJD62CanPfxXQ6NNZ5U=;
        b=AZkqw2B1+Me6wDik1gLeJmrdkjBKo+YEiKAKRg/sxw0S+oNRCuyB35Y+AMioyMqzDY
         TxO+1wOeuiyo7Inc4uiRmhiOYFhAUN/HsLkqSn9NfHByWLGPgKubIv7sF9HqXRmBYy3h
         wg3fw4cL4aNh1vqvn5FQHbxHrPzbDJ/U5kYAcv00ADL3JYWK3NkQaO4qiwHNzDkG6aS+
         3Lr/9BhJyuhao0MRbTd1R1u5PAet8CQAdmmPoCAnjowbqGetCo6A7hOSoWGWH+YSBuB5
         JeaX7rY/bFtfWn19DCZ1oIA+fuNKCuyStL5duNsJ6oVlW+cOz1RTR5ZQSk5Hdk7GDV06
         8ffA==
X-Forwarded-Encrypted: i=1; AKwUvByqr4YLQhL34JWmKkXDnc22CC1PoxcrsYMgM75FTslT9VElz7rSc7yEN/v2cSa9LVPEofItuEm8ZWQ=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLR2OtPzmNyi/I6kxgiegqKjXQRih8qbtQVg86KgVrRZDqMc7Jc
	mGIEO6InlRIt8Zl+99ODLO5FFs5fVh8Bg1Rhx3kLePQiassbTT+1gXJv
X-Gm-Gg: AYBFou1MVnu677bdLPQxCrlPTQn9M57NO7mH68pE8HZ661wGo4HFFcjkyJMwyV5k/cg
	GycinbgAJnlp34TSG54SLglyFaAfgqA+1CfMb6ALimF0jWkIR1SPyZyHcYwLOcUZ7ioyhJQH/Wv
	tQ4/mCvGyYBdvva4uBc+jO4SCJMQT09DaHNiOz0Uk3bD/akxw+9cC0nhn/9WS0rcK5NUsrbgojg
	9czEiA71nmAMuUyuGixrte0d4J7/2FNTR4NXkD+3cT1Q0CXEsEZwFTGtD7Y0KW32DBaugrjjr54
	GRG8EvkP0itRWrhkFvkWrlAqnADr382OuzrPKLzVk1YUEKAR4+YJz7XBwmOwFTSErhf+nJimiZ4
	cweu4cQ/v7VlYrCexBJ57C7/5W71efU+I5JN/QfV0NkrjinojGOPhUboVc3PhQd2gchs2Uv2n54
	7Sq4T3etr5E3z8C0iiCUHRDUEdp3n7TCJpbkYT2z/pdWq79Phg1PyyKE0YeBc7Vul1X5LcnQZDG
	huhp235mPb/Ge2V7wcMhqgp5nzVy4BTDzC8Q3CBAag7LUSOSioUt+8hdsaJRuGewV83Z9fYHu7a
	Nx87/3Wx3qpap22PJJc=
X-Received: by 2002:a05:6000:4a0a:b0:48d:f14a:9183 with SMTP id ffacd0b85a97d-48e07bbc619mr25855899f8f.15.1792522095942;
        Tue, 20 Oct 2026 11:48:15 -0700 (PDT)
Date: Tue, 20 Oct 2026 17:39:39 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com,
 sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com,
 xen-devel@lists.xenproject.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_22/28=5D_xen-hvm=2Ec=3A_rename_xen=5Fin?=
 =?US-ASCII?Q?terrupt=5Fcontroller=5Fini?=
 =?US-ASCII?Q?t=28=29_to_xen=5Fi8259=5Finit=28=29?=
In-Reply-To: <20261019120517.1448687-23-mark.caveayland@nutanix.com>
References: <20261019120517.1448687-1-mark.caveayland@nutanix.com> <20261019120517.1448687-23-mark.caveayland@nutanix.com>
Message-ID: <22FB9414-4D72-4699-9FB4-107D9DF10F28@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-bad1c0/1792522096-BEEDE034-C179D0D4/0/0
X-purgate-type: clean
X-purgate-size: 2717
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



Am 19=2E Oktober 2026 12:04:54 UTC schrieb Mark Cave-Ayland <mark=2Ecaveay=
land@nutanix=2Ecom>:
>This clarifies that the interrupt controller being modelled is an emulate=
d
>i8259 implementation, and brings the naming convention in line with the
>in-built i8259 and KVM i8259 implementations=2E
>
>Signed-off-by: Mark Cave-Ayland <mark=2Ecaveayland@nutanix=2Ecom>
>Reviewed-by: Peter Maydell <peter=2Emaydell@linaro=2Eorg>
>---
> include/hw/xen/xen=2Eh  | 2 +-
> hw/i386/pc=2Ec          | 2 +-
> hw/i386/xen/xen-hvm=2Ec | 2 +-
> stubs/xen-hw-stub=2Ec   | 2 +-
> 4 files changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/include/hw/xen/xen=2Eh b/include/hw/xen/xen=2Eh
>index e94c6e5a31=2E=2Eee4ed4f11b 100644
>--- a/include/hw/xen/xen=2Eh
>+++ b/include/hw/xen/xen=2Eh
>@@ -42,7 +42,7 @@ void xen_intx_set_irq(void *opaque, int irq_num, int le=
vel);
> void xen_hvm_inject_msi(uint64_t addr, uint32_t data);
> int xen_is_pirq_msi(uint32_t msi_data);
>=20
>-qemu_irq *xen_interrupt_controller_init(void);
>+qemu_irq *xen_i8259_init(void);
>=20
> void xen_register_framebuffer(struct MemoryRegion *mr);
>=20
>diff --git a/hw/i386/pc=2Ec b/hw/i386/pc=2Ec
>index 2d8c87b0e3=2E=2Edbfd55de30 100644
>--- a/hw/i386/pc=2Ec
>+++ b/hw/i386/pc=2Ec
>@@ -1167,7 +1167,7 @@ void pc_i8259_create(ISABus *isa_bus, qemu_irq *i82=
59_irqs)
>     if (kvm_pic_in_kernel()) {
>         i8259 =3D kvm_i8259_init(isa_bus);
>     } else if (xen_enabled()) {
>-        i8259 =3D xen_interrupt_controller_init();
>+        i8259 =3D xen_i8259_init();
>     } else {
>         i8259 =3D i8259_init(isa_bus, x86_allocate_cpu_irq());
>     }
>diff --git a/hw/i386/xen/xen-hvm=2Ec b/hw/i386/xen/xen-hvm=2Ec
>index d3ce082e07=2E=2Eaf3a90987c 100644
>--- a/hw/i386/xen/xen-hvm=2Ec
>+++ b/hw/i386/xen/xen-hvm=2Ec
>@@ -112,7 +112,7 @@ static void xen_set_irq(void *opaque, int irq, int le=
vel)
>     xen_set_isa_irq_level(xen_domid, irq, level);
> }
>=20
>-qemu_irq *xen_interrupt_controller_init(void)
>+qemu_irq *xen_i8259_init(void)
> {
>     return qemu_allocate_irqs(xen_set_irq, NULL, 16);

Since this function allocates 16 IRQs, the convention according to this se=
ries would be xen_i8259_pic_init(), no?

Otherwise, much appreciated clarification of the terminology=2E

Best regards,
Bernhard

> }
>diff --git a/stubs/xen-hw-stub=2Ec b/stubs/xen-hw-stub=2Ec
>index 6cf0e9a4c1=2E=2Eb3e27f0292 100644
>--- a/stubs/xen-hw-stub=2Ec
>+++ b/stubs/xen-hw-stub=2Ec
>@@ -29,7 +29,7 @@ int xen_is_pirq_msi(uint32_t msi_data)
>     return 0;
> }
>=20
>-qemu_irq *xen_interrupt_controller_init(void)
>+qemu_irq *xen_i8259_init(void)
> {
>     return NULL;
> }

