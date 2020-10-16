Return-Path: <SRS0=yWKO=DX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEEE6C43457
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2020 17:03:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4301C20848
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2020 17:03:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DCgWpy+e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4301C20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.8208.21876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTT8D-0003vC-Ka; Fri, 16 Oct 2020 17:03:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8208.21876; Fri, 16 Oct 2020 17:03:05 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTT8D-0003v5-HF; Fri, 16 Oct 2020 17:03:05 +0000
Received: by outflank-mailman (input) for mailman id 8208;
 Fri, 16 Oct 2020 17:03:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eysm=DX=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kTT8C-0003v0-Jr
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 17:03:04 +0000
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00f2df56-b60c-4af2-a803-66abcc4d56d7;
 Fri, 16 Oct 2020 17:03:03 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id c141so3829119lfg.5
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2020 10:03:03 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=eysm=DX=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kTT8C-0003v0-Jr
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 17:03:04 +0000
X-Inumbo-ID: 00f2df56-b60c-4af2-a803-66abcc4d56d7
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 00f2df56-b60c-4af2-a803-66abcc4d56d7;
	Fri, 16 Oct 2020 17:03:03 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id c141so3829119lfg.5
        for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2020 10:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zv8iWa+xTqVtDgllI7gt6Ed7/TcekXXbJ1P2Kb3yK1g=;
        b=DCgWpy+eENccUPCa6eQgRmQx9F7+4oB0IQ+N0/6Gvhb8lFeGqBg91jEnDlISyaA4Xx
         IN3s+LFSouxDHdQBViSY4/IOhsg6NpUufQfyiKZYtMt/s712yMKlj1ht34wThTzi99WL
         NOTyxO2jQcSJxcnmYNVrjTRb8ZmhFb3M6ypnG7cczfm4HtWqPg0FbnHzpkHod20SKSCv
         oDzGZjcI4LNve/aq5UzLtTGwH1Izza5cx6tgU3221OgG5kb9LG5uZzATT/sjnqJVTtN5
         VFhMpDBwP/UDLg+nccjTpoAKytj7LrYXA7+qbPe/xZDZbBzXBardumWBj3kMPfnOA7xT
         A3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zv8iWa+xTqVtDgllI7gt6Ed7/TcekXXbJ1P2Kb3yK1g=;
        b=cUO35jXCVj/pGfych2W9Hf7Vh8/SNQn31FxRv7a2WpAAGk3BQcsBSotX9uZbkwUkaA
         s9NNJpJjfbxcQt7Kj9qDCuKLrVKSWg7E/+Pzb5lCiDu5LLE5vvrhLWKuUAjyq7XjVFg9
         Tv1mPZBxFIMFr/kGmdze3bFtJLqZcD8M6/695r9ucAMAkxPSQCttQ7YDfOkJqFo9NV/t
         C51ArzkbcRLYqn2sACgDZD6cQOefKVXp5IecrOs66mthB605MjeGUtH35VV7Bnh/NnFF
         R4Lm9ro8eY7vfcySVVdwOk2zhgaVUC1OH1mIn9YjJnsGmpqxqPr6LjMakDRB+3dtkW8b
         nH4g==
X-Gm-Message-State: AOAM530EZov6yLVKRHOe2NZh3deQTzJ1B+XVFL8vVlZoeesDTxG0koS6
	HMrkCBl7H0qzaY9V770SCdiflbIIfCisN4Hfsq0=
X-Google-Smtp-Source: ABdhPJyGL/Yooebd0519+/4KTDkpfCwS6mxLkqyhD7ELt7L7HAP7ohf1M4H2M4NZPZEOuj0GEptsIJL8YN5hFbti6Ew=
X-Received: by 2002:ac2:4ed0:: with SMTP id p16mr1681945lfr.554.1602867782406;
 Fri, 16 Oct 2020 10:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201013190506.3325-1-jandryuk@gmail.com> <20201016153708.GB3105841@perard.uk.xensource.com>
 <CAKf6xpssB-FGwiEhLqV8OFjBGuP4LKYh+9Pj_Bj7p5U2CJSw=g@mail.gmail.com> <20201016164428.GC3105841@perard.uk.xensource.com>
In-Reply-To: <20201016164428.GC3105841@perard.uk.xensource.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Fri, 16 Oct 2020 13:02:50 -0400
Message-ID: <CAKf6xpst6xpMytFf_Pqi9-Y5TqhcfGp5odq=DEA-hBBjdSHMWw@mail.gmail.com>
Subject: Re: [PATCH] hw/xen: Set suppress-vmdesc for Xen machines
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: QEMU <qemu-devel@nongnu.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>, 
	Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 16, 2020 at 12:44 PM Anthony PERARD
<anthony.perard@citrix.com> wrote:
>
> On Fri, Oct 16, 2020 at 12:01:47PM -0400, Jason Andryuk wrote:
> > On Fri, Oct 16, 2020 at 11:38 AM Anthony PERARD
> > <anthony.perard@citrix.com> wrote:
> > >
> > > On Tue, Oct 13, 2020 at 03:05:06PM -0400, Jason Andryuk wrote:
> > > > xen-save-devices-state doesn't currently generate a vmdesc, so restore
> > > > always triggers "Expected vmdescription section, but got 0".  This is
> > > > not a problem when restore comes from a file.  However, when QEMU runs
> > > > in a linux stubdom and comes over a console, EOF is not received.  This
> > > > causes a delay restoring - though it does restore.
> > > >
> > > > Setting suppress-vmdesc skips looking for the vmdesc during restore and
> > > > avoids the wait.
> > >
> > > suppress-vmdesc is only used during restore, right? So starting a guest
> > > without it, saving the guest and restoring the guest with
> > > suppress-vmdesc=on added will work as intended? (I'm checking that migration
> > > across update of QEMU will work.)
> >
> > vmdesc is a json description of the migration stream that comes after
> > the QEMU migration stream.  For our purposes, <migration
> > stream><vmdesc json blob>.  Normal QEMU savevm will generate it,
> > unless suppress-vmdesc is set.  QEMU restore will read it because:
> > "Try to read in the VMDESC section as well, so that dumping tools that
> > intercept our migration stream have the chance to see it."
> >
> > Xen save does not go through savevm, but instead
> > xen-save-devices-state, which is a subset of the QEMU savevm.  It
> > skips RAM since that is read out through Xen interfaces.  Xen uses
> > xen-load-devices-state to restore device state.  That goes through the
> > common qemu_loadvm_state which tries to read the vmdesc stream.
> >
> > For Xen, yes, suppress-vmdesc only matters for the restore case, and
> > it suppresses the attempt to read the vmdesc.  I think every Xen
> > restore currently has "Expected vmdescription section, but got -1" in
> > the -dm.log since the vmdesc is missing.  I have not tested restoring
> > across this change, but since it just controls reading and discarding
> > the vmdesc stream, I don't think it will break migration across
> > update.
>
> Thanks for the explanation.
>
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>
>
> Do you think you could send a patch for libxl as well? Since libxl in
> some cases may use the "pc machine instead of "xenfv". I can send the
> patch otherwise.

I should be able to, yes.

Regards,
Jason

