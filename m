Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38184E99055
	for <xen-devel@archiver.kernel.org>; Fri, 10 Apr 2026 08:38:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1278475.1563294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB7Nz-00068S-KI; Fri, 10 Apr 2026 08:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278475.1563294; Fri, 10 Apr 2026 08:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB7Nz-00068L-GO; Fri, 10 Apr 2026 08:38:43 +0000
Received: by outflank-mailman (input) for mailman id 1278475;
 Fri, 10 Apr 2026 08:38:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wB7Ny-00068F-3H
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 08:38:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB7Nv-00Bi7R-Th
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 10:38:41 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d8b6fe-e002-0a2a0a5209dd-0a2a4503a050-48
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 10:38:41 +0200
Received: from [40.107.200.45]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 69d8b70f-02b3-0a2a45030019-286bc82d2e6d-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 10:38:40 +0200
Received: from SJ0PR03CA0358.namprd03.prod.outlook.com (2603:10b6:a03:39c::33)
 by DS2PR12MB9774.namprd12.prod.outlook.com (2603:10b6:8:270::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 08:38:37 +0000
Received: from SJ1PEPF00001CEB.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::f5) by SJ0PR03CA0358.outlook.office365.com
 (2603:10b6:a03:39c::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.44 via Frontend Transport; Fri,
 10 Apr 2026 08:38:36 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CEB.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 08:38:36 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 10 Apr
 2026 03:38:30 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 10 Apr
 2026 03:30:03 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Fri, 10 Apr 2026 03:30:02 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SrjI/4ozl6CrkKsD4KTwgVkneshuHvGr4/ZBlZ/PsSehkO5ou66lTuRXuJEHI2/xxs9vqkB9SVH0fAxW0aw9t4QXRr1OVCW4ZlUaQpL0K8rTMcm0XPN2bLYJRVjWVGNY170aqoI83ZLfecOgkhNhIhruqaaV6Vmxe/wZqgSTsLj+OTL3g02KZWhSaLjI2em42eaT3ubBXvGLfhzm2lhG1ZudsRxkQbGk5sjd9BJvMMBttDSXlNq/SpChtsilpD1rZ7yndkyx1MYp7iQ2udfTAHEuhnBfo5WPSePZcA90bX/4UDef2wnCwSwPm5aGOU0thmb0xVpQrl21k3FXHrdsLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYFPfaJPvDQsePFmi9pCijvhw7JhNcTXtcOi74pOOro=;
 b=w272Nqu99Gt5pyRNh7CIlJqyImCc8Wip7wTAAYXDEMC91bjPwnLnAE92BYPE0Dg6C0PMpwjTW5U5cfmna4ro/SVAzcheYx7JHVtGise/9sSO5tKIYCdXTMnGzG6jXHhDxcTL+q6rKvaIXDVYeJUS3c1D6YTkArieRevaWAmm0T6b9upS93OZRbBHCeV42rr6DnlpByWjG6D4bJLyT7wmxCSBatl4/E/jvAJ8qulDehdNC1oJn33KnemvQAc191xN8S6IaqPQXi0iUCBh2DCcjPWyj/gzlNUFoYM8mYHlY5qng/EkyutQxpCt2V2OxnRM8qTd8dcMCW+r/IGqPkn/Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYFPfaJPvDQsePFmi9pCijvhw7JhNcTXtcOi74pOOro=;
 b=Dkg3x0NhJNH4AT9jC5olwIUhhv9ZAwdzZquSPB/Jv4CD+XwCfUsx2fTG6ziGigsWh9NF4KTrcdYhApt00siYbdJmDisMad4zWRuVXgVpUizp9F8x0+2+qTlTbo/s2MFd61CqQIDUJX/LXH7XBlxmhlnZRS4sDZ3ygeHMJ0PIJWQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v2] xen/common: llc-coloring: Fix off-by-one in parse_color_config()
