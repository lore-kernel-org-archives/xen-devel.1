Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9D7C5DF82
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 10:35:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396294.1634232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx06r-0001A3-BX; Thu, 20 Aug 2026 10:34:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396294.1634232; Thu, 20 Aug 2026 10:34:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx06r-00019w-8j; Thu, 20 Aug 2026 10:34:57 +0000
Received: by outflank-mailman (input) for mailman id 1396294;
 Thu, 20 Aug 2026 10:34:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wx06q-00019q-B2
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 10:34:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wx06o-005WJ9-W5
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 12:34:54 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a86d844-e002-0a2a0a5209dd-0a2a4506892a-18
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 12:34:54 +0200
Received: from [74.125.224.47] (helo=mail-yx1-f47.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a86d84c-195a-0a2a45060019-4a7de02fd95e-3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 12:34:53 +0200
Received: by mail-yx1-f47.google.com with SMTP id
 956f58d0204a3-66ca4bdccfaso3310435d50.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 03:34:53 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1787222092; cv=none;
        d=google.com; s=arc-20260327;
        b=TwSiG+yHbfokcF8kPYE4ik5LMM3m9fVdP8SCZGHnPXMlmSVZNrn4rOjeQMpeF/Ehoi
         v+uXSE+2T/YXmOZM/J+1/qJm6drqIJSIdV4tEhErHzUHr/ob09TUl3aRyMU94lRFUIoE
         qrq3fzNJ/SA86suRtGx7VC1XJZwXntyrNmcMok3AMQWUuzFvQmIuyCmDcJcd+oEmaKgY
         yaDcAOnhGYnWUwKjJItLUcty7onBx9H9ZgjDSFz472f/S40YfQ6H4soITjG8ZtzI/7rE
         qeqRkiY1spxGRmONZfyqjQEN3a0zUMaFZUiLX7ez335oq9G346n00fyLWqKEcJ7Kxc1j
         QQoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=An0sPUB5AiII25/KlxNXPAXPhP53SdMwGLmRrNvZ+1A=;
        fh=3EhnpfHPRgJlkI2QNmIe5wJuq7CmX80ySFM1Q7ZfFu0=;
        b=JvOVhUMzN2DRWpzvmMSdJiQgzMWyhob8x7TOm0q2T3y7bwkSy1h4r8W/Y39esBzhF5
         lriaqUAz5nSmfHDEvoXCPolgIaokxUVx1uuSUeBxruEYEREGPA9WO5emddmVWmoKAx9E
         L0v2y/g29I1QpfwTcTXzgYZ9vfTl1wb3guLhL+v3zQPDymkwTiiBU+wPDvQ4g9kvh17b
         S9canSxs1+rpw4L5wByEJPt4dtL9VpdcDC7iWJcT+ZY72aBVkloR+mZqx74B58t2svsp
         XDVn/v2yZJWYvNXQ5oRa+rpwnglpeQcetZC9xYr0QM5hdjQF9QDS0BZi0wbXugfF8/3f
         XwhQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787222092; x=1787826892; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=An0sPUB5AiII25/KlxNXPAXPhP53SdMwGLmRrNvZ+1A=;
        b=IT3+cvPuPdu3wG17YSG3eU7Kr/7xEM3kUfyW3y2jywfVLhNfNGw1oOdLouVcSbJmcg
         IBcqEMbdKhJq5cqSxHbwUAs7vZEausrKsytciweoRggdsTaSYIL4Gr28ut+9kRPD+Agc
         kvMfWBIsR6WfFDMWADcznsA/eU0KJ0IuoOJejOkA+YMK9hv6nZhKKGVzTPCSxQNud3gZ
         DFgXc5r4sdxER4q5E6Ax5Hh03EPU2sN5WyTbavne72I5w6Z3/wfOHaHEyQG+Mt1hBgN6
         gGyGUIXFAdQ1DoZy8I+F+0UflBkJgZWieIYZeGVgxtLCV3nJl7pG7rk4ecY0x+Xji15/
         Jfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787222092; x=1787826892;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=An0sPUB5AiII25/KlxNXPAXPhP53SdMwGLmRrNvZ+1A=;
        b=EZktn90qE+5mfOLkmlUiJKRDd6lbdcvcb6crZv6htjydM4GGHPee6uEC6gfEmadW3d
         Sg3GT+HqDg6PMDA4v8QqH6shw0khZjp7PdPk0fI2nWt+G6evVsex47Ne4O8TynpaeJo6
         Ib5ACtONAEigYAvVbCnGYkS8OOf5TFyMmDwIFuzz/BHVHXQcO0LHhq1/VMAglR24FZBD
         haZVWVbaD/5jYWvBPJUX38QQg0IgiRPnbHrqMvP5V5BsEGQNU6Y3pGBTpI9OMYY38YId
         cO5ZbWCbL9ugAT5oVjKmBW4SaNihpD5vtR238hiKZ16yLPh8/fEC8xvqEW4jvxpjIU6/
         Q64Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq4avPkX7g5eN5rdlHhj5JaNoUf7AWG6Qnnwpb8thnzlAenFakQjlPK/zMSkPaBuoMpWNAcHstOhTc=@lists.xenproject.org
X-Gm-Message-State: AFuF++mCzEHAvO5uUJvUASdUzzCfUsSHsEp2ufVvQYfuGgpS1Hra+QZj
	Bm7CaIv84gou2NsQLPZKcP+hLkNVE8oaurt6uaJ14i9iaK2Udy63wSs7ufILfNf4fZYi6sRd02I
	Or7CsmPFXmkTRi8HjblnBLeJ1UKxiZ5c=
X-Gm-Gg: AR+sD139i0MeRoivWRRiCcl+rMXATBxM5Nj+pqj9MB4M64law+/E+0rtwnOuYnXxlVO
	X2kA/t5zItnUZvdio+mce/f/k6MjAU1k1MtZl31tXDXhkYwQO6Of4M2hkrTdxLBW2MfoPultloQ
	PtnXwfIJoZO5fQO/Jxu4C3HXbG2nCnK+T/+GrvbWDblQx63ByryFFqp23f7OrwKQn97lwm98nDw
	LJGlGjNo0r3Y3F/TH29mKTBcDx5lrQ1+7hZ3cynJtyzlp5w/XppGww4Z7anQV+cHzOf0YUDSkth
	08rNXyfrULe/BK8PtwOwYLfQq8EUzA1ZMX3IguY4u28HJ2yQd35KXS3aZZlXY92TKi+/qgnLgxI
	HOOArb0A8AOY=
X-Received: by 2002:a05:690e:bcd:b0:66c:df0d:ef0d with SMTP id
 956f58d0204a3-66cdf0df0cdmr333564d50.28.1787222091588; Thu, 20 Aug 2026
 03:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260715062206.328049-1-frediano.ziglio@citrix.com>
 <CAHt6W4cG_-=8MBJ+7dWQrLuC2Lf-fLOHDUyGwWDGQn6=9bO1Lw@mail.gmail.com>
 <CAHt6W4fFYs8fMUFer2oRL67voM_NbwtFbD=fJxFiQ5g0cujsMA@mail.gmail.com> <559e68bb-1689-456b-89a5-0a39d3bb3afd@suse.com>
In-Reply-To: <559e68bb-1689-456b-89a5-0a39d3bb3afd@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 20 Aug 2026 11:34:39 +0100
X-Gm-Features: AcwNN1UIErS0I9ozgaITjWV8kD1BmoKLw4ai2AlF9Gma-dT5IUNXkTII1bh_hY0
Message-ID: <CAHt6W4f22gHSiWLz-qvWQT33jmM0_mnwKJCyKXqnG05rGBQs2g@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] Various patches to improve Secure Boot support
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1787222093-F6A7477B-6662CDE6/0/0
X-purgate-type: clean
X-purgate-size: 2591

