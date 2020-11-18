Return-Path: <SRS0=TkWG=EY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2821DC2D0E4
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2020 00:51:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A113024198
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2020 00:51:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="K1P5KIT3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A113024198
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.29321.58637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfBgY-0006he-5k; Wed, 18 Nov 2020 00:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29321.58637; Wed, 18 Nov 2020 00:50:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfBgY-0006hX-27; Wed, 18 Nov 2020 00:50:58 +0000
Received: by outflank-mailman (input) for mailman id 29321;
 Wed, 18 Nov 2020 00:50:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hmm/=EY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kfBgV-0006hS-S7
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 00:50:55 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 69f4ff4f-7185-4c50-b47d-f743f970d372;
 Wed, 18 Nov 2020 00:50:54 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 41EC824198;
 Wed, 18 Nov 2020 00:50:53 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hmm/=EY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kfBgV-0006hS-S7
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 00:50:55 +0000
X-Inumbo-ID: 69f4ff4f-7185-4c50-b47d-f743f970d372
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 69f4ff4f-7185-4c50-b47d-f743f970d372;
	Wed, 18 Nov 2020 00:50:54 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 41EC824198;
	Wed, 18 Nov 2020 00:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605660653;
	bh=JOIEgFpCWDzYiqatKGkd6htz5XfTnsJ+CkRtWN96/x4=;
	h=From:To:Cc:Subject:Date:From;
	b=K1P5KIT3EAQYVVIagqDjTWSOdaceRWcnCrHsk6gGiW/OLe+8CNWK+pOKHQx7QePPm
	 9iasMeOVIA4qeFbpQodekM3urWQGbnjzG5FhHf4npjHAbtWV4/W8DRFfWCWY6uynIw
	 zOTP3SIQtx7fqznWYQ3JOMpQRC9L03qqb2MVVkwU=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	Bertrand.Marquis@arm.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	iwj@xenproject.org,
	jbeulich@suse.com,
	julien@xen.org,
	wl@xen.org
Subject: [PATCH v2] xen: EXPERT clean-up and introduce UNSUPPORTED
Date: Tue, 17 Nov 2020 16:50:51 -0800
Message-Id: <20201118005051.26115-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

A recent thread [1] has exposed a couple of issues with our current way
of handling EXPERT.

1) It is not obvious that "Configure standard Xen features (expert
users)" is actually the famous EXPERT we keep talking about on xen-devel

2) It is not obvious when we need to enable EXPERT to get a specific
feature

In particular if you want to enable ACPI support so that you can boot
Xen on an ACPI platform, you have to enable EXPERT first. But searching
through the kconfig menu it is really not clear (type '/' and "ACPI"):
nothing in the description tells you that you need to enable EXPERT to
get the option.

So this patch makes things easier by doing two things:

- introduce a new kconfig option UNSUPPORTED which is clearly to enable
  UNSUPPORTED features as defined by SUPPORT.md

- change EXPERT options to UNSUPPORTED where it makes sense: keep
  depending on EXPERT for features made for experts

- tag unsupported features by adding (UNSUPPORTED) to the one-line
  description

- clarify the EXPERT one-line description

[1] https://marc.info/?l=xen-devel&m=160333101228981

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: andrew.cooper3@citrix.com
CC: george.dunlap@citrix.com
CC: iwj@xenproject.org
CC: jbeulich@suse.com
CC: julien@xen.org
CC: wl@xen.org

---
Changes in v2:
- introduce UNSUPPORTED as a separate new option
- don't switch all EXPERT options to UNSUPPORTED
---
 xen/Kconfig              | 11 ++++++++++-
 xen/arch/arm/Kconfig     | 10 +++++-----
 xen/arch/x86/Kconfig     |  8 ++++----
 xen/common/Kconfig       |  4 ++--
 xen/common/sched/Kconfig |  6 +++---
 5 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/xen/Kconfig b/xen/Kconfig
index 34c318bfa2..59400c4788 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -34,8 +34,17 @@ config DEFCONFIG_LIST
 	option defconfig_list
 	default ARCH_DEFCONFIG
 
+config UNSUPPORTED
+	bool "Configure UNSUPPORTED features"
+	help
+	  This option allows unsupported Xen options to be enabled, which
+	  includes non-security-supported, experimental, and tech preview
+	  features as defined by SUPPORT.md. Xen binaries built with this
+	  option enabled are not security supported.
+	default n
+
 config EXPERT
-	bool "Configure standard Xen features (expert users)"
+	bool "Configure EXPERT features"
 	help
 	  This option allows certain base Xen options and settings
 	  to be disabled or tweaked. This is for specialized environments
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index f938dd21bd..5981e7380d 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -32,7 +32,7 @@ menu "Architecture Features"
 source "arch/Kconfig"
 
 config ACPI
-	bool "ACPI (Advanced Configuration and Power Interface) Support" if EXPERT
+	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)" if UNSUPPORTED
 	depends on ARM_64
 	---help---
 
