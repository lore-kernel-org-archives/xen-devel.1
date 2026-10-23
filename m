Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD121606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 20:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=Mpti6Mnw
Received: from list by lists.xenproject.org with outflank-mailman.1459670.1671465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKM8t-0005hH-TK; Fri, 23 Oct 2026 20:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459670.1671465; Fri, 23 Oct 2026 20:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKM8t-0005h9-Q9; Fri, 23 Oct 2026 20:45:35 +0000
Received: by outflank-mailman (input) for mailman id 1459670;
 Fri, 23 Oct 2026 20:45:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xKM8s-0005h3-IN
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 20:45:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKM8r-007ANc-Ta
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 22:45:33 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6adbc73e-8faa-0a2a0a5109dd-0a2a450c9546-18
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 22:45:33 +0200
Received: from [52.101.52.67]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6adbc76c-f479-0a2a450c0019-346534438153-4
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 22:45:33 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BL1PR03MB6198.namprd03.prod.outlook.com (2603:10b6:208:31e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 20:45:31 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 20:45:31 +0000
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
 b=TmfiXKHeoF8qoLPYnG5ksKXDlGv8vGBAsZF3CPU4eT0Tho7/9kCbR/uQXS2VfIth1jWbeoTtntVd1ng96Q2TjNk0Wc76hNQm5dD0OVrUjImnOjcUu0V8XEdYAFcxjmeJo7e/Vho7qaZO/387Lfuu6WdT6o0s16Lgxqy7GABJdxNzZS20/p3bzsyzgHpv1hevzEPi4GQSkAdHJi1ZiOwRD5zwXdMdz8X0VlxWPgu/9wDyjp2soBM4BZP6XyHl4MXEI90MhRH5b7kQ/iKiTEaag0YgyAqJeKpQF0ynBsmYPP1TpsTMY6sQE714VVSPsAQqF62dpzZ7/Q3BmvOVlBKpDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7PZkHn60XdeHX7oT1rGA0CwkzhY4drV+hn8lBp9BW4=;
 b=NuJjmbftTRkhMQZAoP0zbD5AYZLl8mbx4ptM3tZ21r33PgmMlLr9cKKKkXJIoLZwhHHcbQ4SbVBvXyOUWQ+yzFDsbTvoPz+v3WyCiXhLak2PPBNabfsRciBxKgqr3BD+lRI5/iliTJZ0zbJ0G3+joZaD12WwAblJxqVSIVFUP3zzNLq5NDJbs6F1Dj+9tl/yQcqPlP07y1PWWm97YNCz1AFXZWYOQ22u3ErhFjAz2UoVw6n5LLeKeMUMiZI/cME7gIFWkZw1HfIlARKNKwPE1FFymdlm3Wd+zEDiH9PYRQdK7jLqbrrt36HNAQRWLWYtDU2Nxew0V7vBTNBlsdPhRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7PZkHn60XdeHX7oT1rGA0CwkzhY4drV+hn8lBp9BW4=;
 b=Mpti6Mnw7jNgvGzZFYzld/fUxov/yPFGSMth5BHUFes8PhqndGWfR8XIS1vYJ5vzv9ZlVLVK6DAZHkxhYjGN/OXILsR0OTjRORwhcM/Rre+HViorDBXJ/bqvP9bPm1quh7BSmG/jE7zX1s2u/6YnSTGb1GubpX7bm3o+9UbSdUI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b236e564-c2fd-44d1-93ee-8bb87e2e2c0f@citrix.com>
Date: Fri, 23 Oct 2026 21:45:27 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Subject: Re: [PATCH] x86/vlapic: Don't change ICR on x2APIC SELF_IPI write
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <1792420048.8631fc262581453bbf619ec5b2062170.1a1548f6f6b0008425@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1792420048.8631fc262581453bbf619ec5b2062170.1a1548f6f6b0008425@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0443.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BL1PR03MB6198:EE_
X-MS-Office365-Filtering-Correlation-Id: c7582d9e-66c0-4c11-9bc3-08df314693ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|261022105027099003|56012099006|11063799006|5023799004|261021123027099003|261022075727099003|261021121427099003|261009223027099003|18002099003|22082099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	UyRQETNfcdag7VECeHTr60lHmfpaj90O1KVi5npCOW7Me7dsE2EJwR/mmawQ9K1mlfLaT1/tBDnsOXyuQE7nfDJTkKDN8SQliSmNcpiOPh3nf1APU1hC3ilzgm6jbdnN9st+1+jaZjK8pESkiBG/3kxYrVf1EPRfJoI539C6XnhXaSibL3reU84Hxf/pa98u0S+TyGMAFy+iNqvl+06P2HT7t8mixdB2Ewz/CpDikN1igGhM++XByTPPPhK+QA05Zs7l6X3z36yXZ77AJ5sn6AoA8HeDW1W01CxEZoz+DhK645BHN8VsE4he/zXVdzFUL3gBsUPl1I8RK36ElVncSkZI2dLbVc+MR5ZT9QRYFBPLEZlgboi6dnS8nsGIWz4N6DtkhRpE1j6uKIMa5uh1KRB83VTSdHBkZ6E6jifkqRgidp7OGumT2K/K1mTyYAbkyM6fJBmOSeXxf8Qea5YY/x863ZZ71EKhugb/IQzbpuYLK0SK2wcX3iW8xVahqZbTyxJWWyd8RO5E3mxoNM0ta90J2sJhqbLpd4o3A6uFB9fOXLHah/jxUE+Ai4LyfYodUNgjI6mDvp+PLbuuSg+w6dDp3faS0j4mjk8zoY/JNuqxgpWqQyJXmjdt8z6sBThy8vaoM+B9WlJxiMmGu9In0KEX6rlGikL5DedCKT5y+9Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(261022105027099003)(56012099006)(11063799006)(5023799004)(261021123027099003)(261022075727099003)(261021121427099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MExVSldvUnh0V1hQKy9QYjdnRFA5M0M1NFNZVmJvRWhKeklHNmxyekcydTRa?=
 =?utf-8?B?L1RPWVE1NVVFc0xpak9VNUdxM2UwbzJBU3RTc0QzL00zVm1OL1UrRHM3ZTht?=
 =?utf-8?B?M29ibGl4eGN1L3hBZldTRElPNmFXTzRCTG94QThkOFdacHJOSjRham5RK0p4?=
 =?utf-8?B?eGdHZzI5bEhiVndxcDNZaWVxajRhQkZVVzk4WGVHZzBWK3JXa1dvNklhczhq?=
 =?utf-8?B?bHBWNHRERFlaWjVJVmZDREFuWnRVYTZRZG9vNGMxaTZzNm56cjRwVHZlbys4?=
 =?utf-8?B?RTZEWlVXNncxZ1MwYS9CekdCK0pVMXlyVFNwaDdITVd4NmMvbUlhWi9idXZE?=
 =?utf-8?B?K0hrT1RhUExBdHFqcmF4cG92ZVBEcTA1dlY4RHlrdWNaUW0rSldSeE5XMHRG?=
 =?utf-8?B?VjROSkVIME5lMzNBcGpMMEZMazgveXl0N3BYa2hCanRiWjRLdzd4M0dkN013?=
 =?utf-8?B?UlVEVVdSOEY3T3p0MTNzN283a2pDcmozUTkzblJDTVFqRlFjUThreW16bVJF?=
 =?utf-8?B?WTlwS2Q5N202bHFtak1pRzRaQ01tY3lDcHEwMThMK2x6cXhIbjIrN05OejVX?=
 =?utf-8?B?Y0k5RnpxWEw2elJBRGROdXpkL3lvNnh2K0xMUDBYQ2lSMWlIQnpGZGxrWTNS?=
 =?utf-8?B?V0x3dTY2ampVWGxCUWVUWUJrcVI5R0p3anRXdW96UHEvY1VRMVB2bmxvQTZh?=
 =?utf-8?B?Q3Fidnc4MGJEZkhOSktmdG9pMGx5ZWpEa1h6OEVrVHp1SDJIWE1tQTFpVmZx?=
 =?utf-8?B?N0VFUlYvcVhNNUhBSFpPdTByVXRmeVdId1lSTC9LdXhNKzJUVjRoczdGaDlR?=
 =?utf-8?B?UkIxY0VOZVlBRGc3ZUhJRG5VL2d6aXJsZ2xqck9MV3h1WnZyV3FlZjg1Q1Nx?=
 =?utf-8?B?cmNCZWlNYjF0MEVSUTdSYUc3V1lkNE1oME40a0l4dElCUEZ2U2VJbG5yZ250?=
 =?utf-8?B?U2R6SitxeU9FWUVhS05XNm9Td29IbVBIWktDT3RkUWtuUkNmRklzODJJdTR1?=
 =?utf-8?B?OE1iWUhIenRYb2c5ak1IWTlnckI0T0ZReDU3Rk01UjJLN2puSUs5Tzk4UTg0?=
 =?utf-8?B?eC95RUYvcHVyTGlZMFpZRWZ0enlObTdWUHdjS3ZNTkQ5VE5RZVY5Zzh6OS9k?=
 =?utf-8?B?UmNsSUQwV2xzYUV0Yy9wUU45R3lUY0NldHViOFNPcUg0cmFlUGdvNDJNVXc4?=
 =?utf-8?B?d3IvNHc0RlBHdEZBZkhFSjV4Vk1zUmwvbHpuWUJyQzMxM1MwZTlpQkovNC9F?=
 =?utf-8?B?cGFzTi9yWlJSMlZHejNQc3ZqcElMdEQ0WGpKM0lWaTVUcWdlS0Z5MjI2OW54?=
 =?utf-8?B?Qmlxcy9QMUxyTUwxLzFBdDBmMFJXbHJrbE56aGZ3SjVlNGo5cU5Qb0s2N1dr?=
 =?utf-8?B?Q1BXVEpJdFFsUFo3Ry9DbG90cU9KKzlWUTFBbXJwK1RrSUw4M1orbmkrQklH?=
 =?utf-8?B?UUtRRWQrZEt3OEs5d0p4TTU0dksySDBBZjJmR3E0NjFLOTBXNmMrdzdpdy9n?=
 =?utf-8?B?Mit0UWJaUjJabmVHZ2R4ZTd1WlYyL1hpWXRpUnRKYmhGcnhyL0JBQktRR09j?=
 =?utf-8?B?bHdMdEYrWEUwTEFZaXhXVU9mTzNPcU5zZjhja0pOSnArcDRoMzhQOVhmejdX?=
 =?utf-8?B?UG5oRjUwNm5NcXd5NlpUREQ0SmtJTk5CQXhrd1JRVTFTRGZvMkNURS83YVVU?=
 =?utf-8?B?QWIzWUd2RnVDMHUzS2x1ZS9GY1N5Wk5yYXVJQU5Ec3gzdzlZWThJYTROME94?=
 =?utf-8?B?UDRWejN3MVJBbGhOK2VuVUlEdmN2OFR2cEJhS3loVUxhaWhvdW44YjdkaGJV?=
 =?utf-8?B?VmZDRWZtdFN0QnVDZ2pFNDliNjdOVUxHK3VnN3htNG52cGFNK2tOSEc5WXBT?=
 =?utf-8?B?Uks0Z1Z2TWs3Q01za3BWS2JudFZoODFyS2QzdmJoczZMZEJPUFREM1JVaGRI?=
 =?utf-8?B?bjhYOC9uN1pmcHVTdEVudi81aVFVeE15NUNUb3R6Z3BVdzI4dFZXczZ1UXpB?=
 =?utf-8?B?bUoyTXYvbFNnR0ZyT0dKTVJIWU51QjdISnN5bDQ4Tm8wTDBtbjREUmVRZm1a?=
 =?utf-8?B?Q25kb1F3c3FOVjNRcmVjTFIrWit5ZTduMWRpRE5wTnQ0ZUlUZWFNMmlRRE9z?=
 =?utf-8?B?Q05mRkNyL3RNTFgraEtBM1ArQ1JQc1F6K3NZTEFqd3BRR1FlbE82ZStSZTZr?=
 =?utf-8?B?dXcxSms5aHlmdnFiSU5JNC9qYWFRdThncnZXZFNOYisreG5JbU9JR3ZicGZk?=
 =?utf-8?B?WlZ3VU9INTVsLzkwR0QvRWRpQ0kzWDcxaVBldld0YXNQSHNnam9Xbk1EdTlK?=
 =?utf-8?B?WXhKR2JyVVRobU9MRzN4WG16cEJwL1pyRVVXQVAxSlhNL2FwcnlqdXZMYVR0?=
 =?utf-8?Q?63s9jgVZ8BocGnUU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7582d9e-66c0-4c11-9bc3-08df314693ea
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 20:45:31.0929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nvg/PFC58XGBsODdRvIaIqnIR/e8i/bgZeN50L30RwUPPnJTToGM0KjrerLbZxmM+1O6KqMFhjGgRGViwAVvuJhBIn9WHWuj/2TUgESuAmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6198
X-purgate-ID: tlsNG-d25034/1792788333-5073FA5B-984118E6/0/0
X-purgate-type: clean
X-purgate-size: 2699
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19/10/2026 3:26 pm, Teddy Astie wrote:
> The Intel SDM (Vol 3A-13.12.11, June 2026) says
>
>> The semantics of sending a self-IPI via the SELF IPI register
>> are identical to sending a self targeted edge triggered fixed
>> interrupt with the specified vector.
> However, this is not expected to alter the ICR register.

Having spoken to Intel, all Core/P-core's implement SELF_IPI using ICR,
so do mutate the value.

More recent Atom/E-core designs implement SELF_IPI differently, and do
not mutate ICR.  From the testing I performed in Gitlab-CI, "More
recent" is at least AlderLake and later, so Gracemont cores.

Either way, this is conformation that both behaviours are legitimate,
and it is certainly not a "bugfix" to change the behaviour.

There might be enough reason to change the behaviour, as the Atom
behaviour "feels" cleaner, and because it reduces the work we need to do
in the SELF_IPI path, but a justification needs to be along these lines,
not in terms of being a bugfix.

Perhaps a better reason to make the change is because the VT-x
architecture appears to not overwrite ICR, even on Core designs, and
this would be a behavioural difference between APICV or not.

> Fix the Xen behavior by sending the Self-IPI directly instead of
> emulating it by modifying ICR register.
>
> Fixes: 21c4d089ba2a ("x86 hvm: x2APIC emulation")
> Assisted-by: Claude Fable 5.1
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> Linux/KVM has a similar patch :
>
> KVM: x86: Do not change ICR on write to APIC_SELF_IPI
> https://github.com/torvalds/linux/commit/d22a81b304a27fca6124174a8e842e826c193466
>
>  xen/arch/x86/hvm/vlapic.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index 885f5d304b..bb105225e2 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -963,6 +963,17 @@ static int cf_check vlapic_mmio_write(
>      return X86EMUL_OKAY;
>  }
>  
> +/*
> + * A write to the SELF IPI register sends a fixed, edge triggered IPI with
> + * the given vector to the local APIC itself.  Unlike an ICR write it doesn't
> + * update the ICR, which is guest visible, in x2APIC mode even without any
> + * intervention by Xen when APIC-register virtualization is in use.
> + */
> +static void vlapic_self_ipi(struct vlapic *vlapic, uint32_t val)
> +{
> +    vlapic_ipi(vlapic, APIC_DEST_SELF | (val & APIC_VECTOR_MASK), 0);
> +}

I'm not sure a wrapper is really worth it, but if you do care to
continue with the patch, then you want a uint8_t vec here, and drop the
mask.

~Andrew

