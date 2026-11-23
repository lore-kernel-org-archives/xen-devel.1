Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5A7606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2026 16:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=I5avrbUD
Received: from list by lists.xenproject.org with outflank-mailman.1500498.1696641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVXK5-0000Kh-LA; Mon, 23 Nov 2026 16:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500498.1696641; Mon, 23 Nov 2026 16:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVXK5-0000KZ-Hr; Mon, 23 Nov 2026 16:55:21 +0000
Received: by outflank-mailman (input) for mailman id 1500498;
 Mon, 23 Nov 2026 16:55:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xVXK4-0000KT-N9
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 16:55:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVXK2-00DMBC-UH
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 17:55:18 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b046fea-e002-0a2a0a5209dd-0a2a450beba0-46
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 17:55:18 +0100
Received: from [52.101.53.37]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6b046ff5-b7e8-0a2a450b0019-3465352566cd-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 17:55:18 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SJ0PR03MB6567.namprd03.prod.outlook.com (2603:10b6:a03:388::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 16:53:33 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 16:53:33 +0000
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
 b=B2ANdVlUnnMggeJe4E9TKVMk/DUW05Dw4dFxEvRFnidWdRaJAugQFY1afZxAJLcCsgu6PWwziaDti8MOp1c/ISDQhZRgNkUFsZCRrWPID3gzB3JqfodrMYUIAIq0ohtwqIUDInUNU1Ajd5OkxzcFFwCZ3ZboLr7gnttIGGZ3Hs8sr5WgPjxxlpb4rwH5Y6p/bvQR4ln8m3SE0l2jKlyj+odiRABBrOfYl0Yw94vV6TfJCcMeLWnEqTIbi9/gOSr2qzTfy2CLYJaMrxCf31b06pn9Yt1kC09gs/kOUsvEhz+mZhKFrYMaQvVivlFDK3tb/IwJS3bJ1W/4dhWThgffyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jojZNWrreQPn/XaRVfbIBEClu2SahCBcGYp7Z6xzEI=;
 b=f7IGUAAjFvDSenOdhMIxCPVNCfo0wsE8jzGe7WvfYozlQKdezNAaW3zZ4nAXtJrnYFYVBrNuGB+ZZ6ldgK+pP4ITgyT3Fccvf8+vGtd2jDOdn0kULuQby58pX+ijrJiiQ+HaAsLPUSNbfouIL9krQBHd44d8vUHa2tA9vwg4geNX4sklr8hgPi5/xGaGEJvP+GgEc6e6O/CH5yAxuyw38zAtHJBvnQ1HfBa79flC10bf2cMWI1f2AyHaN+G8WD0TzaXuqGGtIkJbD2rd5ecyypTw98L5gsqOBzalfBoysfbxG6LbcUGPBlpwYruiZWB/DkV47emklc3Od8O09FziVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jojZNWrreQPn/XaRVfbIBEClu2SahCBcGYp7Z6xzEI=;
 b=I5avrbUDrlWzZd5crQrVNPFMBSRvS5UI/DmryRTiTZy421J0gmfG8n0DXyPb8VwPrHGczaRfSn4R17pW48i0Fm2lDFQR1BxJTFTofs6FHuOmZfFyyBsmqr2tahSWa3EWTKPatWt42qJkQGa4YXjEeeJKzIXVm1EbamOlYJmpZ2g=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4d301ab3-484e-4a7d-8f97-4efa90c9f6d0@citrix.com>
Date: Mon, 23 Nov 2026 16:53:29 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v2 1/3] x86/amd: Consider only Fam10h affected by erratum
 383
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261119144453.529009-1-alejandro.garciavallejo@amd.com>
 <20261119144453.529009-2-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261119144453.529009-2-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0107.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SJ0PR03MB6567:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d4c73ae-52b9-4681-ce46-08df49824f1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|11063799006|4143699003|56012099006|261026121527099003|261026140227099003|261021135927099003|261022105027099003|261022075727099003|261021123027099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zmEpjEyD5Pp30ygezHspHZYO+rEfzVh+KvRxRvCFOM9e9sW/WyKvnfD/CJaZyXmLLtvDAlBQTXwbhNbLwyRxUVoCzF0SIJUj7cQZeZxtcEuINFemJkRTcKVA099RLHhi2PYLMZWs/kNMqco4Bx3V+Vxc50WcvNMnN5TFSqVyFHf0PHRHOnzTuDi6EGcqRKimmxjzS8SHK2RyrGTtP1soMz5c1+UWUeNqpr68//NtoJm+8zr7jyB/nT4YkZDuDs2ejzrGAZv/y76FFsK9Hnsi5Mfcicv6iLZnbj+SDm8ITnCtZ/H0RG7PY68L3sH0/TrJkbyFjszloZFdXRE78C88ci0dJz1h/vvXuTZ8+a8stAfS4CMeFBJuS/Mt+3Y8giVm1gobxb1EzpScBA4bYxBXK2yUWtfEASJH2sWZRPAgUk1YqFBGn5MHp0ZK0N8OhI6RGJtBhxilk3MNtSrzWm9OY5+uF23dmO0UZUK0uYKoZy3jAhglTD5PUyt5GQp0vrUsfKoujtTqod7PHdMk3IraV4DP1ZUrZ13dEt6UgMs7my8Bn5ktkyzuFaNmCztDiSVqMfDkAAHuGPQ/MXYemVKTkjAuSR8mCtdHrlFyu+EtYnJqMJeO19T3GcvF1A4hBgboWYatqOFBfoPlmr1jecRO2vx/ChoRqRzYSMxu8Ea0qG0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(11063799006)(4143699003)(56012099006)(261026121527099003)(261026140227099003)(261021135927099003)(261022105027099003)(261022075727099003)(261021123027099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0puNFBheDRXNEpueURqN2hVbVd6T0Y0L09mcWQwWnhDRXVoRjdHa0M1L3Jy?=
 =?utf-8?B?MlJzU1lJNFEyUEhxeDAyMys5MWxoUnZLakRjSWk0TW4zZVJ2c1ZNNE9lRHE5?=
 =?utf-8?B?ZFBWdjlaT2JHWkdkSVErNmkvaGFvTVo4clJXR3ZXTzdxcTlXOWRENHRsRHdn?=
 =?utf-8?B?VytXcjM2ZlJPN3JPR1VHRGdOUUVIS1B2ZGZWQUREaUZSL2dkc3FXSlZtblRt?=
 =?utf-8?B?a2ZHQTRVSE5Da3h5d2NDNmFBMWJSTkNKVzJuRjlnVGMyZWI3L2FscVBkY1V3?=
 =?utf-8?B?cXBTREc3RVhRNnVJdWlSUE1ES2ZlL2xFaVRYYlFHUUlvaTJsVzdCanNRclo3?=
 =?utf-8?B?d3FDVnhJK0R0WXR4QjUwdi9JbGE3Vm44N09BdC9UWXBDbzdEcVk5elZiMC9V?=
 =?utf-8?B?VCsxbW1NOEFRR1dlUjJGYWNPZ0hQSndqcG5Id2paZUkxVFFUSm54YVZUVzJT?=
 =?utf-8?B?enFxTjY2VkJPMDJwZWdDa2J6dmQrcW5vVmVrWCtnai9XL1pCYUVHMUdudE1F?=
 =?utf-8?B?K1Y4YVhTbU5tQ0FwNDdGQVRCYVBmR1o1V3FDMTBlaUdvYXpPTHdJV1pYUzRz?=
 =?utf-8?B?ZEQ5RUNGWndxZ0F2MjA2L2xycDVKT1BsdmhKUldZSm1jbGdaK3ptbjJEeEZa?=
 =?utf-8?B?dXRpRFVWaWNTY1Rkb0g3bWtWcVhtMWg2NldtcHMrOTZhc280SVNBbWpuQ1RG?=
 =?utf-8?B?SDVPajFjVE1rc0psd0pVeEJCeWMvY3AwemQ4c1l1U3lGRkpvMlkwaWpKZzFo?=
 =?utf-8?B?OExzTFpyNzdtRnFHaXE0RDdldjBnWFNUU1FTTTZxSndSZFc5a3BpeEplZWY4?=
 =?utf-8?B?RDdwZkFVaXVSVmU2NHJxMnY2OHpMUmxEOTdWdDRoV1hZZnAxMEI4Um5TN1NU?=
 =?utf-8?B?MEQ4Qlp3VlI2WWFiTEpLM0NXYStQMnJ5RzZJMUZvajhyZVo0UDNoM3RwVzli?=
 =?utf-8?B?bDN4WSt0QjRlbXZGYlNrYmp6KzlZeGxOZUlpZGxVT0hleWVOOVVINnhiUDVw?=
 =?utf-8?B?NzJmK0toRmVEcTFKS25WVTB1SnFibzJCbEdWc0FGV3hWckxkdU9kSnduNVRr?=
 =?utf-8?B?US9NVGpNTWRMTllCSURZTFVDM0RSWldsei92TlJ6Q1hIdjAveWYyUW1HUVhm?=
 =?utf-8?B?dnZmbno1TjlwMHBZSHN0RnpRaWxxVklqcUl3UzJJREluR1RIemo0QlpDMVRT?=
 =?utf-8?B?dzdyOWtEejRnaVBpZm5rUmZHNVIxWGhQZEJMQzIxanBZaXI4UHdFc3B1dU5U?=
 =?utf-8?B?VWthYWlNaWdubXB1ZGE5YjVFSzljZHFuaHJPNVJnMys0OW1TbUhTVGg0SlUw?=
 =?utf-8?B?QVM2RTQ0eTBTWUthNlVxRTNJQWdkQUZvYmZqUmhBb09veHNlMUxIaVRHS0FB?=
 =?utf-8?B?Q1YvK1BaOGNBVlhSTnNGYXBZdE1VZmdmaFRZaEZBNDA4ZUJ4UEFGTFcyd0F0?=
 =?utf-8?B?WnAvUkVyNmVEL0pkeE1IMC9kZ21jUU5qYnRiR2lBdXF2NFBrVWl2U1BlcE9h?=
 =?utf-8?B?aTVxb2ExTXRzSC9GTFVqbnZ0K3BMKzlvREt0R0xrbnVXM25MMmFHc3Zrc2Ft?=
 =?utf-8?B?ZHpqaW1ZQXJOSmt4SjZmNEd1SDBlM203MzZ6cUZ2YUoyS0NRZ1lwVm9EVCtp?=
 =?utf-8?B?MmtyWml1M0Rya056aFJkSEZYOWNBR21VSHRiMkpEYXhMcERBd2ZTMzNCTmpW?=
 =?utf-8?B?NkNFeVo2elkzb2N4VERVclovc1NEdWc2VEx1aGZiN1d1bXQ2R2xud2lUZHVH?=
 =?utf-8?B?ajgvdHFxZmtwUjhzSTJCWlFkTmVGY1RkcWRWUy8weDlxNTJxVXdDL01YcFhs?=
 =?utf-8?B?a01mS25uUUZMWmg1N2NHTkxncGhRY2dLWDIzbW5BQjQxYkVxem8yNU53aDhh?=
 =?utf-8?B?ZnBQdHNlSEc3U0NLUTdFcktuWXpMNXZtS1ZhNjJKd1pES00vbnFvU3pVeVlC?=
 =?utf-8?B?Z0ZRMUZLSzhCaWtsRXNyUlU3OVBPS2NDb1N0QTBEWTFrSEQ0ajhHMDhhVFoy?=
 =?utf-8?B?Smx0YlBWNG5PMnVmZGhyK05BUE1HZjVyT1VPOWdRSmZlRXcwbnRmY05PNVh5?=
 =?utf-8?B?bjBSUTFKYVcrZVVOcDF2b0swSHBaWkVqTitHdTdsWE5NaE5pNDl5OG5Va1NR?=
 =?utf-8?B?eFZjbmtOVnpLc2Y4MnByMTh4ek11VXptMTc5a2J6eWVxZFVqc2Q3bXNWakhV?=
 =?utf-8?B?U2hFOXRmTGtmeWlzaDI2MU43ZnNXb1ltckxFVEVPMkF6TjFmV0NpT2k4QkM3?=
 =?utf-8?B?V28rdnFCbUdzb3pCQkNJTkQ5NkJDUTdjRVhielFnKzhXdmtja3BhLzhHSHdo?=
 =?utf-8?B?cG8vZmx1M21CSWlRbmEyazU3SXRFZGNsSXJCZzdzODlOQmRmbFFkZHRFcHd4?=
 =?utf-8?Q?QnqvfiMUspOIEfvw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4c73ae-52b9-4681-ce46-08df49824f1d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 16:53:33.2861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E8qMQ12kC1PcMxosIwG/SbhY8tq7gBh4L0SY/+qSMPROr9VYxkJ/pzvQEYFeBWV66oIrZL6BMYQFlFWow9Oe/mcABztAR91OvEkKl3sEoVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6567
