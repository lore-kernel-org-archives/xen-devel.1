Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE582CCA46C
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 16:09:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452365.1667199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHkUm-0006yW-EF; Fri, 16 Oct 2026 16:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452365.1667199; Fri, 16 Oct 2026 16:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHkUm-0006yP-Av; Fri, 16 Oct 2026 16:09:24 +0000
Received: by outflank-mailman (input) for mailman id 1452365;
 Fri, 16 Oct 2026 16:09:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xHkUk-0006yJ-RA
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 16:09:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHkUk-006ZpE-86
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 18:09:22 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad24c21-bab6-0a2a0a5309dd-0a2a45038356-30
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 18:09:22 +0200
Received: from [209.85.128.177] (helo=mail-yw1-f177.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad24c31-fae8-0a2a45030019-d15580b1c9a7-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 18:09:22 +0200
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-8ab38a051aaso699187b3.3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 09:09:21 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=linaro.org header.i="@linaro.org" header.h="Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1792166960; cv=none;
        d=google.com; s=arc-20260327;
        b=iryzr6jeKe2FaJSRiwYMBE+0hsTZYFwwPqiesY4bXF+fCWfNjJ+n33es7Y2+cice23
         zCC4xcUP58fCCKbGgVEKKXP4AD2YPUaHY7HdnsTKsSW2E3w72eD77nIrOJAF03XFokZM
         X/eYIctgqKX3X9wISISolpaLucJd1fGoVW6BgKhYXCpX86wDbXvrvEqKFMy843L2NkVY
         aBbnQMUg6QSn4hl5zbo1hWfaVBM9XL45W583qnpCAEhgCXhuOLL/WjFaPh45Og+njlFK
         ItaNDO/SzXP0TW0MTwA1qfJeQ5SYMMSnfr0LlIw1azpLxPjavPvWz7PhjGA+Kt90MkaI
         dMlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ekA2GvyEqTKTqcCmn0VyediNRRfm4eukmQVIUJ/lNz0=;
        fh=DBA+KqNtehNJZ86p09hJoLgUxSp2vUn/M3gdxFQrGfg=;
        b=GuGSrkyomRkpFv3T1FkJZjBHwgmlYI8HwMbQtkdzXuOB5vSdTvbuPNKtC0iuSPFxlV
         54MokYpIV+ggnqpI32JVGzETU50viqGRkmgh4z+C6vPuz4ygD2qw1H7egcLdF0Lpq6Wh
         DD5R6j5CNAUkrtZdpqS2sJMGHEwyABejkiobPWaN/QxRd83a5Eiqv4MhMfIxGNLlyhEr
         T/0+p+LpByaupkdPDDmBX9Sb663FV1PqpFehshUaAhIt8bzKInTtCm48++OLj0AHgOy6
         +b7CVYprPictDjiURdrO1tVy96RYfweEXFx8CJg4QrLY0r0C5XI015cff1E1xlgEnB2b
         0kvw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792166960; x=1792771760; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ekA2GvyEqTKTqcCmn0VyediNRRfm4eukmQVIUJ/lNz0=;
        b=Wr9cZIYRrfJjKVFXeasgDbGmb/e7YrsB35IooGI7I7vVNSw5ZFEmb2nOa0zjs9Gamn
         cjekdYrVhFejxSua/QHMhJ6VEbGEPnhfVxy0ywXZGyu7HGrHkMWxiU8if3ztIj0riM2f
         8jlU+aS142OMZGPhXJkSO0tVv2N8+TguoK16bSypxUybUHCcnzcFNCxN0RgPQHLtDzJg
         orpM7yRQXI6tI8383WB87iQG6SWd/ZUFBpyONnhSQboc37n1vB+DkE0atE0Q2pR7AYbE
         PrLWgCbbIKR3EFn2H8wS1yj4Pjxh6Sd6iSTw5exVr83IkQ6CIhSxgqoJb+GglqL3UNCS
         /B8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166960; x=1792771760;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ekA2GvyEqTKTqcCmn0VyediNRRfm4eukmQVIUJ/lNz0=;
        b=PhZx7C5+zlHgk1FiMbuoOlgLMyXvZSBCpDr2DZyEZRKagKX/BUvjbrK63y37qII9qD
         k0gDTha/64oCov8HgJdy0J7JwR+ngwLsYTI/cwkLWeerhbu2Sz6aGDbvlK+hQZRk8bez
         a9bL4Xw3XTAtHqjw6Z8F592s3kuTVTtXRZh/wYrJrdVSEPXqBUppZlt/Ns86mDtxQkQf
         87uCUMrwHPfI3F7Lic7rVKbnKqeDzylLzITVVU7qBt1eRoOezTmWugnTLwG1XWLwKWpf
         zqYlHm6rKNyoB22ULPRmL00oLr6IwAT/wh1/wIpAOOJqHNdYC9Nj25qarZqIULxWKuuH
         ORNA==
X-Forwarded-Encrypted: i=1; AKwUvBzM714iHu48lPAya8KrENf8vciM6liwGcbxCpXNHd6dHESnSnGwGemoxY6oezd94sEWLI07aNvV3Vw=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJ6QlCLgGMwO5JNvO1JUtxvH9eAGDQoNVrd0O9ZV/zujoNt8BZZ
	1VCaclPsQ/S6sPK4274rwltcc2VuRAGeJU7jHFER43tGNxUjzJHCyf7THZ+sk+UpFDiYf7mjm5I
	XPKfB6cwtCQmjT4oDHG+3XHA9+iyOxAx1DN5ZMOdp8Q==
X-Gm-Gg: AYBFou3y2dfEPb89gugUWQMzI+rLa2/HrkB2NU53AuW4LzjvMgydEq4v3gEJfhaL8dP
	Gk3RIWzmbzpOlDhUfYSdzxSLkQ8o27q9izsETQCw6/SLIBpq+jFa7RWRcGRjZb6ghgUFws9DFgv
	2052GcU9fcgUQldNeSTtbivPZgGHfHq8uqu0p/VfIh5yW1kTNAS0BavoeHfpKsniQ/oHqXG1uM6
	kWaHpFUezOVfWU1edjn9c2dZr41cgiYpZawiETXGc8E+fcfvkhXQHMb7Kd4hxC0yobNqG5NgRW1
	yAqgWOj5YhHykY3lwsrX2hb1mFjTIgXDpOjKxjrUQIYUfS0Ig7zk6PyUrTA/Ecgyes+cLl9faMk
	BRCM0KwxKmfYPvXhUUCe/NTBOhiwM28Agpvwn2n0uYu+eCQi9sg==
X-Received: by 2002:a05:690c:4006:b0:8ae:a9c6:2740 with SMTP id
 00721157ae682-8b0f2209bd6mr1304277b3.48.1792166960326; Fri, 16 Oct 2026
 09:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <20261016142031.1204281-1-mark.caveayland@nutanix.com> <20261016142031.1204281-27-mark.caveayland@nutanix.com>
In-Reply-To: <20261016142031.1204281-27-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Oct 2026 17:09:08 +0100
X-Gm-Features: AclHuK_xiyk2gcyOJ54yQX5SpudyGYSJxaJAyBmrPRitHx7LJDYQO8xS_rh4vqA
Message-ID: <CAFEAcA-FkqRofnq037W2YzwNuHkaYs3-QkrnUGNf=R3Y6A5G2Q@mail.gmail.com>
Subject: Re: [PATCH v2 26/27] i8259_common.c: remove static irq_count and
 irq_level variables
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-33051d/1792166962-758824E9-F741EFE9/0/0
X-purgate-type: clean
X-purgate-size: 570

On Fri, 16 Oct 2026 at 15:24, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> Adjust the parameters to i8259_stat_update_irq() to allow passing in pointers
> to the irq_count and irq_level arrays, and then move the arrays into the
> corresponding i8259 PIC and KVM PIC devices.
>
> Doing this allows the statistics capture logic in i8259_set_irq() that handles
> incoming cascading interrupts to be removed.
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

