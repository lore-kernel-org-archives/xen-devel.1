Return-Path: <SRS0=ek7T=FV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1406C4361B
	for <xen-devel@archiver.kernel.org>; Thu, 17 Dec 2020 15:42:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8147C2395A
	for <xen-devel@archiver.kernel.org>; Thu, 17 Dec 2020 15:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8147C2395A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.55986.97736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpvQX-0004bv-T1; Thu, 17 Dec 2020 15:42:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55986.97736; Thu, 17 Dec 2020 15:42:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpvQX-0004bk-NP; Thu, 17 Dec 2020 15:42:49 +0000
Received: by outflank-mailman (input) for mailman id 55986;
 Thu, 17 Dec 2020 15:42:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xKjN=FV=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kpvQV-0004G9-SJ
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 15:42:47 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 158ab480-93c7-46a5-a1b6-5fec4addc648;
 Thu, 17 Dec 2020 15:42:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDA4830E;
 Thu, 17 Dec 2020 07:42:38 -0800 (PST)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37F373F66B;
 Thu, 17 Dec 2020 07:42:38 -0800 (PST)
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
X-Inumbo-ID: 158ab480-93c7-46a5-a1b6-5fec4addc648
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 8/8] xen/arm: Activate TID3 in HCR_EL2
Date: Thu, 17 Dec 2020 15:38:08 +0000
Message-Id: <d89992ce6177bee2c5331cdc3a90d5b189669d0d.1608214355.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1608214355.git.bertrand.marquis@arm.com>
References: <cover.1608214355.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1608214355.git.bertrand.marquis@arm.com>
References: <cover.1608214355.git.bertrand.marquis@arm.com>

Activate TID3 bit in HCR register when starting a guest.
This will trap all coprecessor ID registers so that we can give to guest
values corresponding to what they can actually use and mask some
features to guests even though they would be supported by the underlying
hardware (like SVE or MPAM).

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in V2: Rebase
Changes in V3: Rebase
Changes in V4: Rebase

---
 xen/arch/arm/traps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 28d9d64558..c1a9ad6056 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -98,7 +98,7 @@ register_t get_default_hcr_flags(void)
 {
     return  (HCR_PTW|HCR_BSU_INNER|HCR_AMO|HCR_IMO|HCR_FMO|HCR_VM|
              (vwfi != NATIVE ? (HCR_TWI|HCR_TWE) : 0) |
-             HCR_TSC|HCR_TAC|HCR_SWIO|HCR_TIDCP|HCR_FB|HCR_TSW);
+             HCR_TID3|HCR_TSC|HCR_TAC|HCR_SWIO|HCR_TIDCP|HCR_FB|HCR_TSW);
 }
 
 static enum {
-- 
2.17.1


