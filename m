Return-Path: <SRS0=Zr9Q=MT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2A6C4338F
	for <xen-devel@archiver.kernel.org>; Tue, 27 Jul 2021 13:50:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AB3661A8D
	for <xen-devel@archiver.kernel.org>; Tue, 27 Jul 2021 13:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5AB3661A8D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.161216.296019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8NTS-000404-1a; Tue, 27 Jul 2021 13:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161216.296019; Tue, 27 Jul 2021 13:50:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8NTR-0003zx-V0; Tue, 27 Jul 2021 13:50:21 +0000
Received: by outflank-mailman (input) for mailman id 161216;
 Tue, 27 Jul 2021 13:50:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t9d+=MT=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1m8NTQ-0003zr-7E
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 13:50:20 +0000
Received: from mail-lj1-x22c.google.com (unknown [2a00:1450:4864:20::22c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f922cc1-4c39-4156-ba7f-172dee977338;
 Tue, 27 Jul 2021 13:50:19 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id b21so15967426ljo.13
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jul 2021 06:50:19 -0700 (PDT)
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
X-Inumbo-ID: 9f922cc1-4c39-4156-ba7f-172dee977338
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dMWmlrGpXXxY/ZVwj1k4LoDE/Lp/cjWBmkGwRkoGYyU=;
        b=GMgACVF9mFlGmT6/mbgVGaH1xl4AqUSBShpqWHM82rmt/sHpxvZ+I9i8EcUtT7RKDx
         iTLppeS9yUuDyGuzcD2gvOPfs0qqDrHE6Y6gwu6WBdC0ZEswxYh6FS3ZicEYfFqiVQiq
         0Hm5D4wuQK9cAhCD9MHZrlirYmfqdFCLbvK+b8v/gJx5elTNEqJU91Pn2zXgtlGG92LP
         ICmSIMZfbqxNSZF99jUKsAXBX3EJI7l6OTUxTV8OHIo7JCRWrCpKAdVC1IjqCSU2HwR9
         T3Wz8nJlJ96cJWIKRuFGBfN0LE8Y2IRLwsvkJ3dEBIihZP8HCo4DcAQ8TQRjgicAfJ3K
         1LQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dMWmlrGpXXxY/ZVwj1k4LoDE/Lp/cjWBmkGwRkoGYyU=;
        b=suFiSRbc8xiGA/J8E2SsakStqHEuoQ59JySwzEH51G6SB9IhTzxgOkBz4u5YtCgRRr
         E0b33k5MFfq4j4aCFPixtCzItz9s70FYTYiCYtsgJ2e/X7g+5CUazvvEg39kZoia+SjN
         w5D9+abmv+BfBqyVKBzlHQg4Wf3fNntXEA46v8EnaKJ2oo9GeodHVeuHBA7KTM9x896y
         OxgILBuN0Do8RGOAXOSzz7HA8Jmt+P0SsY+i5wy+L33YBJZZ/xQXOFKSB0St45tuFTiD
         j4tGCASuxuatzlXkAfgHga++Owhxb4BMOPar93ubOYqNhOL1Jm8a0PpbBZo9DZYRtTes
         kbnQ==
X-Gm-Message-State: AOAM532NJN81TMUGPDwKP2N7YGYLDatj0gSoJCynF1kVWXjYrQEZt1RG
	A6BOTtxz0BdWMGM5BTR48oVpOZ7QJ0UkFJJzIQ0=
X-Google-Smtp-Source: ABdhPJxD1J56ghd8iHuH/t2RZF6LyFFDKasKln4c4vucUxN6gfW0d73jYyGeWinGl0MPpX3QygRk2mvvXkoJEjm2eYA=
X-Received: by 2002:a2e:a5c6:: with SMTP id n6mr15785685ljp.204.1627393818167;
 Tue, 27 Jul 2021 06:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <8ee22fab0731347dd7f998c5f336eac804785c28.1627014699.git.scott.davis@starlab.io>
 <CAKf6xpvZZCdEbPoetXabX15yL_oMnya0813-nrm6+WagL3Wx3w@mail.gmail.com>
 <YP/5wL2p/CGR5g7D@mail-itl> <24832.2790.631888.595948@mariner.uk.xensource.com>
In-Reply-To: <24832.2790.631888.595948@mariner.uk.xensource.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 27 Jul 2021 09:50:06 -0400
Message-ID: <CAKf6xpuKGg-YdSFeLqqh7wtHogXiDmQ30p7Zcc0NEQQ2wwrs8g@mail.gmail.com>
Subject: Re: [XEN PATCH] tools/xl: Add device_model_stubdomain_init_seclabel
 option to xl.cfg
To: Ian Jackson <iwj@xenproject.org>
Cc: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Scott Davis <scottwd@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	Scott Davis <scott.davis@starlab.io>, Wei Liu <wl@xen.org>, 
	George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@ainfosec.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P . Smith" <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 27, 2021 at 9:32 AM Ian Jackson <iwj@xenproject.org> wrote:
>
> Marek Marczykowski-G=C3=B3recki writes ("Re: [XEN PATCH] tools/xl: Add de=
vice_model_stubdomain_init_seclabel option to xl.cfg"):
> > On Mon, Jul 26, 2021 at 09:07:03AM -0400, Jason Andryuk wrote:
> > > Sort of relatedly, is stubdom unpaused before the guest gets
> > > relabeled?  Quickly looking, I think stubdom is unpaused.  I would
> > > think you want them both relabeled before either is unpaused.  If the
> > > stubdom starts with the exec_label, but it sees the guest with the
> > > init_label, it may get an unexpected denial?  On the other hand,
> > > delayed unpausing of stubdom would slow down booting.
> >
> > Some parts of the stubdomain setup are done after it's unpaused (but
> > before the guest is unpaused). Especially, PCI devices are hot-plugged
> > only when QEMU is already running (not sure why).

Thanks, Marek.

> I think the PCI hotplug involves interaction with QEMU, and providing
> only hotplug simplifies the code in libxl.  Anthony, do I have that
> righgt ?
>
> Naively, it seems to me that the security risks are limited because
> until the guest is unpaused it doesn't have the ability to do
> anything, so cannot yet mount an attack on qemu.  So I'm expecting
> that qemu is still trustworthy until the guest is unpaused.

I was looking at it from the other direction - protecting and guest
and stubdom from dom0.  The nice thing you can do is prevent dom0 from
mapping the guest's memory after the relabeling.

The relabeling placement in this patch may be okay.  The stubdom
itself is a dom0-supplied kernel & ramdisk.  So a window of time where
it's running before being relabeled isn't that big of a deal.  i.e.
instead of dom0 modifying the stubdom in that window, it could just
supply modified kernel and ramdisk initially.

Relabeling guest & stubdom prior to unpausing the guest ensures they
both have their desired labels before the guest is unpaused.  Like you
said, that seems to be the important part - both domains have their
desired label before the guest starts running.  It's when the guest
starts running that it may have sensitive contents in its memory.

I am curious if the relabeling in this patch requires more flask
permissions since the running init_label stubdom sees the paused
init_label guest.

Regards,
Jason

