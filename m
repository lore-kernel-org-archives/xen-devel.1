Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F009C88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 15:02:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1417341.1646215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52lH-0000WI-Ui; Fri, 11 Sep 2026 15:01:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1417341.1646215; Fri, 11 Sep 2026 15:01:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x52lH-0000WB-RK; Fri, 11 Sep 2026 15:01:55 +0000
Received: by outflank-mailman (input) for mailman id 1417341;
 Fri, 11 Sep 2026 15:01:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x52lG-0000Ux-MA
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 15:01:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x52lG-001hW8-32
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 17:01:54 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa417de-8faa-0a2a0a5109dd-0a2a450c8fe6-14
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 17:01:54 +0200
Received: from [52.101.193.34]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6aa417df-f479-0a2a450c0019-3465c1228ee8-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 17:01:53 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY5PR03MB5128.namprd03.prod.outlook.com (2603:10b6:a03:1f2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 11 Sep
 2026 15:01:46 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 15:01:46 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gaUsaEtX+QozJNAWpfHUE1iZmVXU51nG9jPrpr2G0K4xlVIpbzQlIHm+EfoH3VDfFzgdF5jcTy2tpwwLDzKW0zKY4o8PTJQfzxRnQFbHYAotVEXfD45AKIXf18lxjV/XS0fXj3i5NpNO5msVwSnC4pnpZ5v6dQR+uHj2wW5vfgORZ4TWxQFnU2ZC02okMcPWEPkzCXnkInM2LGZI7VFDHeNhr8d3jP23T9hH8rhUFcaYEY3UiVWs7CQzzzEl8jDgzKnrLZSOrkt3H5YdTPcGFDW3ClCSTknScoTgCNYeXMjIAwd2h+2bkyoxPho8ClRYIgtguRISbLOWlWkD2Q4VnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shqd0gjZZOuqfj3ISNzbhpqXj29M0D/xD0iUQMgyx/Y=;
 b=R43qw5UetxdiLa1B6PfKiH6Emc2YHHCtYgSpW5fX7n2OK/dzFj3x+wzMbC+2drmyBgMjCbV6tYL4GKC4hSsOyrTV41bEi1HVV2yY2oDadPG8KxwerG/kAvk3trewS7mvHrtv21Fj2YT5sXQVoH9u5iIA67Kgpf70vNFaIwbhrRq1z5uQJSB/or/b3umaWEK5qg4Q1em9Kie+c8tR5AI42T7pxR+dkGiv6gEcWKWTgxWbtZemFB738vZSMO0ptchlCm5csUA1S6Nnt5/tbAaZhdqzuFIhYv2lHs+51vn64zsJoWBRvZPaFndYPFqihrp1AK3GvDd+8AuoqlJv+OouAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shqd0gjZZOuqfj3ISNzbhpqXj29M0D/xD0iUQMgyx/Y=;
 b=btufewevl5NcJ3RXuOEvEEwaoTAoaeoz3f4wWUq57xMf/7xv1qn8fJ/s30yQ+FtBQyfGrkN37jimZg/fV5TbV8aHeOl9u94kyiyIqOpnLqmr0Bke7veoECxKwDUoqh9cXGoqS1qfoiyuTh76qDzK8Didcn8FbAdwlc5ORmffIJ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8ad67efb-6591-4b8a-b79f-8b53aacc5e84@citrix.com>
Date: Fri, 11 Sep 2026 16:01:43 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, jbeulich@suse.com,
 teddy.astie@vates.tech
Subject: Re: [PATCH v2 2/7] x86: Remove return value from UPDATE_ENTRY
To: Kevin Lampis <kevin.lampis@citrix.com>, xen-devel@lists.xenproject.org
References: <20260910203113.462943-1-kevin.lampis@citrix.com>
 <20260910203113.462943-3-kevin.lampis@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260910203113.462943-3-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0164.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::13) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY5PR03MB5128:EE_
