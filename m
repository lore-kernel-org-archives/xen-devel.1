Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DC6606A321
	for <xen-devel@archiver.kernel.org>; Fri, 13 Nov 2026 07:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hcxVkFOC
Received: from list by lists.xenproject.org with outflank-mailman.1486777.1689249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRlnQ-0007dX-E0; Fri, 13 Nov 2026 07:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1486777.1689249; Fri, 13 Nov 2026 07:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRlnQ-0007dQ-9G; Fri, 13 Nov 2026 07:34:04 +0000
Received: by outflank-mailman (input) for mailman id 1486777;
 Fri, 13 Nov 2026 07:34:03 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRlnO-0007dK-U7
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 07:34:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRlnO-009Cg5-Aq
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2026 08:34:02 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6af6bd52-e002-0a2a0a5209dd-0a2a450bdac8-46
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 08:34:01 +0100
Received: from [40.93.196.29]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6af6bd62-b7e8-0a2a450b0019-285dc41dcf69-3
 for <xen-devel@lists.xenproject.org>; Fri, 13 Nov 2026 08:33:56 +0100
Received: from MN0PR02CA0027.namprd02.prod.outlook.com (2603:10b6:208:530::30)
 by SJ1PR12MB6244.namprd12.prod.outlook.com (2603:10b6:a03:455::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 07:32:09 +0000
Received: from BN2PEPF0000A993.namprd04.prod.outlook.com
 (2603:10b6:208:530:cafe::a5) by MN0PR02CA0027.outlook.office365.com
 (2603:10b6:208:530::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Fri, 13
 Nov 2026 07:32:08 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000A993.mail.protection.outlook.com (10.167.248.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 07:31:53 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 13 Nov
 2026 01:31:52 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 13 Nov
 2026 01:31:52 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 13 Nov 2026 01:31:50 -0600
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
 b=xFOzCnk1hkTtvxMHi9ZNe6/9gC9X0lqs4a1RWsFYiyGYSUnNFUv6MGGx5+7adwqGVRqKC2WZOvvX7ek0hmxic035bOPeJBpYPDTd4L/dp9XKqQQ9Q9xJ35Z82TW/rYiYLCkP2I3RaV3Ipwd5bFti/0GaCIyqRWo8MFQp9nF1sQzmfr/mxPkio4EW8RDlQG9306MfcElWQn152wUjou1UtPidsOeAGHStLA4jn2XeVo9dD+Sbhy+iENaI96n4xJuanhscIydiucyCtzU/8+6NALpyDzBmIDIf3/uhAlr7hIrhs15n8gLBUcVbpDtVB2wNsmKFtEBlbFFrLF0MWXRwmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32jlkFJOCt/szTFY0pvWf0SeAbf3eJAVbIgx6P3vFe0=;
 b=a+ibaJg+nb/wIZH6Y219rjaLm2jXI0x9dMADGD7Mgpwg3hQx+RjIIdYTaEC3QJVW0qZPxq+ZLgSObjDME8s/67J3L3IBEJNUXqvcBexnC/YsEyTlC+b9IxscKLfywGzZduqFy9E0+sgLXHfX0e8Nleqw/fnp+cS1FbmOmQEb2OyiQxPlElh75XgIv3rCkt2h69ucHmKeRtx85BTslI+Y1uyLD/hMGP/eQZ3e/ASY7SYUN/Gwf2cQLX5dSC9+0SbpW3GHxIFymvaiVNCSaGL/lxTndJ8IGapbpWQ77qubs66hy9cSEmmA86Qe1cgxQ4ZxMOJ0EVEjkSv0cgCcARCLFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32jlkFJOCt/szTFY0pvWf0SeAbf3eJAVbIgx6P3vFe0=;
 b=hcxVkFOCLj3cjPdVz0RMTklMpHZx9kUcbZJJPNQC3TgfNdQ+xK70yxqLmfZzmwIm/W+CfoiclE8c8c1dymjKzDnQVGiplm/WVLOBbpkzlrrFwyoBj27JPsyfQf4xctBwRAASE/CF9A44/QgZBUgNeQ7fG/+TCYRZFKtcsOjLwp4=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <df33fa53-8de3-47ed-984c-f23bc7161965@amd.com>
Date: Fri, 13 Nov 2026 08:31:44 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/link: Move SCHEDULER_ARRAY into .rodata
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>, Timothy Pearson
	<tpearson@raptorengineering.com>
References: <20261112183620.3277591-1-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261112183620.3277591-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A993:EE_|SJ1PR12MB6244:EE_
X-MS-Office365-Filtering-Correlation-Id: f3045884-143a-4e35-ae14-08df41583056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016|23010399003|22082099003|18002099003|11063799006|261102123227099003|261026140227099003|261028144727099003|261026121527099003|261022075727099003|261022105027099003|261021121427099003|56012099006|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Dw4Rba4qbEtlyBRpIzKB84PMzbHF5P0QqIPkR5UicPUg/oDJ08vJQg0k7rREGyfX7bOqzczI1cMvR70XSDI8WF0BUvccI6we5M5M0d35F5jVgL4BUsjSpQdu41GvparRy6YmugnWk98moKgmF9QeigySdMzCdDh//jfB9farACeIc6RALWkdDdnyqpNd8ceKexJMA6KjhOCUTIiSKvBljBcOriUFCRH2ZfEYMcS6QjfHJ4RptMj0WaIjD1sOxxRiCDLeHUH1NPU6K8rLJxhFv6pPEkwDUc+h169e3V4slb0mZK0DsoynNtnCqZJCeE18UhvezQvm+KNkGXhaWGDJ5f/O3h/0yzBx+SfYTumsGM45xJMaFxR6EH0j7+XynIG2nVOWLWXb3tkzoF1d4DMdKq7tZBynZ4kR2P4+CO+A/kV/SC/kC+WiA46JUGCHYwnSLiuDwiGImwwKQ2/8J52tVUJiHiEnL8Dujhrjj8zkGlqZlGPfSEts075YUG3fuFgPq9tQWgwxy8aqFQK39Kubp0sppGK/onsw0AAqCyZIIV6yleBzg4muiCWCd14Aarnxvz+cq6lU1RFWbWjoTfYEdvN9t0xZgoXH5Xw2oGKePYzqpiocEhnCZVxMKmn6/6tQZfnI9XXRhtKbZkoM85d/5eZIRh2D+dFEq3OgQ6lSpOpRS8eM/ZPug6qwoeGmlYqfbQFqm/6qvMdvcnM71zfAqA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016)(23010399003)(22082099003)(18002099003)(11063799006)(261102123227099003)(261026140227099003)(261028144727099003)(261026121527099003)(261022075727099003)(261022105027099003)(261021121427099003)(56012099006)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KrXIG7hONvJAg/NL4YvAnSJECJXlC4xH5Ej9YFK8OCPCOUDHgI9qmOoJzXX4zbI5CvbtKyMemmBIQBuTiLYB7ykJfdC3GU16zR5F6kUB5GtDx47D6yBn2euMSuzyKUtyqoO0uHFd64FZQc02S3gEuHnTPEoM4j5cvqgoq/xgUo0Bcu1vs+2njzACNbf6gGFXCzFGcEpiFELyqhxXINFdQcODmJfjw6HCDoheMYbMONci1lAt0FN0rIiZ9t+NXm2y/YvcegAjZnjriSl58m25W7F9JvK44QADpDIP7bHYcQ9mnRTVYFtG2p5n0GwWf6HD3JWVw7gEVqr1Aqqly0wqBxyjqcDEHXzt3a3mkyFagHR179voKftJPdm9Us1UB2TZwv7H5bAQUA42RMhqnOuHfw4QYmqaDQIq34/ht38MPgx4MkMhhKItAKOb2LfGiFWi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 07:31:53.3386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3045884-143a-4e35-ae14-08df41583056
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A993.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6244
X-purgate-ID: tlsNG-42698a/1794555241-1ACDF9EA-11551C7C/10/78276251493
X-purgate-type: spam
X-purgate-size: 3515
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 12-Nov-26 19:36, Andrew Cooper wrote:
> This is a list of pointers which is only ever read.
I think that's not true. See sched_test_func() macro in scheduler_init() that
assigns NULL in case the scheduler does not implement the required hook.

~Michal

> 
> In the ARM linker file, fix some adjacent misalignment.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monné <roger@xenproject.org>
> CC: Teddy Astie <teddy.astie@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> CC: Timothy Pearson <tpearson@raptorengineering.com>
> ---
>  xen/arch/arm/xen.lds.S   | 6 +++---
>  xen/arch/ppc/xen.lds.S   | 2 +-
>  xen/arch/riscv/xen.lds.S | 2 +-
>  xen/arch/x86/xen.lds.S   | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index 613511390ff4..d1bb6c62d208 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -51,9 +51,10 @@ SECTIONS
>  
>    . = ALIGN(PAGE_SIZE);
>    .rodata : {
> -        _srodata = .;          /* Read-only data */
> +       _srodata = .;          /* Read-only data */
>  
> -        BUGFRAMES
> +       BUGFRAMES
> +       SCHEDULER_ARRAY
>  
>         *(.rodata)
>         *(.rodata.*)
> @@ -93,7 +94,6 @@ SECTIONS
>    .data : {                    /* Data */
>         *(.data.page_aligned)
>  
> -       SCHEDULER_ARRAY
>         HYPFS_PARAM
>  
>         *(.data .data.*)
> diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
> index 37256c8865a9..cddb70855307 100644
> --- a/xen/arch/ppc/xen.lds.S
> +++ b/xen/arch/ppc/xen.lds.S
> @@ -48,6 +48,7 @@ SECTIONS
>          _srodata = .;          /* Read-only data */
>  
>          BUGFRAMES
> +        SCHEDULER_ARRAY
>  
>          *(.rodata)
>          *(.rodata.*)
> @@ -84,7 +85,6 @@ SECTIONS
>      DECL_SECTION(.data) {                    /* Data */
>          *(.data.page_aligned)
>  
> -        SCHEDULER_ARRAY
>          HYPFS_PARAM
>  
>          *(.data .data.*)
> diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
> index d9375a961697..250ee3f36f4f 100644
> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -43,6 +43,7 @@ SECTIONS
>          _srodata = .;          /* Read-only data */
>  
>          BUGFRAMES
> +        SCHEDULER_ARRAY
>  
>          *(.srodata)
>          *(.srodata.*)
> @@ -91,7 +92,6 @@ SECTIONS
>      .data : {                    /* Data */
>          *(.data.page_aligned)
>  
> -        SCHEDULER_ARRAY
>          HYPFS_PARAM
>  
>          *(.sdata .sdata.*)
> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> index 8f943e11ead4..925848980219 100644
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -119,6 +119,7 @@ SECTIONS
>         __ro_after_init_end = .;
>  
>         BUGFRAMES
> +       SCHEDULER_ARRAY
>  
>         *(.rodata)
>         *(.rodata.*)
> @@ -297,7 +298,6 @@ SECTIONS
>    DECL_SECTION(.data.read_mostly) {
>         *(.data.read_mostly)
>  
> -       SCHEDULER_ARRAY
>         HYPFS_PARAM
>    } PHDR(text)
>  


