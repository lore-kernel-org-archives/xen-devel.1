Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92A2CA5FA7
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2026 17:16:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436658.1655346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBbQe-0000kQ-Ud; Tue, 29 Sep 2026 17:15:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436658.1655346; Tue, 29 Sep 2026 17:15:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBbQe-0000kJ-S1; Tue, 29 Sep 2026 17:15:44 +0000
Received: by outflank-mailman (input) for mailman id 1436658;
 Tue, 29 Sep 2026 17:15:43 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBbQd-0000kD-JE
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 17:15:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBbQc-00DREF-WC
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2026 19:15:43 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6abbf208-bab6-0a2a0a5309dd-0a2a450ca3a6-46
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 19:15:42 +0200
Received: from [40.93.196.36]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6abbf23c-f479-0a2a450c0019-285dc4249c69-3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 19:15:42 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW4PR03MB6948.namprd03.prod.outlook.com (2603:10b6:303:1bf::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 17:15:38 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 17:15:37 +0000
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
 b=B1fglS7TUNw0HM8jMh80vNMbSqiTGM3TgR19uKhA9Af+SZ/Vexco5ZNPRxqejgY1ByiwWPvV9Urq0ZutWghsiEKsAxIwXkdCFyFZ4JaBo8wr1Zphgca2hZxNv8isBBdh4HgRbV5RUZeoyKFgPKe8Zda3AB6bm2LipmucNzwXQIKGe1qJOBpKN1nHu+KOYbuO0y93eFlG5HH4qlDmW+66norv10gcndQmQhnJrsmlUeK+9PZrY5Jb2cWw/SGFh7FdS8H4h2EY2yFR+7bEa1tiq/on0+at28Vrf1i293wEBlaQuHNbSRlUyY3Nifq/ksfd80dZ/W/GhHMeiMjDVjMIkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBAloUvDz8MsxvqyelKeAVMt2K6+Fcpuivn20sLQKrw=;
 b=dSIufZ9FJq/mB/461IZrpRVvB7YkjoMQ70jBCEyLRwquicTgG1rlZX7PpTCJD6AUHt6oTde15SM/eEGfXAQ1LvMefBtaFx4k24IBS4Ldo9Astz7bplJSgt0eh3UuMzxG3Dm0wtohrNGh36IgOEhFmzryZ1g1bw0TZjtpRwNira1bVf0AGHt2K1kyy3kdbvthq65NRxEsES3lNURy24U4UBDw0rQaZGgDbCK+NkEmO663MSknsBwG5qqkSa1OzPec/cxvLU308Hot8nzeV/o7m14wgsX9/ELrej1G76yByLS/6dbs4FsebNh1OkfNlwlgkrKoGjZsYJHn7g7s9xEB1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBAloUvDz8MsxvqyelKeAVMt2K6+Fcpuivn20sLQKrw=;
 b=K3aOtdVe0QBWwmqi8Wko+MNVXGgF24CsFNtuT9l/71lCArDWsNLS2cyQfEmv6mJ2FIoVewznfLhknG7hhMr2KvV3kzBOJgs0lyQb3zKjbCdphcqSl+0RtZHov9o2qu0GsBRcuZrSOVth2W4o1NT45yWeap6UwmUzGAaQAbrmtuM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1d021cc5-a4d0-43a7-a179-4100229495f0@citrix.com>
Date: Tue, 29 Sep 2026 18:15:34 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 2/5] x86/svm: Remove ioio_info_t type
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20260928140248.1543013-1-ross.lagerwall@citrix.com>
 <20260928140248.1543013-3-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260928140248.1543013-3-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0007.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW4PR03MB6948:EE_
