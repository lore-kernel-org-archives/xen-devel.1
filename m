Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FAFC61DD6
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 11:48:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405739.1639188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1jRX-0000PS-En; Wed, 02 Sep 2026 11:47:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405739.1639188; Wed, 02 Sep 2026 11:47:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1jRX-0000PL-C6; Wed, 02 Sep 2026 11:47:51 +0000
Received: by outflank-mailman (input) for mailman id 1405739;
 Wed, 02 Sep 2026 11:47:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x1jRW-0000PF-16
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 11:47:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1jRV-00700f-9w
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 13:47:49 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a980cd8-8faa-0a2a0a5109dd-0a2a450be758-34
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 13:47:48 +0200
Received: from [52.101.56.38]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a980ce3-b7e8-0a2a450b0019-346538269000-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 13:47:48 +0200
Received: from BN0PR07CA0029.namprd07.prod.outlook.com (2603:10b6:408:141::11)
 by PH7PR12MB7967.namprd12.prod.outlook.com (2603:10b6:510:273::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 11:47:44 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:408:141:cafe::ae) by BN0PR07CA0029.outlook.office365.com
 (2603:10b6:408:141::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 11:47:44 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.0 via Frontend Transport; Wed, 2 Sep 2026 11:47:43 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 06:47:43 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 2 Sep 2026 06:47:42 -0500
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
 b=Vy7f98JuLC0MWazR3/XgjLzjPreqyu5j+Mjx0t56d0YcfcePM2kspj6b9hclQz+R6SMwn5o/CVbXAbVvAPi2xJE4MECZcKsL09Xk/6kvp+tztcivM2Hmy1ojwdX5/q+3XzIDxryBwEtnDkBkkAdYk+PrgNMHCaMwvSAXdKmEtRNwadFHM78d/v140Hz1voVunYNjm84XR4Gf78PnoMJmiYcPZs2w/+H/VPqL6gvg5NgJ6JTw7R+rz/MghzZztt46+w4CLUpe/Q61Zuudwk6y4XurnQ3CeofXcr46tXUD1k21TDEbkRvUReYXtMqhXefBNtwc0VmSTY19huOoNmFCCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yj0snSe6erq9pFcsQNTsOsWW4pZ2V4+nXZnGyipvatc=;
 b=kAEUoNbGdVXEYAKtBWELWA6jNQ2H4v/Px5Kc3rz4wGoTi1pZmuVZQ/TOmKqAu/zqqCOJ71m0XMrrxuCnOct0JBprW8TO/wvBQGU3Uwy4v0R2eDgaXsGpL7Sk+qdP4x7dLDWv3+9gwbr8+GAgGkE40jFYCGAbKNXDa206nVr6LfV5nbyhU3X25dEV7RFx32fFMjSUtMGFIiw3EyWpsHOaoKlpDsU3IuOtKxZjLb7WMuoC0MZ7V9pByq4gG0mTWsO2eEHUdZ5ghGfopMEv299PldBPpQpPZ4zYH9VGwk7zVN70ZamyaLddVgEkfYV+6XmQ5GUgHvgGw79V7UrbhVsWaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yj0snSe6erq9pFcsQNTsOsWW4pZ2V4+nXZnGyipvatc=;
 b=Sr3Ssv1WFek+dxT114ukNA+5kXmYEm0U4DSmyw7HqfW/Ku/syZkJUc+QLA6OvIPxgDAQyNehhmowzk76bRWtWbWufzK4z2i+kt9KFWzQmfqKjD5dDrQ87cK5czcyHu2p+mmSSTibl/TecMHEHVt7X9LAvCtnOeOh4Sj38mpLfvg=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <f4b94f5a-d78f-4cad-9165-a92bc8111da5@amd.com>
Date: Wed, 2 Sep 2026 13:47:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/14] Arm/alternative: hide casting away of const
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <volodymyr_babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
 <6b3a3849-304f-423b-a3c3-a614d83858c0@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <6b3a3849-304f-423b-a3c3-a614d83858c0@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|PH7PR12MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f99d0be-f9e6-49ee-66f7-08df08e8004c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ULsMwfIZy7fk4MPY+MtnEC9j1rRcc5vexijHReDxZrrL4OVcUHRKMMxbCY3df9CTxKitZpadfd6E5Y7orpl7qXAqDHuRsf8XmWo4ntYStHn7X8Hl84oP7FJ1V7sB8saBP0or3MNcO0T2jh6KTZjzhqoJP0KZjAM5h3r1exqQpwbeqhdfJDHvIWAtu/H16lwltZKsfq/Z0vP8Hoj/jK7DONmJe4yy3Xny/tvLGAQ0wsCIdTu/A67g0Kqcsbil4fuLoh1NsLE6D+Somq4J1O8p82pJn9xEwXbHLPJSZPb9haL67r6op/bnEIfDytzeFD4RNHsYzbMILWqrweCFZJGvFWI4rhjOLc3l+iZUxynK52FBKAEkklmSDZxozpfDSVk4LRUCnTNkUV0q3o1dU/Ava7glIprAjvfbpD/6yML8mjBt0bqNlvzFwx/QlC2Pbm3JNeUzUvQ6jDNsQ2XqQ4ld/ew+QkhMcsc7bDjjFVCtKwTrLBuI/WSd7LyKiZIwzYK4MDn2DrYwe59GD8r1SQN48Co5/xH51JkjciR7DWjXhjB9c208VBzfnPhUqxKkq4GNYTeaSxnKCWM8D6UjMbzggZUQttWKR0Ma61Ugrxi740b2S8+quvEifDB7O7C6ZbIQloUXOmNlyc9REtH2YtzFrmNWbj3zswiqyyWCf2J4kc8mWxv05qPMfReumVzW87PIxqUFrDZUOuRdyKwUKXC2yg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Kjr729LZQ/sV5jBfWdw9urr6/vw5+kbQsjbXGH62ZtgXzlXdlYY0ZQJAwn345vAy8QZbpIMPtmKFDnxn+ncTtXWXDADFYs5WYZCT7Pk6Ucxrf6Ij7nhBiMUZDZ1ed2ZUMIdrPkZ0P37dEi8z5W8rDBni/8IeXoNRcitWoOUugKwYwUwUoreDNY55JOayaP2/5s3wH4FllyZdOKlM5GmedydpXgTWvcB0k/0I12f4llSw3+scXL8HyM3fEXHxKOmTI2XBX34pChpZBpMaSChySu+0GzOmTAMysKPN5MS6M6yq/U4NdGbE8wGgFkpQMFX4QQqqgerjdjtHh02zTkbwDNmm6NX0cRdRseYgdKG4wYJACXaBu04IkIY/gGZ1ZihnVfpGKAo6Y/p6B2/Os3IUR+lyKvlTak8GtJA7Yan0orKIHuj08GXhkDJ1fE1N7aIH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 11:47:43.9920
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f99d0be-f9e6-49ee-66f7-08df08e8004c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7967
X-purgate-ID: tlsNG-42698a/1788349668-19CC79EA-6E1CFFEE/0/0
X-purgate-type: clean
X-purgate-size: 750



On 02-Sep-26 08:32, Jan Beulich wrote:
> We want to patch the original call site, which memory-wise is unrelated
> to the struct alt_instr * that we start from.
> 
> No functional change intended.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/arm/alternative.c
> +++ b/xen/arch/arm/alternative.c
> @@ -134,7 +134,7 @@ static int __apply_alternatives(const st
>              BUG_ON(alt->repl_len != alt->orig_len);
>  
>          origptr = ALT_ORIG_PTR(alt);
> -        updptr = (void *)origptr + update_offset;
> +        updptr = (void *)(long)origptr + update_offset;
NIT: Why long and not unsigned long like other places in this file?

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


