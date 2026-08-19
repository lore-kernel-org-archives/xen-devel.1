Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA69DC5B572
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 07:10:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1394698.1633368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwaR5-0004mm-Vt; Wed, 19 Aug 2026 07:10:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1394698.1633368; Wed, 19 Aug 2026 07:10:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwaR5-0004mf-TQ; Wed, 19 Aug 2026 07:10:07 +0000
Received: by outflank-mailman (input) for mailman id 1394698;
 Wed, 19 Aug 2026 07:10:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <arthurborsboom@gmail.com>) id 1wwaR3-0004Vv-Is
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 07:10:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwaR2-00947D-Vl
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 09:10:04 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <arthurborsboom@gmail.com>)
 id 6a8556c3-8faa-0a2a0a5109dd-0a2a4502daba-48
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 09:10:04 +0200
Received: from [209.85.161.52] (helo=mail-oo1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <arthurborsboom@gmail.com>)
 id 6a8556cb-6ca4-0a2a45020019-d155a134ec12-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 09:10:04 +0200
Received: by mail-oo1-f52.google.com with SMTP id
 006d021491bc7-6aa9606ddadso612700eaf.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 00:10:04 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1787123403; cv=none;
        d=google.com; s=arc-20260327;
        b=BJeRTzjW+DqvOqq4O35VR38hVsl0RYbQ+U+dwW4eX6w1CeNpTDrsQX0XQCO9nGm/Ti
         oMoanFFW//pEu9jz3j3YTpP7xRo3Kc0tBF2FwUrBxGK7ETXOuWCYZK5hRfbql5xc6zQ7
         AU+b9h4P9CgzjAEKQKf05im1HEPsBz2Oeux0wcU9CZ+1DCwHLtmmfqJy6s9z200p7YZ7
         vFL7tP8MplWu1jzzKpM5u54h11C6A0BNIhXm/ltTzHqs5+7PSvc+w6Pk+JjJu9ng3IF5
         1clqOx2UOvLx6W5R8mpku8KAXTQ59p87aDWgBbAh/B8Yw0Buc9U2gENA/MnNQEQcvu+w
         w1AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=H0UQa7SJVLlMpEKFF4UaRWDyvNxTtVVlXym54BMWUlA=;
        fh=7sFv6QZAJlpg3YTCZX0B+j1POgKz6Tmh3lBntxDYpAE=;
        b=HYM97RI3Cx8fHzHQjP0ERB2LkEMLiuQapE2CDC46X6CtwVlnCrzXy2W5ApvPfIYuF5
         Hyxr6f8O4c2raTQzawJiFrGpMNBex1NQnW6v5vuSEOIQYAZD5+WaU0lJwr3O29PBEYoP
         SwP6j/XIv+1+uXk8hxnuKMLdTIPY2/N49HBRyV7wFpBrC6Z5vR8PrP+kaehg09d1itON
         t46tQVE/E9nksDzEXiC1KsKT7+llkQdFdr/ft3ELfTi6DZj+ZdbsMpUGA0vFGPqHjs3b
         UFe12rAYzE3zGTy8+rsk/gPY0BELbkwfY4WC52V4z7/HQUYy30OL63lSoFnxcAz6mOUN
         YVOA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787123403; x=1787728203; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H0UQa7SJVLlMpEKFF4UaRWDyvNxTtVVlXym54BMWUlA=;
        b=dRCaU1CSLNahCvanGcO+dU3eO4Ad7L0L8CZNyJ28+H7a/tHpf52nV9M96A0fu/OnV6
         VXwdEn2R4JwGKtuppQwO5l8JR2JyAr7qyFehZDy5yJ6WkR6b+1NTmPL0jX1lfH+NOY8q
         f0ZhAeEfP2X1eLpXBpn42sCBRbM23YZsM3XufgWnGz4heuXDjjwxfyfA2l/m56ygoAhY
         LLInrgp8bmFCZYetAmPOOQIe/fCYeBUojrJu7KYoFQlwARpvc8Uqmivn16vy04niAi2f
         vDYfbWo9UsB097tk21VCdU+FIOFuMdsmfBROyhwRth/XJ6lAdMtC7QyYzdc70Xh1Ut1O
         bdqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787123403; x=1787728203;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H0UQa7SJVLlMpEKFF4UaRWDyvNxTtVVlXym54BMWUlA=;
        b=BUkQFz+AJH2zo04vu+Gyl+sPWgq4L6RrM1K6rnnaPi7VhgrI+r5abLMLl31CW+dEGh
         +FstVEPU8Lh/KKas+efOetvDvw6cPil4DWkP782kf8uVpV1grCTQ2v5zp+Bo4qM9vHog
         CAUpJIsh6EHRSi4yZGOcgDACTDK2lyKRY20W1oN3mGJEGH1mT3qH5qLrWQYPJSIlWk3/
         /s8p/ADKpckoKHnSCCHU0m54krI61GnIC70sn9ndFnJgWCGq8VYG2RpkDBUfejU2BiMc
         BIHeM2m7l7x83Q+tWUdSL9trFp+eAHbr6iialF91FDSd579FAGi2MP2xrl1euYZG36fK
         ry9Q==
