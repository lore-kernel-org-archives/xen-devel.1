Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17D0606A32A
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2026 14:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=ELlBS2yN
Received: from list by lists.xenproject.org with outflank-mailman.1463343.1674228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM4Zc-0004JG-HL; Wed, 28 Oct 2026 14:24:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1463343.1674228; Wed, 28 Oct 2026 14:24:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xM4Zc-0004J9-EG; Wed, 28 Oct 2026 14:24:16 +0000
Received: by outflank-mailman (input) for mailman id 1463343;
 Wed, 28 Oct 2026 14:24:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xM4Zb-0004J3-6n
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 14:24:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xM4Za-007vsI-Jc
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2026 15:24:14 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ae2058a-e002-0a2a0a5209dd-0a2a45069842-8
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 15:24:14 +0100
Received: from [40.107.201.36]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ae2058d-195a-0a2a45060019-286bc924892c-3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2026 15:24:14 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN7PR03MB431326.namprd03.prod.outlook.com (2603:10b6:208:5f5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 14:24:10 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 14:24:09 +0000
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
 b=O/t1GZGRq6+w1j/cW9HhoSedHXv9pyQI4NVH0OI+YmRsm6TtEfCsAiirR+jCMHifl9OvssqSo94JGzumsT/pX260QwGy2QlG0IXLaBUaTSnBWyT4HsQ9FI97rIvkcAerFf/8UYuRzO2KQngUm5wHWwF9hdQCQrdryk29TA4MGNeHwdhk/V2WpnXXJYTILqx7Ne9v3d+s+zKPVyQuOmljZdF6yw4fgLYzZyEsihfcWXbMDAHWebXAPTqeZsXIGQPn7M+6vooiVlgWds5RSQ8474c1QE6c8+cpxDKhk/V1fXN6mdlBHz2RcAJxlSFHVRX2gYhqmHMbY1S3E2acCyRiBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5sLmmpbpN6bk1iZab31+cz4v3A2w/m5Tk3CYmh3bfI=;
 b=rukF3liZaPX/Ot03DCHD233zMxGaMiuYmcUzcq0NmjwqSvMblMaKaBV1cD7r//7HwBwxJk394ntnmqgZoM/Qoosx5OnXfNO7jf6/gp9lDQmUOn3uVEM3QvrGGXRkB2D2gquCS4DeeZgG9XykDqE09sh5tN6Nsp5yyIJ+wLkxa53lqOEIqQBhXQKPUasFYIfBPNGG1nBVhPZfqqrnw+l0rKAjLK9jGkJI5PGBMczBbkSGaN46jokSjpytEIMMOiuk42i+BtTEs0+epNXVQi2WJxmIDIirWzosaMvNMFeb3SjTDJsAyaMKH7dV2totUtn8RtTKxPRADJVZ1+kBZ0vlMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5sLmmpbpN6bk1iZab31+cz4v3A2w/m5Tk3CYmh3bfI=;
 b=ELlBS2yNKv5+rwTNLgLgXYLi5wzRGnV/AAudWrGKM9i2/utwSGFDIkKJCCjLRQgALRAUVTE54PaAj09lD+7fhiBFcGdIBUF9evSNT41rg8RfcVfMeP7hfiYV91YsRwOJH3h4FUmSigIlgxY0+qrQQZsW4iOqO1cPAQsRZht2wyM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <35fa29d5-fafc-43da-a5a5-72df8f367e3c@citrix.com>
Date: Wed, 28 Oct 2026 14:24:05 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>
Subject: Re: [PATCH v10 1/1] xen/riscv: probe the A/D update scheme if the DT
 advertises neither
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 xen-devel@lists.xenproject.org
References: <1793192679.8631fc262581453bbf619ec5b2062170.1a1829cd6d5000f79f@vates.tech>
 <1793192757.8631fc262581453bbf619ec5b2062170.1a1829e0a63000f79f@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1793192757.8631fc262581453bbf619ec5b2062170.1a1829e0a63000f79f@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0026.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2df::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN7PR03MB431326:EE_
X-MS-Office365-Filtering-Correlation-Id: dd7af81e-032d-45fb-d4e1-08df34ff21a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|4143699003|11063799006|56012099006|261009223027099003|261022115727099003|261022075727099003|261022105027099003|261026140227099003|261026121527099003|261021121427099003|261021135927099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	UmUXsw//LE54FslBAj3YnfBBPTzTS3+Bl4zxFkPulbqUj93nuZitJWmy6tV0FYrpafs9IjiqNNXjfNOoEMK3Zd+dkzjhsBn/6f0N4O5XrNxpbG9Bt0D0GWcZmw0aWYOuiPqSW+IKIqm+gTAHMLYO/057Bl+zTfXzZj0ctXE4m+HAkL/ng5fgZXANIxs3GB78ZcMFd61q+yybxx6tTbzVX6bBzGuOVAaFhNIqgCx4tkl6IDCaEUxFPIDFCe75cm8qowiCPT2BMSnlNNLZHvPOPv4T7q4bYoSNc1rQS0FfZ0LzxsVMRGCizz/vxxG2g2Xv24unJD0ZwXfus9EOEYdfuUGVoO3o0r9Pyvhg/jbL2A/qckO3KUQPOTCR9fOd2G20+35L+gY8aCgcHrOift151cEN2DsbFnJJ+45Vc++Z0POmqYpjJ5w901xU5Z1ZC9fKTED9aXmvjdDxxL190oHpawTqiY1PWDzADt9LK/X+itr43NtWR6wnUss5dvtP4w7Xhio0HPF/weS0H2pnpaB2/UmU+3cvk6VoJDqLSRI1jTaRTkUmqgGr1znLlumoCgSAle9op/xAiN0V1wbs2SJzLJiC/DdALzI2Hjctk8sJ4vrXz24Kx/t+4vlTm+NdSd3Rk2DxZy3chGW92bw3m6HdH8jTtVNHVX4iZ28zzbYKI/8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(4143699003)(11063799006)(56012099006)(261009223027099003)(261022115727099003)(261022075727099003)(261022105027099003)(261026140227099003)(261026121527099003)(261021121427099003)(261021135927099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGxwRkxxbHo3TUNHZlA4VXV5dkZCVFV5ME9xd2pmelBUc1E2VmNERytHNWpB?=
 =?utf-8?B?SzVSbTRVa2FxRkhoTXQ4bzE4VGZRanVZZFdKS1pEQzQ2QXZRZWhRaStTdDZt?=
 =?utf-8?B?a1Z3Q3c5UjFwMDFSSHAyQkFiUERBd09LdmNZZlNHRUs3aE1TWTZHZ2x4T2Nj?=
 =?utf-8?B?ZlliVkJ5TWowQllkMVNmV2hlVktBRDEyM1BYcFpvQmgrbUp3M3pSRHUvbG12?=
 =?utf-8?B?a3ZrMEFQL0VTYUlhblhjaThoQitva3BJbUNGbFlNbTJQOEpqMkhOV1NsNk9s?=
 =?utf-8?B?Zmx6UjZ1dTF4aHZSR0RWZXdhc1hQYmtkeDk4WGg1dlc0TFdnMjc0VHJXeDlq?=
 =?utf-8?B?RHZ5bnFsVFFCbENaNXREb2Zvd3JscDhUTE1jMmRyV3ZvZlJseDh1allKc0Zy?=
 =?utf-8?B?UnZwWXV4RmluWENpL2J6MXZRN1FKVmJVL292Z2gwUFF4S01xUThWS1R0YWt0?=
 =?utf-8?B?ZVBVQ2xiOTZHVUhHMXRCakFmeGlUam9ROFhsU2dPRDJQcFc5VnFLQ0k0d01o?=
 =?utf-8?B?RFh0cE9DNkxOTXU3MkoyYVhTMlZBVWFETGtWaVRXemg1UGcrdHJ4elVEQ3E3?=
 =?utf-8?B?azRpM2lkanRINVFnZ2ZxbWlaNE50dlB3alM5a2QrYkkwSFB4Ynp3cTA4UmNn?=
 =?utf-8?B?V1RnVkE0YUJCdXMvazdybzUwakxBT0lFZWdiYmVmMHFsS1A3ZjhOU2V3V0hk?=
 =?utf-8?B?Zk5nK280NXJkaytidG1GMisxZC9USzBMeVBoMjIvWm10SjlRMmtSNmQvbDZ1?=
 =?utf-8?B?N2o3a2VFMkhTMHdJeEVjNmJDWHdVNGVHaHJkcUtzSlZWU2x1V3JrUDB0OW5v?=
 =?utf-8?B?WmxKVDhhcDRJZzZsZTN0ZWN6ZDlOYVBFSzJNUHh4blozcjM5VlNvZkdmVzV2?=
 =?utf-8?B?OHd5MUpPbWYvL2k1bVFLdzJCdmQ1THd6Q2NNM0JoZG9TcUhsVTNuQ0QwNjhI?=
 =?utf-8?B?V3NOaW4zaTlZYUxpOUJPNHU0TUM5eHNqRUg5Snkyb0pqajlXek9URExROUVB?=
 =?utf-8?B?WStBd0NQVU5lT01Ob3NoRFIzcGxLa0NTdVQrK2pVS1pPUVhuUDZiMHZkVlUx?=
 =?utf-8?B?cU1Cd3B6T0hOdG5XaHVqa3J5Tk81VWQwV0lrcXBKYmc2eThJVW1RZ3RpN1dX?=
 =?utf-8?B?OFRSYU1pLzd5dmR6dTRQcFU2QjlLeVN6UXlZa09Fd0F6VEx0bHMxWm9RR09y?=
 =?utf-8?B?T2phM2xMeFhuaDZVSGtFc2VKWDJBcDNQUW5IZVQreGNVZ1JIczkwWG1naTN6?=
 =?utf-8?B?ZHdjQmExbFdkVnZuUUcrQS8rajh1dmNLdnlCNGx4dmhFTjVuNXQ1NWhrOUV6?=
 =?utf-8?B?eHAxaXBTdnlnTmNwT1pJcDFoQ0swRWlFdHp4bmpwaCtiK3gzdmdkV2NkbDVn?=
 =?utf-8?B?QmlnbFdjdDNqaGxtVHM0QktyYjdDUVExbFlCQkplZUVBbG9rbDNMT1l2dEgv?=
 =?utf-8?B?YUc1dWk5OTdFeFlCR1FReVJHVEVhNU5ManNacFVQRFk0WHkrUHRJMU00SENl?=
 =?utf-8?B?TnVvdHFQbzFJbWRDZkxUbWxjRG8vSHJpNFJCMWxyY1NiUWF1YXNzcVkycGNM?=
 =?utf-8?B?NmJCbFYrSzcxQ1RFYXdZUlFZWlFUUThlK3NWWkE3TFBLcjhOS2xOQmR0MFNU?=
 =?utf-8?B?QmloaUptU1YxSE9XaTdPM08rQkY0TGVkUm4yNS9CRk5zeUZlMHZ1Snl6NDgy?=
 =?utf-8?B?MmtxQS93MjJiU0E0cEN2NXZZMFJLYTZWektTN1J3QWg4Z3JTeDdNazdmOFMy?=
 =?utf-8?B?L2hXNVU0aGJsN3F2d1F0ajlCbXpFYjJ1TXBkalBNVG9nclVEOFJFNi9CMjYv?=
 =?utf-8?B?VVVtRnNqVjZlbFBaOExCZTU0YjVoajZ0RGtWMk1MRnk3MDNBejdIQ1ZYMjdj?=
 =?utf-8?B?Rkt4N0dKTzdwM21BbXh3c3lXNDF2R2FJbERIMUZrVVgzMzQ0WmlnSlR0aW41?=
 =?utf-8?B?ZVIvdDhHOFIxbkRkM3hUR2JXZENRRC9qZmpWREpqWm9XOHVjQitCSDd5eC9Z?=
 =?utf-8?B?c01URFlVSHFZMWtCalRtRFRyMHlOZ1F5dHFweHA2VHpiUmVNQnpoVzJ1QnBC?=
 =?utf-8?B?SEprQXVxVGZ5cHA2OVFVZ29xOUxWa3pqcW5WLzdwTlR4K0FqUytieHVRQVpL?=
 =?utf-8?B?UUVrdDJ2WVVMU2I3VUJYc0ZZTWt1U2YrWndTU0dEbmNyS1d3dVo3WElzTEp0?=
 =?utf-8?B?em91SGJtTWtidTlwL2lFTmFqdkVucjVuamZjVUdJMGZ3ZHladnYxVnUyalVT?=
 =?utf-8?B?SXBuTzM3N2VwRnJDQmswWWNJRXdlNVdqYzIybmh1bEFzS1kxY3B1bmpqZWxJ?=
 =?utf-8?B?UjZoUGlOeHRyWnU1M3B5dHpUZDNlTEJHYWZ6cGMrSGsxb013QjdvUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd7af81e-032d-45fb-d4e1-08df34ff21a3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 14:24:09.6501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qQaER5WklKIShq7Bjf1OAlPrgdyTh72Xxt9IpelRQw9o5cTaeslQiQGFyWuxgf4RThY+B0aHhUdtJ6OxQ/A/igx4iFIZw3m+m8cqy8QCJL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR03MB431326
X-purgate-ID: tlsNG-16d1c6/1793197454-FD80D77B-1FDF9323/0/0
X-purgate-type: clean
X-purgate-size: 4614
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 28/10/2026 1:05 pm, Baptiste Le Duc wrote:
> diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
> index 3d5bbd2228..83d3bc5ddc 100644
> --- a/xen/arch/riscv/cpufeature.c
> +++ b/xen/arch/riscv/cpufeature.c
> @@ -630,6 +632,53 @@ const char *get_guest_isa_str(void)
>      return guest_isa_str;
>  }
>  
> +/*
> + * Probe whether hardware updates the PTE A/D bits by reading through an alias
> + * mapping whose A and D bits are clear. Observing A set, even by a speculative
> + * access, implies Svadu, as Svade only allows A to be set by software.
> + *
> + * Under Svade, the read raises a page fault instead, so use the extable to
> + * handle it.

This is an internal detail, which can be covered by an internal comment.

> + */
> +static bool __init probe_hw_ad_update(void)
> +{
> +    vaddr_t va = FIXMAP_ADDR(FIX_MISC);
> +    pte_t *entry = &xen_fixmap[FIX_MISC];
> +    bool a_set = false;
> +
> +    ASSERT(!pte_is_valid(*entry));
> +
> +    /*
> +     * set_fixmap() can't be used, as pt_update_entry() always sets A and D.
> +     *
> +     * A and D belong to the PTE, not to the page, so a new PTE with A and D
> +     * clear can point to any RAM page, whatever its other mappings. Use the
> +     * first page of the Xen image, and map it read-only so that Xen can't be
> +     * corrupted through this alias.

The function comment is mostly ok, but this one is misleading, not least
because it talks about corruption despite this being a read operation. 
All you need to say here is:

/* Opencode set_fixmap() to intentionally leave A/D clear. */


> +     */
> +    write_pte(entry, pte_from_mfn(maddr_to_mfn(virt_to_maddr(_start)),

pte_from_mfn(virt_to_mfn(_start))

> +                                  PTE_VALID | PTE_READABLE));
> +    flush_tlb_one_local(va);
> +

/* Read from the alias, handling pagefault */

> +    asm_inline goto (
> +        "1: lw zero, 0(%[va])\n"
> +        ASM_EXTABLE(1b, %l[out])
> +        :
> +        : [va] "r" (va)
> +        : "memory"
> +        : out );
> +
> +    /* Order the load, and so its A bit update, before reading the PTE */

/* Check to see if hardware set A. */

> +    RISCV_FENCE(r, r);
> +    a_set = read_pte(entry).pte & PTE_ACCESSED;
> +
> + out:

It's better to name this label 'fault' because that's what happened to
use it.

What happens if you neither fault, and A doesn't get set?  Right now
you'll report Svade despite there being no fault.

You might or might not care to cover this case; that's up to the RISC-V
maintainers as to how likely it is to encounter in real life.

But, if you do want to handle it, then you want something like

    asm goto (...);

    if ( 0 )
    {
    fault:
        got_fault = true;
    }

    ...

    if ( !got_fault && !a_set )
        panic("Neither Svade nor Svadu !?!\n");


The if (0) is a bit ugly but it's the only way to avoid needing a second
label.  

> +    write_pte(entry, (pte_t){});
> +    flush_tlb_one_local(va);
> +
> +    return a_set;
> +}
> +
>  void __init riscv_fill_hwcap(void)
>  {
>      unsigned int i;
> @@ -674,6 +723,28 @@ void __init riscv_fill_hwcap(void)
>                 "Zihintpause unavailable: cpu_relax() gives the CPU no hint; "
>                 "wire up this platform's pause equivalent in cpu_relax()\n");
>  
> +    /*
> +     * The privileged spec allows exactly two schemes for updating the PTE A
> +     * and D bits:
> +     *  1) hardware sets them on access and on write;
> +     *  2) accessing a page whose A and/or D bit is clear raises a page fault,
> +     *     so that software can set them (ratified as Svade).
> +     *
> +     * Every implementation uses one of them, but may predate the extensions
> +     * and advertise neither. In that case, trust the hardware probe.
> +     */
> +    if ( !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svade) &&
> +         !riscv_isa_extension_available(NULL, RISCV_ISA_EXT_svadu) )
> +    {
> +        bool hw_update = probe_hw_ad_update();
> +
> +        __set_bit(hw_update ? RISCV_ISA_EXT_svadu : RISCV_ISA_EXT_svade,
> +                  riscv_isa);
> +        printk(XENLOG_WARNING
> +               "Device tree advertises neither Svade nor Svadu, probed %s: add it to \"riscv,isa\"\n",
> +               hw_update ? "svadu" : "svade");

This is overly verbose, including details that absolutely shouldn't be
the boot log.

"Neither Svade nor Svadu in Device Tree - probed as %s\n"

~Andrew