On Wed, 19 Aug 2026 at 11:12, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 19.08.2026 12:03, Frediano Ziglio wrote:
> > On Sat, 8 Aug 2026 at 07:41, Frediano Ziglio <freddy77@gmail.com> wrote=
:
> >>
> >> On Wed, 15 Jul 2026 at 07:22, Frediano Ziglio <freddy77@gmail.com> wro=
te:
> >>>
> >>> These patches improve support for Secure boot.
> >>> UEFI CA memory mitigation requires memory pages to be not executable =
and
> >>> writable at the same time. So changing permissions and splitting some=
 section
> >>> is required.
> >>> Remove multiboot pieces from EFI executable.
> >>>
> >>> Changes since v1:
> >>> - improved some comments;
> >>> - merged 2 pacthes removing multiboot support in x86 PE;
> >>> - removed a patch dealing with SBAT;
> >>> - other minor changes (see single patches).
> >>>
> >>> Changes since v2:
> >>> - improved some comments.
> >>>
> >>> Changes since v3:
> >>> - Added Acked-by;
> >>> - Improve commit message.
> >>>
> >>> Changes since v4:
> >>> - Messages updates;
> >>> - Clean some dependencies cause by code removal;
> >>> - Add small commit to remove a possibly unused string.
> >>>
> >>> Changes since v5:
> >>> - removed merged commit;
> >>> - remove more code/data from xen.efi output.
> >>>
> >>> Changes since v6:
> >>> - fix commit message.
> >>>
> >>> Changes since v7:
> >>> - added Acked-by, all commit are now acked.
> >>>
> >>> Frediano Ziglio (2):
> >>>   Align relevant sections to 4KB
> >>>   x86: Split .init section to satisfy UEFI CA memory mitigation
> >>>
> >>> Roger Pau Monn=C3=A9 (2):
> >>>   x86/efi: discard multiboot and PVH support for PE binary
> >>>   x86/efi: avoid a relocation in efi_arch_post_exit_boot()
> >>>
> >>>  docs/hypervisor-guide/x86/how-xen-boots.rst |  6 -----
> >>>  xen/arch/x86/boot/head.S                    |  8 +++----
> >>>  xen/arch/x86/efi/efi-boot.h                 |  7 ++++--
> >>>  xen/arch/x86/xen.lds.S                      | 25 ++++++++++++-------=
--
> >>>  xen/tools/combine_two_binaries.py           |  2 +-
> >>>  5 files changed, 25 insertions(+), 23 deletions(-)
> >>
> >> Ping
> >
> > Ping
>
> Andrew had indicated to me (apparently not to you?) that he'd like to
> massage the descriptions some while committing. Hence why I refrained
> from putting any of this in.
>
> Jan

I understand maybe we want better comments and explaining what's
missing/improvable could take more time than updating them directly,
but how many months does this require?
Especially after the changes had different acks.

Frediano

