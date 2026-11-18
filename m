Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3A6606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 18:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=uNK1WRJ6
Received: from list by lists.xenproject.org with outflank-mailman.1495042.1694244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTkin-0003y5-Nz; Wed, 18 Nov 2026 18:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1495042.1694244; Wed, 18 Nov 2026 18:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTkin-0003xy-LI; Wed, 18 Nov 2026 18:49:29 +0000
Received: by outflank-mailman (input) for mailman id 1495042;
 Wed, 18 Nov 2026 18:49:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xTkim-0003xs-3s
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 18:49:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTkil-002Kuh-G6
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 19:49:27 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afdf326-2eae-0a2a0a5409dd-0a2a4507d2fa-20
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 19:49:27 +0100
Received: from [52.101.52.44]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afdf336-b4ea-0a2a45070019-3465342c6f38-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 19:49:27 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV4PPFA3BB769D6.namprd03.prod.outlook.com
 (2603:10b6:40f:fc02::216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 18:49:24 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 18:49:24 +0000
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
 b=RUukDuVyNaAZHBTO85jfugMQ3WV5AT/JH/EiDk7uUqN89VLPhG7+HznrYE4s/gE2lzm6eFctqAjymA/guLBtyziYj108p7u8QUuRkvS+I/196zmifuYvztUrZrPFMp7/EK8oJRHXjjgvRt82OI3HgCfQkSYU2i9aKzoV5sDeZLw8oR2XFMIaRbnaw8w0kPMp7w0lvAj/FFfbVUOTwIYu6LCKbeX01nrg3+W0m5riiRLTn0VmletThAr1dds7b3RG07u86tgzFIQ6OhfwTMQa5dK8HUf+y5r3Z9oJCs14CI9AcfBV92GF1xz4Nb8xYkJO/3Wj0saB+0Enxpis8sSizQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+x5P1DRw2N+BpX6AiBo7+Sycw4OEo/QZbjdZpFlsGzU=;
 b=sCW9LfXfXPT9D2+S+yre/2lozqhxZZpb0Pg4DLVIq53ZbcHeszYFqNkeMz4IX1ZI0IVZl04tDD2WJ0lLqr/dX+CRe7em3um0ae1hlvcOLcNJSwIFzqcn41GXbHkkk6KjkGUnaDVPG2+Hkh0AD9dzjzE1oy9u+SdTZt8z44Agi3dZhuYI0hd9c+NbwRrfnB26YCuFO7YgWAYCH2xZEXoqD3Rvg5yOL498mO6TK9rz29+MyxH73q6rlUpRIITyUG0MoBQe3x1ANeHWRhQVi+wHK9FO3m46kv0xNVNZf/2nbPvlj6nmdUwIHExzc1gKI7Ne5YQVD/x4RnC2lBiRrtzUyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+x5P1DRw2N+BpX6AiBo7+Sycw4OEo/QZbjdZpFlsGzU=;
 b=uNK1WRJ6/x6kM9WiqYuYZlBOJ54PwJZCti934swiPr+GqSjagbC/Pbe/VpTF0p8oCjiItyUcLLxmsRnvBkgwee4tuTH/3N0nOKYoGJ72v8Q+NOmJHuZ0G913x3C4q1QfSAKiWnRVHyxbPGP1vcXCQWFuc+WjgCXqxqC8PQ3FWAU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <3cebf8d5-3ebe-4362-86d7-610e08d7480c@citrix.com>
Date: Wed, 18 Nov 2026 18:49:21 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 3/5] x86/cpu: Use U suffixes on integer constants
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261118171758.1125066-1-alejandro.garciavallejo@amd.com>
 <20261118171758.1125066-4-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261118171758.1125066-4-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0217.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV4PPFA3BB769D6:EE_
