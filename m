Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4C7606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 11:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=N6irpwB7
Received: from list by lists.xenproject.org with outflank-mailman.1494366.1693980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTeHK-0000gp-9o; Wed, 18 Nov 2026 11:56:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494366.1693980; Wed, 18 Nov 2026 11:56:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTeHK-0000gi-6Q; Wed, 18 Nov 2026 11:56:42 +0000
Received: by outflank-mailman (input) for mailman id 1494366;
 Wed, 18 Nov 2026 11:56:41 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xTeHI-0000gH-SN
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 11:56:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTeHI-0014wY-8T
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 12:56:40 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6afd9275-8faa-0a2a0a5109dd-0a2a4502caa0-12
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 12:56:40 +0100
Received: from [40.93.196.55]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6afd9276-4900-0a2a45020019-285dc437e6cb-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 12:56:39 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by PH0PR03MB989481.namprd03.prod.outlook.com (2603:10b6:510:114::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 11:56:37 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 11:56:37 +0000
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
 b=S2kaoBi57dpGVExu5kQAdqBSSrY3VTxvcWGwzpS5KOxY1ZQUyY6swjYNUtZ4tILyFQw53qEwzo8k1N6vgSGkDaLrNxc8KZKvrsYPBJ/PjZhkyoSJ2S76c+yVfu8kc8TIpfgWV4tIgVrbvQCtAUmkTf5DAZOw+yI5EtW0tl1JpKegg8ZmssQekm2EC7UdEoj6kYZm5dcA8eb9vDXUTkn9Yda5V9Ufp0ZIqHMgZURwuOIS24SZjgLgNF1gn3CsMi2WvA5g3VbXe//XiT+u6vKUktf7WSZATs/b3HDdgshSsscbiYV4+nymbrWb1ldQEi/C0DXXh6cS73SGWtgLmgy4gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADPG7ChlkpL0JVHpf5FBFe3m++Rkt8bWY2RbzHUvrRQ=;
 b=zEzFMNhX+QGWCwRE70eR0Cg5TSKd4ndW2u/KCm9WTZpSLaQQ8jYcqw47IlkZXBb3PT9TfzZHNZoroPf76WllAhVUg3o6/gYT6alsfenbiAgcy9hZfxK5PwOi/Zq+9CwauPPkgGd9mYPgKsy41VmKgc2zFXknbhSTxqWU0U/axxHv1hGvC2C+Ey+YdkP2D/43ZwlPAehOs2piPQx4JIzL2d+hqzhLMSZHzzo/OThHNy2ZrzAZOlIfKCv4EJ3XSmPSxghardNosdBEMIS89maQe4EjYA6M8lkxOECSNYdBBQzt+sS7yRtRMUfw1raHT9ya7pqPsBdxTZaGtTOrwJ3Wow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADPG7ChlkpL0JVHpf5FBFe3m++Rkt8bWY2RbzHUvrRQ=;
 b=N6irpwB7pjBec086QLykjCTAwh0CC9tqxq6VNf9bdZs4LKt4nYdBdYKvVHQFGf/xH1gfnoLo2kOfra6CtSS1sZbV6v6Cyn9w8AKm2UvVIH5CLdJG+2aptP4z39x6jffSfIHNAFXKs9iPNWptUq3PNJSRreyBaR3F4o4ov+Q/loE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ba78b29a-d339-4514-a940-fee2887e2ba5@citrix.com>
Date: Wed, 18 Nov 2026 11:56:33 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/build-id: Drop xen_build_id_check()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20261117202244.4054656-1-andrew.cooper3@citrix.com>
 <20261117202244.4054656-3-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Ross Lagerwall <ross.lagerwall@citrix.com>
In-Reply-To: <20261117202244.4054656-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0352.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::15) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|PH0PR03MB989481:EE_
X-MS-Office365-Filtering-Correlation-Id: bfac4854-b36b-4d29-9134-08df456afff8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|261022105027099003|261021121427099003|4143699003|11063799006|10067099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	P3pnSKCJZHOXD9PgOnMDod1kCTuAw4kQoG0Piln+jcsVOO6xDYdDPREYgZjZFN/xZeVd188QGVk1kVSv3PMGfigsKiPDJzIAgbKIxjIuBBRcjILn4hlW7zMLIISP838bUIUUf12rM6vLt2pz5WQj2f3WAQQZ/FGIli6Lc6dPqEF5UfOAUAkbfIJZgQCwPkJ9CELHA/qRqV2st0d2ntLiVAkru6N9ZJajE/WgdkN/3c5YIfsh5LUuGp/MWAyc+bOw0kNv1OIohiaNZJJ4sNk3rlbDq+LSRfznv9jpN9SkDGE6GwwpqT8VtYEg9EQn1Xj3mk+ETdw3C8x8/RebU3dvMXilST2en53P0RTrQH3gnk6ar7QzIgFOUbhhyDd3ltyjPcibF2HTFfAEERMcM0jYsOIOrhndbBV/nfCxf6FsAbOQJR1bXjhDNGHpQmPR3K94zW+DfvLxOU/C19OjOwnTY/WX+vbwd2wGMATjo0eIY88hXimVoGj+ieGQaDyBBkeUgZsqzLy7AGxtZ5bT4MGdJRc5WsqlKxfb0KYKbmiPvBmrwcNQcp3CKjfqw7/HeEDkHmYBVG81jQT/jLlxrj8GRQrd9Ch0KDw2JYVBFqKsOQjCwRVpKFt9cg6ZZUBiBCrAQLhrTT2QGXzGB5IN91F/IQ4Ec81ZsHs38v0fD9+XdVA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(261022105027099003)(261021121427099003)(4143699003)(11063799006)(10067099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkdDdGlFdWJhdlQ1K2g4SVMzczhrdEllQ2F0eTRyZ1ZuYVJmS2VWaGdHVTF5?=
 =?utf-8?B?QURINWpZQmhFMzliOEo0aG9jT09TdHFTbG5wVnVTTS8xR1RjQW51dGNXZHhZ?=
 =?utf-8?B?aFlzR0ozZFQ1QWQ5MGg4NkR1RjhTRkxubGxZVHF5ZHdud0QzMldMOGdYWEtY?=
 =?utf-8?B?S3JwYStuMmRDYWgvbXYySDlBWTJldmxXS3NnRDhJNHVKQW1GaU91dnU4eElw?=
 =?utf-8?B?TlBZUTAvdzhURjI3T3lRQTFBVHlETllYdmhtcDNLZ0hiZ1IrRWxobnA2UnJ4?=
 =?utf-8?B?OXl2MlJET0tDNmhaeGxZYjhFNTNub0ZITXFCV2dJLytERFI4OFRWQ1o4RDl0?=
 =?utf-8?B?TDNMaTZFT0xaWGpUL1MrWjREY0lBUk9qVXBiSTlXaUhnaFFWd2YwRW9pbHB4?=
 =?utf-8?B?bmprT1BoOFRvek9CYm45RHg2Q2VYQ3YxdjZ3Q1kzTitOcGt3L1daalhnQ3BU?=
 =?utf-8?B?eFFJUXRUVWJSZnRwRDVaU3I3YWp1OG5VVi8wOGlRYzRWQmg2cXNSR3JPc1hp?=
 =?utf-8?B?U1JWTUYyNjNQUkI1bzJXbDNmRFJuVEJjeHZ2ZnlaVXYvTTBhQkZIbHJJelcz?=
 =?utf-8?B?RjJvdmROMUlmR1kyNG1yRzd5c1VRc1lMTXp3cDkrazFHNzhzZ0E4YmgwbmNo?=
 =?utf-8?B?MlJwallHOVRFQ09Kb2E5VlhqekFXL2RjekJNWndNOEJBcnN6bDVtbDB3emFm?=
 =?utf-8?B?MEpZaWFZT1BCc0VraVE1QTVLZVFPUEVSVWxnSnpDTmN6Z0x4RCtaR2Rzem5F?=
 =?utf-8?B?Q09wWXQzd0RnVVU5WFh6alJGQThITy9idlZFWmhxQlUwK3FUblBiZzRiaEtJ?=
 =?utf-8?B?OXZVV3JTeFBCQlF0eU9jOE5HUTBrVGpQTkJYRytJc2Q4eUt0UmJoS0UwZE9S?=
 =?utf-8?B?bk5OM2s2ay9PZTA0RDBkL3hDNmFWa1dPcllvcUpqdEZma1lySjdsZEhPbGp2?=
 =?utf-8?B?NktzcElMNm4xbGVaK1dhZEpZQWpBKzVqRFpHcjJYeHpHV0tPNGRadW5JWDdL?=
 =?utf-8?B?b3dOSkVyMExJRDhMMlNucmlNZDMweU9sK05mYjNuZTV5RU4xSTUwbWhXVWdo?=
 =?utf-8?B?QWVhcGdtMjRodzBnSUViak82akJNdmxhQkp6ZXg2NXZJdUIydVd0MW9KbzQ5?=
 =?utf-8?B?MnJRYitpdExMTGc2OGFnOCtoYzVsYTNPeFNzdFJNRnBaWVVmeGduY1hWWFQx?=
 =?utf-8?B?ZndxUGlaRW93NjFtT0FkYWFSMjNGYkJNZE8wYzNFb2NJbWUzajZCRXJWYWtF?=
 =?utf-8?B?cGlnWDZjUUVCUjNUaWdPN1FjSnIrZVdnZFdwekhVK3M4WTZnYit4aWREVm01?=
 =?utf-8?B?d21BOFdMWEVVTHV4Z0tGSVRudlBBc3Z4VXNVdU9SNFAydGdJaW1KU3hQY0xm?=
 =?utf-8?B?VGQ1bE5HNGsvQXR6QS90TFByRWMrNnRsT0hUZmZlWnRJYm9PblNNQkEzV0tS?=
 =?utf-8?B?WjF5Z2FoVkZiWWlaQXNPcjRTYmpROFd2c2IreWxDNnVEaHBJSjhpazd0dlU1?=
 =?utf-8?B?ckUrMXd1bXZKMUZHZXAweDhTNlltWTdaV1hROWRKTjh0V3JrZXRBaDJTT3pz?=
 =?utf-8?B?RExDcm1hS296bitmMGhXMEhIZERLajlHYnEvcitzSUkxamNEOGlRUXlGSjVN?=
 =?utf-8?B?VmtyV0liK1A5dy9NNCswOGJuTkFLVkVvR3BlcE9qeVZ0dnFySE0yMk1YNHZ1?=
 =?utf-8?B?b1Frby9BWmV5Wm13MmhMMzc5NUhyakN5MWtaMWtWTFdBcnc1VEZ4bVhOdWZy?=
 =?utf-8?B?M0UvZWl6TUIzMWV4cGJwbjlLWFl4K05uQjQyN215TnVBbExiRDc3M3dLMGZw?=
 =?utf-8?B?RkRpOU81SU51S2N2TGg3QWltQkREc2k3MmJLVURTaG5mWVpwNDRSbDBNQ2Ju?=
 =?utf-8?B?bmw4UUxFaVFWYVMyZm9ScmJKcGpTcDVWWjdKalNKOVU2eUUzRUZ1OURDZlFj?=
 =?utf-8?B?SUM1MVN0NTJNYmp6V1RQa25UcnpEUkN5aTlUMTZuY0xyb1JuSm45ditGWEJn?=
 =?utf-8?B?Yy9KVW9td0FUc1FjZW5YeWlSajZaY0U5eTRScjlGakRuZ1ZDNExaM2RSV3hI?=
 =?utf-8?B?cllZTG5odTZMc3ZCd2RxOTExbEF0dlMvWlZTajZKOCtvL3ByUnNJSy9ndkpr?=
 =?utf-8?B?N2ZvWTh3cHBCMnE0ZUc1bGd0Q0RhSGlqcUlEZnJoNDkvWnRRUmVsRGdnbWVk?=
 =?utf-8?B?b0VCT2RsdDJXS2k4VHhtbWJiNGdxZDBGakNiZEpiek94M0kxdmFaQk1vM1ZF?=
 =?utf-8?B?OG92ZC9WWWdSK0FsUDBGOTVyeE9IazhqOW1NWitnSXVPdHVtREd4cS9Sc202?=
 =?utf-8?B?ckdBRG12NE00VndGbi9BMkhpQ282RlJFMTZuTmJMeml6ZVQxWVFkZ29TY0Zr?=
 =?utf-8?Q?Ec3iJJQBmni6muuA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfac4854-b36b-4d29-9134-08df456afff8
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 11:56:37.3897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aIH7zQjZTZLfjADBlytRAVSJE3jorvwtoTmb12KEaevQDiiOFbOvflDYZ7apcN3eOK3K/Eg61wJGL7MTHleoRj3n4jhSqr9RWz92i8ExC1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB989481
X-purgate-ID: tlsNG-720697/1795003000-3359C6C6-C4E0CC2F/0/0
X-purgate-type: clean
X-purgate-size: 713
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/17/26 8:22 PM, Andrew Cooper wrote:
> The function is misnamed; it really is looking for a GNU Build ID note, not a
> Xen note as the name suggests.
> 
> It also has an awkward API to use.  For a GNU Build ID, the content is always
> at +16 from the start, so really doesn't need to be returned by pointer, nor
> is it necessary be doing additional checks on the returned pointers being
> valid.
> 
> Switching to is_gnu_build_id() allows xen_build_init() to be simplified,
> returning after the first successful find rather than passing an rc down the
> function to skip later checks.
> 
> No functional change.
> 

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Thanks,
Ross

