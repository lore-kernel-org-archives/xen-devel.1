Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AF4CC6B33
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 13:12:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450510.1665958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHLFL-0007Ew-4N; Thu, 15 Oct 2026 13:11:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450510.1665958; Thu, 15 Oct 2026 13:11:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHLFL-0007Ep-1l; Thu, 15 Oct 2026 13:11:47 +0000
Received: by outflank-mailman (input) for mailman id 1450510;
 Thu, 15 Oct 2026 13:11:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHLFJ-0007Ej-IT
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 13:11:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHLFI-002iqT-R4
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 15:11:44 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ad0d109-bab6-0a2a0a5309dd-0a2a4504a8fa-20
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 15:11:44 +0200
Received: from [52.101.193.30]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ad0d10e-b57f-0a2a45040019-3465c11e9d9b-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 15:11:44 +0200
Received: from BN0PR02CA0010.namprd02.prod.outlook.com (2603:10b6:408:e4::15)
 by IA1PR12MB6329.namprd12.prod.outlook.com (2603:10b6:208:3e5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Thu, 15 Oct
 2026 13:11:35 +0000
Received: from BN3PEPF00022BC0.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::6) by BN0PR02CA0010.outlook.office365.com
 (2603:10b6:408:e4::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Thu, 15
 Oct 2026 13:11:35 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF00022BC0.mail.protection.outlook.com (10.167.248.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Thu, 15 Oct 2026 13:11:35 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 15 Oct
 2026 08:11:29 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 15 Oct 2026 08:11:27 -0500
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
 b=UNuJ+TJjBgSkVEBxh7raLlwXK7TxpCACzRzWvwxa56OcTpdCUl8Solc1iH+GU8/zNSZQlg7g/Bno/kTtBfWW6Rm/CyyQ07U/pYkyuV+R0QVmH7n1rz7lF1asm4R7veraBv/0Z8nVL7Ha9lz4iFLV3AZVapvHphPt/AM5RT1VlwQXwAERmAthINiRjJwREOHB/591jMHGVqQT5CHqehZDSkkg34a+WzFj63VudXjjBBIlxsY3WMsS4bhROv+X4PFlzTeGIKXHeFJrsed45QfU8iVT++g/UuIYahCiMWopPjlfuQCgKNnEKGQ0ps8GtYJ/7WY405f2loASRVl1nFB6Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwKOfQRWkzCkLa5s6exp88jnOwqDkCXQ0jfB372DrfI=;
 b=oyiezjzj7ddCOBQL32bTaRBBRdfJc1uKl05o8u3ARL8f2POVw9p3her1rFgOGZqrnT1TLKBUTmrGAERO0vIh4ae/b/CkHfRfquDE2swr/ZiiiqSjHPn3Ozbp87MEtXCkhs79oY4HNZ26Kq4F0qLeELaawkyWTEaId85z2moIouhqFcBd7QnKULoHTj8uHZBaI2z7tTaEUWQqVahp0TvNzgjrFO918bh9RlV8abT6FdahNux87WuzPbN6Qf6mquDHrIEipdrvMJ5rfmvgJUmh4AxDJj24t8fDE4y/cV5keDoMFkgJfDfvoUIjfa28ES0Mh6sWGmhh/XPsjc3wDJi26A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwKOfQRWkzCkLa5s6exp88jnOwqDkCXQ0jfB372DrfI=;
 b=jdVnEVJgSOfrMfnG2jXltp9uQYxSgi5E/rYjv9590YqjqJDNDpDOEtFdaSR5N35VP18ZYNPyMhFhoR/RR96a3WAVIGAffBWSyVt8iEaGInFCcscLVGT0gKqq5ETePIKrWOB7+PIspClSUbs1T9xhKjtlmzmovaVe9O2DQJ18aMQ=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <1471a2e8-4798-4a91-874a-41947c825b27@amd.com>
Date: Thu, 15 Oct 2026 15:11:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/device-tree: add a helper to dump an FDT in
 DTS-like format
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20261015082845.19511-1-oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261015082845.19511-1-oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC0:EE_|IA1PR12MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: 07f6ac2b-3084-49ad-b452-08df2abdd731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|36860700016|82310400026|56012099006|11063799006|261009223027099003|22082099003|10067099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	TuiMxFOot2/NS1dFlpCuQEkhPNIHQeVmoLkyYPqyRDa27dBahK0+dP9mbKV8obUCJ2I/qBUk98CmJ3Y+mzK2pLpEeU6DRAJTRwZcP7MGUfMlYqp4axL0RkfDp16d2lCBpiC+23eWUNqxPUQIyps3mh6SiNo0BC8OSJxRi3SBHOlKeDBd2+QDFAVXSP933yz+0MBls06XxC/RX1DyIr8MSQZDRFjY2OUMGhx06EsD7WqyLl4IYVq07JHcvWpL4xEN+QJwVi+vMjZtb1Jbh8lSzSqlcin0CWHWUkfKABz5YuW+d0u7Fr8cBvwo0M9A1linFwExK6Iy4sw8mKB8mplTiFn/ydSwxCblO647negOrRAjWx7BTFE/KElJHn4W1YdaEVYyFMOJJBFk0nV06Lj8cXh5040U5KhKtda1i6T2f6N9yA05cYYdwNW16Jws6sMnTCTto1BV758OdlPdwkHmfE8Kti1He5dixN7l4u2uCuamoxu8BXFr3oTplRzoHzxwT7lzAoatrQlO1Z2lY2c08M5Hb+siucwmGxQyG+81H8br4jcS6YNI3bgreui5kXatiC0LTAW0TPXJsZFfHC1irk2X7x4vbNWTUHLm2m5R9Cbj1LjWqZimQphpzHrVI/kPxz70ivSAoFbkarbLjeszXjtr37bzjhRyVs30zZFLqDcVnymx3mq+rZz+VPfW6srHIH+nVrY0gk69RoK1maRycA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(36860700016)(82310400026)(56012099006)(11063799006)(261009223027099003)(22082099003)(10067099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	w5B3SfkkOswvUkIGnZ2MWoMkJ4vASEq5tfc0WbUy9uBkEBJjs+9Op5uTmuLNDj1ojxRXr6i8jknDer13qQSXNnSFFNU1oKTxR/6iTYrDBTzWbn84Jtc2DRdSRxdQxv7Bgx7ZzF1CXV4r2ICYmbJ82uN7hnjosiDvtVgv6BxEULqONuTSenaymtPrsalhWXxC35BsJd7ZRVuy7PT1uVeV+4olV0MF+7GTT9/zrfaCBD8yMVBtTOwh4oG1+KzLoKjg/pazF003iVSqB1/UiZDrbYeVIydDTjEQa2klIv3X7odgfPYF+Y6LAfFjPMgY1XfaPbZOHzQuxZZuzCzerKQYhpnYcV0IqAt21wwuW7+L8mK5GSjRoxla7AZgyLikRHi3rAuYw9tTd7HX3G1w5X+giFB6G/jUSQ8Ama+rKDhn8E/pdKpS5QuW2VpSL7zX2cGR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 13:11:35.6992
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f6ac2b-3084-49ad-b452-08df2abdd731
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6329
X-purgate-ID: tlsNG-ebf023/1792069904-583C0B50-15A99D4E/10/73395122804
X-purgate-type: spam
X-purgate-size: 1092



On 15-Oct-26 10:28, Oleksii Kurochko wrote:
> The device tree Xen builds for dom0/hwdom or for a dom0less domain is
> only ever consumed by the guest, so a mistake in it surfaces as an
> obscure failure inside the domain, far away from the code which
> produced the tree.
> 
> Add device_tree_dump(). The output follows dtc's format so that a dump
> can be diffed against the source DTS or fed back to dtc; the value
> formatting heuristics are ported from dtc's utilfdt_print_data() for
> that reason. The walk itself goes through libfdt rather than decoding
> the tag stream by hand as dtc's fdtdump does.
> 
> Dumping a whole tree is only useful while debugging and costs both code
> size and a lot of console output, so it is put under its own option,
> CONFIG_DEVICE_TREE_DUMP. It is separate from CONFIG_DEVICE_TREE_DEBUG
> because the generated tree is often all that is needed, without the rest
> of the device tree debug messages.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


