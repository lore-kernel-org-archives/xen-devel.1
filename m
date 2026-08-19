Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15FEC5DF86
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2026 10:04:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1395039.1633577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwd9L-0003ee-59; Wed, 19 Aug 2026 10:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1395039.1633577; Wed, 19 Aug 2026 10:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwd9L-0003eX-1a; Wed, 19 Aug 2026 10:03:59 +0000
Received: by outflank-mailman (input) for mailman id 1395039;
 Wed, 19 Aug 2026 10:03:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wwd9K-0003e8-5g
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 10:03:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwd9J-005StN-IV
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2026 12:03:57 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a857f88-e002-0a2a0a5209dd-0a2a4503c18a-14
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 12:03:57 +0200
Received: from [209.85.128.175] (helo=mail-yw1-f175.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a857f8c-fae8-0a2a45030019-d15580afd537-3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 12:03:57 +0200
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-836cb2fa1bcso13068767b3.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Aug 2026 03:03:57 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1787133836; cv=none;
        d=google.com; s=arc-20260327;
        b=abNGgkbtv8xeHMeOjsEc6CVolrj3vz/k6gIvmhdYj1PqcjP/Vns5fRTpppkyuqgWu8
         dbiKWkXxk0HGpM/50z70RRvf4VDBaZLhm90NYaZpfAWTxIg6EqdxY9TKyajUPlTz3u2J
         lSyzNJrk7NaSuDKoDT70Xe1lwuM/kZ+qN92URX6YwrJvkFod7LOdQa3SnHhZ2sEYLtw9
         rUXwPyDXUyfBixjr9cM9Qt1YS+d1PDrzuh6IwuzSaM4snZe9A6d0fsTs4TO7d1F3mK2g
         0JkbpB2ea9wuPCzsq8SMhtdUp0HjOFo7Wqg5/KGnTxGczlPtDquUOVtyPTceIyNP1cs8
         xv5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mDNLO0xc31qLwjng0ficJHE9ArvswGdZXzGZB5MG/YE=;
        fh=gKNe9p6CUigmZ3hfEbBZPSHY3Mosr9iEmW1Mh4pK8Uo=;
        b=iygMP8N9lL1QdCDELGpZkv50PsJ0je6oQa+CiVfIVGKayxArKNyi9DrF78DQYB7p1z
         7t934CErtSHBq6GuC+JVXvJZ4cH4KyBDctzxgIy8vYxthY8Ui+cBmQQPIEOmKgyrF1+C
         /zrwSyJ5YFN2lqG0xNtOB8eUGZYT8dlLVsbL7FpVN33OyBCIc+kxmyeD/NpXoXujfkN6
         2JEQpiJT3mxgDk+h9MpOwo31bjicUkXDq/Dg8ipEAn8dKs38D7K2XVXLU/7/zBnRS2Dm
         UGY+iAE1uvtrM3Mmgl6vzSSO1jf9BS4k2eR7WxHiYJr2Hf/ljJSRNIEge/E8+GQEyc9U
         rixQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787133836; x=1787738636; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mDNLO0xc31qLwjng0ficJHE9ArvswGdZXzGZB5MG/YE=;
        b=A5uO6vmR63ScJyc0mnImuZpYuWC2cUltF1CL5J0UU4vfAXut1jACNjdbDYbgaHdh87
         t5CNWyna9f01XnbAm34KO6vV9RIZ48zIkXsExAwM6SZxB1tf7SVqt/37DFEseZj8S/eV
         iXHMxydoPuhoSu8AmJw9BPcTmdsxgk0V4PrH8Xpf3vCRp8hgz9M9f1SBCWLYXvnlJgMg
         5L87UPCJUe2y67pjt7CEvsh/V0eLZyNCVRLBgTJy+IIZmbAgHHmwEKYL6XBvZDYj9Kfu
         9Z0tYctx6mAok3X5+avuw1aXSuI1wlvfmJBtxdUfejoTb2hC5g0J5m5s2R9ESESP+Fve
         x1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787133836; x=1787738636;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mDNLO0xc31qLwjng0ficJHE9ArvswGdZXzGZB5MG/YE=;
        b=FXIc25M9FhC6eli4T31jmWHWg/MoqNlFFk/oo5AkTw0qyZECcQ/bdeGX2FKMk1GGJg
         NOLAy1WdSd2DVClExBmsOAR7TsypLxjvQLeO8CfdHlTI41PoT3Bve6waqni1wKsL5b8R
         CSrvVyrB8BKrl3pOaFljYh4zC7OHDwJ+z+VGnIiCt4c3Fq0YUxQmYQruHP35iNU04Oko
         lz7Xmsbg4q8ilXgaKgYTjU3x5Qvg6j4T2Gik9RUBvbLQ0yidRMfXHknLHfy5XrmkVfeu
         yEw0QLQ53UbjlQGIV5Twik8Hiauf2F20pjV/jk4mhKQbb0z64SDOEqplwvokAuTLP9HT
         ONPg==
X-Gm-Message-State: AFuF++nbWAAu83e2SrR4svAuw2iG4OEuexRsDbu64mpCfcLrg0x/zyw8
	/1jo5NuGRConl6u3F9RaBwmXQi3QNEAcSfgsUN2ebgMZM5WSW8vAf79RXjYNpDfXqDoC0Zlz/bL
	i/8J37MhCI8MH7yb19hOvUGfST1ser2K13a2s
X-Gm-Gg: AR+sD13agG5uUDWn2gIG0le2C8MpbCahRV7Y5UDf5bgKOiU8d0CTpQ6jxhLX/t+tcKb
	gHOVpTtRqIpK1RKIoWmBUieYiObtE3eT4AG5GGEobvlotSnEDp29nzZUYJ6q2Xzf2NlfC2W/+Ey
	FPbmtUJ1Emdn0L+kd6lQLUntzOb0ahOWop+q0jQhXs//Wx6jfYaefRsgzNtI4JhR+QjgnXJSZr0
	zCoC0VwzgmKbHMDHXyWYv3VmOo79wuZlNfxEYRAwXqfZBp6CXi6BZa/1L5QWQ7esVG82t1fCt7E
	VX4SDvnK3f7Ci6nZllg/1rdv4+V2AiKWQzily2Nvb+2fFF4pxVmmxabqcHeBDslkJtFEeyQYrAC
	cAg==
X-Received: by 2002:a05:690c:e0d4:10b0:81f:650d:1377 with SMTP id
 00721157ae682-844e53b3419mr11046027b3.35.1787133835843; Wed, 19 Aug 2026
 03:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260715062206.328049-1-frediano.ziglio@citrix.com> <CAHt6W4cG_-=8MBJ+7dWQrLuC2Lf-fLOHDUyGwWDGQn6=9bO1Lw@mail.gmail.com>
In-Reply-To: <CAHt6W4cG_-=8MBJ+7dWQrLuC2Lf-fLOHDUyGwWDGQn6=9bO1Lw@mail.gmail.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Wed, 19 Aug 2026 11:03:44 +0100
X-Gm-Features: AcwNN1UEiPDCoqggR9ARSXM1iRAUXqd80NSnO7hdkEQpwi5fua9wjNtOi_oAt8g
Message-ID: <CAHt6W4fFYs8fMUFer2oRL67voM_NbwtFbD=fJxFiQ5g0cujsMA@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] Various patches to improve Secure Boot support
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1787133837-7468B4E9-87005187/0/0
X-purgate-type: clean
X-purgate-size: 1930

