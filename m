Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D50CC982EE
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 11:40:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427366.1650072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8cNC-0007Bs-9Q; Mon, 21 Sep 2026 11:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427366.1650072; Mon, 21 Sep 2026 11:39:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8cNC-0007Bl-6P; Mon, 21 Sep 2026 11:39:50 +0000
Received: by outflank-mailman (input) for mailman id 1427366;
 Mon, 21 Sep 2026 11:39:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x8cNA-0007Bf-VX
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 11:39:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8cNA-004JDL-2s
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 13:39:48 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ab1177f-2eae-0a2a0a5409dd-0a2a4501d81a-20
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 13:39:47 +0200
Received: from [52.101.52.51]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ab11782-5984-0a2a45010019-34653433c42b-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 13:39:47 +0200
Received: from MN0P223CA0010.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::16)
 by DM4PR12MB6256.namprd12.prod.outlook.com (2603:10b6:8:a3::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.14; Mon, 21 Sep 2026 11:39:42 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:208:52b:cafe::98) by MN0P223CA0010.outlook.office365.com
 (2603:10b6:208:52b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.15 via Frontend Transport; Mon,
 21 Sep 2026 11:39:42 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 11:39:42 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 06:39:42 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 21 Sep 2026 06:39:40 -0500
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
 b=KzaZvVI34vZB7J8aFNL5J2ogwBYt9MYSaOFgozyveQN6Nq5Y7bB5KTEwWQmkvzdb4VoJjRysOXGQm9X5qVfhf3k4WZWPe/LEFiXkxCF/Bi6TFSIuPSwzuHTa/o9NKrEPjUdq0X35MdeBgFkP0Wp6xzfAg6W0PqqZyayv238XoxBhXhpOXvL/FJT+BjRzac3ju9G/9SU5J0l/LisPlXi9ah0cqPNosr214QvCl0uKiCT1g2rRc0wlV/fvuxy85fLdNA84LifVkJsOZflg8Vg6ue4tLH0/Yaq2hq3NZG3R5UqS+nKmuYHfZFOoj28bz2Ychutc8jX/rIEJCVPm9hTTYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KzQ7LLWlZC3JrWkqZmzW7lahXvFV5zhCK8GWBe6fcVA=;
 b=Wvnina/dgpnJATiiw/9fltoBxO9+mRe4m6ym/rJ9ifQJzeivsFmjk1BpduynbseGuOl0uyKFG/r0GuTegyW40QwjCLUNwerQVOp83CKvuzNXE+xQQfihj2XOWJbalk7vff5nDKh70o2C5rZCbdHKZOdDTplQGueG/7Ig9vuPXQxrVPgHYUoFPYXTgmdPRGJUkvmPOAGTSKPelgmkWqNxfvH2C1LIXFJbZcKzuiyeTrIpIktWJxX9ttJNgf+kZbhpn2efN3vjZ4JlRoOJbvr3YDZkHbHcwVkBU5elM47TYDt07SUBJdx6N061JNhT4ZFnxge5Jx6SpBMEW0xZHLOJdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzQ7LLWlZC3JrWkqZmzW7lahXvFV5zhCK8GWBe6fcVA=;
 b=4EnscFP5OsE7KTG8GJPePxGZ5p3ikVr4VMWbucK5uhM3fcyGyvVqgQ08La5B/Ir3vvAk9fuhK0WOw5FEYy2P4qKx43F/X2hweGT22WpJ7EO6r3yCOuWo2m7fgQyo2MfKgM1Xp5iLtyKdMzZ7FGvKbEx1B9+As9J/z+uttMaXpCg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <d0a11bc0-3732-4dec-9b45-adc1e1f7dc3a@amd.com>
Date: Mon, 21 Sep 2026 13:39:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] Arm: split xen-syms linking rule
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <153fd1b8-810a-4091-84d5-5395d83f2ee9@suse.com>
 <ddb77049-3a85-42b0-aa96-ee9a8ce500de@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <ddb77049-3a85-42b0-aa96-ee9a8ce500de@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|DM4PR12MB6256:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d12ac6d-3c00-4a40-85fc-08df17d5072e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|10067099003|4143699003|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GD+M10gZfjFQSwbkT6xhuA0HsVJjdoOrWK91WZZsxewBcLVMiU6JGj3SQlo9UO4EpHmGFv0Lz9ogOh44n3TZDBULYDfkIgCkBr6EbKVWvLibT4LKw1jdDpkLQq7Hw3rn2Z01TOu3E344Vy4A61ZsmYPgnQ7kUSi8ILsCDl/p+uYDf+NRLSkdUN23DVwB5JvLgZxsm0v6wo1kTylKPxuKQQqVhHL7QayaWjEzkRl7OjlAJNE5ahq2jKmS1KsJ+FL4M7Gyg1BdKCWkIKweS0ueXlOCx9CRl4m/4FvdQDWRo9trCem+z1n6ijJ6VYPV6Nk8LrG7d3VdOChH00EYp3bgMlLnWs0Rxqtx7suvfmgaasJ2e6kAxM93JrbOsAmyEe+O6GexKsGtpx2/QtXQFH6AVZAtfBQz13WrK78qReCPRgrSOhGmDNTewgoE21dJ2SBbe/LazN99VaB6MhR1WbtGx3Yy7G/mUzE4lnEB3h5dAQ5e7sjiBRiR6ZHCl/kPgMty7e+gSIzdaR7e6hKTX47lJWfw+gs2Zup7S5OYvIxNkn/32tVyJ1+oWUz1CVSoaAhnBNyg6AZFLXE8KlAfb01sdj+doQSPnJsw3TIPoAQVFjwqwZFzbMJerk1i31HSvk1+FIPabluupdXRQDEqRgHHtR/1aZek8NABvR9JPYZojB9DOKJUxR1LxjP4m89Z++UrPF/2n0eZdi+x6IZYozaFIg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Rl3Zvqgc9rTJB9Qozco2U7GsDJCLSyUsyHbF0Su5Rc7oSd0thhmNjTz9yQ2chnDrA9Va98cQWCij0yAoo6Nt24pEAcsmGVyLJ90hMeuu7qRHPtD73suRiE4SJXukOA2AEtRRhMaLVzAccr74bQh0g3gm6VYiSI7/wv/wEJnWw0VMCKGL+HZRTpjpOJPm4W6mqSzzBntXMSK90JhRT20ddbDsp5WJaTx514xZFGExC6UB7RfDfGlqEuLosky8P7021hdF2iIJ2qD/YwVfGNRWKgEXTF4p2qTeSmaT1t8HvKsnwpCaH4xa8eJpeplxR26+XlQ0LcqLHZ4NHqiQUE60X1E0L/ppz32M7kd0YQt68MaemyM5Y1De27caSKjeYeaWgQwFe8MowjsO180wF++jwisFCpveADbEulduopW9SqK1XsntCRDljL2J/Ackiqkh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 11:39:42.5431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d12ac6d-3c00-4a40-85fc-08df17d5072e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6256
X-purgate-ID: tlsNG-d62444/1789990787-BF262757-6F3B2E42/0/0
X-purgate-type: clean
X-purgate-size: 1173



On 08-Sep-26 14:28, Jan Beulich wrote:
> Doing so, besides (hopefully) adding clarity (not the least by way of
> [re-]using pattern rules where possible), also avoids explicit recursive
> $(MAKE) invocations.
> 
> By re-using the generic rules introduced when the respective x86 rule was
> split,
> - the .map file now isn't created after the final binary anymore,
> - --strip-debug is passed to $(LD) during early linking passes (for
>   consistency the option is also explicitly added to the optional linking
>   pass rule),
> - CONFIG_{SUPPRESS_DUPLICATE_SYMBOL_WARNINGS,ENFORCE_UNIQUE_SYMBOLS} are
>   now properly respected.
> Orphan section checking, otoh, is getting suppressed for now, until the
> about a dozen warnings which would result have been taken care of.
> 
> While the 4th linking step continues to be avoided when possible, a
> redundant invocation of $(NM) and tools/symbols (plus the assembling of
> the resulting .S file) is hopefully deemed acceptable.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


