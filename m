Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719C6C44512
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 14:12:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364095.1615450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkMof-0003qi-5C; Thu, 16 Jul 2026 14:11:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364095.1615450; Thu, 16 Jul 2026 14:11:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkMof-0003qb-19; Thu, 16 Jul 2026 14:11:57 +0000
Received: by outflank-mailman (input) for mailman id 1364095;
 Thu, 16 Jul 2026 14:11:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f6b44e427000edb5@swg.vates.tech>)
 id 1wkMoe-0003qH-By
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 14:11:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkMod-006m7b-Ov
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 16:11:55 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f6b44e427000edb5@swg.vates.tech>)
 id 6a58e6a0-5cb7-0a2a0a5109dd-0a2a4506d8c4-46
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 16:11:55 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f6b44e427000edb5@swg.vates.tech>)
 id 6a58e6a8-195a-0a2a45060019-b9ff1c238695-4
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 16:11:55 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f6b44e427000edb5.00b for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 16 Jul 2026 14:11:44 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 18DA5829A9;
 Thu, 16 Jul 2026 16:11:44 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=edupbGSUmMSWQiuMsFe5V4eUJW0PMMqnqhABXS2jGos=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=CUYIXBienqD7xOdLgngMakNShgDQDmoKnFQiAif6h9p/hbueTjpplLgMPxSUIELfa0++nAhos
 qOIz6jO3U4YuvbIgkTN8yLCF0THmRHDlaD9O65DbGCUt+SwTsrDdwXaoZZ2qjagfU9EqIfZAmHf
 NrMECwIQb/SoEKyyH2XI7T5QSBLwLG+sF4V4axU6U+DWTX/+AWxdoAtEDTmd409U8Q0bnXXc1cQ
 UF0Lp10i74DgFMPomnMcAVbw6fu4WIwXePIRj4hjH7aMVm+L3L6hLBuZzlt1ydj1SATCCa2YQhp
 sXZwOzo2Xw6uWooAy8Q15tGwYPs7PHw+WhWE/FGjL6bg==
X-Zone-Loop: a50b8f6d5af10757614e9c388aaebafe49596fa72205
x-campaign-type: default
x-transaction-id: 55bfce5d-a1d5-4a89-be47-457076aff4ef
x-swg-uid: 01-595250c2-7473-4b88-a942-997d6778484f
X-Mailer: Sweego
Message-ID:
 <1784211104.8631fc262581453bbf619ec5b2062170.19f6b44e427000edb5@vates.tech>
x-swg-bid: 1784211104.8631fc262581453bbf619ec5b2062170.19f6b44e427000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Andrii Sultanov <andriy.sultanov@vates.tech>,
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v3 2/6] ARM/sysctl: Expose the supported guest GIC modes in physinfo
Date: Thu, 16 Jul 2026 16:11:34 +0200
In-Reply-To: <20260716141138.88265-1-julian.vetter@vates.tech>
References: <1784210820.8631fc262581453bbf619ec5b2062170.19f6b408bba000edb5@vates.tech>
 <20260716141138.88265-1-julian.vetter@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.a08.93ea2e18d98349b0.19f6b44e27a.74101307e36426b1=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1784211104379
X-purgate-ID: tlsNG-16d1c6/1784211115-F647377B-9C2BF7C1/0/0
X-purgate-type: clean
X-purgate-size: 2633

---=Part.a08.93ea2e18d98349b0.19f6b44e27a.74101307e36426b1=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>

Signed-off-by: Andrew Cooper <andrew=2Ecooper3@citrix=2Ecom>
---
Changes in v3:
- No changes
---
 xen/arch/arm/sysctl=2Ec       | 26 ++++++++++++++++++++++++++
 xen/include/public/sysctl=2Eh |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/xen/arch/arm/sysctl=2Ec b/xen/arch/arm/sysctl=2Ec
index 32cab4feff=2E=2E3b0edf4cec 100644
--- a/xen/arch/arm/sysctl=2Ec
+++ b/xen/arch/arm/sysctl=2Ec
@@ -12,7 +12,10 @@
 #include <xen/dt-overlay=2Eh>
 #include <xen/errno=2Eh>
 #include <xen/hypercall=2Eh>
+
 #include <asm/arm64/sve=2Eh>
+#include <asm/gic=2Eh>
+
 #include <public/sysctl=2Eh>
=20
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
@@ -21,6 +24,29 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
=20
     pi->arch_capabilities |=3D MASK_INSR(sve_encode_vl(get_sys_vl_len()),
                                        XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
+
+    /*
+     * The GIC version(s) we're happy creating guests with=2E  Right now =
for
+     * simplicity it is tied to the active hardware version, but this wil=
l
+     * cease to be the case if/when the compatbility modes are enabled=2E
+     */
+    switch ( gic_hw_version() )
+    {
+    case GIC_V2:
+        pi->arch_capabilities |=3D XEN_SYSCTL_PHYSCAP_ARM_GIC_V2;
+        break;
+
+    case GIC_V3:
+        pi->arch_capabilities |=3D XEN_SYSCTL_PHYSCAP_ARM_GIC_V3;
+        break;
+
+    case GIC_INVALID:
+        /*
+         * Running a control domain without having the GIC sorted yet?
+         * Something's broken, but there's nothing we can do about it her=
e=2E
+         */
+        break;
+    }
 }
=20
 long arch_do_sysctl(struct xen_sysctl *sysctl,
diff --git a/xen/include/public/sysctl=2Eh b/xen/include/public/sysctl=2Eh
index c7cd9b4eb0=2E=2Ed20ebf3644 100644
--- a/xen/include/public/sysctl=2Eh
+++ b/xen/include/public/sysctl=2Eh
@@ -106,6 +106,8 @@ struct xen_sysctl_tbuf_op {
=20
 #if defined(__arm__) || defined(__aarch64__)
 #define XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK  (0x1FU)
+#define XEN_SYSCTL_PHYSCAP_ARM_GIC_V2    (1U << 5)
+#define XEN_SYSCTL_PHYSCAP_ARM_GIC_V3    (1U << 6)
 #endif
=20
 struct xen_sysctl_physinfo {
--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.a08.93ea2e18d98349b0.19f6b44e27a.74101307e36426b1=---

