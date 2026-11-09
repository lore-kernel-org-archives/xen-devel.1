Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33D9606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 18:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=KtPWxBZf
Received: from list by lists.xenproject.org with outflank-mailman.1480352.1684316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQTlE-0003G3-7b; Mon, 09 Nov 2026 18:06:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480352.1684316; Mon, 09 Nov 2026 18:06:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQTlE-0003Fw-4G; Mon, 09 Nov 2026 18:06:28 +0000
Received: by outflank-mailman (input) for mailman id 1480352;
 Mon, 09 Nov 2026 18:06:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xQTlD-0003Fq-E1
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 18:06:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQTlC-00EySo-F7
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 19:06:26 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6af20b98-bab6-0a2a0a5309dd-0a2a4508e6ee-10
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 19:06:26 +0100
Received: from [40.93.194.70]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6af20ba0-f659-0a2a45080019-285dc246b05d-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 19:06:26 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by FT1PR03MB991367.namprd03.prod.outlook.com (2603:10b6:170:3c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 18:06:22 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 18:06:22 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jt/zrZ7F2XTR9DSPIKiMWkvlfa0FqKOu2cg/H/rBHcBKKAs0xnq+gX5p6Hw1UYd+wg39NnbAh+BfHgrvSsdTE8YUoolDg3EvQ4l4gdKD3Mw8RyiCP0iVwyvOBBRcAUaeigqDoWbDUCdghHfMF4Zc+4YjUaa5lBMTZ86NU8J5DTRLaLHDH5xItIMDTfjSp5PQic1h2wlMor/55irUyV3/wZWlcjSqFc3MBCDwrji+iicDynOUZ++1W5xUKy/L1JeR1gIFGrEpijcIuhoCwv9dFR/ZbqoyMJwXyhXMDRMYOrQT9hla59X36j39GznQirECGmXe338cULZ9mrK4Oh5pfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDRfaJWeM0bVB0lFA1s5os81FJFcEqozshfArd7oFMQ=;
 b=WslRdr1fL34GPboCAPHbuQ5T7RwSMNhqyKIhhy7B3LcTPhKRAHWsAsU/I5PY90S2CDV9oCY32catBMVfgjFzSfQ5h5fwP2igu5zx9764wO20+eJCbTumSzi1snoK4mwTVBSeEOHXrVT9ZhQVb/gtHusHGdU+7rU+9+G2y3S2vPgywJeriMt2zcnHSE+rcJhDgqe80nGOwIrS5QhbMpnxo6fmw/CMugGOK56rq4apRgzoBV8t8IdIs6DSQofGbyWcC7DMjN6P1rbYIz/0uPcQWMNl7D0jFIDLOOvxPWqbCxr+NUQ77Q5WkwHCaAYwGI1YKib9GcxxkJgWS/xWXyRlEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDRfaJWeM0bVB0lFA1s5os81FJFcEqozshfArd7oFMQ=;
 b=KtPWxBZfdX3C8QLsaPzfaCPdcx0jNio8XZFyrhWVn34UgwmoOak822mgZQw7NwYcSZvsJsZlJZP1v6ONrP/hAMKLQe00gAHpaTH9MfunLKImToy6BcVi4NFUA70ythNLcL/JDxkyhwmO3dt/FRdhD8lZPubjDnocG6luOAel3pc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3b170ba5-f29d-45da-baae-56b5522bb304@citrix.com>
Date: Mon, 9 Nov 2026 18:06:17 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 17/28] x86/hvm: avic: route interrupt delivery to vCPU
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, jbeulich@suse.com,
 roger@xenproject.org, teddy.astie@vates.tech, dmukhin@xen.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-18-dmukhin@ford.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <20261105013347.719392-18-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0098.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::13) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|FT1PR03MB991367:EE_
