Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429CBC61DD6
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 07:36:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405208.1638739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1fW9-0004v5-KY; Wed, 02 Sep 2026 07:36:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405208.1638739; Wed, 02 Sep 2026 07:36:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1fW9-0004uy-H7; Wed, 02 Sep 2026 07:36:21 +0000
Received: by outflank-mailman (input) for mailman id 1405208;
 Wed, 02 Sep 2026 07:36:19 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x1fW7-0004um-Dc
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 07:36:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1fW6-00AbPm-Q7
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 09:36:18 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a97d1ef-2eae-0a2a0a5409dd-0a2a450bdc20-8
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 09:36:18 +0200
Received: from [52.101.53.68]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a97d1f0-b7e8-0a2a450b0019-34653544a429-4
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 09:36:18 +0200
Received: from SJ0PR13CA0082.namprd13.prod.outlook.com (2603:10b6:a03:2c4::27)
 by CY8PR12MB7489.namprd12.prod.outlook.com (2603:10b6:930:90::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 07:36:13 +0000
Received: from SJ1PEPF00002326.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::95) by SJ0PR13CA0082.outlook.office365.com
 (2603:10b6:a03:2c4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Wed, 2
 Sep 2026 07:36:13 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002326.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 07:36:12 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 02:36:12 -0500
Received: from APPOL-18KY0J4.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via
 Frontend Transport; Wed, 2 Sep 2026 02:36:09 -0500
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
 b=zFh30hrSgjMlwmaZmFINW9ZQPKEmG0/wLJAcGR8hJ6O93IRWKZQX6vqWaJ4wPkMOkLS632onOf3f5OgyFh54vMn404v8unpjBtH5f9fvymCEGDJFe8+22T9MeySlw0oVPKKtROZcJICZZIzpvg+mi4mo8m7lGq1nvhzqVYoWO7fkB2K9JHRTlKLUq6YQdvxW2p4IhfAGaLI38lYvTg/nddA7A+ymrFVHbBGU1XE9ZkCrqQQMG1EdNLPfYH0/0oVZJCvH8TS1Lo0XAbtfsvLkpmhQ2PCcuFwpieV1LbtqtQrZhpGV76+KmQjkZT3stdZfchr3UH3lRJxxek59QCaIdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AMJG6YY/did3lw8VI5dydANsaKn6RmKRYMhQgxT+AHM=;
 b=tv2YYcJ9gdbyCt5bC7Luei8R9b1zF4E+jPYRAqhMNStB0M1dZRPiST43+njj3rpzFqpp1Pheqltw7KQIzUiMO+1C7cqw//w7kE7UakbPpqp5AWXLuMPQ9O+NWpiHRIpYE70Ug2xhjSLtvNYkh85Qmv7TqGTcqeqpflUOXJhj00vKi85/O/28DJERVW/1W3u9uvZXnE4WX8pF4zkn3D/EJryw/+5ozYfGTrmqbnrF2zaxnGK9rIFfH/vwoEcrbIl4ViCCC+mxoAJSKgSqBCtMSC/pSc0fg8CyxFF4tjShsxpn4L3cCguTp04S8cwbz53SExY5f2gaTXXGk35BSUlO4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMJG6YY/did3lw8VI5dydANsaKn6RmKRYMhQgxT+AHM=;
 b=g6PSb2/yg84S0dn9Lk2oaKpzj/utO3enb7V+3NDPat3uFAC3P7fA/J0jyd8RydOOcvVuM3wUDkk2kIlF0xo3uFqfbKH7iSUZc+IPSl1/XZGVzoN1eZFsVIUdoP2He10KgNDlMfQJ5+aijEsWeLD7+/vizTgqfKuGGpvT6jlajN0=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 0/3] dtuart fixes