@@ -49,7 +49,7 @@ config GICV3
 	  If unsure, say Y
 
 config HAS_ITS
-        bool "GICv3 ITS MSI controller support" if EXPERT
+        bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
         depends on GICV3 && !NEW_VGIC
 
 config HVM
@@ -79,7 +79,7 @@ config SBSA_VUART_CONSOLE
 	  SBSA Generic UART implements a subset of ARM PL011 UART.
 
 config ARM_SSBD
-	bool "Speculative Store Bypass Disable" if EXPERT
+	bool "Speculative Store Bypass Disable (UNSUPPORTED)" if UNSUPPORTED
 	depends on HAS_ALTERNATIVE
 	default y
 	help
@@ -89,7 +89,7 @@ config ARM_SSBD
 	  If unsure, say Y.
 
 config HARDEN_BRANCH_PREDICTOR
-	bool "Harden the branch predictor against aliasing attacks" if EXPERT
+	bool "Harden the branch predictor against aliasing attacks (UNSUPPORTED)" if UNSUPPORTED
 	default y
 	help
 	  Speculation attacks against some high-performance processors rely on
@@ -106,7 +106,7 @@ config HARDEN_BRANCH_PREDICTOR
 	  If unsure, say Y.
 
 config TEE
-	bool "Enable TEE mediators support" if EXPERT
+	bool "Enable TEE mediators support (UNSUPPORTED)" if UNSUPPORTED
 	default n
 	help
 	  This option enables generic TEE mediators support. It allows guests
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 24868aa6ad..d4e20e9d31 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -102,8 +102,8 @@ config HVM
 	  If unsure, say Y.
 
 config XEN_SHSTK
-	bool "Supervisor Shadow Stacks"
-	depends on HAS_AS_CET_SS && EXPERT
+	bool "Supervisor Shadow Stacks (UNSUPPORTED)"
+	depends on HAS_AS_CET_SS && UNSUPPORTED
 	default y
 	---help---
 	  Control-flow Enforcement Technology (CET) is a set of features in
@@ -165,7 +165,7 @@ config HVM_FEP
 	  If unsure, say N.
 
 config TBOOT
-	bool "Xen tboot support" if EXPERT
+	bool "Xen tboot support (UNSUPPORTED)" if UNSUPPORTED
 	default y if !PV_SHIM_EXCLUSIVE
 	select CRYPTO
 	---help---
@@ -251,7 +251,7 @@ config HYPERV_GUEST
 endif
 
 config MEM_SHARING
-	bool "Xen memory sharing support" if EXPERT
+	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
 	depends on HVM
 
 endmenu
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 3e2cf25088..beed507727 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -151,7 +151,7 @@ config KEXEC
 	  If unsure, say Y.
 
 config EFI_SET_VIRTUAL_ADDRESS_MAP
-    bool "EFI: call SetVirtualAddressMap()" if EXPERT
+    bool "EFI: call SetVirtualAddressMap() (UNSUPPORTED)" if UNSUPPORTED
     ---help---
       Call EFI SetVirtualAddressMap() runtime service to setup memory map for
       further runtime services. According to UEFI spec, it isn't strictly
@@ -272,7 +272,7 @@ config LATE_HWDOM
 	  If unsure, say N.
 
 config ARGO
-	bool "Argo: hypervisor-mediated interdomain communication" if EXPERT
+	bool "Argo: hypervisor-mediated interdomain communication (UNSUPPORTED)" if UNSUPPORTED
 	---help---
 	  Enables a hypercall for domains to ask the hypervisor to perform
 	  data transfer of messages between domains.
diff --git a/xen/common/sched/Kconfig b/xen/common/sched/Kconfig
index 61231aacaa..94c9e20139 100644
--- a/xen/common/sched/Kconfig
+++ b/xen/common/sched/Kconfig
@@ -15,7 +15,7 @@ config SCHED_CREDIT2
 	  optimized for lower latency and higher VM density.
 
 config SCHED_RTDS
-	bool "RTDS scheduler support (EXPERIMENTAL)"
+	bool "RTDS scheduler support (UNSUPPORTED)" if UNSUPPORTED
 	default y
 	---help---
 	  The RTDS scheduler is a soft and firm real-time scheduler for
@@ -23,14 +23,14 @@ config SCHED_RTDS
 	  in the cloud, and general low-latency workloads.
 
 config SCHED_ARINC653
-	bool "ARINC653 scheduler support (EXPERIMENTAL)"
+	bool "ARINC653 scheduler support (UNSUPPORTED)" if UNSUPPORTED
 	default DEBUG
 	---help---
 	  The ARINC653 scheduler is a hard real-time scheduler for single
 	  cores, targeted for avionics, drones, and medical devices.
 
 config SCHED_NULL
-	bool "Null scheduler support (EXPERIMENTAL)"
+	bool "Null scheduler support (UNSUPPORTED)" if UNSUPPORTED
 	default y
 	---help---
 	  The null scheduler is a static, zero overhead scheduler,
-- 
2.17.1


