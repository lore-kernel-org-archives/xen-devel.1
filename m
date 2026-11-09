Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53842606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 17:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=H77fstpJ
Received: from list by lists.xenproject.org with outflank-mailman.1480335.1684299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQTOQ-0007B9-5n; Mon, 09 Nov 2026 17:42:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480335.1684299; Mon, 09 Nov 2026 17:42:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQTOQ-0007B0-1K; Mon, 09 Nov 2026 17:42:54 +0000
Received: by outflank-mailman (input) for mailman id 1480335;
 Mon, 09 Nov 2026 17:42:52 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xQTOO-0007As-PS
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 17:42:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQTON-00FVRE-VU
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 18:42:51 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af205cf-8faa-0a2a0a5109dd-0a2a4507e88c-48
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 18:42:51 +0100
Received: from [52.101.53.31]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6af20619-b4ea-0a2a45070019-3465351fca98-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 18:42:51 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA1PR03MB6466.namprd03.prod.outlook.com (2603:10b6:806:1c1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 17:42:47 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 17:42:47 +0000
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
 b=TeFdmL+MOTFTel0kn5fkl5uswA/32cH4EfMXStv88L+oW9sni8rDZnVtNqca/t6oUBoQnQuXWAwZgDjI5MbzWUjg5OjRY9NNAGN16g7Opc1T1vpSdkG5waM0qJAb7LjcQzHXqZstenMk6JmnxJ4UgTY/66KFDXpa+h1fhe9/k7Apm56yqU65BtCBwC6N4hhgV5PE7RjVDmM168WX+xFGgyOi+5l61J872p8h14g46Yy7kvqTevySLCtY9hDDGvJ7oLtpiTI6CvJYhDDL8KkP5laLtn28nL2UyrTLxR/u1m7RM06aL7tklPcPmrsHm7DJJtwBGYEx4xtWdLX3stQoPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ceRJ3HuTEPqGx7XGA5r7CBjb0EDwCbdjuykBo28g6CU=;
 b=uvq9RZZgUSKisonZ9gOG34SOVBG+3ghhxyfVpkwDX2kpIWPaN+Y1mTG1DAFkKdQV6AKOIyFjsjhn0LebkWWkT5bEnxG11FdfwYPn+YP/oufQPi8igaMd+xgxIHPRF3sWCkW45rBj3kHPp/elz2mtumwdzh8UYuGOTd+gpyaJ0xzNCd2nSLzvh94TcgQxxPLS0JimvdRVztIhFrAsz475NEVvY3gt87DXKOA7gJpJwVJYyi8Dkmpl+rhlx5jnl41YfHLsJmGhZnQzBtpq+lVcH1qjiC3dknTR1iIZw7kya5PlHv7XYHENe34gvIiQ3B52kf8P0dpBD9lWxAgGZzwjYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ceRJ3HuTEPqGx7XGA5r7CBjb0EDwCbdjuykBo28g6CU=;
 b=H77fstpJ8t92R3IiYpCppMibVkr9yTGIfiwaykqWApj2iNOsIIqwsLBWWpKj2/3ybOK6fI+BoEwwOUuoQ+W/w8akeX8+J5VyvytYK0IqbOb4767blnGLdBbJeR+RBsC+W+i2sL8Awz4fyyz8kaz/fKPqNwFwTuX0ImBBsW/vsXk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f20e272c-d5c2-4224-8a7c-5b91cd2383af@citrix.com>
Date: Mon, 9 Nov 2026 17:42:43 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 roger@xenproject.org, teddy.astie@vates.tech
Subject: Re: [PATCH v4 4/5] x86: New feature flag XENFEAT_mmu_pt_update_swap.
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20261016164815.3109065-1-kevin.lampis@citrix.com>
 <20261016164815.3109065-5-kevin.lampis@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261016164815.3109065-5-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0086.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:349::17) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA1PR03MB6466:EE_
