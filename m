Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD23606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 22:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ndQmawuD
Received: from list by lists.xenproject.org with outflank-mailman.1475775.1682325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP5if-0006MS-15; Thu, 05 Nov 2026 22:14:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1475775.1682325; Thu, 05 Nov 2026 22:14:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xP5ie-0006ML-Ui; Thu, 05 Nov 2026 22:14:04 +0000
Received: by outflank-mailman (input) for mailman id 1475775;
 Thu, 05 Nov 2026 22:14:03 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xP5id-0006MF-Lm
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 22:14:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xP5ic-001bZA-OT
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 23:14:02 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aecff8a-2eae-0a2a0a5409dd-0a2a4504b5b0-26
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 23:14:02 +0100
Received: from [52.101.201.17]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6aecffa8-b57f-0a2a45040019-3465c9119c93-4
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 23:14:02 +0100
Received: from CH0PR03CA0037.namprd03.prod.outlook.com (2603:10b6:610:b3::12)
 by DS5PPFB8FBD73EA.namprd12.prod.outlook.com (2603:10b6:f:fc00::65e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 22:13:58 +0000
Received: from BL2PEPF000352D2.namprd02.prod.outlook.com
 (2603:10b6:610:b3:cafe::87) by CH0PR03CA0037.outlook.office365.com
 (2603:10b6:610:b3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 22:13:58 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL2PEPF000352D2.mail.protection.outlook.com (10.167.254.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 22:13:57 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 16:13:57 -0600
Received: from [192.168.19.2] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 5 Nov 2026 16:13:56 -0600
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i/tPqixAmM6zCUG4xjlXSAm/EIX0GZ2NzUU5WqXcUTlyMU8EkcBMp/2ivIjYqseAs+BX0LR5UO2Imc7cVKzdI0dxq+GmAwPTwtkYZP6cHUqE7X9q+cQYKoTa9EfLniFKmzntrQHWeTHZxm/ihXpvrlZaOmKFe4YeGYMAoIY27/8HJAme6LPiAliBd5OYXM1OeUdOuKS3pjp3InEJingJb4qps9MpzFHrifxLP/6HRjx7laiFFnEa6zE/jaMN5pF9ABFE4Lt30cKcW6GuDhbdwjBPibYg39HNn4lKztNoHxcf23ifYd2ywcvL7SF922IgEHXwILNyKPtjaLc0Ru9CMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iymiZYmbNPUrd5MkefBw4xPHLXThoi9sY+cXvPrbQL0=;
 b=NFklqWhLQIX1sJshag76A34pmY+KQxEyiCeKPI0JYb/jKTrSOXLXATffeQ9GJIUMyvqFdNvKEK4ePWi5ooWYew3TJCZauIm5q/Tam4VJghR77CPFN1jp4PTZeFCkL8EZXenR0jfpasv7PkzLCKpvDh10RTyc/6rzoNU4yBaCVh5Ff5BQ7c5nT3w5q9cLR9QrNMtrniFmX4s5D5/e65V+PO7YN8jnNxMYNpT3PY3Trwijkply13pkm7NaTLLAhqgiJcP7rF9MJIgsQjTjOq/UuOj0rVD+L0t6YFklppRQyC7k8HcRaVC5mwqv7uGT+Q6AiKgiy/QD0F68YG1wYIbVeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ford.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iymiZYmbNPUrd5MkefBw4xPHLXThoi9sY+cXvPrbQL0=;
 b=ndQmawuDtTfgbL5zcaCrTB/Z1reXMoWxFxWDzWZOkqaYWNHjL8i2UouhgfZEvNcNZGV8fzTaGPNUt48rAgMzHYc9Adze7CbF74Ecgr8TIRfBqdYYRyzQrf/Kx6JtgjCLwbP8fmQt4qlW8pkkZzJaufmMadUNcutAKVKXCIhK74A=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <c36fb489-d0a8-446c-a520-78262f70b31a@amd.com>
Date: Thu, 5 Nov 2026 17:13:50 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/28] x86/hvm: report SVM x2AVIC support
To: <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <jbeulich@suse.com>, <roger@xenproject.org>,
	<teddy.astie@vates.tech>, <dmukhin@xen.org>
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-4-dmukhin@ford.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20261105013347.719392-4-dmukhin@ford.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL2PEPF000352D2:EE_|DS5PPFB8FBD73EA:EE_
X-MS-Office365-Filtering-Correlation-Id: 3459cd2b-cfc5-46a9-68fc-08df3b8a168a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|18002099003|22082099003|10067099003|4143699003|56012099006|11063799006|261026121527099003|261021121427099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	SnjgytS/sFNLe3oSzr5SdGmYQsQhypyspKN1rDUx19FI5rDTkbXvU8VfxD7XiyH/2XDzeXk+pKNyl9bAjY38zO8+Yr4105MD8bW4Voig4kD+GoCfxw50FzPzw4/KNF51f/DwoAG80fOmN8mMLbAP7uMSWW6RECOLrdu9BI1mL13k4NKguq46EZw/X/P05uo+NeRFMqBn6Az5mYDjw7A/RdHB2uBrPudN5S4gDRu1n+VrvZeES1GcaBTjUll9lJO8WRS4MiZngyic7aI+yYlt3R3BpbSAoa4B1a5vE06mcPLba4o9YXVZdzP+tIxsRupXK5NRQ1y0Nqdorr4FFk8zDuWKo9tsa1CHp36Pj9H4LYCK3s5ko4dr2eVuOnCzu1/2h19xqOaS3WUJHOSYPfeFcdIzF0805TRjupJAZtQ1W007LqQwTxCbOEWr3najk1oPWOZSiEXrtTzC0TZrOW0Ccf8iiW12c5Yk0ZsEHHWZiyiZ6uVN9Uld7LXBKHAt0s6zUvPRKBUflan6kuUhMX+a6tLfufAHtMNzWXAOQropb2C3SNVgmB0RMwrq7zoPN48feRVDPT74ifmwt0B6pr98XweHoZiRhnPHpLwf2EXzCk6vlxH5OcOHYuEyqXhUJe9Rb7xMyznhxoRAoyotLGxEx3Zkc1D0fn0FFBpnulrNKwzDK2BhutIhm0ifujxEKP4B1XzuNinXLo2ypD37oAh2Bg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006)(11063799006)(261026121527099003)(261021121427099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	i7W67okspneK7quoigZ9j7EKeT+zlFudHp863brCS4EgDSaAoq2DnEfHAYQKNO7L/vSXdjA02ihZpsuqIU8+IFSkyb9WuZGJEYn7Mipe4KXRZNKf92Eyo08n5TLNw/Oy1ynZMYbbuoaliUzucvPkRCQdBOTQGZwl01LQ4QsDUfOVHhT9mHboTH+e00jQaDmvLrENeqQ0hOvP6v4tk2DB9xQrk2MnmLefbf6b499fqRwqzZpgpDX+VJkrlPMRBRBp5FgW8lqeBepON1RW97aurdEjCRpZ5KgmZB1ZfnrbrkgsbN7eqfTKRggzXHuHeoMSRLRBt7mEJ+0P5HXSjbmFskZav+Gv4TYu+PFD63cY4K4SDFJCVRrJzguJdYjk92ZxGL9fYhGuXhko+6MrBBI+w97sMPUsDcGs7sNyNzsDJ8Ni8r6fsxEVFZcEPH4DGM4K
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 22:13:57.9140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3459cd2b-cfc5-46a9-68fc-08df3b8a168a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL2PEPF000352D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFB8FBD73EA
X-purgate-ID: tlsNG-ebf023/1793916842-585C7B50-5BC7DB34/0/0
X-purgate-type: clean
X-purgate-size: 2367
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-04 20:33, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Report SVM AVIC support from CPUID Fn8000000A_EDX[X2AVIC](bit 18).
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>   xen/arch/x86/hvm/svm/svm.c         | 1 +
>   xen/arch/x86/include/asm/hvm/svm.h | 2 ++
>   2 files changed, 3 insertions(+)
> 
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index cf008a8acdf2..db81dad4b681 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -2457,6 +2457,7 @@ static void __init print_svm_features(void)
>       P(cpu_has_svm_vnmi, "Virtual NMI");
>       P(cpu_has_svm_bus_lock, "Bus Lock Filter");
>       P(cpu_has_svm_avic, "Advanced Virtual Interrupt Controller");
> +    P(cpu_has_svm_x2avic, "x2 Advanced Virtual Interrupt Controller");

Sorry, this ...

>   #undef P
>   
>       if ( !printed )
> diff --git a/xen/arch/x86/include/asm/hvm/svm.h b/xen/arch/x86/include/asm/hvm/svm.h
> index 0fc33f41b09d..292a9ee19b11 100644
> --- a/xen/arch/x86/include/asm/hvm/svm.h
> +++ b/xen/arch/x86/include/asm/hvm/svm.h
> @@ -36,6 +36,7 @@ extern u32 svm_feature_flags;
>   #define SVM_FEATURE_AVIC          13 /* Advanced Virtual Interrupt Controller */
>   #define SVM_FEATURE_VLOADSAVE     15 /* virtual vmload/vmsave */
>   #define SVM_FEATURE_VGIF          16 /* Virtual GIF */
> +#define SVM_FEATURE_X2AVIC        18 /* x2 Advanced Virtual Interrupt Controller */
>   #define SVM_FEATURE_SSS           19 /* NPT Supervisor Shadow Stacks */
>   #define SVM_FEATURE_SPEC_CTRL     20 /* MSR_SPEC_CTRL virtualisation */
>   #define SVM_FEATURE_VNMI          25 /* Virtual NMI */
> @@ -57,6 +58,7 @@ static inline bool cpu_has_svm_feature(unsigned int feat)
>   #define cpu_has_pause_thresh  cpu_has_svm_feature(SVM_FEATURE_PAUSETHRESH)
>   #define cpu_has_tsc_ratio     cpu_has_svm_feature(SVM_FEATURE_TSCRATEMSR)
>   #define cpu_has_svm_avic      cpu_has_svm_feature(SVM_FEATURE_AVIC)
> +#define cpu_has_svm_x2avic    cpu_has_svm_feature(SVM_FEATURE_X2AVIC)

... and this is mostly ordered by feature number.  Maybe add an pre-req 
patch to sort them, and then re-do patch 2 and this patch to insert in 
feature order?

Re-ordered (for both patches):

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