X-MS-Office365-Filtering-Correlation-Id: b4186a1e-5589-4645-cff8-08df1e4d47e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LjwN1HIw+SVwbyyV/li/x9Cn8w5uZPp8rnLRuBe7GJ2Fy75R5ihJSmgb7lFp6NsEjfbl0s6yjhpgD8cQUNYm9lx/dZKd/Lsvqq9atqXYJ70aAYAqJAgYsTrghJmwGnmjxwpbkt4/+l7EtsoRfPHXBiz3w8B8uaFO8BrRGfbcxIGTjwDuKyxUz+iytE8N5YXFoZbY7iMZWaQD5mHBNx4ujnW/9D1Zxy3eal27Mv0OKzVD9FODF4XGQPJXSK+eLv5WZ35kCyEBCo14mUFNU7jHTFsWlDm1ZmW1d65xXhoNTrBk5CXwQq3BhWBWmXm1B7a90gQOUih1WDMmTp2e9RvsYyWDwWM8ylwH0FPt3fpoBN9RvmAy2Lrn8XjSs60I2FLhTOG2qFgdmqILw3mc1riMkhQRJB/AwbjwcFPrGbipQtx4RLWHcCA7Kqnn6Wg0YfRupKdzROYjcwuDJwJy+5pLRoF/lHpVdhoW7b6iQyLxK9v2A3VTICFyI7aZ67bsrv6uIt7Nv8onjnIYcMu2IWlBxo3zTukTKymrsufEHzaJbiiuc/bI7jcwbwCqartB/hGEfM91evkjFaFGU6dH8uMTSvfErHOQnmEzyK2IYDWlP6irsjzdcn7y1v0U52sgMcwqTKc7nBynvEPoDOUDOqvQU+npJB2MtnRxPWlaGIZlDQ0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0VyUWllcXFOQnFreHRDOHNFMmFVR3NSYVBmZnV5dS9jY09iN3g1NndLdVJy?=
 =?utf-8?B?U3EzVjg0bWFqdHpLeTRhYzkxUW1ZeWZJNHE1WlhycGxjZzJvYURtQVlkS2Rp?=
 =?utf-8?B?SjRndzNnTjY4ZVU2UCtnNEVjZjZ5ckE0MHIyRDZmdmxkT2phYUwwNUh6b3Jj?=
 =?utf-8?B?dnNvaDNGeDgvbXBmWVE1N1JaOURFNVcvdFoxOTVsbi9rSm1TVVZmeUVYU00z?=
 =?utf-8?B?VGRvYks3cldhZXVGR05mQ0JsZXd4VFJoN1hrT1RIODlOMjJyS2pvWFBUakpz?=
 =?utf-8?B?ZEZDNzE0ZnBqSXczbDB6L3Uwb29OUEU3VGFrckQvdnV5WE5XeXVEN05PVTg3?=
 =?utf-8?B?alJoeVFEZnkxajFPOWtWMzM0dXg2dTRUcUhCdVRuOWJZbUJSbk11eUhNdnNI?=
 =?utf-8?B?bWJka1BtcDlQM3R6NjVsMmlXQzVnYWJpQU9TaDN2eXJlczdzRUd5ZkVGemts?=
 =?utf-8?B?QXN5K2ZRWXphem1XbXZMd2ZFaTRQMnc4d0JseUFtKzkrbmphWGJqSXRWZ3cv?=
 =?utf-8?B?bTNSNXlFUXVacEQ0VmZxV0kvVHFBODA0ZFNRYnVKTS9sSDV0bW13QTRpTzIw?=
 =?utf-8?B?NWQ4S2tHcWE4S1NMTEVqU0RYMURjTU5vWFJ6QWV6SU5yK29lSjBNN1J0TVQz?=
 =?utf-8?B?YUFVZmx1OHVOUGpuU2pjL1JoYnM2c0xVUE45Q0NJejQ5YXBhNmhqdU5rOUtu?=
 =?utf-8?B?YTJlaXhaREFjU2xqYmttWWx6UnRKcUJKM1RRMXNncWhoOVRZN1Y3bmpjUmRM?=
 =?utf-8?B?cGlUcDB6YXFZaEVDbWJRVUFpVHFiSTNXMFdrQVIyeExaNmdRR3BPajlQZTFt?=
 =?utf-8?B?R1Nmb2Z2WXNTRkJxS000M3JuRGpqMTd5ZHNhdG0wVTJvbzlpeWo0UFlDNkJU?=
 =?utf-8?B?aDFzdzVaY1ZuRVZiWHc4MDdLQUFRMUx6aUYyNDZ0QlFIb0RUU3RVWm9jSWRp?=
 =?utf-8?B?NHBHa2xEcjdhaUVQTXZRZm1jaWFhd0RaQ1MxSitYbVhqMmdraFhIQkdGUkl3?=
 =?utf-8?B?WVZoQVJvL0pEZlhSUVR4b2MxeldZWjc4QjNjbUdMS2pRKy9pVWFsUjM2NVho?=
 =?utf-8?B?NUU2VjN3MC8rWjI0cVQ0eXJBaWRzMVJNOVFZS3B0V2RYZmFoT3dpS0FQZm8r?=
 =?utf-8?B?K05UazY1WXFxUy91Y0RWTVlUenRIeXYxSVBxNFlPQ1ZYd0l6WTZqYmMyNnNw?=
 =?utf-8?B?bnIwUW95a04xMnlScXhDSjdPU2NWQ0pYU0NraHhONmxhNHVOM3FXRktjMlpP?=
 =?utf-8?B?SmlKOTlZTzRFdlZvam1KcWYzSFR1cFM4WDVoRjVpS1BjSjdITm9JQU1FUjFi?=
 =?utf-8?B?OWFNSjVCQ3Q5a1hCUDlpVFIvamVpay93N0NzaXFaVEJQODJhQkdwWUN2ZG9L?=
 =?utf-8?B?dzZ1NzE5SkJrUEx2eFErMCtaRFFVSzlib3BBWGlNbTdRa0VIclExUkZSamtF?=
 =?utf-8?B?TUFHWGd4L0dTaTZTUGcwcXVJVzhhQkp2eWxBdHprcFBCdzZxVWluWGxubmpw?=
 =?utf-8?B?OWNhSllKSGhoQ29NNEFLeUtZOEtyS0dBdzMzRXV5cm8wUDRKN09ybDFLZm5r?=
 =?utf-8?B?MWVnelZkc0MwbncxNlZlUEZnQXJsSCs2aExWMXlXZ3ZoUWxQNVBQUFBIUnJp?=
 =?utf-8?B?ZUMwWVBFWDE3Q3NNaUpGb3lGY1JTN0NqOHU4dlNTcXNPUmZ5N3lpVk5MUE5a?=
 =?utf-8?B?NEdsSWRBWjVxT1B4c29PRXRqdmh5NUpYUEc1bnpHSnZuWTJwb2tkbDJtOGdt?=
 =?utf-8?B?VGg0UVZicGkyUHFzOEhpdnovQXY2RDBENS9ZZHh6Vk1CdzhtSnBWc2dYTFpE?=
 =?utf-8?B?WjNkbUZjR25JaWMycmRtV1RFWDJHT0t0TWpJUmlIOW94dUp4dGVYVVQrMzhS?=
 =?utf-8?B?M1Bnc0Zwb2Nwdk1RVDBTZ1A5Z3pnYkZic0piT2RVbXlxdWJDSG03NHVpR2E4?=
 =?utf-8?B?c0E4bjhselRqeEhCSFFhZUp2T21DVWJjUldrejVtd09yY1lXMmNpVEgyV09R?=
 =?utf-8?B?MGh3Z3BPTGN0QmpHaUk0Z3pRTFF1UnUyWXNta0g3eWRuYWpxUnBYQkJLa05Y?=
 =?utf-8?B?eW9FUHU2RnhydmcwMi9TUDNWYmVxTGxibDQ2ekg1TW1LUzFPRDJQaTRhNlls?=
 =?utf-8?B?V05NQlh6VW1tTW1yMk9Ya2s2RkpzOUNiK3Z5ZWtOM3dlWEZ3Q29OK3BHYktn?=
 =?utf-8?B?R1FWaWlMRE9IeUpVc1ROMW5ha2plbUMzUnpZMk9KWHliNXZQcWp4K3NyY2Y2?=
 =?utf-8?B?OVVOUGlxMnZ1dTEzYk5tdlFXb1ZtRm02UFljZmlHY2lGS1NFbG9QR0loTjBS?=
 =?utf-8?B?WUdDQnM5ek9CcTU1Mkk1bHZicU5KQjZPdTZxbzZIYTRYajg2VmlSczF1ZWp5?=
 =?utf-8?Q?k7w6GfcamX5DwN0A=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4186a1e-5589-4645-cff8-08df1e4d47e2
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 17:15:37.8024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IBmGRT7pv9qXTmxJKbqxeGOl8oinE2tHbPIEBExYTDLBRiHlVxvT6eFiLhaDxsU/3icibjZehfnEeSBidKrcvP2Js/PgLvkDSdzT3zM3ISA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6948
X-purgate-ID: tlsNG-d25034/1790702142-77AD4A5B-385E8DCF/10/62225246915
X-purgate-type: spam
X-purgate-size: 1385

