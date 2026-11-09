Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B63606A322
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 15:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=XOdc1zlm
Received: from list by lists.xenproject.org with outflank-mailman.1480239.1684205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQQz2-0000Je-O6; Mon, 09 Nov 2026 15:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480239.1684205; Mon, 09 Nov 2026 15:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQQz2-0000JX-LJ; Mon, 09 Nov 2026 15:08:32 +0000
Received: by outflank-mailman (input) for mailman id 1480239;
 Mon, 09 Nov 2026 15:08:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xQQz0-0000JC-U7
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 15:08:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQQyz-00EWEG-P4
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 16:08:29 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af1e1dc-bab6-0a2a0a5309dd-0a2a450ab62c-36
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 16:08:29 +0100
Received: from [40.107.208.70]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af1e1eb-f2d2-0a2a450a0019-286bd046ab9e-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 16:08:29 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by AT6PR03MB251506.namprd03.prod.outlook.com (2603:10b6:170:113::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 15:08:26 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 15:08:25 +0000
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
 b=BjiuboTBGnt8XMDTp74oo/F2n/EoprtE3Cy5umrvEHELw4jpcQMq6AszsTW/WW84r2KxE8vjm9jQGM0QsqhxRTYAgg6US1bUVvKAEY3XPHREcUmqL4+yl3j9YQBjNjK2sfDkVGe9szZbbPACVHFxDRQVXNaGu6AGulocfa83C2OmgvBfbM+TZo8s1cV7awzASgfewHgFU4TCYpJ6AlqQAUTZIv6QARYEEVxrCDDUbrYY7AB7g1dTjdk1miMSmAZf4FzfuWteA/QNFVlfLOTcm2Dh2/cIlpd2/rbzK3fhl/pOdXBv4MnpV1l3XKJhzFAWGmFFmrbfOfRzCkdYg4J0Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOUXDmJyg2Z2Ve16omnUS6yfpwDjj/yhrhUDBEjAdiw=;
 b=Ke0b035PCLbwoymeTi+Y+wPSyPPeasE7Vgx2ubesR5v+haFenqrokeOUtLhQYpqhbnAHhS+5YcvyjS4tyfcC6XawDvixGenTyFk3NqCwXimRFBQZuYDCektO0Chp2odl40RYHnawn4VhPmJ8cmgWRsbtE+qgwdKkXh+SJ++FLfZzsw1frMxG8v39LA1aegSEsIs6VNfgFxQGKSbjxqxjsa8aWAijp0Gpo/1Ml6wJvm6dZjAhVeq06QZXABQnlDGjeUuK8lbE4ZWB+l+sR2zW+Y9Fy+iBF01dKWHSMg7AHg6hbUokN8CA0tlZvtBSaJggmWUNknl975uVuq61Zvdj9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOUXDmJyg2Z2Ve16omnUS6yfpwDjj/yhrhUDBEjAdiw=;
 b=XOdc1zlmCO8rbBth9fpswSFTRKcvdIKxy+DSQjWcYGTujt3agzPENQloljOaUqxr+eM7R4HpAr+Vj1fF3Wo1w1XmAKSocF0tX1nCwjvl8v48I0pZu6XoavMRFcn2MQAQNOFQISg+0YkB3kCfV7wYEY/Pmu3FfCQzis/uQE/Nxn4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <34f76982-4c7e-47b8-ac6e-31d41ce08702@citrix.com>
Date: Mon, 9 Nov 2026 15:08:21 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jason.andryuk@amd.com,
 jbeulich@suse.com, roger@xenproject.org, teddy.astie@vates.tech,
 dmukhin@xen.org
Subject: Re: [PATCH v1 19/28] x86/hvm: avic: enable SVM AVIC statistics
 reporting
To: dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-20-dmukhin@ford.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261105013347.719392-20-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0186.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|AT6PR03MB251506:EE_
X-MS-Office365-Filtering-Correlation-Id: 38c17849-82bc-43ce-2574-08df3e734db7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|10067099003|4143699003|11063799006|261102123227099003|261022075727099003|56012099006|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	o9jphOmBOdTWrost6G4y5+ZwrZOJ+DO8RNt41pHQca6yqWi4gEoEffB1ilRExJPEG/4J5lw51KMJcKl2WeizIHkPryf9lGXlc2BZILc24mbnpjKL5zyZx9sGFJ63XbzCeb7kYM162ehdjCg0RfqxglQtvKzpZ2b3NY5p5I39+FXpHKWIgMa2/fTmY7e/ww1s5h12TVzGhDHXZ+FimoNA2a4blByp6YoJYv2ukgVtEtdUYhfPjtJbXkH8pN3dhln/Ym/dKigiZo3bCKKTO9lF/FjpesdhCzzcQlRCrbVumyY+/ZzDQOhNGM4/byWeQRD/CVYyq83MBtoZIBHwE7iUF1MBuxQT8euLnE2ulNqiPtcMXswmPhmCLgJ0DofrekB2P6kFWZ4a5lupz/IreViOPGGfKUvO82AY2LJjjUhekint//0a4JHffr4852MsPdLOCZOSyjmlWzBTNlTtdX0Oq9dtxtjQjVdSAe2zK8XRyDhnoL8A/m5b+wymTU8xt3YSf4LFH8OyaB5z6rzsqacZVji7BbEk+Muv4Gyd9CbaU925xjea0vrj+xQ/jCTCEXBoN/dEtFiK7BdWf+ANzt974aR1dS5rB0uY6wiL5Www7BhRkk9NzzxcfQocqyihcvV7FpuqQtYX9oQrqzFYLiqnieqQVn+7jl7nYAUuf8I09CY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(10067099003)(4143699003)(11063799006)(261102123227099003)(261022075727099003)(56012099006)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmJsRFkvMmVkNEhmZmJUZmZZZWt1UUJIcVRiaEVZMHJ6Wkl5VVdTbGIrOFBD?=
 =?utf-8?B?T3RCQVl1cXJUSUxUVUYzajlOKzVUdlJrb0srNW41M1RGTm1qTXBETjZJTFlt?=
 =?utf-8?B?M1BDUVNWWkZRa0JoaytnNUlFbmUwS0tjZUJaTUtyT0J3S2xEYkdrbUV1eW5M?=
 =?utf-8?B?S25TRTJoUTJGaldRcG5CZUFPc0tjS1IwMDgxUC9xY0hvaEVib0dXRlFIelUx?=
 =?utf-8?B?QnNyOW1tc1dBV0kvZjM2S1JMYTlZeHlEK0dPYjNmaUpQZkhLc1AvSnY4bkta?=
 =?utf-8?B?dnNTdkFxY0IyendhWEhOT3B5WGpxL3dZRWVnd1JJSUE5UDNXd09wUlNFUGd6?=
 =?utf-8?B?ZDhwTTAzRzN6Z2NpNEwraHhyc1krY3JWNGI5OWpxUWcvanQvTVdLVnAyNFJX?=
 =?utf-8?B?YkZDMWVtRlVGbXFxU3hEbG1hWHhFRUxsNXEvaHpvcC9pZ2owL1VBWlZHNDda?=
 =?utf-8?B?VHJ2V21oeXUveTZOdnhmTmxIZ042SmkrUGRBTUlaR1NyN3QybVJLdWRwWmtO?=
 =?utf-8?B?SVUvclFwZUJUcHhocDFZams4K1I5RHFIbTFJbllQWVZGQXVkc25JRUM5QWU2?=
 =?utf-8?B?cDBzblhwcWJEKzRkOTgrenV2MnZLMlVxeEkyRmVkcUxxOHVJVHcvbzBtZUx6?=
 =?utf-8?B?eEpBRS9VNlpLVFhyQXdabmhrOFpWay9qKzYyVzZiRVNVTkw1L2VYQXdsOXJ0?=
 =?utf-8?B?N0NGV1RZaGJaM2VoVkl5aDVScFlwYXpWdUJYVnBoN3J1bHJqZEpmd2RSSDZi?=
 =?utf-8?B?d0ZKQy9NT2NubXE0czNKbDdxZXlXTmczbzhMSi96aTRUUzhlZVZpUnZkR2tK?=
 =?utf-8?B?M2RTdk51cHFYa3g4bzVCaDhOTDN0STNYSGJobnV2ZnlmL1BhaEZDYWxpbnhX?=
 =?utf-8?B?WGRQQnN0WCtXV1JCWmFGQVVNbUY2NkNtdU5TNkh6N0R4QkRmaFpla3cxQzdx?=
 =?utf-8?B?M2YxOEFGcExRRWpBQ0xJdTdiU1RMWjNFRDZNejVlM1JNbGFCVnArWW9oUjBr?=
 =?utf-8?B?Z0Y2NWYyTFVUV1lJS054VzRQV3RPcnhFNng3ZHh6VksyYmF0aVg4Qzl2U3ZC?=
 =?utf-8?B?NUZqRXliTm9kRUxEajJXbkZWZFlxQnB0TkRtM1RhT1F0cmN6MlVVaTVESnU2?=
 =?utf-8?B?Rk5STHlPek9WTk9STnZtT1RVakpWa2h3eC9FQSt3dE1nWjlIUlpFNmRSSC9a?=
 =?utf-8?B?MVVCSGs5VUFNcTZiVEMxUEFWVU13Z3BHRDhQMFJBeTJXUXRyM3dXQVBUcXB0?=
 =?utf-8?B?S0E4R2pRNy9NSC85UEFNaGx0bytYWFoxT0RycUpROVNvSGl1VW5iMk1qRDA5?=
 =?utf-8?B?aTd5QlFxblViWHphd1AwMUJwalhKT2V2eFcyd0RxR3dvL3FOOHhCbnRLczBY?=
 =?utf-8?B?aWFNcnAwNVQ1T2xubVpiQ1FCQW1uR1BxQk4yMkkxRUJLTjU0Nkg3cVdBVUxW?=
 =?utf-8?B?K3ZCa3pWMGJWUmVPMG5IbUlaTWtaa3owbnRoeEdIRGhXb3Q2SUt3WHhoZmVk?=
 =?utf-8?B?TVAwdzFWelJYaGZWaElZVGtnbzZETFZrWDBYbUN4YnFyOTBDbkhrZ0crNWRo?=
 =?utf-8?B?REdZVHJYdVc5QTV0OVl3cjZRWkxPSHlnWmhFanRZbUE2Z2grZGo1aUdLbzFB?=
 =?utf-8?B?QWxwc3poQ0NSanl1QnZ6SGhvdFVQY25oZEpPdm1kNFdtL1MzbXdxYjZpaFNa?=
 =?utf-8?B?ZnlQaUFzVXBXV0NpL3FBTitFNVRSYXoza29kaEJmSkRRREJ0YUNXS2hvVXJR?=
 =?utf-8?B?dVR1WTBKRHlTT2NMRUtIdEdLajNMaXFxbVVCS01KQkRxaWZ1RjZGckJlTU91?=
 =?utf-8?B?QUpLZDRlNzA4STFDT3ptVmRiTkllN2hKK1hDY2tYTWV0c2QvM3duV3N3Vnk4?=
 =?utf-8?B?cTAyQWFrcVlkaDZ6SXFpVGZubjIxdkJ6elBIMU5neTh6RzJZT2VHckFUc3Iw?=
 =?utf-8?B?cGMyT0ZZL3h0eUxQMm9CN25RaVlJRFU3aWpkSThWZHl5cXZmRzNRRWljQVBa?=
 =?utf-8?B?ai9VcjhiQzFJVUc0d0ZXbFJHUDhFcTJibzhiOVNzZXdMTzVuWXBxN1pwdUtX?=
 =?utf-8?B?MHBRenBvRTVEdVRiZ0Rjd0UzT292dVF3d0I1MDUwN3VyaTIvUWVOODdpSndH?=
 =?utf-8?B?N0JsekJEVU1UbHc3d1BhRE1idnU0cDBJS1hYZk0xcmhJclR4emZHTUswRkZ1?=
 =?utf-8?B?OW1id3VIV2hRZmxvUGpmaGh1R2xER2dnQTRZZU9FdzRwRDM3MHNraklxNXFP?=
 =?utf-8?B?U1R3TzVYSEJ6aDZvTGxnQ0RRRkFJUDNIRjVoeW1saDcxaXhRQWdTREtpWWdG?=
 =?utf-8?B?Smo1TXdMT0tmam5ZSjdVZjFuMU16NXlVOE9HSkgrTGQ3alg2QWtuQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c17849-82bc-43ce-2574-08df3e734db7
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 15:08:25.6683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iDJb1s1zpRlH380yno5RGqNhU5AVKAMZLRlQfZmok3J4Pb2gi6aP1BBLzOuM12WIrNba67bdtAXG5x4p66cEMxp7ddwQVB5mvo7Ac9qyvWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT6PR03MB251506
X-purgate-ID: tlsNG-4011c0/1794236909-4BED2CFC-0007A3FD/0/0
X-purgate-type: clean
X-purgate-size: 388
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05/11/2026 1:33 am, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
>
> Introduce performance counters for AVIC.
>
> Enable statistics reporing via new 'dump_posted_intr' mechanism.
>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Xen has CONFIG_PERF_COUNTERS already.

Please see about using those, rather than inventing an ad-hoc mechanism.

~Andrew

