Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F11606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 21:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=OAjBFEpF
Received: from list by lists.xenproject.org with outflank-mailman.1504094.1699645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWgeO-0000FQ-PZ; Thu, 26 Nov 2026 21:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1504094.1699645; Thu, 26 Nov 2026 21:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWgeO-0000FJ-Ld; Thu, 26 Nov 2026 21:05:04 +0000
Received: by outflank-mailman (input) for mailman id 1504094;
 Thu, 26 Nov 2026 21:05:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xWgeN-0000F0-Cm
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 21:05:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWgeM-009Dyv-Hq
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 22:05:02 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b089ee6-bab6-0a2a0a5309dd-0a2a4508c640-32
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 22:05:02 +0100
Received: from [52.101.53.43]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b089efd-f659-0a2a45080019-3465352bb56a-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 22:05:02 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LVXPR03MB989180.namprd03.prod.outlook.com (2603:10b6:408:37f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 21:04:59 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 21:04:59 +0000
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
 b=RXeVL8JZswa0+jhdQ41weDmKaIYy91vm931DoHC9PmaULqLKZ6kVlTJ5Aa3utwyl5+zozc3UN0RECTLf8g9vRSHKhKICa4Ca1i2sfeOOPg9kQxYg7WAyb7/BmJuq4eLFLYBFPkuhLS0lCGsK9VNaDQvA3ooOMW5UhBslkFqufP35RZU39G4h9jeJ8LeOYOv/dFco0T5iW5eoDpg28nRgNxQtZeveRVaiQ61Mg4gqwkzTwbWZRAva+R5hx09oKDJUvXJpeeQBoVwvIxGBsloHdoEE9jSdzjLXRAgJ97HO95oKcl5GPbbEY1ZsrJ3UfB+uQ9tWEJL3BWCi1kq8601SSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44XMFedIOXg47AIf8vnuf7X/5gfMQ5hTimVIBcruSRY=;
 b=Dfs5klHonRJigLgAbh3RgPB/WEnmIkmz4dOvekntTOoKUbTC0JvuPw1y+jRpTtfC6QuAYPUdl555YSkatlu/XQ5TAwGb12eK6bH945xiVLxh6qeRPFOmtlkiiLVttunydnECs0Zt3NtBaHOvKje2Euh0F/V4OXz5gMs6u9ehi5RFTkVJt+mR2RImnKp+zQLCrUGF496z0Y17aXfCENRV7es8LDWDOt3OMDPGcOi6/LlBrmS6MpC8+hF9YzfBhnricMtKGgYddDE20i+cxQzKE6P9A5QywcuT20Z3kmi8VxvdKuHhCIMHmf2Wt9nt5Mi3sAk2HrTs919XyIcPNEtqHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44XMFedIOXg47AIf8vnuf7X/5gfMQ5hTimVIBcruSRY=;
 b=OAjBFEpFcQBXAoHtG2VeEq7wXtcR8oNC5DoIue32OPsVzEOWwsYygPi8iWxGYhnaktJwLAfqWawyy4xY36Fgt2lrZyCRWdCzDpZLkmldcrOi9TGyNnau24QqfZwDYEt0YR9dwLNk03fPUf0ULlY0P1I9p1hykM/1srjMjHYy7LA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fd0d6623-3d62-4f8a-aa0f-733ffe5dc08c@citrix.com>
Date: Thu, 26 Nov 2026 21:04:56 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] docs/man: fix typo in xl.1
To: =?UTF-8?Q?Bala_Andegue_Fran=C3=A7ois_Lionnel?=
 <balaandeguefrancoislionnel@gmail.com>, xen-devel@lists.xenproject.org