X-MS-Office365-Filtering-Correlation-Id: d6f844b3-6728-4987-2f85-08df10159953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|4143699003|10067099003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	VAjAgpX3CeZXhPQdD7g/G3AFCCNDmZbYL2xaFCBi5QtJRBXhFHK2Y2nXQLsaw2FfuSvge23rdTUH4VaPyL91IZd9RL/yW49G2p8RXFkoC8o8fpRSUbLKlWDjCO3YEsxp4Wi3Arayws/ozO4yB0zg7oooSEuWul5KgHa1ZW9Gp1t0vBH+6SWerUUIG5Iym20svFE7L976o5J3237CzYfZJVgjc+q4TAh4Ux8hO1wOXt8vDou3Sor73JphYzMKpA7Yha7Iqvdiew2N03x8zz4Mz7+S0a0D+m17j4+l8YjMZag/3KrHSX4VENe6SSF8kSlHmfDm8/9eyG0cEgnrqD9SXj3TcwD0rQSXekwvGVb7G4DO5kSzBSs1vEe7M8R2M2swedcH8hipGFBpayu09Z3pzR2kfJH6qdRL5eTS/Mnv7SRmazOfilZBcZ9LiY3/fUhd2ZAqHboQYGyt3V6Xb2LUCvpID8swwpVUO76WJ7Pzep05dOmFrZ1870UD9XG5HTNnxWmTLf77aRuVbHLiGrn3/MDoa5u3HB6kpt1Nxx1b26beviPImRjfxV/nlfyJqF6LZBmHxXaAxouW26g84HZH1R7qaUb7jIHlwQaxZ7EQC/uQDo4FXaIEOCawHZUrQYV1yZ+dk8GQva/9CtpoUK5CVfngSJC8RI1aKCgI03XX/8o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(4143699003)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjdiSllzMjB4K0FRaHNVNHorTXpqT1FHemJCWUFrVUxkbzJxVEhqNkVham8z?=
 =?utf-8?B?WFBxZXVUOUZCWlZDL1BkaWlERXRBS1cyNXo3ZzRuWmhpOGVpYk1WaVhXelZa?=
 =?utf-8?B?cTZiUFhYRHY5ZzJKeG51NWVYTE5TRXQvUVlMY3FKekNkQldWYVF1WTBIMVRw?=
 =?utf-8?B?QUJ1clIwUW0xRkhiWS9UNXZ3SStwMjFBNSs2OVRodVFxQ3B6RHpKUHVTeVd1?=
 =?utf-8?B?MGdDRmJ0cUI5K0FRaW1zWnVhR3lMT3E0Rk1QeHRQTWx3dXZQT25hUHJvRTJF?=
 =?utf-8?B?b2Z0WW0wSk16ZEsxTmxEbjZPdkZObkV5cVQvRFBUZXRqa09pSEQ4NWkrQkN0?=
 =?utf-8?B?eVdxMDNKMWJEbzd5aVlscCtMNVArdFdWQ09aSkZ4RllPUTgyYUw1bGZpVUxh?=
 =?utf-8?B?a2ZsR0JmcmE0TWxRa1BrNE9IYkYxTlZIMGt6dWU4UFJWdzF1eGdnYjdvTnVu?=
 =?utf-8?B?OWRpMTJVdXpqNlhyYy90c1hKOWJiWW0vY0RKNWxOcEZncTM3Vk5yR0laU0Ji?=
 =?utf-8?B?aWxOemgzRGp2TGQ2QlR2UTNLdEV6RXozN2FRbkJRcDIxR2h0VmFrOTY3anU5?=
 =?utf-8?B?YkxsRlpGNUpqVmg3d0Z4ajB5MTFVbjc5R1FYY2QzazF1anhjUmcrWnFQY2VE?=
 =?utf-8?B?TWZpVkU1cnVCOU1GQ2RweWs3M2MwMmhDTjBXb1I4Y0RBdE16NWlaSTRBdmt3?=
 =?utf-8?B?VG9JNE91TDE5TmViVjFuRWxHaWZyazNZb2RGWVowVk5DNjJnUEZxUkJYS2Vm?=
 =?utf-8?B?bk5JZG94TnBkNktQMURVQjJPenlYTHgveFMrU2RZdTY5Y3g3TmZPdGZvcmxF?=
 =?utf-8?B?YUpHUUJrRWxRNjYvZkJOVSt0bWd2QU9tb1REd3EvNTBENld0dFd5bjNoNEJF?=
 =?utf-8?B?REZMV213K0pqcUxXenpheCthekZ4ekpGSER1eUZneHdCeGc3aXF2RmpaSlFi?=
 =?utf-8?B?aFJvVzVDM3FpQWJ0RGJVSnhNZXhXOGxqK0hpak4vNDdUTmRQUlQ4cHVMaEZX?=
 =?utf-8?B?bzRqYmVsMlg5ZXZoWjA4Z1N4MEZkUkM5L0JFeE43L1luU2YvRWJxSWpuUEo2?=
 =?utf-8?B?cjNBaE9mOEVZYVFCM2UrUUdQeDJIUGVKVGxWdFZkTElodzhJbDJyY1dWNTcw?=
 =?utf-8?B?Smx1L2RaNTdIZmlZTWZiMloraWhHNjA5R3ltcUJjaVloZUQ4RVVrcHVGS0NY?=
 =?utf-8?B?aVhkU1Jkb0JZQ2hkQ2I1QUhjZDlrK1doVUV3azhEM3RuTTVGcGVwU1pQb29L?=
 =?utf-8?B?b1lNQmVlYmhZZForeFk2TVJKM3RwOHVtSjNIcG9aSXh5Z1MxazBHbmZZRHNP?=
 =?utf-8?B?aUVqL09sUGZBR1lsNEFKTWliM0VkSDVnSzhJSkFRc0VmeFp2ZHQvV3F6akhl?=
 =?utf-8?B?ZVhMa0E3QnZCaTBDUGdNOEdwZ0tkbGxkdEtpVVgwUkRFc1ZvdkM2cWpqdjkx?=
 =?utf-8?B?MUNKL3dtaGJTaEQ2U1Ywb1Ixb1VQVXJuZit2ODBzWE9IZ0ZZTDZsa2MxRjFw?=
 =?utf-8?B?QWhKaHAwYS9UTld1bURUTkdWZE0wdHQwMFZYUE0yS3Fob05yY3R5Z0hmWVdk?=
 =?utf-8?B?UVZZYlExTGx6MHJJR2dZaklIRjVqbjNPelM0SGR0akFBSVlSRjFtbW5JMVdi?=
 =?utf-8?B?N2hlOU8ra3kyZVNaRFN2ejlwUGxxeUxaUGZyS3c2NEJLSGwvaGJxbUFBT3FH?=
 =?utf-8?B?ZEc0REttaEtzbmJ3eTd5QnlPOThSRG5CQUdJL2xYbkZqZ04zLy9wdy9nRVVy?=
 =?utf-8?B?eEZ0RE1MZExDZnovSXdqUyt6NFQwR0dQVzN3bjJRWEJydzkyRUlUYTJZdGho?=
 =?utf-8?B?aTVwVFhBdWZhbFJXN1JlemF1aW9TZStheWw1SWpSajNwZEd1aVQxemFINjBt?=
 =?utf-8?B?aEJGdVJEYUJ1bElPcnVRaXZpbE41OW5xRE5RMk9ZbEhYZzRPREpTZE9kT3Q4?=
 =?utf-8?B?SG94NVpIUWxQMlU2WWhaSkg0S01TZm5PNThYam5WdUVCNTFEcG1XK2pCdWpH?=
 =?utf-8?B?Y2pmd3dXWmdiK0dZNGdRbUhpK0QrU3J1NDY4RGxCQzZtVGRYclpkdDVSMzlu?=
 =?utf-8?B?enJtRXUyNHlLN1lEcEVCTWx2NjJyNk5mVXo1ZUo0cSsyY1duajhoS2tCMFpE?=
 =?utf-8?B?U2ROVEJxTzduRlNRMGtmNStKNmI2UGdEV2VGdkgxT2JNakxTM3FhdTh2ZGhF?=
 =?utf-8?B?ZkxIZll5YjV2K01aVjZ4czNZSkJGTXdiMGhvbkUrY052TjNkLzJZVjlkeFhk?=
 =?utf-8?B?Z2lHU3pDUFFqV3NBUnJuWHU0K1MveFVBbS95ZGNIQ3M1QXZra0Vqb3lNdW9y?=
 =?utf-8?B?WHludnpianR4dDNuMmhIblZDOW9mSUVoUUgvUCtnd0t3L3VCeW9VSDlFQmVw?=
 =?utf-8?Q?UnhB+1eFrqMY+Adg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f844b3-6728-4987-2f85-08df10159953
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 15:01:46.3819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+sLPRE/A5kyMHT1zEvDpToy7hqSyIpd/B56E1z/dLSqqZKJdzYfompfxFRpjSPZRxloZHq4iI/dvJbjMJIqWFk4xndxiNmyuT3k9eyua1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5128
X-purgate-ID: tlsNG-d25034/1789138914-768DDA5B-1667BD90/0/0
X-purgate-type: clean
X-purgate-size: 1399

On 10/09/2026 9:31 pm, Kevin Lampis wrote:
> UPDATE_ENTRY/update_intpte always returns true since 1bc30c076a7f
> "x86/mm: {paging, sh}_{cmpxchg, write}_guest_entry() cannot fault"
>
> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
> ---
> Changes in v2:
> - New patch
> ---
>  xen/arch/x86/mm.c               | 74 +++++++++------------------------
>  xen/arch/x86/pv/grant_table.c   | 53 +++++++++++------------
>  xen/arch/x86/pv/mm.h            |  6 +--
>  xen/arch/x86/pv/ro-page-fault.c |  3 +-
>  4 files changed, 46 insertions(+), 90 deletions(-)

Interestingly, despite being a static line, the optimiser can't make
this simplification all on it's own.

Bloat-o-meter reports:

    add/remove: 0/0 grow/shrink: 3/1 up/down: 6/-32 (-26)
    Function                                     old     new   delta
    symbols_offsets                            53584   53588      +4
    symbols_names                             135144  135145      +1
    mod_l1_entry                                1872    1873      +1
    do_mmu_update                               5604    5572     -32


I've checked several times now, and I can't see anything which
constitutes a logical change here.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

