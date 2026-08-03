Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8749EC55175
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 09:14:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381313.1624876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqoko-0001bJ-U3; Mon, 03 Aug 2026 09:14:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381313.1624876; Mon, 03 Aug 2026 09:14:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqoko-0001bC-Qy; Mon, 03 Aug 2026 09:14:38 +0000
Received: by outflank-mailman (input) for mailman id 1381313;
 Mon, 03 Aug 2026 09:14:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wqokn-0001b4-H0
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 09:14:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqokm-00E9gR-Tk
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 11:14:36 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a705bfa-5cb7-0a2a0a5109dd-0a2a450296ec-4
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 11:14:36 +0200
Received: from [40.107.200.51]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a705bfb-6ca4-0a2a45020019-286bc8334d66-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 11:14:36 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN9PR03MB5964.namprd03.prod.outlook.com (2603:10b6:408:135::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 09:14:33 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 09:14:32 +0000
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
 b=JxaNim8YFCvhgZdYlREAR01MiL/ri+NfUnf2921a675RKSIQz5BwvTjRG1dLy/Bz55MntAYlFdjnSHIHsIR6EbB8O+O1fDrNdYEq8OE3Sxq1FRnT6bt6N5Y6b8w8jS8JLoA1iIYEaFQIqAonm/nPXsgqTcg4Q2Iy60HfslwPHrl361IisN3YMwrcWMoW0gCtYPhmR7MsbR/Y0Q3XT/CuTUz8NFEJ/nURXoJnDcfCEnxN1410qdCZ3nFdFKZ5pzdvsWMhxuKkdkUilt+ETtqiXf9sIc/SdA5ydEuBuV/E2EqgoRD5Zqx85B30F/dWUtcaM0IUSs9JMqqHqR7I1aCNAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQe3jkA8rX/YsH8gkWg7TjQ13snFQ+1/VGMhIr9kwU4=;
 b=EY68H5IbfDmFpx0uEOQYNK/oNt5uI4fdC7pC69KgiFA9HyQqftJPygKn4mGI3k1ST3pCjzMZvc+HF/xUfVfwMAg/qSzq43J67E/vXlX82vPl7893XReVR12/8YkBJ5W7P2IfG3kiSBziW4WujQNO9iFpUa259HUCouTD5R7giuszwQ6syhn2BzLVJdN/2XxQUCJvzf4zwUIeHLNfAfczFdDp8gAh9oTw1y1P75vZsEGHsYkvLyjxtb+9qQAMsyl8Tp4XbMnl+iz/InX618bVtNMdR4y+q7VIG/icRthElt6es7XElrG6VVnB7xSstSeZZKaBqh6cc+pLoHD3mux0lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQe3jkA8rX/YsH8gkWg7TjQ13snFQ+1/VGMhIr9kwU4=;
 b=jgnr28Hngb4wyyORZVRHjkhTAKusZhHeSyPXF0j/WkeTlVJPhZ3LM3Y74cuRg2Zv0JOMGFyWwhIx4lwx9p1+Kg7+BSKS1DlM4KglM7+pej2acJTMio133+ztpUnk+NYtqKNJVFwKiVqrMHwtj35pp2qvnaTK1U/JtU99I+wlKbo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c97a44db-bf91-4d22-b775-190e69741dae@citrix.com>
Date: Mon, 3 Aug 2026 10:14:29 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH v3 1/5] x86/emul: Introduce x86_decode_lite()
To: Xen-devel <xen-devel@lists.xenproject.org>
References: <20260803072006.9678-1-andrew.cooper3@citrix.com>
 <20260803072006.9678-2-andrew.cooper3@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260803072006.9678-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0699.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::6) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN9PR03MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: e09100be-83fc-4536-b6b7-08def13fa14a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3KeHgKs3cFMRuOxCct5/itLB517SBhAFWCuoxGKRRCFuxbiDZEOTDLD5+JC1rLQxvAY7bBZnzugits30ajjQLfuRceUghWGAOiBK06IYhtqa9u36zkVamR3n2EkNMTQtXXVmElb6pOQaq3MSeic40qaNAO7wEWVkuW96Y2Voa1IP40nFJoXqCk+lDIgW0zfC5JNr8qtHoVYO0i3/mARhVHse/UA3hzsUVaHZuNEPyCpS+9Xv46rNzPIA0Ap+0t0yyJN+0zxPq5HZwWJHPuevemj6WDNYpxQxCASdozXAAz2xkjm7fo/oHy+esC8g03Bpc5OYp8NGorK8oMdaN7eVjtxrxcuquo1k7DL6r7QZegVrzefg2HNwv3lktfGn79kk7mFGaOxf/cblS/TnLpqRO/xKUvRjA3qPNPm+rhuCqFZ51zHxtN3ndKtA4LlWOYXfdaP3zOdLMbQo7BHkrNSVgiGH7A45OaiYNeXSJJyGL2kh+SIGvtmrptX0V31ZoS3ARqBWTpEJtsJpoVhZM93gpLbWAVJXRhotOWfPVmxFz0l8lyCTnEJlTvR+rQc6fRihLocJshtXG1uE+a5q+mJQZhBNSoRKtlve1TaagGT3ijVwhoSza9t7PxNo1+wZ1JqNFXxhkEtgjlG0fyFlGeEyS3/8XrKeC8RvaWcbhweJfUA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkYwOVNGa1Zwb0tCN0ljZng2bDFGOWdvQzNpNm5rMkMrRFk5Ti96YmhkbWh0?=
 =?utf-8?B?cm4wSFVhK3FvWDkwZTBYczgrU2VCdXpKSGJlWlI1TVpiYVNUWkJaQ3dvMFd0?=
 =?utf-8?B?ZmZ1Ny96NmNtd3JZZUpKU3Y0MGZ3ZmFNMUxRWlUyQlFZY2l1bWNneTVQV3M4?=
 =?utf-8?B?a0ZNdHRHY25DKzlsRmd0bEFGaFJub2phdDZCNXdKK0xIWHZucGdPTmFMNFBt?=
 =?utf-8?B?MUN3VEErVkd2ZTBJVmpVOUJOVk1uSnRkdEkyaFBPMXVkNXEzSFZTYkFQMXJC?=
 =?utf-8?B?bi9nbFZIWjBQR3gzaEpla1RxSG5aRDIrYktqOXd1UXlmSE9CWWFUVjVpM0lO?=
 =?utf-8?B?czg3V2gwQlRRVmUwWVlzVWdyYUFlK3hyd2hiYVZpb1FueEN4VkFBL1RaTEcr?=
 =?utf-8?B?b1FIYzNwRTJaWWM4OXhtRVpZVVNqWEZqSEFDMVAvemdYT2NISldmUTZrQnBD?=
 =?utf-8?B?dDY0bzZRUk9GU0tLa05yRVd1MTdBdG5CVkVWZVBrS1ZHeVdiQWJUSWZINEk1?=
 =?utf-8?B?cThTa01lN25zbEcyTVhpUWRyQlh4eXZGdit2OGRVOW9OcVhZa0t0VHh3Z2oy?=
 =?utf-8?B?ZWNJMFJmSU91cUZSY0dYNFZpKzBTK0xWK2wwQkRDMlhXSkxtcG1SeG12VW02?=
 =?utf-8?B?MkJFcHRVSkRyRld5VHdiYXFIVDlxZzdTZ09zckY0T2plVnRZV0JQWklkeVNP?=
 =?utf-8?B?enBtNlczd21WTlgyNnFtZXA5MVBPK2g2VGxrVS9TVzcyTTE0cFlTdkkyb0Q0?=
 =?utf-8?B?SFJVWU9saHp6T3lzeFhRY3VPVXV5V3BGMEtOOHkyQm9zSnowZzJXU1VkYU9X?=
 =?utf-8?B?cmkya1RKTVd6bUFyRkNDU1FiV1lzdlFrdTc0UjN0UzBFZDd6VkRQVWo2bzJR?=
 =?utf-8?B?R1cwYzFvQXBMWi9MUERUU3dCNWFDaDZrb0g3WE1EL25CbGxwWUMybEMyVTMx?=
 =?utf-8?B?aVVIOHNTV1BKbGNTNnYzMkR3SnJXYXJtRW55eXRJMldKOCsvZFhkR0JmeFd3?=
 =?utf-8?B?WlBYMnZWdEFzWUlkc0lvTDF1MUhjeDhMT3lxbGN4QlE1NnFvUUdLM3YvRUln?=
 =?utf-8?B?eCszYytWWThwc29jS2NINllxN3p1UUx2VkFwZ01yRlBVc0FuNlJsZTVzR1Bx?=
 =?utf-8?B?YUxkZzgvSWUwU0JOdWYwNjFQSmRGeXlrMHlJbVpuU0VjUm9RV1VKajJrOHdH?=
 =?utf-8?B?a2dzVFlNaXh2UGtSMVBNNmJpdWZEcE4wUURjaFNzejZyNFh4RW10Y1U4TXpB?=
 =?utf-8?B?ZXdreTJ3RFZhdXRHdHNlVUVGVFpGellaZkkycStGNDZzTTVaNi9IdTdvTFZP?=
 =?utf-8?B?MUdzeWs4QmRUVVZZd1V1cit2bEQ5SHhNc1A5Y0JHUGtNMmpRZVhuQUZZUXNF?=
 =?utf-8?B?U0w5NkI0MGVIWHJjV2l5UUxQYlhCc2JPZVBjZVFtZUp6SE1DU0hjM1ZZL2FH?=
 =?utf-8?B?UjgzSWpHYjZqdVdjT2VOay9GaXMxQytweUdRcGljL0VBdzg3RDdsVU4zWFhX?=
 =?utf-8?B?c251TFBpY2xzM1JXaENZY09DWlFYNmh3cm1KS2lKVHN3ZlBIemlDRG8xVlBa?=
 =?utf-8?B?a0I5OFkzTUU4TVNnRTI4KzVrRUhrRks1WExyWGNRa3gvR1JRRGQxR0UxTmZo?=
 =?utf-8?B?RVhFdktGVmxuQ2tlVGF0Vk1TK2dCNExaSDE5Qm9TUUIzeUMya25BSWRJSFlE?=
 =?utf-8?B?T0lrZFBrQkVqY1YxUXJpL3NOZExwc1JZaWJ1RFFodGRDK1FERXJ4TjR4bzRJ?=
 =?utf-8?B?MUEyUzlHWTVxd2lzanRYNnlIcjBibXdQblY5c0lxRWJRNmpTaVNpMTRySWE0?=
 =?utf-8?B?dmJPNW00cHFsZWROS0tZd3hQRmJ4aUhUS3pWN1ZWQVBoSEFtTklkSDJsRDZw?=
 =?utf-8?B?NVNHUU14T3M0R3orbnFSVmY0Zjk5aTZ3UzBsdTFmbmlRNTlSN290TU9uOVA5?=
 =?utf-8?B?UlJWbEF6cDc5UU9SdlVjckNabXpDaXllNnpWN21rK01sUUswVE9qTHVUcEQz?=
 =?utf-8?B?aURncHA4M0ZudlhzUWlPa2lPaXBSZ2I5ZlNOd0owYzJqVUN5Vmg3NHloZkpN?=
 =?utf-8?B?OGVvV1RyZGN0dXJWN0ZrMDhFUXF5cjVMUzVLLzNhd1NXWWpaUXRrWHdRMVRF?=
 =?utf-8?B?d1c1c3NUQkg5Tyt5YXluSGNZMmJlUlI1ODFsTU1NWWo4UXRZeVFHUUUzSjNM?=
 =?utf-8?B?b1BPVTh2dy82ajRQcTlRNllDem9TS01PcHFIak1hRGpNOUpMd3ovRFdVS1NM?=
 =?utf-8?B?M1hZWmlkNjNJZ3JZYUtRb2NTRDhKbDZPdThlWDlQRmxFSTBMbmN4cnJ2cllz?=
 =?utf-8?B?VzFOKzc3MndHU3lLQTVRQmltbS8wVVdBRkU1cjJFWkN4SGRLaFJhUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e09100be-83fc-4536-b6b7-08def13fa14a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 09:14:32.5341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9yMmWBsBBn9yOgLW3WjATjIusFKoo3jox6QQgGRpLLF2h0NRH4zp/jKeeBemqA4y0FqptvuVNiqE6EKW8yrLxAQl6qCOeMP2/ynNi3agj7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5964