References: <20261110045730.433737-1-balaandeguefrancoislionnel@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261110045730.433737-1-balaandeguefrancoislionnel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0651.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LVXPR03MB989180:EE_
X-MS-Office365-Filtering-Correlation-Id: dff7ead9-47dc-4207-88b3-08df4c00ee53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|11063799006|56012099006|261022105027099003|261028144727099003|261009223027099003|261009221227099003|261026140227099003|261102123227099003|261021121427099003|261022075727099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	7rChjrNMrxoP0EaFC8C32ktqqO+/1xkW2Sj8M4bN2UvbRkOqqQ3B+cpqxiL/aYAfIcXDowG/zHkBF+SgwK0U4a26jUYZ/enBQX6O9rbEu0B9czy2gVGJBus4jzcn1Eb0wDCtmzLopXk6+si2MZqayrnp2MZvd7RP++DzwIisXaomA23rZV5z+2/vyYiYnB3niCKSoKUQQ7+1bZ0AxjSWXGFgtZv3d8cHJd7rHg2YP74Dc3LbI9Fnz17BAE6gD9wpmNzRDvCiuGTspTXZxqSuzgrwsTs5AtE4POCULCuQPVH+XHBQwzHkB5Rodv5Mr5UT1l6GSgTahmP+RagaZzrM++QeP4aJhRiYYBykWSmiZvoHoR1JXx/QnXw4Dg0izEatd6V0WABoEd3Vvf58KhQBDT3VBL30pPaDNxuXsZkVUrAZjKGOmrzdlsgPhnUMGSSXC98sdh4m9GBz2wRS4YhlFnq4NlKwxp+b+F8JgFpCmlYPXoebe7sDnU5OdEyqhNIzqgZh7uLRZnC5IODiT+2YeL4+P9ZI8oik4rrFgJeoJcQmYCVY4SGDunDaklE7pynJhA3LkuMAbIOk929iOfoOO8pnfY1qlEnSRKoitoXMDXguE3Db6G5ScIMXve/rNT1aJbDZyDje+oR9bKcaTFIZOu4Ou2EED9p2rrHUI0Fq9z8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(11063799006)(56012099006)(261022105027099003)(261028144727099003)(261009223027099003)(261009221227099003)(261026140227099003)(261102123227099003)(261021121427099003)(261022075727099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SExaanNJVnBCNElSaEtnSzNNamhHdDk2aEhvWm9FaktpTlJLUG1sVXVid3gr?=
 =?utf-8?B?RE44SE5ldHBCZjlmQm1zYmVpOTRZbnBWLyt6NEhvQlJHRDNQOFBnN3RxaWZQ?=
 =?utf-8?B?NnM4cmdaZk5GM01ZVWF4cU9OWUhDcjhMMDFUVUpqcU9kWXZ5MEd1RHdCSzRS?=
 =?utf-8?B?c2s4YnZrYWNYRXY3WDNVN0lOWHlpN0x6bllOSDFYcGIyWGR3TGFIbUY4UXd0?=
 =?utf-8?B?V3FheHVVb05sNHlPWUNZMStXOHlPak4vckdJTVpnY3RXcjdab09Bc01UbTdM?=
 =?utf-8?B?N1lXZjBtUXcrcmwzVmtlakNqdENOUEd0RjFVM0J6Vm94MFFoUlo0amRpM2dU?=
 =?utf-8?B?T3VwZ3crdmRZL3JzOThPODRVcFB4clJnSnhwbW5XUVFSMERHL0RUNGFCVnpr?=
 =?utf-8?B?bUxyN1owVFRzaEw5cVdjSFdBbVJNVjQ3RDdqV3A1VmRuUHIwOW92RXJsb09a?=
 =?utf-8?B?S2t4WjlzWlZPcHdYWFNuMGJVa3R3aHFoVldIRVFjd0pWalZtL3Y0N2NObjhn?=
 =?utf-8?B?L0d2TXBxQ1dseUcxSnEvS0xmSjM2RmcrVmhHY3B6bGVkTFFiU0c3UVltUTFl?=
 =?utf-8?B?aHZGellyZW9sK2hlalhKZVF6SXY3UWsrUk80QXJES2g2cUFMd0x6T3ZkUmxC?=
 =?utf-8?B?L2ZVQ3A2WDR0eXJhbkFyWnl4Y0ZCcTdEMXJoLytNWjRCSGFpR094TU8xdUFM?=
 =?utf-8?B?Z090cVBIVFM5SitYcXZqTDYxTDI1OGtYaUEvK29pOURub1ZGbmtodHFreHRH?=
 =?utf-8?B?L09KMkxWZjRDcnAxWkErTklwU043UjJyZ1VYNWxjTzB0NnQ5alFOcjhYbmtH?=
 =?utf-8?B?TXZkb3NPeFl4QStDZ2RrOWUvdTk1ME1EeCtsb29Uc0h2RkNVcE5rbW5DUmkv?=
 =?utf-8?B?OTNuYm9xTDdVK2hYSFl0ZU5GQ2kxMUhGYUNFdWhXWmw3OUwvRXNlNWJLTkxU?=
 =?utf-8?B?TURzVGRVRnE2bW84MUpmNWlUY1Q4aFJMWklpV2RGMVJ5ZHNMSk5oSzBjSklD?=
 =?utf-8?B?bFFEbWx6Y01VeFgyNVcwQUhUN2xlb2RrejBiYVFITDVTUGdQVXdyQW4zaEUx?=
 =?utf-8?B?Z0lvV2x4dHExMEVNWURoSzY2c3plbU1CSSs0alJGbWhyMkRIeWVhbmJvUnVI?=
 =?utf-8?B?dUEvT29zdG9GcHA1bVB5SFNKUCt5UHkxRGdRckEvdDBBMFpBenl0bFZDaGQz?=
 =?utf-8?B?amp2VFgxdjMrMVFnRS9MbXJMOVd5Si9SSUpmUmpIVzFVekttNDRXVHNvd3FG?=
 =?utf-8?B?SkU1ZnAyRStOMEozSko2M0s2WHhQOHFaNEZndENMU0xhY0ZuZ0N2blpqamZG?=
 =?utf-8?B?STAwREpXZEtUc3BROTRCaDVFaDd0bnRGbVpLbXZERk1XREVRcW03MU9UR29N?=
 =?utf-8?B?bjRra3B3SWpMcTltekJzYkxaa3VReVRpRmIxN252d2ZjaHVMNEV0czd0VkU4?=
 =?utf-8?B?WCtRVmw5RmY4Wng1b25xVFFWMlY0dXovZU5iOTVSMmdmNFlnVFZuZFFuVmFM?=
 =?utf-8?B?MFdNcEZTNithQkgzYkNOVUwrdWNWYnpWL24rNEpTbWYweXpNTTRqVWVDK3Nm?=
 =?utf-8?B?Zll4VXBlWEQvODZtRS8wUFZrcWpFaW4xMkd2bkVVdXVLV3lDV1JoSmphQmx3?=
 =?utf-8?B?RytzUEFNdTRYZjRGekRSMEh5eHlEa3NQUEZmV0c0Y1o2QXorNGM2K09XY1ZV?=
 =?utf-8?B?YitsWFhsRThFai9uM2RrWjBLQ1hSRzNISlhUOVFtT3lKbGFDaXMvWEpERlFs?=
 =?utf-8?B?NERLVzhDUlR5MjhTV0hwM2NOd21NTy9oMHdLc1hVWUNYeHdUOHBJeG9lWDNX?=
 =?utf-8?B?eDFaQldNWElpejNKYkdxMlQ0cUZVeWZqMXhTV1pGbk9iNkUxUmowQzdCYXI3?=
 =?utf-8?B?YndJalViN3JnU1hiWG5VSWFycWlHcnFEdkFWSzRKbzg0VGpnTGtGV0pmRmU2?=
 =?utf-8?B?MjE0aE1WK0kvcUNQaWVuRkx2YTdrMGJobTFJZDhUTE90dnJxM3drQmlYWC9v?=
 =?utf-8?B?bTcxTGorMFptZnNGUWgvS044UDZDbnBOWWphVDRlaDQwd3p0SmJQcC9zVmdO?=
 =?utf-8?B?RW5TYVozSHErWkNJVklBMXc1RVhTbUovVENVOXRDaTA2ZHI2a1ZvQW9UUGlX?=
 =?utf-8?B?eEdGdlZDa0pRc1hlM1BLRGVVUW5ZR0JJd3NLS3pGUGFJQmEzaE1OMFRWL3Qw?=
 =?utf-8?B?bjcrUFUyTGZvbi8vU29GNmNEeVFRWGQrYWRHRjE5Vit0SGZkZmd6eTZLaVBk?=
 =?utf-8?B?U2hwclNsQ295a0hMMTJyNjNOd0YzV2hFRFROYnFkRDgwbEhscU4xVDRYNXo3?=
 =?utf-8?B?aGMzTzk2a2YzRStLamJzTFdXYWR3UWluQXJNVW9mWk5KaFR0V3hzNDgwcnFu?=
 =?utf-8?Q?6MsRwF4E4SWUPJg4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dff7ead9-47dc-4207-88b3-08df4c00ee53
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 21:04:59.2747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G6vSw+mIZCKvoG3DyswejBMnpKp4Ki6HnNkZz9uXfM7v5mt/qyu3X9RM+O/v6jwxXqec0sVCIVPPHI8nmqBMj/iv9zXLCJVgpXKo47z5zOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR03MB989180
X-purgate-ID: tlsNG-c1860d/1795727102-CDF4787B-E7165571/0/0
X-purgate-type: clean
X-purgate-size: 491
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/11/2026 4:57 am, Bala Andegue François Lionnel wrote:
> Fix the misspelling "coniguration" -> "configuration" in the
> description of the -D option of both "xl migrate" and "xl save".
>
> Found with codespell. No functional change.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Bala Andegue François Lionnel <balaandeguefrancoislionnel@gmail.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Yes, it did get lost.  I'll pick it up for my next sweep.

