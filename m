Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8DAC43458
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jun 2026 07:11:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1347263.1605133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we68m-0004gE-Lc; Mon, 29 Jun 2026 07:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347263.1605133; Mon, 29 Jun 2026 07:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we68m-0004g7-Hx; Mon, 29 Jun 2026 07:10:48 +0000
Received: by outflank-mailman (input) for mailman id 1347263;
 Mon, 29 Jun 2026 07:10:47 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1we68l-0004g1-0U
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 07:10:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1we68i-00DSY1-AV
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 09:10:44 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a421a73-e002-0a2a0a5209dd-0a2a4503dce4-2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 09:10:43 +0200
Received: from [52.101.201.29]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a421a71-ec1a-0a2a45030019-3465c91d600b-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 09:10:43 +0200
Received: from BL1P221CA0025.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::13)
 by MN2PR12MB4176.namprd12.prod.outlook.com (2603:10b6:208:1d5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 07:10:37 +0000
Received: from BL6PEPF00020E63.namprd04.prod.outlook.com
 (2603:10b6:208:2c5:cafe::36) by BL1P221CA0025.outlook.office365.com
 (2603:10b6:208:2c5::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.18 via Frontend Transport; Mon,
 29 Jun 2026 07:10:37 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00020E63.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 07:10:37 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 02:10:36 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 29 Jun 2026 02:10:34 -0500
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
 b=qGMXdZHHCQOM6vqgUglCCUUwn7IwsXoKHFY3rlhGSZ4pT/NcLNuL6ijHAQkfOJGrV7YzchhFCQKhQzi3s5r+Z41IlJuVfefI/CTa1fYpXgOcfTAlX3Qa2Y852BA6R2/gifu1DRkJKG7klh2i82xz8i4ZhHpew7ZY43bKKzkHJL6j02UPVHyfKzhTfQX0gJw2c9qrvhsLgwyxLjA0t6uvgnJjoRj/OuPiyNp56xQ55njpa9uu5eeW+ZKK+4GNDqR4tiIAd2O0UTrM4uyKRlBxt4bIkV7Jqurag0i/viLRoInt99bjSUh8hElIvku8GB9RM42d7QLPVO+NF30uc4aOUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8eoeZG+hfDTe5/2GWm1BgmA0g21lB60um9yfGSOJKp0=;
 b=mHhbqqmRVHu0lnImzxuDgiFhB07YrgGMdQFyhZtyJP0dvalrYqGuipU6UFIewAFdc7Z5uRR5kkVtI3sxq4ObKUVrdk5sQgMqdX/+940C30nJZJxNVoJ8pEMbU5uXS38nB+OyqNcV96SbEyq/N+iru56sp1RFlL5GjhI3Km4WUCF2RQYnL8rCdgyI2PLcVQh7pOUxc2FgBy3yd5aVXqjhGv7OX2JaYfPW082jUOCW2U/7UNE9QyYKb1ku8XrCI79tI6/thyq0S0C/3JRZTHZj6rlvUQY50csGE+0WYSQcKI4wR0PGB43ohuGaY2c+0cLNxAUPmtxeUT0u08mjk3EfAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8eoeZG+hfDTe5/2GWm1BgmA0g21lB60um9yfGSOJKp0=;
 b=vFoyveVi0UaSuS3aW7d+cw+zRfwYCUV8QOhbAksoJ7kQWD04e1QDv5oRUoPZ01ADeyToPp6tT3lGhy4uDzcoQCq8x4FgSApRT3Af+twpd0GgV9s1h14EQ4WfvuULs7osLXMiYC9QItCPsvYcHlY8t+QCHLvoyj3RMMYhU4FbUyg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <e1feb24e-9082-47b4-8b14-91e4249e2131@amd.com>
Date: Mon, 29 Jun 2026 09:10:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/25] xen: arm: move declaration of
 map_device_irqs_to_domain() to common header
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Romain Caritey <Romain.Caritey@microchip.com>, Baptiste Le Duc
	<baptiste.le-duc@vates.tech>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <ec994287fb54537b0d6a97a666d49f0c080193f6.1782487661.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <ec994287fb54537b0d6a97a666d49f0c080193f6.1782487661.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E63:EE_|MN2PR12MB4176:EE_
X-MS-Office365-Filtering-Correlation-Id: ef218562-321e-434a-3f63-08ded5ad8510
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|1800799024|23010399003|4143699003|22082099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	HA84p0UCXAaqlZduQPq2X50QyOQaYw/v+O9bAPf+/FXLF6OlKCzl6MkaH7wiR9AaWk2HyfXWrWP9BWLpnFk0mY3PXr5hHI3pX2CMJEYA0RUBbalwx/hZaG8Lbmvo4xkrbCs82Gi9Zev5FgBwMIP8fBbXEhRsUVmCTJyQYwRbnjN1Zkk7Y/CCdF8Cq5iySl8H/meqY2T4UnNY3E+sgz9ncSaTsuLNPbZ0nEl8gbHtrCeRlhEBA5TONkaAx/RjdD4BBR/JCkPF98hH3xZQgMTskwqhQb9zYsKPRYA2yhQSGHlU4zLcmBJgIy4V2EiW3+JYe/GCmu594I5ctGVXvK+XejpFa+80mA4PJoyl2JBxwE8xyY2aHS7+eKZsPWqCXYXe7XQYTZHyPWxApBq+q3S9i8zJhaYsb8viWB/OHrVLV0q2xg0mgc6iDpSH6/q5HRHkNA96QMPsIQHjaVK+4T5Xykm3VFeRaaExhkxE67+Y5hPHA3cQWMm+IUEv7Hj7CcEAfHx8oCOkbVduwz7gLel4OF3e1Q2Y7C3nDdf/wLvx52p3VNndncOn5GPNr7/rFxNwt5yMiyBzU5YLrk1CSwaO6+TKOhuyrywj8qD2cmnBR5bStrAG8pDRSn0W4CCkic7j/MPggkX5SBV8L+s+RZUd2ejrrsihEMz6KMCDJtpzhUQOffUPNTYeC2FK4rgKSirGg8jn+Jssw4/Wq2Io8Up6UQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(4143699003)(22082099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rVLKnwYHXFf+Er8QW/ZvOh6NYKstUKKVr3n/d8Fp9z8LsCRgVpD3btyO5xpnms2jt/fFsZJd4c+y2bV3f9Q1yyBjQ42mt5uCJ6vkp7iahbY4KPcnhNZOj7HCNdvrtvbHZz6mBjAwJhH/r5XvX32Sq2taNgM+C6MKh8A0O9A3AJaE7XD8T3WuZGdzEhZ3PXgZCKZKEVWc6/55/Qgy5imEkTiJ5DM6PKR5uzrXMjVM8sSrwdcEwpIUFkuiLp7T3F40iGxKQFT7beAkJEzpN/qnPHJywz313e87OgYNSlX2GgEC6TQxlk1TQ1GhDl18TfJp/OCw7ha6a9BVMANomJGFamgt7N2D8X71MKnTOmlId+CBkPiVWAOgDyquTXnR2YjktQv5nESKu8HfflIyk9BE6heKLfc1It1ybkvxz4f3jLjfVeFNI2z8LknknQTSslAD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:10:37.1336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef218562-321e-434a-3f63-08ded5ad8510
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4176
X-purgate-ID: tlsNG-33051d/1782717043-BC9825D1-E19E1222/10/73395122804
X-purgate-type: spam
X-purgate-size: 466



On 26-Jun-26 17:46, Oleksii Kurochko wrote:
> As map_device_irqs_to_domain() is used unconditionally by common part of
> dom0less code, move the prototype to a common header.
> 
> fdt-domain-build.h is chosen as map_device_irqs_to_domain() could be
> also called indirectly in Arm's DOM0-related code and DT overlay feature.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


