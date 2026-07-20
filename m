Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97E8C44527
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 09:57:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366414.1616299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlkkt-00061P-UI; Mon, 20 Jul 2026 09:57:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366414.1616299; Mon, 20 Jul 2026 09:57:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlkkt-00061I-RR; Mon, 20 Jul 2026 09:57:47 +0000
Received: by outflank-mailman (input) for mailman id 1366414;
 Mon, 20 Jul 2026 09:57:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wlkkt-00061C-2V
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 09:57:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlkks-006E5l-3h
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 11:57:46 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a5df10e-e002-0a2a0a5209dd-0a2a4508ae0a-32
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 11:57:46 +0200
Received: from [74.125.224.42] (helo=mail-yx1-f42.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a5df118-f659-0a2a45080019-4a7de02af02b-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 11:57:45 +0200
Received: by mail-yx1-f42.google.com with SMTP id
 956f58d0204a3-664c6304683so5498768d50.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 02:57:45 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1784541464; cv=none;
        d=google.com; s=arc-20260327;
        b=QBEq9KI0mdYctJi1ZNllxni4XhSjhqtYH+QLUjRKdpV823mWNNbaT4WItrqn6/8wMj
         MdPNbtgMN5DIQ1KDRnNE0XvH/As47f+ZdVAC7qVvEi8o3K9EJEiQwIw7ahpDG9/U2Sut
         ZpwX2lrlh+KFQuAECU4BU399OArOaTy/0XiUzJuNSV+4MAkLVbNklA41yQ3qRAzZf+ux
         7oF2+P7Fw5JKmMFKwHIhRNuxL7s5HyIma4A2LSPc8lcVOHJz/K5JlSOcvCxsq6i7r2eR
         EUpreypvImmLLzIPluYBVu+KUzVbmXB/x6FbhFJX/24IxkTkEJKzOd8uAeK9ABQuC9B+
         eHoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o9wv+vt0kf3eYShVpVbOtz1n6i3oPEqytW0Oh8ZxUN4=;
        fh=cnTo6Tg69lXnwSXiPguVimOwedesAXdkped6OqKsO8k=;
        b=AYzcK+Yo95NF1D3Y+XqqcWwNUs53zePmKOus1VaZswFLej5uC3CFNG2Rb7UCq6OeCB
         VaIHR+u2SboDTynQr4wL+b7yW5J5zav/1SRHYvouXSoYA7txrte4vgaOfdHB3Sof2Zfy
         FDGV5qS3diHzdPYI3qna/kfwk638ru5ICV6Jp6fNpy7b6Gt/xDPHDg2t8sqXjzVepfRc
         XQ112asH9esspnEaud2LjIiUFBs/8j9OkJDx90B6sz8kvSWZgRZy3QujjQP9frNsrmWL
         UF5iTZPUatKISCYxbN6taTcHsN7QSSFt0D1axYQK2FSGXnkEbyU845mo2LMHUeG6QcOI
         hXcA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784541464; x=1785146264; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o9wv+vt0kf3eYShVpVbOtz1n6i3oPEqytW0Oh8ZxUN4=;
        b=QEi2exMirR0B88ZEG4oDJkAVitllF3nOfy+mN3cHAsrKAktpxiqnRfmx2HhoDMWpB5
         PmHl9uDLe3F6zcU1nfx30720+44UWHZAj4rKoEIolrsc47lLUF44TTGFh7vX6TZeutFg
         CjZ0jDjwTZj8z4yYCpWBT4rUDCgpfjsKZbW2MSC+J9kC57t3i2FOXRlPqKss6bBJtBfs
         7vh0Fkj2crvk3TAVp40KRk8Lz/4gbaHkxKY4E8PRN117aiI0ENvodfwsoeqnVeiWYKV9
         hyHg21aVZOBMQeKr//C7KyyyBXrUKudzosqSh+TUhSFqL+4tmQqqrdg56E+Y46iwVANx
         pgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784541464; x=1785146264;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o9wv+vt0kf3eYShVpVbOtz1n6i3oPEqytW0Oh8ZxUN4=;
        b=gzvEvOAU9Ue1Iw5FCXzCXMCOPgzzmDzPUwtwGPA5XDpp9M5SsDujaia/lgi1SNpLq0
         7CzL+O8iUNgtBusfvahV5hPUZdbzFW26JqFxMygx5x9Sl2mnSt90/Lv1+8QJfYUxaHR1
         e2+K6nvNVOvu1MYUpwjk8En6HjVWqGFI3q05FJ/LcQ/Va5MDxep5oZ2qRoa+6Xwovkzs
         Cq+qEKE/wcfO0sl8hMUvxpiSjRWlXdv9xKTxr2Vmu2TJQ7udVaprdagg1YFTdjPtlXCg
         9zhUxUKo76mRpcqACTvOo8Is6Rd77usktJjJz80BuipStzrYCt5I7i9vd3wrcovES2Wo
         Gltg==
X-Gm-Message-State: AOJu0YwVcaM5kTCKhvg3t/D1y6dqvskoGWo0H7NQYREBIcO+i/jlJN9V
	7bB8NoSsMa8qRWyP9AGShMFY7SP9DCtcBz2vuF0tDTnjRxwyVAuDHRSXV6ZMyRhdGJxJfCzDOdt
	E78MiX4b9ztIZK82Otybuzd/tSPRf7WLXK6Eb
X-Gm-Gg: AR+sD13WWdWWAuUyNzwo8ahSx8uXtK/6EoWjRSj3Ugnj6BKepBE9/F6lkU/4oP79VXW
	piPkJlFCU+D1hLEXwfctYSmpM04Rsjho44caxYivGCqV92alsWVZoJDtdznhSDFCevVxDLjMJnC
	7Wa2aRBMePO+TVsNuZlqWoJOFVx8gTt3knsUI3/NT+47otqa6mtdDIQab7Z/pJ/d8L5HzZtmoXC
	ILZLf8AD5ncFe54jqStU8LRggksCI7oqzVcEXaWPRKISa3NdCsWSMV4mevsyP6rAkygx2TfHOi+
	O6eKXyRjiMdvf5/3O1MtyFAkPWxa
X-Received: by 2002:a05:690c:46c1:b0:80c:85e5:8745 with SMTP id
 00721157ae682-81ef262b5famr43042617b3.67.1784541464152; Mon, 20 Jul 2026
 02:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260720001223.2876628-1-marmarek@invisiblethingslab.com>
In-Reply-To: <20260720001223.2876628-1-marmarek@invisiblethingslab.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Mon, 20 Jul 2026 10:57:33 +0100
X-Gm-Features: AUfX_mz919yePEREmTPdnG0zI60iGVMzi5zlnPglgeLGU4oRqx7Oi5DWAq241rQ
Message-ID: <CAHt6W4derNf71m6hjB=8DOeghtSQ6N+sMenJZd2iOn1EJxRaiw@mail.gmail.com>
Subject: Re: [PATCH] x86/domctl: restore all registers in arch_{get,set}_info_guest()
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1784541466-D735D87B-E299431A/0/0
X-purgate-type: clean
X-purgate-size: 3128

On Mon, 20 Jul 2026 at 01:13, Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> Commit 9f892f84c279 ("x86/domctl: Stop using XLAT_cpu_user_regs()")
> converted memcpy() of the cpu_user_regs structure to explicit copy of
> its fields. In the compat case, it intentionally missed few of them,
> named in the commit message. But the 64bit case missed also r8-r15
> registers, which was not intentional. This, at least, caused Linux
> 6.18.x crash when resuming PVH domU.
>
> Fix it by adding missing assignments.
>
> Fixes: 9f892f84c279 ("x86/domctl: Stop using XLAT_cpu_user_regs()")
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
> ---
>  xen/arch/x86/domain.c | 8 ++++++++
>  xen/arch/x86/domctl.c | 8 ++++++++
>  2 files changed, 16 insertions(+)
>
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 1d458f1372e5..ba7244ccc513 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1255,6 +1255,14 @@ int arch_set_info_guest(
>
>      if ( !compat )
>      {
> +        v->arch.user_regs.r15               =3D c.nat->user_regs.r15;
> +        v->arch.user_regs.r14               =3D c.nat->user_regs.r14;
> +        v->arch.user_regs.r13               =3D c.nat->user_regs.r13;
> +        v->arch.user_regs.r12               =3D c.nat->user_regs.r12;
> +        v->arch.user_regs.r11               =3D c.nat->user_regs.r11;
> +        v->arch.user_regs.r10               =3D c.nat->user_regs.r10;
> +        v->arch.user_regs.r9                =3D c.nat->user_regs.r9;
> +        v->arch.user_regs.r8                =3D c.nat->user_regs.r8;
>          v->arch.user_regs.rbx               =3D c.nat->user_regs.rbx;
>          v->arch.user_regs.rcx               =3D c.nat->user_regs.rcx;
>          v->arch.user_regs.rdx               =3D c.nat->user_regs.rdx;
> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> index 07f712a0a40d..3ea4c650eee0 100644
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -1481,6 +1481,14 @@ void arch_get_info_guest(struct vcpu *v, vcpu_gues=
t_context_u c)
>      if ( !compat )
>      {
>          /* Backing memory is pre-zeroed. */
> +        c.nat->user_regs.r15               =3D v->arch.user_regs.r15;
> +        c.nat->user_regs.r14               =3D v->arch.user_regs.r14;
> +        c.nat->user_regs.r13               =3D v->arch.user_regs.r13;
> +        c.nat->user_regs.r12               =3D v->arch.user_regs.r12;
> +        c.nat->user_regs.r11               =3D v->arch.user_regs.r11;
> +        c.nat->user_regs.r10               =3D v->arch.user_regs.r10;
> +        c.nat->user_regs.r9                =3D v->arch.user_regs.r9;
> +        c.nat->user_regs.r8                =3D v->arch.user_regs.r8;
>          c.nat->user_regs.rbx               =3D v->arch.user_regs.rbx;
>          c.nat->user_regs.rcx               =3D v->arch.user_regs.rcx;
>          c.nat->user_regs.rdx               =3D v->arch.user_regs.rdx;

Reviewed-by: Frediano Ziglio <frediano.ziglio@citrix.com>

Frediano

