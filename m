Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FB2C46CD4
	for <xen-devel@archiver.kernel.org>; Wed, 20 Dec 2023 11:03:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.657638.1026680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuMJ-0006hE-TA; Wed, 20 Dec 2023 11:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657638.1026680; Wed, 20 Dec 2023 11:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuMJ-0006gg-P2; Wed, 20 Dec 2023 11:03:27 +0000
Received: by outflank-mailman (input) for mailman id 657638;
 Wed, 20 Dec 2023 11:03:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xS+a=H7=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rFuMI-0004rG-92
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 11:03:26 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65d1acf7-9f27-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 12:03:25 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.161.218.228])
 by support.bugseng.com (Postfix) with ESMTPSA id 9D39F4EE0C9A;
 Wed, 20 Dec 2023 12:03:24 +0100 (CET)
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
X-Inumbo-ID: 65d1acf7-9f27-11ee-98eb-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Rahul Singh <rahul.singh@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH 7/7] xen/arm: smmu-v3: address violations of MISRA C:2012 Rule 16.3
Date: Wed, 20 Dec 2023 12:03:07 +0100
Message-Id: <93d32bf20bb85b93618be5140edb1be527606b77.1703066935.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703066935.git.federico.serafini@bugseng.com>
References: <cover.1703066935.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a break statement at the end of the switch-clauses to address
violations of MISRA C:2012 Rule 16.3 ("An unconditional `break'
statement shall terminate every switch-clause").
No funtional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index cdbb505134..bca5866b35 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -2200,6 +2200,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 		fallthrough;
 	case IDR0_STALL_MODEL_STALL:
 		smmu->features |= ARM_SMMU_FEAT_STALLS;
+		break;
 	}
 
 	if (reg & IDR0_S2P)
@@ -2301,6 +2302,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 		fallthrough;
 	case IDR5_OAS_48_BIT:
 		smmu->oas = 48;
+		break;
 	}
 
 	smmu->oas = min_t(unsigned long, PADDR_BITS, smmu->oas);
-- 
2.34.1


