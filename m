Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F57606A327
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 11:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=E/CqBThT
Received: from list by lists.xenproject.org with outflank-mailman.1468160.1677237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNqZh-0001Sb-4c; Mon, 02 Nov 2026 11:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468160.1677237; Mon, 02 Nov 2026 11:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNqZh-0001SU-1f; Mon, 02 Nov 2026 11:51:41 +0000
Received: by outflank-mailman (input) for mailman id 1468160;
 Mon, 02 Nov 2026 11:51:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1xNqZf-0001S4-VV
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 11:51:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNqZe-00GcBY-RU
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 12:51:38 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ae87948-8faa-0a2a0a5109dd-0a2a4508afea-6
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 12:51:38 +0100
Received: from [52.101.56.18]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6ae87949-f659-0a2a45080019-3465381223f0-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 12:51:38 +0100
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH0PR03MB5955.namprd03.prod.outlook.com (2603:10b6:610:e2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 11:51:35 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 11:51:35 +0000
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
 b=QoYwtMhsEvoVHlktqzrtAMxoyhRjUKUX316c3giWt0Jy5UPGYaUWiL86kkyPHDwBuHpDm/47LZgEZuiS9YBddLYpjM2Ia2yBwrTKontcAfUR9f6B5IXBCBDU/5K4IXy03BrNW4wgeDa9jRD6gBRTHhwNxC+P0ROCUMgltkEgtEnhPYfl6W5cDzKwnsacnug5jzkdRtzVLpjAroPe0W6gVtCPrVd6d7OnYUMwI7aniJUZ0OaDIc3CrwQotKRfaD13RJ0GdPBiYTVFlSqN0Cx0QvBKGaIpdgg1LzjJWrqutQTEwCgOqL2fUhmPIHTcM3RJxpsJ8PEWKT075YY2GzeczQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXZ0xMW6+MBQogWrz1Q3owAjfNm5L+NUjXnP8kPgDtU=;
 b=QKnMyZP3Ba6RvRYW/0Lm+gSel8aIAF4eTQFWa3ifgit8GG3jDUpxZODHlDBNdjbDT8U/6/f4SNjGQ6ZRUI9Mrr4B5YF6lXVee1G/6MvEcUSszFK7+usFQGB1UJhhFowsX9daQkX0Rj9rcZWIugKIh70ECwpKJPlcd92taox7RtijR0lTaRWHFfm7UrMzCfXz3Bx0u0ym2BfkFAuVBLthi8GaWibbH+42TiRBdwUyam2IlhqnuKmB7AF++IWn4v8V0KKesyjYP1hQ5gIRLM21vphbvS5iIBs3zXMAByLroGr0OgvO8jKpc94In+UBw6EWz6PxCjVCKOHaC27XnaNrDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXZ0xMW6+MBQogWrz1Q3owAjfNm5L+NUjXnP8kPgDtU=;
 b=E/CqBThTRFNyxzEHDU6Z4sg2iZ0XJuDINmrzSlwf1eTWfIQXUiN/jS88N28atrxQ8h3pfbY5SO7DkfK8ePuTYZnuUEdzOjR9WYpej2BMr/71B6DqlB6+LLGceo1VyZRHAcsmHQzyk4reKwUq9iH+ZK83SQRd0zPCHulOlttOfJk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7a2732d9-8d3c-4e7e-b0b0-1d4ba96bf6ea@citrix.com>
Date: Mon, 2 Nov 2026 11:51:32 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 1/2] x86/cpu: keep cached TSC_AUX state coherent with
 hardware
