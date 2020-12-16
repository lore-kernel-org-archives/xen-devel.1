Return-Path: <SRS0=wYjP=FU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1CE9C4361B
	for <xen-devel@archiver.kernel.org>; Wed, 16 Dec 2020 14:14:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C6A22335A
	for <xen-devel@archiver.kernel.org>; Wed, 16 Dec 2020 14:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C6A22335A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.55271.96305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpXZN-0008UH-Mt; Wed, 16 Dec 2020 14:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55271.96305; Wed, 16 Dec 2020 14:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpXZN-0008UA-K2; Wed, 16 Dec 2020 14:14:21 +0000
Received: by outflank-mailman (input) for mailman id 55271;
 Wed, 16 Dec 2020 14:14:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vvT0=FU=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kpXZL-0008U5-Km
 for xen-devel@lists.xenproject.org; Wed, 16 Dec 2020 14:14:19 +0000
Received: from mail-lf1-x12c.google.com (unknown [2a00:1450:4864:20::12c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af4c21cb-67c7-4440-9643-779c25332bea;
 Wed, 16 Dec 2020 14:14:18 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id o19so23060789lfo.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Dec 2020 06:14:18 -0800 (PST)
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
X-Inumbo-ID: af4c21cb-67c7-4440-9643-779c25332bea
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DmwvF8IgzoA7KtVGEtd76/gZKuxggmaZRur5HyvCvwE=;
        b=Ko3OAcqjdApXNL1BXkFY7dSl+PGJ603F2A74GFwxfm7vOt1Et4fhUVNdbN0B1YxodZ
         c/nIWNmYImbg2MPHraAv1jO/3MMcK8Xc1q9pOOIYBtndnawOwafSiIV6G3DfFSgSArLW
         K9gjkYHCjf76IboFmufr4q112g3ReFzUFLxs1aEMxlKOdc7FGz7GMKGPcsjlNgj2Ytd+
         JF4hMVOWPrCBINulnmrJSFX5VIBpanDgUdSjPRQb6X4xwHQWzzakf9Pc5rx7llSwimJ8
         eXmTY77EBQeAAPm4c0HjCuXWxrZRj2FLksYCzbqHx98/QcCAX0l2o+gA1wXCUS7hjrIp
         vaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DmwvF8IgzoA7KtVGEtd76/gZKuxggmaZRur5HyvCvwE=;
        b=PO5RJH0qQTl1DPbTuEkrP9ErLp8PAN3h0/cp2o1uNc6V1GgZaIruHL7BpVcShRrnYV
         BM7/ZuipOGFieGZIVpUVX+MXxhFuXNShgIqgjwVv/zZ+JZ1/a6JQbwgQyMO6sL/50yhz
         Vftz4/aiyK7Gk1wrGZ36ooO/BXltj41Ui5KdfDtws8HoS54wKhQCCyXVPllOltb+QVqL
         Gtn6S+kkJxT53YIoEzZM3sHt0rjSJRR22GnQQXWX4LrWz6Wv0TC9kYjkI3wa0gG8SfeI
         kJ5+IeSJmZKSpFIL5t4PmR5f3IMa8F0X9nS+QON1i7+dB1QnEVrb9ZOiI9VJf4khvTVk
         GtDQ==
X-Gm-Message-State: AOAM5308zPRCqbc1qQzHvI6LcMVJ5/bKVo0ycX1NB4cPcHZS64CV/Qa6
	LInsMVh2TT5aVmeUswBTLXPv8X5CAbuqroroImY=
X-Google-Smtp-Source: ABdhPJzaEUDZszSAZI7uVluoFu9iNADRW+yux5PR6VdcF7NZZG/a3c8YTYmUEY9zdq8ObbVQYOeADPZ7hcomGYvuyjU=
X-Received: by 2002:a2e:8745:: with SMTP id q5mr13934227ljj.77.1608128057330;
 Wed, 16 Dec 2020 06:14:17 -0800 (PST)
MIME-Version: 1.0
References: <CAKf6xps-nM13E19SVS3NJwq6LwOJLUwN+FC6k_Sp9-_YaRt-EA@mail.gmail.com>
 <3ACCFEC6-A8B7-48E6-AA3F-48D4CDE75FA4@gmail.com> <alpine.DEB.2.21.2012141632020.4040@sstabellini-ThinkPad-T480s>
 <CAC4Yorgk89vaDsbygvebiBOan-3OWE=D9xKiri_JwQAVWZ19GQ@mail.gmail.com>
In-Reply-To: <CAC4Yorgk89vaDsbygvebiBOan-3OWE=D9xKiri_JwQAVWZ19GQ@mail.gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 16 Dec 2020 09:14:05 -0500
Message-ID: <CAKf6xpvpyA6E6gC6cmZ-Ewayyue-C5WcnGtatsxf_Cefg1CxaA@mail.gmail.com>
Subject: Re: [openxt-dev] Re: Follow up on libxl-fix-reboot.patch
To: Chris Rogers <crogers122@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Rich Persaud <persaur@gmail.com>, 
	openxt <openxt@googlegroups.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Olivier Lambert <olivier.lambert@vates.fr>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2020 at 5:22 PM Chris Rogers <crogers122@gmail.com> wrote:
>
> Hopefully I can provide a little more context.  Here is a link to the pat=
ch:
>
> https://github.com/OpenXT/xenclient-oe/blob/master/recipes-extended/xen/f=
iles/libxl-fix-reboot.patch
>
> The patch is a bit mis-named.  It does not implement XEN_DOMCTL_SENDTRIGG=
ER_RESET.  It's just a workaround to handle the missing RESET implementatio=
n.
>
> Its purpose is to make an HVM guest "reboot" regardless of whether PV too=
ls have been installed and the xenstore interface is listening or not.  Fro=
m the client perspective that OpenXT is concerned with, this is for ease-of=
-use for working with HVM guests before PV tools are installed.  To summari=
ze the flow of the patch:
>
> - User input causes high level toolstack, xenmgr, to do xl reboot <domid>
> - libxl hits "PV interface not available", so it tries the fallback ACPI =
reset trigger (but that's not implemented in domctl)
> - therefore, the patch changes the RESET trigger to POWER trigger, and se=
ts a 'reboot' flag
> - when the xl create process handles the domain_death event for LIBXL_SHU=
TDOWN_REASON_POWEROFF, we check for our 'reboot' flag.
> - It's set, so we set "action" as if we came from a real restart, which m=
akes the xl create process take the 'goto start' codepath to rebuild the do=
main.
>
> I think we'd like to get rid of this patch, but at the moment I don't hav=
e any code or a design to propose that would implement the XEN_DOMCTL_SENDT=
RIGGER_RESET.

I'm not sure it's possible to implement one.  Does an ACPI
reset/reboot button exist?  And then you'd have the problem that the
guest needs to be configured to react to the button.

Regards,
Jason

