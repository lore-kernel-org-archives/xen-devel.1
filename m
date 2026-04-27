Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43495FF886B
	for <xen-devel@archiver.kernel.org>; Mon, 27 Apr 2026 13:55:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1294882.1571593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHMQG-0000II-IG; Mon, 27 Apr 2026 13:54:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294882.1571593; Mon, 27 Apr 2026 13:54:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHMQG-0000IB-FL; Mon, 27 Apr 2026 13:54:52 +0000
Received: by outflank-mailman (input) for mailman id 1294882;
 Mon, 27 Apr 2026 13:54:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf387cf6000f373@swg.vates.tech>)
 id 1wHMQF-0000Hk-0a
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 13:54:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHMQE-00G6M2-Dp
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 15:54:50 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf387cf6000f373@swg.vates.tech>)
 id 69ef6aa6-5cb7-0a2a0a5109dd-0a2a450ab84c-14
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 15:54:50 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19dcf387cf6000f373@swg.vates.tech>)
 id 69ef6aa4-56b3-0a2a450a0019-b9ff1c22a053-4
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 15:54:49 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19dcf387cf6000f373.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 27 Apr 2026 13:54:38 +0000
Received: from julian.home (lfbn-lyo-1-414-55.w2-7.abo.wanadoo.fr [2.7.24.55])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 5C6458716C;
 Mon, 27 Apr 2026 15:54:38 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=dvcC1iisULiPGWL7tx4WZYzH+K5ni031hXxYUXeM9FA=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=nndc5iGA0DiGhtyIMk+zUdFKEvRAZcfMef0krlgqTReFVE8KCTMfzyDGLs5muIK6t/oE0cpyW
 jG4XX+kZNeRbrXdsdkobcC+1mlLW1WAoawQKEB/uExnAIBG7cNI5/jHL0z5DkXq6x9Y8oWeDE5T
 dieOm4qOzeQYUyBPKfdJSGlrEdMsnuOq8FoMz2ton8J9c69kv+RGR8Q1nqO0TRXcY/9ZLilHkBa
 nxYJUL1OdNyvkSt84TNZYD83mTstQJXA/y7AHyz0AFPe5tEoUvZwuoxW3L/qfgWRRHqBJAPwSeT
 pj0u8Zgn5LRuHOsxmZdXNGGiFjESbJltSPLH178rklNQ==
X-Zone-Loop: 5f20e55a77209d63970ab23c5d2a2c0c952228caec54
x-campaign-type: default
x-transaction-id: ad1e73c4-1169-40cf-a79e-c5e95a7fd737
x-swg-uid: 01-252a6e3d-1633-4718-85f7-c25b1dcf860e
X-Mailer: Sweego
Message-ID:
 <1777298079.8631fc262581453bbf619ec5b2062170.19dcf387cf6000f373@vates.tech>
x-swg-bid: 1777298079.8631fc262581453bbf619ec5b2062170.19dcf387cf6000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH v4 1/9] x86/vioapic: Add ioapic_check() to validate IO-APIC state before restore
Date: Mon, 27 Apr 2026 15:53:58 +0200
In-Reply-To: <20260427135406.1281424-1-julian.vetter@vates.tech>
References: <20260427135406.1281424-1-julian.vetter@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2973.a4b8ae2b085a49c6.19dcf387b7f.2f2b4e9391e281cb=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777298078591
X-purgate-ID: tlsNG-4011c0/1777298089-47D788B7-C3FFF285/0/0
X-purgate-type: clean
X-purgate-size: 3106

---=Part.2973.a4b8ae2b085a49c6.19dcf387b7f.2f2b4e9391e281cb=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Register a check callback for the IOAPIC HVM save/restore entry,
following the pattern established by vpic_check() for the virtual PIC=2E
The function first verifies the target domain actually has a virtual
IO-APIC, returning -ENODEV otherwise=2E It then validates individual
fields of the saved state: the base_address must be non-zero (as 0 is
never valid for the IO-APIC MMIO window), the APIC ID must fit within
its 4-bit hardware field, and ioregsel must address a defined register=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v4:
- Replaced the reserved-bit loop from v3 (iterating all redirection
  table entries and rejecting any with non-zero reserved fields) with
  targeted named-field validation (base_address !=3D 0, APIC ID < 0xF, and
  ioregsel addresses a defined register)
- The extended-destination migration safety check (refusing to restore
  IO-APIC state with ext_dest_id bits set on a domain that does not
  advertise XEN_HVM_CPUID_EXT_DEST_ID) is added in patch 8, once the
  flag exists
---
 xen/arch/x86/hvm/vioapic=2Ec | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vioapic=2Ec b/xen/arch/x86/hvm/vioapic=2Ec
index 7c725f9e47=2E=2E43fb165f84 100644
--- a/xen/arch/x86/hvm/vioapic=2Ec
+++ b/xen/arch/x86/hvm/vioapic=2Ec
@@ -594,6 +594,32 @@ int vioapic_get_trigger_mode(const struct domain *d, =
unsigned int gsi)
     return vioapic->redirtbl[pin]=2Efields=2Etrig_mode;
 }
=20
+static int cf_check ioapic_check(const struct domain *d, hvm_domain_conte=
xt_t *h)
+{
+    const HVM_SAVE_TYPE(IOAPIC) *s;
+
+    if ( !has_vioapic(d) )
+        return -ENODEV;
+
+    s =3D hvm_get_entry(IOAPIC, h);
+    if ( !s )
+        return -ENODATA;
+
+    /* base_address of 0 is never valid for the IO-APIC MMIO window=2E */
+    if ( !s->base_address )
+        return -EINVAL;
+
+    /* IO-APIC APIC ID is a 4-bit field=2E */
+    if ( s->id > 0xf )
+        return -EINVAL;
+
+    /* ioregsel must address a defined register=2E */
+    if ( s->ioregsel > VIOAPIC_REG_RTE0 + (ARRAY_SIZE(s->redirtbl) - 1) *=
 2 + 1 )
+        return -EINVAL;
+
+    return 0;
+}
+
 static int cf_check ioapic_save(struct vcpu *v, hvm_domain_context_t *h)
 {
     const struct domain *d =3D v->domain;
@@ -630,7 +656,7 @@ static int cf_check ioapic_load(struct domain *d, hvm_=
domain_context_t *h)
     return 0;
 }
=20
-HVM_REGISTER_SAVE_RESTORE(IOAPIC, ioapic_save, NULL, ioapic_load, 1,
+HVM_REGISTER_SAVE_RESTORE(IOAPIC, ioapic_save, ioapic_check, ioapic_load,=
 1,
                           HVMSR_PER_DOM);
=20
 void vioapic_reset(struct domain *d)
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.2973.a4b8ae2b085a49c6.19dcf387b7f.2f2b4e9391e281cb=---

