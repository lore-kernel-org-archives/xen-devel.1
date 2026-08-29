Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D42AC61DBE
	for <xen-devel@archiver.kernel.org>; Sat, 29 Aug 2026 18:19:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1403068.1637663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0NeB-0001ym-2c; Sat, 29 Aug 2026 18:19:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1403068.1637663; Sat, 29 Aug 2026 18:19:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0NeA-0001yf-W3; Sat, 29 Aug 2026 18:19:18 +0000
Received: by outflank-mailman (input) for mailman id 1403068;
 Sat, 29 Aug 2026 18:19:18 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1x0Ne9-0001yZ-Qm
 for xen-devel@lists.xenproject.org; Sat, 29 Aug 2026 18:19:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x0Ne9-00FbMh-7Y
 for xen-devel@lists.xenproject.org; Sat, 29 Aug 2026 20:19:17 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a932176-bab6-0a2a0a5309dd-0a2a4505ccae-42
 for <xen-devel@lists.xenproject.org>; Sat, 29 Aug 2026 20:19:17 +0200
Received: from [52.101.61.7]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a9322a3-4cb1-0a2a45050019-34653d07a500-3
 for <xen-devel@lists.xenproject.org>; Sat, 29 Aug 2026 20:19:16 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV9PR03MB8392.namprd03.prod.outlook.com (2603:10b6:408:366::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sat, 29 Aug
 2026 18:19:13 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 18:19:12 +0000
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
 b=VIJ+N10bWUKP5Utpit4GdwIA4YA5Y6bdX/CCzeYjC/M351w417v6CEua3h7q7hQLIWa4DuCnJ4UweZThL1U2LOdfrTnd64YXFMv2mZlgo1og41wD6DtUPI7s/iqH9QFOIZrNlQUhCCcWxNq2qz8VUI68riV4KqspErcMKcKwjYTGTRTD8mR2kyNeYBBh4t5l8DOkuhAE1it5peS+Uaz19geQ8qZrReHBIRXquScqVI+eacX+saHCIQxcXjKTjDazi6IzjLrmUGKNrSEHBjhArh0BpkI+kZ0owemJhxbWxvglUiCW1bk2iemNu8MyachffaqzIdJ81rB+zxzDpgAUag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/FIHydVNpAcIW+o4XUBaZpAnTpDmfptdhgr0/6ayVjQ=;
 b=WW60+Kq8xmYggJO8WM26JWuYuzSw6z5kagK+ZXt/IVCtoZsQ6p1jikrwaYsmfpzJz3h3FN8XiOilCoxmZi1Ink/bRyesHYv20llHFID/QAmU3ed+foKJi0KN+cc2Pd56JjTK7lGpXMBU6Ipy9YNnwuIJVhIPc7qvpSmHl+++T/rMKUD6KhnafSlW+df5IYmZyAf22iA+vzAoxPxJw3xrVoR0XG2cfhaPcsUWrzbVSyqgZcj87uziRSk3X9m2jqosaaN/4CavnuA2GjCgE3eT9sdSj5Psq+hCqfF9vbuxg577iFIvNjp8UX7I45HLPsC9jTUt++AD0oSW2kbsVAsHGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FIHydVNpAcIW+o4XUBaZpAnTpDmfptdhgr0/6ayVjQ=;
 b=VrRun/xJg9Zyx7qFrrhBvKWDUv6vqPFfz8syHlnO8Ur2CZ++BeV2ELcwRDC9fUM3foDbdhmlaEcS/ZPLct5uyIvvRv0WF6HTwy3Y02mmFQRY8s+YMmxMlCvUoaTv5dZok4VQc00yniNLxZezdVMT2fs7sr58BQFFbuvwaGBOx44=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <31e8bcf2-480c-4f32-8096-877a0fbd327e@citrix.com>
Date: Sat, 29 Aug 2026 19:19:09 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [RFC PATCH 0/1] xen/arm: smccc: preserve arguments before
 register setup
To: Jan Setje-Eilers <Jan.SetjeEilers@oracle.com>,
 xen-devel@lists.xenproject.org
References: <20260829021257.3310112-1-Jan.SetjeEilers@oracle.com>
 <5286d0ad-5068-43dc-b23d-e18f05ae4b64@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5286d0ad-5068-43dc-b23d-e18f05ae4b64@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0139.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV9PR03MB8392:EE_
X-MS-Office365-Filtering-Correlation-Id: 86237a32-2d26-43cc-6127-08df05fa06e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10067099003|3023799007|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	99Upn7RmXhOOBRxmH95F1YuvOU50UtoHsj8/rwMRACUfvGghuqcFQzVpyPFW1FfHgI3hgmcTn6Wt3bMpfVgXEYemvQVlmfTETtjO94uLQlDG0I95wnAbyct8GTHbbGJcbpeRK/6wXW/XowCKyhaPprlE7K9/9p0uBqQFjSNX9vOAA1n/YmvqahkWwtqvLFGA2+J5qAyqMQlDCdnqpm08IN7RGoFQvrQBD21cTa06szJf0oDAhjusMNv7GFbtC3B5Jwf3j1anfFJrxBsesntM+iqjhM1HkBxbfiStMnmZn+CvO0Yz4SUfxPPtq27HFA39/C++aj+m0p7+2Gzp6KAJbktkprRYow6uaAn1iWwT40JjI7ixtDL8Oa618NS/rZlM3P4zhQJGFgTLCYvM9FOHi8S7+eQXgV5cmK3SNFx3BgqWe3AFtT9ItI7O/hNUhvfWfQPlHjF1kSe5vcm97Tq1DhfxyCJRZaoyVHykaju8oHdbAjV78QMDGVtk/lKKvZDjKj7SX0Wu2IdugTeeQYvPO8WdZq73/tYHPmtBiW/M0qeIUJw4pFV5rIWJT+UjL42Vj4yLztycpYjyxTGItSbpX+oMQ+hrm7xVG8jz0MvAKUV0fi1sJbwsSviLuDlNTMkwLvDKDXZ0fXrD7gO196QYbF7/pXfdhEfPenX3OGRKbcs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10067099003)(3023799007)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0hSNytzek5pN0NwMmh2NEVoOEw1KzY4Vk95MDRFay81cDFuSUlNci84SjVk?=
 =?utf-8?B?eU5hNUpDK1UrMGF5eTRVTGNPS3ZheDU2MTIyeDBaTXBSeFMySDhaUWJEcVVh?=
 =?utf-8?B?TUwxcTVoQkFpTGFtRGFRWFMxczhETnJ2TzNoRjFhbVVYbDJUZE5QOXBPd3U4?=
 =?utf-8?B?VXpNOW1EL00wOEpBQW44WmFzaWl0VmJ0WTdsR0lFMU05K0RZaEk2Qm5wZVlt?=
 =?utf-8?B?MkJDelNNVkRhTWlYNVh6ck5XNlJVekJUTXBGN0pRWk9LVGIzd1ROcjZtbENL?=
 =?utf-8?B?OVBCcnkwTHBJRUZnYkN3eUJSR1IwQnUyZml0eEZrUElDOXN0WDNIN3NlTk5n?=
 =?utf-8?B?NFBvSExhMWp6UWpZMXlyN2hoZm0yQ2ZoU3ZjQVY2N1hac3NzQVhLMzBDQ0lM?=
 =?utf-8?B?SEpyY3BNUDd0SktFRkc3OVgrbjQvRGxkc202dEJHejJlSWlSVWRNUWZWaHll?=
 =?utf-8?B?Y0ovMjNKY3JjRiszK2FGYzk2T1oxbmZoS1g1c3JVQXovN0MrcDBvVmpmNy83?=
 =?utf-8?B?M0Jxd2VLQmJGQUcwT3FldHhXQ2o0dUdtVC9mZlVDK3FJVlFoajZ4d2VZMVZv?=
 =?utf-8?B?dmFmNDBRKzFFRVJsVmlGUDhDdUxLN3d6b2piNnBDUUdxeEM0eGJUNXIyMVBs?=
 =?utf-8?B?N3JzbDF2T3o5eGp1YzJaVlpyWmRHYzNIazZncFMxSDRaNjAvMFpnR3E0bHdS?=
 =?utf-8?B?M1YzMFRkcGRQcElyWHMwKzVtYTFyUEc1aUZxK0o4TEJpa1ZVbWFRVm15QU1i?=
 =?utf-8?B?aVhUMitEekRWd0FiemwyV0NKdEcvRjhRbTZlT1NBbGVZaVYzZEh3dlRPL1Zu?=
 =?utf-8?B?RWhxdlpLUVArZTFMTmQ0TTJhMFEvY0N1THFLN2NDTW1UQ0lZR0h4RW1BYjJw?=
 =?utf-8?B?cE4vNFdRTE12KzNyN2U4aXpURUtCczVQRGt0Ym5uTHlvUHUyaVFIb2xOa3J2?=
 =?utf-8?B?OXVXT1ZOQVVCSGpZZXorOFRtL0pRN3Mvb2xMVWRTZitUdVdxa2RYR0g5WFBr?=
 =?utf-8?B?Qjg2WnVlZ1NTdUVBNlljQmFvc2NodFN4aFNhOGFGYjBtK3lmMk1CYjAxQmRi?=
 =?utf-8?B?cTdac3ZKZk5DUDUzcHVQQ3FURU9DcmJFY295TFJDUVhPUnZzRDBleFptNVlU?=
 =?utf-8?B?bC9lOHZIcnFIQllUbEhFRW80YUxkSUNPN0JKTnFRT0ttVjNLbmlPeWs2aTlN?=
 =?utf-8?B?NUlwT2thdE16S2VOVGVWZFpONjNIdXRTNVpMSTREd2F2REluNk4xOUtmaDJ1?=
 =?utf-8?B?d2N0Z3VRVWE2bjJUOTEzKzlKejlrWXVYbVZsc3MwdERKUGhxZ3ZxTGd1cWxj?=
 =?utf-8?B?YWNmM2FvZUhLM3hQYjljMUJoT0tZcWZSS2J6TmlXaVh2YmplQkY4NCtDVGo5?=
 =?utf-8?B?RDhlWVZnd2U5WCthb2p2Z05QbmtuejhaeC9RWllEMXVSVHRiWVhySGt4VDNI?=
 =?utf-8?B?TzVuSEprKzlpa0FoS3gxcGUvVHdzNStMbS95Q0hLeWV3UnZJejlNNlUvRHBy?=
 =?utf-8?B?ZHl3d1JmNjVYWjZwZ2dSVkVUNllrdEVlZWpTREtuRmZDUHJOQVdKZks5SlhO?=
 =?utf-8?B?bDlzM01PQmg1dEkvMkhNc0hrTFIwK0FQczIzYm1PWjFqYWpRVDNwZ3VEa1lw?=
 =?utf-8?B?M3d5ZUk3bDUwOEhJc1JOelJ1VFV1SkVXZGJndnl5ZktUL1pTQkZXQVlkRWJw?=
 =?utf-8?B?RDJIWDdxLy80WW1RWnRLengwZi9SMk05SG1PZkdnSFAxYTNlZm1iRFk1S05H?=
 =?utf-8?B?UndVdUQ0OEo5aktCUUVqWWhnYXRZeGNzTTJld0ttSnFza0s1TDFNOThueWVI?=
 =?utf-8?B?Zmc3SWdsSTJXclJFNUNjemVrbWFLcUtmcEE3cG9SRlRhYytucXNyQXFtUlAy?=
 =?utf-8?B?V3JZSnFlT25wbTJZdEtrWSt6bC82b0prZTdRR1BtcTlOWnhQbjAvNW5GcHBE?=
 =?utf-8?B?cHk3TFdrU01LSDJNRHo1Kzd6bnhETDFYM0IyY0hEeExXZEdvVlBNcDUrMkts?=
 =?utf-8?B?WFVxVkMvRkpERFdjNDFaWXExUlU2dmR6Ny9LVGhiTHkvd0NXRkJDTzFDbktq?=
 =?utf-8?B?am5OTDZxTllTVFZ1RXp5VnJKM1IvUVUvR0V2VzJCQ3JZY0lQRUgwaHFabUpP?=
 =?utf-8?B?QTZPVUZFM2dGOGd1OE82azk2enVoT21KK3BVQ01NVTA0cEgvMFJVTElmSWhm?=
 =?utf-8?B?VGFrOE1FZ1FEd1BRVlhjbG5zZGxiTDNIczlrRE1DSGMxR1lnMVFLZ0FpVVR0?=
 =?utf-8?B?QWV6cndBQnJTNlJUYm1Cd0V5U2ozNk5JNDB1TndoM2l6SEZOUE1WYlB2ekJi?=
 =?utf-8?B?WVUxcnYwWDlXSGEvRlBlY2VHaUlqd3g2blhORUVYd216ZkhCQ2lPVkEycHhj?=
 =?utf-8?Q?X1FFRd5tK0iPLSlk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86237a32-2d26-43cc-6127-08df05fa06e4
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 18:19:12.6305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /BvFZY9P7LXe2KWvPp6MeNvBNl5VwZ0FoZZFyOFWPNuHoOV4t0xUk/HfrHvKNIBbvEgUfnIO/oJrznqpubn8bCm+dlh+ujqwuGduoMDsZg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR03MB8392
X-purgate-ID: tlsNG-c201ff/1788027557-728B62A1-FFD14896/0/0
X-purgate-type: clean
X-purgate-size: 2491

