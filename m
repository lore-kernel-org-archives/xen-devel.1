Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C1BC43458
	for <xen-devel@archiver.kernel.org>; Tue, 30 Jun 2026 14:18:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1349037.1606821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weZIJ-0001UE-88; Tue, 30 Jun 2026 14:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349037.1606821; Tue, 30 Jun 2026 14:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weZIJ-0001U7-4N; Tue, 30 Jun 2026 14:18:35 +0000
Received: by outflank-mailman (input) for mailman id 1349037;
 Tue, 30 Jun 2026 14:18:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sergii.dmytruk@3mdeb.com>) id 1weZIH-0001U1-BC
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 14:18:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weZIF-000ItK-RY
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 16:18:32 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a43d029-5cb7-0a2a0a5109dd-0a2a4507daec-48
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 16:18:31 +0200
Received: from [188.165.39.218] (helo=6.mo581.mail-out.ovh.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sergii.dmytruk@3mdeb.com>)
 id 6a43d037-9c8e-0a2a45070019-bca527daa525-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 16:18:31 +0200
Received: from director8.ghost.mail-out.ovh.net (unknown [10.110.43.162])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4gqQHC0jDlz5wld
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 14:18:30 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-rsjbd (unknown [10.110.178.131])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 493BBC0128;
 Tue, 30 Jun 2026 14:18:30 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.110])
 by ghost-submission-7d8d68f679-rsjbd with ESMTPSA
 id 2+nhAzbQQ2oufRgAyYwjiQ
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 30 Jun 2026 14:18:30 +0000
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
Authentication-Results:garm.ovh; auth=pass (GARM-110S00420523502-5b46-477d-84e9-af4b20b39931,
                    8153FC81E90989DE28CEFA46AD98A6783E51CAAD) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.183.249
Date: Tue, 30 Jun 2026 17:18:22 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org, trenchboot-devel@googlegroups.com
Subject: Re: [PATCH v3 14/22] x86/boot: choose AP stack based on APIC ID
Message-ID: <akPQLo-GJsAnMj04@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <16a5438f73a026d4db1a5340f599d4839c74fcc6.1748611041.git.sergii.dmytruk@3mdeb.com>
 <1483a375-9662-48b8-8bf2-8cc83386b068@suse.com>
 <akLvI_OJ8RjU_90S@MjU3Nj>
 <4e0585c5-1838-4193-ac92-37e2b9ebcd81@suse.com>
 <akOND2rkKHLxvQmL@MjU3Nj>
 <ea766dbf-2cb4-48ae-8006-1dd5b9652089@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea766dbf-2cb4-48ae-8006-1dd5b9652089@suse.com>
