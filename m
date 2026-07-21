Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2059FC4451C
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 12:48:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367767.1617440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm9t6-0001fa-Cs; Tue, 21 Jul 2026 12:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367767.1617440; Tue, 21 Jul 2026 12:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wm9t6-0001fS-8H; Tue, 21 Jul 2026 12:47:56 +0000
Received: by outflank-mailman (input) for mailman id 1367767;
 Tue, 21 Jul 2026 12:47:55 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1wm9t4-0001fG-LY
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 12:47:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wm9t3-00DDDW-JI
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 14:47:53 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a5f6a61-e002-0a2a0a5209dd-0a2a45028bde-48
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 14:47:53 +0200
Received: from [52.101.53.46]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a5f6a78-6ca4-0a2a45020019-3465352eae6c-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 14:47:53 +0200
Received: from CH2PR03CA0019.namprd03.prod.outlook.com (2603:10b6:610:59::29)
 by BL1PR12MB5803.namprd12.prod.outlook.com (2603:10b6:208:393::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 12:47:43 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:59:cafe::73) by CH2PR03CA0019.outlook.office365.com
 (2603:10b6:610:59::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 12:47:41 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 12:47:40 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 21 Jul
 2026 07:47:40 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via
 Frontend Transport; Tue, 21 Jul 2026 07:47:39 -0500
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
 b=NIhAN/yL8h3vrlWyHu6j7OJDv2xbtmuaPlA7KbBUcD00CCpBo0vjTDcPtO2rkNpXQQpr/3qgakVfvj2NIgjfRiec7B7UkuJOqSnF7+cb0e0aBWHz24DfoszFpMfMKqOLSEjwKv4++1pseNYGvH9+nEPjfwOxyYsvgqiYucqRNA+mXdDXJRNlYfakUmxwJZYm2ojX9U9r8dG6921Yqipjd5Y5svkyKuCJ91khXdm4n6D6T2tK6BuwSzE3UFC0UqvnijIXH2CFAlJxwM6NGCyCOIzvC5pdO3M1X+TZwgpX05VEixpoYPHdjuNbUu9+ZW4FMLRj5om2WMHTEQYS6TOhcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Y0uwUT0v2bBAqwuFW9QXjD3kDY6jx7rvuT+bH/aqLw=;
 b=qjkFOz1G/U1cGSDrFUxtlMuecezgDyE5j7zoi5XANE4JOUXZ2cOnEjig2cUeVc51BlEIJ6mzvsS/iDP84SlhwJhlrUHPCqyFKPxETWY3HXSp5fHFZJbwOTQxGg3OPqjVOyC33YwaR1gSpkwoiicCFAxjt/Gv+5GQa1ngStAuvcBkEag2wwqRHE08mAbrJxicxHjpqHGYQtzVH5b0TAaMcHkirhYRHroehZ2/JutgHJJ47Q26l9EypBxbwGGrIuHjNTL5L0wPeFUesrvx0hNkUKr3oXlo4E9rBlXljFumGG3Hq/5LD42UNplnvI0ryDHe8U4MCuSgQV4bKuxUm/M/dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Y0uwUT0v2bBAqwuFW9QXjD3kDY6jx7rvuT+bH/aqLw=;
 b=tpHGHFRemjc8Tj5ynIRhUZacZa125QOsMsv3U/sbDKCbRZ7JwQ/YsUMUFo7l6/h21amWVSQbT9cwVAGs2Cy2C+0V+Fhv21joymglTOwMdmYtKxzFMHL1IB6PAJUKONEl5p793eY/VsQDdePOO8SdF7XcDPA8VQCzzY6ptzfY9/Q=
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
Subject: [XEN PATCH v1 0/2] docs/fusa: coverage-gap justifications and generic timer arch spec
Date: Tue, 21 Jul 2026 13:47:27 +0100
Message-ID: <20260721124729.868630-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|BL1PR12MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: b660d24e-f4ed-47cd-6491-08dee7264071
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|36860700016|10067099003|6133799003|56012099006|11063799006|5023799004|18002099003;
X-Microsoft-Antispam-Message-Info:
 8aml1hDxzncFwLS5ILzchQI7/m0Fi9sJVhHmed7e0CwiG36kPHmq7qNKCvH3iQ/6mYkuSTM4hqXEe/xdaRQGb+GsqttQBMXmeErn+vekmEsYxFWTDNzy0OrHrDm6WammXKOVaqq/ypjBoAsTImRB0wUdgmepemYbPJHQgnvu3utwY6O3c7moeCJjXlpuFlOYtL3tpGiTNkjwbGuZZ8E7dO/a2VXadWk/HD12kEmtcu7g5GlWvbhjNNKignMO/ncifuutiP7FjPBqK2pHxc7YRMEqSgdTE+KCpSrg7G8MAaRnWHQh77ZrYnFhrV2mjTL725+0MpHQd9fZ1T52aCLXo2juecqXCyLKodqEPCtDGgzHjAhJXj79YeZMNE+HlPXH3t4SoCCqLG/VtwB6LGkJEsogj8/07Tnhs+LORh+0bcmx1WH9e8K1JsU2M+So+J7HGkRPd5oM99cx9tNJRNdwBeT+K///nKVYfLCmCaKV2hijBsxNQOJYmq/0NIayZlOJr0tEQ9GoUgEEteFRIT+kTxxBbEZ8SzETgoeTkLavq7zWrbA9zPTl30an+12ltRgzl2W7doQ1fCmNxW9rzJNUd+yYh3oQ6sUhpnu+wdTQg1X8qrS7y8wDu8dQ5rwBuwX6O3sl4Sg9Pyb24dW7Lp3FTJx6gnrWKexdJhHSRMOdA8RokiO+thWxLNVzosckiegCQVs8P2wte90jXu1T6BFb4w==
X-Forefront-Antispam-Report:
 CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(10067099003)(6133799003)(56012099006)(11063799006)(5023799004)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 miNYHw9lvp8eK9268bdXxc5pATika+xvnK5DcX+oVgzPuR8lVscsAN30AkRZ+MGtw+ohx6/HvO3IR33y7+7g5Df8vtjDyxJ7r4CWmSQJuPZWk4JjPuGZLdS4hrbv3gqcIQJa0d30mUhwbrW31QqXkGWmfrPjZ7Tt2W6wGicAIgXlU+bXwbRt8nOyGzdMZNoZAUrJduGP35xDIgiDi80F58GpfhIvQqosAM2zx9nuZ+sYqUHQ/DcXJgWnzGIqq6AlR2lIoKF1PuBbd2sopS6zIOpl8K83MYoptd/ymAz1qMQ8r6i3KsL05ITWyau5cVAWVkGubsqMvot9aVy1jzgxOw3nplD/RMQb0Xcbzh3HnSE1o7TxtHQ465rkznMrsLDTsorrN3mOlK4uiVRziTFR7GS80Bl+x4EMar+EX8HgfoJB9A30lByMI2XOXrX4AMS1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 12:47:40.8604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b660d24e-f4ed-47cd-6491-08dee7264071
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5803
X-purgate-ID: tlsNG-720697/1784638073-F10A02AC-6F2EB5B7/0/0
X-purgate-type: clean
X-purgate-size: 1881

This series adds two pieces of Functional Safety documentation under
docs/fusa/.

Patch 1 introduces docs/fusa/coverage_gap.rst, a table that records the
code regions excluded from the coverage report because they are
unreachable by design. Code that no test can reach (for example a
defensive default arm of a switch that no caller can reach) would
otherwise show up as a permanent coverage gap even though it is correct.
Each exclusion is given a stable id, the excluded source location, and a
justification stating why the code is unreachable and what would make it
reachable again, so that a genuine gap is never hidden behind an LCOV
marker. The two vGICv3 default arms are documented as the first entries.

Patch 2 adds the arm64 generic timer architecture specification under
docs/fusa/architecture_specs/. An architecture spec is a prose document
that explains how Xen uses a piece of hardware -- what the hardware
does, which parts Xen drives directly, which parts it emulates for a
guest, and how they interact over the lifetime of a VM. This one covers
the Arm Generic Timer and traces to the existing
XenSwdgn~arm64_generic_timer_* design requirements.

Both documents are wired into the docs/fusa Sphinx toctree.

Ayan Kumar Halder (2):
  docs/fusa: add coverage_gap.rst tabulating vGICv3 LCOV exclusions
  docs/fusa: add generic timer arch spec with ASCII diagrams

 .../fusa/architecture_specs/generic_timer.rst | 215 ++++++++++++++++++
 docs/fusa/architecture_specs/index.rst        |   9 +
 docs/fusa/coverage_gap.rst                    |  41 ++++
 docs/fusa/index.rst                           |   2 +
 4 files changed, 267 insertions(+)
 create mode 100644 docs/fusa/architecture_specs/generic_timer.rst
 create mode 100644 docs/fusa/architecture_specs/index.rst
 create mode 100644 docs/fusa/coverage_gap.rst

-- 
2.25.1


