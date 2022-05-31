Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84ACC433EF
	for <xen-devel@archiver.kernel.org>; Tue, 31 May 2022 10:43:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.339439.564327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvzLS-0000T8-3t; Tue, 31 May 2022 10:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339439.564327; Tue, 31 May 2022 10:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvzLR-0000S9-R2; Tue, 31 May 2022 10:43:25 +0000
Received: by outflank-mailman (input) for mailman id 339439;
 Tue, 31 May 2022 10:43:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a0MG=WH=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1nvzLP-00080t-GP
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 10:43:23 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 7e249c40-e0ce-11ec-bd2c-47488cf2e6aa;
 Tue, 31 May 2022 12:43:22 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4299C14BF;
 Tue, 31 May 2022 03:43:22 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 911AB3F73D;
 Tue, 31 May 2022 03:43:21 -0700 (PDT)
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
X-Inumbo-ID: 7e249c40-e0ce-11ec-bd2c-47488cf2e6aa
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 4/4] arm: Define kconfig symbols used by arm64 cpufeatures
Date: Tue, 31 May 2022 11:43:07 +0100
Message-Id: <be6be3d433a6cd5737e2d4ebb3494fcc99672df4.1653993431.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1653993431.git.bertrand.marquis@arm.com>
References: <cover.1653993431.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define kconfig symbols which are used by arm64 cpufeatures to prevent
using undefined symbols and rely on IS_ENABLED returning false.
All the features related to those symbols are unsupported by Xen:
- pointer authentication
- sve
- memory tagging
- branch target identification

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Change in v2:
- patch introduced
---
 xen/arch/arm/Kconfig | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ecfa6822e4..c9a4e40e9b 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -97,6 +97,34 @@ config HARDEN_BRANCH_PREDICTOR
 
 	  If unsure, say Y.
 
+config ARM64_PTR_AUTH
+	def_bool n
+	depends on ARM64
+	help
+	  Pointer authentication support.
+	  This feature is not supported in Xen.
+
+config ARM64_SVE
+	def_bool n
+	depends on ARM64
+	help
+	  Scalar Vector Extension support.
+	  This feature is not supported in Xen.
+
+config ARM64_MTE
+	def_bool n
+	depends on ARM64
+	help
+	  Memory Tagging Extension support.
+	  This feature is not supported in Xen.
+
+config ARM64_BTI
+	def_bool n
+	depends on ARM64
+	help
+	  Branch Target Identification support.
+	  This feature is not supported in Xen.
+
 config TEE
 	bool "Enable TEE mediators support (UNSUPPORTED)" if UNSUPPORTED
 	default n
-- 
2.25.1


