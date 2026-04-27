Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B2EFF8864
	for <xen-devel@archiver.kernel.org>; Mon, 27 Apr 2026 21:39:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1295336.1571998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHTg7-0006yX-PC; Mon, 27 Apr 2026 21:39:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1295336.1571998; Mon, 27 Apr 2026 21:39:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHTg7-0006yQ-Mg; Mon, 27 Apr 2026 21:39:43 +0000
Received: by outflank-mailman (input) for mailman id 1295336;
 Mon, 27 Apr 2026 21:39:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <torvalds@linuxfoundation.org>) id 1wHTg5-0006yK-Km
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 21:39:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHTg4-00FA7s-4K
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 23:39:40 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <torvalds@linuxfoundation.org>)
 id 69efd71e-2eae-0a2a0a5409dd-0a2a450b933e-38
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 23:39:39 +0200
Received: from [209.85.218.50] (helo=mail-ej1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <torvalds@linuxfoundation.org>)
 id 69efd79b-212f-0a2a450b0019-d155da32adb0-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 23:39:39 +0200
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-bb3c4d8cc29so236178166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 14:39:39 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com.
 [209.85.208.54]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bb808a36817sm9569066b.20.2026.04.27.14.39.37
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 14:39:38 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-678adefbd26so5624876a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 14:39:37 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=linux-foundation.org header.i="@linux-foundation.org" header.h="Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777325979; x=1777930779; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=akMjFJmNOnA3a9IRgSbo2Rib99JT/1fQD+a+OQo/iQc4pztmwlwv2srnvDj5ymq197
         jM4fOJ5rJxW7h9Qvjhrk5+B+0KkDTJxDPdLG1TXy+5yzUSiBogTGhvgq3HSCqALcSFBJ
         PJriPe046EySjSYli0/VpcgGCZkf3nYTMmafg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777325979; x=1777930779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjF1Jdn4Kp6xFyaBmAP2391GfFF2q7kuOVlruTChM90=;
        b=eRWrqgn2SxNYWydvbLD71tin0YfL1L17CKj+CM4cVFonFfc/lfz/1LFoLiVnDsctph
         A3K52dwKFWYfdFAWHcdN6y3hS8K/GAaW13w3H5KcTer7G1qxYJncuW/wJAOawRE8wFnk
         0DbAmuwSrRHB2brnSLcdVHmltxYmJrQNHiEY5y9xd2VtPcvnlJ2oPTPzDlQKhNqYcqNH
         02el59/ARi+bV6rs2AvHbqF1Ef/1GoHBWYsOZpWV+10KWW06S3MdGHKEyEUkqTUV55aq
         J76ZDptis5SPEwsGgyvBB4haxPxRstE9FKGJdcCQPdxFd++PcUWcYu1xho8CRYpZNcxJ
         SEMA==
X-Forwarded-Encrypted: i=1; AFNElJ+DoBDgyF9y/6UOsvjp3eNsCoko5gD0dw5Xi5ORjQ/rG+jyNVFqUsCAogW7qiXorm5aPTPGi5t4TeU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx0em2wPsb4uRDaHw1kIYhtSeMJweuOHDCommXziWPzrIHMz1F9
	jXS6SEdZCo223C+RdUDB+zjOneE2db5pas9fhJaWoSaVbR3tsnrDRYbf5Qq0VzXm/c85rua+1yL
	ldq4fgiihZg==
X-Gm-Gg: AeBDieuBwBZBbsbmrS8mk7C5zY1Evpuvwqytpk2NCnaPZWLfzSM4WrEsbsorQ1NJ1+W
	qZEeXtNpgJRIByRCwTrjn+O1uzpb8A0cZLQ5acZhY970BKe2K8tXBVmzKx/pqTwjqoOkSE8/BHr
	YD/CTbbre75IoFnMlGsLF8IwSYyixegt5/e9knxDZcYc3cQef+cz3RRx0KaUGmHijQGope6ONuU
	RWW4ueiZJ/m7+xnCFhwwPc+hIJWZ7i6eFKGMbJ2kbrh+jAlLE1uN1KoPp56Gp7HfGcQ4HDjgxG/
	w+kPHLCCaruRgGkocCfNYktzS101qmRawd7mh28b2deGllsEQiyMkgVK7U2lN7q/Qr38anV8W0w
	zOPcU2/OoYw9hTMXG4DmNTnVyP4Q57UqwB9Qy9IBz568ItBmaR8267G56COTKAZxT7nsrMd5PpC
	ahaYCg9XgJFTUhuCGp+mm7u9baCzO7ioMpcIVo8odaUXD9m97mVk5+Mx95QGQ/wfYK1Px4HHlaw
	nltNo+bm6w=
X-Received: by 2002:a17:907:8745:b0:ba7:670b:f076 with SMTP id a640c23a62f3a-bb8020c9f60mr31968366b.2.1777325978807;
        Mon, 27 Apr 2026 14:39:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ziLJN+XJyMzJtU4t+0+lcJ2KyxkSExJTbykm0CWE8m0TmUdoIwwdUYext8s1hDSZ2/kEZ0nw2n9Q=@lists.xenproject.org
X-Received: by 2002:a05:6402:5216:b0:679:1f4f:9d30 with SMTP id
 4fb4d7f45d1cf-679bb04c1a2mr179970a12.4.1777325976937; Mon, 27 Apr 2026
 14:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
 <CAHk-=whC1DZojwdMB1=sJWG2=dsCdfyU8N6tDE1qx50HRZ-WJQ@mail.gmail.com> <20260427222914.1cb2dd3b@pumpkin>
In-Reply-To: <20260427222914.1cb2dd3b@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 14:39:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
X-Gm-Features: AVHnY4I-AxqvQRk42MegvhKMp_z4sSEpEzhzpgw2GyV2bV8dezSPoI0JTlwB18Y
Message-ID: <CAHk-=wg0SGbRYhdZ1kvJUTv1HEvmRJyQauFtBGV_fMcZVF8UpQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 5/9] uaccess: Switch to copy_{to/from}_user_partial()
 when relevant
To: David Laight <david.laight.linux@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Yury Norov <ynorov@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-fsi@lists.ozlabs.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, linux-wpan@vger.kernel.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-fsdevel@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	bpf@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-42698a/1777325979-7E36CF3B-AAE2FA5E/0/0
X-purgate-type: clean
X-purgate-size: 484

On Mon, 27 Apr 2026 at 14:29, David Laight <david.laight.linux@gmail.com> wrote:
>
> I think there is a slight difference in that the normal copy_to_user()
> will determine the exact offset of the error by retrying with byte copies.

I have this dim memory that we decided that you can't reply on byte
exactness anyway, because not all architectures gave that guarantee
for the user copies.

But that thing came up many years ago, I might mis-remember.

            Linus