On Sat, 8 Aug 2026 at 07:41, Frediano Ziglio <freddy77@gmail.com> wrote:
>
> On Wed, 15 Jul 2026 at 07:22, Frediano Ziglio <freddy77@gmail.com> wrote:
> >
> > These patches improve support for Secure boot.
> > UEFI CA memory mitigation requires memory pages to be not executable an=
d
> > writable at the same time. So changing permissions and splitting some s=
ection
> > is required.
> > Remove multiboot pieces from EFI executable.
> >
> > Changes since v1:
> > - improved some comments;
> > - merged 2 pacthes removing multiboot support in x86 PE;
> > - removed a patch dealing with SBAT;
> > - other minor changes (see single patches).
> >
> > Changes since v2:
> > - improved some comments.
> >
> > Changes since v3:
> > - Added Acked-by;
> > - Improve commit message.
> >
> > Changes since v4:
> > - Messages updates;
> > - Clean some dependencies cause by code removal;
> > - Add small commit to remove a possibly unused string.
> >
> > Changes since v5:
> > - removed merged commit;
> > - remove more code/data from xen.efi output.
> >
> > Changes since v6:
> > - fix commit message.
> >
> > Changes since v7:
> > - added Acked-by, all commit are now acked.
> >
> > Frediano Ziglio (2):
> >   Align relevant sections to 4KB
> >   x86: Split .init section to satisfy UEFI CA memory mitigation
> >
> > Roger Pau Monn=C3=A9 (2):
> >   x86/efi: discard multiboot and PVH support for PE binary
> >   x86/efi: avoid a relocation in efi_arch_post_exit_boot()
> >
> >  docs/hypervisor-guide/x86/how-xen-boots.rst |  6 -----
> >  xen/arch/x86/boot/head.S                    |  8 +++----
> >  xen/arch/x86/efi/efi-boot.h                 |  7 ++++--
> >  xen/arch/x86/xen.lds.S                      | 25 ++++++++++++---------
> >  xen/tools/combine_two_binaries.py           |  2 +-
> >  5 files changed, 25 insertions(+), 23 deletions(-)
> >
>
> Ping
>

Ping

Frediano

