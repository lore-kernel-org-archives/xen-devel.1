Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8833AF5A8BF
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2026 20:25:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1286477.1567554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBJ-0002PY-W3; Mon, 20 Apr 2026 20:25:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286477.1567554; Mon, 20 Apr 2026 20:25:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBJ-0002NW-Js; Mon, 20 Apr 2026 20:25:21 +0000
Received: by outflank-mailman (input) for mailman id 1286477;
 Mon, 20 Apr 2026 19:50:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEue0-0006IR-Iw
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:50:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEudz-00C1UM-WC
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:50:56 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e6835b-e002-0a2a0a5209dd-0a2a45099984-26
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:55 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e6839e-2497-0a2a45090019-22cac1c5a53c-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:55 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -306608446; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 19:50:49 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=purelymail1 header.d=purelymail.com header.i="@purelymail.com" header.h="Feedback-ID:Received:From:To:Subject:Date"
DKIM-Signature: a=rsa-sha256; b=g/JAHQ7kBhs1cznfKmmQoGJSwQ+O+Z+ko9/sZQMOX01CiHHoKmq27efb1LqUeOh67MvVC81LUX9JgAKdkUbaEnnipLj4HP+dyztEbXtp7nVSMduBpgZc6GHl2vBBFioyn+IQhUJlnbwmmfOSSvWiOmcmy8JOzvQsTkkxrGbKlStDAcoCGLpaKQgR26+3CmoYrAMXJPBlMIED+8/MLH0KNsVID47FKhf1UeFlMHow2TabnXCDmRfU1p2C264Nr/ozZxC0Vew9JOFvvjdCXXk6bP4+QwxEZ8JeAOXBeDK5PJsiJtJyGLcD0vvm8J/InI92Om0+AzFnY8qd5vhCpm1f6Q==; s=purelymail1; d=purelymail.com; v=1; bh=JwDnFKgkTFmQKUka/cnSo5jC+ufs1/9GTGeUNuUNyrI=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 685805:22403:null:purelymail
X-Pm-Original-To: xen-devel@lists.xenproject.org
From: Rose.Spangler@purelymail.com
To: xen-devel@lists.xenproject.org
Cc: Rose Spangler <Rose.Spangler@elektrobit.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Aqib Javaid <Aqib.Javaid@elektrobit.com>
Subject: [RFC PATCH v6 07/43] arm/altp2m: Introduce CONFIG_ALTP2M Kconfig option
Date: Mon, 20 Apr 2026 15:50:06 -0400
Message-Id: <20260420195042.207624-8-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
References: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-bad1c0/1776714655-93374A53-B98F9258/0/0
X-purgate-type: clean
X-purgate-size: 2913

From: Rose Spangler <Rose.Spangler@elektrobit.com>

Following the x86 implementation in commit e96831ece819, this commit adds
the CONFIG_ALTP2M Kconfig option for ARM. This makes it possible to build
Xen without building altp2m code.

This commit also implements a stub for p2m_altp2m_check, as some
implementation is needed when CONFIG_ALTP2M is enabled. This is due to a
call to p2m_altp2m_check in vm_event.c which is gated by CONFIG_ALTP2M.

This is commit 7/8 of the preparation phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
Signed-off-by: Aqib Javaid <Aqib.Javaid@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/arm/Kconfig              | 11 +++++++++++
 xen/arch/arm/altp2m.c             |  9 +++++++++
 xen/arch/arm/include/asm/altp2m.h | 18 ++++++++++++++++--
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 2f2b501fdac4..fdf0721c3c03 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -98,6 +98,17 @@ config MPU
 =09  systems supporting EL2. (UNSUPPORTED)
 endchoice
=20
+config ALTP2M
+=09bool "Alternate P2M support" if EXPERT
+=09depends on MMU
+=09default y
+=09help
+=09  Alternate-p2m allows a guest to manage multiple p2m guest physical
+=09  "memory views" (as opposed to a single p2m).
+=09  Useful for memory introspection.
+
+=09  If unsure, stay with defaults.
+
 source "arch/Kconfig"
=20
 config ACPI
diff --git a/xen/arch/arm/altp2m.c b/xen/arch/arm/altp2m.c
index 2bd1ff4df223..8bd174ea8f37 100644
--- a/xen/arch/arm/altp2m.c
+++ b/xen/arch/arm/altp2m.c
@@ -5,6 +5,15 @@
  * Copyright (c) 2016 Sergej Proskurin <proskurin@sec.in.tum.de>
  */
=20
+#include <asm/p2m.h>
+
+/* Check to see if vcpu should be switched to a different p2m. */
+void p2m_altp2m_check(struct vcpu *v, uint16_t idx)
+{
+    /* Not yet implemented */
+    BUG();
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/altp2m.h b/xen/arch/arm/include/asm/a=
ltp2m.h
index ca836bae7330..698c35427e75 100644
--- a/xen/arch/arm/include/asm/altp2m.h
+++ b/xen/arch/arm/include/asm/altp2m.h
@@ -11,10 +11,12 @@
=20
 #include <xen/sched.h>
=20
+#ifdef CONFIG_ALTP2M
+
+/* Hardware always supports altp2m on ARM */
 static inline bool altp2m_supported(void)
 {
-    /* Not implemented yet */
-    return false;
+    return true;
 }
=20
 /* Alternate p2m VCPU */
@@ -25,6 +27,18 @@ static inline uint16_t altp2m_vcpu_idx(const struct vcpu=
 *v)
     return 0;
 }
=20
+#else /* CONFIG_ALTP2M */
+
+static inline bool altp2m_supported(void)
+{
+    return false;
+}
+
+/* Only declaration is needed. DCE will optimise it out when linking. */
+uint16_t altp2m_vcpu_idx(const struct vcpu *v);
+
+#endif /* CONFIG_ALTP2M */
+
 #endif /* __ASM_ARM_ALTP2M_H */
=20
 /*
--=20
2.34.1