X-purgate-ID: tlsNG-720697/1785748476-319CB2AC-6A2C863C/0/0
X-purgate-type: clean
X-purgate-size: 2256

On 03/08/2026 8:20 am, Andrew Cooper wrote:
> diff --git a/xen/arch/x86/x86_emulate/decode-lite.c b/xen/arch/x86/x86_emulate/decode-lite.c
> new file mode 100644
> index 000000000000..131cc07d5516
> --- /dev/null
> +++ b/xen/arch/x86/x86_emulate/decode-lite.c
> @@ -0,0 +1,330 @@
> +
> +    if ( d & (Imm | Imm8 | Moffs) )
> +    {
> +        if ( d & Imm8 )
> +            osize = 1;
> +        else if ( d & Moffs )
> +            osize = 8;
> +        else if ( osize == 8 && !(opc >= 0xb8 && opc <= 0xbf) )
> +            osize = 4;

GCC 12 does transform this into sub $0xb8; cmp $7.

> +
> +        switch ( osize )
> +        {
> +        case 1: FETCH(uint8_t);  break;
> +        case 2: FETCH(uint16_t); break;
> +        case 4: FETCH(uint32_t); break;
> +        case 8: FETCH(uint64_t); break;
> +        default: goto bad_osize;
> +        }

On further consideration:

        switch ( osize )
        {
        case 1:
        case 2:
        case 4:
        case 8:
            if ( ip + osize > end )
                goto overrun;
            ip += osize;
            break;

        default: goto bad_osize;
        }

drops nearly 10% of the function:

    add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-91 (-91)
    Function                                     old     new   delta
    x86_decode_lite                              972     881     -91

GCC clearly can't reason about the relationship between osize and
sizeof(type), and needs the help.


I also tried the further simplification:

        if ( osize > 8 || (osize & (osize - 1)) != 0 )
            goto bad_osize;
        if ( ip + osize > end )
            goto overrun;

        ip += osize;

but interestingly this delta grows the function by 30 bytes.  It only
seems to add the block checking osize, meaning that GCC managed to
optimise away all of the switch dispatch previously.  In hindsight this
is probably quite easy; because we're 64bit only, osize only ever has
constant values that GCC can see.

Anyway, I've folded in the first optimisation.

~Andrew