X-MS-Office365-Filtering-Correlation-Id: 8faae10a-2264-4a08-b2b0-08df3e8c2960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|11063799006|261021121427099003|261009223027099003|56012099006|261021123027099003|261022105027099003|261022075727099003|261026140227099003|261026121527099003|261028144727099003|4143699003|261102123227099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	X1JyPnKAl5PgVlQDVPqKwLHqh9MoreOmh4CJqd5bVHUYdcI+Sz44QpmtlvN9fLD8pw+QSSiI12JZ13ZFVRUQRTmtvLsoGwoQ8PuIo+xgHb4n16sX85z4hHgfAEjoOmUyhGib3FAlQ/GC324P4xl+Z/lt6u3KA5G0f/hQQRNf3TTUtp/9FCzfdHli0eoX5qlmuH6WcsgiUM0dnFAaYTyfDkPQ3rTQ3WWXVz83nL0UqbOj5Ptk7hKhBUksZFH9f+CdTy4y2ksH7pQA7riv+DbeJ/GGlTFBe8MLGKvlLxiU/aPag9L+FmlhPFclbnp53Yi8oohkeoZw/vDlCAOy0n2GRKt2CWvYdnuglcfLui53v3duIA6ycvLSKfi5FTv0bgBl/pf3QN5Sw0QVJr8YXNFcmZ+4ADq1t7kOZw4pH2LVoBFKVNJRkzVerAL8lHz/EHng8xs4a5xElAJmnsTA+XEAvJLOXb9oWVLnmSxt7cr91a9hD8bFd0EbedtWl6vq2HC0x8nOWKgq67AptsK4SVa5cJy1Dd2ZC/PxTi7pcqGSf4MKOsVwEbD83B0qH4hcQWSo9pqkMUwR4FIiYVmJyub0gp7KmZSxVLXdf2uV4E4aTqTwcRvwaiY/zlO6VIHVR4hzacVzceclrGbD5YvPjTNAPxeI7pcxE9xVE0kyWQbdUMI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(261021121427099003)(261009223027099003)(56012099006)(261021123027099003)(261022105027099003)(261022075727099003)(261026140227099003)(261026121527099003)(261028144727099003)(4143699003)(261102123227099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3FQbjVMbldtbVRsNjl6ck1KbCs3eWRQMmVGeGNvNWx3Z3VlREg2a1JSRGJv?=
 =?utf-8?B?WU94d1pXRi8wNkh1OVo0RFBSNTl1c3R0Qkx1aXVlSU5hOUIzWGFiK29BMmhk?=
 =?utf-8?B?cTFSVFZnOTZueHFmaFBSSFpKcnNteVdpWnIyejVRTkplUXNSYVFieW9SL0Zt?=
 =?utf-8?B?bVludmwxeVZ0aFcyV3BLS2FCSGhPV1Z2U3lxLzhRMDZNSEZ1b0g4QXg3ZVhp?=
 =?utf-8?B?cjVnSVZtMEYxbHlrekcxV2hIdytiN1dORDd3eWFyOTc5VUFtaS9jZ29PWWR2?=
 =?utf-8?B?UFpSeTBCcW5hbEI4YnVmS2xvNkcxUnJUYUdqRTg1alB5eHpRcTU3Y1M4VjZQ?=
 =?utf-8?B?VGVTU0x3OTJYVlN3WlFoeS9IZ3lqTUNoakdoVlB2U1kyamlxYVQvbkJ3Z2RM?=
 =?utf-8?B?bGYrZG8vaVV5dyt1U0ZpTldtUTIyWEl5N1g4VnhqdlBJL0h4YjUwWXY0Z3hk?=
 =?utf-8?B?NXV0aVhVMVUwdCs3bzdEWlpGRUlWVlcyd1VyTmhnSzU4Yk5aUkw4UmR6OWpz?=
 =?utf-8?B?ZmVBWXNFS1Bmak5LOXl1ZmhLUDl3RGNwNCszd1Zma2JUSHQ0QXJNSHp3Z2xa?=
 =?utf-8?B?a1V1SzNNVVNVYmlsV1J5S2J2WGhKa05xSzMvQzlyZDh1ZUoyZXlOajJXRDRD?=
 =?utf-8?B?VFdwM3FWQUpsV0NWRHhkU3NrWlNLUDRGSXgyeUZVRklZcHowRmp1R1dQc0hz?=
 =?utf-8?B?OFp4QWZFL0lwZGR0WDNuSlY5V2F3bTh3SG5RM200REtXU2lSNzA3ak9FTWRO?=
 =?utf-8?B?MDdTbGZKVWppZXJ6RjNwY1NJaS9reWxBb1FVV1hXbFIrc0F6azNpUk1TckhV?=
 =?utf-8?B?YzJvMWJCejkreVFMRDFxeHkvUFlCdDR1NGRxT0RXbXpyajhBMUJ1M3NRWnlj?=
 =?utf-8?B?TjZZam5hNUU3QjRFMFNDMGpNaEx0K0Y3V1NCWURsYVNtQ3pZeFpqWFI1OVZR?=
 =?utf-8?B?ZFN0Q0dOWitWcWkxejlKTDYxQk9WemNvc2h6c3BmM1RTTU9Pem1OQk9yR3Fp?=
 =?utf-8?B?RDJaMVJuZERmMGlRL1ZlL1Q2N0tCMXVzUTdVNTlrNHpiN0c2VHRPYlpvNE56?=
 =?utf-8?B?Zkx6bFNRRVpZQlNIVnBibmVTczBvRStIWEREVDJKajV0enJUbmtCaW9zTFBW?=
 =?utf-8?B?YjVjNXFpMVlBQ2ZIMHd3T21tRDZnOCtkcDU2K2c3SDBVRHVjZzJUeFRZT0Jr?=
 =?utf-8?B?Y3lPa0hVTXozbDlXVFJ4akZmQ2xtVnNMU3dQNVpqeXNQNFVzc2d4T1dVcGMr?=
 =?utf-8?B?Zjh5Z2N6SEJWZzdIQmdLL2NCY2p2SWE0bVM0aFlxazZGd1o1OXBTRFRZT1k2?=
 =?utf-8?B?Y3VlZ3BweWdwbTdUZXFZM0pmWkR4RDBYT0VyUUZOc3IzaWlXSkE3OU96Z2o5?=
 =?utf-8?B?bkl3Vk1Kdy9Yalk1am95ZkxDRVZRZ1NQTk9aQm9Idm0zK1QxN3VBVCt1cXEz?=
 =?utf-8?B?NGJxeWs3SHZtNmNoczlOSFF3VVpHQi8vVUw1Q24vbjZiQTlUa2xnM3JKbGdj?=
 =?utf-8?B?eFllZ1JtYWVCQzFON1hXcE5Lb2JnMW9Ed0M1L0E2MlBwQVVEWGh0UE9PNW9j?=
 =?utf-8?B?ZWlobDgyV2EyMXo1aG1ZejNWNXlINytwRTRaeEZMUVlEVHNRNCs4cHU1SFdC?=
 =?utf-8?B?dHJibkhMaDgzNERPSjdxZWkxbXJCeEdFbEcxejZIQ0JoNy9uYkJrWXFmUVRk?=
 =?utf-8?B?NGJjQjQ1WUlvSkE2dE9WU3ExNWx5RXliVVVRVDhUVWpIdkppR1F5eE9rRkhG?=
 =?utf-8?B?VGlweE1wUWlUbTdySTNFQWpaL0l3ZXRUY01MZ3NrRlJhUEozbFY0Z3RWajdk?=
 =?utf-8?B?RHdWdUNMTjk3T3ZvYVUvbk15VWtIR1hjWG1BWmNXeldjT25OMVNuamZ6eFh0?=
 =?utf-8?B?QndTY3laZ0cxNTRRTndxTWxCeE9LNy92bFl2elNnQXBhbXduenBBUEVsNnY5?=
 =?utf-8?B?Q2pqT2FpVzlmZEJvZHdrZDdRTHIwWDZmTU5vL1MxZW5zOUZxSVpQMGlFVWR4?=
 =?utf-8?B?c3BMMkRTTWJQU2FZbUNWL1BnVmtVa1dBRjhnU1ZvVzd6RDhCdGNKY1Fndk9o?=
 =?utf-8?B?WHkyVWtXazRSRUhmT2prVGtZRktFaHZ4d1I2TXdHcitrT2QwZFFwNnUyeDRU?=
 =?utf-8?B?MFpBSFd5cmxyRitvNHZhTkNnL3BlUm90QUZsSlp5Ry9oeG5Ua3dhVVhLQ2FS?=
 =?utf-8?B?L3J0MUpGdkhWWG5uWFdXTW1Rd1krQTUvZWRlTXFab25VOU15b0k3TmtZdzZO?=
 =?utf-8?B?cklreldFeXZaU1Y3NktFUjBIQnlDWVJtWXNCeWk0cmxYbGFBVXdDTEtCRXhk?=
 =?utf-8?B?QmVFSXk4ZTlCeWZsUm5yNkRWMHpIZjVUVE5KcE1UMzRpa1BwLzlTM080SERk?=
 =?utf-8?Q?FbrXrbLnYAdTTgiY=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8faae10a-2264-4a08-b2b0-08df3e8c2960
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 18:06:22.1533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ZWTuKDbqnIu3BQjfMDg61Vzsp8Dbn1/wm9htnjjr7bi3RAgiQh2IfRMJfQ+peGJsgtUfUK4GKwAUhZbxWoRQbTiPfHQy4baqfU8VScTR84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR03MB991367
X-purgate-ID: tlsNG-c1860d/1794247586-CCB7187B-E6950F49/0/0
X-purgate-type: clean
X-purgate-size: 9417
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/5/26 1:33 AM, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Enabling AVIC implicitly disables the V_IRQ, V_INTR_PRIO, V_IGN_TPR,
> and V_INTR_VECTOR fields in the VMCB Control Word.
> 
> Introduce new interrupt injection code via AVIC backing page.
> 
> Essentially, that is handling of 'IsRunning' bit in physical APIC ID
> table entry: it needs to be in sync with the scheduled vCPU. Shadow
> the state to work around hardware not perceiving 'IsRunning' bit.
> 
> Add new doorbell MSR to accelerate IPI emulation. The MSR can be used
> for posting interrupts from hypervisor to the guest (e.g. event
> channels).
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
>   xen/arch/x86/hvm/svm/avic.c              | 156 +++++++++++++++++++++++
>   xen/arch/x86/hvm/svm/avic.h              |  17 +++
>   xen/arch/x86/hvm/svm/intr.c              |   9 ++
>   xen/arch/x86/hvm/svm/svm.c               |  32 +++++
>   xen/arch/x86/include/asm/hvm/svm-types.h |   2 +
>   xen/arch/x86/include/asm/msr-index.h     |   1 +
>   6 files changed, 217 insertions(+)
> 
> diff --git a/xen/arch/x86/hvm/svm/avic.c b/xen/arch/x86/hvm/svm/avic.c
> index 18a814871133..0bcab0465227 100644
> --- a/xen/arch/x86/hvm/svm/avic.c
> +++ b/xen/arch/x86/hvm/svm/avic.c
> @@ -33,6 +33,8 @@
>   #define AVIC_MAX_PHYSICAL_ID                            (0xFEU)
>   
>   bool __read_mostly svm_avic_enable;
> +unsigned int __read_mostly svm_avic_features = AVIC_HW_ISRUNNING |
> +                                               AVIC_DOORBELL_MSR;
>   
>   static const char __section(".bss.page_aligned.const") __aligned(PAGE_SIZE)
>       avic_apic_access_page[PAGE_SIZE];
> @@ -50,6 +52,11 @@ static int cf_check avic_parse_cmdline(const char *s)
>       {
>           svm_avic_enable = true;
>       }
> +    else if ( !strcmp(s, "nodoorbell") )
> +    {
> +        svm_avic_enable = true;
> +        svm_avic_features &= ~AVIC_DOORBELL_MSR;
> +    }
>       else
>       {
>           return -EINVAL;
> @@ -228,6 +235,7 @@ int svm_avic_vmcb_create(struct vcpu *v)
>       entry |= AVIC_PHYSICAL_ID_ENTRY_VALID_MASK;
>   
>       ACCESS_ONCE(*sv->avic_physical_id) = entry;
> +    ACCESS_ONCE(sv->avic_shadow_id) = entry;
>   
>       avic_vcpu_enable(v, true);
>   
> @@ -248,6 +256,102 @@ void svm_avic_vmcb_destroy(struct vcpu *v)
>       vmcb->avic_vapic_bar = 0;
>   }
>   
> +static void avic_vcpu_set_cpu(struct vcpu *v)
> +{
> +    struct svm_vcpu *sv = &v->arch.hvm.svm;
> +    unsigned apic_id = cpu_data[v->processor].apicid;
> +    uint64_t entry;
> +
> +    BUG_ON(sv->avic_physical_id == NULL);
> +    ASSERT(!(apic_id & ~AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK));
> +
> +    entry = ACCESS_ONCE(sv->avic_shadow_id);
> +    entry &= ~AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK;
> +    entry |= apic_id;
> +
> +    ACCESS_ONCE(*sv->avic_physical_id) = entry;
> +
> +    ACCESS_ONCE(sv->avic_shadow_id) = entry;
> +}
> +
> +static void avic_vcpu_set_running(struct vcpu *v)
> +{
> +    struct svm_vcpu *sv = &v->arch.hvm.svm;
> +    uint64_t entry;
> +
> +    BUG_ON(sv->avic_physical_id == NULL);
> +
> +    entry = ACCESS_ONCE(sv->avic_shadow_id);
> +    entry |= AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK;
> +
> +    /* Shadow IsRunning state update. */
> +    ACCESS_ONCE(sv->avic_shadow_id) = entry;
> +
> +    /*
> +     * If hardware has problems detecting IsRunning (erratum 1235)
> +     * keep IsRunning in the shadow entry only.
> +     */
> +    if ( svm_avic_features & AVIC_HW_ISRUNNING )
> +        ACCESS_ONCE(*sv->avic_physical_id) = entry;
> +}
> +
> +static void avic_vcpu_clear_running(struct vcpu *v)
> +{
> +    struct svm_vcpu *sv = &v->arch.hvm.svm;
> +    unsigned apic_id = cpu_data[v->processor].apicid;
> +    uint64_t entry;
> +
> +    BUG_ON(sv->avic_physical_id == NULL);
> +    ASSERT(!(apic_id & ~AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK));
> +
> +    entry = ACCESS_ONCE(sv->avic_shadow_id);
> +    entry &= ~AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK;
> +
> +    /*
> +     * If hardware has problems detecting IsRunning (erratum 1235)
> +     * keep IsRunning in the shadow entry only.
> +     */
> +    if ( svm_avic_features & AVIC_HW_ISRUNNING )
> +        ACCESS_ONCE(*sv->avic_physical_id) = entry;
> +
> +    /* Shadow IsRunning state update. */
> +    ACCESS_ONCE(sv->avic_shadow_id) = entry;
> +}
> +
> +/* vCPU enters blocking state. */
> +void svm_avic_vcpu_block(struct vcpu *v)
> +{
> +    avic_vcpu_clear_running(v);
> +}
> +
> +/* vCPU is preparing to resume guest execution. */
> +void svm_avic_vcpu_resume(struct vcpu *v)
> +{
> +    avic_vcpu_set_running(v);
> +}
> +
> +/* vCPU is being assigned a new pCPU. */
> +void svm_avic_vcpu_switch_to(struct vcpu *v)
> +{
> +    avic_vcpu_set_cpu(v);
> +}
> +
> +/* vCPU is being removed from a pCPU. */
> +void svm_avic_vcpu_switch_from(struct vcpu *v)
> +{
> +    avic_vcpu_clear_running(v);
> +}
> +
> +bool svm_avic_vcpu_enabled(const struct vcpu *v)
> +{
> +    const struct svm_vcpu *sv = &v->arch.hvm.svm;
> +    const struct vmcb_struct *vmcb = sv->vmcb;
> +
> +    ASSERT(!(vmcb->_vintr.fields.x2avic_enable));
> +
> +    return vmcb->_vintr.fields.avic_enable;
> +}
> +
>   /*
>    * Handle the AVIC_INCOMP_IPI #VMEXIT when AVIC is enabled.
>    *
> @@ -546,6 +650,58 @@ void svm_avic_vmexit_noaccel(struct cpu_user_regs *regs)
>           hvm_emulate_one_vm_event(EMUL_KIND_NORMAL, X86_EXC_UD, X86_EVENT_NO_EC);
>   }
>   
> +static void avic_deliver_posted_intr(struct vcpu *v)
> +{
> +    struct svm_vcpu *sv = &v->arch.hvm.svm;
> +    uint64_t entry;
> +    unsigned int apicid;
> +
> +    smp_mb();
> +
> +    entry = ACCESS_ONCE(sv->avic_shadow_id);
> +
> +    if ( !(entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK) )
> +        return;
> +
> +    /*
> +     * Some AMD systems (e.g. Zen5 Family 26 (0x1a), Model 36 (0x24)) have
> +     * broken remote notification via doorbell MSR.
> +     * Fallback to brute force, if requested.
> +     */
> +    if ( svm_avic_features & AVIC_DOORBELL_MSR )
> +    {
> +        apicid = entry & AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK;
> +
> +        /* Ensure the pending interrupt wakes vCPU. */
> +        vcpu_unblock(v);
> +
> +        /*
> +         * AMD APM, 5.29.8.2 Doorbell Mechanism
> +         * The serializing semantics of WRMSR are relaxed when writing to
> +         * the Doorbell Register.
> +         */
> +        wrmsrl(MSR_AMD_AVIC_DOORBELL, apicid);
> +    }
> +    else
> +    {
> +        vcpu_kick(v);
> +    }
> +}
> +
> +void cf_check svm_avic_hvm_deliver_posted_intr(struct vcpu *v, uint8_t vector)
> +{
> +    ASSERT(v != current);
> +
> +    if ( svm_avic_vcpu_enabled(v) )
> +    {
> +        avic_deliver_posted_intr(v);
> +    }
> +    else
> +    {
> +        vcpu_kick(v);
> +    }
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/arch/x86/hvm/svm/avic.h b/xen/arch/x86/hvm/svm/avic.h
> index f9ff3ffc9346..098924925e89 100644
> --- a/xen/arch/x86/hvm/svm/avic.h
> +++ b/xen/arch/x86/hvm/svm/avic.h
> @@ -6,6 +6,15 @@
>   #ifndef __SVM_AVIC_H__
>   #define __SVM_AVIC_H__
>   
> +#include <xen/const.h>
> +
> +/* Known AVIC hardware quirks. */
> +enum {
> +    AVIC_HW_ISRUNNING       = BIT(0, U),    /* See erratum 1235 */
> +    AVIC_DOORBELL_MSR       = BIT(1, U),    /* Remote vCPU notification OK */
> +};
> +
> +extern unsigned int svm_avic_features;
>   extern bool svm_avic_enable;
>   
>   int svm_avic_domain_initialise(struct domain *d);
> @@ -17,4 +26,12 @@ void svm_avic_vmcb_destroy(struct vcpu *v);
>   void svm_avic_vmexit_incomp_ipi(struct cpu_user_regs *regs);
>   void svm_avic_vmexit_noaccel(struct cpu_user_regs *regs);
>   
> +bool svm_avic_vcpu_enabled(const struct vcpu *v);
> +void svm_avic_vcpu_block(struct vcpu *v);
> +void svm_avic_vcpu_resume(struct vcpu *v);
> +void svm_avic_vcpu_switch_to(struct vcpu *v);
> +void svm_avic_vcpu_switch_from(struct vcpu *v);
> +
> +void cf_check svm_avic_hvm_deliver_posted_intr(struct vcpu *v, uint8_t vector);
> +
>   #endif /* __SVM_AVIC_H__ */
> diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
> index 1d39f25e5209..9cceca704a91 100644
> --- a/xen/arch/x86/hvm/svm/intr.c
> +++ b/xen/arch/x86/hvm/svm/intr.c
> @@ -24,6 +24,7 @@
>   #include <public/hvm/ioreq.h>
>   #include <xen/domain_page.h>
>   
> +#include "avic.h"
>   #include "nestedhvm.h"
>   #include "vmcb.h"
>   
> @@ -80,6 +81,14 @@ static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
>   
>       ASSERT(intack.source != hvm_intsrc_none);
>   
> +    if ( svm_avic_vcpu_enabled(v) )
> +        /*
> +         * AVIC delivers pending LAPIC interrupts from the backing page
> +         * when the guest becomes interruptible, no need to arm the legacy
> +         * V_IRQ/VINTR interrupt-window mechanism.
> +         */
> +        return;
> +

In this case, don't you miss out the call to pt_intr_post() that would normally
happen?

With this patch series applied, OVMF reliably hangs for me. Adding in a call to
pt_intr_post() lets it get as far as Linux booting (but not fully booting up
successfully).

Ross

