Return-Path: <SRS0=5TPE=LD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93405C48BCF
	for <xen-devel@archiver.kernel.org>; Wed,  9 Jun 2021 17:43:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5258B613BD
	for <xen-devel@archiver.kernel.org>; Wed,  9 Jun 2021 17:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5258B613BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.139504.257934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lr2Ej-0008LX-B7; Wed, 09 Jun 2021 17:43:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139504.257934; Wed, 09 Jun 2021 17:43:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lr2Ej-0008LQ-88; Wed, 09 Jun 2021 17:43:29 +0000
Received: by outflank-mailman (input) for mailman id 139504;
 Wed, 09 Jun 2021 17:43:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1y+9=LD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lr2Eh-0008LI-Tw
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 17:43:27 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9d25d24-55dd-46d3-935c-dc50d445aae1;
 Wed, 09 Jun 2021 17:43:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6010F613BD;
 Wed,  9 Jun 2021 17:43:26 +0000 (UTC)
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
X-Inumbo-ID: e9d25d24-55dd-46d3-935c-dc50d445aae1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623260606;
	bh=u29fOyrNfsPeTkxLnkA2fvyZ8AxZ0uuHL+SikhRqxs8=;
	h=From:To:Cc:Subject:Date:From;
	b=DbfpUOiJbTIxDrx5DAkmHIJOMG1fPhpMeaufcN0Cy/Ju6n1Q3C0ZWKD8JC5B4BNh5
	 BgIJyjtNC1K1kTRrfelLHzRG4/5hTUMk1lXvZ8vs/3bKTop+otPmqFdkB4w56qaaYu
	 6hzg9DqXmz/EgKhCWjFXfs4SxWVbmwMIMQoGSpSVQgiIkgfJTsiheY231VLcMdGoWW
	 PNfd2zAmE2BmKLZ1uceXLt5ZACwytjtyBu1+sUizpVGJzAZGoCDAsO2doBG7nxRMy1
	 HxpnI6zZR5BZC8CGjVP1kr9G6rQgm/AZ0iapIqmc4ZMPcS3IMkXlRhoUMLiWqJDmpw
	 MMy852tf8i9Rg==
From: Stefano Stabellini <sstabellini@kernel.org>
To: julien@xen.org
Cc: Volodymyr_Babchuk@epam.com,
	xen-devel@lists.xenproject.org,
	Bertrand.Marquis@arm.com,
	Michal.Orzel@arm.com,
	edgar.iglesias@xilinx.com,
	sstabellini@kernel.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH] xen/arm32: SPSR_hyp/SPSR
Date: Wed,  9 Jun 2021 10:43:24 -0700
Message-Id: <20210609174324.6621-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1

SPSR_hyp is not meant to be accessed from Hyp mode (EL2); accesses
trigger UNPREDICTABLE behaviour. Xen should read/write SPSR instead.

This fixes booting Xen/arm32 on QEMU.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/arch/arm/arm32/entry.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/arm32/entry.S b/xen/arch/arm/arm32/entry.S
index f2f1bc7a31..4e421109db 100644
--- a/xen/arch/arm/arm32/entry.S
+++ b/xen/arch/arm/arm32/entry.S
@@ -170,7 +170,7 @@ ENDPROC(prepare_context_from_guest)
         mrc     CP32(r11, HSR)                 /* Save exception syndrome */
         str     r11, [sp, #UREGS_hsr]
 
-        mrs     r11, SPSR_hyp
+        mrs     r11, SPSR
         str     r11, [sp, #UREGS_cpsr]
 
         /*
@@ -395,7 +395,7 @@ return_to_hypervisor:
         ldr r11, [sp, #UREGS_pc]
         msr ELR_hyp, r11
         ldr r11, [sp, #UREGS_cpsr]
-        msr SPSR_hyp, r11
+        msr SPSR, r11
 #ifdef CONFIG_ARM32_HARDEN_BRANCH_PREDICTOR
         /*
          * Hardening branch predictor may require to setup a different
-- 
2.17.1


