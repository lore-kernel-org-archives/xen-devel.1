Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0BCC624A4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 14:14:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407255.1640336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28Cr-0005EJ-E0; Thu, 03 Sep 2026 14:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407255.1640336; Thu, 03 Sep 2026 14:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x28Cr-0005EC-BC; Thu, 03 Sep 2026 14:14:21 +0000
Received: by outflank-mailman (input) for mailman id 1407255;
 Thu, 03 Sep 2026 14:14:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679ecc95000c4f3@swg.vates.tech>)
 id 1x28Cq-0005E6-8q
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 14:14:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x28Cp-007l5G-Fy
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 16:14:19 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679ecc95000c4f3@swg.vates.tech>)
 id 6a9980bb-e002-0a2a0a5209dd-0a2a4502ed04-4
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:14:19 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679ecc95000c4f3@swg.vates.tech>)
 id 6a9980bb-6ca4-0a2a45020019-b9ff1c22a33f-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:14:19 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0679ecc95000c4f3.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 03 Sep 2026 14:14:15 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id CA78F83FF2;
 Thu,  3 Sep 2026 16:14:14 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=AZvC+bc7Rv16uKzN3ihkV/oSvkk6tH0QJHksWVaFqwg=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=nfBm8a2r+v8k2jTuP+btTUtJmr6JGra3XeGqzxYuVwWGZB2qDAwJzL3223h7XTzshP64V71DW
 o/KpL5QyBcCEeKeZ53Y1/DCV6mc/HL3ss3f0tKYH4qgKBSp0LE4PPSs1+Or7SBt02bzmNJSB8mL
 0hgGNv1h8DruoKtIphBWe5IvmOwoaEF6UVItCA3AvgOn6FmLYFm/ZkPi54xpJM7pIR8DNo+fup7
 cdrUCtt9yrMFDR4kHj5ldBEQhrZHVpr1Hau8lEXiBHtX4tz+7LsxIhbJobmT8XP8CWUgSMMTsp3
 OU5toNukl9813kaYIEUYZiJ1I55xqGuYgGb4gdGlKuWQ==
X-Zone-Loop: c7255c66a8cde000f0d3f03de70656fe9edd765119b3
x-campaign-type: default
x-transaction-id: 299ef29c-5d39-4dd9-8576-84dec8e8c7a6
x-swg-uid: 01-699fc82e-4a5d-4ca2-a927-a03bfb769b8d
X-Mailer: Sweego
Message-ID:
 <1788444855.8631fc262581453bbf619ec5b2062170.1a0679ecc95000c4f3@vates.tech>
x-swg-bid: 1788444855.8631fc262581453bbf619ec5b2062170.1a0679ecc95000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH v5 01/11] x86/vioapic: Add ioapic_check() to validate IO-APIC state before restore
Date: Thu,  3 Sep 2026 16:13:59 +0200
In-Reply-To: <1788444605.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@vates.tech>
References: <1788444605.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.35a4.21631d333167ec9d.1a0679ecb06.d028971a7c8c5bc6=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788444855046
X-purgate-ID: tlsNG-720697/1788444859-319CB2AC-9CC873AE/0/0
X-purgate-type: clean
X-purgate-size: 4379

---=Part.35a4.21631d333167ec9d.1a0679ecb06.d028971a7c8c5bc6=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Register a check callback for the IOAPIC HVM save/restore entry,
following the pattern established by vpic_check() for the virtual PIC=2E
The function first verifies the target domain actually has a virtual
IO-APIC, returning -ENODEV otherwise=2E It then validates individual
fields of the saved state: base_address must be non-zero, page-aligned,
and leave room for the MMIO window below the domain's physical address
limit=2E The APIC ID must fit the 4-bit field vioapic_write_indirect()
stores and no redirection table entry may carry a delivery_status bit,
which is read-only and always cleared on a guest write=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v5:
- The check now verifies base_address is page-alignment and
  hap_paddr_bits and not just "!=3D 0"=2E
- The APIC ID is bounded by the IO_APIC_reg_02 field and not a
  hard-coded 0xf (added comment)=2E
- Replaced the ioregsel check with a loop rejecting any entry that has
  delivery_status set=2E
- Commit message rewritten=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
 xen/arch/x86/hvm/vioapic=2Ec | 44 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vioapic=2Ec b/xen/arch/x86/hvm/vioapic=2Ec
index 222e59e2c2=2E=2E80dc9148a9 100644
--- a/xen/arch/x86/hvm/vioapic=2Ec
+++ b/xen/arch/x86/hvm/vioapic=2Ec
@@ -323,6 +323,7 @@ static void vioapic_write_indirect(
          * Presumably because we emulate an Intel IOAPIC which only has a
          * 4 bit ID field (compared to 8 for AMD), using union IO_APIC_re=
g_02
          * for the ID register (union IO_APIC_reg_00's ID field is 8 bits=
)=2E
+         * ioapic_check() validates the saved id field accordingly=2E
          */
         vioapic->id =3D ((union IO_APIC_reg_02){ =2Eraw =3D val })=2Ebits=
=2Earbitration;
         break;
@@ -595,6 +596,47 @@ int vioapic_get_trigger_mode(const struct domain *d, =
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
+    /*
+     * base_address must be non-zero, page-aligned (hardware constraint),=
 and
+     * within the guest's physical address space (with room for the full =
MMIO
+     * window)=2E
+     */
+    if ( !s->base_address ||
+         !IS_ALIGNED(s->base_address, PAGE_SIZE) ||
+         s->base_address > (1ULL << hap_paddr_bits) - VIOAPIC_MEM_LENGTH =
)
+        return -EINVAL;
+
+    /*
+     * vioapic_write_indirect() stores only the 4-bit arbitration field o=
f
+     * IO_APIC_reg_02 as the APIC ID=2E See that function's comment for w=
hy
+     * IO_APIC_reg_02 is used rather than IO_APIC_reg_00=2E
+     */
+    if ( s->id > ((union IO_APIC_reg_02){ =2Eraw =3D ~0U })=2Ebits=2Earbi=
tration )
+        return -EINVAL;
+
+    /*
+     * Reject redirection table entries carrying bits that
+     * vioapic_write_redirent() would never store: delivery_status is rea=
d-only
+     * and always cleared on a guest write=2E
+     */
+    for ( unsigned int i =3D 0; i < ARRAY_SIZE(s->redirtbl); i++ )
+        if ( s->redirtbl[i]=2Efields=2Edelivery_status )
+            return -EINVAL;
+
+    return 0;
+}
+
 static int cf_check ioapic_save(struct vcpu *v, hvm_domain_context_t *h)
 {
     const struct domain *d =3D v->domain;
@@ -631,7 +673,7 @@ static int cf_check ioapic_load(struct domain *d, hvm_=
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
---=Part.35a4.21631d333167ec9d.1a0679ecb06.d028971a7c8c5bc6=---

