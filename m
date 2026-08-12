Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FD3C5B572
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 13:40:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389074.1630004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu9BI-0007pZ-1k; Wed, 12 Aug 2026 13:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389074.1630004; Wed, 12 Aug 2026 13:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu9BH-0007pS-VA; Wed, 12 Aug 2026 13:39:43 +0000
Received: by outflank-mailman (input) for mailman id 1389074;
 Wed, 12 Aug 2026 13:39:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wu9BG-0007pM-IU
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 13:39:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wu9BF-00EP7H-8r
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 15:39:41 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7c7796-8faa-0a2a0a5109dd-0a2a450bd61c-16
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 15:39:41 +0200
Received: from [40.107.201.6]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a7c779b-b7e8-0a2a450b0019-286bc906bdfb-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 15:39:40 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB7865.namprd03.prod.outlook.com (2603:10b6:303:26f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 13:39:36 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 13:39:35 +0000
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
 b=MmZzA9sc+Y005/g/BADJxrJLt5UWeFlztpfgUYOFSBOc+lPa+ZqpCNT1ojqdJvbP5p/+2f5QilinPLCzNBHh5W/LUS5bGb7yNvJmIyevL6Ti1Ldv+INkY95OOP67WYGsgQpMroJNNUhfhwHcIpILU2AtLwAhU/dA7AxAz6sgoE0BSHrqOTCxohtpk1jdkq9HpVqKWX/zoHvFLlr/9xxlWB6WOOl46GpVD5VKdTUxMoo3bgk3tkH5Y1mFHFGd2cv+Lr3qVuBGfoOghzmEYUagP4Liv6uCMnstbyDobxoGQbFrOJSgtvyEYmoKVmsFeTxTPQUR4OrMcwOqOnI1r2v5eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oz1woTuVw8O24GNfFSahh4wAX0SG36NHPQJa5rtlOXg=;
 b=WmhgrmbxWgnaNPLPJ9CVsgRtozHhxOZi8DdIgPwnmydbwfDclc/fmR+zCV1R8scxS8UGkTFgav97nqVThpbwPyMb6+87rL7qluukRKKb1wjVwh03yyPq/OexJNVazTvm/53fGaLTRcHUps5uzPGs/r4+7UoblvYvKGl2P9vtmDAEZdSfdIqy6BF5C4kr6ylDsShKu20pGcSEeHKWURbAU2h8VfnADrqv/6gwUYj5QYAUOPxLrLdrza++f4TSEEmvdR3rknVgczhDo4xUXPjl/+eh5JNb0jYqrcnlDxSMWT6oUBMeQG9z/EHcNLoq/9U1dlNM+YJ6ogiykbcbYlsxEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oz1woTuVw8O24GNfFSahh4wAX0SG36NHPQJa5rtlOXg=;
 b=W6w8E6tv2ugcIxdEkymjY18FOb7FLbxiAl+ndA7+7lR7ov4pjApf9v4Isr/8IBw7oOZPy3VdT6hDWLdqGjFjRAt+Jav5STNcupJXyH5n5FNmdSKnFujSdbZGoaTSQ/Iu9FpVMgyr1HBU481/YVRT3+ym00qsQLqwvMTBCPHWpno=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <652379aa-dce2-4891-96c6-f9785cb19318@citrix.com>
Date: Wed, 12 Aug 2026 14:39:32 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Subject: Re: [PATCH v2] x86: reduce dependencies on x86_emulate/x86_emulate.h
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f6f7eded-b6a3-49b4-8c68-38d263c3b58e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f6f7eded-b6a3-49b4-8c68-38d263c3b58e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0304.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB7865:EE_
X-MS-Office365-Filtering-Correlation-Id: fbeccd64-f431-4724-7fc3-08def87725d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|56012099006|10067099003|5023799004|11063799006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	GDnVer3oCBrsGkZc1YItDrp0Y47QmZleoYHI7PEvON3ClJ9kiq6fWeCml6NPVHYx4dmYEjPEwzBlZsKQh+vIRBfQJ+UXVBsaxCRHcwM1LtUWtjnZdNkM+BoZwJVPaS5q2nvKo9NViIPHcL7xkEFeNxjiLgM/fBV2oZgWQt7NudyU4vm+AnFYSD2O9b1VlnYCJzjXYkB9CCkG+Weom5szQ1nbO1ZcYWi11xuvVKYPpJcYSsMVp8pvf0VVEm/m6brFbW4aLBBGPdbQtgKP8CPXQ8mWPMqK78pUZUn9YhVMvDdMyMnMMjaVX4OKE0PYwNtiEmVMT7peZhdaSzPTNkrlzoVujX1FweGQRcnbITeiG6gcxGoy0jJn7V/vCC1upSwJk0Pi+QtoJKb+w7ScPA423NX07maXR7gKyg77HeMaO8TvKKel5EsSMGGyyObWr0k4vH1eRimzhZTioIY+XYKDHkNdSxfwAAjd2jhUf/ZqUMBpnmd7NjDE5M0XwKkNJB2bL5g0VB0rBChaFWYwShYDxVPOW3iRZ+XpvcjVPStKpeUXUQ8AxJCzEeJMViIhZ9v52m0uVeuZTb6LqjGYSkRU9GP5GboYDd/NdUwNeJiGzLD/v0jj+efog/SlA6iXSUUSqZ/OztFdAmE/PR/DMJ1oMI+WySABkncMh7fffr7vb9w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(10067099003)(5023799004)(11063799006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2l5YUN5NFdUN0VPOGllK3dLaWN6WEg4NjhjTDB4QnZZUEZ6Tit1V1Y0OUxn?=
 =?utf-8?B?amlVS2F2TWlLakxSNldReERraHZldTIra3g5RDN2Z3VGakRnRWRoRm9oN1BQ?=
 =?utf-8?B?TjE4QllFR1lncVdqb0tXMTJPOTdPR3dYQTZFSUFrM2hmODlMcGNCWE9jUWZt?=
 =?utf-8?B?ODI4K1dwZUJnK2NkNVJzcTZTaFN4QWZVZ3greFh2Q1JCVkdiR1FwaTdTblZk?=
 =?utf-8?B?VzhNWWpaY2ZrNWFVSEM3VFNmZ214b28vcjRoQmlBWGhYM3M4cmVsZkNzZCtD?=
 =?utf-8?B?ZTNTOTAwUUtRUFc5WktsV3liVW1ucGNFdlFaQXh4TUFBTkV0N21PRnZtYzFp?=
 =?utf-8?B?RTluN0F0SFBDWlFJQXcyLzdXNE16amJWRFZUOVZYdlRsOXp4WnU1OXQwdlI3?=
 =?utf-8?B?eUhMM1E0QXBUenhZMXBtTndkUm83VEpDK3ZHVHlWNVlUNXMwbDd0a0d3QldV?=
 =?utf-8?B?TGdzNzBSaVdBKzRITHdVZjRUUEJBbVl6amhhNm9LaWNzNkNPTFBYOWl0Z0NS?=
 =?utf-8?B?MXY5QzcrLzA3UFJFRm9iQ0hmbHVsTVFvdnBuckpJNnFLZFpjWTdxZHR0c1Zn?=
 =?utf-8?B?cWU4OXJRdlJDRVhmMThUa2liWHcrb0E5ZCt6N0hLOHltTzhxbUNIZDVsMERF?=
 =?utf-8?B?SjBJYncxVU9lKzJIODNRT2VxTmJGR1dTMlBuaWpvVzdwV2JUVlRaOElkR2pS?=
 =?utf-8?B?aHBnVjI2aGhMT2tRMmlGdE1iQ2lVNkRlVmc1RldRekV2SldBT3RGekt6Zzhn?=
 =?utf-8?B?WncxcjE3U1ByUWZ4QnZQbWZvVnpkY05mWHc0aVZBSEhlZXhKdlRFbkE2V3Q1?=
 =?utf-8?B?SnFLaFF5SmUxMzY2YzluSnlHQ0VMOE9aUmtnY1JjRjdNMUlpcEltZmovOC9E?=
 =?utf-8?B?UHN4TG5GQk1WOVVvTXRZcjEzVll6ZVBuZHk1WCtYbGRqQkNvdG5GdUJYeXEz?=
 =?utf-8?B?KzE2VCtGTk9DaG9NbjdKVllQanBZdHNYRmlMYUwzTEREcEpUMHV4REFXL3Rt?=
 =?utf-8?B?UlVRVjlETlkrTUNrc05SQmc2YWwyaHRDc1Vsd0tYTGQvVDMwMHBGN29qcXlG?=
 =?utf-8?B?bjNQNXZGaGNuYVJ1b1hnSW13YkRFb1NQRjFja1ZCTlJBTW9PU3RoMmJQQTE3?=
 =?utf-8?B?NU9nZjFXUEd2aThrQ2lQS2VrYWM5Vmx5NGpuNnYzcWMzbWovb2I2cmlEMmll?=
 =?utf-8?B?VnpSbTAxKzBWUTdPK1AwS2RDck9wOGZRbEFxbmVzVytZblZwUjE3cTJjdHJ1?=
 =?utf-8?B?K1IxU1JLQWIvN3FRYVZuNm9sNTk5Y09ja1dDZmlwQ0IxQkMrZlVPbE1kY3li?=
 =?utf-8?B?LzIvd2tPekFiUTY4bkV5TENTK0xyZHNtNWhtT2NHYjcwRnlRWVNZR1RiOEho?=
 =?utf-8?B?R2VWclpJL2lYRFVXblV6N2dUdnVwYnJsU1RJQUx0MnhpZ3VDQ1JqTzZzWlJu?=
 =?utf-8?B?WWQ1eWJyVHhLQldZeFBGTElzbCtndVg3T0tyQlprcUdrak5HbWhMMkpLUDF2?=
 =?utf-8?B?ZzBmTU5SQjFPOWlrYUZEaThHakZXL3Vidnp1S2V2b0lpTlFFbHJMckp3Mk03?=
 =?utf-8?B?NzhlV3hFM2N5SVBGMnRNZmYrNFF6c2VCbnhpWVl1ZE0rNDRjdGZHZnd1dFJl?=
 =?utf-8?B?dzIxR2lVRHpTNWFzZHErR1RiRk1lRE1IRHFXc0MzUFZuVXYvQWttKzhncWNB?=
 =?utf-8?B?WHExaFhvckRDaGhaTUU1OFJOSTVuaERTMDBtMkhhSVpIU0M2UUhBdkdieUx0?=
 =?utf-8?B?dWtaOVVsZU8rMFdRQllZbHBTZkMraDVmUVJhTEZCQ3MvNW5Ec1crMzZnNjQ2?=
 =?utf-8?B?Y0RDS1FUZ3ZTTnk4KzBFRjgrS1o3NVVnc0VKK09PRFFDSEVpVXFvMHZkWGkw?=
 =?utf-8?B?ZjZ6WjNGdHo5Z0ROdURxN2hPNzh1NmhPK2MzeXBCNTlvdFg0Qkh3WU9nYm92?=
 =?utf-8?B?bmxNVDJ0MWZJTFdHLzBNWWVOUXk5YjBSZEMrelBMOUZmSFdaeWpKeWtpZ2ty?=
 =?utf-8?B?R1B1SklhemZiOUN4NGc1eFlHWmJNa0hmeGV0SWErTi9JWjdFMjVjbWttcGRh?=
 =?utf-8?B?RmZsWFpETmhLeXBqdmxaQlhKVCtoakJRTmxLYnN6akZDcVBUTnAreGRiY0lx?=
 =?utf-8?B?L1BBZUVuSDRFTHR4bU9IK2JrQjU3dnlYZVQ3S1ZTa3RkNjRacmQzL1NhOWF1?=
 =?utf-8?B?V2tyakNRTTJqN3NXdElaUjkwOVdpeXpwdGlEOTBFZzhhYk1FMlA2ekVoRWdl?=
 =?utf-8?B?N1dsNExWeFZCREN6M0g0VmFnck1LMlZCZng4ZzluQncvbm1NL0ZTckF0Mnha?=
 =?utf-8?B?NEpNUlJUTlBUc294RTUzOE5QMXduV241bnBicTVZZTFwb0d2eXJuQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbeccd64-f431-4724-7fc3-08def87725d5
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 13:39:35.3768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rgh5d9aBY5qoaDa0gX9mpRfSm0htFvGwuGwh8ouNAajNdLNZ9tc/8AnB057Cf5EW7MErviW1M4hgVvrGTDC7IGsc7NjD9cVjWZ2oDoX0Zu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7865
X-purgate-ID: tlsNG-42698a/1786541980-1B8D19EA-D461679D/0/0
X-purgate-type: clean
X-purgate-size: 1783

On 12/08/2026 2:24 pm, Jan Beulich wrote:
> Split out struct x86_event to an entirely separate header, and move a few
> other items describing the architecture to a new x86-types.h. With a few
> forward decls of structures and with a fair number of new #include-s in
> .c files, the inclusion of x86_emulate.h (and hence
> x86_emulate/x86_emulate.h) can be dropped from all header files except
> hvm/emulate.h; it needs additionally adding to hvm/ioreq.h though.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

> --- /dev/null
> +++ b/xen/arch/x86/include/asm/x86-event.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * x86-event.h
> + *
> + * Helper definitions for event handling, which aren't prescribed by the
> + * architecture itself.
> + */
> +
> +#ifndef X86_X86_EVENT_H
> +#define X86_X86_EVENT_H
> +
> +#ifdef __XEN__
> +# include <xen/types.h>
> +#else
> +# include <stdint.h>
> +#endif
> +
> +#define X86_EVENT_NO_EC (-1)        /* No error code. */
> +
> +struct x86_event {
> +    int16_t       vector;
> +    uint8_t       type;         /* X86_ET_* */
> +    uint8_t       insn_len;     /* Instruction length */
> +    int32_t       error_code;   /* X86_EVENT_NO_EC if n/a */
> +    union {
> +        unsigned long cr2;         /* #PF */
> +        unsigned long pending_dbg; /* #DB (new DR6 bits, positive polarity) */

With the advent of FRED, this probably wants to become event_data (or
just data) and drop the union.

It's also the XFD_ERR mask for #NM, and the NMI Source Bitmap (on
capable hardware), and I think we're better off pointing to the FRED
spec than keeping an out-of-date list of what's in it.

~Andrew

