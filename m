Return-Path: <SRS0=O1tB=FO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41738C4361B
	for <xen-devel@archiver.kernel.org>; Thu, 10 Dec 2020 14:47:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3D1522EBE
	for <xen-devel@archiver.kernel.org>; Thu, 10 Dec 2020 14:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3D1522EBE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.49376.87310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knNDd-0006GX-Sr; Thu, 10 Dec 2020 14:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49376.87310; Thu, 10 Dec 2020 14:46:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knNDd-0006GQ-PT; Thu, 10 Dec 2020 14:46:57 +0000
Received: by outflank-mailman (input) for mailman id 49376;
 Thu, 10 Dec 2020 14:46:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t4S1=FO=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1knNDc-0006GL-Fy
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 14:46:56 +0000
Received: from mail-ej1-x643.google.com (unknown [2a00:1450:4864:20::643])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d183679-b709-42fd-bfbc-4ae2a9c64bab;
 Thu, 10 Dec 2020 14:46:55 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id jx16so7655149ejb.10
 for <xen-devel@lists.xenproject.org>; Thu, 10 Dec 2020 06:46:55 -0800 (PST)
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
X-Inumbo-ID: 5d183679-b709-42fd-bfbc-4ae2a9c64bab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Gnog/ZDg4vUsu/nZaon+KwESfvhC1ZcgHfRWYsilTJU=;
        b=OjSF7hTNj1VGglWlkOX0X1dBduXiJvq389R+cxqIRwpdEkAwU8C5xqSali8y4qg8kQ
         pHavcUZQGOsp9DEGYk18bL13bmlauyNPgd0sBkZssiO0lKWy2/DWw1UtvYBCluM2oMdQ
         PHiZXb5s5FzA0N20bAAA8nJUZRvRPjFj81mOqgDVUy+SZjiqkvLr6cW2kKWMYLznsYrD
         XMcQo0K4qkNutd1YtTpRiVA5OktEQTUTSfuFw7QxGdel2tGxXgGtCA3GPYr1c+/4ZohD
         33fgdKz7FyeAuUXHkhmBmeL8BS33Ruobz4pMx6s5SkTkBxZz/DGojTp4q+l2BSzt1QWZ
         brAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Gnog/ZDg4vUsu/nZaon+KwESfvhC1ZcgHfRWYsilTJU=;
        b=aWJihKt8jMubdr/qNOzO7E8o9TyiNf4huBMu4kmb8CrA1GUlehICh/06I7tAAFEqrN
         i/IkLD4FFeOr6MLnjj6iiSwSVd2N3oPnzXG57ED1E3euHhx6DSqnZnijiWe7GPfO4IvE
         jPzTS2HT1aA6saFlVP3zn8hh0x/MKSsyvb4k9b42qqvG5jwiAWpFsaFLorPoXo7SCwtx
         gPJJFYqaUCnU0Bm1ooH12JAAVjMgm4szmfEuucsEnavOStusSwl/5EhFJodK8Om8OpTL
         w2lOpvHJikvPZ15Dg/5tvgSy083Fi23G754mPnhO03mTk8md0AdU3lH7NzP5zhobkibk
         TxZQ==
X-Gm-Message-State: AOAM532teORYxW80U/P1nwljH6DuiQ+xhSIeT6OsPi7WlpDudCs3ziw8
	tb1S6af6acV4mHHx4OD5Ungq/GJDAup+VXi1bpL1pg==
X-Google-Smtp-Source: ABdhPJxDzx70qFg8/+8SQWp/wzh+hCnvMQcmbo3zM+VkDnGHRz9EtVJKzK7XDjv+P9nGgZ56Jg0bEdx1VWHQ+YEXXGU=
X-Received: by 2002:a17:906:31d2:: with SMTP id f18mr6677002ejf.407.1607611614716;
 Thu, 10 Dec 2020 06:46:54 -0800 (PST)
MIME-Version: 1.0
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-4-marcandre.lureau@redhat.com> <fead8bf1-7848-8809-c67a-e6354e7b5cf7@redhat.com>
In-Reply-To: <fead8bf1-7848-8809-c67a-e6354e7b5cf7@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Dec 2020 14:46:43 +0000
Message-ID: <CAFEAcA986crbUmJLR2GU5PE9BOq8w9KWKA5obYfY3eSoviMtnw@mail.gmail.com>
Subject: Re: [PATCH v3 03/13] compiler.h: remove GCC < 3 __builtin_expect fallback
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Laurent Vivier <laurent@vivier.eu>, Paul Durrant <paul@xen.org>, 
	"open list:X86" <xen-devel@lists.xenproject.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony Perard <anthony.perard@citrix.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Dec 2020 at 14:32, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 12/10/20 2:47 PM, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Since commit efc6c07 ("configure: Add a test for the minimum compiler
> > version"), QEMU explicitely depends on GCC >=3D 4.8.
> >
> > (clang >=3D 3.4 advertizes itself as GCC >=3D 4.2 compatible and suppor=
ts
> > __builtin_expect too)
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> Shouldn't it becleaner to test in the configure script or Meson that
> likely() and unlikely() are not defined, and define them here
> unconditionally?

That sounds like way more infrastructure than we need if
just checking "is it already defined" is sufficient...

-- PMM

