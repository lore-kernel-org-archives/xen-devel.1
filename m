Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF21FCC6B1D
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 13:52:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449075.1665004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGzOh-00025k-77; Wed, 14 Oct 2026 13:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449075.1665004; Wed, 14 Oct 2026 13:51:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGzOh-00025d-45; Wed, 14 Oct 2026 13:51:59 +0000
Received: by outflank-mailman (input) for mailman id 1449075;
 Wed, 14 Oct 2026 13:51:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xGzOg-00025U-0j
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 13:51:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGzOf-00CPBA-Dq
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 15:51:57 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6acf88ef-e002-0a2a0a5209dd-0a2a45018f5c-44
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 15:51:56 +0200
Received: from [40.107.208.4]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6acf88fb-5984-0a2a45010019-286bd004b3ef-4
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 15:51:56 +0200
Received: from SJ0PR05CA0130.namprd05.prod.outlook.com (2603:10b6:a03:33d::15)
 by DS5PPF016FC81DF.namprd12.prod.outlook.com (2603:10b6:f:fc00::644)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Wed, 14 Oct
 2026 13:51:52 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::9d) by SJ0PR05CA0130.outlook.office365.com
 (2603:10b6:a03:33d::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 14
 Oct 2026 13:51:51 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 13:51:51 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 08:51:45 -0500
Received: from fedora (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.53 via Frontend Transport; Wed, 14
 Oct 2026 08:51:44 -0500
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
 b=Pbi09iRC1Alad0XkEFhMLWxtawn/1GsltDTQvaXUtmQUO1A7cN6/3VbsG2dWC8bzFL6aEItIzwun4FgNjy6Cw6/N93Az3bHTRn4Y3JmCYmKNJXmYdFb+egPmPV0UnOBdvoPiU8/CUDBinJTIdAItblK0ZiMG7FjpOsNAq6tVOBi/Yc8CfaneZiXFl1W/5bzPM1+zDyb+R1kdy6Lt9pQMxtU5NrF+yf22rzoMHiLb2NaWZFQN6UXCKesPe4n+tmbAu01Q1mXhyZHCt54g43FRdLLVxLeCyeEWZNFP5csNrVOfwWpdWA+kPiv//cl1FEMrJTYe805ozRkCRQITIbp2Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAum0bynBk7VkXbGBDywK+sew5/0kT8vJpsI6r9G5SI=;
 b=WbAL9Q9CW2MM8p3rCvizJClY+xYg3TouIJ1/B74bP3cUEONuj5o6nIcbaywN2UQQaVQsjc5OYZ2PbyDyiHtYm74it3aRaOU3NHw7l8Ryue/2zJ0Ft/l+N+qUUHVkGjASZrdNk4yHR/Vi6bwhY8NTg3MgjFQgfUm7hYVKEvfELKFBBI/vrPEIjBMm7LCyyyw8GtmRY9YFZ++6m/xw5Gbm01lMb4IakCnGm1xoDG28o3IIMPgeNAdKx/z4BfycQ5Yvyq6Vxl6IMFFsksfPy+4RiMTAZMBywj7ep3D4jmNj+mz2GAtQ37KA/Ai8dIXg0x3BeCRWKGa3nZf/MfG2EBOVvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAum0bynBk7VkXbGBDywK+sew5/0kT8vJpsI6r9G5SI=;
 b=ZhL4ssDUxWdwYzWoSuQURvsv5qVYgzY9x2kj6cHewHQOPss2VrVJ/jIyh6Q5f5hLeMfK6Sbrax70i1mu9pupTABwjJqdzvoP9N55X2ErF8Hbc6VI96b3nbnWOfQmvh0BGD+9W/AS8RclI1NjPy9q1v4n207Ja1b0Q6am2olHJR4=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>, Teddy Astie
	<teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH 0/2] amd-vi: ATS fix and SUPPORT.md update
Date: Wed, 14 Oct 2026 09:51:41 -0400
Message-ID: <20261014135143.34220-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|DS5PPF016FC81DF:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a713031-206f-47a3-7d42-08df29fa4cea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|56012099006|11063799006|261009223027099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	K4uR+xg/mKiVEBs0B9eSkxoD5ZAcaNW2mbZ/+EEcllV+IAzbmicF+eKcTztYJgAQOZ+G3sXV09wU3DnAg98QnDKC6nzPrWwTXaEPEPqMrGdU0kToBfmN7Eph7vrXORlmX/aGpon4dZoyN5q3Gfrb+T+KH20TUz1Bzv2lU1wkMthIGKO0zPfcgmTQQ+w7S/S62Pt5qPZMZQGryAMW+X5JGawQSVvTf6Su6sq4EOkIqxkwJR0rqnD69msUPpqAC/hmwNuwCPseC7Oaw6kS7ZHfJ5qevCOfyMmEjHsmohm5uKTzyGj74B/1i0EvvWFMY7KBL1ybFtapl40s4Ox85DNp0i+f5P7ul3+eHYOmWaziLUaWmuDV1RcZGH4m8tHDDMKEiR9eB1kL2jGH59pzmkSbEVmwXHanNLhoi+6MuNKF1JpqmXjSp9eqTEDd7J0fEVsTou49RqHB7Mf44UNfCbcC/EHctR7xFP6h+hW+CKsZ8M0qu4P7J9gPA35U/yDPkGFwPMLgzLye9pSY4kJf63JdLTE0/2y5fnRpYfHIYSeiVbIh2mp9J7T22ylwijLp5s3iFCA0i+n9DmlaBeWae5L8jhQatAGCRyiDHLzuXfeOeF1HprzduaAC7wJ+bo11JxyTHPqr3y+csS/RVLg7Z4yCbFfUNX0KeLJZv/gNdvBkORvvk320URBA3DhgeGfRWf2esmN/xUvMpF7ZtZKhMZi3AA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(56012099006)(11063799006)(261009223027099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ppog9jrCagQt+P+fRr4XLNDAdJIv0UT5Ti83h5wACHubo6urCvibCsu4K7Gh3rNeJ1DxoLiN9s18ymXt2yaH0NGq6apKwUpLqDzPQqWQQDOb9fcWEF7Sil0gCTrs8qpA2k4XcpqoCJuR4oGqcXxPq35YIgnfOhb33T+wtEsGsEYfbMfg0i5Wx6Vxns1uezx7mvUcTOxMVOKuyHV+4WECzDdGOTlfthC8/nuN4mV1C+rQ6OzzjxzAB9R9AO+ZPRc7dVmdewFed3qutMu+OakZ6IPDLaTwvdCIP6yXsOnyIE6RDZcRMILgs4PcglosTCiS7U7JDWgsGPD/eLCKc0DkzHMwo1JnpegCaO5Y59Y1uixf/+cKDdtKQ9Q0h/AZ9kNiUnxz4kqlvVBGF0EPqLBZoJYzssZP6Sd+hd0zPB1mfD/cubOC8nrj49HEV8dYVJ+5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 13:51:51.6362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a713031-206f-47a3-7d42-08df29fa4cea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF016FC81DF
X-purgate-ID: tlsNG-d62444/1791985916-BD146757-2BB13F2A/0/0
X-purgate-type: clean
X-purgate-size: 411

Fix a AMD IOMMU bug in ATS and update SUPPORT.md to state ATS is out of
scope.

Jason Andryuk (1):
  SUPPORT.md: State that ATS is unsupported

Stefano Stabellini (1):
  amd-vi: set the size flag in the IOTLB page invalidation command

 SUPPORT.md                              | 3 +++
 xen/drivers/passthrough/amd/iommu_cmd.c | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.56.0


