Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBB2606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 03:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=z3YAur+u
Received: from list by lists.xenproject.org with outflank-mailman.1493647.1693516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTW9n-0008Bt-3p; Wed, 18 Nov 2026 03:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493647.1693516; Wed, 18 Nov 2026 03:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTW9n-0008Bm-1B; Wed, 18 Nov 2026 03:16:23 +0000
Received: by outflank-mailman (input) for mailman id 1493647;
 Wed, 18 Nov 2026 03:16:21 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTW9l-0008Bg-6U
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 03:16:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTW9k-001qll-J0
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 04:16:20 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6afd187c-2eae-0a2a0a5409dd-0a2a4501a564-6
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 04:16:20 +0100
Received: from [40.107.208.17]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Shuaidong.Chen@amd.com>)
 id 6afd1882-5bcc-0a2a45010019-286bd011d7c3-4
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 04:16:19 +0100
Received: from BL0PR12MB4754.namprd12.prod.outlook.com (2603:10b6:208:8e::26)
 by PH7PR12MB8037.namprd12.prod.outlook.com (2603:10b6:510:27d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Wed, 18 Nov
 2026 03:16:08 +0000
Received: from BL0PR12MB4754.namprd12.prod.outlook.com
 ([fe80::ebe5:87e:6d95:580c]) by BL0PR12MB4754.namprd12.prod.outlook.com
 ([fe80::ebe5:87e:6d95:580c%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 03:16:08 +0000
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
 b=Bmc0mlZci5iWeLThMmJcCnfOK0On+xa+bkyZeQEhCNBc2ReJUrjjE0u2yAEGw9O9pSp20Q39kvoSbazalgDB+xrgcJh5OMJ2njJGpxvEijF43MlV80K3D5kpll1ZgeLelZSNbsmVGuh9yBiA+/sVcbq6qNFC8vBy9w4n6ryQdAUBfLnmMWnR47u2xIxMkMOCkp9o78P1Jp1jMnLD+rd/od/8ryCsI/irn2cT5E8m2+AF/icWDNiduMudXqf6R9li1QDEhip3pDsykjCZv4UGdmGsDQTJhwb5LPkvamD6nTsvhDrUUMNf7OIPSm9QLYEpWEz2BcWQXgNPv5RzdmZxRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1rFFp2COQtSR4rs7FM+1VbtweGTlIP+ZEKPt4YI+0Q=;
 b=mPxtvs24jBIw3ohIyTxG1lYqoOF9b6JdX718lXMefhlXn2fvCTzvQdadoqpr9BhVnUDqO2WFWNpcB1elY+u226/VBk2KOUz74+7a7NAYiiXHWaEST5kJzWohO6fWVmUsxgU9ijqIG9h2UpwrOYUlWJn33AI1gBbKl/FcCpfjewotHeQFhKkAdI3aiZpdIEFV2aaU9Ysi9rrHoLSZ0Rs5FSMeVB85VBmTv51WBBWu46KSaPrjHnIUBEMfjrhT6YEavTOWYc+lV2+4VHX0Nm4JamCC6/gx7cvbeVZYDVW9gpz0lu95SMxh0itx/tSkkJxZZKA0bTLAJyJ1dzYcD3PHrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1rFFp2COQtSR4rs7FM+1VbtweGTlIP+ZEKPt4YI+0Q=;
 b=z3YAur+uz7u5N7H8vvCAgUz1nacsbwsblRYt8rK0H8avuSGYaysG0PQ48BhIQHoGg49kJes6i67mZVcs43BfQ6Qj0Dj/L5x2Ze/6LyF4oRxH27g+yDpQ83K7jcV1l+vrvkeUqh3Qfv9NsIo+2/9zx7LKlsH73k+dylZLti3htRs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3863be19-b5d2-4277-a550-2bc0235c7119@amd.com>
Date: Wed, 18 Nov 2026 11:16:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] automation/eclair: deviate R2.6 for the x86 emulator
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>
References: <20261116031717.2958306-1-shuaidong.chen@amd.com>
Content-Language: en-US
From: "Chen, Shuaidong" <Shuaidong.Chen@amd.com>
In-Reply-To: <20261116031717.2958306-1-shuaidong.chen@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: JH0PR01CA0155.apcprd01.prod.exchangelabs.com
 (2603:1096:990:7::18) To BL0PR12MB4754.namprd12.prod.outlook.com
 (2603:10b6:208:8e::26)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB4754:EE_|PH7PR12MB8037:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bf5d1c8-f8cb-4e4b-329d-08df45224983
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|6133799003|22082099003|18002099003|261009223027099003|261022113327099003|261021135927099003|261022075727099003|261022115727099003|261022105027099003|261021123027099003|261021121427099003|261026130827099003|261026121527099003|261026140227099003|261026135527099003|261028144727099003|56012099006|11063799006|261021130227099003|261021133027099003|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	RYyqcgBRz7Ibfewk5SUDMRqueuz12UheyKsSOzjcsLCVGGC72uPtZxA7ctoUEQ0kw76r+azfai700bMtg8JL3peJ+8E0iUpcBQhAXhTYJ4TvNDw2EhqvcJ43v3E7iKtznY61Iz//Hv1qCzfivHpDV9weaGmqJ74PZHiQaZ7VVquAL0eSuslh9oP7cX3+A6gAni1WhnCM6DpvEvWmavGN3l33UDn8yqd9/x9I3d97MZfOxONlRAVvZVHFABklr50RNyTUM1egzpmEPbc5CzJjQvwilbsabmKRr23h347naYs3lCaqW5K9jVXHwMDWInyX6awXuVW453oI3yPXLLoB9JJRGOYss/hSoMXixAEU5CB0yhEkqf0h4nAiQCEIJz8tLdXyl522drp5TLr8Eg9x984VKYdhgbguudBZn5qI1C62+4KdrvM+6aBlH33bH6u4ssOgHdaFVILwzOcK5LLmpU/hXv4Ele3a73EDwRZnvdhOOG9qNFrTEvcUJfrQ+ihKfRyif9ZVQKS8/BMeNjfDglwB6fJWq3AJqIx4SIWxO4X+2HrFY4Ciw2a3qVhGCXbzxch8JDeFIuABD0VKgpq6Xnsv0NBAro3oAa+9cjcrD3oEv9OgjYEXahn1AgHPN5YcsRi/bFwcU1kqYCHbuLibtGZmbXldDVu6OoBHYL83oYA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB4754.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(261009223027099003)(261022113327099003)(261021135927099003)(261022075727099003)(261022115727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026130827099003)(261026121527099003)(261026140227099003)(261026135527099003)(261028144727099003)(56012099006)(11063799006)(261021130227099003)(261021133027099003)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFhBbEk0cHlkOXZ1cldmWkVVbW4vQS9CczgzK1lTK0tmMURtWWx3Zm1CTERr?=
 =?utf-8?B?d1VIUmxnVnMxQzE0SDQwckJkRnBTWVZvS2RvOEpsaHU4SW15b2RzcnIyY2NZ?=
 =?utf-8?B?b0FnTFFEOHRBeFo3MzU0WlpaOEFvWWxSVzQ5dUhveDBzazJ0bWM2VVZBR1hu?=
 =?utf-8?B?MVZYYVcwR1IyODltVVN6VmE2Qm14R1NqcDVVL0tBa2t0aGZNRFY5dHM1eFl4?=
 =?utf-8?B?OEF2WXQ1RmprV3JwSFlNYk9NRDJCVHovNGhqb2JGKzYzeW9hRXBOZHVxUWlQ?=
 =?utf-8?B?a3g2OVhZUHh0Y1hIY3VPcjVjaFN0Qlk2am1ZT2ltS3ljdXg0U3Y2eThRSnN4?=
 =?utf-8?B?b0IzNCtLcitBRkJOTFpRY09HVW1iMUVCeGxTdjMxakxHWHRWYUNNWUJWMEsr?=
 =?utf-8?B?Vi9rbkxwL0ZYaXBzelFNWWlZYVB5b0ljQ0w1WVJvSm5sbTRoT2tCK0lHT3Fx?=
 =?utf-8?B?NU9sY3pldDhNZmNGZzUvTlJSYVczQzBvSFlGTm9Xc1VnRFRBd2x0REl6S2Fr?=
 =?utf-8?B?Rk5ZdWxwSk05MmM2RC9VSUFmU0FvdmpNUWZVSit1bFhyNCtPNFlSVWc2cldF?=
 =?utf-8?B?L1ZTU08wWWlQZ09qdlhwK2cwbzF4VW9PSnpEY29iN0x5a0luYWR3eGN6cm9q?=
 =?utf-8?B?ZVhWcFQ3MGVCVzcrSTM5QjVXcUl2WUs4VFV4R2dZZk45MldFRlRyenFpNFIw?=
 =?utf-8?B?SENCRDJJQVFkYTVVWmxWWHo2V20zWUtjMGRxWXBiSDQyVHptNXRzR08xM0JB?=
 =?utf-8?B?TmRSQnVIN1YvQnoxK2wzMzlpQVBSWnJOODQ0Rms0eHh1cmQvMnlBVVdZRGxH?=
 =?utf-8?B?b2NLYTNhdnNjcWJaZmJyRzR0aEQwR1VNYTdhaEdYRy9veVU4U1ltQzRrZ0Vn?=
 =?utf-8?B?RHl1b3NiTEMvaVVEOXYxUlJXZ3hoNmtya3pLZDdCUmdJUWx5NlBPYmNLRnZh?=
 =?utf-8?B?eld5ZmYzYUNDa2lPeEhSV0NCbGdyRnZJM014N0VGMi84aUtYcDNiTnR0Rkwz?=
 =?utf-8?B?TE9kcWpPTjdnWWI1T29sRTVqcHliQzBnTjdjVCthTURKWnhhaVVhVFlHTDNj?=
 =?utf-8?B?VlR6MUZwL0tXNTBnYjRwMTNCdUgvYXlJK3ZvczBQRHhGMElHc0hLK0xNeGMw?=
 =?utf-8?B?SHNHaC9VMWFHb0NST29sKzJabFVkS3NNSS9oczF6ZlRzckNFSHFvRDlYZ1dY?=
 =?utf-8?B?YXg0U2lpSjFycVhjSFQzUnp1WXMrNkZrcXZJSDFEZFNjU01JaWtWVWRVNlhK?=
 =?utf-8?B?eVB3L09najRZeG9wM3JIVFdjUkk0bTdvZ1lES0JwajNNczN6VDkrZXdSc2x5?=
 =?utf-8?B?T0pRQS9hYmlUOVFBRDBpVW5CSzljcGorb2ptMnl4QWhQS1E4amhuNjFOYXJF?=
 =?utf-8?B?VGJZV3pZVnRYeDFVajlmaWRQeE9JK1hVZ3JNNG9ZZ1hwQXRHNzZTQ0JWQ0Ur?=
 =?utf-8?B?alF1TnBpUVY4d1dBVFJ0ekVUTzZQS0ZLcmVSemEwQytuYmJtam5OY2RPQmtV?=
 =?utf-8?B?cjNmdjFRSmFmUXY0NU1BSHhqWC9Pb2JjM080aTUrYmFDMG1vSnhDYThQTGw3?=
 =?utf-8?B?c2JrUFRCOVZPR2N5VFo5YWJoUkpoNnNGMTVFWkVIQ09xNHBQWURTbDFHaWRv?=
 =?utf-8?B?d3lsUmFST08veUFpTGZIZzRLUzMrNWdjcTlyc1dFWEQwNWxRWHVCWjQyNWxX?=
 =?utf-8?B?OC9ienV1VnIzVDlIQmZjbnVoU2NEWkZJcnYzbUR4SHJGb1EzMHZzd3hRWlVM?=
 =?utf-8?B?amhKWE4vVW9JOCs2bWZhcDJUaUdrd0E1aWx1VzJiTVZLM2dYVXF2eWFrYnp1?=
 =?utf-8?B?cHNqd1o0M3RzYU0yTGx6enBqbDRuelNwVVRwSko1L2EvaEttWVpuTERTZUlK?=
 =?utf-8?B?ZTFOMWlZUmszc3RCZ0FOSmFrN0JBbWRaRm5JSUFrT0JUelJTdkFBYUpCWVM0?=
 =?utf-8?B?enZHeFMyVklsbzRtbWFNOVVYYk1RVWpkNm9rSFRVYjlTWm1NZ2RFaERDci9w?=
 =?utf-8?B?OUtwVlRweExVLzJLNEF2cStGMlNjeHB0VWM4R0FzNmY3UytrYlRuckpTK2Vv?=
 =?utf-8?B?ZTh6MDV0ci95TEJ5SkpHUEN5dUxiR09ObFRCWTlXcEJsR01oN2YrZFYxSFI0?=
 =?utf-8?B?Zm1EUzNsZHFBWTRBRndNZ0s5SjZoa1oxZm9Ka0svOWlZdUhQekI3QVJyNzNx?=
 =?utf-8?B?R2kwZGZlZDlSQWgwWExEWnpNNUpEbE5ZOUtGYlducUVGVGdwT0hJQ0dqYXpk?=
 =?utf-8?B?S01QM1R3UXVwTWlwTFZaMG5FejhrNkI1SEhqUk4wSXB1blBIR3cxN3RKcmNM?=
 =?utf-8?Q?EY8Ho1P7RrAaeyRkjV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf5d1c8-f8cb-4e4b-329d-08df45224983
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4754.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 03:16:07.9181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X3s5E4qgV4SOm6EZJPQz+ySBQwzw9gS3zZQSUBmLRXoN8q+2mviLWH7dIBYUFJiTHyaZONuL45S/sa7Wu5nkHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8037
X-purgate-ID: tlsNG-d62444/1794971780-BC4E75FD-C694C26A/10/78276251493
X-purgate-type: spam
X-purgate-size: 4104
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/16/2026 11:17 AM, Shuaidong Chen wrote:
> MISRA C:2012 Rule 2.6 (advisory) states that "a function should not
> contain unused label declarations".
>
> Depending on which parts of the x86 emulator are compiled in, some of
> its labels end up with no goto targeting them.  For example, with
> CONFIG_HVM=n private.h defines X86EMUL_NO_FPU, X86EMUL_NO_MMX and
> X86EMUL_NO_SIMD: the CASE_SIMD_* macros then expand to plain labels
> instead of case labels, and the gotos to several hand-written simd_*
> labels are preprocessed out, leaving 91 unused labels in
> x86_emulate.c.  The build already acknowledges this by passing
> -Wno-unused-label for that object.
>
> Annotating these labels would only add churn to the emulator.  As done
> for Rule 16.2, deviate the rule for the emulator as a whole.
>
> Signed-off-by: Shuaidong Chen <shuaidong.chen@amd.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> v4:
> - Reuse the existing x86_emulate file tag, moving its definition ahead
>    of its first use.
>
> v3:
> - Drop the CONFIG_HVM=n specifics from the deviation text, as the
>    deviation itself isn't limited to that configuration.
>
> v2:
> - Drop the __maybe_unused annotations (v1 patch 1) and the CASE_SIMD_*
>    specific deviation (v1 patch 2) in favour of an emulator-wide
>    deviation, following the existing one for Rule 16.2.
> - Trim the Cc list.
>
>   automation/eclair_analysis/ECLAIR/deviations.ecl | 7 ++++++-
>   docs/misra/deviations.rst                        | 8 ++++++++
>   2 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 296340bb4c..d49af53055 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -55,6 +55,12 @@ removed by the compiler, the resulting slowdown is negligible."
>   -config=MC3A2.R2.6,reports+={deliberate, "any_area(text(^.*__maybe_unused.*$))"}
>   -doc_end
>   
> +-doc_begin="Depending on which parts of the x86 emulator are compiled in, some of its labels, many of them generated by the CASE_SIMD_* macros, may end up with no goto targeting them.
> +Annotating them would only add churn to the emulator, therefore it is deemed better to leave such files as is."
> +-file_tag+={x86_emulate,"^xen/arch/x86/x86_emulate/.*$"}
> +-config=MC3A2.R2.6,reports+={deliberate, "any_area(any_loc(file(x86_emulate)))"}
> +-doc_end
> +
>   #
>   # Series 3.
>   #
> @@ -531,7 +537,6 @@ therefore have the same behavior of a boolean"
>   
>   -doc_begin="Complying with the Rule would entail a lot of code duplication in the implementation of the x86 emulator,
>   therefore it is deemed better to leave such files as is."
> --file_tag+={x86_emulate,"^xen/arch/x86/x86_emulate/.*$"}
>   -file_tag+={x86_svm_emulate,"^xen/arch/x86/hvm/svm/emulate\\.c$"}
>   -config=MC3A2.R16.2,reports+={deliberate, "any_area(any_loc(file(x86_emulate||x86_svm_emulate)))"}
>   -doc_end
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index bee4686675..7b983db264 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -116,6 +116,14 @@ Deviations related to MISRA C:2012 Rules:
>          such labels poses no risks.
>        - Tagged as `deliberate` for ECLAIR.
>   
> +   * - R2.6
> +     - Depending on which parts of the x86 emulator are compiled in, some of
> +       its labels, many of them generated by the CASE_SIMD_* macros, may end
> +       up with no goto targeting them. Annotating them would only add churn
> +       to the emulator, therefore it is deemed better to leave such files as
> +       is.
> +     - Tagged as `deliberate` for ECLAIR.
> +
>      * - R3.1
>        - Comments starting with '/\*' and containing URLs are safe as they are
>          not instances of commented-out code.

Hi~

any other comments on this?

-- 
Thx and BRs,
Shuaidong Chen


