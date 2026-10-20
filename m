Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DBA606A319
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 22:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=u4YRGtwk
Received: from list by lists.xenproject.org with outflank-mailman.1456615.1669861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJIWX-0005uM-Le; Tue, 20 Oct 2026 22:41:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456615.1669861; Tue, 20 Oct 2026 22:41:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJIWX-0005uF-Hd; Tue, 20 Oct 2026 22:41:37 +0000
Received: by outflank-mailman (input) for mailman id 1456615;
 Tue, 20 Oct 2026 22:41:36 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stefano.stabellini@amd.com>) id 1xJIWW-0005u9-Bf
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 22:41:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJIWV-0083hr-Kl
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 00:41:35 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6ad7ee19-bab6-0a2a0a5309dd-0a2a4506b752-4
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 00:41:35 +0200
Received: from [40.93.198.50]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stefano.stabellini@amd.com>)
 id 6ad7ee1d-195a-0a2a45060019-285dc6329a83-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 00:41:35 +0200
Received: from CYXPR02CA0082.namprd02.prod.outlook.com (2603:10b6:930:ce::29)
 by SN7PR12MB6957.namprd12.prod.outlook.com (2603:10b6:806:263::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 22:41:26 +0000
Received: from CY8PEPF00000050.namprd05.prod.outlook.com
 (2603:10b6:930:ce:cafe::a2) by CYXPR02CA0082.outlook.office365.com
 (2603:10b6:930:ce::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Tue, 20
 Oct 2026 22:41:26 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY8PEPF00000050.mail.protection.outlook.com (10.167.247.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Tue, 20 Oct 2026 22:41:26 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 20 Oct
 2026 17:41:25 -0500
Received: from amd.com (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.53 via Frontend Transport;
 Tue, 20 Oct 2026 17:41:24 -0500
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFGxgmwh2hyjetUuGhUKShmPvabBtd5BG7ODJoUplY7Jq/yx9xzpspBAxCcaE5eMO+uTP2qAW6b+ongi6Ma9T3dBfwwrFVopb52DgdyzQDd2aZTRHzw+nFvXPwFbjM+pV5ftepk5CKuDOMfeVRSWS8leZjnFW956atptwSZSmf/YODGHr4k/Fhtpqd0mbZ547IIe5IRUOxEnzzm4w7Wtu7pEG2csCcx3459uNo5GyoFpI06LFnpUggvfibIRDsTMjMe3W864brYS2wlRO36MxEKBLlFcZazPf7Gg/Jb5ssgo7YjHFb8AC6XMjNYgx/Bv5TZNz1CSaCMGbS2h8rz4XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2TMl5q79/075XExQN9cH1tRrO3ZhgLtFiJ/Z47MAdw=;
 b=NFH25YIBgWKVbnq0irFVROvVqcVJXg7O0b5mUJkfM42CVsEqKovqjKJrMl0mCSrNjftYSLx7BvztWd43AdcFzHD4vwNM+WOCBx8sUwggN0c7mRXMFO4It+63mXt4WbH+huQJoq86zAXVqJKvRrQhbtHCUx8Y8DZf/EROgbKL7x3ltb3dpPkbc2+qYXX1b4CRJJ0XAxwhEXyMfZWSCQRBGF26PRLZRyUZnEQm+AdZHZ3LhsgpsJrrI5zrKXjmjAd7E5YyuD2OVzuoO5rjkf6a6f6/GGg8rvmX7rkyPSYWVYT175pp4I48poaaZq4GiE365nvUd71Ny+AHhToDPZNnHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i2TMl5q79/075XExQN9cH1tRrO3ZhgLtFiJ/Z47MAdw=;
 b=u4YRGtwkVZCV6fytKx0NvbvguLBQeq71FBuwyMpVp5iyqE7ojpbqk/ngtJrBuChCHYkE8qXN0s01o8Pr3ylD5CzI6gS14imlSm5NiubKuVk1cqcae0YDV3C/FdcPYLbngpcqX9m56lWNxzA+4Q/ZqHN5wbL8TjZK6+74NuXJ0vI=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger@xenproject.org>,
	<jason.andryuk@amd.com>, <teddy.astie@vates.tech>,
	<stefano.stabellini@amd.com>
Subject: [PATCH] xen/x86/svm: Apply the virtual-8086 IOPL check to INT n only
Date: Tue, 20 Oct 2026 15:41:23 -0700
Message-ID: <20261020224123.3710391-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PEPF00000050:EE_|SN7PR12MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: 110f18f1-cd7b-4e30-d20a-08df2efb4660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|261009223027099003|10067099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	2UYA4r3Xqy7MFHequENO+pa8KC1f27n4GbZzJAOamDY6renBzYfJ53ITMsdVQg1YwjfqrW6RAmEDvf/q7zemHCDp9aghU5XNUre3jmkVj0SgYaWAu00rBtS7ap5AfGooQhqBren2gO0w+r8kgwQl1ZyzW/30MKNHIqUElfDotT0IgarUBjQUOGazkUYjCIusL7kD7IweVrAKvCZjOIPGPmmC59nOAHHu7WPCBilLluuhUqFDtg57vY3xRmCMURXgXlJH6fI4go1gVjf7GTeGrZT7ZtH8vNTmPyDUmZn2nTctaYG+kraJ5Q5Cp1ZGyFcTXmaQh9+CbehTutNZMkBfTmemWOJDuWfYHb/q9sZxi5gvUNSvMc7m8xwKKfmXc9Z1TYkIQsGlsgPxSLmCrKwK5osd7XhCyeb2e68fLkVPhfB22Az2FuSrCYs3UZkct7GU2ONobKdeWvweuSB1UPVEavdi0jrZB8lJHLle7F6TlPIzFNkC8vBZDH904FpVJzDxG5Bz+ihYaFJ40yh86tDFn9x7EhK/MOFlMj1ctEzlRPOV/1pSiUMkE7aM7NIXg51g83ZRLIC84Z7cgXMcWMc82yw1pO2D+zYNCb5HergC62ksBNezJahcrTlb+AfliLFCeXLMVTtQGEj712fil+XeHYNz94dGzSMaWZKGRtGXaFOEQL1vvKvpIjZvGgtjIOg4PuIeJhYzE35gPcBYPXLBiA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(261009223027099003)(10067099003)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1xe4q81kIA0f6+wu4T7haaThWqGmbpBQpN65RsG4cxPS6j8EOwMlBvWy34iN/GQXof2PX4aQDk8kuUrA7DGv7gdH4svozMXc8jDYEMcXnrgyx0SJu25u+I6JdVAoa2efuAbuqCbjGKUtKHgGUNOUiOzwTTWm1KdMEOgqgDb0Sd1rssBICRp2ZzD2avZjkMRQhBn4HR8xMyoRCGzmBiIKrgWQbXLYJbXNjh9PGFR4bY80OP62lTZCl/wv2Tikwds2MD3WnxcMd5dtEyR8N1sh9f+1dAvSw4bzdX1YAcCzj47sprpxx6lTsIvieNSm2ymuhtFD2QLW624qiHu2LEs1IUUABec+Bkwj6LxArNGHqsmrfu9eRC8Xge4NbQ7HZvrnxiJwv5D9eOJblFIJiuWH6ndxVEveRMLKhUf6W0G7ULshpOH4Qd0NermdxvHrlck1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 22:41:26.1424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 110f18f1-cd7b-4e30-d20a-08df2efb4660
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY8PEPF00000050.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6957
X-purgate-ID: tlsNG-16d1c6/1792536095-1F4C977B-CBD86F6D/0/0
X-purgate-type: clean
X-purgate-size: 1246
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In virtual-8086 mode with IOPL < 3, INT n raises #GP(0).  INT1, INT3
and INTO are not affected. They are delivered normally.

svm_emul_swint_injection() applies the check to all of them, so an ICEBP
raises #GP instead of #DB.  It also reports the IDT entry in the #GP
error code instead of 0.

Limit the check to INT n and use error code 0.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/arch/x86/hvm/svm/svm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 71e48351f2..df74531d1a 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1153,9 +1153,12 @@ static void svm_emul_swint_injection(struct x86_event *event)
      * 32bit OS.  Someone with many TUITs can see about reading the TSS
      * Software Interrupt Redirection bitmap.
      */
-    if ( (regs->eflags & X86_EFLAGS_VM) &&
+    if ( type == X86_ET_SW_INT && (regs->eflags & X86_EFLAGS_VM) &&
          MASK_EXTR(regs->eflags, X86_EFLAGS_IOPL) != 3 )
+    {
+        ec = 0;
         goto raise_exception;
+    }
 
     /*
      * Read all 8/16 bytes so the idtr limit check is applied properly to
-- 
2.43.0