X-Gm-Message-State: AOJu0YxlfXOmc4U5IeO8zAkEIRj/aAZstten2CpGF7SIB9lb46jVLR0I
	+C0yLGuNpwpLRohu4mOcRCNu1N7C4j8Ku8h87BXw6iiJMwImI30/9JlMa3I8d0bZTZPwAxpSe+C
	6qcu686goIlYoCZRy/vSLc8bT3ehYqa2M7CXPfTiZCWJm
X-Gm-Gg: AR+sD10WCDU60ACYUoXC2iJsdTs3ak8smJRTyoBYPZ3Uj675XfoY+pSov/0GTF+UygA
	mzSvdUEJyyl2Q5IXs9D9mK/CzBtXUjO/HlKxR7d8NrvgPHWEovrSaY0XxlOQOUhgN6Vw8rYCnlx
	MVhXDiFvurA5c/M1FaERkzuxgVkxJ4kLIoFvQRa5Vi4+AzH009yuClebMp/1pzKI6FOAQHAPJGM
	9EE6aDvahJ5+ppIJUm8oIS/nzjtuIW9YtH6t87yH38OQmvDQ0u/U568Tp+YtDDAO0dQoV3fupi9
	TxFEz7bD8LL2pGfuUw1umWQN6hGIOZQlD8d+DGGmyzJrBT7mxPZyyW7rJFSp+9UBwLnj0XcD2rN
	XfdixLqw+4FqVmCqItYxPJdMF2vNtpEmhxe7s5nccyQLTBjSRg4ow+fwJMecRszZ7c9fsmhG82O
	bXcfNWuIgDdg==
X-Received: by 2002:a4a:e90d:0:b0:6ae:ab01:91a8 with SMTP id
 006d021491bc7-6b13c6e1872mr2346910eaf.34.1787123402963; Wed, 19 Aug 2026
 00:10:02 -0700 (PDT)
MIME-Version: 1.0
References: <CALUcmUkm7eL2RtqAn3fJxrMdY4aj8AYzkFZfs7LVwntSLa44Wg@mail.gmail.com>
 <4a1b5392-93b9-4b9e-bf65-3fb280f385fa@suse.com>
In-Reply-To: <4a1b5392-93b9-4b9e-bf65-3fb280f385fa@suse.com>
From: Arthur Borsboom <arthurborsboom@gmail.com>
Date: Wed, 19 Aug 2026 09:09:46 +0200
X-Gm-Features: AcwNN1U8eFtzbjZUw9Hn3LSM1B1eaw_TN6bVF5EKgDWoLyjIqApTklAIsxl3FOc
Message-ID: <CALUcmU=QNXA8gs8JYy01tLVOH-y8mjZM-GxKzOCoA_3e2QFVwQ@mail.gmail.com>
Subject: Re: [BUG] Linux kernel crash in amd_smn_init during PVH Dom0 boot on
 AMD EPYC
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-720697/1787123404-F16AF2AC-1ED39421/0/0
X-purgate-type: clean
X-purgate-size: 5602

> Well, a pretty natural question: What amount of research have you done yourself?

Lovely response. You really know how to motivate people and welcome
them into a community.

It has taken me about 1,5 day of work to find out why the screen
remained black, to determine where the problem was, how to retrieve
potential info by a serial-over-LAN console, subscribe to the mailing
list, and create this bug report to help.

But don't worry, I won't do any debugging anymore for the Xen project,
you have made sure of that. No need to respond. I will unsubscribe
myself from the mailing list after this mail.

Thanks for the warm welcome.
Enjoy your day