On 29/08/2026 5:53 pm, Andrew Cooper wrote:
> On 29/08/2026 3:12 am, Jan Setje-Eilers wrote:
>> Hi Andrew,
>>
>> While investigating an SMC forwarding failure after updating to Xen 4.22,
>> I found that firmware could receive different values from those passed to
>> arm_smccc_1_1_smc().
>>
>> Several public Xen callers pass get_user_reg() calls directly to this
>> helper.  This includes the SCMI, ZynqMP EEMI, and i.MX forwarding paths.
>> The helper puts each value into its SMC argument register as the
>> expression is evaluated.  A later get_user_reg() call can then overwrite a
>> register prepared for an earlier argument.
>>
>> The change in generated code appears after:
>>
>> 67bcf5eae709 ("xen/arm: Simplify type handling for SMCCC declarations")
>>
>> I am not sure which behavior the helper is intended to provide. Should
>> arm_smccc_1_1_smc() continue to accept arguments such as get_user_reg()
>> calls, or should callers save those values in local variables first?
>>
>> The attached patch is a candidate for the first option. It restores
>> temporary variables inside the helper, allowing all calls to finish before
>> x0-x7 are prepared for the SMC instruction. I am not able to validate the
>> public SCMI and ZynqMP paths on hardware, but their generated code now
>> finishes every get_user_reg() call before the final register setup and
>> smc. With this change, SMCs also work as intended on the device I'm
>> using.
>>
>> If the intent is not to accept function calls as arguments, we should
>> probably fix the SCMI, ZynqMP EEMI, and i.MX callers.
>>
>> Given the existing use cases, this seems like a bug, but your patch looks
>> intentional. It's very possible I'm missing the intended design. I would
>> appreciate your view on the intended contract.
>>
>> Thanks for any advice or help with this.
> Yes you're right.  My change was buggy.   It was actually part of a
> mutli-stage cleanup across several patches.
>
> I'll submit my own patch.  I'm afraid your AI has put in whitespace
> errors where a straight revert would have gotten it correct, and left
> the 0 case still buggy.

In fact there's another bug.  The SMCCC ABI states that certain
registers are clobbered, yet these are missing from asm().

It's also sad that this macro maze goes to the effort of making a
function-like-call which can return 4 registers by value, just to then
force it all to be spilled to the stack anyway.

~Andrew

