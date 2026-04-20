Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDF7F5A8CA
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2026 20:25:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1286476.1567549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBJ-0002Ki-LF; Mon, 20 Apr 2026 20:25:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286476.1567549; Mon, 20 Apr 2026 20:25:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEvBJ-0002Hk-8I; Mon, 20 Apr 2026 20:25:21 +0000
Received: by outflank-mailman (input) for mailman id 1286476;
 Mon, 20 Apr 2026 19:50:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Rose.Spangler@purelymail.com>) id 1wEue0-0006IO-Ce
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 19:50:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEudz-004tZC-Pj
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 21:50:55 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e6836c-2eae-0a2a0a5409dd-0a2a4503b316-32
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:55 +0200
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Rose.Spangler@purelymail.com>)
 id 69e6839e-672d-0a2a45030019-22cac1c5a53a-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 21:50:55 +0200
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -306608446; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 20 Apr 2026 19:50:48 +0000 (UTC)
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
DKIM-Signature: a=rsa-sha256; b=T0h1p+KPW6xskaiN1TF/GqkmjkwnuwDjImGiUUhasrOTP48+CrkHmkHwqcexT9o7AkpH4PMPACLL8fu8UVo/ZDALP3IAyZ4mlaqOguHhZmM2tgKBzT6D64HnmGHfF/2al5LFIjaJHKkSUOsl0RhB9svFbQ5JKHHgcVmFSt3M/KPV1bH330irr3D/NiOASgijgnExV9lN9Rplc8V29HtGUNj6QiNZ+XylNy15VkThWPCMSd9SroGaGUpQKVXV/Z9lcnoag3C9Y+8LaTeAG+v+4AWlt7sJbmcTdM6DqaNj2WG1bKKo2bbGcSdBzkD/qdFEN9QbRyvHsT+1QFICIvgLEA==; s=purelymail1; d=purelymail.com; v=1; bh=MOrqrKIcHuJwSbppidFvZIeRSx3vTlSfdSMUlXig51U=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 685805:22403:null:purelymail
X-Pm-Original-To: xen-devel@lists.xenproject.org
From: Rose.Spangler@purelymail.com
To: xen-devel@lists.xenproject.org
Cc: Rose Spangler <Rose.Spangler@elektrobit.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH v6 05/43] altp2m: Move altp2m_supported to arch header
Date: Mon, 20 Apr 2026 15:50:04 -0400
Message-Id: <20260420195042.207624-6-Rose.Spangler@purelymail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
References: <20260420195042.207624-1-Rose.Spangler@purelymail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-purgate-ID: tlsNG-33051d/1776714655-A2F62938-A23BEFAB/0/0
X-purgate-type: clean
X-purgate-size: 3291

From: Rose Spangler <Rose.Spangler@elektrobit.com>

Following from the previous commit, this commit makes altp2m_supported
available through the asm/altp2m.h header.

This is commit 5/8 of the preparation phase.

Signed-off-by: Rose Spangler <Rose.Spangler@elektrobit.com>
---
v6: Introduced this patch.
---
 xen/arch/x86/domain.c              |  1 +
 xen/arch/x86/include/asm/altp2m.h  | 11 +++++++++++
 xen/arch/x86/include/asm/hvm/hvm.h | 11 -----------
 xen/include/asm-generic/altp2m.h   |  7 +++++++
 4 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 512b18d4010f..e4f1cbf3b51e 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -39,6 +39,7 @@
 #include <xen/softirq.h>
 #include <xen/wait.h>
=20
+#include <asm/altp2m.h>
 #include <asm/amd.h>
 #include <asm/cpu-policy.h>
 #include <asm/cpuidle.h>
diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/a=
ltp2m.h
index ad5ded833a75..07e760f60659 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -28,6 +28,12 @@ static inline bool altp2m_is_eptp_valid(const struct dom=
ain *d,
         mfn_x(INVALID_MFN);
 }
=20
+/* returns true if hardware supports alternate p2m's */
+static inline bool altp2m_supported(void)
+{
+    return hvm_funcs.caps.altp2m;
+}
+
 static inline uint16_t altp2m_vcpu_idx(const struct vcpu *v)
 {
     return vcpu_altp2m(v).p2midx;
@@ -58,6 +64,11 @@ static inline bool altp2m_is_eptp_valid(const struct dom=
ain *d,
     return false;
 }
=20
+static inline bool altp2m_supported(void)
+{
+    return false;
+}
+
 /* Only declaration is needed. DCE will optimise it out when linking. */
 uint16_t altp2m_vcpu_idx(const struct vcpu *v);
 void altp2m_vcpu_initialise(struct vcpu *v);
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/=
hvm/hvm.h
index 6406bb687718..e6d8042831dc 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -701,12 +701,6 @@ static inline bool hvm_hap_supported(void)
     return hvm_funcs.caps.hap;
 }
=20
-/* returns true if hardware supports alternate p2m's */
-static inline bool altp2m_supported(void)
-{
-    return IS_ENABLED(CONFIG_ALTP2M) && hvm_funcs.caps.altp2m;
-}
-
 /* Returns true if we have the minimum hardware requirements for nested vi=
rt */
 static inline bool hvm_nested_virt_supported(void)
 {
@@ -876,11 +870,6 @@ static inline bool hvm_hap_supported(void)
     return false;
 }
=20
-static inline bool altp2m_supported(void)
-{
-    return false;
-}
-
 static inline bool hvm_nested_virt_supported(void)
 {
     return false;
diff --git a/xen/include/asm-generic/altp2m.h b/xen/include/asm-generic/alt=
p2m.h
index ecee6942f4e8..a3cdbdae9953 100644
--- a/xen/include/asm-generic/altp2m.h
+++ b/xen/include/asm-generic/altp2m.h
@@ -6,6 +6,13 @@
=20
 struct vcpu;
=20
+/* returns true if hardware supports alternate p2m's */
+static inline bool altp2m_supported(void)
+{
+    /* Not implemented on GENERIC. */
+    return false;
+}
+
 /* Alternate p2m VCPU */
 static inline unsigned int altp2m_vcpu_idx(const struct vcpu *v)
 {
--=20
2.34.1


