Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01120C55ABA
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 10:39:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383271.1626533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrZ1e-0006pN-2E; Wed, 05 Aug 2026 10:39:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383271.1626533; Wed, 05 Aug 2026 10:39:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrZ1d-0006pG-VP; Wed, 05 Aug 2026 10:39:05 +0000
Received: by outflank-mailman (input) for mailman id 1383271;
 Wed, 05 Aug 2026 10:39:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wrZ1c-0006p4-5f
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 10:39:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrZ1b-006oEi-FL
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 12:39:03 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7312b8-bab6-0a2a0a5309dd-0a2a45099690-28
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 12:39:03 +0200
Received: from [40.93.194.57]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7312c5-be1a-0a2a45090019-285dc239327e-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 12:39:02 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MWHPR03MB989486.namprd03.prod.outlook.com (2603:10b6:303:2a9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 10:38:57 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 10:38:56 +0000
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
 b=W+W0g7/jedY1MAiWaM+j/HHgLKK43EDgPP5ZKUZbA+0GpBGx3TqCYZBruDtefgL+DoYkpIeOh/NArljBSAKBJgT/vje5qKaRr7VeEZ1/487v/B/R56mBEic5csRIIV9qNFXfQgUJqpAtlkR9ZkWFb9kTssxtZVOIOG3x/AoCV0DP2ahZhs55+9JvodhUz8scNUmbH6QtXyj/3pBQd0nDo/XHbH2E8vhxsgroJnRdggtfri89fkIKH3G8AgB/sROWbfmQQbG0xnN7/JHFrRvKQwcpB4veloBgiatApP2YjS40o8Uf/tnRp/2tQvpNj0cs0/yvavvOmg2m4YSB2VLXiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2G36z5DJb7tx78qIdEDFAy0U8RinsowMaCbqdgXZMPI=;
 b=WYFOCygKpXVYtEJG5krxU9Mo3MGwgkEmxDpnNzlgUOhy/fZN9BiQ4SxKQKypwPXMqn0GlwpQaEEPIbKRsZBTblptXvABhZQzi2+/zVnZHWM5FOVxOd2ZDpF2UAneYxK7Awcn62mcfls/Z4mjzTKdT+DwHzEFpQtgKfNfCnEVLNhl2WNrcfEpE8yKYnCB4ds/suPAuh3U8FJrPfqIGbB71rgKaaZLs+K5ksqEqdLyELac+AtfneDYjaUImf08JyGk1zeDWYX94MlP2DI6z8mR0VGkh5xQwGUIsrwwff7sN9r3H0t/80D4UNnTffjvIF1RPp89o4KcW+tfGIEoiP9uWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2G36z5DJb7tx78qIdEDFAy0U8RinsowMaCbqdgXZMPI=;
 b=A89ChuRU3tzrBtdAZT20KNxmV90Bq9ZIg9PajTv6v/+9zQg5YAm3pRWtnpDSdbGAytSs8YIN8l4uVDEMo2J1mbfTY12R96AeaI4/tXCYVPpRn5I+QFkOK1wtCgXY8BoLbpvqXU5tVHnJhh68wk1AypCQ1CE+kKAw/igeUs7Y9Ug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <81729a84-dccc-4470-ba91-4e7689c387fa@citrix.com>
Date: Wed, 5 Aug 2026 11:38:53 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH] x86: reduce dependencies on x86_emulate/x86_emulate.h
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2a4d839d-44ce-40fb-af7b-5becd878c9fc@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2a4d839d-44ce-40fb-af7b-5becd878c9fc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0059.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MWHPR03MB989486:EE_
X-MS-Office365-Filtering-Correlation-Id: 074451f2-4208-40ac-5bb5-08def2ddc0a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|11063799006|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	m/YUzdVTEsZR0jLwB89c3a2t3NCf4AhImO3LMjphJaVgAdFEGqlCZiC1qk1Z0+ehyBrI2CZWJOWXNF8q5IYcrM3OAMYNh7mluVpX46csquPT0dLapsa3RpRaTi9ViXqTgXjJyKOD8tj0kQCY+0DEif3JGg5TWpug9JR7bjQVfXFhxxbqGiQwzX0ERXmiHJ3QbSIDHwGATo7VSWXCD36s42er+n9OJ4PerFQCOsU2d0VlkzAT2e7UXtpphj7o9TPTjgVUlQL8jtF0yc2CoX1JfpR1f9ku45LA9j4ZUMdt0YHAdYV4cIMFQyf8RC+/3COFO/jZzJqW/P7o2Q95RCYAb8F0qvxSzdHq//vEhQGRtrNPfEbaaQLk368PRug0pNpnH9lRXpJ135qjrM3u/PXFqVIr8A21wPdKMc/itZ6NkR5AnYG7KCDwbJ663jt+i/kPudsPDLzgj0Jift0gXk1NQyie5y2nV8WBofTSFWB67jeWnsNtZZea8jjyj5KKFKtJIF0SWnXUjc0uGG/+w2TZbrXUbcAAv0z/lLQHaYdJ16rFxM/m+C7HvlGqfnBidLqU4rVSxj5SvsbkeXiUHRhvL3b14g1tiH9NATGfGnsSQbnyxF3BCWbaszmvojnIc95GIBSufzEFvKWruKeVuMKOauNqXxD+LVKu64lIRAqo6xA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(11063799006)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2g1SnBWajBuc01URzgzcWNQdmUxem1IdjNFQm9HNDNQQUhtbUlFRWlKS1Bk?=
 =?utf-8?B?WlRUalMzQ3hpZ0V4STMzNk1ZNEE2eU9pR0ZJSTloVUNRbU0zVnlLc3Q5N0pz?=
 =?utf-8?B?WU54T1ozMlRmaVpjVDVQOGRack5pcjZ2WE14MFZOaFBSSmw0UGNuS01nVDZR?=
 =?utf-8?B?K3hQT3hqTWpIV2x5WGZZZkVFVG5zK1JBN3ZuRzJROHRhUS93UERLQW54U2ZK?=
 =?utf-8?B?RTF0TnVnQnhsZGVMSEUwVEQ1VzlKNjBVMTA5RldOVEczZ21lQ0xWRTduZGRl?=
 =?utf-8?B?M0RacnhkNFJEUmxOTnZQRU1pd3RDRWRpZGYzcWt0d3JucWJaeEVxOStZWXUv?=
 =?utf-8?B?VHgrY3hlekxSSkl6TGxvN015VDR1aklNVHpiS3k4Rm1VaitROFduNjdYTWhw?=
 =?utf-8?B?RUM0Z0JadW1HR1NYQUlnZk00R0V0am1lZTdUcmN6R1BKclozdy91SUxGUGd4?=
 =?utf-8?B?VUpJWkhnaGY3Uk9qWGF3TUtKWTBaTXREWUdOL3ZTMk9qQWl1c0NGU3VIb3NH?=
 =?utf-8?B?NHdrWThDMGI5WHpLNlY4RlhLWVN6anVLbEhrbGdsc3ROSm96S1AwMk9DOXNr?=
 =?utf-8?B?NzJWbldzWTYvNlBLSDJ3aisyUnp0Wml2OVJheG5CVWk3Wkg3ZWJ4bGhSRkUv?=
 =?utf-8?B?M2tQeDVFbGxnUWNOenpmMzRJWWtEVEYveUdzRjI5UExmVHUySTlXckpseTdy?=
 =?utf-8?B?VUc1QzcyUFNmUEtIbWFwZjYwdEtMUi95Wng4TVo5amh4dDJjYmtUeVhSVFY4?=
 =?utf-8?B?Q3dIaFIwQTdLbWEvbVU1SGk1REpUdUE1Wk9DTFJIdC9wdE1KNUlMRkxOWU9S?=
 =?utf-8?B?ZnJSMnpRMXR1RXZVei84blF0R2RpdG5FeExmRFViYkN4eUxFNC9tdURjc25s?=
 =?utf-8?B?Qk1nTm1zbkZqK2pjb2FvTmtlY2ErR0pYVnhqRUkrTnEyTmVqdkdERmQxYzdW?=
 =?utf-8?B?RkhnQlI0U21EYTZZL0hlZnRiS211ZVFoNDV6SlZkZGF3T3AybDFseFhra0sw?=
 =?utf-8?B?YUY0ODg5UytkZGRNK3pRT2lWVjJRSmRyZExiUnFrM1RudXBiSldtbGg1dmx4?=
 =?utf-8?B?ZnhqMTloTENNVWhreTFNQnY4UnJqM2lUaUwxRktzR0xLcnNGWE9xdXFMb0Va?=
 =?utf-8?B?bWtMV296cWZVNVRSQXZKYUEwajhNU05nUXRRNkxzakpzeVVyL1dMbTJBTXIz?=
 =?utf-8?B?SU5uTEdwbEJ0S0Jla1ZXNFhML0wzRDVodGRQOTE0VStxZXhybW5CejNBZ0Z0?=
 =?utf-8?B?dnFUWkxvZHRUdDEvYmtJcE1IMEh5OVgxczV0V3hlTVpOcTJPcWRVQjF1YTBo?=
 =?utf-8?B?blFjcGJ5RlJhOXdsaDFiYy9iWTdYYWZBeU03aXc0Q2xwK2ZkbFBCMVByU0ZK?=
 =?utf-8?B?K1lOcVZlU1d0bXlGYVd1S2MwYXlJSWwra00xMkorL3NackowRmpPZGVqRHo3?=
 =?utf-8?B?QXV4RCthM3FBWUZFdzRvckJxVHlIekNRTjdtRWUvZ3hBZjQ3Qm5kVnNScDk1?=
 =?utf-8?B?bktsUDdlczg1WkNqTU9PdzBQRG0rc0J0dlY1K3ZWdFZ4dzBjZkY5OVpHeUNw?=
 =?utf-8?B?M2VyeE1UQU83eGVMaUVXd3h5dlpJN081NXJFbitNK3pubWNReEUrS0hlQXJP?=
 =?utf-8?B?T1lzeDBJdkpCcnM0M2l6SXhLRkIxVjZuYkR4NERNaDI4RERva09BMWZHSGtr?=
 =?utf-8?B?TzZTQWlOUm9xdVBONGpmVkpJSnVyN05lUmVVSEpwbFQ3TnBDdXByVEo1TDlx?=
 =?utf-8?B?Rk96Mkc4Ri85VHoycUVWejY5eGVaN2FmaXQvQWovRUxiTWVVcTJSWFJOaUZu?=
 =?utf-8?B?cjFqTWwxT0JOZVlWclFHTUplai93TmN2MmdMZzNQZy96M1NuMzVMS1JlbXFT?=
 =?utf-8?B?TkdNQ0lGK2Rnbm01MXBmeG1KSHl6Sm5nWVJ4c3ZoK0JnT0lEazJqWE1mdmZP?=
 =?utf-8?B?cGhDNU1UdkxhZFZmTEpyWFBob09McFhVclhBbkhPWVc0WGNkZzNMTVJjQk1M?=
 =?utf-8?B?K0tuLzhPa0VrNUVDNm5QRnN6VWpTVDRDQVZvaDJHc1ViaEhnQ09rMklna0Jm?=
 =?utf-8?B?NTkrRU5jb1p2RDhwMm5sQ0RiNFVPMGtkZnFBUkZJWllXRHV3ZnJQUFpRYm9t?=
 =?utf-8?B?ZVRIdjdNVlNaYUpBajkwbTV5Q0I2T0F4RU0zS2NnVHEzb2ZDNTZTOXRQQkZu?=
 =?utf-8?B?YmRRdUQyMXFtQWNwTzRxMWcvY0diMkV1YTkxd3M4cEcrVXhEdzBQTEJma3hC?=
 =?utf-8?B?VjhCRVNwR0FYUmR3a2N5NU5hOEg1V1NmVkhLRjJ6cmVzdGJxRkIvYmhuTGh6?=
 =?utf-8?B?L2pGRSszcHE2Y1oxeXAxOGxHNnV1ZXpZUUVlZFI0SDZud1RPMTNweFB6OS9I?=
 =?utf-8?Q?vdoEJ7zdGT5EW6L4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 074451f2-4208-40ac-5bb5-08def2ddc0a0
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 10:38:56.8444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5OvAETnQXxiDsfe2NlywBbBmG5676F9GWlZM6FfBorXuRhQT4NprNJ4Hnr9/+O0PpUFwUFcXNIooH2Zvs/JSMZ1Kfc9y1dF/aTMRHJZlVvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB989486
X-purgate-ID: tlsNG-bad1c0/1785926343-39CC7034-3817E674/0/0
X-purgate-type: clean
X-purgate-size: 1540

