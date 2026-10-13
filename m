Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C506CC6B1C
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 16:17:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448153.1664210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGfBp-0000vH-4I; Tue, 13 Oct 2026 16:17:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448153.1664210; Tue, 13 Oct 2026 16:17:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGfBp-0000vA-1A; Tue, 13 Oct 2026 16:17:21 +0000
Received: by outflank-mailman (input) for mailman id 1448153;
 Tue, 13 Oct 2026 16:17:19 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xGfBn-0000v4-6a
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 16:17:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGfBm-00DbSs-Cj
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 18:17:18 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace597f-bab6-0a2a0a5309dd-0a2a4503a6ac-44
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 18:17:18 +0200
Received: from [209.85.128.169] (helo=mail-yw1-f169.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace598d-fae8-0a2a45030019-d15580a9ad6a-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 18:17:18 +0200
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-8b094046a7aso7213487b3.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 09:17:17 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=linaro.org header.i="@linaro.org" header.h="Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1791908237; cv=none;
        d=google.com; s=arc-20260327;
        b=jSFskG7/Eidg5xl82PQDmZ15kC/RqgtICMGkc3RkW2+uuvfhatgsU0rZzkiA59MAOf
         U8y/PGSb0uu6lh+fStidezaEszBywVEQOMPOndJhoVwRlcxi2AnsntKRLb7u6HcqPcPB
         fC10rdF6/uRv45VXDewfalDWX0QxtDN0Mw+4gDNVHNzGs6wIwq4M8VviyyXT1BWD69lK
         EgAn1xLGtfS9luOBCwmyDyNNVhropZz/7B6+LSvc5dGkkYSPgirM4TzzCVnbf8zGwcis
         jZpZXfgj07+jhG65fzT/tjG9HPpcDqQv9kBwY2OPl3hXFvKHB5NBX2khRENZTLS12cKu
         F1+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kgoBvoAdxeg9Tf8BY5zhua20aW3N8dGlw1G/CJAK2no=;
        fh=bSCDREc9/ThEBdDmIG26m9PQ/qB+dVzPJRz0Wak6Nvo=;
        b=S+hidvdsjVpEFV86ahhM1c4xV4sEFBxtyKLy57bB3Q3DQaTJpYQNDnC3BpD7V9wxB6
         BeRKiS6IqWr7MyUSMlsUL8g7K67u66FPCVIi8XgqdqfGkf9O6rYXq3LeGwC1oHJa70yJ
         cykOXS5VFNU814ufl5XYP0up2O3DIHH9rkRKb0HprAB87lM5PtGXErW6238FWbudQYYt
         m8se0De3xS89LULzN7RKYmHb6Jv2sQRmISFnJx4ZN/UpeMrFGXfQkzalfR7329d2J/g6
         Gv8LJ8KwYMMLLMO14eckC4fckzgkVjARp3SGKxkhV6QuP68vfESLs95/64cStRLro+md
         DFOQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791908237; x=1792513037; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kgoBvoAdxeg9Tf8BY5zhua20aW3N8dGlw1G/CJAK2no=;
        b=bML32fv4FwbWmQQr9LA5rdOhyXhv0S3RyMmGiWMrOQ5F+nT5/pQoysr2DODKO8F0Uy
         Ko4s2loVPLm6ncqCJ3CM46M85kqi6WnpHMmcvpZI3gkmB1xSW3t+rrYlkFDDIwTy5wfr
         lSToIbqnE9/iD0wl3Umufoapfn4IkBJ0hfi7KVdLXx56VlE3m8F+e4KKvE5HFXL2FLIJ
         Lq7C+IXGZ+gUBok60u4Sb20uY6/FGOOxY+1vwWVyurSUx60+tZ57x3XNM908bNzDvysf
         e3xzQ4eDFpb8t2/ihGFCbADUahwJZHUMg/mDwr0CTNhIcgogeBBbA3rx37yyLIxRm9Ul
         d46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791908237; x=1792513037;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kgoBvoAdxeg9Tf8BY5zhua20aW3N8dGlw1G/CJAK2no=;
        b=wrwaSImCCJkrf79qxngFo5nwFdOwkDBlfesagI0/88uHuanppUz4rGuXX8B4oLrwWG
         8K+pXbmiNCRxDlT5K3Pn4YtGVXUFiDKXJB6nSD57/wQwBqrKh0oUzia1yt/esiEc5Dmn
         Kj07bTSbcf4Tq9DLxeaH6RtanLCrNZucfUQikdjmCs1vqc6CHx5D0WdPZ98afa0E9eTd
         ds13VQYGlTyS/KrzAULe+6e7lTk1WVYNghtbr9+BOwLikqgJ9tpJYtDrrRES/8ErdGqS
         YWdhHq97L7NuqeYMqu5W9iwuAhCjG2jwYKu3AovwzxlpQZqAwXzigH71Iu/Xp9rw5WF9
         XK/A==
X-Forwarded-Encrypted: i=1; AKwUvBxyfYOc+hgVNWkHATojHn/qbhRwTy6b8Pht7bc3PX8Y5aCz/BJlI4Jwv2va9VJlnm2R/P7OTvN+WXI=@lists.xenproject.org
X-Gm-Message-State: AFq9FYI6cRndCB7UpOGVJdKNqnf0NxnvC7mLiQS8pn42RKC3L1Uvo6pK
	TdgLJXbBfs21HLH4erzlLIogJgvTfHsTtqrVRKv/L7Y/4eelMO0mRIHrlBmrpTy+jzTM2G+XFfZ
	xEkQ8TQLfPkv+XhrfvrdQOXooDbaM4adi+Gg7IZATZw==
X-Gm-Gg: AYBFou3m3GnJz7eMoPnNhwkGUF7q8Scy7gbK5kyzjDKEAyUtN0ZoUvjME/Xl2tYZ7dh
	3x4Ns+3cLqC8vwLlzCd3biV8eFuyfT/zYiJmIsR2DEH1VlCCpmYy9iKLfkZHyPZm3Vdzz8MxokC
	yrbiltR2aUysbtevNAtCWVpxg4nyNIACEY0b740bRM3ywVBrfCQLPHbKWpIn6pSzo7M/dUYRggI
	FfnTreNlNll6QLEPQse6xdr5R25vDUmvUB5usjr1mEiAkWo81lxGILHGnjd24t7otv1w7bL7y4+
	/vpuS2sezUU5Mm/portqgA7OQDPReheqBBOyFJgFmRUFGSnyct0VsdieFm0JUtd4RvyFHpBk7VW
	gy/Bh6oWQzvlPamiEVqscYymGI2y8fNTRZSHj51c=
X-Received: by 2002:a05:690c:a1cb:b0:891:faab:ff1e with SMTP id
 00721157ae682-8b07ec9b9c9mr32688387b3.4.1791908236645; Tue, 13 Oct 2026
 09:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260916104435.600211-1-mark.caveayland@nutanix.com> <20260916104435.600211-14-mark.caveayland@nutanix.com>
In-Reply-To: <20260916104435.600211-14-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2026 17:17:04 +0100
X-Gm-Features: AclHuK-dBFJEqC_er2SVrafwbd048DTjYp8TESdTJHeoIpTuqcihJui1eCKi-p0
Message-ID: <CAFEAcA-FFiWEs3ZLztVwZ72_TGLuhEBbfKnaZ3NFJJ1W-Wd33A@mail.gmail.com>
Subject: Re: [PATCH 13/22] i8259.c: introduce TYPE_I8259_PIC device
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-33051d/1791908238-6F4C74E9-3970A1AE/0/0
X-purgate-type: clean
X-purgate-size: 2138

On Wed, 16 Sept 2026 at 11:50, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> This device represents a PIC for an x86 machine consisting of 2 cascaded i8259
> devices wired accordingly.
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>  hw/intc/i8259.c | 133 ++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 118 insertions(+), 15 deletions(-)
>
> diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
> index af33b71591..fcc94e12f8 100644
> --- a/hw/intc/i8259.c
> +++ b/hw/intc/i8259.c
> @@ -25,7 +25,9 @@
>  #include "qemu/osdep.h"
>  #include "hw/intc/i8259.h"
>  #include "hw/core/irq.h"
> +#include "hw/core/qdev-properties.h"
>  #include "hw/isa/isa.h"
> +#include "qapi/error.h"
>  #include "qemu/timer.h"
>  #include "qemu/log.h"
>  #include "hw/isa/i8259_internal.h"
> @@ -36,6 +38,22 @@
>
>  #define TYPE_I8259 "isa-i8259"
>
> +#define TYPE_I8259_PIC "isa-i8259-pic"
> +
> +struct I8259PICState {
> +    DeviceState parent_obj;
> +
> +    qemu_irq pic_out_irq;
> +    qemu_irq pass_irqs[ISA_NUM_IRQS];
> +
> +    ISABus *isabus;
> +    IRQState i8259_primary_out_irq;
> +    I8259CommonState i8259[2];

This allocates only enough space for the common base class's
instance struct, but later we do an object_initialize_child()
of the child class. If the child class's state struct is
ever bigger than the common class, this will break.

>  static const TypeInfo i8259_type_infos[] = {
>      {
>          .name       = TYPE_I8259,
>          .parent     = TYPE_I8259_COMMON,
>          .class_init = i8259_class_init,
>      },
> +    {
> +        .name          = TYPE_I8259_PIC,
> +        .parent        = TYPE_DEVICE,

Devices that directly inherit from TYPE_DEVICE are awkward,
because they never get reset. Conviently this device doesn't
currently need a reset method, but still, is this a good idea?

> +        .class_init    = i8259_pic_class_init,
> +        .instance_init = i8259_pic_init,
> +        .instance_size = sizeof(I8259PICState),
> +    },
>  };
>
>  DEFINE_TYPES(i8259_type_infos)

-- PMM

