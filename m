Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A15CCF2E5
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 14:27:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454486.1668086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIoKq-0004Wd-If; Mon, 19 Oct 2026 14:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454486.1668086; Mon, 19 Oct 2026 14:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIoKq-0004WS-Dn; Mon, 19 Oct 2026 14:27:32 +0000
Received: by outflank-mailman (input) for mailman id 1454486;
 Mon, 19 Oct 2026 14:27:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1548f6f6b0008425@swg.vates.tech>)
 id 1xIoKp-0004WJ-KX
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 14:27:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIoKp-001pmv-1H
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 16:27:31 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1548f6f6b0008425@swg.vates.tech>)
 id 6ad628cb-e002-0a2a0a5209dd-0a2a4503e018-12
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 16:27:31 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1548f6f6b0008425@swg.vates.tech>)
 id 6ad628d2-fae8-0a2a45030019-b9ff1c2292e7-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 16:27:30 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1548f6f6b0008425.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 19 Oct 2026 14:27:28 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id DD8A2829FA;
 Mon, 19 Oct 2026 16:27:27 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=CSqTWT9O4AN5Pn94F26K+Izpn2bO0zKDtNnTH+vptz0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=ItzkLVUTHf/cNN3if+V5qOeQ/wbQB2OtdE3/Aejmu3K8vYXSqI+QeMifk3QEjXXT0iRCv8I8G
 UkZhjBUcjBWV0tDzQ6/LO5DkKVMf213h0t3JNddT1QxcjFUmlbiirL+f4owM2gqdvVBiu8Y2EjY
 y0MB3dP38PYYNaGQJ2OP8oUNA9meTQh/k4PqDj1mJiLStovmtCZgaXniMY7TTp5fp8x75iLijvP
 OV3169+cIAWVca3IsPTTQHwK/aXwjDuk8djfOLo412FAw5dPzq3T3UTamU7Vg1EvkQwcw8uetuN
 e97NSpNJZZIHiLt50FMq7PsQs94WsI49Drv0BBB1qMgA==
X-Zone-Loop: 7684ba8958ab24e90c989a3cc69616dca2d23fd3787f
x-campaign-type: default
x-transaction-id: f4ba99b6-ee6b-4a01-8649-ee60ebc11ab7
x-swg-uid: 01-f3ac00ad-cc2f-48d7-9af6-246821cf4ede
X-Mailer: Sweego
Message-ID:
 <1792420048.8631fc262581453bbf619ec5b2062170.1a1548f6f6b0008425@vates.tech>
x-swg-bid: 1792420048.8631fc262581453bbf619ec5b2062170.1a1548f6f6b0008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [PATCH] x86/vlapic: Don't change ICR on x2APIC SELF_IPI write
Date: Mon, 19 Oct 2026 16:26:36 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.35f.bcdda06206fca13e.1a1548f6ca8.e995f4750d9dae5=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792420048040
X-purgate-ID: tlsNG-33051d/1792420050-764FC4E9-3E0B8FDA/0/0
X-purgate-type: clean
X-purgate-size: 2887

---=Part.35f.bcdda06206fca13e.1a1548f6ca8.e995f4750d9dae5=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Intel SDM (Vol 3A-13=2E12=2E11, June 2026) says

> The semantics of sending a self-IPI via the SELF IPI register
> are identical to sending a self targeted edge triggered fixed
> interrupt with the specified vector=2E

However, this is not expected to alter the ICR register=2E

Fix the Xen behavior by sending the Self-IPI directly instead of
emulating it by modifying ICR register=2E

Fixes: 21c4d089ba2a ("x86 hvm: x2APIC emulation")
Assisted-by: Claude Fable 5=2E1
Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
Linux/KVM has a similar patch :

KVM: x86: Do not change ICR on write to APIC_SELF_IPI
https://github=2Ecom/torvalds/linux/commit/d22a81b304a27fca6124174a8e842e8=
26c193466

 xen/arch/x86/hvm/vlapic=2Ec | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic=2Ec b/xen/arch/x86/hvm/vlapic=2Ec
index 885f5d304b=2E=2Ebb105225e2 100644
--- a/xen/arch/x86/hvm/vlapic=2Ec
+++ b/xen/arch/x86/hvm/vlapic=2Ec
@@ -963,6 +963,17 @@ static int cf_check vlapic_mmio_write(
     return X86EMUL_OKAY;
 }
=20
+/*
+ * A write to the SELF IPI register sends a fixed, edge triggered IPI wit=
h
+ * the given vector to the local APIC itself=2E  Unlike an ICR write it d=
oesn't
+ * update the ICR, which is guest visible, in x2APIC mode even without an=
y
+ * intervention by Xen when APIC-register virtualization is in use=2E
+ */
+static void vlapic_self_ipi(struct vlapic *vlapic, uint32_t val)
+{
+    vlapic_ipi(vlapic, APIC_DEST_SELF | (val & APIC_VECTOR_MASK), 0);
+}
+
 int vlapic_apicv_write(struct vcpu *v, unsigned int offset)
 {
     struct vlapic *vlapic =3D vcpu_vlapic(v);
@@ -973,8 +984,9 @@ int vlapic_apicv_write(struct vcpu *v, unsigned int of=
fset)
         if ( offset !=3D APIC_SELF_IPI )
             return X86EMUL_UNHANDLEABLE;
=20
-        offset =3D APIC_ICR;
-        val =3D APIC_DEST_SELF | (val & APIC_VECTOR_MASK);
+        vlapic_self_ipi(vlapic, val);
+
+        return X86EMUL_OKAY;
     }
=20
     vlapic_reg_write(v, offset, val);
@@ -1050,9 +1062,8 @@ int guest_wrmsr_x2apic(struct vcpu *v, uint32_t msr,=
 uint64_t val)
     case APIC_SELF_IPI:
         if ( val & ~APIC_VECTOR_MASK )
             return X86EMUL_EXCEPTION;
-        offset =3D APIC_ICR;
-        val =3D APIC_DEST_SELF | (val & APIC_VECTOR_MASK);
-        break;
+        vlapic_self_ipi(vlapic, val);
+        return X86EMUL_OKAY;
=20
     case APIC_EOI:
     case APIC_ESR:
--=20
2=2E56=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.35f.bcdda06206fca13e.1a1548f6ca8.e995f4750d9dae5=---

