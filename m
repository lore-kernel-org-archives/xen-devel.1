Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE50AC9831E
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 22:23:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1433123.1653944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9rqd-00043K-R3; Thu, 24 Sep 2026 22:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1433123.1653944; Thu, 24 Sep 2026 22:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9rqd-00043D-ND; Thu, 24 Sep 2026 22:23:23 +0000
Received: by outflank-mailman (input) for mailman id 1433123;
 Thu, 24 Sep 2026 22:23:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1x9rqc-000437-1n
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 22:23:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9rqb-00B091-Ev
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 00:23:21 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6ab5a2bd-bab6-0a2a0a5309dd-0a2a450893b4-20
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 00:23:21 +0200
Received: from [74.125.229.204] (helo=mail-lf2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6ab5a2d9-f659-0a2a45080019-4a7de5cc978b-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 00:23:21 +0200
Received: by mail-lf2-f12.google.com with SMTP id
 2adb3069b0e04-5b8e7106948so69878e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 15:23:21 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1790288601; cv=none;
        d=google.com; s=arc-20260327;
        b=a7KmUM0pMS7RaLkI+oimGQ4IovHbsySCf1F07nonEKoVD5/ZLjhWVYha0zGWvmH/zq
         pA8kVx+gIHPAoNVo2Dsb/UM4TX3yNr2Tk3cNxdTntHfw189IsdN/kX3MzFjL22CtvIbw
         nwGbnLhSP2BVapXM8R0zTmy3+2hfP4WdzEkueDu6jbTwQbyoACYpH7i2TgrGWty8qg34
         ofr9pDn7u2xX53BjIOhDx1cuk43AqGDxJe8xylSKX5Yp1Nr3WN8zQInGwSeHC/6ByVad
         N7qpMkibSElF69kfngaU0FllB7CaIpslgzvRYZ35ifkgdGACQwaLhPxyUzuDNE5+F74k
         n28w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T5GGfkXwUPJHJrdonFgk41gj12DxobWlG6Stz8L03rE=;
        fh=1yPyNoqLtC8Ir3LptaxaC2g8QXUGDst0C06uqdPGcEo=;
        b=EEqgZzRSlSaKM24Og7MMDSiBKkBQzMUI6BDtSNFO3B8OPjmORMtEW1xkCl2MeERKjX
         wZPzzGAPuXLH+Hy1UgZMXRrb341JubNhqzk3249ISbUkifoE7VYl+ySUDM3l0aSb+G/V
         F/v2gvi0STlopcT0276Cu6iMwlGVUOLE7iMpwZV0lDHdsbtUB65C/Rnymt13OJRB/VY0
         z+3+P9CglgurASIp+tH0wNwrLPtBl6Fd9bxKQAfCBbpLDWGqVhmCQoUOFpd0WLLGoemG
         F7lFwN4EBNnN6n3+bi/RXrS6NPmdElurGWbXuBndGm/7mwEHeqKcNdhkeia1k9zvBjlZ
         VtBg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790288601; x=1790893401; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T5GGfkXwUPJHJrdonFgk41gj12DxobWlG6Stz8L03rE=;
        b=chVxE3UugUhxkiHAZpg42cbmxAxofVkJ2nddPkrFiCX77pyhYqkg7K6rhvaioom5G9
         65ccZjgYuzxL0AfkvmXFQ3buY6OqbIugCH+ah2tTxUM5zKf4ApEhoXji/GtNk49YzEQh
         UtbJj8gKqMDCFnxJ55CeXUfDBTW5u1GTVJZcTTLx6K0vFd/s7unnM2TWXs/lyjJTaMGD
         TFhNZ/YDofYq9hQVnNkJcuVwXaIHqE3wAzuxD7M62zE9I65yJUY8YRXQqGmpqjJE+UwK
         AhNNxnK0Q1U4xJGJsg7RzAR66bnhkeQP1z5PZScHc7YHHH7XRd5Sw7XTgxk/7mBd+Zt2
         x9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790288601; x=1790893401;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T5GGfkXwUPJHJrdonFgk41gj12DxobWlG6Stz8L03rE=;
        b=fO7Zrc8vVjK/et54lcsTL3PxhmU5+EtznSLe875dpVt7xrBm6stpV9YfO959P/R7GX
         SY4CFOmmTrNFYDkZHGp25wvvZ3A1pFm9CwFmPxR5iAlIUDPegNZ5FJvASdGBpO5+4a9j
         sXFUav1e8j6/Qx1ylKYnRP/72E1Txl5BsZaVoxEwZYoQRt3P10gcNAgJF+W7eYzWtFTr
         qL81KMqg/jyIJ6o6ihN+k4lm21447LN/R35B0hQFlLf8uzyKXbCBlrBhytdCfrrbLE9b
         1VugcUq4moA050h5gUlWe5pbU/fYTgkrQbEWuwsYxMuBOftkv/Eq4Pr030x3/tMIMsZD
         RAag==
X-Forwarded-Encrypted: i=1; AKwUvBzFqMCHAe676EWD7hY/g2j9TpjXb9pCui2qriFEvUqJF1G92uoYq9Z7EtIzOeyh0/ouVEKM7KDCGuY=@lists.xenproject.org
X-Gm-Message-State: AFuF++nrQLDFcy4v75+hTt89ARngHj/bO7Zv6sboI5W3Hk8D2IY8yPkO
	YzYHSmtN4IuPFUxxPSrkuw5BaIR2/JHx6Rd+n6Z2xEq/SeCIuMisE7jtrSVpT+p/mr6lp0tevKQ
	KICgA3YewCJQ82NXJ8VMSag98eSKDb2U=
X-Gm-Gg: AYBFou31+f1h5264RmWaKLWH++driA0ZLtRHIrKreQGdHcf07ETLYQloHMckI472ph/
	uKEpXJNnHwc+Pux/QiHlOaJIkUS+d+3h+9Na9P57yt0N8g4TC0CEsp5CIGW4ipPJ7l6+OlZArb6
	TQfaDa0wFhv6n2LekbE8Ly9X9s94cjjr0FZ1fjlUJ7Q+TqM0VEqyJFsNPQlUhD5FScFavJQ6IKI
	7fQ7MBtJAP00kJhCALjpFd4dONX1EbBGmLv7ZVeK++OPcqOPlV6PByns69WRCf2abnE9vNum5Np
	ebp9VfLbepXp1vj/Joo+dbIjpnCeOs2mfA9MGFtiD8YlfMQVIwVFUQaCcDFfuTIW
X-Received: by 2002:ac2:4c52:0:b0:5b8:c21e:28e8 with SMTP id
 2adb3069b0e04-5b8e6e2f6dfmr61763e87.19.1790288600525; Thu, 24 Sep 2026
 15:23:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1787838455.git.mykola_kvach@epam.com> <dbdba04cd531cf2f3ccfc0b7e8dbcb4925b25055.1787838455.git.mykola_kvach@epam.com>
 <DD46DB7E-3D4A-46BB-9AD0-D529CDDA4113@arm.com>
In-Reply-To: <DD46DB7E-3D4A-46BB-9AD0-D529CDDA4113@arm.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Fri, 25 Sep 2026 01:23:08 +0300
X-Gm-Features: AclHuK8NELuGClVZqs8LAX9vYPSxCPMUkmdBDf7GeNp2JA_w6QhryTLBxCp5gow
Message-ID: <CAGeoDV8=Qu0Ywv6c1UB960RooCNiB06dfU-bdGhWVehuevzoaw@mail.gmail.com>
Subject: Re: [PATCH v12 02/13] xen/arm: gic-v2: Implement GIC suspend/resume functions
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Luca Fancellu <Luca.Fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1790288601-D795A87B-0FD882C6/0/0
X-purgate-type: clean
X-purgate-size: 4118

Hi Bertrand,

Thank you for the review.

On Wed, Sep 23, 2026 at 6:28=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Mykola,
>
> Sorry for the delay to review this serie.
>
> > On 27 Aug 2026, at 16:31, Mykola Kvach <mykola_kvach@epam.com> wrote:
> >
> > From: Mirela Simonovic <mirela.simonovic@aggios.com>
> >
> > System suspend may lead to a state where GIC would be powered down.
> > Therefore, Xen should save/restore the context of GIC on suspend/resume=
.
> >
> > Note that the context consists of states of registers which are
> > controlled by the hypervisor. Other GIC registers which are accessible
> > by guests are saved/restored on context switch.
> >
> > Transient physical SGI pending state (GICD_CPENDSGIRn/GICD_SPENDSGIRn)
> > is intentionally excluded. CPU-interface active-priority state is also
> > not restored across suspend/resume. Xen reaches the final suspend path
> > at a quiescent point, so there is no active-priority execution context
> > to replay after resume. Enforce this with a runtime check after
> > disabling the CPU interface: if any implemented GICC_APRn word is still
> > non-zero, restore GICC_CTLR and abort suspend with -EBUSY.
>
> You mention SGI pending state but you do not say what would happen for PP=
I/SPI
> pending state, and the patch does not look at or save/restore GICD_ISPEND=
R.
>
> Can you clarify what is expected for those?

This patch was originally based on the Linux GICv2 suspend/resume
code, which also does not save PPI/SPI pending state. The comment
above gic_dist_restore() explains that level interrupts still
asserted after resume will be handled, while edge events during
suspend need to be handled by the platform-specific wakeup
mechanism.

Saving GICD_ISPENDR would preserve the pending state at the time of
each read. However, an interrupt could become pending after that
read and before the GIC loses power. Saving pending state alone
therefore does not cover the whole suspend transition.

The assumption here is that device drivers have stopped normal I/O
and quiesced non-wakeup interrupt sources before Xen suspends the
GIC. Earlier events must already have been handled, or their state
must be preserved outside the GIC. Only configured wakeup sources
are expected to generate new events at this point.

We rely on the platform wakeup mechanism throughout suspend entry
and sleep. If the GIC loses power, this mechanism must capture
wakeup events outside the GIC and keep them observable after
resume.

Not saving pending state depends on these assumptions. The race
after a register read does not, by itself, justify losing an event
that is already pending.
---

While checking the pending-state question, I also noticed a related
issue with disabling the Distributor during suspend entry.

My earlier reasoning relied on the Distributor being powered down
during system suspend. Not every platform is required to follow
BSA.

PSCI requires us to save the state that could be lost. Section 6.8
explicitly discusses Distributor power-down as a feature of some
systems. This does not require Xen to disable its interrupt group
before calling SYSTEM_SUSPEND.

The GICv2 pseudocode in section 3.7.2 shows that irq_wake and
fiq_wake depend on the Distributor group enables, but not on the
CPU interface group enables. Clearing the group enable in
GICD_CTLR can therefore block that group's wakeup path on a
platform that uses these signals.

I therefore propose leaving the Distributor group enabled during
suspend entry, while still saving its configuration in case it
loses power. The platform would handle any further shutdown and
the required wakeup configuration. The Distributor would still
be disabled while restoring its registers on resume.

Linux also leaves the GICv2 CPU interface enabled before the PSCI
call. Our early gicv2_cpu_disable() is another difference: it can
hide that group's interrupts from TF-A's early ISR_EL1 check.
I propose leaving that shutdown to firmware as well.

Best regards,
Mykola

