Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74331105A586
	for <xen-devel@archiver.kernel.org>; Thu, 12 Mar 2026 11:22:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1252076.1548866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0e70-0006vK-Jc; Thu, 12 Mar 2026 11:21:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252076.1548866; Thu, 12 Mar 2026 11:21:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0e70-0006v7-GG; Thu, 12 Mar 2026 11:21:54 +0000
Received: by outflank-mailman (input) for mailman id 1252076;
 Thu, 12 Mar 2026 11:21:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=17Qz=BM=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1w0e6y-0006gG-Vo
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 11:21:52 +0000
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c110::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a92e7c0a-1e05-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Mar 2026 12:21:49 +0100 (CET)
Received: from BL1PR13CA0326.namprd13.prod.outlook.com (2603:10b6:208:2c1::31)
 by IA0PR12MB8746.namprd12.prod.outlook.com (2603:10b6:208:490::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.8; Thu, 12 Mar
 2026 11:21:44 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:208:2c1:cafe::be) by BL1PR13CA0326.outlook.office365.com
 (2603:10b6:208:2c1::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Thu,
 12 Mar 2026 11:21:44 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 11:21:43 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Mar
 2026 06:21:42 -0500
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
X-Inumbo-ID: a92e7c0a-1e05-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6tiSSxfWGep66AXiweCBgbnJJjtNk3Nfr1vNxHJnSiqNAUctsNF9tqCz2mNXQvdLYZgN+sIDovFtEi5wNxzuYtLzz0Lh+7cUdaCqht5KC0KsZhsTzhJ+uRjD6j7oCQwHEkXE30HL4HdUv3cngWwiGVbGOhy3lvPlzSCTgphRH9lsh2/1KupgTNUfQbN7JuWeNo4n30e1VfUpygM0knimxTGvhE1G7Zb8RRDvnkkb2TgpYEY6rHCCTwlPqTQlgzVsDOot6ZGHmCG7hxD1wGlyAEJgK7l/thF6mCdE9lwQ/19qJYFnMEN5pboC92g+RaGrieRk1V7dsvOUyhayrinpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdWkxG9i7l3rW3T6Rp/jnTpeGEs/5PuOgfzAZHWlwfs=;
 b=T11K9iAzdkyxogVDPOgWwn9euCjJGSfjo2LaI5PmMK5maDevrWSfNx9tbwhjhhzo5rXb3oEMX/BFsf84Pz58bbh0IhLW5ztP0KNKSd4kxg/5viHVDX26bezXrU6GqeSx9eL03X2PqGp4vVlvGnPhtJS6tJB4k+F0gZRMH5eu5zY7fin3Ub4menVnq2MPFk9PnW3BYUgt/I+PgWR49nlp7wg+QCMNVUHyYdOn+mmbSqP4Tw2+faVtMV3YRFQ8VCZaPMpxvnBVGYVItEAYL8qGgdWoItSLkIGhnY7oGUQ0YhrsRWBMNKdfjkrca29ORqhUA0OuxR9/vUcVREs62SsSUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdWkxG9i7l3rW3T6Rp/jnTpeGEs/5PuOgfzAZHWlwfs=;
 b=WZSRH1PKTZzq2RkWcQl329WCT6NRG8KKUfeS89fBPC/DY4re0rbrOr6+QE7nPY6oGed5bmQHb6hWRYDCpDa4e7r6/KpW8KeeyU+9rRmehHVjF82pJICWzitoyb8V+nv0fq4L10tEOIPNrE5fbCboH9ZOa7iBT879Vp8IpYI8gWs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [PATCH v5 3/5] x86/hvm: Remove cross-vendor checks from MSR handlers.
Date: Thu, 12 Mar 2026 12:21:12 +0100
Message-ID: <20260312112116.22563-4-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312112116.22563-1-alejandro.garciavallejo@amd.com>
References: <20260312112116.22563-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|IA0PR12MB8746:EE_
X-MS-Office365-Filtering-Correlation-Id: 890a0033-8e69-4725-e3be-08de80298a8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MT4HRgnSStF36CMp1hPj6Ej21MtbAN9m6FfH0VqiYy/8yAw0GA1nUTuxnIUOvohkK67mxNHosdS2fC2ZmqJBKEJhZeNRIEYGRzpMe/FTdYF2goBzC+ie6hxFYldQaGq4tN5N8HjCCM4W7pPEJymaTcgu2cgqsRhnuAk6K7JCS1+zyNd8d6vxW537D4mjEoucpcgAkMkc8BshLJUqLo8oHLOQ7PyxfdTARDA9u3oxub7uUm0OLm5lGk6FFNerRIALGZs4bN+X2TMxC/6tSNN9CFrtqgF/h4gamr1daylVBtnHTiKFC+dxw2an8E3MtS6qj9ZJeqO+6c5//9uZ6wQpyiABXdoyqtw4SKqKqWE5aEtap72sfY4Ziib7pou2MXGK7l7RokhgBe2MmYNVEpAFyl+HCw1ZXrqZcz8Zy28XDVU73gossb8W/FF5+MktDc1C5ks7OfsVnlwcQZETI4vNZ6ltickdUQ6KVAafGq+ZsAX7M/T2HCH26x1A91T2BnkTqZ0T7ienDmjSTpi4fL8smPUdTRkyWmX8baV4PNyzuFZCiDZg/lTjOFa8PKYJnSDH+3DiDOICzpAfaf4OO0B0z60Pi9ew6Vi+X9jLxA+i4QMYQP6AyvC12aF5S5buIvnJ801gKKFDNrcxdj5sMQQNEKAFRHfQl7o1aH0sFLD3PD3VFqXmRr2D5gD19KoIbHDRyblEWFNwBWUryueF2i2xPa9jxi5FuXljbGTKV4FswAe2x+IqUtM3ddifoQVwaK0z54VVghvXOd19N67DiC8Y0w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LrviW/m6EdCv/MZmRMjmxbXCmD63tMX+CgbNuEaSJUQ4+yBwfuupNpl1wpn1uqzuRuq0Leqa4LwLe7QxK5ro2z1TFJgkteMJqqu+LbnmlDUr+KUi/gSlz590uct90LJHbm4Vn6QBVUy4MXcbpZ3lAs9jUdxU0G26aGsbdtEbcW/6JxEsAjIzp/hACxqd/IY76fKKW2Hn/U+j043F/9ULQy2K9MoNInEdeN1Uij97of2rMDdRQVVkLvDpekAI5wAQl+HNd4fNtONbfoZrtpX/O5HPS2E360S0yVL5oEJWx7+25RD+UWPKKyA39r8Y/sO6/rAmuFHvGf32dL4dsvgIFBX1eqUYBAIoipxG0fYPouBLANjtTLz4y7bguDsM7LlRQNjnwd7AfQmpINCgE0OBOCZ8HLOxXhVGDWGzRgpXCxd6wQkEiGPgbx+lF+ixnnAl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 11:21:43.9381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 890a0033-8e69-4725-e3be-08de80298a8e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8746

Not a functional change now that cross-vendor guests are not launchable.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Reviewed-by: Teddy Astie <teddy.astie@vates.tech>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/msr.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 6a97be59d52..d10891dcfc8 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -169,9 +169,9 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         break;
 
     case MSR_IA32_PLATFORM_ID:
-        if ( !(cp->x86_vendor & X86_VENDOR_INTEL) ||
-             !(boot_cpu_data.vendor & X86_VENDOR_INTEL) )
+        if ( boot_cpu_data.vendor != X86_VENDOR_INTEL )
             goto gp_fault;
+
         rdmsrl(MSR_IA32_PLATFORM_ID, *val);
         break;
 
@@ -189,9 +189,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
          * from Xen's last microcode load, which can be forwarded straight to
          * the guest.
          */
-        if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
-             !(boot_cpu_data.vendor &
-               (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
+        if ( !(boot_cpu_data.vendor & (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
              rdmsr_safe(MSR_AMD_PATCHLEVEL, val) )
             goto gp_fault;
         break;
-- 
2.43.0