X-purgate-ID: tlsNG-42698a/1795452918-A9CC79EA-3CBAA2EA/0/0
X-purgate-type: clean
X-purgate-size: 1343
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19/11/2026 2:44 pm, Alejandro Vallejo wrote:
> 2604adda4f81 introduced the cpu_has_amd_erratum() machinary while adding
> erratum 383. The commit message claims it was based on Linux's, but in
> addition to cosmetic changes it also added Fam12h as affected. It is not
> acknowledged as so the relevant Fam12h revision guide, and Linux itself
> never considered it.

You need the NDA revision guide, not the public one.

Fam12h, Model 0 Steppings 0 and 1 are affected.  It was fixed starting
in Model 1.


> My best guess is that OSVW always returns early and
> doesn't let the "legacy" mechanism ever match Fam12h (the relevant bit
> is always 0, according to its Revision Guide).

The OSVW MSRs are fully writeable, with a note saying "OS/VMM should
treat them as read-only".

Getting helpful OSVW information requires a firmware update, which means
OS/VMM software needs the fallback list irrespective.

This is why we have the legacy list as well, but it also means it
suffices to only have the legacy list.  (Yes, technically we could be
levelled and OSVW says vulnerable outside of the range, but for the sake
of one 20-year-old errata, I'm not overly bothered about this corner case).

Anyway, this can be given as the justification for getting rid of OSVW,
with the Fam12 range reinstated.

~Andrew

