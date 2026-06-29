Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C628C43327
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jun 2026 22:18:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1348305.1606108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weKJ7-0007im-A2; Mon, 29 Jun 2026 22:18:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348305.1606108; Mon, 29 Jun 2026 22:18:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weKJ7-0007if-5w; Mon, 29 Jun 2026 22:18:25 +0000
Received: by outflank-mailman (input) for mailman id 1348305;
 Mon, 29 Jun 2026 22:18:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1weKJ4-0007iZ-W2
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 22:18:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weKJ4-003S45-1m
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 00:18:22 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a42ef09-2eae-0a2a0a5409dd-0a2a450cad1a-18
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 00:18:21 +0200
Received: from [188.165.57.91] (helo=1.mo583.mail-out.ovh.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a42ef2d-f399-0a2a450c0019-bca5395b9109-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 00:18:21 +0200
Received: from director9.ghost.mail-out.ovh.net (unknown [10.110.58.112])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4gq0zK088Kz5xbm
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 22:18:20 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-ms46z (unknown [10.108.42.21])
 by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 2B40E8104B;
 Mon, 29 Jun 2026 22:18:20 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.106])
 by ghost-submission-7d8d68f679-ms46z with ESMTPSA
 id 6s/PNSvvQmo6mSwAPJZ6Kg
 (envelope-from <sergii.dmytruk@3mdeb.com>); Mon, 29 Jun 2026 22:18:20 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=ovhmo3617313-selector1 header.d=3mdeb.com header.i="@3mdeb.com" header.h=From
Authentication-Results:garm.ovh; auth=pass (GARM-106R00618994954-effa-4477-99ba-52d4da84c15d,
                    8153FC81E90989DE28CEFA46AD98A6783E51CAAD) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.183.249
Date: Tue, 30 Jun 2026 01:18:11 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org, trenchboot-devel@googlegroups.com
Subject: Re: [PATCH v3 14/22] x86/boot: choose AP stack based on APIC ID
Message-ID: <akLvI_OJ8RjU_90S@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <16a5438f73a026d4db1a5340f599d4839c74fcc6.1748611041.git.sergii.dmytruk@3mdeb.com>
 <1483a375-9662-48b8-8bf2-8cc83386b068@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1483a375-9662-48b8-8bf2-8cc83386b068@suse.com>
x-ovh-tracer-id: 17234149876033136060
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGzMqrww1dDxmyU9Ybbj4cLE5OjgahFN6p0kguCQ/PVCi6j1uYnjv3WVlS2oFxxPJNuj4lapIR2dz4S2YC3sE7cUNhmd60ThTJLZ7nHjNLVd/yIqAe0I8QkE3GruEqkqlyL5ucdzKBT8spVAWwLQ/XxPP1qYaKbaU8lyTuPmJBjAEpVc0Ix5MQWIv5MC+bQ2GTLr8LaBzOuONB+Sv/xPHd9M2hK1ZoQSfBPHMfvw90m+sMjJfuuYnb99/PU5WePuaQ0z5rrZPKRy/Q+xgW1y+Z9I6TpCbGbCKRkx5WzkvLgrxE3+dx2ZYaBaBHoQB27BE5h263n8/ZKmTXTG31shFdMtAS8gNElleXz40j7UpFL8JgyJKMR80IOqfsIzj4gW3qDVUPhQm1b+74ZNJxF3YbrEgQHPXxg5AehPhjPOOiP7Se2wh0sR7M9fiSBvkpDwjGGjmGHQ01wP8L/rwehugjS1J2RhQY2MAtWpTYxWkixLHBDyXVWow/aVjoWp6ySjuHa4UiCrYHkuMDQjhmMsnyeQq3uTG3wdE0n7E4LqUAt3pmCrPnHdTZSHkYVw1SrSEooWAMoQGKRPIdeuV8wpym5jljpS3mnAfbK8xzXeEp5M39RhfPgPtaHDj7uTd2EOZpoDO33AX3tWcc5wm0cF+nphUW0M5rg9TYZTBiYACHxug
DKIM-Signature: a=rsa-sha256; bh=QaK+4wIC4mwUHRjD9ht4dwi4uyxdQUVpwueGYGz2r28=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1782771501; v=1;
 b=PmGCgehp9xYxgPpn2rUrLLDnY6bsduPA9K+iKtwZF0tYCkB1tMyv88z1FF7UOIeiHgocpYBB
 sZqMpWfOWrUl4QUTEmxWpBBpylkO0Nn4zML5jJaYCDYTeTuekvP+hzZL5KezWpmMiCupOiHYiiN
 NAzAfYiE3UfJFCcoFv02x9EF7QiQlDG2K2YXZhnBXIVI5c6ZidWRyslJbuhqXpDjN3iWVtGZzWq
 6Ur+mVggpbSURcldjxopSokHjwXE8j1I+CDWpKiQqaAIWQNhTGa5EjIIB6gFYYcl/gXDt78wgqh
 IbBX/QY33UtYgO56qaKR+s8/5xDf//G4vl8e6xffl43Jw==
X-purgate-ID: tlsNG-d25034/1782771501-92120D51-219E6CD2/0/0
X-purgate-type: clean
X-purgate-size: 1665

On Thu, Jan 22, 2026 at 04:52:36PM +0100, Jan Beulich wrote:
> > +        /* Not x2APIC, read from MMIO */
> > +        and     $APIC_BASE_ADDR_MASK, %eax
> > +        mov     APIC_ID(%eax), %esp
> > +        shr     $24, %esp
>
> I have to admit that I'm rather hesitant towards seeing %esp used like this.

I'll switch to %ebp to pass APIC ID.

> > --- a/xen/arch/x86/boot/x86_64.S
> > +++ b/xen/arch/x86/boot/x86_64.S
> > @@ -15,7 +15,33 @@ ENTRY(__high_start)
> >          mov     $XEN_MINIMAL_CR4,%rcx
> >          mov     %rcx,%cr4
> >
> > -        mov     stack_start(%rip),%rsp
> > +        test    %ebx,%ebx
> > +        cmovz   stack_start(%rip), %rsp
> > +        jz      .L_stack_set
> > +
> > +        /* APs only: get stack base from APIC ID saved in %esp. */
> > +        mov     $-1, %rax
>
> Here and below 32-bit insn would do fine. However, ...

Are all addresses guaraneed to be below 4 GiB?

> > +        lea     x86_cpu_to_apicid(%rip), %rcx
> > +1:
> > +        add     $1, %rax
> > +        cmp     $NR_CPUS, %eax
> > +        jb      2f
> > +        hlt
> > +2:
> > +        cmp     %esp, (%rcx, %rax, 4)
> > +        jne     1b
>
> ... can't all of this be a simple REPNE SCASL?

It can, but then can't have an upper bound, right?

> As to the upper bound of NR_CPUS, do we really need to look this far?

Are you suggesting to use `max_cpus` instead?

> > +        /* %eax is now Xen CPU index. */
> > +        lea     stack_base(%rip), %rcx
> > +        mov     (%rcx, %rax, 8), %rsp
> > +
> > +        test    %rsp,%rsp
>
> Nit: Blank after comma please.

Sure.

Regards,
Sergii

