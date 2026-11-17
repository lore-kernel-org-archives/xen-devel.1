Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0DB606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 21:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=Yt0me6Jw
Received: from list by lists.xenproject.org with outflank-mailman.1493246.1693336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTQoK-0003tc-0q; Tue, 17 Nov 2026 21:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493246.1693336; Tue, 17 Nov 2026 21:33:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTQoJ-0003tV-Ty; Tue, 17 Nov 2026 21:33:51 +0000
Received: by outflank-mailman (input) for mailman id 1493246;
 Tue, 17 Nov 2026 21:33:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xTQoI-0003tN-S1
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 21:33:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTQoI-00CCy9-8E
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 22:33:50 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afcc83d-8faa-0a2a0a5109dd-0a2a450bcd4e-2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 22:33:50 +0100
Received: from [40.93.194.17]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6afcc83c-b7e8-0a2a450b0019-285dc211dd21-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 22:33:50 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN8PR03MB5012.namprd03.prod.outlook.com (2603:10b6:408:dd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 21:33:46 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 21:33:46 +0000
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
 b=sjuBcpTk1WCM7T5seWzDq+6NTz92bmnuDMTMDvrvLwRGhE6AOgEnMrGirlgda4WaWtc7KBNaW3RaGop++MKHr6m04h+cZvvcAKAy2hVABWI86Z6CIUB/g6MJCf/N4VUvy24uLGZpaTMmwgIUOyi/BA6EKbesnts0Pov5/qvuMpi9nNzQY2QtVbxOoXyitVQPIQ1rWPmWXyelmlmBJG9oci232+jQLnH30qslYEnPWfBN7IyoOGP8b0A6XLoB20o1GXEXZt3z0TAJwv0BPiCyXrNt/FFIg9UEnpA6/3rDSRPwdiAGgwkTXwaf08DvMyijbmMLCH8kiIeOC3VthgOsLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hxac6VCxWRPyHSpfVyfkx+JZW1yPapP4FV+Nsp2xFHY=;
 b=k3hmjBF8N6He9w3aVVB2Ac8YDvtREhxOQIb8IuXBGW3mx85B6SBCzTzrn0//GrjXAUh8xFCqM/9RF3Y4bfBmGNSP1xEy/s+jCdEGLNZVhissLgSdorF+wAKL7Fz9JZEQ9hmxhlWxt5flRr0HteXG085SCGcnNuhZp3yXhxsnDmmw0vr84W5kU6aGWGefrnLn7hMSnkj6D9J/jQlVHRESkh72nZBEeFxrX3Peaj6DtBq8JpPIrJUrMt1aPiMzR5vFYM3R1iHAXxbQKXLtl4+I/ic0uGUIddtHRNdNcnqrhuWwyH12qONiTavOI0fWWdAa4/LAwvttxW3KdYzISzFqBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hxac6VCxWRPyHSpfVyfkx+JZW1yPapP4FV+Nsp2xFHY=;
 b=Yt0me6JwVPzHbFafBSyGAVKl6qUIz4Ulex6HPOPzyy2mjLNGVKc+w0VhL8QZVx247wF8uso0eC/TFH3jCXRsERmYJ4paTq/A5Dn1EgZlCE7ZrliEB6GcNlP1+wCfH+0u7ID8utlc8F8zcZue6ioq1/0PoltQs9o1gEXffHr26os=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a6fb5fd1-4ae1-43cd-9be6-3ad367672b72@citrix.com>
Date: Tue, 17 Nov 2026 21:33:42 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.com>,
 Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH] PCI: deviate MISRA R11.8 for the one-time SBDF
 initialization
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ed06386df3f5ae485a409e8c0bed10b01d7fd33d.1794948091.git.dmytro_prokopchuk1@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ed06386df3f5ae485a409e8c0bed10b01d7fd33d.1794948091.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0240.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::11) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN8PR03MB5012:EE_
X-MS-Office365-Filtering-Correlation-Id: 483f2fc1-7626-4af1-648c-08df44f27631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|6133799003|18002099003|260925022911599003|260925021911599003|260925021311599003|261009223027099003|22082099003|261021123027099003|261022105027099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|5023799004|261021121427099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	p2klLhVeULyZ5B3J3zjfVGBYC9iVRHuR9F3yEzU/R5/IUA+aTYWv00jhz6QNPu8Yg9waJxLwmjDcl0EajvOv02Q4Ga16lU7larJt8FYIQENv7VgOaSnM1Nv5C/wo/jkzdPze2Ila6ErEKwwD+v9XbomXZOQU99l2FuGCzuEGtcYOYmA/O9ITkAhqJOSHQT08TwuBl9+vr34NuY4LBrVGB0D+GB4wf5cTifP3ppqhtK9zbi9wID67Lyn7UYOhrxiuIQuruIgwUbNcxYwtvKKJV+P/EeqaxugIm9VP3nPeT0h5IZgF5E8vmR/p30qvYXpjQ7/KsifUT/0qs2hymHOdsPRQAMkKcgktadpJ2AaNeJJ+ZNcJilmJUFrBqwaZYFUKOTqaMvVE6he62kAv5aLdJbqF7c436Z0A1f5ILTzOjJhwVE38hJXNJ6yimMmIJy3Ic97gxwSRGH1bEwm210/i1AkBULRjjIQh9STzwG4ZL3m62XoO2AHFaW70pzC8IwDsdkOLLYo1sq4vHcJvhyttCD5ffQr2iC9qGnpFBBGKEEbPyAC2DSL375zzkta/y54ij7/+2fwVl8FeX8dx42KKl0LbF7bSNRcNF9y54GydZKQ+S+bb1qMfML28RO8YwVuwFqElMFJm6iJ3GDUwlW/fFtkf0FLe9VeSEqHY27ssVDo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(6133799003)(18002099003)(260925022911599003)(260925021911599003)(260925021311599003)(261009223027099003)(22082099003)(261021123027099003)(261022105027099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(5023799004)(261021121427099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzVkaVJMZ1ZEdjRyRnM3Y3NkTWNVZU1rUFAvVDRYT1kvaVdzanJISXYwVEFv?=
 =?utf-8?B?WEdxNGsrU2VFeGY2b2M2QVpxQnRYUG13ckttMThTLzllWW5HQ0xNU29nMUdz?=
 =?utf-8?B?RnpsUlpHZnV0UVNrL3Q5ZEk1RkdnaHFsSEYxOEtjejZaYXUvUTVvbFBiaCtU?=
 =?utf-8?B?VDFnMk1xb1FRMzBpc0pxT0RTcjl1MlVrSy9CeTk5TWlTcTRUbnQ0OEFoVHJt?=
 =?utf-8?B?WlBEWVRsL3NKdDQveFpoRDhDcjFKN1ZNNWJmWWV1Zm1vUU9QaUNyMUh6TmtC?=
 =?utf-8?B?Z2QrUXE5T2Y0VURnamNCZTdjU3ZRUkZjVzFKZ3BOZXdJbXFtUW15MHpkbktI?=
 =?utf-8?B?MlhuZFNzR01jT0syUWJtS1JWMFFNbXM1M2lCNGVuSTMvNFpiSnVQSnRoV1E1?=
 =?utf-8?B?QS9NMUhyWWJpTmxxZGJueW1YelUxbERvOThkUGNvU0cxRjhWNTF1bXRkVDF2?=
 =?utf-8?B?NWtLdmFFZ09ydmpKbE85TFphTC95YzJYRklMNFZiQVIwbmpqcGNkL0lja1Vs?=
 =?utf-8?B?NUQvOXduQ3ZZVU5jdTZkVUprUFROMGJaMVVlQmNCL21FUytwOTc4Z1VCY2pV?=
 =?utf-8?B?MUlDejVqV05hb2thV1ZIY3VlUVVKYlJiN1BTOU5WQy9nNGQ5WnRQZkFFcFlZ?=
 =?utf-8?B?b1l1dXUyUzZkVTB3ZHhsSVdxbVFCc0JHR3oyRDVHdkFaRFBkcEl2U2xHak1a?=
 =?utf-8?B?YnpIWEJ2RzRRSnlLT3ZhTFY2ckp0TkdNVFBrOTRXOWVzTVA2WWJpc2Q5QXd4?=
 =?utf-8?B?dVJNbVQzNzlFQmE3aTFmeHlLbUVNZHdjS3FnbXBnYndVT0RLeGVyS256Zlhp?=
 =?utf-8?B?bkxCeXFXc3lQandTb0RPRFdMdWtHN1dWbGNQSEhsUzQ5bzUrRDZHck1GeVJ4?=
 =?utf-8?B?WFZ5NTNEYkFmVTV1UzJaalp6YVpqTDBsYWhEYkl2Ui9tWWJYaThFWXE5eDdB?=
 =?utf-8?B?c1l1WnY1TTJ2a3NGMXBhbitZOHdPVksra1FKR1FEbEtKT0RpMVBvRkdSMnVP?=
 =?utf-8?B?c2E0UUFzZU1kRWpuV1orYzl6OXpCeWtGU043ZTNhYytkU1M5SlF4S1c5YTI0?=
 =?utf-8?B?cThLNUdDaDB1bHJvWFFnQUVNZVQ4bGppNjVKQUNQWm5Vcm1nUUZlMlJWQmpP?=
 =?utf-8?B?RUJnZlpLbEtGaWdTVUJPVTEzT1VtNUdwbjExWDJHc1k0K1J3Vit5QlZyQWlP?=
 =?utf-8?B?WHhxcEtDNDVoMGdxMVd4U01nWURmZHdJaE5SV3RWKzhkeVN4VUI0bVFwWWUy?=
 =?utf-8?B?L2lUS2xLWXBNbUdHbk90WGx4Q04zTGlBTytqMVBsd2VtdmZTZ0J1Y0dONDRa?=
 =?utf-8?B?eTc3ckFGL1lNcGtQbE9sM3dvdUlWaWtXNFVqNGM5eSt3SmkyREVHMG9EcmJr?=
 =?utf-8?B?L05tT0lYZVkyNVpJTjhxaHYyU0VJc0Y2VmU1bEpYSm1aK2FKRXplSDA4WmlL?=
 =?utf-8?B?RWtFZFkvbjk2Z1E3Rzl0Rm1zNWJYYTB4UlpDbXpPTGZWUXpGU1k4RXJBNENG?=
 =?utf-8?B?Vjh1dlY0YjlXdlpkOWZ1ajkwZEVoc3RJY1g4TzRnUEp1cEVldDZVK0Q5aXA0?=
 =?utf-8?B?eEpkSmR2bGhIYU0ybjhzdDZqMmxObU9UTFI2dEg4N0xZUWJjUm45VGYxOEda?=
 =?utf-8?B?b0ZrdmFEQ015d2lSa1VpUUkvcEVGMmpJbk5wL08wMGZHOHdCT0VlZkR6S1o5?=
 =?utf-8?B?cGVocEV2Tnlrc1NMUjBsQkJuZnMvWnRoYWtjOUx0MXBMWWtzclZOWFozM3k4?=
 =?utf-8?B?R0YyTTZBaVR5dVljNmZWNjVOUGpwd28zNENJMkN3cHlsL1cvdjZBaGZsTFhD?=
 =?utf-8?B?bm14SVUvOUUySTk3clV2aDhpKzlHZzEzVXkwdC8vdGdtbWdQNFFIRXVwRVFL?=
 =?utf-8?B?Q1VVMFpmZmcyWnpYSDM2Z1haM2xXWlNoV2JsK3M1SmJCZUQxdW8wMmhoYUJ0?=
 =?utf-8?B?OFg3RC9ReHVGTlc4Y1FtMXcxODE3V0hYODM2QlBQbjVrZ21aMEFNVzREUmdX?=
 =?utf-8?B?SUVPZkwrT3FqNkQzT3l5aWxRWktCNjRFT3NiWHYwNnIrbnQrSk5IWkFnMVQv?=
 =?utf-8?B?Vm43VDVER0szZGl4QnJhaTFTaHRYNzIreEl2cW14VG1YaC9TcWZKeHU2MHlW?=
 =?utf-8?B?cW94WGxVblpRdjcycGlnMTNjVlFaaWZ5M2x5NU13dnkvZ2JHSnlUT3lmbUlW?=
 =?utf-8?B?ZGdMWUFjaUV1Y251ajh4OW02UmpGL0x6OWtFU0Rrck5NK2NBcGV6YndlQzlI?=
 =?utf-8?B?WXMzcTFRbnRkZzBWYWVmSTUxcVZlMEVFOGdSVU9FemNHaHAzcW9jbjhtY1Vn?=
 =?utf-8?B?dE14bVlrRmkwSmNZWmxzNlhHYld2cXdNNFdNWEt5VThFSG5HN1Z1dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 483f2fc1-7626-4af1-648c-08df44f27631
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 21:33:46.6340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7DjXczJMtmQRUw+QZ3zJdaa/NdenBiT9FLOzi9tTjCMLdmHDjtJmxUQBxW+8iXRJ52bTwcCmqo6Fci1Kt3fo7JzdWDhjMM3arosl2dQzPJs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5012
X-purgate-ID: tlsNG-42698a/1794951230-1BED69EA-2DD8A94C/0/0
X-purgate-type: clean
X-purgate-size: 3395
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 17/11/2026 8:55 pm, Dmytro Prokopchuk1 wrote:
> MISRA C Rule 11.8 states: "A cast shall not remove any const or volatile
> qualification from the type pointed to by a pointer".
>
> alloc_pdev() writes the device identity once. seg, bus and devfn are
> members of a const union, so that write goes through a cast that removes
> const. Three such casts performed the same initialization.
>
> Store the whole sbdf in one assignment and document that cast with
> one-line SAF-15-safe comment.
>
> No functional changes.
>
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> Test CI pipeline:
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/3081067362
> ---
>  docs/misra/safe.json          | 8 ++++++++
>  xen/drivers/passthrough/pci.c | 5 ++---
>  2 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/docs/misra/safe.json b/docs/misra/safe.json
> index 3584cb90c6..3503d2e808 100644
> --- a/docs/misra/safe.json
> +++ b/docs/misra/safe.json
> @@ -124,6 +124,14 @@
>          },
>          {
>              "id": "SAF-15-safe",
> +            "analyser": {
> +                "eclair": "MC3A2.R11.8"
> +            },
> +            "name": "Rule 11.8: one-time init of a const PCI identity",
> +            "text": "The cast removes const only to initialize the const pci_dev identity fields (seg, bus, devfn). The const qualification prevents any later assignment, and this is the only write, performed before the device is published on alldevs_list."
> +        },
> +        {
> +            "id": "SAF-16-safe",
>              "analyser": {},
>              "name": "Sentinel",
>              "text": "Next ID to be used"
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 578472d068..14d59b1293 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -329,9 +329,8 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>      if ( !pdev )
>          return NULL;
>  
> -    *(u16*) &pdev->seg = pseg->nr;
> -    *((u8*) &pdev->bus) = bus;
> -    *((u8*) &pdev->devfn) = devfn;
> +    /* SAF-15-safe R11.8 one-time init of the const PCI identity */
> +    *(pci_sbdf_t *)&pdev->sbdf = PCI_SBDF(pseg->nr, bus, devfn);
>      pdev->domain = NULL;
>  
>      INIT_LIST_HEAD(&pdev->vf_list);

I'm sorry you're in the middle of a fight between the maintainers, but
this too is absurd.

There is nothing about pdev->sbdf worthy of an exception like this.  We
have loads of other structures with identifiers that **if and only if we
were writing C++** would be const members.  From a practical standpoint
d->domain_id or v->vcpu_id would be far more worthy than pdev->sbdf of
special casing in this way.

But, Xen is written in C.

I accept that this isn't creating a class of undefined behaviour, but
it's bogus-looking code try to try and use a C++-ism.  In the modern
world of AI's, we're at much greater risk of an LLM seeing this and
deciding it's an acceptable code pattern in Xen.


Please just delete the const and make a plain SBDF assignment to drop
the current casts.

If I need to call a formal governance vote to put an end to the
maintainer infighting, I will.  It has gone on far too long, and is
continuing to waste time we simply don't have.

~Andrew