To: Roger Pau Monne <roger@xenproject.org>, xen-devel@lists.xenproject.org
References: <20261030132419.84264-1-roger@xenproject.org>
 <20261030132419.84264-2-roger@xenproject.org>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20261030132419.84264-2-roger@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0431.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::22) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH0PR03MB5955:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cab7431-115d-491f-ace4-08df38d7a53e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|261021121427099003|4143699003|11063799006|56012099006|261009223027099003|261026121527099003|261022075727099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	W3tnqPoHeh6CIMhOHlxSZiSzkpEXsZ1bsDhf0IeewvpNTcy61G5fgvJNJhD0xdddD5+Wk5yOo3t0IQLwsPsr+LNY197yYx3uxTHb0n102v7TpveZHxNzTsI5vVXoA4vB1oBQjaQ8adhm2q94XklN9NpgXLgR7WKin8CBlCqavyoR0G2oxsuGncyDhQafyzR0Z7NVpxxh1GdOVgyGcbG1pDBSS9DCacZoQHoeIKNW3JAFKJx9/83NyPFIT3MiEQlG7YB8+hepuzEgh6Hx9AdVOSLekVrK2/W5mT3IJWyX5eLXf8i5wmW1r89w5i8oLqV5om7TCVvE5uMPbAuqEcK3IVdO8bVR7n33//xkZKHAqy3NKvDMvlj+ZoTlxXuGhOEEfO4X/KIeFQjKI7MVvjlX+NaMlSCW5JFlLw3BBC+i/+HnJtzMuyektV4a7JUuAbKEkpuy8n+SRH91MW/7WidamwN8evTKyU+CjcPGnSi3cUgft9gJ+HNmSEWr/LsgsRKYy7CMCJ5ykPc9kBwshS1L3kW18WD0G11X9g8dnX8Z71KerxXsQQ0fXsoP3n6FIqSJY0xtVdSuPl6wgm1ABq8AnyCqun2Tzsg8d3n4KzFo0DiQl/Au0Q5Gi04gGX1t6WzgPVmyg6vIpgY+vWMT6x3DBR84NtgTwWMNJlMZH7bgY5U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(261021121427099003)(4143699003)(11063799006)(56012099006)(261009223027099003)(261026121527099003)(261022075727099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1FXTUF2MTJ1bzBMc0I1bGFzVVRJNVdlS1JLbEtwREhVeEhhQ3dtK1ZRZGVH?=
 =?utf-8?B?TzVsd25CQm1zeGNORVZnVmlQZXNVUWt6OWdic1ptemxyeTdkbVBZbURxODRa?=
 =?utf-8?B?Q1hrVzZXT3dlV252dWtzaEEwWkhCaEF6QTNhcjZScjl4dG5MTGt6ODg5Rmcz?=
 =?utf-8?B?SFF4SmYrVE80ZldMV0o2M3E5NU1XTWpKb1V5MllDZ1k3Y1YvcHI0eDFpMU9Z?=
 =?utf-8?B?bWZUNlEzUnE4eDI1STVXYzhqVm9VdFcrcG00M3NaV0FabVN0MmxiZ280V1lO?=
 =?utf-8?B?dDhsN1BrQXBLYVNBdDRsbDJXVkVhays5L0ZNRUdNckxBaVd2aXRwdlFIMlZC?=
 =?utf-8?B?cUxTQlRMbXNhQWl4dGlKZHRwM2lBWk1nL28rTU1LWkRvaDlWMW5FQnd3SzhJ?=
 =?utf-8?B?c29HTjZEK3N1UjY3NzFmb05jYllBYXFGNXUyMlV2S0M5REJ2NXpOaGpzSUpx?=
 =?utf-8?B?OVdPSnR2bURka0I4dFpFcE1pSllGZW9USkdBZkFsWHVNWDlwSklCYmdvR2Zx?=
 =?utf-8?B?S2Q3dTl4MFBtVS9OMDhvbmUrUmRhQURBcTUzS2FvUGpiYjYzVG5nQy92bXNl?=
 =?utf-8?B?R25tRlp6QTJCd1hpKytkaEpDRUhJd1dIOWw3MzVIL3lQbFk2N2NEZkVveXR1?=
 =?utf-8?B?dXdCUGw0TnhwT3ArVkdwSERQV0lTRkZxZERoTU1OK1IyZ3htdUtSRVhhZFZD?=
 =?utf-8?B?MTBOWkdpK1F2UmFoSXFia2REcXlyVTJ1NFVQK0xaMUtMdEFFL0xmRWNheEdO?=
 =?utf-8?B?aHUzb05pUThYVTVzbFByN3JTMHQxR2pSTGYwbjJPWk5wUjdBRjRCLzVzdGoz?=
 =?utf-8?B?TUphRmlkbDl3WVp6T2REWHFaYzloRGJmL2pzcURWd2lzVHlRM1V6N25DOGdm?=
 =?utf-8?B?UVQ5MFMyYVk3TzdsbTF2ajJtejFaMDluc0IrUGNEUWRCRzZxR3REejZGL1or?=
 =?utf-8?B?QjNrUkNrOFgrZzIzcStweS80bkFUbENTK3lwMFVJOXRFbXN6NTVySjNUL2tG?=
 =?utf-8?B?SkxRMVFjbTZ0UE9uT3hKRCtwVytQekZtcUh1bTltMXlja2tvY3d6QlRUcHZ0?=
 =?utf-8?B?TEJ4c1NpMTc2MXBuZjVWZVJIelN2SFZVUkdiSC83WVlXOVNjbThrdDRRTjhT?=
 =?utf-8?B?V2JncWlrcjMzbEZyY0ZOa1YvQlRpczFBTFZhd1ZHejFZU0dNbHdOWmRoZzAy?=
 =?utf-8?B?Wjc1L0NnRjZrTXIydW1JNkhyeGUwUlJ6SXRUU0psVEJVNGJ6TlpTSWViMVU2?=
 =?utf-8?B?SmJoM2pnR2FJZnl2eXdrU3dmczZFcksyL0xycUVmVU9rUDAxbzNTaWJKUlRG?=
 =?utf-8?B?R3IwY1doNGhkOGpaYndOUXgvbnhSaXd2LzMxeVk0dkY0SjhtWXQvblNQZU9V?=
 =?utf-8?B?cTh6OS8zdEpmN04xbFIzRzdkS3dBdFBhWWsrcjZXNFY0UHR4L0t0UnZoU05j?=
 =?utf-8?B?cVg4NUp6ZVkxdDNSZUw1VWs4Z0lPTXVvYnZTYnUyMm1jYmZSenhyQVVuMndD?=
 =?utf-8?B?VTA3Y1d1bDMxWmJwanlmejlOWlFSUHdiSldnb0p1U0RNVjlJaGhqMkRPSXIx?=
 =?utf-8?B?Mkx3dnhHMCtjcWdvNVBsYkd5ZE5DVkppeVdoelF4YS9YanFyUmR1YTJETDFz?=
 =?utf-8?B?OGhVbkc4T2R1cFZGbFVhTTlBMnh1SlBpalg2Z2R5dEpleWxLV09PVVJ5ZDVj?=
 =?utf-8?B?Z0E5ekk2TldoZzZDTWg3SUVTUDF2VzFGcDNrZHhKU2JRT2duY29YTnJMS2Rt?=
 =?utf-8?B?ZGM5dmlKcXpDWk94cUQ5RHNQaWNGWFhBcjJLSEVqL3lyTFhDazRJVWVRKytq?=
 =?utf-8?B?eTdsb2xOcFpqRituS0hZeVVxcFhRKzhiREI4SzlyemtGMDltMWVsVE05Nndq?=
 =?utf-8?B?R2p2OERVaWFyZElNcmRzMS9rNjRTaE8weDliTzJWOHBWMDByaTcraldSK09l?=
 =?utf-8?B?QmRuLzBQdFhUTmhCR0VpTTVPdzVFcERsSTZnYVlDcHRuOFQxU1RzTWI5RTBX?=
 =?utf-8?B?Y2dIOXZVaUVjMEZqWWRBUTBKUHZDZVo1bWt5dEp1eVg5NVRSWFNrbXFwY2Yv?=
 =?utf-8?B?T1hkYndxYjdld0k5L3p3S0Exdk14RmkycVBhMmhNTVVOTUJ2S0hUVFRBQlNp?=
 =?utf-8?B?b0RiSXgwc0loRTlJS1o0ZTBkQkp1SU5sZEM0SDFaeEQxR2tYcTVJOWpLVWl4?=
 =?utf-8?B?RHJOYlliSVNnb0t5eHNqRnI5YjFtSXJGKzYySEdTV2owVUQ4aWc4UzlYVnJq?=
 =?utf-8?B?cDFyeTd4MjdZWXorNjRKMVJKZDB5WHdaMXU4bzlUaU1RMzFUQVB5U3BCeHFI?=
 =?utf-8?B?TUVoZ21OZmxsQ0pKa2VzeEd2b3liVkFVOC9JcG0wZzh2K3EvM1BVdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cab7431-115d-491f-ace4-08df38d7a53e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 11:51:35.3189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1qVc8DDp9UOS92fyXgRrpgrvg3stpFg7JJS2SqFCJWKN8SYF7h+qMGSeFHzmKyXzbCGPCQ/RwXHlVEiOcH/yN4kuj4BBth+KkeQjsTFFGpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5955
