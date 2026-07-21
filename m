Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FCAC4451C
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 12:48:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367768.1617444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm9t6-0001iC-KS; Tue, 21 Jul 2026 12:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367768.1617444; Tue, 21 Jul 2026 12:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm9t6-0001hS-Gh; Tue, 21 Jul 2026 12:47:56 +0000
Received: by outflank-mailman (input) for mailman id 1367768;
 Tue, 21 Jul 2026 12:47:55 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1wm9t4-0001fH-OR
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 12:47:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wm9t4-00DDDW-4Z
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 14:47:54 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a5f6a73-e002-0a2a0a5209dd-0a2a4508b7f8-24
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 14:47:53 +0200
Received: from [40.107.208.16]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a5f6a77-f659-0a2a45080019-286bd010de87-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 14:47:53 +0200
Received: from CH2PR18CA0054.namprd18.prod.outlook.com (2603:10b6:610:55::34)
 by DM4PR12MB6637.namprd12.prod.outlook.com (2603:10b6:8:bb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 12:47:44 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:55:cafe::21) by CH2PR18CA0054.outlook.office365.com
 (2603:10b6:610:55::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 12:47:44 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 12:47:44 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 21 Jul
 2026 07:47:43 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via
 Frontend Transport; Tue, 21 Jul 2026 07:47:42 -0500
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
 b=gSHVssB4Q51BkAcQx1H3FEo4RctKr4L6ZX+1mQT9Vg9PafZRtCCz6OeR6gIohjbf4l2RCKjrrQ8A5N9aCf15TaYXc0bj6v2Cw56VYNXzfx1qJnfYUOp2riwjIDG3EUtAt8La6RJazADIhNR4kMi78vuWYLZiUSdBBwd5mbnaClPLY0WZNLXjINwf7/FTje/UNPTCD+f1md48wzSXiKi/F4GYkdAq02XjKMFOKnvF6g7gWgzlGHJPvq8Z/7hA+C3KuLaFa8/lu5LCHYFVjLBr/3DVPN/3h6FV67JdYfx9zgSwXQDLC0nf2+ZMdFeVPIVpogXsRgur72aaEOLQCJDyXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUSjBQWLuFv3CPjFfgFpFtwWFlLf05ull2d9xnMh11Y=;
 b=VcnifDg0HBQAczDEI88jo0ASglasEvdEg6IObfXbP0Ulf/Q7joEA21omkOf/HgblH4w2F/NCrphUZY9RcGcfPGuEozFiRamiEAo+mFsEHAqNs0OmHEzHIetMolpcKTvxvQjCm4pvTnpilUn5mgNy/bVUof71ZeW3IJv1KpdvQDTKH64G1HUDJIN9dFIpikbkCw++HyCfFHLaMod5a2xO0X+A3AmCsJY3CkGnqyZ1YVF2Jbo8BLR32K93Vnj5fljeioxLUqIjHvMujgOdKsMApfFDlTdR1fDmMg3JXTh+kSMT4GfgFGVGMB2qejeIGgu2YbUY8PNw6dMiSXBnGZnBiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUSjBQWLuFv3CPjFfgFpFtwWFlLf05ull2d9xnMh11Y=;
 b=3t15OOdrl3yqYGDcQQ408QraWVjBSTG7i2yWJwBd1vFGtXMd+OSuBwTh7t7ABWKIYCVZyPRwkteN88sUgj2X7R0Ym8XQpfeDg6NV56Q5EkdbgpYaB/EQD4HqpV44QpJFn9zKtCa8KhXQIgf5Kc1DMwUwX6LQ8JEK7CWQhKOTR/A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Artem Mygaiev
	<artem_mygaiev@epam.com>, <matthew.l.weber3@boeing.com>,
	<harunobu.kurokawa.dn@renesas.com>
Subject: [XEN PATCH v1 1/2] docs/fusa: add coverage_gap.rst tabulating vGICv3 LCOV exclusions
Date: Tue, 21 Jul 2026 13:47:28 +0100
Message-ID: <20260721124729.868630-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260721124729.868630-1-ayan.kumar.halder@amd.com>
References: <20260721124729.868630-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|DM4PR12MB6637:EE_
X-MS-Office365-Filtering-Correlation-Id: b34e0f29-8afa-493c-797b-08dee7264274
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|6133799003|11063799006|10067099003|5023799004|56012099006|9063799003|8126099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 1grJs7c4UohdSq0ZFiuc4dqzSLGXI/ij0qalWo1DTxWzE+CpyDICOSEUagHsinVD5aikhS0Vpr8c17S4ojj7XZq0dpkVjW4sfd0OG6nr5XWiwln6+DunqbYsmlkxdGzl7pwCwQfLZM/zhvf9vOLy1d5GuV8kXxWsdpU2thJnCdDVVUTjGA/1ozrZ4pCeqllM1FZhFCZZxgHOZmzNzUmuYcFYRJSqBCoYbmnb0wQBgxHULOB4WeLL2e1LuIFcI9lg6NgXA5djn4kcNOypEQyrxR717mKsUGAzsk76e62EJHlkxdkC/81GVKnjVAkFFbG7SuKIy8zCkcTJmXINXrz32sIN9eLq4vxQSGtozuJCo3A6HTmiKNJnpPmmtixWGVCrcVYgw28CTg5Cz4Qpbfy2vdoxxbxWIDqUxQQ6r+DvUhoSxhbe78EwZHhGwCTQoN0tGkIobkuxVRSI4fNBRXIe0GofQPJeEoFg5FK8lllA3x3bU3F51wHNMq+0Dn2YrrA50J/YhSdT5y4Z0scEv1K4sK/la7jgTwGzHX31cAnc6PFAyyBYybn8RSM9e2VxWobAD0uG4lhS95+NiXZS1SQe3jBv0anWN2RQphSbL1lJ/Y0a5/q1BzcsUa0MHvF34c+D/GSUkdb3NwYOMWBL80y3IGGdLxIMmYoeebhi5+nQG3D+OdaPrMJ8ogb9zdDPFNc3wFkkWv9mhvG5D+TZiIz/GQ==
X-Forefront-Antispam-Report:
 CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(6133799003)(11063799006)(10067099003)(5023799004)(56012099006)(9063799003)(8126099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 d3/mHFy8GUB7IdC1JcDT44apUUvmjpGQWPMMyTjK5H76SjJ5/kyU6YI+WorIcrUZNnKGL8uSfbIFNthJPai0RnaCTxo5Ket7wluj696K4lwx33H1aN17KnK3GLFt8SVkVqjmmYihmWTmZDlj1nJoiEmbbArDIpBGRoo/rHYMXS0V8HL05pL3ZcNIrn2/vMKfRInZH+DgcJ+enzdWJzxoaCBkYtsTTmVuO4t8Q+ul7i4AaPadS7LsZHnHBnaITnhAFATYT1+BpXuDqMRSzhTemY8Dj0GU+KxdZTbhDxkIv0lQzTJxNqWzu8jOiTLQ+vxy5qZ97v0+oHW/EablzkfnVmvh+QL5dElU82qLRRxc0RJUxGgLhtr0/BshWOLihmGXVNKzyBYboZl0A6bVO+RXiTmxlqRkcLGoaSBx6XrOE5SlHmMXC4n2NOwMcqZrR5nS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 12:47:44.2332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b34e0f29-8afa-493c-797b-08dee7264274
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6637
X-purgate-ID: tlsNG-c1860d/1784638073-CE54487B-CCD02B75/0/0
X-purgate-type: clean
X-purgate-size: 3999

Some code is unreachable by design (for example a defensive default arm
of a switch that no caller can reach) and can therefore never be
executed by any test. Such code shows up as a permanent gap in the
coverage report even though it is correct. To keep the report meaningful
we exclude these regions from coverage, but every exclusion must be
justified and reviewable so that a genuine gap is never hidden behind an
LCOV marker. This file is that record: it gives each exclusion a stable
id, points at the excluded source, and states why the code is
unreachable and what would make it reachable again.

Record the LCOV_EXCL regions in xen/arch/arm/vgic-v3.c as a table with
columns coverage_gap_id, file, line numbers and SHA, plus a
justification taken from each COV-GAP-VGICV3 "Reason for exclusion".

Use upstream xen (xenbits/master) line ranges and SHA, with line numbers
given in vgic-v3.c:Lstart-Lend notation, and state explicitly that each
excluded default arm becomes reachable only if a caller is modified to
forward an offset the handler has no case for, at which point the
exclusion must be removed. Wire the file into the docs/fusa toctree.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
The coverage gap justification may be used to state why a piece of code
cannot be tested within the scope of our safety and it cannot be removed
as well. Thus, we use the justification to analyse and document the
behavior of untested code in safety certifiable Xen.

 docs/fusa/coverage_gap.rst | 41 ++++++++++++++++++++++++++++++++++++++
 docs/fusa/index.rst        |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 docs/fusa/coverage_gap.rst

diff --git a/docs/fusa/coverage_gap.rst b/docs/fusa/coverage_gap.rst
new file mode 100644
index 0000000000..9d14f7b264
--- /dev/null
+++ b/docs/fusa/coverage_gap.rst
@@ -0,0 +1,41 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Coverage gaps
+=============
+
+This table documents the ``LCOV_EXCL`` regions in the Xen source. Each excluded
+region is tagged in the source with a ``COV-GAP-<COMPONENT>-NNN`` marker that
+matches an entry below. A region is excluded from the coverage report only when
+it is unreachable by design, so it can never be reported as covered.
+
+.. list-table::
+   :header-rows: 1
+   :widths: 15 25 10 12 38
+
+   * - coverage_gap_id
+     - file
+     - line numbers
+     - SHA
+     - justification
+   * - COV-GAP-VGICV3-001
+     - xen/arch/arm/vgic-v3.c
+     - L796-L800
+     - 351d41e8aecc3f7566a0baa7b4066d06dedd7113
+     - Both callers select the register offset with their own ``switch`` and
+       forward only offsets the handler has an explicit ``case`` for, so no
+       forwarded offset can fall through to ``default:``. (The SGI_base-frame
+       ``GICR_*`` offsets one caller forwards are numerically equal to the
+       ``GICD_*`` offsets the handler cases on.) The ``default:`` is kept as
+       defensive programming; it becomes reachable only if a caller is
+       modified to forward an offset the handler has no ``case`` for, at
+       which point this exclusion must be removed.
+   * - COV-GAP-VGICV3-002
+     - xen/arch/arm/vgic-v3.c
+     - L954-L958
+     - 351d41e8aecc3f7566a0baa7b4066d06dedd7113
+     - Same design as COV-GAP-VGICV3-001, for the write path: both callers
+       forward only offsets the handler has an explicit ``case`` for, so the
+       ``default:`` arm cannot be reached and is kept as defensive
+       programming; it becomes reachable only if a caller is modified to
+       forward an offset the handler has no ``case`` for, at which point this
+       exclusion must be removed.
diff --git a/docs/fusa/index.rst b/docs/fusa/index.rst
index 5f1e8acfc4..dd5ca4dd95 100644
--- a/docs/fusa/index.rst
+++ b/docs/fusa/index.rst
@@ -7,3 +7,4 @@ Functional Safety documentation
    :maxdepth: 2
 
    reqs/index
+   coverage_gap
-- 
2.25.1


