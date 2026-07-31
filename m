Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CC6C55173
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2026 15:48:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1379356.1624048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wppSw-0003OR-1o; Fri, 31 Jul 2026 15:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1379356.1624048; Fri, 31 Jul 2026 15:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wppSv-0003OK-Uv; Fri, 31 Jul 2026 15:48:05 +0000
Received: by outflank-mailman (input) for mailman id 1379356;
 Fri, 31 Jul 2026 15:48:04 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wppSt-0003Ny-T9
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 15:48:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wppSt-00CcqY-9y
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 17:48:03 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a6cc389-2eae-0a2a0a5409dd-0a2a4504ac5c-42
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 17:48:03 +0200
Received: from [52.101.46.5]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a6cc3b1-b57f-0a2a45040019-34652e05ee22-3
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 17:48:02 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BL1PR03MB6070.namprd03.prod.outlook.com (2603:10b6:208:312::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 15:47:58 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0270.015; Fri, 31 Jul 2026
 15:47:58 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s40kWKylsb7WWF6gsm7AIl7IDncDLklTlce54zMVtQCtSElyWzIRM/r5rsF5FH43mfQ7T6JKHqvtGMv1Yw9bun/x6weSYWEpKadSnN85JaU00xrIYb2P5H6tNkp1mVPU9VStc0oL6CImfYge6s6mU8DEgY1w4Ox988No/heHcFboV6iPsUvraoCb9C+mjhyfSCmuTc9l5xVwrMrUg5IrctFwprNmjN9eN5SOMiViMuRqtxcyjZQNENmuIh6Ry68xkBMcWsFeOwZGmBLGyoViR4A570TO+LBFAYuWeK9BJU1Ud8hscHswink4C5wgmMP1g+6eYulNEwBqFNPCH1MbXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGuhuLUS6vlyOAdNT1kpxvb01n9f8TwtdSfC04CHaF8=;
 b=U4+NJVcbN4dhQb2mJq0dCkuK9jCBdL7Lz8XTyHwGBENrjUT6SldnzoYCrlail8H3cO/SykaE3i1iDSLEVfmnNbjUYUWD04uqWRD+PKlv1sO7bVsq6dlAVT3zEWREvjBDAwdoRlByYshyGGcj6KTQNegEfE4gnMOWiyYGVVM8pnQdjQ7HcfL0lFgRq685Dr7hvZ++oftQk5a97Kkw3B0Cnu6xJ9NS7rwaCiQrnjO132yAVQbkuU5l5KudiryLcqp+95FpuHLEM7rkZ8K1ZZDnEjnq9wuLhBvQtSnmzsbbxE/1zOL9D+nljwG0Qv+U94qazRgm9ihSG6jSWiuDLvF5Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGuhuLUS6vlyOAdNT1kpxvb01n9f8TwtdSfC04CHaF8=;
 b=kXuCO12pd45zE3mKvIIkoHVjmjPZLok4G/OaBnJhAwWwWTm46ElV0RDIYsCYKEvLlCK1KrBSlMLt3v5jeTHRR5XbQYr0kidh3H3nzkaMaVCjrrekgAx83O892KZJZRin0fh/jDC5toafDoKXf2xtvDw1Asd/dw8uEyPMpVJrXSw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <eb913bb7-4c42-4c58-8a3b-5d80ad6ebbe0@citrix.com>
Date: Fri, 31 Jul 2026 16:47:54 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Subject: Re: [PATCH v2 3/3] xen: Sort includes
To: Xen-devel <xen-devel@lists.xenproject.org>
References: <20250509163212.2948359-1-andrew.cooper3@citrix.com>
 <20250509163212.2948359-4-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250509163212.2948359-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0133.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BL1PR03MB6070:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b15a20b-e72e-4510-fd0d-08deef1b1879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XIVH7ade0drpNeTLu9RPFJC3bvzCufRorb2OIh+qRaiV2P8tnCVgKxFFl0tNmIvSLYOrcWPAUcS98nHqjFYeapnxp1k598SE5nIQkjI/QZEMheZor9b+h7jTD/gSnlxy/4Zbg7YGw29cDesJZo90XDUA13LdcnvpEP2n6ggACzXnzUXR464hQo0HI5rZeQX8/5SL/2kFebLpmgaQFWp76iezB8r5PsU5Rnf4NMk3POlGB+i+Bwc3yZHf6bfvdsI+f2HwYnHUAe+wK0866z9G6cNfViarPg08UoiS0GInL3uHlbspnP31NoP1P3tmY4QF/+Jb5HKczut4zUPFwUURFbjvNutBSiTSiDhOQIB/ImeJmUfyHiKFs9PcanViMTJADR7TlWQf9z2stcVQEveMrlnd4JHy32Jqucby9jSh/z0vWmC6T0p9aQi6nOZDJZNlqffnJ9AaRiOEWEHKQlkMSCLnRyvT7pZ74oCPlzXAzHCPYUdwA6iGFSFZQ8HeO8iR6WUUp6LwzqH/Mc+pxLZMsibMqioLHqY/L97ECt3Prq1QBqPHw8cQTR7N3AXy83FWAMnjhKGl2imfMuh0HbGA9EF83AEShGEovQILbqJKSEd/EUn6scVxjkWF0KYSuVtxDxInpcb7miK/vP7ixgD2Wh+VX/fw7rCA8CwLeI2RBi8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXgvcURyT1NwbUg3bEEwNEwvRTlVcWlvZ0k1M0pkc0ZPMkI2QjErY0JrVGhB?=
 =?utf-8?B?Y3lrY2E5NFFvTzVpUktOU2xFTWVDNUdjU3ZZc203U2Ixd2R1aHgxKzU5M1Uy?=
 =?utf-8?B?K0w5Q09wTjR1cU1hS3FLWUExWmlMTSswN3pyUE1nQ0pCVDZWbVBnTWd6N1RB?=
 =?utf-8?B?KzlhRWp1OTcvUlpyZlpvaS9UTlpTVTRKOXBpTjFYMnRiekRjcGc0YVREek1s?=
 =?utf-8?B?MHptWkVmbkhacGlyUldxYkg5Y09tbjgyMnJvRnhTK2FUOUxCd0g1UkZ1MlJK?=
 =?utf-8?B?UzVjd2pvb1ZxaVdkRXRUN3RTZm1sL3FOTFhXMHM0bnlGa1g0RzR1U3YwOVV5?=
 =?utf-8?B?aVFTQkNRdlpsVTg5ZFpHQU9QdmJjZG4yZi8yK014eUhkbjNHTlBLamNFeXpT?=
 =?utf-8?B?Y3Y2SEswWW1vQ2Q0OUFwS29udklvdFphN1JXalZwL2ZUemhOVXU2bTQrMW1w?=
 =?utf-8?B?cmVXVWJDa1B4eW5peC92cGhDK3hlSUVnUm53TWltdGp5UGZjK0p4OHhjL1Qx?=
 =?utf-8?B?YlJ5cjVrK0dmN0JaR2srYTRnUUVWVllydm1qck1Hd1grMnBMYkY3LzJaSG9n?=
 =?utf-8?B?cmFISU10SWpYY0hjY1JuSmtCT3Nwcmh2NmJabFVBb25KekJpSVgxQUZjNUtm?=
 =?utf-8?B?Y2cvalFIYVJIbUMvK0VoYlFnUW5UdXY2dzlLK2RHdHpSQUJuZ2o2VHFjY2kr?=
 =?utf-8?B?NzlIY214Nm9NeTFLVE9VS1NXTHgrSEErb1ZnbFg4QWRUeEZKYTJlblA1ckpG?=
 =?utf-8?B?SzR4YWhPdWNVYWZodldJNGR1Z1VTYXNMZEYzYXJ3eXRodWNLTnM4OGp1MVh0?=
 =?utf-8?B?eTNpc3BzNGxDaTRnUVJUdkgyRU13Mmg1SFNpZWtlT0cxZG55VFdTeS9rUGF3?=
 =?utf-8?B?dDNLOHBrQ0lYSTFsNVJWUTh3d2hQSzRpZ2RGV3RlbGtyZ25EVXJPM2E4byto?=
 =?utf-8?B?WVlhM0pSbXg4Qlo5ckpiTmdZYzE0cmpZNkJJZUhFYjROeXF6Ui9xS1JTWmd2?=
 =?utf-8?B?VjBhWUZTbE1xNC9uQnk4MHRNQTJ2ZXlXTng5V3N1NS9LYjZheUpaU3RwbXZt?=
 =?utf-8?B?SGJXdzFpOExoUWQ0NVlvM09lR3hTRWxXeHFWRHNVU1JLTFNxNHZnbW1oaGZ3?=
 =?utf-8?B?VlBNN3FiaVBzL21JYkZWUFNLbDdDRDg4N3l1SElHaDZIbjRkQjI1Q0VPT3Ez?=
 =?utf-8?B?dElvOFp0UlZneUc2cEpSeGprejBkS2VjRWYyZ1RoNk9lTG9TUndTK1dEQVZL?=
 =?utf-8?B?ZlgvandhOWtRenJFalVHcEJUelhnNnZ2dk0zL1RxR01kdGNGTDZrZFdGeUc3?=
 =?utf-8?B?Y3ZVSjl2dVRQMVhmWGM0RTNVSVJpZXl2NzVDOVpOdlJhT2UrSnB1czQvUlNz?=
 =?utf-8?B?UEU1VzUvSm0zaTNSVTJmaVFxdWdjUE1FWTkwN1RZUTh6QzViZERlcmpvbHFT?=
 =?utf-8?B?U3VXc2RiMkw5TUlLT25kS1NGU2djVjhFMUM0WmJsVEg1UERLajlMUkRURE9j?=
 =?utf-8?B?WkZYWjd0WmF6Z0N5TVNuYlRFK0lTbjdDc1Ewc2FiM1F4cDYyQ1daMmxUNnVJ?=
 =?utf-8?B?MHBKcktReldOMkZzV2RoTFY5czVvS05pT3BCUGZYcjFzcHdySjBoSCszbXoz?=
 =?utf-8?B?OFA3eWFaWVArVXB5U0I2QkVyM25BQ20zMFlLSXY5b0dJb2RqRVBWZk8vUU5h?=
 =?utf-8?B?ZkNXMHAvSXZkbGhDV2poWTlheG1oK211MHpXNEpBbVRyS2l4dCtaVzBUdnQw?=
 =?utf-8?B?ZVpINnhRWjAzSmpxOHJ4NElYNnJYbWcwcTB3b0YraWZzOGEvYm9hQnhVdWJk?=
 =?utf-8?B?dkdBaXprdjBxUHByWGIwRVdkMGsvOXdseXpQTWNaWTNxUmd3WEQ5OUx6U1FW?=
 =?utf-8?B?ZzFuVVhvSUZVYkxyWG9GcUMxUnBFQlFaRzUyVEowUnNHaXVjRDFERlZTVXNG?=
 =?utf-8?B?cEVMWEt0L0NENE5iVFczNU9TUGxxbkhsMkxsYlJlWEY2OTI1VzBIV1VUa1Vq?=
 =?utf-8?B?Zlg3aStjakswR0dMS1VuR1NzaGxsQWdCclBZdExRWnhzTGVzRzNmb1MyZDlj?=
 =?utf-8?B?QXZRMkt3bEhBOGhLcEp2YmpoUUViME5XOHFRS2VyQkJyL2JhdloyaVpMdTlT?=
 =?utf-8?B?aHdpM3JpRndnOG5SbFRxUEQyaGhjN0dlUlIzR1MxSmhRajNmUUQzRkFYVjhE?=
 =?utf-8?B?cGFvMWwvWmVIdGExamZpUHpzK1FFdFhocG0xaDBNT0Q1SVB2TC95ZnlLNU5S?=
 =?utf-8?B?ZVhTdTVBcktqWVpNSXIwWDNCYmdwbnFSV2JRbzQ5NVBtOWFhN01pUGIvS1B1?=
 =?utf-8?B?K0tiQ2dlSzhic1hUWG1NaVNVUUJXWVcyb2Roem5jTmhvM3BjUXBNdS9COThr?=
 =?utf-8?Q?3xl3ueUvnzwA8kfA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b15a20b-e72e-4510-fd0d-08deef1b1879
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 15:47:58.8153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vp37MnvuCKtZ+bk+kfaHb+uIeUsUudRm4qG4AGa0V5IZaU7U62v70ArXiUYiYT7zTee0rBzj8+w+8Zx/DHW3rvaptEjWzwXUD7KNWhB/agk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6070
X-purgate-ID: tlsNG-ebf023/1785512883-51ED6B50-C10109D3/10/73395122804
X-purgate-type: spam
X-purgate-size: 1521

On 09/05/2025 5:32 pm, Andrew Cooper wrote:
> ... needing later adjustment.  Drop types.h when it's clearly not needed.
>
> No functional change.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
>  xen/arch/arm/mmu/setup.c   |  2 +-
>  xen/arch/x86/alternative.c | 12 ++++++------
>  xen/arch/x86/livepatch.c   |  8 ++++----
>  xen/common/memory.c        |  4 +++-
>  xen/common/page_alloc.c    |  5 ++---
>  xen/include/xen/mm.h       |  6 +++---
>  6 files changed, 19 insertions(+), 18 deletions(-)
>
> diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
> index 30afe9778194..f6119ccacf15 100644
> --- a/xen/arch/arm/mmu/setup.c
> +++ b/xen/arch/arm/mmu/setup.c
> @@ -12,8 +12,8 @@
>  #include <xen/sizes.h>
>  #include <xen/vmap.h>
>  
> -#include <asm/setup.h>
>  #include <asm/fixmap.h>
> +#include <asm/setup.h>
>  

I'm timing out the ack for this, seeing as I've just hit the same build
failure again.

~Andrew


