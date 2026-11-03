Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1078E606A324
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 06:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=P4XQ15sc
Received: from list by lists.xenproject.org with outflank-mailman.1469210.1678104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO7dg-0003LZ-0W; Tue, 03 Nov 2026 06:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469210.1678104; Tue, 03 Nov 2026 06:04:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO7df-0003LS-UA; Tue, 03 Nov 2026 06:04:55 +0000
Received: by outflank-mailman (input) for mailman id 1469210;
 Tue, 03 Nov 2026 06:04:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <takakura@valinux.co.jp>) id 1xO7de-0003LM-9l
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 06:04:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xO7dd-001QM5-Mw
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 07:04:53 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6ae97974-8faa-0a2a0a5109dd-0a2a450b84c0-20
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 07:04:53 +0100
Received: from [40.107.74.119]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <takakura@valinux.co.jp>)
 id 6ae97983-b7e8-0a2a450b0019-286b4a77ba77-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 07:04:53 +0100
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19) by OS9P286MB7838.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:474::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 06:04:49 +0000
Received: from TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82]) by TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5f8d:a6bf:3b84:5a82%5]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 06:04:49 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L0cQ1v0OIYtS/6bYaruPagq4EOAFVz+GonF8UMrM9ISus+3ePJY+Gp7hW5KnFwcFVoic8Z1nkBXUCuhJN1UdV0lmg7w2yBybutJa25+MTpoQVxZwfLcNv4i/7z0Uz5Ck5eb+EEHeQk2qADxsKNH5igUGUPm8tJj0Tl5EYneNNkofdMz6TJYLpRwox5OK+L97RqAfRE0jt433WIA4O7LiTeILOrQXG27TfDTwQcUZUC5mRq1QJX0sv97y5Dh2M0rZpdIg7ruIYmAYaKxyyjBdg7hfrl9z+8ckb3gl3l9FFvjxQUQnb3Ti9hmQoAfCLmSh7tW2zKsiEiN6IqoIiRYE/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUkl3RtsSxBVJ/HZu/hZ9Lm1nvwsMgutWtd4I+5L8b4=;
 b=YVpiDndgVDFfIYtbJp14skOQ2a3f+RaCOYl6lE4Ui3rfelgn7yzEeMIylBdugedlaqHtodgnT4VABAFsP3GZQgr+PK2WKXdxpKcaqNZnMh3OXQmH12Yg/d/N8RsZM1kQeqzEqml20W4N5UUxJ9PW6T6cqXSSUVwWt0N2+Yl922i7AtNlIYtjcmFhr0YQGTpqxjiu2JAj6alCYBu/j3dixUL1ZiRRasrZP+P/ww/bL+swv/LCSu9ocvEdGvkY7ud6JFrft2zULvY/KYplFFm8DnqTFxLgahML4WieF2UzuzfzZtTTNBM+xD7RXBKaTkunJJzNsrYf6XnSVcWvC+AriQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUkl3RtsSxBVJ/HZu/hZ9Lm1nvwsMgutWtd4I+5L8b4=;
 b=P4XQ15scv9ziuQb67RAg4oWnxUl/hqV2EvJhK69+QIwiuxLhoKFyuUycufixp8UQNdEPQQAb0C3cJ/iSMGfb2BkEkKJaeVX9+tJtIP6tz1C9LH4chGneEEwWNC6WG9d7B4e0NMjYmsDzeNk1ORVOJO4BQT4Uk7iVgUHlDPCAzIg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Ryo Takakura <takakura@valinux.co.jp>