Date: Wed, 2 Sep 2026 09:36:03 +0200
Message-ID: <20260902073606.61062-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002326:EE_|CY8PR12MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: 80b781c0-39a0-4f2a-5edf-08df08c4dd11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|7416014|36860700016|376014|10067099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	JqhBtzYFTbQeKrzzGGIwB01ZuY+PCAx+2xwnKv68eI0K+x938vrGNGt7OypRSN53U+g7uaqdAqNxlQozP7NH1WQ/byzXCM7aLs6g0s1AMNISUenWbXREkT/I7A9xnmWSHjy/QOOyEQJIII7CBbDdzOE6F0I5prqiY9xsgEtyJAijif3p1C28uDxB1KsRFuKnwmmuQS62/d8G5ocXp8oWZcXRcXo+l7eBUCbBj8eqNqpbwqjklds3pSEWQRMdJCol5nZ0UU3b0kW6/6OnbMAcNtOg6pVjRMU+M+AZiYNJPxmOsx2AnBQ+s83m0Ao7Om1Dr7BWTgird7k5nhMLouznN2LgADmv7/9R+MGZpEklKiG6RLqc15DUiKG7FM/XoLc0V4B30v2fbMIvgSd1Ea7LWAf/6iKkxXWlorOdD+BUO2yM0Haevr3Ovpb8va7KmPuIe/QMREWDbWkGrHgnBb2Sy/4R5tw4AG7VFnybhhpBuVqY7QaglRB4KLHS5HfGxBqzcuVnmEG16PneDtHIx2PXYU4A+ULHa7tOMVJbfIp8RTgVGFxQsbv1NzPveU3caBbbUQYHaoSxIPhvn9dhI0za20L20jq3SjBYWgtJHG/bRtKzbhXlG6vhXyEV4ZKxGetFCQtwMuw0wVohzVsvQA6F/a+9Dr7NBZgClol+18uz5jud7LcbD/hGPq0t77txuFLFv61n6mnXgZ7fdsE1X+Zqlg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(7416014)(36860700016)(376014)(10067099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Sp2d8ValGr5u4XQDOeFdqwW3HlHajRhQJMxp/qz/sQR64yEsfMbFcfQi047vKDrta5dIHqCpHshxaDfZ3lGsSKY1trCcixywmvwzkGDtlCgSPQU6ekyquHNaGFHv1I5AK2V1JX6DxsjizFl84FQ8K02sV3V8IMVfHcHSNA/P5LGhyVV0VFMoJ845z9b0ICEvegzyun2G1RaebOkZwCRJX3OxlacxeIiTbzjiOQR1oD+G6BqeYNLWSHMyvJu1yMy12zM4l2EM3x/gg3v8Ya0++1VEocwc/LpHJDo5pORsb2P2UhebkgWZPLowKVRP7kcKytko760B06YZzWAeI7nj90D/l0seqTSzQn7Gsu4uDKZg+rbKMEDCVCRlSgy9RTObvN9/sYvRgueW4SiObn/vf+HXOdoRb6I+5+a/dM2VxvXW2dIsaswi2MacRryYSr4A
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 07:36:12.4685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b781c0-39a0-4f2a-5edf-08df08c4dd11
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002326.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7489
X-purgate-ID: tlsNG-42698a/1788334578-AAAD89EA-3F566B4F/0/0
X-purgate-type: clean
X-purgate-size: 531

Michal Orzel (3):
  cmdline: Document console=dtuart option
  drivers/char: Check if console=dtuart for ACPI SPCR serial bring up
  drivers/char: Panic when the requested UART fails to initialise

 docs/misc/xen-command-line.pandoc | 13 +++++--
 xen/arch/arm/setup.c              |  5 ++-
 xen/arch/riscv/setup.c            |  6 +++-
 xen/drivers/char/uart-init.c      | 56 ++++++++++++++++++-------------
 xen/include/xen/serial.h          |  6 +++-
 5 files changed, 56 insertions(+), 30 deletions(-)

-- 
2.43.0