Date: Fri, 10 Apr 2026 10:29:55 +0200
Message-ID: <20260410082955.42038-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEB:EE_|DS2PR12MB9774:EE_
X-MS-Office365-Filtering-Correlation-Id: e7d904e9-ff3a-45d3-e9db-08de96dc8eb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	FEc2MwxRBTdac6VRFrGas5rU4m730KR6R51FPaoh0cadwL4KlwaYZ1WGCGPtQ3Bem6J+n42NhuQe2Ularmgc+yFkEf5Vzqmwnxwv3JybdI6m7q6lNADG3LXQSLdfvmYVZ5BWKpCv9FLKYK4PyKbTjRKGKZO06G5QNMldtBjkLBToPOKirGfK1RN2Ik+OKXawx33+6MCEh7IBaAW6yy799uLBxOuXF3ydkhIYZ9820VhbvEeUbUJy9QFbsyQUhNKPnlsxqxpPIgfIKKFWQLgkwiapOR6yjUAnFT+3PQpvPjaYs3D1SEZsBhdpgyt/pU5RCA4cSt1Uc7ECiNCKb9EMzbViMHfrRdsR2kiIosySBT4IUJmv+imS7gEm0ldH3rwQJbOXBEeOQOweQsXlMlnWlhibcl5NBlDbg9Fp7M3FZdfU4R3aUY2p2M4OkGPgeT4CDm0ta4xNsY8NOA8YjNGPZePCbChiPzPoNkn03uEIIM0CyhxFPlZsA/T1SEks267YLeuDZ3czfrtdqoPeqZafbbURu5OwBjeGppciPmwFI0ulaWa54ld7LAj5NJnUkGDUSuwtGmU/b9MwzBFt6du5CI1hCaeGoZ5Sm0xMu2sJaxM3MuJXUB0NQ61Hy28c2GqfFyPotOrrCJYNwwzXbZr0tPPPojWzKG0trpppMllsjcVPUV5Zv18ZMuEDZg1tEE5m+7+CbpB/YDpJcZi9T/B9UrLzxJ1nZTyQQw6LjYQJ4IMBWc8vcW1nZ+Nlp4wB2CoYmv3/zal/9Ae60n8sZctZPg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9JGKev1FLc1PR64Zj8v1NINdDJ5uwrxFvA68Tt5DSSGHRjemO72kIuONzl1/2R8AKpWNU6UswVHo5lqbzYd8VBt/TL78iPf20mD7p0U9c9/x9rCQlXkAnK7aXaA0SL+abNB928v53RnjQsRv80uwy//DllNMhGLSLAedAGsFzHBMRrfehpLVnpjFRcu75J5EttCSTOOUG1J2UWZONIdPZDZEacgAnbau8WADGzCk0iVeira2xQBaXKNMszkXI0+3oF73UKVAjcVViZTxzKFg7wIq/e/aBpCKBGVCUSRgsO/NF51WYHyqV8LjZXMPxlcnKj1Awcc+iv1S92op3p5iKjar1uP3Q1pCN/8dEJ7Ir7CzaWKc8l8fd/xDpsXhRLYrBORRD+eRT7FPP9LYJky5ZNjjbDgaSuM++EddXjSbUzjmTQ1Euwe161vGsjz5mqxG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 08:38:36.3841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d904e9-ff3a-45d3-e9db-08de96dc8eb8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9774
X-purgate-ID: tlsNG-33051d/1775810320-41914C9A-0D5E98A3/0/0
X-purgate-type: clean
X-purgate-size: 1439

The check uses (*num_colors + (end - start + 1)) >= max_num_colors, which
rejects a configuration where exactly max_num_colors colors are specified.
For example, if max_num_colors is 4 and *num_colors is 0, a range "0-3"
gives (end - start + 1) = 4, and (0 + 4) >= 4 is true, incorrectly
returning -EINVAL.

Fix this by switching the overflow condition to the state before commit
cba8a584de17 that regressed the behavior (i.e. don't add 1).

Fixes: cba8a584de17 ("llc-coloring: improve checking while parsing")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in v2:
 - extract from series
 - undo the overflow change made by cba8a584de17
---
 xen/common/llc-coloring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index eb7c72b24023..6dc614739a98 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -78,7 +78,7 @@ static int __init parse_color_config(const char *buf, unsigned int colors[],
 
         if ( end >= NR_LLC_COLORS || start > end ||
              (end - start) >= (UINT_MAX - *num_colors) ||
-             (*num_colors + (end - start + 1)) >= max_num_colors )
+             (*num_colors + (end - start)) >= max_num_colors )
             return -EINVAL;
 
         /* Colors are range checked in check_colors() */
-- 
2.43.0