x-ovh-tracer-id: 15003179211115144636
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEfXy7HB8TlWoquFJdNWJ6+mZsln2MBzNQAULfGDXUL/CJQXvA0s7sfj4RNJDHcqYbUyeYUHmL8f/yKzpWZtYz5Us00VouV4tm075z1kZFkNqylZPSnKQRb6/AlBug7/aPqSj/7wOoIN4nLv1+eLwcfESqeHzmkIN6tJUYvLrv7gi8B8FqMcYB+Htz76K/6eu8Q5buFFPBgSz0agsWsdkOi/XSgDaTPGqxkIk+Ot9ujCGD8xdH3VsUCFp5u0mhmfJ8gW27DWzqL5k94E0Xc1Owp318UmFS9t0OuQKIpz/tWObo10anYxLkptyNeSwOJmnXpGPViHtTe6kTSp2GfZ5GHZbj01d+7KX05vb2VuI9JXEE8i5OXqQGvBUT2I/D2xM42o+PKJc2sMZtL26xuFtBQeAM5AeRHJ/4TpK8WrVEuy2T0dEUVX0v93e0BS/+zn5DDO1x91pABe+5VvtxgGhnu607Hvj55NTXYXNK4PNliQZux1twtbtR9+9a4BEYRGictiNl6dMqbU8EPF25PVQBkt8VWUr/3M+2pc75VVVIWq+24PZ7MOESiB9O2h5BW5ZeUGIjy7+lrKUvB9g40Orok8n9LziejJXhAwSw9rBhnSrQSggfFPqhmeZ6IxluxJdJ6h6Re7Ua2+yIgPZonYSTJI8r2Mqiptdt9Rxs25PlUwQ
DKIM-Signature: a=rsa-sha256; bh=cVSDJHA5vpoGz4aKgeJ5l983k7ifnhVhQL9m1wg0DSI=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1782829111; v=1;
 b=mb9JdAEpfUEFCX7SZFxbA3JJ8xVhKWgPFijfpHQg+51434TSUEQ8QWvTBN0JrGMPvZiOSgJb
 H+CiqGydIl4XtQd6F0logCZ/Sle6kqjm8Ae6Jl5lv1A5NHgXCQH+Li0s3quU8WCrSmi7SxGlRJb
 yg8QNiZ3Oo5CExOnwfSK/uqYtd4EK4ENBANTVi3eUQcBHwr741Z//aKE3LqvsNGLQlxueHYwdVn
 1Oz8HpU01bXtWXazpNO0B2Ug4aVhsE/K5E0Smsi8i5gcimX0PGF+Yau0JKohXnFWzb0ixgcDrEp
 +YHFmLIKCZia7gRW7yQNff/IN8VQQ5F3Pc0B4i9FzVDIg==
X-purgate-ID: tlsNG-ef75cf/1782829111-FDD2425E-3F79B3D2/0/0
X-purgate-type: clean
X-purgate-size: 1732

On Tue, Jun 30, 2026 at 11:37:59AM +0200, Jan Beulich wrote:
> On 30.06.2026 11:31, Sergii Dmytruk wrote:
> > On Tue, Jun 30, 2026 at 09:17:59AM +0200, Jan Beulich wrote:
> >> On 30.06.2026 00:18, Sergii Dmytruk wrote:
> >>> On Thu, Jan 22, 2026 at 04:52:36PM +0100, Jan Beulich wrote:
> >>>>> --- a/xen/arch/x86/boot/x86_64.S
> >>>>> +++ b/xen/arch/x86/boot/x86_64.S
> >>>>> @@ -15,7 +15,33 @@ ENTRY(__high_start)
> >>>>>          mov     $XEN_MINIMAL_CR4,%rcx
> >>>>>          mov     %rcx,%cr4
> >>>>>
> >>>>> -        mov     stack_start(%rip),%rsp
> >>>>> +        test    %ebx,%ebx
> >>>>> +        cmovz   stack_start(%rip), %rsp
> >>>>> +        jz      .L_stack_set
> >>>>> +
> >>>>> +        /* APs only: get stack base from APIC ID saved in %esp. */
> >>>>> +        mov     $-1, %rax
> >>>>
> >>>> Here and below 32-bit insn would do fine. However, ...
> >>>
> >>> Are all addresses guaraneed to be below 4 GiB?
> >>
> >> You use %rax as the loop induction variable, so there isn't any address
> >> in it? Plus you already use ...
> >>
> >>>>> +        lea     x86_cpu_to_apicid(%rip), %rcx
> >>>>> +1:
> >>>>> +        add     $1, %rax
> >>>>> +        cmp     $NR_CPUS, %eax
> >>
> >> ... as 32-bit insn here anyway.
> >
> > But %rcx contains an address and it is added to %rax for `cmp` (quoted
> > below).
>
> Well, to use SCAS you will need to change how you use registers. (IOW
> first you need to determine whether SCAS actually can be used here,
> and then - if it can - you will need to arrange register use to fit it.)

It can be used, but I don't see any compelling reason to do it.  The
code doesn't get any shorter and has to recover index from a count.

Regards

