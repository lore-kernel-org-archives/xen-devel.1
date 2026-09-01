Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FB7C61DD6
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2026 07:14:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1404510.1638193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1Ihc-00026e-CR; Tue, 01 Sep 2026 07:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1404510.1638193; Tue, 01 Sep 2026 07:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1Ihc-00026X-9r; Tue, 01 Sep 2026 07:14:40 +0000
Received: by outflank-mailman (input) for mailman id 1404510;
 Tue, 01 Sep 2026 07:14:39 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x1Ihb-00026R-5B
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 07:14:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1Iha-0077jl-AP
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2026 09:14:38 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a967b4c-2eae-0a2a0a5409dd-0a2a450a98ea-44
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 09:14:37 +0200
Received: from [52.101.52.37]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a967b5c-f2d2-0a2a450a0019-34653425f758-3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Sep 2026 09:14:37 +0200
Received: from CH2PR08CA0016.namprd08.prod.outlook.com (2603:10b6:610:5a::26)
 by DM6PR12MB4268.namprd12.prod.outlook.com (2603:10b6:5:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 07:14:31 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com
 (2603:10b6:610:5a:cafe::a6) by CH2PR08CA0016.outlook.office365.com
 (2603:10b6:610:5a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Tue, 1
 Sep 2026 07:14:31 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Tue, 1 Sep 2026 07:14:31 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 1 Sep
 2026 02:14:31 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Tue, 1 Sep 2026 02:14:28 -0500
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
 b=ZQBNNJwKY7uCAI77/3/Tg1hO389FjLsDNsYGHVV1Jir69lQ8sOm5iBdQ/0AQO+olYpHJOtMZTc9ExZ2tQ7b2FPDx2vQZNDQPZihSHmm7huts5JRtDJGhzXxfQnADKAK38wxwcWy4ELiKbrcqUBXMBvdwIpp3e8JWqtvo2FxM2dHOsccASYI4JZBOQbSww9beFFPtRD/+z0sF34wLFtrcqF2dgiMEQcoArUQOSzFfyf5mJmqTT31XTSNQcnbzifDArSUUK1rqRQ666mVShGqJhOCpAzWcCc58W2emNGMFSKe7Cz51CBAvFwTh6I2+kcJGeOW9RUMJUfIz4MxJdYcbEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OoN2vw3UDsC1Lz/MWTRdE/XcswW4onF/0rl1nUHfALM=;
 b=Pp1WknXrKAAbC8S8MSTWeJ9IGOTl5/mzXUx/eNhoNqFMhBuSE7wUxyWiEhXHlxbN+eDoSHZAAyHq8sKD+u3UXKNmocjbXl7vQo3uUhVi9cQiDoWrAb8XCIuUJ1XFs/hsh1rpcqeZWGK/Y1TlA8pNnW9acpj1YpBPtu5JptNZZ9MObnWPRog/pdEzu5/KjqWBzJtYGPDN735exvPSfkDumlczTuvaTYFIOxUaxXjfbMu38BuNLorxhGEg0beBICVyj874WsGvYhJPDvMyK5jVDA15aFik5To2FjVJzMrUlkPdqTBnrAI1EU8Yb0xRcAVt0funC/wILBBEh55WX2gD4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OoN2vw3UDsC1Lz/MWTRdE/XcswW4onF/0rl1nUHfALM=;
 b=B7nWixRbzxwpaBTvIL3gANQQTshSlVur+lR3yWq2B5QU2hfUK96t59+qssZcvmZaaHBr7J1w9mcWKMaZD/vUXURBkrELh/88oFXp8J4DbofeXQPI9il6G4+G36MCgsq3vuJXD9PwpZ0yvX9Jx6kiqKZCAqTagSmRClQW7Xxev8E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <8737a6d8-cab7-4aab-9bbc-d5b155a4a076@amd.com>
Date: Tue, 1 Sep 2026 09:14:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/20] xen/dom0less: turn max_init_domid into a common
 variable
To: Jan Beulich <jbeulich@suse.com>
CC: Romain Caritey <Romain.Caritey@microchip.com>, Baptiste Le Duc
	<baptiste.le-duc@vates.tech>, Zheng Zhang <zhangzheng@iscas.ac.cn>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>, Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>, Teddy Astie <teddy.astie@vates.tech>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, <xen-devel@lists.xenproject.org>
References: <cover.1787836900.git.oleksii.kurochko@gmail.com>
 <5a74a964b763e8444579a3c0d455e23160be8893.1787836900.git.oleksii.kurochko@gmail.com>
 <b65fcc50-b249-4505-a212-b2f60c55f86d@amd.com>
 <885cb732-1814-4971-b554-9041c35c4347@suse.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <885cb732-1814-4971-b554-9041c35c4347@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|DM6PR12MB4268:EE_
X-MS-Office365-Filtering-Correlation-Id: 547da5e9-e8ff-4146-d306-08df07f8ab34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|7416014|18002099003|22082099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	r8yVAo6EnzsmaiyA685cd2XEu9pi3PoboeK6AGZlkESrACr4LQoz3gI8h/1eWfvVsDBCCkzOO5FJWfckfD8deI7Hq0AZF3KeHvR/AxIb88G2aKLfm0Tp/81qN154jaFDDwVRHOH4tYeWlXRHfbdwhYCDaeES0RRYvgg405KxgJwnx2/87wfHvTWyl3/TKfXQMVgs6DnApweDVcxQUIZgOZfZTCzhy0scFsUH8v8506UJnLMSdrcfC/wZGjZHDgCYdKt2F2bPgGztgQkiUglW1dtVGHBQDDNjXXrqqdsJ4mNbLx/bwlo0qkiptmqFujyz2TAhCPLWOMxrqfDYdM/NxhSMMZVpWJXP6WI6Gjv89casVTlkv/+F6A8uE7YX5haidDsFjsQ1F+zU2hO5SavzWcOAPdXrAt0mTgEwdHAUb0DzdOrZLRwmKDOBNotqOPyrT4xT778ljD73kfV5p23zn3yAQyABpeyXp7FF12mMDCkwq8oLsq6hBGOxOx3qo98R4Y9Q0am5xcO4vSp1Vy03YQB2wiBAJVfzyeNRSCPMOza9Xx1JAcAzV7xkwGC8S82EFZp22U/Hf58eDaqbWam4V27ZP2HmAQp5Xx33gr8DD8Q9CFv3t8nl8LzyL62UyjgtygYfZi166rTToUGOiZBePAzLj11vv0SJzTZZtJId5fBjwHPp/QH2hCY6c48VP0hT
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Jml8CdnC4ZN8V5wbOz++bJ9ctSv8/kVw+63o2VdBC6NsSelKYmzhL8Ov/i2e0WZNVc/vpDdfuLufSMhhPMukkX+QlY+5TiM9iBk1K8i3BgW97wMiPDe/SfjH8Zd8vL6GsIhvy6QwVYCK9ynNF/E1OwZLo2jJ89Wgkf/oyomndRSp837C10W0+T4AV0cIPPOFnR8wsMSCm4licGg1lznzgwL6P1Bx4a7Dsvzck6AztKmYEoEzrYAX9euI0S6g9NioZvykFybk0EZb+13mOGlJaT5mXrbPc5xgUPgwU+RmM2norAEvZMzqkdk3/qPuf8N7CArJIl18Yp/EBfDp2OqRjLd1Gvx4+Er/7CWU3ci75lK6KYy0U4fx3bZgiB5cDXgXAJco7LiJouimwNpDOz6UGo6Jy7+xQf7TFEcV1kclJDdv//AAoQqj6X9ZZMQkOiW3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 07:14:31.4998
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 547da5e9-e8ff-4146-d306-08df07f8ab34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4268
X-purgate-ID: tlsNG-4011c0/1788246877-528DDCFC-96E49128/0/0
X-purgate-type: clean
X-purgate-size: 1134



On 01-Sep-26 08:54, Jan Beulich wrote:
> On 31.08.2026 17:48, Orzel, Michal wrote:
>> On 27-Aug-26 17:18, Oleksii Kurochko wrote:
>>> --- a/xen/drivers/char/console.c
>>> +++ b/xen/drivers/char/console.c
>>> @@ -31,6 +31,7 @@
>>>  #include <xen/warning.h>
>>>  #include <xen/pv_console.h>
>>>  #include <asm/setup.h>
>> NIT: This can be dropped - I don't see anything relying on it in this file.
> 
> Did you mean to ask for asm/setup.h to be dropped here, when that's entirely
> unrelated? If not, the other change you are asking for could surely be done
Why are you saying that this is unrelated? Before this change `max_init_domid`
declaration was in asm/setup.h and this was the reason for this header to be
included here. With this patch, the declaration is moved to dom0less.h and
therefore asm/setup.h is no longer needed to be included. I consider it very
much related unless I'm missing something.

~Michal

> while committing (and I assume the patch here is independent of patch 1).
> 
> Jan
> 
>> Other than that:
>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>
>> ~Michal
>>
> 


