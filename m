Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FF8C44527
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 10:01:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366430.1616317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlkob-0008Bz-Jm; Mon, 20 Jul 2026 10:01:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366430.1616317; Mon, 20 Jul 2026 10:01:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlkob-0008Bs-Gs; Mon, 20 Jul 2026 10:01:37 +0000
Received: by outflank-mailman (input) for mailman id 1366430;
 Mon, 20 Jul 2026 10:01:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wlkoa-0008Bm-4K
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 10:01:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlkoZ-00GOIH-AG
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 12:01:35 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a5df1e6-5cb7-0a2a0a5109dd-0a2a4504d5f6-36
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 12:01:35 +0200
Received: from [209.85.128.170] (helo=mail-yw1-f170.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a5df1fe-b57f-0a2a45040019-d15580aab41b-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 12:01:35 +0200
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-81e9f7491ffso122478907b3.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 03:01:34 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1784541693; cv=none;
        d=google.com; s=arc-20260327;
        b=G/YosWV+IpUTv59+fZZxXZaE9NxhJx8XMbM8GrahgW7Bf/ICkGL9TVyQ5L/ByagDSc
         Rrhrd3kJ4aYg+rskpvObeUNwPPHOSXWWuviRAknpAxgjev+RYWjy22V0diAneE0geuH4
         DR3FedL/ycCg6HaeRxQJyqqkkYQJklUtp6F63xzs/bV0k0Gx095K1ynca/4Ggb5U6mVZ
         JcL9RHj1UTKhTTkW6djp50KPDQDUnM3FwsEM/JbLjnfzRk2zevXx9LEyQEydfe6qWQYV
         VkQws8B8K2+Gn6NIwACGLrx/lyvPBiBeTSjO7ZOygdz+/lw+6cEtCBtvohw+2i/2AGJV
         s7rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SDKRzzdGRcnNNkgrabuwOxbftwIMRAbnSY7PxCk6mdU=;
        fh=wpPYIvM/uAwkGWAfTQr96u7uYNsg7Rgtcx8qhXGsU5c=;
        b=QjNAmc7OTwrHX7ZZdvzfIlPUhI9UX/wEeNjfajdKjtJoFsyBbqo9oPt+vJVEE/lHkA
         JeFk3XZHPrOMrq/LmLNzfbYb2N5KUlslHENSEyUbbiFIYiY9OizZ1zCq2jGfTl//xAWZ
         jw+NtK94cNZRCcFMF304+od3sm/zH8W2Ip9of0XSiA57adGlX7y0cSAbM9d5uQrZpsFm
         MnkHp3nUwkcNL7uSuVj9rxdWyYGY2PKWKhU7EWH/R93FLI61I7PhRNBxHO4rlVZ2UKIe
         eGeitv2wvaYlrJlOg+UzaDo3ZIjQxeVv+URXUtzug15Q/E/mO6RjdA6QILJvvzm6s6fH
         6Y5Q==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784541693; x=1785146493; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SDKRzzdGRcnNNkgrabuwOxbftwIMRAbnSY7PxCk6mdU=;
        b=GMylr0BvZyUmtDmJbebyM2qpDcAAywkUhzcP16dgbys1DN1aNOFTwPCnRsbH/tSC7k
         8lZhKC8GzBbwXDyeQNWxjp5RCJQ7L7HPlSpTemcmqY9UZgBgF24tRfujUpY0/WRK4LQG
         RW2Mrb04eBV2BkBU4zy13ynmWtdSPeMcuYbiMgwDJgxmDHfxMbBUqDaEPM0KgqEhjbbS
         EWbAHGVBv9fdHHfMvfWpJK8AtpG0df/57HNxDra0mw0CjrscX/nqihV3ueUXiEkSt9jr
         aA4gWyKQ2b8gU1ElV25YzScT4yXRecpB6PXpEhaZBOe/DE110UollqoymGBz0QwuH7Qr
         b/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784541693; x=1785146493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SDKRzzdGRcnNNkgrabuwOxbftwIMRAbnSY7PxCk6mdU=;
        b=dsqLr10SUWr/IXssh3FPx6fq4JtdVJt9PmMqGGVwh9GZiZ3ZINP51kgFE1lER64Odm
         uu6Xa+mEUPiV7rhxD3rzKskmVeYtDFqesX7we/EtrV+3C4yBSrNLn6JTbOh/xzWBUcKb
         /vj+PWFoqWDnDIg/PV7kP7/6nxOnUKBVCzZ9bUJY+AgbmmLZAVIMqcHK984wcVFQ9T7B
         IM/mfGiYNLLitlNJfrObFxEi56wvEemZRQpa5rbhGYpSo4BcA3hHzxvX/59wcTCwfjj5
         4l2unv8RvXTMKeKMQoI2RUHYKcgEMS6wmzSp97iovlHir8Bb+WzwiB4HoR4ey3g+wtkO
         WDJA==
X-Gm-Message-State: AOJu0Yy3XAFBKgqTVlqMlGjn0K+n/Ba22wHAbf/C96sHVdEQzK2d6hWf
	nbRbGEBOMbf1hfS+U6T5g5MruA/nF5wxj5SJ1JIMlKk8wYAFnilq4lkaZNqK3T4ndXeRQ8B2Ia1
	q7Z0PTlWSwwFA1amMwVV5b3fpfGv5cx4=
X-Gm-Gg: AR+sD10PF7CeTLvgRlP96xiov0g8SQuq1A4PjJBamyctJE/ND9ZlP9IzCe64N0jya3b
	AkloFjTfXVJu0ADAAnaEy8nQQCVpCXjsh7Eu6HLcv5Q9Zf9YAVMfyN1iYY/YsbORWF/cSW80Cx3
	kCLfc505YmhQjFtkk1avaPJ2xu2qIhJxhBRNA+v2YKHepjAma0CqKWwN6Zag2h1jDcTQLTT0iw8
	0DXvEb8fbqQo/pdIE9qZDjnz2vp5e1r4E91n743nNDde/f7oIi47fk6Ied78eXGItqEZO0vBT+Z
	xy7/HCNORg/WQ/n4SA==
X-Received: by 2002:a05:690c:692:b0:81e:8b74:b35c with SMTP id
 00721157ae682-81ef28050cbmr40089067b3.36.1784541693336; Mon, 20 Jul 2026
 03:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260720092238.2094500-1-andrew.cooper3@citrix.com>
In-Reply-To: <20260720092238.2094500-1-andrew.cooper3@citrix.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Mon, 20 Jul 2026 11:01:21 +0100
X-Gm-Features: AUfX_mwEAxXRdDiAlPYDu3Vt-HjVHYW5ZqJXLp7psZ9IcTUQuigNNpMTa7PdrDo
Message-ID: <CAHt6W4fWtb9rtjq+fxkECAjB3m_ExkxXqqzDvSp-4g30JuYzig@mail.gmail.com>
Subject: Re: [PATCH] x86/domctl: Reorder user_regs accesses for efficiency
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1784541695-51CD7B50-683A3C6F/0/0
X-purgate-type: clean
X-purgate-size: 5548

On Mon, 20 Jul 2026 at 10:38, Andrew Cooper <andrew.cooper3@citrix.com> wro=
te:
>
> The current order is derived from expanding XLAT_cpu_user_regs() which us=
es
> the x86_32 cpu_user_regs order.  This is correct for one the blocks, but =
not
> the others.
>
> In order to work with the prefetcher, rather than against it, loads want =
to be
> in field order.  Make this so for the three paths reading an x86_64
> cpu_user_regs.
>
> No functional change.
>
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Teddy Astie <teddy.astie@vates.tech>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> ---
>  xen/arch/x86/domain.c |  6 +++---
>  xen/arch/x86/domctl.c | 10 +++++-----
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 53a86ba373a4..996b50af7a17 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1259,17 +1259,17 @@ int arch_set_info_guest(
>          v->arch.user_regs.r14               =3D c.nat->user_regs.r14;
>          v->arch.user_regs.r13               =3D c.nat->user_regs.r13;
>          v->arch.user_regs.r12               =3D c.nat->user_regs.r12;
> +        v->arch.user_regs.rbp               =3D c.nat->user_regs.rbp;
> +        v->arch.user_regs.rbx               =3D c.nat->user_regs.rbx;
>          v->arch.user_regs.r11               =3D c.nat->user_regs.r11;
>          v->arch.user_regs.r10               =3D c.nat->user_regs.r10;
>          v->arch.user_regs.r9                =3D c.nat->user_regs.r9;
>          v->arch.user_regs.r8                =3D c.nat->user_regs.r8;
> -        v->arch.user_regs.rbx               =3D c.nat->user_regs.rbx;
> +        v->arch.user_regs.rax               =3D c.nat->user_regs.rax;
>          v->arch.user_regs.rcx               =3D c.nat->user_regs.rcx;
>          v->arch.user_regs.rdx               =3D c.nat->user_regs.rdx;
>          v->arch.user_regs.rsi               =3D c.nat->user_regs.rsi;
>          v->arch.user_regs.rdi               =3D c.nat->user_regs.rdi;
> -        v->arch.user_regs.rbp               =3D c.nat->user_regs.rbp;
> -        v->arch.user_regs.rax               =3D c.nat->user_regs.rax;
>          v->arch.user_regs.rip               =3D c.nat->user_regs.rip;
>          v->arch.user_regs.cs                =3D c.nat->user_regs.cs;
>          v->arch.user_regs.rflags            =3D (c.nat->user_regs.rflags=
 & X86_EFLAGS_ALL) | X86_EFLAGS_MBS;
> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> index 3ea4c650eee0..2ecd81d89b09 100644
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -1485,17 +1485,17 @@ void arch_get_info_guest(struct vcpu *v, vcpu_gue=
st_context_u c)
>          c.nat->user_regs.r14               =3D v->arch.user_regs.r14;
>          c.nat->user_regs.r13               =3D v->arch.user_regs.r13;
>          c.nat->user_regs.r12               =3D v->arch.user_regs.r12;
> +        c.nat->user_regs.rbp               =3D v->arch.user_regs.rbp;
> +        c.nat->user_regs.rbx               =3D v->arch.user_regs.rbx;
>          c.nat->user_regs.r11               =3D v->arch.user_regs.r11;
>          c.nat->user_regs.r10               =3D v->arch.user_regs.r10;
>          c.nat->user_regs.r9                =3D v->arch.user_regs.r9;
>          c.nat->user_regs.r8                =3D v->arch.user_regs.r8;
> -        c.nat->user_regs.rbx               =3D v->arch.user_regs.rbx;
> +        c.nat->user_regs.rax               =3D v->arch.user_regs.rax;
>          c.nat->user_regs.rcx               =3D v->arch.user_regs.rcx;
>          c.nat->user_regs.rdx               =3D v->arch.user_regs.rdx;
>          c.nat->user_regs.rsi               =3D v->arch.user_regs.rsi;
>          c.nat->user_regs.rdi               =3D v->arch.user_regs.rdi;
> -        c.nat->user_regs.rbp               =3D v->arch.user_regs.rbp;
> -        c.nat->user_regs.rax               =3D v->arch.user_regs.rax;
>          c.nat->user_regs.rip               =3D v->arch.user_regs.rip;
>          c.nat->user_regs.cs                =3D v->arch.user_regs.cs;
>          c.nat->user_regs.rflags            =3D v->arch.user_regs.rflags;
> @@ -1514,13 +1514,13 @@ void arch_get_info_guest(struct vcpu *v, vcpu_gue=
st_context_u c)
>      else
>      {
>          /* Backing memory is pre-zeroed. */
> +        c.cmp->user_regs.ebp               =3D v->arch.user_regs.ebp;
>          c.cmp->user_regs.ebx               =3D v->arch.user_regs.ebx;
> +        c.cmp->user_regs.eax               =3D v->arch.user_regs.eax;
>          c.cmp->user_regs.ecx               =3D v->arch.user_regs.ecx;
>          c.cmp->user_regs.edx               =3D v->arch.user_regs.edx;
>          c.cmp->user_regs.esi               =3D v->arch.user_regs.esi;
>          c.cmp->user_regs.edi               =3D v->arch.user_regs.edi;
> -        c.cmp->user_regs.ebp               =3D v->arch.user_regs.ebp;
> -        c.cmp->user_regs.eax               =3D v->arch.user_regs.eax;
>          c.cmp->user_regs.eip               =3D v->arch.user_regs.eip;
>          c.cmp->user_regs.cs                =3D v->arch.user_regs.cs;
>          c.cmp->user_regs.eflags            =3D v->arch.user_regs.eflags;

Reviewed-by: Frediano Ziglio <frediano.ziglio@citrix.com>

Frediano

