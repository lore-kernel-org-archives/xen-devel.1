Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30868CC6B19
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 16:29:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448187.1664255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGfNW-00060k-1V; Tue, 13 Oct 2026 16:29:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448187.1664255; Tue, 13 Oct 2026 16:29:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGfNV-00060d-UZ; Tue, 13 Oct 2026 16:29:25 +0000
Received: by outflank-mailman (input) for mailman id 1448187;
 Tue, 13 Oct 2026 16:29:24 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xGfNU-00060P-EB
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 16:29:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGfNT-001oJf-GX
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 18:29:23 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace5c58-bab6-0a2a0a5309dd-0a2a450b9c24-16
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 18:29:23 +0200
Received: from [209.85.128.170] (helo=mail-yw1-f170.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace5c62-b7e8-0a2a450b0019-d15580aac90e-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 18:29:23 +0200
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-8ab38a051aaso25228897b3.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 09:29:22 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1791908962; cv=none;
        d=google.com; s=arc-20260327;
        b=O2dfiuxpdKwluCw/PBHCErVYzmxJpNTylN6I4W+1dtfzgXUQuqk9lwNFmY7azc/jDR
         tf9AkgL4A1pqpFR6fm8i+CAr0sJFirnBU5U8lFeB/7v2cPgvxbSvOk815PUr//Pu48Ob
         xVyapa7X44UI4HiMa+eWzoJr8y85AEAmOfRRHp2U7InAfHphtpfjf+wlOrJua0i9Vzch
         LpXU0P50/BVLezXJdx/fJdNSshrVyTpEtKL3tUClgp8T+FcG0jX2CbU7PWtirh6iROpo
         HueVET0Lhc/oBXr0CcancZdywGVhQU5OhdboE1PU39nUX7zf/88Dv792Xw7Hqmmo95s3
         005Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jXo9q1ZmZcN51gvyAI6giPbieASxcFI/Rz78Tc/rF4k=;
        fh=soxJElAlokBxb0qXlToTWx+nLUSaWOMvgPaeVh3fGx8=;
        b=mW9pfk8bDz7ey1bAQ5MjmKfvm1F85E+Loa1nc6XBb0JTTxQ6DUxx4CMfx7g2RNU06Y
         rpGxZt6gNb1/u4pCVRQ/Qgm93qgocuSdwJ/w2VrJfoJqJKTQonfU0ZxrqBNhLHfjiuFs
         vtN8DNMqli3S3VXwEb8PVAkRiIGPSsjuWLw6CCotIlMI8BoTQsi2LOfbMDTiXMGC5903
         X7mQydqnfKuB/xBHxZ1k+cV/j1nQyC73Ps7cstYw6yYCZYns0NnUjVYigERCv+L0vu+/
         wHLhPj50Td/uHXPpZwmmNYg6r4CWOZUqHp8jcTPDk7veNkkdGBUC9+30Jh8t0qZh915o
         LPHQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791908962; x=1792513762; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jXo9q1ZmZcN51gvyAI6giPbieASxcFI/Rz78Tc/rF4k=;
        b=dUPCRbkbVGnQgh56hdz9PnC/FzbqZzGNjxKgnaXZEUBVS4zEWdrg32WoS5Fg9GUnHJ
         kgXm78l0mV2uXws6JQ6lk6K/RHzLQby0I8MfWIbKxojKS1QsbprqyjugctMfNee8gsYQ
         bKaL+F4NAoe0k5NQFwHyrERNOo1/Ja/YHVNyRVXBKFbQyHABgHaY+DuvqSwYPJ0xBEh1
         PBn0o8xF70X2PrGmCz/n8pRCE4KFAWu7n0HwpDzXEcX3ouH8+pP88cXL8TvT3IPgdhJM
         cAqjHy6aFrMVwvYxtPJKzKu5Uq10O0Iksp21TLFy1pZeXZqSmV6P+qrNqKQVW9o7RZdc
         9miA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791908962; x=1792513762;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jXo9q1ZmZcN51gvyAI6giPbieASxcFI/Rz78Tc/rF4k=;
        b=cTl9IAqXMWIyqbrcqFKpn3PEG0U3jv9etLR4Vl3SBpwYVtrTOQQUcdsf5/gdBkO0Jl
         vzhgLEEOBOkabSXp7ggDMNwC5UD5nVcqNoJ05yocmEJfAnpqNXU+ZYGF4mZYVbaO1Zop
         NdjIPjLRN2ev7aPUH6+4+mMQtCk/990JVNjBabXrA58fEUNrAemFDhO/LAEBEQf6xx43
         Mcw9GEYMuNcXIOWWdrxbtSvTvCNKm/7LrrQBBg2l5SaQOvdKQSzczIFRPmYKHkElvA3i
         jJyjBZunaenyhc5f53ODHNVKhfdsqS+lhmz5qVaN72vYpqpNJRPR/pvvejW2eRvF0ePT
         HdlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQ6PvVTvM709WUJPLz7Gcgg5ETVypGZ2eJHveiGMd7OVFUjMBtzrxPpnBI0MObbbbtOECeohlNl7w=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJOsHbGRUdCQ0ZMJfu5yuBnFkK0pwEI8inrwGYbHh9Hu5tNP2ob
	vDQxoUU+iOcSOdpwyHgyINemY11kG0CTRlfCgCf+wlIUqAua5wa8ZbMIXWYw0nCzPSZMl+vawFP
	Y3INmplbgBgJOaGGqx7bUPxZRcCCGXqQbHtO5plkwYw==
X-Gm-Gg: AYBFou35IJhzH2NT30TylvCT/MpGw2qfC04/sqWKXrlxV2rqPDDPEM6w/dGPmwbuMG0
	b6LFCZmUlrG+ONeZ2nHKZnzeSuC+K9n8M5zlF6aHvdxFhngb9jCznCzwrHJpF3QfhFMK5uc/niG
	i6amdEwQ3djtowbKiIc3F80aOJ5U4JOg+Q3vRR9boLS/eJtCcAQZqgPAsWl77y3+rMiHb88x49u
	TwOzOLFvLxUvMcfru0aPwnJPf7OggyOd4fL6LC7lYxhzKykYcuOwJqyHIUMcwhHnMEP8+2tenQ/
	q1anVKpvCeJYZucI9EAGfy+/3aXo2Byya5ccSDL7CnCUvpCeGDJK+7TzcGR9/yrP/To0g8ey61Q
	sp79NFcPr+QSkmYLO/jt6JqFlhK+m14ezcT0Th+w=
X-Received: by 2002:a05:690c:e1d9:10b0:8ae:dfee:cd30 with SMTP id
 00721157ae682-8b07ee80677mr32738227b3.56.1791908961569; Tue, 13 Oct 2026
 09:29:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260916104435.600211-1-mark.caveayland@nutanix.com> <20260916104435.600211-22-mark.caveayland@nutanix.com>
In-Reply-To: <20260916104435.600211-22-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2026 17:29:10 +0100
X-Gm-Features: AclHuK-eFYommmfqG_nkwY0m20Dw4f51-5ZNktl8ml0khtEb6QlSNypivh2nwj4
Message-ID: <CAFEAcA9vm7004bytZqYwXCNj_+VNy1RzKMqG3TDnJkswpNhLUg@mail.gmail.com>
Subject: Re: [PATCH 21/22] i8259_common.c: remove static irq_count and
 irq_level variables
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-42698a/1791908963-1AAD89EA-03191650/0/0
X-purgate-type: clean
X-purgate-size: 1568

On Wed, 16 Sept 2026 at 11:50, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> Adjust the parameters to i8259_stat_update_irq() to allow passing in pointers
> to the irq_count and irq_level arrays, and then move the arrays into the
> corresponding i8259 PIC and KVM PIC devices.
>
> Doing this allows the statistics capture logic in i8259_set_irq() that handles
> incoming cascading interrupts to be removed.
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>

> diff --git a/hw/i386/kvm/i8259.c b/hw/i386/kvm/i8259.c
> index 421c9279cd..ca661afc02 100644
> --- a/hw/i386/kvm/i8259.c
> +++ b/hw/i386/kvm/i8259.c
> @@ -30,6 +30,9 @@ struct KVMI8259PICState {
>
>      ISABus *isabus;
>      I8259CommonState i8259[2];
> +
> +    int irq_level[ISA_NUM_IRQS];
> +    uint64_t irq_count[ISA_NUM_IRQS];
>  };


> diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
> index 3f10777036..ac43995ce4 100644
> --- a/hw/intc/i8259.c
> +++ b/hw/intc/i8259.c
> @@ -49,14 +49,16 @@ struct I8259PICState {
>      ISABus *isabus;
>      IRQState i8259_primary_out_irq;
>      I8259CommonState i8259[2];
> +
> +    int irq_level[ISA_NUM_IRQS];
> +    uint64_t irq_count[ISA_NUM_IRQS];
> +#ifdef DEBUG_IRQ_LATENCY
> +    int64_t irq_time[ISA_NUM_IRQS];
> +#endif
>  };

Would it make sense for these two types to have a common base
class (where the stats stuff could then live)? AIUI they're
both intending to provide the same interface ("pair of i8259
devices cascaded together in the way that x86 does it").

-- PMM