On 28/09/2026 3:02 pm, Ross Lagerwall wrote:
> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
> index 65556136852b..13a2144fdba4 100644
> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> @@ -823,18 +823,16 @@ nsvm_vmcb_guest_intercepts_msr(unsigned long *msr_bitmap,
>  }
>  
>  static int
> -nsvm_vmcb_guest_intercepts_ioio(paddr_t iopm_pa, uint64_t exitinfo1)
> +nsvm_vmcb_guest_intercepts_ioio(paddr_t iopm_pa, struct vmcb_struct *vmcb)
>  {
>      unsigned long gfn = iopm_pa >> PAGE_SHIFT;
>      unsigned long *io_bitmap;
> -    ioio_info_t ioinfo;
>      uint16_t port;
>      unsigned int size;
>      bool intercepted;
>  
> -    ioinfo.bytes = exitinfo1;
> -    port = ioinfo.fields.port;
> -    size = ioinfo.fields.sz32 ? 4 : ioinfo.fields.sz16 ? 2 : 1;
> +    port = vmcb->ei.io.port;
> +    size = vmcb->ei.io.bytes;
>  
>      switch ( port )
>      {
> @@ -945,7 +943,7 @@ nsvm_vmcb_guest_intercepts_exitcode(struct vcpu *v,
>              break;
>          ns_vmcb = nv->nv_vvmcx;
>          vmexits = nsvm_vmcb_guest_intercepts_ioio(ns_vmcb->_iopm_base_pa,
> -            ns_vmcb->exitinfo1);
> +            ns_vmcb);

Given the single caller here, I'd drop the iopm_pa parameter too, and
have nsvm_vmcb_guest_intercepts_ioio() read it out of the VMCB.

~Andrew

