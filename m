Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124AFC5AD49
	for <xen-devel@archiver.kernel.org>; Fri,  6 Jun 2025 08:28:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1008119.1387330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSQk-0006xG-6R; Fri, 06 Jun 2025 08:28:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008119.1387330; Fri, 06 Jun 2025 08:28:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSQk-0006x9-3X; Fri, 06 Jun 2025 08:28:02 +0000
Received: by outflank-mailman (input) for mailman id 1008119;
 Fri, 06 Jun 2025 08:28:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tTeh=YV=rein-hpcbdc09=jahan@srs-se1.protection.inumbo.net>)
 id 1uNSQj-0006kQ-9G
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 08:28:01 +0000
Received: from rein-hpcbdc09 (unknown [1.7.42.26])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25962777-42b0-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 10:27:58 +0200 (CEST)
Received: by rein-hpcbdc09 (Postfix, from userid 1000)
 id 6B6A080C0C9F; Fri,  6 Jun 2025 13:57:54 +0530 (IST)
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
X-Inumbo-ID: 25962777-42b0-11f0-b894-0df219b8e170
From: Jahan Murudi <jahan.murudi.zg@renesas.com>
To: xen-devel@lists.xenproject.org
Cc: Jahan Murudi <jahan.murudi.zg@renesas.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm: Standardize R-Car platform Kconfig descriptions
Date: Fri,  6 Jun 2025 13:57:35 +0530
Message-Id: <20250606082735.3475058-1-jahan.murudi.zg@renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change "RCar3/RCar4" to "R-Car Gen3/Gen4" to match official Renesas branding.
Aligns with documentation and industry-standard terminology.

Signed-off-by: Jahan Murudi <jahan.murudi.zg@renesas.com>
---
 xen/arch/arm/platforms/Kconfig | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
index 87bf614788..c8bc0bfae3 100644
--- a/xen/arch/arm/platforms/Kconfig
+++ b/xen/arch/arm/platforms/Kconfig
@@ -22,21 +22,23 @@ config QEMU
 	  machine.
 
 config RCAR3
-	bool "Renesas RCar3 support"
+	bool "Renesas R-Car Gen3 support"
 	depends on ARM_64
 	select HAS_SCIF
 	select IPMMU_VMSA
 	help
-	  Enable all the required drivers for Renesas RCar3
+	  Enable support for Renesas R-Car Generation 3 SoCs (H3, M3, etc.).
+	  Includes all required drivers and platform-specific features.
 
 config RCAR4
-	bool "Renesas RCar4 support"
+	bool "Renesas R-Car Gen4 support"
 	depends on ARM_64
 	select HAS_SCIF
 	select HAS_ITS
 	select IPMMU_VMSA
 	help
-	Enable all the required drivers for Renesas RCar4
+	  Enable support for Renesas R-Car Generation 4 SoCs (V4H, V4M, etc.).
+	  Includes all required drivers and platform-specific features.
 
 config MPSOC
 	bool "Xilinx Ultrascale+ MPSoC support"
-- 
2.34.1


