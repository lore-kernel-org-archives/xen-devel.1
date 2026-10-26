Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34553606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 03:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kRnhhCrL
Received: from list by lists.xenproject.org with outflank-mailman.1460730.1671603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLAzo-00015M-BX; Mon, 26 Oct 2026 03:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460730.1671603; Mon, 26 Oct 2026 03:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLAzo-00015E-8W; Mon, 26 Oct 2026 03:03:36 +0000
Received: by outflank-mailman (input) for mailman id 1460730;
 Mon, 26 Oct 2026 03:03:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Shuaidong.Chen@amd.com>) id 1xLAzn-000158-GB
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 03:03:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLAzm-00CPQu-EJ
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 04:03:34 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6adec2e7-2eae-0a2a0a5409dd-0a2a45039aae-16
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 04:03:33 +0100
Received: from [52.101.85.30]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6adec303-fae8-0a2a45030019-3465551ec0e3-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 04:03:33 +0100
Received: from DS1PR06CA0027.namprd06.prod.outlook.com (2603:10b6:8:23e::19)
 by SN7PR12MB8172.namprd12.prod.outlook.com (2603:10b6:806:352::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 03:03:28 +0000
Received: from CH7PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:8:23e:cafe::41) by DS1PR06CA0027.outlook.office365.com
 (2603:10b6:8:23e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Mon,
 26 Oct 2026 03:03:28 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH7PEPF00000018.mail.protection.outlook.com (10.167.244.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.0 via Frontend Transport; Mon, 26 Oct 2026 03:03:27 +0000
Received: from jim-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.53; Sun, 25 Oct 2026 22:03:24 -0500
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
 b=ASDKMIqi6o8V7hMwuWJhFwXzE8jBxeuk2x1ndRPCBorlCCgiYSg8KsiujrMFZCet0NjvHmRq5l/PCAk6ZIanbxTbGdQ/U61N6mJACHm/a9WgLB0iqBvOoIWS5BSAnZkx5RTL3py300FOOCugrkYYdpPyO3T1XQe8n2f+O3ENSym3P0/JriLkEJb4d+eqkmRxg5At9VKDP15eX9AmTwCvqutQwtwKA9GJ1b2ohGHWVRTbK4nLUYLJ2yJ0XNO9eQ+n2KIKCESyzh8YNgnFW3p3jbHEhfE9rjFjSIG5A4tPQyhHEB0BCTSVOZ37w3kFoieJw1l+evlHk+Fx9iTMKwYAzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9GijEse6hff60BEqBgFxft9+bDZ0t5yGKOBH3CY1qHc=;
 b=jX51cplIU/1bvb1IwtwhKH9XPMjeMOt/kIubIp5YWWo9VloldsGzbkKw7ju7PraoR1HXN45C008MeO8NGs0hPDC8NjSBYDSZOfELa7WbQORM0MqVVFTc+bNqeRGJG9Jd9vTnCJOoPPlwNrhA6T3cva1lQljpyrhyTptsKGNxk4Yyz2214B9BQ0N7Rk+FSs1TNVQMwTzXw40Be3jz8Dz8ohmwYNWyeVmArcZ5DPDtPBFiMAAp6nNTGz2J9ZDMBsxmH8tsiu/BPxf4VXdKooEx536XsMDCOV6uFeL6j6x2dh/2xINDYix6pbNaCJ7iOfsa0wEnUyw00ETEw411JbMiZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GijEse6hff60BEqBgFxft9+bDZ0t5yGKOBH3CY1qHc=;
 b=kRnhhCrLFwZlNMUMMUpU+63LIJdTrAgUQsf5d2hcUkfnbPaAYCf1/iG+sdmWORzQRoSZx2iXA/4YPzzAh9Qn/KjrH9H5Musfis/5Lg5b+U1fGKOb31TG+l4oxv+27hXuu4rOXOBTEdWSmIM5GI51vRsL/mQ/vzxx8NzBLkLXZpc=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Shuaidong Chen <shuaidong.chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>, Penny Zheng
	<penny.zheng@amd.com>, Ray Huang <Ray.Huang@amd.com>, Shuaidong Chen
	<shuaidong.chen@amd.com>
Subject: [XEN PATCH] misra: merge the two R14.3 invariant-condition deviations
Date: Mon, 26 Oct 2026 11:03:09 +0800
Message-ID: <20261026030309.2507461-1-shuaidong.chen@amd.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PEPF00000018:EE_|SN7PR12MB8172:EE_
X-MS-Office365-Filtering-Correlation-Id: 8373a895-ae89-45ba-41ee-08df330db55a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|82310400026|36860700016|261009223027099003|261009221227099003|261022113327099003|261022105027099003|261022075727099003|261021121427099003|261021123027099003|10067099003|56012099006|18002099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	eKJT5L2LFE87U8/n1kYLjUjmRfrhqZKwFtqwVfeG5+hw/CNHBeyH2thazhMFuHiehuHYZA9H7NvtGLQoXrbyp+YSyZctYgVmsmFB22SoC+zzb0RCL0MnfXXH/3rUJY7K3lSaydX751AMYvN2v/lcNUdMvr3oiMwCxoT/ay/XEoyvU2d/u5jJzBI/YIbpN2laGKrPXiSPhweHNzi1KQe9wLkdGAt0UhJpOyjYptj3aEwxGWBFgUA+cwILkALF3QePCk8Dz8zOxMhrizbhoJIaSXu4i1/Db/25Y2yLwAiEvtHAzffD+I9EfcnyXMsOqrggIavjeliN3KhtHugbozU9MDZturzeXzHBCz5hdtTx/PtSnooG8yNG9t8Gc/HQRkYwjtWijsFjD8HC5Msy8bG1WCPeibFReRK79fH1BK6a+9TY0zljRevOcVZwkAEE7BZAzIXV1l7PrnzF75WrlnQnas+QkXuNygJprcUV2JpvNcjmuGHwnem1b5NvrAbKeypK1el1MEFrciXwrIIXHILgXVDM0rSUxO2AlB6fsnmXKp7aZ42moyal1zXyhpur/j/rinUehkzU/VFnxHsowclP7ZlO6glJ2sc9KljjTXaa5hKIjOYPrZpND8XPTTZuWtq7/poXm8lxEQuhDyn0LIztKSJs3sUE6iUMtEHGBGaGDD6gQy3I0mgguBkZ6Ba5LqYlmh4hMJ00rn8P+rWtfHlu5Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(261009223027099003)(261009221227099003)(261022113327099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(10067099003)(56012099006)(18002099003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UVjEwvfgvZWu/zxekXA/2h5Nf9PQsLcCr8WS4yCGK2AWawjKPBRt1ufzT0fI+Vb5ohgp6mb3V41jTBRlTRegL15BE56N2+gozRzqr2rr70kVsFkvjQYeH+eeBkvep1jWUQfzO6Bdj4aWm7OMmaJYDYll9/dOOGLFMvJFXQhhpU389nKaSjmhn4umZml5xnjNouPBb2sTeBqXXtLg9MyM6b0Y6e5orYVjWKRBOIE6lsAECfD8t4KRgqiUDDX6UHAwznHGThDVjAH5oMI/NuSKXwrAvX84Mkt7UfKFuvG8g6pHFyOLr/GeTjta8hZSHs0vhWbrSlKiI+q7uCJjfrg2sRjGqaMjeh53FjYfirJssHrT9/gfsQs/IkPuuFdwcMCdK2HLHQUpB5ZUyPH5JsTNDwrbPaDz0p0MPUBqJ/IC5VBc9pXlIVIAE7YiX6c+1Kop
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 03:03:27.9768
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8373a895-ae89-45ba-41ee-08df330db55a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH7PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8172
X-purgate-ID: tlsNG-33051d/1792983813-778C54E9-64D34F87/0/0
X-purgate-type: clean
X-purgate-size: 3275
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MC3A2.R14.3 ("Controlling expressions shall not be invariant") is
deviated by two separate entries.  One covers 'if' statements and
conditional operators and places no restriction on where the invariant
condition comes from.  The other covers 'switch' statements, but only
when the controlling expression is a 'sizeof' operator.

The rationale recorded for the two is the same: the condition is
deliberate.  Nothing about a 'switch' makes an invariant condition less
deliberate than the same condition in an 'if', so the 'sizeof'
restriction reads as an artefact of that entry having been added for
read_atomic() and friends in arch/x86/include/asm/atomic.h rather than
as a considered limit.

Fold switch_stmt into the general entry and drop the 'sizeof'-restricted
one, which the general predicate now subsumes.  Invariant 'switch'
conditions that are not a 'sizeof' become deliberate as a result; that
is the intent.

Signed-off-by: Shuaidong Chen <shuaidong.chen@amd.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 8 ++------
 docs/misra/deviations.rst                        | 8 ++------
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 7f3fd35a33d..08a88ddfa62 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -472,12 +472,8 @@ activity."
 -config=MC3A2.R14.2,reports+={disapplied,"any()"}
 -doc_end
 
--doc_begin="The XEN team relies on the fact that invariant conditions of 'if' statements and conditional operators are deliberate"
--config=MC3A2.R14.3,statements+={deliberate, "wrapped(any(),node(if_stmt||conditional_operator||binary_conditional_operator))" }
--doc_end
-
--doc_begin="Switches having a 'sizeof' operator as the condition are deliberate and have limited scope."
--config=MC3A2.R14.3,statements+={deliberate, "wrapped(any(),node(switch_stmt)&&child(cond, operator(sizeof)))" }
+-doc_begin="The XEN team relies on the fact that invariant conditions of 'if' statements, conditional operators and 'switch' statements are deliberate"
+-config=MC3A2.R14.3,statements+={deliberate, "wrapped(any(),node(if_stmt||conditional_operator||binary_conditional_operator||switch_stmt))" }
 -doc_end
 
 -doc_begin="The use of an invariant size argument in {put,get}_unsafe_size and array_access_ok, as defined in arch/x86(_64)?/include/asm/uaccess.h is deliberate and is deemed safe."
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 32713172067..99a1b2332c2 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -458,12 +458,8 @@ Deviations related to MISRA C:2012 Rules:
 
    * - R14.3
      - The Xen team relies on the fact that invariant conditions of 'if'
-       statements and conditional operators are deliberate.
-     - Tagged as `deliberate` for ECLAIR.
-
-   * - R14.3
-     - Switches having a 'sizeof' operator as the condition are deliberate and
-       have limited scope.
+       statements, conditional operators and 'switch' statements are
+       deliberate.
      - Tagged as `deliberate` for ECLAIR.
 
    * - R14.3
-- 
2.34.1