X-purgate-ID: tlsNG-c1860d/1793620298-D674387B-2CCBD016/0/0
X-purgate-type: clean
X-purgate-size: 1100
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 30/10/2026 1:24 pm, Roger Pau Monne wrote:
> On CPU bringup don't assume that TSC_AUX is 0, write 0 to it to ensure the
> per-CPU cached state matches the hardware.  Also propagate the cached value
> on resume from suspend, in case the register value has been reset during
> suspension.
>
> Fixes: cc0e45db2779 ("x86/pv: Avoid leaking other guests' MSR_TSC_AUX values into PV context")
> Signed-off-by: Roger Pau Monné <roger@xenproject.org>
> ---
>  xen/arch/x86/acpi/power.c | 3 +++
>  xen/arch/x86/cpu/common.c | 5 +++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
> index 3452650a61d5..464846e73727 100644
> --- a/xen/arch/x86/acpi/power.c
> +++ b/xen/arch/x86/acpi/power.c
> @@ -279,6 +279,9 @@ static int enter_state(u32 state)
>          ci->last_spec_ctrl = default_xen_spec_ctrl;
>      }
>  
> +    if ( cpu_has_msr_tsc_aux )
> +        wrmsrns(MSR_TSC_AUX, this_cpu(tsc_aux));
> +

This wants to be later, with percpu_traps_init().   It is not critical
state to restore this early.

~Andrew

