Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B6DCC6B1A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 12:05:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448891.1664888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGxjP-0001lt-UO; Wed, 14 Oct 2026 12:05:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448891.1664888; Wed, 14 Oct 2026 12:05:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGxjP-0001lm-QP; Wed, 14 Oct 2026 12:05:15 +0000
Received: by outflank-mailman (input) for mailman id 1448891;
 Wed, 14 Oct 2026 12:05:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xGxjO-0001la-Iy
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 12:05:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGxjN-001GVx-W8
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 14:05:14 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6acf6ff3-e002-0a2a0a5209dd-0a2a450bb57a-38
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 14:05:13 +0200
Received: from [209.85.128.172] (helo=mail-yw1-f172.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6acf6ff8-b7e8-0a2a450b0019-d15580aca996-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 14:05:13 +0200
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-8ae9bc9a2fcso48056807b3.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 05:05:13 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1791979512; cv=none;
        d=google.com; s=arc-20260327;
        b=h03FcXtawEAiWwo821LVcAnkM1OnTYDMYbIaNbxDI6bFKPP1fiUrQoyJW1axww4DWW
         V1D2JiCldLvcOOyf/P7QIrq5BqUsT0IqsDQwwg34ZNqCWjffoWd+XPTDYpXbDZAoe2yL
         xqtLn7GCLxEoFTiV3voFIDjgx6X6884gxCYvWotO5wK40qAcyE7loZSOZezeQBcz/W12
         3kZjZ0/jlRgxAks7GkGjv/h5wvFFLtiXkd5Cpc0uVXiBkkGHZSsrxik6faP2RJMGJ9u4
         qNI6eBk/C4iW06Nnh2F6Lvq9u9ACixOzRWUNiKSmfyQkJqY9KzDL0PMsujXAd+NCWDPF
         09WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=M9Nyl9xH3QF3gMvTwTw/sBu2NY+4Q2lch/paE09DFwI=;
        fh=/uRV87p3TPAlKpbDSvWDgcJqLfiqm7CwGwR7GDFLvbY=;
        b=pwYkZwKMDEk6mJhHCcvT9wkC9Uw0JIdV4ya7hZELy1FOLub+Agko/S6XmCa3yCfO7B
         /lJwarPchwSXPxxDag+SnAJsJz5/Cgny5NDP5m7T6XzpWuZ1hnbPjcSGN/jSRU++pgC+
         o0drozRywfx9J4AHMCl0G4qNcYMWpba5+bOrrOUSQOf9JGpOU+tRXcFslDCeN1fD+5Ph
         36ZvYflLk1G8Na/FwdaBye3OIVKToPN1mex9jRGdbFKwAjS4IZmXs6pLZcpln/FV/48s
         nlXatlNnSG4x8GT9270y3coRSid4V3JyOyZEM09UoN7COoCzQ+PugroCYzkSvuagV5ff
         iNhA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791979512; x=1792584312; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M9Nyl9xH3QF3gMvTwTw/sBu2NY+4Q2lch/paE09DFwI=;
        b=y90HAjs1VzzalP78dA+W1XKM8+jFdyvEFtXMMAFjopuS9sWm+tYL0ILcgqRbxF8zlQ
         fX5lrOrBon6qkkNiSx/mKQG5xXC/WgNZUtYJRapMA3RXwisTD3M6el3nhZlVcgB9W6I/
         NOXFUyrZ0QTbLPDewHgc+Saj1+R9B81Fx3CZ0OTEd29/ktLPmWVm1yLX/lRa7soGaD1g
         L2i2yr3JCbnV3aMBvNjk+fuLKArwvTbKcS0Tx5E26pr2ygy4VxorxQ6rgU4ieXce08ol
         CY9RXDeql7oTt9aE0FMSchLMeCMBfRdrurwQH9aPum3P4jRSHZLNmLXVSnTyr8UGqxeb
         UT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791979512; x=1792584312;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M9Nyl9xH3QF3gMvTwTw/sBu2NY+4Q2lch/paE09DFwI=;
        b=YOHXtWv3FH5dJc0yiJmDBNBmMJxyj68SXeTI40uh4BmNmc8Er75SXNOj2bFwgeTVXd
         QFvCHfozjOdP8LudaP9OkqbmG3i2jbdy6IWy+pWfYc7nm5MVMR+um2TvAiNcPSc2tGtq
         Q93h/xKj2uJLvBCVae7pqJEmj5Iek3G5zMyVqP9UTezcE0tUjDXb0MpRY8TOP60pCnUM
         /IuPj5fyYHNOrFquenDgcN9CGkYmgWIgTCkrxz5H3vOwXJ7ZmcDhYt2b5ZLpNPOpbP5A
         xNkyoIr1p/FSpsa/PGhy/ocaM/o4x2qD0x9G4Ngq1ZR0EjADmKxRV+TWBRiOn80XRUXt
         kiKg==
X-Forwarded-Encrypted: i=1; AKwUvBwypD9DvUjh4aDchEYJ0Mtpi7djfW/BlyTMe8AAwafJSKFyWBKCgbcgKqHsvl4QTpW0CQfPgUil3yA=@lists.xenproject.org
X-Gm-Message-State: AFq9FYK+fUoJyDDJ9JDQVKGceFnCxEZUK10xyZQnBy523xvpStT4gpZS
	2E3CtqKN3fQaVcZy8D40h3RS1JuWon6Vtt0de7zzBX5QB0OKgmc9OZMjy1tLsI6/LO46ipj5IOt
	ltt1H5JKMDCLH8EpMNsnRWiZ4vDXr395lQPrrIr/TZg==
X-Gm-Gg: AYBFou2GDJD07RjTMmtFJSZCrCJEiihdplrfV9kDuPrFMUn67AmYI1iQ/vQik/u310i
	maHlbk3vJJ20LGDYK8YM4xVx/EePNp8inO2Bz5PzVVBdyryYS/utX+YV34Xt1s+x1iYFTcHJXLQ
	LXzTFr2P74/hR0zvJrDHyOvC1YcM7beFnH4gicFhp2ELqVvZCeTbXIkrRFwc6jlDALg5x3wtnpy
	7lfQeqv/IPoK9G4wJ+UWi+1XTWGSGSDWBe8RQPOb3PPINApXWcwDIuGWvdXIk1bHDPmJxpgRWqC
	ztrfvBZ/19VJlX52R1hVovsKY1JMBiyUvcBb+Y8CcS5XTMGF+LRxD5wmWnrFxgKQxZxm10D2CIU
	AYRthpq7dC5b6ijpMX/UJ4sO8BFmo7nL0KvhAnQyDrwiq9d5BzA==
X-Received: by 2002:a05:690c:13:b0:8b0:a30a:7f31 with SMTP id
 00721157ae682-8b0a30a9167mr33446427b3.29.1791979512090; Wed, 14 Oct 2026
 05:05:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260916104435.600211-1-mark.caveayland@nutanix.com>
 <20260916104435.600211-14-mark.caveayland@nutanix.com> <CAFEAcA-FFiWEs3ZLztVwZ72_TGLuhEBbfKnaZ3NFJJ1W-Wd33A@mail.gmail.com>
 <c444a8ed-eb83-4a69-87e5-57c71f3a6d01@nutanix.com>
In-Reply-To: <c444a8ed-eb83-4a69-87e5-57c71f3a6d01@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Oct 2026 13:04:59 +0100
X-Gm-Features: AclHuK_fKBiA6YUTOHdzTar_zcSRcOFWB6_EBRpgQCUFNyZdpL7rStVJCTFbRZ0
Message-ID: <CAFEAcA8v+pcFz+HsgT9M6xb_16qBKK5FOuf8WupP5KuQK+aNcQ@mail.gmail.com>
Subject: Re: [PATCH 13/22] i8259.c: introduce TYPE_I8259_PIC device
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-42698a/1791979513-AA8D99EA-9770F51D/0/0
X-purgate-type: clean
X-purgate-size: 2917

On Wed, 14 Oct 2026 at 12:09, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> On 13/10/2026 17:17, Peter Maydell wrote:
>
> > On Wed, 16 Sept 2026 at 11:50, Mark Cave-Ayland
> > <mark.caveayland@nutanix.com> wrote:
> >> +struct I8259PICState {
> >> +    DeviceState parent_obj;
> >> +
> >> +    qemu_irq pic_out_irq;
> >> +    qemu_irq pass_irqs[ISA_NUM_IRQS];
> >> +
> >> +    ISABus *isabus;
> >> +    IRQState i8259_primary_out_irq;
> >> +    I8259CommonState i8259[2];
> >
> > This allocates only enough space for the common base class's
> > instance struct, but later we do an object_initialize_child()
> > of the child class. If the child class's state struct is
> > ever bigger than the common class, this will break.
>
> That's true. In theory this should be something like I8259State, however
> I didn't think it was worth adding a specific
> OBJECT_DECLARE_SIMPLE_TYPE() if there were no extra fields. I did
> quickly check that if this happens, then the assert() in
> object_initialize() fires so if this did happen then we'd find out
> really quickly.

I think that every QOM class ought to define its own instance
struct, even if it doesn't contain anything beyond the base
class. This means that when we do need to add a field in future
we don't have to go around and find the places which currently
use the parent-class struct but really want the leaf-class
struct. (There are places where we don't catch mistakes like
this -- for instance I think if you don't update the
.instance_size in a type then that doesn't get noticed:
we've had a bug or too like that).

We don't write that down in https://wiki.qemu.org/Documentation/QOMConventions
but we do have some similar rules about class structs that
boil down to "either you're a leaf class and provide none
of these things, or else you should provide them all; don't
have a halfway-house 'we happen to only need X and Y but
not Z right now' setup".

> >>   static const TypeInfo i8259_type_infos[] = {
> >>       {
> >>           .name       = TYPE_I8259,
> >>           .parent     = TYPE_I8259_COMMON,
> >>           .class_init = i8259_class_init,
> >>       },
> >> +    {
> >> +        .name          = TYPE_I8259_PIC,
> >> +        .parent        = TYPE_DEVICE,
> >
> > Devices that directly inherit from TYPE_DEVICE are awkward,
> > because they never get reset. Conviently this device doesn't
> > currently need a reset method, but still, is this a good idea?
>
> In this case I think it's correct, because the PIC device in this case
> is a container for 2 cascaded i8259s which are connected separately to
> the ISA bus. Therefore each i8259 will have its reset triggered via a
> reset of the ISA bus.
>
> The container itself can't exist on the ISA bus because it would then
> appear as a separate device which doesn't make sense in this case.

OK.

-- PMM

