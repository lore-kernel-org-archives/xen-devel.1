Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A45AC982D0
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2026 09:54:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1423833.1648719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x78oJ-0001K4-J2; Thu, 17 Sep 2026 09:53:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1423833.1648719; Thu, 17 Sep 2026 09:53:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x78oJ-0001Jx-Fv; Thu, 17 Sep 2026 09:53:43 +0000
Received: by outflank-mailman (input) for mailman id 1423833;
 Thu, 17 Sep 2026 09:53:42 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x78oI-0001Jr-8c
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 09:53:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x78oG-001vNq-QV
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2026 11:53:40 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aabb89e-e002-0a2a0a5209dd-0a2a4508d8b4-10
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 11:53:40 +0200
Received: from [40.93.196.56]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aabb8a2-f659-0a2a45080019-285dc438b8af-3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2026 11:53:39 +0200
Received: from CH0PR04CA0077.namprd04.prod.outlook.com (2603:10b6:610:74::22)
 by PH7PR12MB6491.namprd12.prod.outlook.com (2603:10b6:510:1f4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 09:53:34 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:74:cafe::8e) by CH0PR04CA0077.outlook.office365.com
 (2603:10b6:610:74::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.12 via Frontend Transport; Thu,
 17 Sep 2026 09:53:34 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 17 Sep 2026 09:53:33 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 04:53:33 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 04:53:33 -0500
Received: from [10.59.21.158] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 17 Sep 2026 04:53:31 -0500
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
 b=s+4oG5Zlg7rpHWOpNpubXCtWklBjhah+X60ZYr9Z9b0mqyefcxfQUQydWyE6oX0Q3X1V7Eb1WNNAC5mZuS/abCPbczdpMd7xlZX4dfjb0RVsgWmLV7EYFBTMcCPmvTSHybnj8Ul8gdEExp1vXoZGO2XUzSyC1vOhxYWppu3t94ld5MHY8nHKLmpE9jUWK6oS7vC9Moxx6FqytZpZn9MiCFOC5EBb4sx2p078qRsCCKi3KEttbLOHfm7qUZUzb0kDFX2kas5F1Gx0LE4PEK3F0uKNXZn/ho/l4oqAf5GCaKjpc4B37MgTnft6bQ5fJZ25FcQvwpFN+rwEGqvhFlmXKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2J8t7NYslWa+wbHBKZXAQak7qxXejaVKiIYjoQCp1c=;
 b=mRDaXnLmlhZHorpDI0Nd73QapR6jUYCM91X/SUdsSH5QcX8ZJCOopmNRXf/2KWNw4sCuINVyc9OjEPY3SujduqV+SQNfQBXNFDWx8NFi3lXnWMQ/CEoWYPvv/aeQpi2/9eEQsImMyKZiXoH/zOyZxrViTMt/JA65PuBfO7mCn2W2MTWUagQjTZvwZ2hBiGUYoOb7WIrthSZ7vob2IIk1f5u31tt6bqDc/TuBTRZmuakbMD70WGpBLnMWlINGMe1x0ciIQsgHV7W4I7nhh7Xrg2D5lGShuVX7ZGFfNM9WxaxOluvIz4eNHygZnntxuetE6AsjyaIYP169F2bfsyHthA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i2J8t7NYslWa+wbHBKZXAQak7qxXejaVKiIYjoQCp1c=;
 b=G0ED7XUmNyJmrICx/qVwtJ7r1eCNC3RJrURLh258UTP9ge0YPI2I9b/Hb6fGWpADQHhJocIrQLKpwSPAaQt3gYd8rT2xYeWhQg+kgMJlUCxeEg6BPxvT5z9L+u/RH0Fb3t2O+ilJ3uLKsjYNe3WOVYeWjBtqbLe9XOxrammFjeQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <0054cd1a-1f2d-4484-b70f-419f9b5ac697@amd.com>
Date: Thu, 17 Sep 2026 11:53:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] Arm/guestcopy: avoid use of "current" in compound
 literals
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Volodymyr
 Babchuk" <volodymyr_babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>
