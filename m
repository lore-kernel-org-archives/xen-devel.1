Return-Path: <SRS0=Sbf7=AM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E4FBC433E1
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2020 15:43:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EABC02071A
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2020 15:43:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bq1vY63R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EABC02071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqest-0006mO-9i; Wed, 01 Jul 2020 15:42:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iA1B=AM=gmail.com=brgerst@srs-us1.protection.inumbo.net>)
 id 1jqess-0006mJ-D4
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 15:42:50 +0000
X-Inumbo-ID: 84a69a7c-bbb1-11ea-bb8b-bc764e2007e4
Received: from mail-io1-xd43.google.com (unknown [2607:f8b0:4864:20::d43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84a69a7c-bbb1-11ea-bb8b-bc764e2007e4;
 Wed, 01 Jul 2020 15:42:49 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id o5so25431521iow.8
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2020 08:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hvie/6BG7o1swX84/UM5fLpFCqjSlLJ7YxyaK37mWfQ=;
 b=Bq1vY63RSI+AVQWedtGjs4OUW2V0itIttXR/Ci9bU+UKtI2BWdpUf4sDz96BGrSGyR
 V/UHlS3aV5SiS1fho1aDTwbVxTp9t9zupgusW9YlBOKSFD1s5HwzZCEnfkzKUo4houln
 Cb9GusQWPx+4H9uO3kYPoNxDNhXwNZRfOArcBfdPzeZujuNW7QbqNM+E5s1nPvPswtiE
 yalC+9Rq/obRStT18qIsbrsHaiLJfmIufmx2kDpKPpibWV64gwBlaNJtvv+rkyGKxq/D
 QNlSZpiBWDiBf25Mu9KGz+xPLsEN9KPmrpg9RuyfbJ9gKv5/mawluJJ9fmVMi2Zym+aS
 HSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hvie/6BG7o1swX84/UM5fLpFCqjSlLJ7YxyaK37mWfQ=;
 b=p6fLT44+iaL5fIdVJHgY3FAfi3r7wGTnBQgOHWk7JN/thD+OwLjxDIpiiiQgEg1GmZ
 cXKtSSY57XIpt7ilbMqIhtCH4NpYhtTj2la1oeExD+M0UkAq7AGrORuJs4yVaXenmIm0
 8BXEq3LOcrYWH97uSOQxMt9g0h6CumVwZE+ewq/nAtoZkc+8DWxImoQvszhNgPPIEgvK
 RJoG6w+OZVMhKmPye8TJ7jN/LGB34jG3MMzkxY0fkmtwAeIa0ejorgxntHtzhdlaPvw1
 dd7+M2Mwad87rOJG2jGYD4+PUWfcrX9Zhtd1ur1ijrOsJdhUIVVGE4/gJxa+h+YRy9ra
 cwQg==
X-Gm-Message-State: AOAM533ioP/JKaiyzXK77eVsLW6D7OjRqGvJeHb10e7VsKc08zsG52De
 AYZqayNcWOOBXdCmCWS6qynCKD1bLvXj36lzcw==
X-Google-Smtp-Source: ABdhPJwY58186upJGjF+++Cg40KulQrFPTck9+8exmcfwwDU6enLRHtvLKw+YqEw0n/2SyAqb90qlC0X5+uiFSQ+OaU=
X-Received: by 2002:a5e:d90c:: with SMTP id n12mr2832816iop.144.1593618168297; 
 Wed, 01 Jul 2020 08:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593191971.git.luto@kernel.org>
 <947880c41ade688ff4836f665d0c9fcaa9bd1201.1593191971.git.luto@kernel.org>
In-Reply-To: <947880c41ade688ff4836f665d0c9fcaa9bd1201.1593191971.git.luto@kernel.org>
From: Brian Gerst <brgerst@gmail.com>
Date: Wed, 1 Jul 2020 11:42:37 -0400
Message-ID: <CAMzpN2iW4XD1Gsgq0ZeeH2eewLO+9Mk6eyk0LnbF-kP3v=smLg@mail.gmail.com>
Subject: Re: [PATCH 3/6] x86/entry/64/compat: Fix Xen PV SYSENTER frame setup
To: Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 26, 2020 at 1:30 PM Andy Lutomirski <luto@kernel.org> wrote:
>
> The SYSENTER frame setup was nonsense.  It worked by accident
> because the normal code into which the Xen asm jumped
> (entry_SYSENTER_32/compat) threw away SP without touching the stack.
> entry_SYSENTER_compat was recently modified such that it relied on
> having a valid stack pointer, so now the Xen asm needs to invoke it
> with a valid stack.
>
> Fix it up like SYSCALL: use the Xen-provided frame and skip the bare
> metal prologue.
>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: xen-devel@lists.xenproject.org
> Fixes: 1c3e5d3f60e2 ("x86/entry: Make entry_64_compat.S objtool clean")
> Signed-off-by: Andy Lutomirski <luto@kernel.org>
> ---
>  arch/x86/entry/entry_64_compat.S |  1 +
>  arch/x86/xen/xen-asm_64.S        | 20 ++++++++++++++++----
>  2 files changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/arch/x86/entry/entry_64_compat.S b/arch/x86/entry/entry_64_compat.S
> index 7b9d8150f652..381a6de7de9c 100644
> --- a/arch/x86/entry/entry_64_compat.S
> +++ b/arch/x86/entry/entry_64_compat.S
> @@ -79,6 +79,7 @@ SYM_CODE_START(entry_SYSENTER_compat)
>         pushfq                          /* pt_regs->flags (except IF = 0) */
>         pushq   $__USER32_CS            /* pt_regs->cs */
>         pushq   $0                      /* pt_regs->ip = 0 (placeholder) */
> +SYM_INNER_LABEL(entry_SYSENTER_compat_after_hwframe, SYM_L_GLOBAL)

This skips over the section that truncates the syscall number to
32-bits.  The comments present some doubt that it is actually
necessary, but the Xen path shouldn't differ from native.  That code
should be moved after this new label.

--
Brian Gerst

