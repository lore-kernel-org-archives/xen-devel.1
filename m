Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9827606A325
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 23:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mx8IN21n
Received: from list by lists.xenproject.org with outflank-mailman.1495274.1694297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTpF7-0007pY-Es; Wed, 18 Nov 2026 23:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1495274.1694297; Wed, 18 Nov 2026 23:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTpF7-0007pR-CA; Wed, 18 Nov 2026 23:39:09 +0000
Received: by outflank-mailman (input) for mailman id 1495274;
 Wed, 18 Nov 2026 23:39:07 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1xTpF5-0007pL-FQ
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 23:39:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTpF4-00ABfC-LF
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 00:39:06 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6afe36c6-8faa-0a2a0a5109dd-0a2a4503cc8c-20
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 00:39:06 +0100
Received: from [209.85.167.54] (helo=mail-lf1-f54.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6afe371a-fae8-0a2a45030019-d155a736f115-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 00:39:06 +0100
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5c17a1775fcso1270176e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 15:39:06 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1795045146; cv=none;
        d=google.com; s=arc-20260327;
        b=cyrPFbkPdzvbqOl3mKsdIfKhg+qEpJZqy7BtotXl9Shp8J++Y0gsm1Qcywfy+lmNKS
         nLiACtq/z2C5hie386KtHIIrs11kjusn//OsF/bKrHr0xu1eakNzK9qoCjMeIQOa2chO
         Q1IUfh1igHRmWPB3yNBfbcHfUi9QCLpRDvGCP9+mdsyxX/ZCrvI7Ouy/g527r78GiFGr
         uoLpfwovuja+9RGtMV0AU4d1o/NY3nJ3lgc8BgqyLXhig1gcEsphHFNimmnXg5NiDE9g
         vANp8Bh6g1HelA33Y/bXnl1OJrgrJKL4iev0DBGaiyo6WHrvl3DRZ+GMoUstmo9QpmTo
         FFNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oC1duRLAPjOvl+GOAfiLbt8BqYh7Uka1NBIPvOj+y9g=;
        fh=jordilU86TBmP8EmkNoC4kTbKo181cBqOXk0uXtWl+c=;
        b=o8MxHEUksb3Ui2kV23yAr8nwOOtzIImI0qxKCLCUGKL6lPz4VLUTA+gR/406psimuI
         25PA1bQ5m4uoIYmBBLi5AveSS8G+GDTC4N8g+PPWfXCnEuZBoEmgbFDsUTY606UnUw1O
         cPjosCD9Vd8133ncnnZZuj0CVESKb6ln30a2JzF/vFqCHKPSYdwHunbCwY/LtW6w8x4Q
         fjrAt/k0pCO5J/Xfk7JV7FQWS8a5jV72aR0DHtOR1hIdp5cEUNJu+T+iJxH1O9+euTd8
         /Bmsqna92hdaT5iUtP6qK9tudLfshu2YLbnooKCLd0kGr+KKiCRBTkM28VKWT6Wh2Nir
         Y6dw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795045146; x=1795649946; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oC1duRLAPjOvl+GOAfiLbt8BqYh7Uka1NBIPvOj+y9g=;
        b=Mx8IN21nWhniOOBt6ReQ59uL+AGo2JVCbx2ynye4gtT0TzoAie3wWGIbyKi5nx1HTX
         71ZPJHP0Eqyp4YdWj6QcAUxWylCzBxWC/iIHQeye2wU7ocONeHYBp6PTiu3Pnibw2LO+
         fik0cSzWWMk/ZElQNGLIQlcmkk1g1uIw/w+NGzmTvyaT3aDBumkveuOYnkwhWAcz1Qw8
         4OmSB3VmW224n+D8vthNWMmbg2nvXk3G3dk2hGkoIKJzBuU/ngfbcgWizt2Wl1vimPdY
         JKj3sNz40qtqHNvtvgMeAxhwFM+ivjRwyfi2n0QUUwBO4epmhnXHBfCGQdCOdvOnwyIy
         B6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795045146; x=1795649946;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oC1duRLAPjOvl+GOAfiLbt8BqYh7Uka1NBIPvOj+y9g=;
        b=sSHGtgCqJ+XiSiIw7zOluETP0uBWk/wO9hK6chAGMBPcgOY43gV1HbFd620v8/E7XW
         5LFu9SVJAbigRH7F3bSSEl4IxDvjpEZ8/07qupmLSbBDnQuMItdO/CoZQkFzgq5uGzLp
         oQ4oZ17ZrZSMLz7Ih6SyNI1TugJ73d9h5YUwH4p9tvKoPBFze+O/zJduSW/HyoKTF8kx
         NJ4+vt0ZV/L2HTul2L0r04LoSrXe6Ovjkr8UEZLkVQDr+vRB38zAj+c2nyvVA74I3/ze
         aOdFt9Led7vFdZ/2w+4Ziz86H8kEc8F9Bg+IbdAOAvL21n240IuKGM96zqFZj4vbOCOM
         0YSg==
X-Gm-Message-State: APuU4Z9yXDm0t/kwlwVS+EUfN0Tso6+sSGk0Skl3N4fwyaEteZT+i2Zz
	SsmXuAt11b5EfY/pEVX7OZNRN3v8x4MJyVbG22cIl5KvmiVC7dE9ZIXG2fdYFQXueCPuGRVAPLh
	gCGG+QVBP5hnNbs2XbkaswDjTDJRkH8+Qmg==
X-Gm-Gg: AYBFou0P8HNMuXPYTjQAbW4wN9IoW44m/TGhjFAwx7ytYXLQ2s9jrJANZ+f98Y/6YnS
	v8TNBhvXrXjsese7Xcjfp1JdIVgdEKVcSybFL+/otKioxqBta0YysO8egnwqhitneEOWfCS5Cg4
	Znba+Lo/UnyMbrUEmJd7bxlLBkOayFNu7h2fkkn4uEdwoLSJncJVRJYlrz9sUsVd88pdJPV6qKD
	44gE52lZggKd4fxsGSwV9tEuobw/Aac2t415msOKZCMtaSvH7n9a8VQvA7QaH62MoUXNXt8aHO3
	hbKVYgm9+ePgFnbqw7hWLuFHWOdv9cnwbjk5He5gT9rizOUrpA4m+sET+TrhoI0ooCA7qgjqvsT
	IlJe8P1X9qSTzzAgwiZUskxaWMWnAfqEnyaw=
X-Received: by 2002:a05:6512:6686:10b0:5c1:ae54:d1c with SMTP id
 2adb3069b0e04-5c1ae541147mr626597e87.33.1795045145553; Wed, 18 Nov 2026
 15:39:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <436a0405a9482dadce7f7cdb1e9721ee461f26a7.1768219676.git.mykola_kvach@epam.com>
 <c59eabda-3b97-4231-bd90-29326ba8a326@xen.org> <CAGeoDV9rpqW2XZVqVPSym9=bEyMY5udiL-oXwGUvOBtHudLdCw@mail.gmail.com>
In-Reply-To: <CAGeoDV9rpqW2XZVqVPSym9=bEyMY5udiL-oXwGUvOBtHudLdCw@mail.gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 19 Nov 2026 01:38:54 +0200
X-Gm-Features: AclHuK_muUMnmoAnc5l6uKl57dDrDCLRsEh8cZVQ4Bzv346UQGS67bNjzvHvGlM
Message-ID: <CAGeoDV8+ygMzMcDuS6NvK1Zs6sw+ZB+nbewZEXT0GNVDd=K67g@mail.gmail.com>
Subject: Re: [PATCH] xen/arm: ignore spurious interrupts from virtual timer
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1795045146-6E0D14E9-C82F7087/0/0
X-purgate-type: clean
X-purgate-size: 12041
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Julien,

On Thu, Jan 29, 2026 at 1:29=E2=80=AFPM Mykola Kvach <xakep.amatop@gmail.co=
m> wrote:
>
> Hi Julien,
>
> Thank you for the review.
>
> On Mon, Jan 12, 2026 at 4:04=E2=80=AFPM Julien Grall <julien@xen.org> wro=
te:
> >
> > Hi,
> >
> > On 12/01/2026 12:50, Mykola Kvach wrote:
> > > From: Mykola Kvach <mykola_kvach@epam.com>
> > >
> > > If a spurious virtual timer interrupt occurs (i.e. the interrupt fire=
s
> > > but CNTV_CTL_EL0 does not report it as pending), Xen masks the virtua=
l
> > > timer and injects the vtimer IRQ into the guest. For Linux guests, th=
e
> > > timer interrupt is unmasked only after programming a new CVAL value f=
rom
> > > the timer interrupt handler. When the interrupt is not reported as
> > > pending, the handler can skip that programming step, leaving the time=
r
> > > masked and stalling the affected CPU.
> >
> > I guess this is happening if Linux is trying to modify CVAL with the
> > local interrupt masked?
>
> CVAL/TVAL programming in Linux is indeed done with local IRQs disabled.
> The virtual timer IRQ handler runs in hardirq context with local IRQs
> disabled.
>
> However, the failure here is not "Linux modifies CVAL while IRQs are
> masked". The problematic case is that Xen injects a vtimer IRQ while the
> architectural state already says it is *not pending* (CNTV_CTL_EL0 has
> ISTATUS=3D0, and CNTV_TVAL_EL0 is positive). In my Xen trace the injectio=
n
> happens with ctl=3D0x1 and cntv_tval=3D0xf320, yet Xen still injects vIRQ=
 27.
>
> When Linux receives such an injected interrupt, it reads ISTATUS=3D0 and
> treats it as spurious, so it skips the normal re-arm path that would
> program a new CVAL and leave the timer enabled. If Xen masked the vtimer
> output before injection, it can remain masked, and the CPU stops getting
> timer events.
>
> So local IRQ masking is expected in Linux; the root cause is injecting
> when ISTATUS is already 0.
>
> To add more data points, here is a partial log from the stuck case.
>
> In my instrumentation:
>   - "snap ... index 0" is from leave_hypervisor_to_guest (Xen->guest)
>   - "snap ... index 1" is from enter_hypervisor_from_guest (guest->Xen)
>
> We do a normal timer expiry/injection path (vtimer: virt timer expired,
> then vgic_inject_irq), return to the guest (snap index 0), and later
> re-enter Xen (snap index 1). The issue is that on a subsequent entry
> from the guest, Xen hits vtimer_interrupt with CNTV_CTL_EL0=3D0x1 and
> CNTV_TVAL_EL0 positive, but still injects vIRQ 27:
>
> [513559989049] CPU1: snap: vcpu d1v0 index 0 now 513559988779 seq
> 4008771 pcpu 1 time ctl 1 cval 542163190853 cntvct 542159034528
> [513559989679] CPU1: [1] b0a0020200000202 [513559989964] CPU1:
> [513559995049] CPU1: snap: vcpu d1v0 index 1 now 513559994374 seq
> 4008771 pcpu 1 time ctl 1 cval 542159103072 cntvct 542159040944
>
> [513559999009] CPU1: virt_timer_save: vcpu d1v0 ctl=3D0x1
> cval=3D0x7e3b336460 cntvct=3D0x7e3b328200
> [513559999519] CPU1: virt_timer_save: setting timer for vcpu d1v0
> 513560053249 513559999459
> [513560054630] CPU1: vtimer: virt timer expired for vcpu d1v0 ctl 0
> cval 542159103072 cntvct 542159104512
> [513560055185] CPU1: vgic_inject_irq: vcpu d1v0 virq 27
> [513560056100] CPU1: VCPU unblock d1v0 pause 1 poll_evtchn 0
> [513560057105] CPU1: VCPU wake d1v0
> [513560058710] CPU1: virt_timer_restore: vcpu d1v0 ctl=3D0x3
> cval=3D0x7e3b336460 CPU 1 status 1 expires=3D513560053249 now 51356005865=
0
> cntvct=3D0x7e3b337b00
> [513560061050] CPU1: snap: vcpu d1v0 index 0 now 513560060795 seq
> 4008772 pcpu 1 time ctl 7 cval 542159103072 cntvct 542159111344
> [513560061755] CPU1: [0] 50a000000000001b [513560062025] CPU1:
> [513560067785] CPU1: snap: vcpu d1v0 index 1 now 513560067185 seq
> 4008772 pcpu 1 time ctl 1 cval 542159180688 cntvct 542159118528
> [513560068415] CPU1:
> [513560070215] CPU1: WFI blocking d1v0
> [513560072180] CPU1: virt_timer_save: vcpu d1v0 ctl=3D0x1
> cval=3D0x7e3b349390 cntvct=3D0x7e3b33b2e0
> [513560072690] CPU1: virt_timer_save: setting timer for vcpu d1v0
> 513560126014 513560072630
> [513560127275] CPU1: vtimer: virt timer expired for vcpu d1v0 ctl 0
> cval 542159180688 cntvct 542159181984
> [513560128250] CPU1: vgic_inject_irq: vcpu d1v0 virq 27
> [513560132015] CPU1: virt_timer_restore: vcpu d1v0 ctl=3D0x3
> cval=3D0x7e3b349390 CPU 1 status 1 expires=3D513560126014 now 51356013195=
5
> cntvct=3D0x7e3b34ac70
> [513560134340] CPU1: snap: vcpu d1v0 index 0 now 513560134070 seq
> 4008773 pcpu 1 time ctl 7 cval 542159180688 cntvct 542159189504
> [513560135045] CPU1: [0] 50a000000000001b [513560135345] CPU1:
>
> [513560140940] CPU1: vtimer_interrupt: vcpu d1v0 ctl=3D0x1 cval
> cache=3D0x7e3b349390 cval reg 0x7e3b35c4b0 cntvct=3D0x7e3b34d180
> cntv_tval=3D0xf320
>         LR0=3D0x10a000000000001b LR1=3D0 LR2=3D0 LR3=3D0
>
> [513560142230] CPU1: vgic_inject_irq: vcpu d1v0 virq 27
> [513560143595] CPU1: vgic_raise_guest_irq: vcpu d1v0 virq 27 lr 0
> [513560144540] CPU1: VCPU unblock d1v0 pause 0 poll_evtchn 0
> [513560146175] CPU1: snap: vcpu d1v0 index 1 now 513560145740 seq
> 4008773 pcpu 1 time ctl 3 cval 542159258800 cntvct 542159202128
> [513560146820] CPU1: [0] 50a000000000001b [513560147090] CPU1:
> [513560148875] CPU1: WFI blocking d1v0
> [513560149310] CPU1: VCPU unblock d1v0 pause 1 poll_evtchn 0
> [513560150885] CPU1: VCPU wake d1v0
> [513560152370] CPU1: snap: vcpu d1v0 index 0 now 513560152115 seq
> 4008774 pcpu 1 time ctl 3 cval 542159258800 cntvct 542159208736
> [513560153060] CPU1: [0] 50a000000000001b [513560153360] CPU1:
> [513560157080] CPU1: snap: vcpu d1v0 index 1 now 513560156435 seq
> 4008774 pcpu 1 time ctl 3 cval 542159258800 cntvct 542159213760
>
>
> The same line also shows that CNTV_CVAL_EL0 already differs from Xen's
> cached value:
>
>   cval cache=3D0x7e3b349390, cval reg=3D0x7e3b35c4b0
>
> So the injection is not aligned with the current CVAL/ISTATUS state.
> This matches Linux treating the interrupt as spurious (ISTATUS=3D0) and
> skipping the normal re-arm path, which can leave the vtimer output
> masked and the CPU without further timer events.
>
> This is why the fix is at the injection boundary: if CNTV_CTL_EL0
> indicates ISTATUS=3D0, Xen should not mask and inject the vtimer IRQ.
>
> >
> > >
> > > This patch mirrors the Linux arm generic timer handler: if the interr=
upt
> > > fires but the pending bit is not set, treat it as spurious and ignore=
 it.
> >
> > Have you considered fixing properly our virtual timer emulation? I know
> > this requires more code, but at least we are not adding more
> > non-compliant code which requires patching the Guest OS.
> >
> > IIRC there was a series from Stewart to solve it and it was in pretty
> > good shape at the time it was posted.
> >
>
> I don=E2=80=99t think this patch adds more non-compliant behavior or
> requires any guest patching. Quite the opposite: it prevents Xen from
> delivering a virtual timer interrupt when the architectural state says
> it is not pending (CNTV_CTL_EL0.ISTATUS=3D0 / CNTV_TVAL_EL0 > 0). The
> current behavior (mask + inject in that situation) is what produces the
> spurious interrupt in the guest and can leave the timer output masked.
>
> So the intent is a minimal, self-contained Xen-side bug fix at the
> injection boundary:
>
> If ISTATUS=3D=3D0, there is no vtimer interrupt to deliver, so we should
> not mask and inject one.
>
> This does not rely on guest spurious handling; it avoids creating
> the spurious condition in the first place.
>
> Also, could you please share the subject/Message-ID or a link to the
> series you have in mind, so I can make sure I=E2=80=99m looking at the ri=
ght
> one?
>
> > >
> > > This issue is reproducible under heavy load on the R-Car X5H board
> > > (Cortex-A720AE r0p0).
> >  > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > > ---
> > >   xen/arch/arm/include/asm/perfc_defn.h |  7 ++++---
> > >   xen/arch/arm/time.c                   | 11 ++++++++++-
> > >   2 files changed, 14 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/inc=
lude/asm/perfc_defn.h
> > > index effd25b69e..f83989d95a 100644
> > > --- a/xen/arch/arm/include/asm/perfc_defn.h
> > > +++ b/xen/arch/arm/include/asm/perfc_defn.h
> > > @@ -69,9 +69,10 @@ PERFCOUNTER(ppis,                 "#PPIs")
> > >   PERFCOUNTER(spis,                 "#SPIs")
> > >   PERFCOUNTER(guest_irqs,           "#GUEST-IRQS")
> > >
> > > -PERFCOUNTER(hyp_timer_irqs,   "Hypervisor timer interrupts")
> > > -PERFCOUNTER(virt_timer_irqs,  "Virtual timer interrupts")
> > > -PERFCOUNTER(maintenance_irqs, "Maintenance interrupts")
> > > +PERFCOUNTER(hyp_timer_irqs,             "Hypervisor timer interrupts=
")
> > > +PERFCOUNTER(virt_timer_irqs,            "Virtual timer interrupts")
> > > +PERFCOUNTER(virt_timer_spurious_irqs,   "Virtual timer spurious inte=
rrupts")
> > > +PERFCOUNTER(maintenance_irqs,           "Maintenance interrupts")
> > >
> > >   PERFCOUNTER(atomics_guest,    "atomics: guest access")
> > >   PERFCOUNTER(atomics_guest_paused,   "atomics: guest paused")
> > > diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> > > index cc3fcf47b6..d18d6568bb 100644
> > > --- a/xen/arch/arm/time.c
> > > +++ b/xen/arch/arm/time.c
> > > @@ -258,6 +258,8 @@ static void htimer_interrupt(int irq, void *dev_i=
d)
> > >
> > >   static void vtimer_interrupt(int irq, void *dev_id)
> > >   {
> > > +    register_t ctl;
> > > +
> > >       /*
> > >        * Edge-triggered interrupts can be used for the virtual timer.=
 Even
> > >        * if the timer output signal is masked in the context switch, =
the
> > > @@ -271,9 +273,16 @@ static void vtimer_interrupt(int irq, void *dev_=
id)
> > >       if ( unlikely(is_idle_vcpu(current)) )
> > >           return;
> > >
> > > +    ctl =3D READ_SYSREG(CNTV_CTL_EL0);
> > > +    if ( unlikely(!(ctl & CNTx_CTL_PENDING)) )
> >
> > For the others, the Armv8 specification names this field ISTATUS.
> > Regardless what I wrote above, the change look alright. Before I ack,
> > can you confirm whether you checked other OSes (I am thinking at least
> > Zephyr) will also ignore spurious interrupt?
>
> Regarding other OSes: I haven't reproduced this with Zephyr domain yet,
> but I did take a look at Zephyr's Arm generic timer IRQ handling. At
> first glance it follows the usual pattern, and I don't immediately see
> anything that would break if a spurious vtimer IRQ was/wasn't delivered.
>
> That said, to be confident I will run a small domU test where I
> artificially inject spurious vtimer interrupts into the guest (i.e.
> deliver the IRQ while CNTV_CTL_EL0.ISTATUS is 0) and verify that
> Zephyr does not get stuck and continues to re-arm the timer correctly.
> I'll report the results in a follow-up.

I tested Zephyr v4.5.0 as a DomU on QEMU with GICv3. In these builds,
the Arm timer handler does not return early when ISTATUS is clear.
It still checks elapsed time. The driver unmasks the timer when it
sets the next deadline. Linux 6.6.86 skips its clock event handler
when ISTATUS is clear.

I built one guest image with CONFIG_TICKLESS_KERNEL enabled and one
with it disabled. I ran each image on Xen with and without the patch.
QEMU acknowledged 40 test IRQ requests in each run. A wrapper in
Zephyr read ISTATUS before calling the standard timer handler.

On unpatched Xen, the guest recorded 40 timer IRQs with ISTATUS clear
in each mode. On patched Xen, the guest recorded none in either mode.
Xen itself counted 38 spurious timer IRQs in the periodic run and 40
in the tickless run.

The one-shot timer, periodic timer and sleep checks passed in all four
runs.

Best regards,
Mykola



>
> Best regards,
> Mykola
>
> >
> > Cheers,
> >
> > --
> > Julien Grall
> >

