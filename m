Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47053C9830E
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 18:55:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1432900.1653830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9oay-00043B-Ab; Thu, 24 Sep 2026 18:55:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1432900.1653830; Thu, 24 Sep 2026 18:55:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9oay-000433-6m; Thu, 24 Sep 2026 18:55:00 +0000
Received: by outflank-mailman (input) for mailman id 1432900;
 Thu, 24 Sep 2026 18:54:59 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1x9oax-00042A-1w
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 18:54:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9oaw-00FW1d-Ev
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2026 20:54:58 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6ab571f8-2eae-0a2a0a5409dd-0a2a4508a342-18
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 20:54:58 +0200
Received: from [74.125.229.205] (helo=mail-lf2-f13.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6ab57202-f659-0a2a45080019-4a7de5cdc70c-3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 20:54:58 +0200
Received: by mail-lf2-f13.google.com with SMTP id
 2adb3069b0e04-5b8d879752fso125545e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2026 11:54:58 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1790276098; cv=none;
        d=google.com; s=arc-20260327;
        b=dzfAcTWRA9iad2obB4Q3R2xOkb24XEr7vITkHLi3cV4XfutX+Jp0IelOIng3NdK0iu
         JSlZuGuc/THdSNSuEAdgOWiuhj/IagBX4hOGIj+iyFKRGRwKThrqLrV62iOJtg5pztAb
         8NZobjvzTahoTkg6sRKJzBsBU2n8giAt3e4yuTEQgi4GUI/N3x6B+/ihpL2IZ6RBbXU7
         9vesfCwUy3TSBo9me+uTSvn14UT1C3bNx9uhwHXzWDbwK3D2rlxjVBYJ5otbhiJCcZCK
         D3KWws3sYek2K21VCXdCJ+cUUlzZkODqmMsaF1kafwAx9PeVptwp5LXIFX0POGzcDFzy
         up0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PWAUwpPka71Oo5qcp6BYgkJIhV/r3ITppA9B+gt/k5U=;
        fh=RwOOD8FwKHtBBkobGpKkroeNqvZU5mMoUlw2sGgs4aY=;
        b=sAsN00f5z0cWW5MmPL2DxBZYG5oVznYX4jo12SQKtXrNKp+AHsgaqnrbUrxZJ/JrC3
         om5QJiFpn9Nigdcc1pz2grOxXJYrQr+8v3T2k9KttD0R65PG9gYQmSMWmaec2o5lCYWH
         XvYrdhK4LhpAe2XfDEtUSlbh8YUvHmDX3BEJlBPw6I0+Zci6rIa6WX1JQ1fFmNt5884G
         IJyDvFPUIwL47RbuyrxsZMoeIEnUlPqdxZTkXhdy4U2j8eWP/MIvMgs3VH5rkBRZ6QTI
         fpm9uFqILEADNqlK8DnorTeps91sKsdW8z3x9o8geJjNc8HqjmmjFgM7HuBIMj4xl3ae
         nA4g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790276098; x=1790880898; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PWAUwpPka71Oo5qcp6BYgkJIhV/r3ITppA9B+gt/k5U=;
        b=lz6hE2fGKjAvIkvGOcCFM9s2bHfKRdUXUQE6kk15Z+4ey8oUv2FdC3vaPVdOumaYol
         WAG48gDc5m/FZ+aRbyRWNZW6klUnoz/6SEyIletcWaxvsOHu1ABxix997YRGmkWBiUb0
         6dmvYJJutzeBIeZUA6uCNBZU44tXKjx3G0UhuvgvuPwnw5VzfbMewbNNNJf31bTeO89f
         xVEcPrhu+bA7p0AnJS/csRiVvyWxPS4XtUWlq2dMgrleJZLjPo3l2P8D9fyrWNCIa5VX
         dAWV9TCha/G9DXwJyG3RiIvee+vL/I7GSu4QBRX8M/6izVpGUGIOHPP8O1ByGIK4PBMM
         SEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790276098; x=1790880898;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PWAUwpPka71Oo5qcp6BYgkJIhV/r3ITppA9B+gt/k5U=;
        b=S/ztY5XvaH+Ga9HQhZpGvDCidNMRXA9rHwFuyCauKAKkJR4GMRIUssUQJs7slKBXM3
         PKLcnQ/FiquTRqziLBmVZBXZrYR2P/F2avtrMMzCSlDXegLwtOyqljjTDhk2rDJvBUpP
         TIIa2Qqnv83H4IZIU+4QsX1SU3kzMKA8a9lR5COHL+ZbGzDOvyx91ZRawOa6reE3kIBV
         jq4sYL/5C3wYpK6t5AZ9mxdLrLjKrZYEGFAakvvq5XphgaDyxX/WEIxVMIJCUY0VidRd
         h8V2m6eJcvdjJOeSlvCUwpX+QmWHXcbEoYdprGgmM0E8TkEuhckUlDLmAq8uZ2buWh/z
         NqSg==
X-Gm-Message-State: AFuF++kMKov9asS1vbk+6vAqGMtEMs20XhI+2J6d5zTX0Lws1gR7Js10
	JKbI1dzk4cbnN18C8YUcz24WkTtPCWs321+fTePIOGgiQnpR+akzPC1oCGq5K1Q5TRp0loPTJuw
	SgsyF1fRNA7JOpYWCtv4s6KAE96Xe91I=
X-Gm-Gg: AYBFou3dwMUpaiXS1SHeA54xdTCKqiJK9eKdbWucG0nf32g6uboxOV+2pqHt3iHfbBA
	Ge4pjBhK6s6Uzn2UY07kbSI/RAX/zw9q/zko3rC18JPBRGekxcSB9W5vQBM3htbW86Dtqq1nFSy
	xhTA6hD4zNJKRfHoQbZe9ltFQsZQp640xI1aKDspLrUEmDRdSVXTBQZxC2nQktCtiWejAEGtrHp
	QfNwkLZFTCyQ+OjgO98AB92V+TG465eEAgsgKGm2xJrRfKk7spkLjsfcyRchLINzSTUY5SB7zvs
	DpWSb91K7DVVoa2uOqzPobFkgDayI08cF/v5Xo27SBYMTfnMzIMPWQ==
X-Received: by 2002:a05:6512:b96:b0:5b7:6686:45a9 with SMTP id
 2adb3069b0e04-5b8df06f6e9mr1638079e87.37.1790276097458; Thu, 24 Sep 2026
 11:54:57 -0700 (PDT)
MIME-Version: 1.0
References: <38850629-8bfa-4737-99ff-0fd3f489e56e@suse.com>
 <436c0688-8b9a-4e56-9d4c-c81dcfbea56e@suse.com> <CAGeoDV9=UkLwMcuO5kwye2EODaWzZ5VYpBqAW8Pjo44fL76nJw@mail.gmail.com>
In-Reply-To: <CAGeoDV9=UkLwMcuO5kwye2EODaWzZ5VYpBqAW8Pjo44fL76nJw@mail.gmail.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 24 Sep 2026 21:54:45 +0300
X-Gm-Features: AclHuK_E4UtponCqS-Mc9o-HmEjG25hhkgdPTzu-tyXwM-cQvMjMhPGQcabaarQ
Message-ID: <CAGeoDV8jznJNqT2aVX8vmK4iPM-FCOTqKDe3q6t77JgwtvU_kg@mail.gmail.com>
Subject: Re: [PATCH 7/7] gnttab: unreachable code when GNTTAB_MAX_VERSION < 2
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1790276098-D514E87B-8592DA3D/0/0
X-purgate-type: clean
X-purgate-size: 1088

On Thu, Sep 24, 2026 at 9:39=E2=80=AFPM Mykola Kvach <xakep.amatop@gmail.co=
m> wrote:
>
> Hi,
>
> On Tue, Jul 28, 2026 at 4:53=E2=80=AFPM Jan Beulich <jbeulich@suse.com> w=
rote:
> >
> > I'm surprised Eclair doesn't spot the large chunks of unreachable code =
on
> > Arm, i.e. violations of Misra C:2012 rule 2.1.
> >
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > This pretty certainly isn't dealing with everything. For example, with
> > another helper the gt_version field could likely also become conditiona=
l.
> > With some more effort the nr_status_frames field similarly could become
> > conditional.
>
> Could we also skip the gt->status allocation and cleanup on Arm?
> grant_table_init() still allocates this pointer array, although status
> pages are only used by v2. This could be done in a follow-up patch,
> together with the fields you mentioned.

Sorry, I missed that gnttab=3Dmax-ver:2 can still enable v2 on Arm.
My suggestion to skip the status allocation would only apply if v2 were
completely disabled on Arm.

~Mykola