On 05/08/2026 9:29 am, Jan Beulich wrote:
> Split out struct x86_event to an entirely separate header, and move a few
> other items describing the architecture to a new x86-types.h. With a few
> forward decls of structures and with a fair number of new #include-s in
> .c files, the inclusion of x86_emulate.h (and hence
> x86_emulate/x86_emulate.h) can be dropped from all header files except
> hvm/emulate.h; it needs additionally adding to hvm/ioreq.h though.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

This looks broadly fine.

However, I don't see any hunks downgrading arch/x86/hvm/svm/vmcb.h from
x86_emulate.h to x86-types.h.  It needs struct segment_register, but
nothing else I can spot.

> --- /dev/null
> +++ b/xen/arch/x86/include/asm/x86-types.h
> @@ -0,0 +1,76 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * x86-types.h
> + *
> + * Type definitions and basic helpers which are more or less directly
> + * describing aspects of the architecture.
> + */
> +
> +#ifndef X86_X86_TYPES_H
> +#define X86_X86_TYPES_H
> +
> +#ifdef __XEN__
> +# include <xen/types.h>
> +#else
> +# include <stdint.h>
> +#endif
> +
> +/*
> + * Comprehensive enumeration of x86 segment registers.

This comment has become stale with the recent additions.  I'd be tempted
to simply drop "registers" from this sentence while you move it.

Due to the way we use these, we should even technically drop the
trailing r from gdt/ldt/idt but I suspect that is going too far.

~Andrew

