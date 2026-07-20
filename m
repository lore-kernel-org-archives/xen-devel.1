Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A59DC44527
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 09:59:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366422.1616308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlkmK-0006e5-7w; Mon, 20 Jul 2026 09:59:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366422.1616308; Mon, 20 Jul 2026 09:59:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlkmK-0006dy-5G; Mon, 20 Jul 2026 09:59:16 +0000
Received: by outflank-mailman (input) for mailman id 1366422;
 Mon, 20 Jul 2026 09:59:15 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wlkmJ-0006ds-DS
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 09:59:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlkmI-000l6h-9r
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 11:59:14 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a5df16d-e002-0a2a0a5209dd-0a2a4507d1dc-28
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 11:59:14 +0200
Received: from [209.85.128.177] (helo=mail-yw1-f177.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a5df170-b4ea-0a2a45070019-d15580b1e833-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 11:59:13 +0200
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-81eef95653fso24302437b3.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 02:59:13 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1784541552; cv=none;
        d=google.com; s=arc-20260327;
        b=A+6Wy4nkI9j4KoUf/0drF9wuFvqlT5BfDlo+vomG/yMwGtYRx9zx/gy9icDxN9Ka4u
         50M8yiELrwP1V9PBkPRF12Xaimwb8RXHfxmQcIj3hhkGxJ2rv2MVKAqiMWEIUOFeCMb5
         svSLzk66/9CPfC01InrMi7FOK4oQpybh2BJVANcmXAwp8fcEnPDtYaLAkKYoIGXSrpMo
         7MneMQt8Usgg/Aeq1Ppcq/tVT7xwTr8mdGZ5tsZgjgeMZW3ukPfJPozF5z3pQKtsRHO8
         8YOKB78G7f4n2/tHul50Igg/kqtReL1dNzYK8TkgGzdw9BBnsRGXTCILjCrxVKCmYJub
         QFVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZIJPDOGMGXtHFAAoNyKXLbsC7KraedC+8OmoR5/4Gvc=;
        fh=wk0y1wP5tyDhLPHhZ130vdu8uO7RzrblIn679649v3M=;
        b=M9/BMeaFoRQ07y02dT6vZfy6w9HA0nizYmykXp0/kVWt1A4WKTby+PO+xGs7Q/y5cq
         3C7HEz6GCyPZly6r4iPZ8d+W1TjmANGxxRpE6UHINry3zUuOK21WONXXEGSTCu/wim99
         H3+hEO6vy5FA44nHNtTKiLqNrm5phVca2uEyep1nQAOhVlsQPT+JnycWuF2RiPcBpLx1
         QqT9VA5NQ99pGwoRuC2ExNBGBDFPjBlv0KvXWc9vCQKIduCJBkxvTU23AMuLdXGrnkSS
         fcqMnojtDt3RLaRd32d9dbRULu0CtT3TPIOPXkvZ6JXMfbER59c95qVhzzf3oJwBTSmp
         4SJw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784541552; x=1785146352; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZIJPDOGMGXtHFAAoNyKXLbsC7KraedC+8OmoR5/4Gvc=;
        b=mr/ZCWojbk232Ydu6KsVQP33F9wzhKM73lydFhIYcAEpxBNbs7W29Mmz9FkQisygVH
         eSVv0iPpDAR6sYv3ZJ4AVOjjuUzUIe2auxkzEoRa4fGqfSLuhTHCKRq7kjSZuUr609uU
         OTaC3QpyrUKDbQb8APlA5FRe1B+XSmCLVZYA3hG5Aa3ybabFa+vlfQFXun0j+0/Rqvo8
         +nXNDRDlur+i1CnmgeU+nZdVjKc6aOsfi4D4eSAk8BGTilkU1tIC7F+gVI0Jxzra9iVC
         8MJdTW2PsMFzl9kzkIT8ZhzEnBM4NoADR62+fCc2m4Vjjn7RAwWTZXORL866yNMP6aIa
         BOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784541552; x=1785146352;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZIJPDOGMGXtHFAAoNyKXLbsC7KraedC+8OmoR5/4Gvc=;
        b=XTtteDP4T+2UYvBLHue4sKYa88MIke5YxoSdNery/PfeWaOrphVWk3EYkv067LTCrX
         c0GfG4bEWg2+UyKJPD9ZeZxZMEB9wc0n3u0FFtqnPPxTSbIZLIOuqRISTMFfZjPgVRmE
         F44fquQ9RI0/dbSaB0sGpwCkmCdzNqptU7sYXQV5lqEJASCheCSUjKfNjQpJyUTfNQQr
         SDZ7E91p2JcQeqbkV2fFxa6ohFHIH01vu9Nm5lUrNwDMFBqF6G9Paw9VyXCtSJgW/67y
         fCHEtDM0D9cqk2r+rDnjiSBUTG7A3auUmrL9LIQJnHX80RrjHP/5KPwff9zmJkpS2A6s
         Rd6w==
X-Forwarded-Encrypted: i=1; AHgh+RpxbbWHfI8FiFquBpG2sdqOgtBUh/HuvXCzemoSL6WYMyRabAbWuIg3VSZyJFsKh7u3tACKJjxNl68=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLyKV5vIOAQKfa0yl+wXg6UEXYVznlJKCgjDu4nu9KGViqGCFX
	k9aTdizLnull13tTLn2ftqe5JbTYUWZmkrzmiXkWRrkPsQPT52JEYcFkk8gPTjAUWSKuCL7C4T2
	mq/b1Jgh6Tb6rVQm439S3ILquFW9dPOY=
X-Gm-Gg: AR+sD13DSDEZMKJLSgFuXWIVkJZlM9nBxkXn6SaXzAgV0sUa6t8Y/MmWspki0/pLatW
	bY4VFK5VoLJs2sw04BgR5+gOaDfwNR6Fyb6dMUNi15yFutN19JF8hBMqTrOPU8YXfaOM6k/2F+R
	UDbDGhlMbAJgj64EeE/wwWTmxNH8RPc0ez7fyRoa+IlMysQGO12lSmU4RkVt8VtbCzwrzk5nb0i
	sRiY4zpN4DDHa8sYTbp/NyhFMPyEGc8cVnZGVchIsqRqQBZElnr4B3s7HTGogKe9T0B4OqNZA4D
	BJlK7vrqtKoYADdZHA==
X-Received: by 2002:a05:690c:260f:b0:81c:bd45:478a with SMTP id
 00721157ae682-81ef25d5b84mr42879337b3.41.1784541552311; Mon, 20 Jul 2026
 02:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260720001223.2876628-1-marmarek@invisiblethingslab.com>
 <83ac6e9b-3aaf-402d-9877-2ed63d365367@suse.com> <f0d40078-4e00-4307-84ae-1d5c65346af7@citrix.com>
In-Reply-To: <f0d40078-4e00-4307-84ae-1d5c65346af7@citrix.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Mon, 20 Jul 2026 10:59:00 +0100
X-Gm-Features: AUfX_mw01QeA9OO1QMiVF6Ekew7yoBFQO-ZVRoJeL9UnfvHHo-KblCsnbeP3HCc
Message-ID: <CAHt6W4cM2sYhUsu7Z3KZzMyF3JKzjHLm_orDmjEs+y4hpT98Zg@mail.gmail.com>
Subject: Re: [4.22] Re: [PATCH] x86/domctl: restore all registers in arch_{get,set}_info_guest()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ef75cf/1784541553-3C610AE4-B2DBB2AE/0/0
X-purgate-type: clean
X-purgate-size: 992

On Mon, 20 Jul 2026 at 10:09, Andrew Cooper <andrew.cooper3@citrix.com> wro=
te:
>
> On 20/07/2026 8:19 am, Jan Beulich wrote:
> > On 20.07.2026 02:12, Marek Marczykowski-G=C3=B3recki wrote:
> >> Commit 9f892f84c279 ("x86/domctl: Stop using XLAT_cpu_user_regs()")
> >> converted memcpy() of the cpu_user_regs structure to explicit copy of
> >> its fields. In the compat case, it intentionally missed few of them,
> >> named in the commit message. But the 64bit case missed also r8-r15
> >> registers, which was not intentional. This, at least, caused Linux
> >> 6.18.x crash when resuming PVH domU.
> > Oh, wow, what a bad mistake (including by me as the reviewer).
>
> Yes, I'm very embarrassed by this mistake.  It also highlights a serious
> gap in testing which we need to address.  We've managed a release and a
> half with PV migration plain broken before figuring out why.
>
...

Is migration tested by CI or just for some reason this was not captured?

Frediano