X-MS-Office365-Filtering-Correlation-Id: 49bc6438-68a6-4b49-6c7c-08df45a4aa7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|4143699003|11063799006|56012099006|261026140227099003|261028144727099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	DP0y7mka4je4aSu3RLfmSDRgzYiMrhuGfrqkejgVOteFJyK/D1tm5zA4fa0GdIpHmqgb8r/SCyUfZbpIVj6H7fZyU4GPAxdrEEnCG6Opq3mfL5dxXLt9ak0DZVgzJo4l8ZUry276Idur448bcnzcQziPIVloKn0yBU1PyFE5pnrXGFKIdgxapipPa3bRHty79MqUgLxd8By9sOsy+0U/X6wTBu8BNJ0qsKpqsgVvzcdHBi8itQGYVJaOrNg7n5jhZ5KMEJFBFMmX/VpkBBsJg8qMEXHYdbJoWarfpLvMqjTOhkVcevMTCwlqLTFqraTum11F9XdnsiZdtLSbGzJAnDY7pxCLtprOVSakNvLrNNYi0WqetYx9Q5nUr7vNp72lMe3+KL+/kua26G5aPMPtz8sDVtP/gucS+MQOsQeXfEGxZIU/UO/cKN2kgXyB6SCLouNSRS7x+9Xa9fnDg+Wp1uNv16N/mavzdpMUyA7f5gpW6oZ0kJTUGJ86fAUnOrIn3Oo5wrJfY9ya5iIfMF7wv4JCQuzlfOJ6G/LWeXlbOip84g8DZqpmQXdtGzsDiM57EwKXBpCwGVO6626SaFlXBtKity5ig2Js5mdrYXBEujNiaQ3yYV+wJOorVRo+N0XULSwpkohJuX6VDWtxkm7TwJ4gL3OPW/eH7F6NZFAUOXw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHBLMXlVeDlNRm1PaW5XNjdZWVpER0RsSjRKamF2VmhtRmlpSndXclIrYWYz?=
 =?utf-8?B?RmYzTW5RUUw3MU9Kd2RxMThlNlJqdXlYbjVqbVVMT3ZlWi9ZY3JOMDFOcmMr?=
 =?utf-8?B?UXVVZnpLQU1Fd2JGaGh2OXFVMEE2b1J3c1Y1aXNRTlVIeW1UN0l0Zm5qRjhJ?=
 =?utf-8?B?RDIvMW93VldTQnFFdS96cGhhaTB3R09IRE5qYWVCNkdtRlZVSGxWdEk4cTM4?=
 =?utf-8?B?SlEwVE5Ca2tTRzRMNGxVVEN1VnlTMmFQeGxrNzlTMTdmVDR4VUM2WVlPYzhj?=
 =?utf-8?B?QkJubklQTDNYOEJvcGNHb1g4QW56Tjdic290QVJNSnErWDNRaHNnUFVFL1ZF?=
 =?utf-8?B?RytLeGVwclJxOTdiZmwzMU1qaldpWWZTZGROdFk3VmYyVE9aWGFibXgvWmFV?=
 =?utf-8?B?TFpEclNtU2F5SGdxYVNnbGZBMVF6UEhGdjhvUXlzOWVEVUtUbGlXYXdwNitN?=
 =?utf-8?B?M25wV0RUNmNyZGxnQUUyY1FCQUp3NFdQY1pIdy9mN2RMa0FiQ2d2eDY3a2ZO?=
 =?utf-8?B?UXZEODlvOUZidGZ3OUFuMlo5NGpBbGlRbmdPeVhGV1BJK2l6SWJtcFUzZUJp?=
 =?utf-8?B?a21PZ0R0ZWJnSnZkUm5rQS9rM1pVSzhWclhPRjBtbVRvc0NmczlmT0JmZnZm?=
 =?utf-8?B?bldXUTBtSjZhS1kvVGt4WUFnMmRCMXUzSzRmN09RK3doUzBvRTB3b3BhS2hB?=
 =?utf-8?B?aFIrcEl5QVVmUG5PNzJRcGdURkF6RlRMMmZPd21mUHM4L25jVzJRcVE3RGFh?=
 =?utf-8?B?SWVDcVBlR1hkRnJReFdJMEFPL2NsMjVoWXFhb25xcWxvTit6V0ZwOTNnVUJQ?=
 =?utf-8?B?dzdRZ1VOY1EraHdXQ0VoV2tDblp6UTZ0anBFaHpibHdxL3FKSWxHNjJINFpj?=
 =?utf-8?B?WnNFZkZ4VlRKQTJRVWdGSWtGcmc0WUlBbnF0NjJSOTl3VnhadUlMdm5rMlF3?=
 =?utf-8?B?eFFpVnUyVDdJOVpDTzhxVkt3bWlnZXJlSTRLZEt6aVFzejNBcDl5aTJEaVJj?=
 =?utf-8?B?ZlM2Y1ErVCt3ZCt6ZmR6ZjFqUnVlQlIwSVBENWFlQVhoRlg5amJ4bHNkVG1E?=
 =?utf-8?B?ZGt4NzJRZDhjNURVTGZaRUVvME01Z2RrY1pPV2R3a3IydVBuZU55eUZEL3VW?=
 =?utf-8?B?WnIzZG1uTGJ1R2E4NWZKdjdHanF5WmtCYnZ3Qi9UUURwUDZmMndZZHhRRmg4?=
 =?utf-8?B?bk5WWHl4NnBmRjdISEVLenVCYm5adFg3N3hBN2w4cHBFNzlPQTZleHZpdXN6?=
 =?utf-8?B?aWJDVGxjOWl1Q2U0TEZJYzNTcmpkcDlXNkhZcFlDNTJTUmJwZDFFOTExNXkw?=
 =?utf-8?B?aXNPc0I4ZVA5TVdtNlh4UjR0b3BYQXNjUks4YkY3RDd5UGJHbnN4Z3RTeDBa?=
 =?utf-8?B?RkxxR1F5clF3dWxnY1FJNFY0bko2Z1RnMmNJTUhHN1NuZGJnZGFhUVRYN240?=
 =?utf-8?B?QS9FVUtQM0dkR1FDVyt4VHV1aWQzNi85Mm9uV0NiYVZwT201a0VlTDJmR3ll?=
 =?utf-8?B?eHI3OU52U0hod2lnRy9sRXpjQitRQWdRZmhUL0lMTnUwOEVoSDhjWkRaYUFm?=
 =?utf-8?B?RERKaVNubUlWdXFKMy9DMGE3WDE4a3BLa2xQU3JydWlENVJUTkFqR054NHdh?=
 =?utf-8?B?c2t3Z3RRVDZ5ZGxoTU8wRU5FdzhqUHZjR3QyMmk2WCtPY0VCRGZCclJCdmpM?=
 =?utf-8?B?S1lGT3d5TFZiVjNxcHRRajZIK0kwaktiVUkzNnlRVkpRakVteGoxL29tbGo2?=
 =?utf-8?B?OW43R2ZMc210em9mbXhueTlxYVFXeUZKZmJMTWdXTFpxeUtkL3ZBN0RTdk9s?=
 =?utf-8?B?ZE5wRDhHMHREbktTRGFINlBQbDdMMWJDWTU4dk5RMlQ3YlpaQngydjRkcE5z?=
 =?utf-8?B?SXI5blMweUh0NXZUcHUvaVFJTUZOb3MzczFpeGZUdEFvM1MxTzBvaXQzUTgy?=
 =?utf-8?B?b0pqS1V2S29YY1FSSFg5SmNYOGQ2K2tUNUlJUzhaMWtuTkM5cnlYSGQxQmtL?=
 =?utf-8?B?Y3NyendROWkrRkpONkdOeEY3U21lOHdoMlFnL29xdGh1d0g3Z1dRTEZ1TGJX?=
 =?utf-8?B?ZmsrVzZUWGgrSHdMWVB3WW0yYXJyWTQrNGlMN3U0NVVTc3ZkSDk3MFZWQVV5?=
 =?utf-8?B?NGVBTk03WnF5TmR5ZlY3bStNUlQyanlHYTBXQnI0d0h1RFBsNm0yZEdkZW5F?=
 =?utf-8?B?NTVjT2IvS3R1RmVCU0tQNTlocEhLSFRGTnZZRy9JT2toSUsvZlRMSFkvakZJ?=
 =?utf-8?B?R2pReWgvNXJnSzEyc1RpU2F3SkVzeTJ3bE0wNmNBOFZ4KytyTmtiSi9SUXcv?=
 =?utf-8?B?UmlYYkF0T2FMNWFXUnlIOHV0VitXSnduRTRMWEhyQUp0V2ZiWExGWE5NK0ph?=
 =?utf-8?Q?SZR+SavCq0w9/pOc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49bc6438-68a6-4b49-6c7c-08df45a4aa7f
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 18:49:24.8112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hrulDfmK6+WvY8bFqiZt9U0+fdiQ2CfwZ62DWaOiBtHRmTCEhAUg8lIbmiMD6U6i8ZWw7xS6VFpghaNJ32aX9Ej4s+7DnABnUzo5jqIxx8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PPFA3BB769D6
X-purgate-ID: tlsNG-ef75cf/1795027767-348C9AE4-E98D09C7/0/0
X-purgate-type: clean
X-purgate-size: 823
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18/11/2026 5:17 pm, Alejandro Vallejo wrote:
> diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
> index 21f82990db..fbbba0005c 100644
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -728,8 +728,8 @@ bool __init amd_setup_legacy_ssbd(void)
>  	 * c->cpu_core_id is sparse on all but the top end CPUs.  Derive
>  	 * max_cpus from ApicIdCoreIdSize which will cover any sparseness.
>  	 */
> -	if (boot_cpu_data.extended_cpuid_level >= 0x80000008) {
> -		ssbd_max_cores = 1u << MASK_EXTR(cpuid_ecx(0x80000008), 0xf000);
> +	if (boot_cpu_data.extended_cpuid_level >= 0x80000008U) {
> +		ssbd_max_cores = 1u << MASK_EXTR(cpuid_ecx(0x80000008U), 0xf000);

1U.

I guess the case of u/U isn't blocking in Eclair?

Can be fixed on commit, if this is the only example.

~Andrew