References: <db6f62c4-0631-43d0-a501-9667af6242ec@suse.com>
 <7424be87-9a97-4b83-b920-a8ccf4c1a889@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <7424be87-9a97-4b83-b920-a8ccf4c1a889@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|PH7PR12MB6491:EE_
X-MS-Office365-Filtering-Correlation-Id: 956ba756-f1d8-4ee9-5bc2-08df14a18987
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	6rNK5T2sJ+g4ZmkFqKCP3gzYx8Y/MJc6w4QTB657nptAIRLaPesu7wPfslWdWc6TPyqAXKgfZFdEq/aW4FYY+zKLrw5DDYuNIa9aainU9A9KKpEv/r/31d77uLVD0h0eHdakFc8lyPIH3FRRf0ebW//SQwOnhXhug3dPNbuRYGdV6nSAeDAgJRQ6R09phBgOsoCtbiatWcxYwzyuqvk1ph9ae4Uf13z0MWhjw2yI4ZH5fKxdBOSYAFJe4iH03ggjUHnENHjTAqVbet5ooxciuEnfPoId53K94Dkow5B2+dsjZM06IZ16OhggY6EMtGVMLBAHLIQzIclPEagsM8uJTIJttuqVA02P45yZMU284y8pYKFwPqwFxXafL5q/Lpx7fIUOmGs6qHXE3t+11x3r73EkOHOAFjp44xQMKaxJxKSy6We0LNVxNmjpsnPjJImVTsWChetB4rWoVMvU8HkJLK2Ty344dpVvZvjBWOdLsHsEoCQ3C1fmaRPcnBzd8Ob83M0Miv32MGjtCt9VR25OCYHt96/dnT8r0eXCeYRrgzAo5jDcb//aIKm7L2203pX/51EkGL/0YdwoTuEMjSs9XBXbwL9bhpmWeoJU4RIzvGuVcDgeCWVnEvoJPWJEc1xi3knp05Tk63YATXxJ2rLfP/9+XVa/mN6KkPTTE8mDmtlgWkAnr8mptmLHvbcY8ZVmj4bJH6Q5p7KoO+IjIRn8Tw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kH++CO0zr4Q0AjAzDF678t50AOPSFmKbGOL8UpDFjfv2zm3VnO84ZT1DZDdYo2sg3n8whUtBm3IxITLURbbmje4TJnBYer1GUAHwvCPKtwzIvY0g+qC/w47hrxhHH8b6YVTG7Vlbuar7DVyPpHITHhVygT9WZ6UMHtTG+v0e3JudO39qv4IyNIAN1AkewQOB449FND7f9XnCCIuNp51rtwZMOcGSarJR+dTmNpBZfVWlLFCWjM6gI/do9oFzV41BLOH7i5Pe8zFtpLNr3fJzgh1BSakVc/tiVzw+1t/QTI2zOAcBd6se8XneRDnKYFuKJzV4UREOlzcdkZdE9IktCswWgFQU/Xn82Czk3Ti30DUZ+bCKrEvA85Kr6je4zSKDoiyqlOP/Rgt62s3O9lviQd4F2c/gm24WAjOqo8OcbaENS3G3agqhs9/edLyItaJd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 09:53:33.8979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 956ba756-f1d8-4ee9-5bc2-08df14a18987
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6491
X-purgate-ID: tlsNG-c1860d/1789638820-D715E87B-1E5C1263/0/0
X-purgate-type: clean
X-purgate-size: 508



On 03-Sep-26 13:52, Jan Beulich wrote:
> Compound literals are also covered by Misra C:2012 rule 13.1
> ("Initializer lists shall not contain persistent side effects"), and
> (sadly?) that rule also applies to lists with just a single element, or
> more generally with just a single side effect. Use intermediate variables
> to overcome this.
> 
> No functional change intended.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


