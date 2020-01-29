Return-Path: <SRS0=uIqA=3S=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EAB9C2D0DB
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jan 2020 14:13:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 486A12070E
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jan 2020 14:13:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OIKrk+Al"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 486A12070E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwo5J-0003TQ-GK; Wed, 29 Jan 2020 14:12:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WAbB=3S=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1iwo5H-0003TL-Ra
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 14:12:47 +0000
X-Inumbo-ID: 6cc07f88-42a1-11ea-8396-bc764e2007e4
Received: from mail-wr1-x430.google.com (unknown [2a00:1450:4864:20::430])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6cc07f88-42a1-11ea-8396-bc764e2007e4;
 Wed, 29 Jan 2020 14:12:47 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id j104so4460722wrj.7
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2020 06:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yRwwKPf02IXkI4+zpzml0qzAXUybPCcm/v8YvEe1NyU=;
 b=OIKrk+Al6SsL24tFPXqSIb4VGwUIJCJxBN4N6o9MNJET7zZXVpi0mWdvPKmsKlaoV+
 HvnPiAkj02oKNraGAueGyFR6Yyj0NjhDBGzE/BDcplX8pfldfNEInlq4kCu3SkqyNu72
 qeufI1rG+YTUHv8R2P3YKT2wnnMkM9kw8p6pfl/7aNhz4Ep05yBZZRYaDayJvcXKg7UR
 DAbL5oNUZ+Qj9H79pBVimaMRfVzrjmSZx1BDqEse/ApsB8Y28qepF3K+02I/MIYjLPS1
 Bscu9L0JlQx/Q0GmAn9LBvUDoux9bR+T9aILv6J+XIGKdEOdtI6Nn+aKaNDbqPKl8I7m
 f7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yRwwKPf02IXkI4+zpzml0qzAXUybPCcm/v8YvEe1NyU=;
 b=bEKfiatPRN1KFXaUJTCbAXpzesejk8kRoGb+C0sKIp2gu2XM0EAdX3RHvQZz9vnIUq
 DuWZe9fm9Yyr7UM+fmd+IiD0isrRNd3mnAwLjpdSKaHrnCBDwgbqph0NNbUrC0yvI+Qf
 10vrIhF2IvWHIdXq/m1eC0/KzEct9PB/DknRd3VUWi93gwKbvw2EidD/Qy6Q0uQ12Auk
 Mz6yvnGxBSEGlbhqyFrTwPPBX9rstepQYoxHgXkbhc1OQEzIhBrZMZ2qtG5uC1ovYYET
 0WZ1p+LtMODpNgemrmzLPLv31nQ2wSvQ6UqHwCV1YUV96PP1eOs+RC58yXJ2Rb6Ga4P3
 Y92w==
X-Gm-Message-State: APjAAAXtHVHT9T0hkcYC48YKTnjpFo4G+sFr0JuXnaCQyYGF5aIk98y5
 qO286SMs1Wpvk+9/NgfOoAGcTAY8t/qNt5HxwoSfLg==
X-Google-Smtp-Source: APXvYqyvFJfEN/JV8sxpLoQtLO3uMCjMLGg4N8OYBJkHzWjVjHbaXLpcgMf3LmSWS+ASIkiYdw635sERMnnNhingdd8=
X-Received: by 2002:adf:f5cf:: with SMTP id k15mr37144250wrp.182.1580307166367; 
 Wed, 29 Jan 2020 06:12:46 -0800 (PST)
MIME-Version: 1.0
References: <20200129123618.1202-1-pdurrant@amazon.com>
In-Reply-To: <20200129123618.1202-1-pdurrant@amazon.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 29 Jan 2020 07:12:10 -0700
Message-ID: <CABfawh=SYSACWwmgcUwiVNpcZvQcTzrprhMzTSWZ1k1cy9cP1g@mail.gmail.com>
To: Xen-devel <xen-devel@lists.xenproject.org>, pdurrant@amazon.com
Subject: Re: [Xen-devel] [ANNOUNCE] Xen 4.14 Development Update
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, luwei.kang@intel.com,
 =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, dwmw@amazon.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA9PT0geDg2ID09PQoKVk0gZm9ya2luZyBzZXJpZXMgaXMgYXQgdjYKClRhbWFzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
