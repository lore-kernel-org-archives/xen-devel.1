Return-Path: <SRS0=26S9=IW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC60C433DB
	for <xen-devel@archiver.kernel.org>; Wed, 24 Mar 2021 11:38:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 257BC61A04
	for <xen-devel@archiver.kernel.org>; Wed, 24 Mar 2021 11:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 257BC61A04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.100935.192619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP1pm-0000iq-8T; Wed, 24 Mar 2021 11:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100935.192619; Wed, 24 Mar 2021 11:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP1pm-0000ij-5Q; Wed, 24 Mar 2021 11:37:58 +0000
Received: by outflank-mailman (input) for mailman id 100935;
 Wed, 24 Mar 2021 11:37:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FjaK=IW=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1lP1pk-0000ie-Lp
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 11:37:56 +0000
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0606f48-fe42-4d1b-8b4d-9b0f5e9c6f1c;
 Wed, 24 Mar 2021 11:37:55 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id e18so24100831wrt.6
 for <xen-devel@lists.xenproject.org>; Wed, 24 Mar 2021 04:37:55 -0700 (PDT)
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
X-Inumbo-ID: c0606f48-fe42-4d1b-8b4d-9b0f5e9c6f1c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kti/az/G7mGfRM42R9lRXMllvlbHuv7YlHrsDqHzcM4=;
        b=bUl1S8/drWjL5pFLYRDnQj6+qMS0c2FeaChoK4JNRMdBjW1kuJN3p29f4rWFh4kRar
         EpAwAUjIY/AbzMNLppBmxzNUDS1cMdy6pD6ibFMuyjmPlOW7EHCb86v9ZxlY/stJ/+2b
         LdKAqovF4SDZcl+0BFWvfW5+FyrbKVMPeCBcmce0dVryjkotCqzQsJ7LatHZfcGexh2y
         iqhj0U918RttkwWqozTIhuUlPs3fJMEwA8XD8GdZRg3yOMv1QIb61BKKCvOkRZrULJuW
         H3eUWqvZSeSI3kAS9namxtywVU1y3+kpA78vknxwVKE1Il0L1PWZ1mT3P5NEs6jTDCfR
         JFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kti/az/G7mGfRM42R9lRXMllvlbHuv7YlHrsDqHzcM4=;
        b=G3zqzPXi5bXZbEycSS5bXuMMQ+Qe7f6CUAfKv3UjTqTDTBJP8fwszleyo8Hos9kwc1
         Z9vEhwemf/a8OM3nujU4oRy8MQo+3h67PqHxabphoyqZHVCoHVFFhx7PMw8CKjjXr0cF
         NPw99GIPYoWaALmvm+2Ci8ZyTd5Fz0aa9WCmWFa2nDfE/m/GNbKuALhVSIiGucd9l8pa
         XN+KQBnZV1qjga4H2X5trcv+e8G+rOh4wJ4uQG3lCgd3G7JUEBre6Y7+ISXtuFWLRN6G
         L/G+H7Cd1rXkjLAjj2aS818/JYBiIOWICrsDbSIP3wlsHKvb+qsC/v7Pi6Ph3H4seDI0
         qVxw==
X-Gm-Message-State: AOAM531KXfPi5Jxs/Vs/sSrqYJL7WG/QW9wWri4BM0Z5saAN4Vi9h9AZ
	yJqXDtmMmkYMemKdT7DCprJaocSkF2vBTYraRlg=
X-Google-Smtp-Source: ABdhPJwuvJq9azJS17G+zoUqtwDLTpDVSKIlk+FTyM6ZV8MKsrbaExmVHAk0qC0j9MFjhaQmT+gNEF53CsqeehOAIOY=
X-Received: by 2002:adf:83c2:: with SMTP id 60mr2979735wre.386.1616585875000;
 Wed, 24 Mar 2021 04:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <8e18a2a5-bc19-615d-0c8c-cea49adcf976@suse.com>
In-Reply-To: <8e18a2a5-bc19-615d-0c8c-cea49adcf976@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 24 Mar 2021 07:37:18 -0400
Message-ID: <CABfawhmbVyVAf7y6S+4SvdUZKUYe8kg=h-kvLfBzpVZhzquyiw@mail.gmail.com>
Subject: Re: [PATCH][4.15] x86/HPET: don't enable legacy replacement mode unconditionally
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 24, 2021 at 6:34 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> Commit e1de4c196a2e ("x86/timer: Fix boot on Intel systems using ITSSPRC
> static PIT clock gating") was reported to cause boot failures on certain
> AMD Ryzen systems. Until we can figure out what the actual issue there
> is, skip this new part of HPET setup by default. Introduce a "hpet"
> command line option to allow enabling this on hardware where it's really
> needed for Xen to boot successfully (i.e. where the PIT doesn't drive
> the timer interrupt).
>
> Since it makes little sense to introduce just "hpet=legacy-replacement",
> also allow for a boolean argument as well as "broadcast" to replace the
> separate "hpetbroadcast" option.

While having the command line option to control it is fine what would
really be the best solution is if Xen could figure out when the
legacy-replacement option is necessary to begin with and enable it on
its own, even if it's done as a fallback route. We'll have issues with
telling users when the option is needed and when it isn't. I don't
like the idea of users having to go through a route of "well, let's
see if Xen boots and if you get this weird crash/reboot add this
obscure boot option". It's just a bad user experience all around.

Tamas