X-MS-Office365-Filtering-Correlation-Id: fbc5c675-1c6f-4118-6c77-08df3e88de01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|6133799003|10067099003|4143699003|11063799006|261102123227099003|56012099006|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	0/GDY0/ps5ipYqQGAbUSX9R/zPhl9B9xgiTuLLwkGkK8Z9HfMQ8LJjhm/UOjnuRA6gdERP6JgeHDuRSb8OpByKm/0uoyF8vDoqMKOCLvaWsh5Jo9rmIDrO6cUY0OtSSAArzJWU0w+QvMgFB7sSX6c30xkGFE5RllDLHzWoDcdfKDvTtKIoSxzHh0BYrHQLg40itpy+f77vOZlMLV45GT7IQ1Js9Lsf1ZQdY4z2VAa5uanG8hivLaGXcxYWomdRfZciX6jK4gdGum7a2/UaBGLbXG4v5/IZd4lIFeNGV8sqLpU2pk1qItcMPnyM6Nh9ERGw0wD4B/YiFLVW79xiRoV/1st6sMh+jImd1vwu6DddlVno5CjvgS8rgXyfmStFa57fgl3R3g5d7KhutF61hdY/GM6o4r3/ssiFsw24DD6FDnBX1DOaQs1ly4fie4anAtidcdedYMicQevQLEGVGg36cHQRcgpxiJvLp2X01ihlGNJGMh156Mwjd8pPqQgLA4Cu1WwlHAA2xX4P1lXgaRwgKJ2SHCcB7HfmLjTUIPxr/43BPekjSESAi72lQ3kPdHz6ncuMUtL0Sq6P0GEngzn0q0hXYJuD7PhdM049DragkfJDRv9cWJylmRTwb3H/9JOvwh3PzAkwi7R3dU7Ji8OhHYtnGJ6afLN9mvVO42lv4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(10067099003)(4143699003)(11063799006)(261102123227099003)(56012099006)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXpHQ2VoOHBLbG5pc2xhcWxCUXlob3E2VHdVU0VucGhUWlhhR1NaczJGNkw1?=
 =?utf-8?B?ek91aHVlOUpvTmdrOGUzdWJSYmpzV3JXN0FwcytWOHJJU1ZuVEtDdG43Tk1k?=
 =?utf-8?B?MmlpcGhzQzJHbkRuR1ZFMTJzQjYrOHhMQ1VFd0UrbTlIT2xtT3VSWmdnaWp1?=
 =?utf-8?B?a2pzQ05TMkhsL3JFU2ZIb2tPeDZBUFBua29NYWVhbVlCTkgyN1NoVlFpWENO?=
 =?utf-8?B?WW55STNxU3EvWXlHVTNqNEZocm1jb1Raa1J5Uy9vd05QNHE3cEZXU2hmeWda?=
 =?utf-8?B?WVBabEo1MXN5c2lEL0lJMUd1bm40eFRVTm0weDF1cXdySDg0VWthcUF0SUxY?=
 =?utf-8?B?ZytqNEUrNzNFbHF4bHVsczFrOWNTWGRQRGtxUEZuUzE1RVJLTitrRVY3MnFk?=
 =?utf-8?B?a2FiMVZkQnVPby9SUlJNWmg1MDA3QXBDbytUcjR5UFVGNUJUYktmQmg1cUEr?=
 =?utf-8?B?REFkR0pMRnY4bVNWNk4xYWhJSFE4dkJ4Sk9RY1dFOTFGODYza0x3d29LenFt?=
 =?utf-8?B?VE1yRUNnWEc1TFEvR0l1eXlJVnE0RFU5QWNDUzdDQTJRd0VTa1gzRjFqL1BS?=
 =?utf-8?B?OWY2SmlWaXdkV0RCNkZIb3NSQXdGV0ZkRUo1RzlWRXVzeU1peFBPU3NaRis5?=
 =?utf-8?B?b2paRmFkZTV0SCt4LzRhd0JJdysxbXl6VXVRRkNVMGJpYjZNZmdKWXYwNUJo?=
 =?utf-8?B?NFpRN1AxTlQ0VW14TEZoR0RBRHpmMFNWYkwxeGZrbEFLamtxWUt2QVEybFo4?=
 =?utf-8?B?cmRZT0xGVG1VT2dJSllwWXZsWmxCRW1kYjJ1QnJlNjl6dGZpWCtDeXRyaitK?=
 =?utf-8?B?M3A1QmFjU080a1NPMHI4VDBRa2tHTmJyckhZYlNaOXZ1QzRMVTlBYVV1eTRP?=
 =?utf-8?B?VWYvNVBTYXF1bmsyS2RqdFFON1ZBL1h3MFZKN0NSQk51c0FweXpXWE1meVdu?=
 =?utf-8?B?Y3J5UjZORjZ2KzNWcXBGTUZpMUtlbVc3LzNzQXQ1ZzJuV1pQRjluZFdlWXBK?=
 =?utf-8?B?REF2RmJsYlpDY0EwcmNjTlFsbjlsSm9EUW83S1ExYmZXbGFTc09FRW0xK2lo?=
 =?utf-8?B?Vjl3YjdUUEZsWUJOQ1pXbEJOU1hPWFNXNmxjK2FCbXVLa0R6OHlXNnBxK1dI?=
 =?utf-8?B?a3lYTWd2WDNFYXZiVTBPUE1NZFRXajhYMGl3SGpobVk4cmxRVWxHcjhYUWE0?=
 =?utf-8?B?UXIrdXh3YUpKTGZGTnBtSHhNajhCMzd1Y3VtZXpvOWNvZEwzMWNycno0Qytl?=
 =?utf-8?B?ZDZ0WUpoRExxYnNPdFJOTWlmS3hPbVdUWXUrb3J5K09GRkpWTkt6eHIyMjBD?=
 =?utf-8?B?UTVXUXdjTkp3UGp0VTlndEJuRURrWDB4UEpjaTRBVW4xUHdybWJpNFlobVYw?=
 =?utf-8?B?eU9BVkUrNXJPZm9xbHBxRithbks1d3A2RHVzSG81VC90MGxtN0xzVFc0eTZn?=
 =?utf-8?B?WTZVWVlweGtoTDNpQ2NSUW44RWFhS2xsbXd0dnhIVC9UOER4MjMyVWZqZjZm?=
 =?utf-8?B?OUp2aWV0UkJDcTRRQWdnUk1BZzEzSnJCeWZmTXZhSlpVRVpsZitqVFBKV1E3?=
 =?utf-8?B?MXJtTytBdlg1VVV6U201Nmo5RGJoUHpiVDBRVm1zenBzVjJMclVqVTRhRmF1?=
 =?utf-8?B?cW9ZOEY3YW1zT2VSTVRvaDl4bzEyZHhGOHY3UGIyT3JoSEVNWjFsSS9hTVNy?=
 =?utf-8?B?a25ERXhmTTEzVXNwRHNRYS80T1RRSGpqdzlZOW5kQXREajU2TnZtT0hjRy81?=
 =?utf-8?B?NXltcDhyN0lIbXJ2K0VWZ0hRTnExZTBwU1lwV2w5VldtOGZsc2RtV3F6NWFH?=
 =?utf-8?B?MGVTUTJhMGZaWG9PeUsxOVBaeE8vZ204alIwUlIrWmhtSFNzWGFRVFhEZjNm?=
 =?utf-8?B?L2R6MTRjSzJMYmt6WGd6ckNXYzBEQ0JWcTl2dkZ4NUZnOVNWdTNIZkUwVTg3?=
 =?utf-8?B?RSt4ekF5N3hCQTg2NjBBYW16Ym81ZFlWZlFEWGN1QWcvNjM3akROTEtXSjlT?=
 =?utf-8?B?OHlHYlI2Q0RlZVc4ZjFhVUNLQThJaEs5S2g1WHJjb1ZkN0M1eU5UR3F4STBx?=
 =?utf-8?B?M1hFK2pCRC9PNnNQQnU3Tm5GRFMrZnVzMldHSER6Sjd2ckhCMnNEUE0yV211?=
 =?utf-8?B?dmlvaEdnOGVIYmpvSGpsMEdORHRUZStRVlFEL0NzYXdSbnpUUFlCSVFGOHpi?=
 =?utf-8?B?S1kxNHRaS1Y0YWNHQTlzVEJvbGtMVmJ2K211K1FKUjJkQVJGZTlZbkg3SzJi?=
 =?utf-8?B?Z29vK0tFL1U5ZFhwSzBhQ3JQNE4vTTFmZTV4ZEJNb1Z6c01pVWZyM1htRWZS?=
 =?utf-8?B?dDlJQ1Nrd2ZnMEE3Mm9YTExpQ2gvZWVkNC9HNlRzbXBPYldQTWlvZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc5c675-1c6f-4118-6c77-08df3e88de01
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 17:42:47.1663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2pB6ykwnJslI/eZdvlry6QijbHA+ObgRENZ0cf3OvHkrJurL1Q/WNiuAZ26nWnR4FwQxUclEDefiGOeoFEnpF3hGNPtZ5ExS8uv0Ug9WiOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6466
X-purgate-ID: tlsNG-ef75cf/1794246171-A7AD0AE4-171E4998/0/0
X-purgate-type: clean
X-purgate-size: 322
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16/10/2026 5:48 pm, Kevin Lampis wrote:
> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>

This wants folding into the previous patch.  Otherwise there's a
boundary where the hypercall exists but isn't reported.

The prior patch is more simple than earlier revisions, so merging will
be fine.

~Andrew