To: andrew.cooper3@citrix.com
Cc: Volodymyr_Babchuk@epam.com,
	anthony.perard@vates.tech,
	bertrand.marquis@arm.com,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger@xenproject.org,
	ross.lagerwall@citrix.com,
	sstabellini@kernel.org,
	takakura@valinux.co.jp,
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org
Subject: Re: [RFC 5/5] xen/x86: livepatch: enable attaching callbacks
Date: Tue,  3 Nov 2026 15:04:42 +0900
Message-Id: <20261103060442.104814-1-takakura@valinux.co.jp>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <97d772f1-322f-43f6-a793-fdbba16c7f04@citrix.com>
References: <97d772f1-322f-43f6-a793-fdbba16c7f04@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: OS7PR01CA0305.jpnprd01.prod.outlook.com
 (2603:1096:604:26f::14) To TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:511::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY5P286MB319683:EE_|OS9P286MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: d3a0408c-e3c6-421a-4b27-08df39705e42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|260925022911599003|260925021311599003|260925021911599003|56012099006|261009223027099003|261028144727099003|261021121427099003|261102123227099003|261022105027099003|261022113327099003|261022075727099003|261022115727099003|261021130227099003|261021123027099003|261021133027099003|261021135927099003|261026135527099003|261026140227099003|261026130827099003|261026121527099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	D3Qp5NEPLWmvFF2Gf2rUXsYvp6L+1CQno+L7Dyh9j2FdP4/+UbEjApOLQeczpjlVW/F0DGM0UE0n36//kx3NgsDXJb471tLuSH2cbb4Zl/YxwEVo0k8FcfabT3tZb1wCyPh6YRQaC5pS1XJxXNFCaW1drMGOsvbN2W6njhT8A+rFLTs1jrF4AwOq59+n4KbgP3eDDv/HnWXrQIL/7HqoKty4X+EWpgQjJqFmpxEKi1ISbwPaHddNRcYK0ukvxzYY/QOZUWQ0CK90fkvch+xGQKMbDvCYUYRfwfLJoT+Z2hh/7Bsx8y+VHRNk9pLqqx+rnnebzQWgibINvwr+1lxGUpxorPVejWGXuuLElP0Wjir6gY95puQHa0fWxl6EuU8m+XfY8ahHMi85/LtKuupDgNwxnvJgg+/oNt8FhA3dGkx/1ylMkT9/D/sSYOlwu/r5BCYquH6O2BUrssvurv8B4uFRpI7qYUwMei0m0CHkB+JW9OIVOrCWLNxViD9Zem0HW+NIo4XfWuRmhvwbcXHwHmYWkXgXCYkHHdQjpgsk2o18ME0bXUHZknA/tLu8zRBSj2suy28TRlOerqIA0RxkJzq5F6GCuH9hmHCgrD1fEzeF2b3tuv80KKG/iC6rcK/v
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(260925022911599003)(260925021311599003)(260925021911599003)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261102123227099003)(261022105027099003)(261022113327099003)(261022075727099003)(261022115727099003)(261021130227099003)(261021123027099003)(261021133027099003)(261021135927099003)(261026135527099003)(261026140227099003)(261026130827099003)(261026121527099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dzH8K0c0DCBldGrBgWPPBw5pyi2AqpH6qLBZ4K3dzuJ4RrE5yyqY6VJzD8c0?=
 =?us-ascii?Q?uNn3WcaoGQJXEdi8Idih7utT6Zn0gSn7LX1kwF3Rhi7l5Pb/s5A0lI3J5ei0?=
 =?us-ascii?Q?LFkmljvIKjZ79JiezNg9HHIJIYJsCTJ0uHXwsazDVZKZI1LzSb8EJV5KKRae?=
 =?us-ascii?Q?rf7PJIgXtQyYpIc20TOhmb/uV4L6TGMPicm/kcH2o70X6dxLVBTGi5RvKIxZ?=
 =?us-ascii?Q?mbC7YWEfrhoegqWIYIwVReZwXmxbrEFWHkKMcy4ZoOHxhDzPErVsSPUnL+fe?=
 =?us-ascii?Q?QvlMZeojQrilGOidIoipJYhwkQMieCmwVI4C7g93HLEZtrZrew4zS6Le2GKA?=
 =?us-ascii?Q?B+59OcuD6lkvhN9FUVg6Sa6nk++VjyIpWmA6LP4D0DOdUkf/i+RFmoQcdQYm?=
 =?us-ascii?Q?urAEsesIvYrGJraClLCOxwGR1ULhV0hGaZqye4WQjyDaMsuaRVNYW3vTr5UA?=
 =?us-ascii?Q?tldynoI/egQAtM/n48/6zwxXNWCVxr7HELVg7Y/CsG49IbCeXXpF81X79My0?=
 =?us-ascii?Q?aDHItFQ1FbFjafC7KArKuZY3ntM7cNwdmO7dgzWZTXlUOgMbr6aGYD9t0Cdj?=
 =?us-ascii?Q?BteBkvrMSYKMc8NaBdRDs6d6m8GtDJc08uLkEsJKhXeDY/VaRLCrJlBAqM2b?=
 =?us-ascii?Q?oF0ZbzTqeReURlp1aVTWiU5Up6JcBLl/d2jX0yutD/Lo35cVHWg/Xqz7Sje8?=
 =?us-ascii?Q?5WqBiZVohjay3rebxWniwCn4jfnOMcciDklqHfF3YhiPZnx6lqmZcLV7QEvq?=
 =?us-ascii?Q?Ku1n46ooOsRne7LIn/+2Rhx9AbzEeqiyFnhaiw8WxUg+ClqoPCeZYnQ9oEbF?=
 =?us-ascii?Q?jh5vca3quIj/3lM/HO9pBJfFYICAEUtTY4t5/CGp5toECikUTZBeViUKaaFE?=
 =?us-ascii?Q?9EA4vYdqACRZLQOAsb523D2CG9OEyMwO3iwY4Co/ZUoJAgWV86FWZHyzUOyK?=
 =?us-ascii?Q?1RQjpHEmsiYVHW3W9azJ3E6PLkBIosd1KlBe/C5s8o1bhWmcRAUHdzQXRLiu?=
 =?us-ascii?Q?71ELuE3pdeVVik6Wc1VleYEP6N5KDg6p3soMs/pnpH78mNmg4dcVtVSNXbtV?=
 =?us-ascii?Q?065858c7DECrvy/MWuhV2HCngo/bYRl7wTjIc3VIhUFhI+YE1HYJMBpi/iYC?=
 =?us-ascii?Q?utXkCo16xrMnKdAwu4kqDBSmhfN11tX2AnyYqyPFmDO93tYfGXOrRxi7PlIu?=
 =?us-ascii?Q?E9gUIZ8Gt7lo3AQav/K4B1t5RSNJMTg/mtCjaeMWhu68IFwUM3Cdc8npzveQ?=
 =?us-ascii?Q?SjnmtozvvLhnzyO3fctAFGc3/uJHnFY48huXiEJSFQesl3gRQB50fzDhWseX?=
 =?us-ascii?Q?A5v7hEJYUZHRJeknNCMvZKrB5zKJJU0GhoqCup0dQIie57Gsi5eEkRnB4B+T?=
 =?us-ascii?Q?+C/Ex4dnZwo4uNuz/7eM+7DuIZrK+53i/lzko40C9Tw80P3imtcNKiu5bd8O?=
 =?us-ascii?Q?VtztsegylQ2bHz6pu3psmhWz/Wmqxhjlgc1dB9JEBOGD5KhE2TZbFsgxoLk+?=
 =?us-ascii?Q?ufXCoCLlW0/B67X8yH7aloN01kXxwZCStC2W94M68oL/buDK4tCT/96Pde9Z?=
 =?us-ascii?Q?SR9kduTfTpNbj6Z/yY1CXrA1Urh0iQPIOYztWkrymhft92f7r11gX9Zvq10h?=
 =?us-ascii?Q?VjkelNhHTVmVXQLuTmUIk4Ri1rNZR6CPXHN/xwl3mcfKvxqq6N585od3LReh?=
 =?us-ascii?Q?6y+W2xYAa/+9nDkc+bLqUr7THY8VnzIh7RZz/1a3J23IgjwEmP+COAwQY1Lu?=
 =?us-ascii?Q?Q+zp4gqgDw=3D=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a0408c-e3c6-421a-4b27-08df39705e42
X-MS-Exchange-CrossTenant-AuthSource: TY5P286MB319683.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 06:04:49.1124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: njHN11BnDfcWpcI0PEWMZ+GgUNFNjyyHwJKslKw4UDqRQ8Xjp0bmXsimDyTufhBWcpHOXgUm+k49ab+OyF7PLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB7838
X-purgate-ID: tlsNG-42698a/1793685893-A82F49EA-DC87AAA0/0/0
X-purgate-type: clean
X-purgate-size: 6304
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 26 Oct 2026 11:42:37 +0000, Andrew Cooper wrote:
>On 23/10/2026 5:58 am, Ryo Takakura wrote:
>> diff --git a/xen/arch/x86/livepatch-asm.S b/xen/arch/x86/livepatch-asm.S
>> new file mode 100644
>> index 0000000000..005765b476
>> --- /dev/null
>> +++ b/xen/arch/x86/livepatch-asm.S
>> @@ -0,0 +1,60 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +#include <asm/asm_defns.h>
>> +
>> +        .text
>> +
>
>You need ".file __FILE__" too.  IIRC this is a workaround for a binutils
>bug.

Understood. I'll add ".file __FILE__".

>> +/*
>> + * xen/arch/x86/livepatch-asm.S
>> + *
>> + * Trampoline for livepatch tracer.
>> + *
>> + * If livepatch tracer is enabled, function entries are placed
>> + * with five NOPs. arch_livepatch_apply_trace() will be livepatching
>> + * those NOPs to:
>> + *
>> + *     CALL      xen_livepatch_trace_caller
>> + *
>> + * 0(%rsp): traced function + 5
>> + * 8(%rsp): return address to the traced function's caller
>
>Somewhere in this comment needs to say that all GPRs need preserving.

Ok. I'll add a comment.

>Except...  Looking at arch_generic_hweightl(), my notes about
>__attribute__((no_caller_saved_registers)) say GCC >= 7 and 8 is already
>a minimum for the (broken) patchable function entry, let alone the fixed
>one.

I see.

>So I think you don't need an ASM trampoline at all.  I think you can
>merge xen_livepatch_trace_caller() and xen_livepatch_trace_dispatcher()
>and just tell the compiler to spill all ABI registers.

Yes, it would be nice to merge the two...
But xen_livepatch_trace_dispatcher() is also shared with arm64,
and GCC does not appear to support no_caller_saved_registers on arm64.
That makes arm64 still need its ASM trampoline to preserve
the registers and common C dispatcher.
Do you think rewriting livepatch_trace_caller() in C while keeping
livepatch_trace_dispatcher() as common dispatcher would be reasonable?

I'm also thinking of adding the attribute force_align_arg_pointer
to address the Bernhard's feedback on stack alignment:
https://lore.kernel.org/xen-devel/179285259082.1706038.15527286146285697701.b4-review@b4/

>Also, the xen_ prefixes are redundant.  Just name the function
>livepatch_trace_caller().

Ok. I'll remove them.

>> + */
>> +FUNC(xen_livepatch_trace_caller)
>> +        pushq   %rbp
>> +        movq    %rsp, %rbp
>> +        pushfq
>> +
>> +        /* Preserve general-purpose registers. */
>> +        pushq   %rax
>> +        pushq   %rcx
>> +        pushq   %rdx
>> +        pushq   %rsi
>> +        pushq   %rdi
>> +        pushq   %r8
>> +        pushq   %r9
>> +        pushq   %r10
>> +        pushq   %r11
>> +
>> +        /*
>> +         * xen_livepatch_trace_dispatcher(ip, parent_ip)
>> +         *
>> +         * ip: Address of the traced function.
>> +         * parent_ip: Address where the traced function was called.
>> +         */
>> +        movq    8(%rbp), %rdi
>> +        subq    $5, %rdi
>> +        movq    16(%rbp), %rsi
>> +        call    xen_livepatch_trace_dispatcher
>> +
>> +        /* Restore the saved state. */
>> +        popq    %r11
>> +        popq    %r10
>> +        popq    %r9
>> +        popq    %r8
>> +        popq    %rdi
>> +        popq    %rsi
>> +        popq    %rdx
>> +        popq    %rcx
>> +        popq    %rax
>> +        popfq
>> +        popq    %rbp
>> +        ret
>> +END(xen_livepatch_trace_caller)
>
>Just in case there's a problem doing this all in C...
>
>No need for pushf or popf at all.  Flags are undefined at function
>boundaries.
>
>Please drop the q suffixes; they're all unnecessary here.
>
>The ret needs to be RET for speculative mitigations.  (It's emitted as
>JMP which will be turned back into a RET on safe system.)

Understood.
I'll get them fixed in case if we need a trampoline.

>> diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
>> index 5158e91f7e..1dfcc3e750 100644
>> --- a/xen/arch/x86/livepatch.c
>> +++ b/xen/arch/x86/livepatch.c
>> @@ -19,6 +19,10 @@
>>  #include <asm/nmi.h>
>>  #include <asm/setup.h>
>>  
>> +#ifdef CONFIG_X86_PATCHABLE_FUNCTION_ENTRY
>> +extern void xen_livepatch_trace_caller(void);
>> +#endif
>
>You don't need ifdefary around declarations.

Ok. I'll remove them.

>> +
>>  static bool has_active_waitqueue(const struct vm_event_domain *ved)
>>  {
>>      /* ved may be xzalloc()'d without INIT_LIST_HEAD() yet. */
>> @@ -365,6 +369,35 @@ int arch_livepatch_secure(const void *va, unsigned int pages, enum va_type type)
>>      return modify_xen_mappings(start, start + pages * PAGE_SIZE, flag);
>>  }
>>  
>> +#ifdef CONFIG_X86_PATCHABLE_FUNCTION_ENTRY
>> +unsigned long arch_livepatch_trace_entry(unsigned long addr)
>> +{
>> +    if ( (is_endbr64((const void *)addr) || is_endbr64_poison((const void *)addr)) )
>> +        addr += ENDBR64_LEN;
>> +
>> +    return addr;
>> +}
>> +
>> +void noinline arch_livepatch_apply_trace(const struct livepatch_func *trace)
>> +{
>> +    void *site = (void *)arch_livepatch_trace_entry((unsigned long)trace->old_addr);
>> +    const void *new_addr = xen_livepatch_trace_caller;
>> +    uint8_t insn[ARCH_PATCH_INSN_SIZE];
>> +    int32_t val = new_addr - (site + ARCH_PATCH_INSN_SIZE);
>> +
>> +    insn[0] = 0xe8; /* CALL rel32. */
>> +    memcpy(&insn[1], &val, sizeof(val));
>> +    memcpy(site, insn, sizeof(insn));
>> +}
>
>Why noinline?  These are out-of-line anyway by being cross-TU, but in a
>theoretical world where we had working LTO, I don't see any problem with
>them being inlined.

I see. Thanks for explaining.
Here I added noinline following arch_livepatch_apply().
I'll remove them.

>> +
>> +void noinline arch_livepatch_revert_trace(const struct livepatch_func *trace)
>> +{
>> +    void *site = (void *)arch_livepatch_trace_entry((unsigned long)trace->old_addr);
>> +
>> +    memset(site, 0x90, ARCH_PATCH_INSN_SIZE);
>> +}
>> +#endif
>
>This wants to be a 5 byte NOP, not 5x 1-byte NOPs.
>
>I see that GCC is still doing the slow thing.  Clang is doing it's code
>generation more sensibly.
>
>Use the add_nops() function.

Understood. I'll use add_nops() in the next version.

Sincerely,
Ryo Takakura