On Wed, 19 Aug 2026 at 08:50, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 18.08.2026 23:47, Arthur Borsboom wrote:
> > Hi,
> >
> > I am encountering an early Linux kernel crash when booting a PVH
> > Dom0 on an AMD EPYC system (Family 19h Model 97). PV boot on the
> > same system works fine. The crash occurs during amd_smn_init due
> > to a divide-by-zero exception.
> >
> > There is a potentially related bug report discussing a Linux patch
> > addressing AMD SMN initialization under Xen PVH:
> >
> > https://patchew.org/linux/20260623211904.3674-1-jason.andryuk@amd.com/
> >
> > It seems there was an ongoing discussion between Linux devs who
> > seem to have the need to align with Xen devs for a proper/future-proof fix.
> > I am submitting this report to share raw hardware trace data and
> > help move this forward.
> >
> > --- System Details ---
> > CPU: AMD EPYC 4344P 8-Core Processor (Family 25 / 0x19, Model 97
> > / 0x61, Stepping 2)
> > Motherboard: MSI MSIS366/S3661 (BIOS ES366AOC.10P 05/29/2025)
> > Xen Version: 4.20.0 (Command line: dom0_mem=8192M,max:8192M dom0=pvh
> > loglvl=all guest_loglvl=all sync_console noreboot console=com1,vga)
> > Linux Kernel: 7.1.5-arch1-2
> >
> > --- Kernel Crash Log ---
> > [...]
> > [    0.817348] Oops: divide error: 0000 [#1] SMP NOPTI
> > [    0.817348] fbcon: Taking over console
> > [    0.823766] CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> > 7.1.5-arch1-2 #1 PREEMPT(full)
> > 33708094282b4038de0f4f0d201b68f6a0b5d9bf
> > [    0.839766] Hardware name: MSI MSIS366/S3661, BIOS ES366AOC.10P 05/29/2025
> > [    0.847766] RIP: 0010:amd_smn_init+0x1ed/0x280
> > [    0.852766] Code: d2 45 31 f6 45 31 ed 66 41 f7 f4 89 c5 48 89 df
> > e8 c8 c7 1b fd 48 89 c3 48 85 c0 0f 84 48 ff ff ff 44 89 e8 31 d2 45
> > 8d 7d 01 <66> f7 f5 66 85 d2 75 42 66 90 eb 2c 41 0f b7 ce 48 8d b3 d0
> > 00 00
> > [    0.870766] RSP: 0018:ffffc9000004bdc8 EFLAGS: 00010246
> > [    0.878766] RAX: 0000000000000000 RBX: ffff888102661000 RCX: 0000000000000007
> > [    0.887766] RDX: 0000000000000000 RSI: ffff888102661000 RDI: 0000000000000000
> > [    0.895766] RBP: 0000000000000000 R08: 0000000000000282 R09: ffff888100f57680
> > [    0.903766] R10: ffffea0004044580 R11: ffff888100042700 R12: 0000000000000002
> > [    0.911766] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000001
> > [    0.919766] FS:  0000000000000000(0000) GS:ffff8882b2010000(0000)
> > knlGS:0000000000000000
> > [    0.927766] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [    0.935766] CR2: 0000000000000000 CR3: 0000000003822000 CR4: 0000000000750ef0
> > [    0.943766] PKRU: 55555554
> > [    0.943766] Call Trace:
> > [    0.948766]  <TASK>
> > [    0.951766]  ? __pfx_amd_smn_init+0x10/0x10
> > [    0.956766]  do_one_initcall+0x8e/0x3f0
> > [    0.959766]  kernel_init_freeable+0x24a/0x2d0
> > [    0.965766]  ? __pfx_kernel_init+0x10/0x10
> > [    0.967766]  kernel_init+0x1a/0x140
> > [    0.973766]  ret_from_fork+0x2a7/0x330
> > [    0.974766]  ? __pfx_kernel_init+0x10/0x10
> > [    0.982766]  ret_from_fork_asm+0x1a/0x30
> > [    0.988766]  </TASK>
> > [    0.989766] Modules linked in:
> > [    0.994772] ---[ end trace 0000000000000000 ]---
> > [    0.999769] RIP: 0010:amd_smn_init+0x1ed/0x280
> > [    1.004770] Code: d2 45 31 f6 45 31 ed 66 41 f7 f4 89 c5 48 89 df
> > e8 c8 c7 1b fd 48 89 c3 48 85 c0 0f 84 48 ff ff ff 44 89 e8 31 d2 45
> > 8d 7d 01 <66> f7 f5 66 85 d2 75 42 66 90 eb 2c 41 0f b7 ce 48 8d b3 d0
> > 00 00
> > [    1.004771] RSP: 0018:ffffc9000004bdc8 EFLAGS: 00010246
> > [    1.004773] RAX: 0000000000000000 RBX: ffff888102661000 RCX: 0000000000000007
> > [    1.004774] RDX: 0000000000000000 RSI: ffff888102661000 RDI: 0000000000000000
> > [    1.004775] RBP: 0000000000000000 R08: 0000000000000282 R09: ffff888100f57680
> > [    1.004776] R10: ffffea0004044580 R11: ffff888100042700 R12: 0000000000000002
> > [    1.004777] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000001
> > [    1.004778] FS:  0000000000000000(0000) GS:ffff8882b2090000(0000)
> > knlGS:0000000000000000
> > [    1.004779] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [    1.004780] CR2: 0000000000000000 CR3: 0000000003822000 CR4: 0000000000750ef0
> > [    1.004782] PKRU: 55555554
> > [    1.004784] Kernel panic - not syncing: Attempted to kill init!
> > exitcode=0x0000000b
> > (XEN) Hardware Dom0 crashed: 'noreboot' set - not rebooting.
> >
> > Please let me know if any additional info would be helpful.
>
> Well, a pretty natural question: What amount of research have you done yourself?
> You really should have found [1], or maybe its v1 counterpart, or the earlier
> report(s) of what I think is this same issue.
>
> Jan
>
> [1] https://patchew.org/linux/20260814214255.83127-1-jason.andryuk@amd.com/20260814214255.83127-2-jason.andryuk@amd.com/
>

