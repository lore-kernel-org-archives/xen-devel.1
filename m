Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41D5606A326
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 11:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pwm+YSvb
Received: from list by lists.xenproject.org with outflank-mailman.1502277.1698269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWBR2-00047k-UA; Wed, 25 Nov 2026 11:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502277.1698269; Wed, 25 Nov 2026 11:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWBR2-00047d-R5; Wed, 25 Nov 2026 11:45:12 +0000
Received: by outflank-mailman (input) for mailman id 1502277;
 Wed, 25 Nov 2026 11:45:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xadimgnik@gmail.com>) id 1xWBR1-000474-SX
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 11:45:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWBR1-0053O2-8P
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 12:45:11 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06ca3e-e002-0a2a0a5209dd-0a2a4504e442-32
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:45:11 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c7b2-b57f-0a2a45040019-d1558036a999-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:34:10 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4bb77a462c6so48875315e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 03:34:10 -0800 (PST)
Received: from [10.45.18.224] ([15.248.2.12]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853a12acsm542185355e9.8.2026.11.25.03.34.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 03:34:09 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795606450; x=1796211250; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yl/4IscYRRIYoDrOcOqnAZtQEjR1B47TFUIpt05puco=;
        b=pwm+YSvbS9ut4nfyV4jpzB6zM5mOKNzdYajwA1csRnG8N8y9NB8hx6M8bzo7A5Tsxw
         Nj7a5vPmYrJT9lCFJZrMzJWK3y84KTCGzvf/Zp33w+Uv+Hp+U+/Os9NyxtYqYtUvwJRE
         cEBRMmRG6fj/v7KKKOLI/42fGNszG81WR8Ov16BekEORM1DARJy3XNztcaxV2rmjJgmZ
         jn7Kh+K2MqV2mpS+Mv4VYg/Wvkfhom/VoY9u8WWiMIftVPxCnFWNOXa3BoLYjCrCkUyZ
         p5+9nHc++x905Wicw20HMOq2h+N5K0oFBbcVrYqPKzzMwEHRdf6/OcqgQJUDsM7vM+AR
         +Qyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606450; x=1796211250;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Yl/4IscYRRIYoDrOcOqnAZtQEjR1B47TFUIpt05puco=;
        b=ph+Y8Z9e5x8CufCX+hOi4qOyIvJDwUYwuR+aWuiwsBEuXN1kE4yQB75Mn0EV4sQNDE
         VmLDCSR+AHmEsTNQ45WGN9EgDu26X9DqlHD1C4O8K4fNImv3PyPW6pRN6Hor9xAfPNEW
         I4FE3FqmhX2ntTULeLZPWpyqygWuT7t2H9mTm7TwRcrNsLYKyIyY/uoZvsB4nQxqq36r
         KO6N0w3cXAeOYsExnSoUjmqH/aMWFATmPgN2gSlKuL23pihjj6GQPQF9jcz8YKAIfHcr
         ej6zz3xXy2j2XbpD/KBpGZgpgpBbgguxYFCzvpL3aFfykxp4L/uXYYfiYMhiBpgFAz2W
         HTMw==
X-Gm-Message-State: APuU4Z/pux9dpivrM+LljXBly3cRrsi3WGbk/ec8XAGVoEEKKCf2o4rH
	89S0M6m7ZENzCNQi0f3HI/FcC+8fR/xngmOgJbzFF1Qk4ugn+M3l4QTb
X-Gm-Gg: AZFdTZfrQrfM1Y9FoFFIB0H1GVTzRZhh35lhyREkRw1cpGkz65PA63yWTCPlUysqcTR
	gq1X/5yazods8remJscj/y+X+CHPUeEWkDw72N5RVRdSFfUY5KpTW3fOE+Tv/ryYWaazm4yrt9W
	1slTBKNcp5OSCXNOvrGtIP9EleA3qmrV0hkX1/4AESiuMF0kM9t0vrIXpHiUjBgAgp/i9Wzdgy3
	YbKrAmYseMRUuu+cp4uSKbAeYwkUK9501HFHEPFacrZhrm9PvYjvEcvRCAE6uRb4FtFaWffOEyG
	RzvElnmdKRTnxvdkVZP4oXvcgUJJZ5BB4UFnHu0MyGZHZVhC4C0PoBsfAxHCdoPMxm99/JY+OQG
	5yf9PtDtSZr28sJBtXBm3CVco1hl/CPEp0SZmsMlOJbdmAYK5W/RBi0NS7HXruSiC0vtW3zfNxW
	/AfD1InEfVLJdvlGafyAs3BUOp6W+9dDucZIH9ryYD1BBRU1zyo6h0+glZhytJ9nlCvzBifnqAp
	Zzfy3g9/wwzpVf2fuOlVSKGGguwFsfr8b5eIssspo8jYlcJW+u5q1odsd9bwyWrKktj+yslBAoe
	FK/IKaEXaOQevEbYPO3zh9oGlZunLaoO1n0=
X-Received: by 2002:a05:600c:154c:b0:4bb:6a78:7c42 with SMTP id 5b1f17b1804b1-4bb887c3428mr360008895e9.1.1795606449726;
        Wed, 25 Nov 2026 03:34:09 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <e2787d40-0b72-4f37-b132-dfdf49d2ef04@xen.org>
Date: Wed, 25 Nov 2026 11:34:07 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 19/21] hw/xen: Bound the rep count of PIO and MMIO
 ioreqs
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Jason Wang <jasowangio@gmail.com>, Hui Peng <benquike@gmail.com>,
 Mark Syms <mark.syms@citrix.com>, Feifan Qian <bea1e@proton.me>,
 David Woodhouse <dwmw@amazon.co.uk>
References: <20261124232247.23169-1-dwmw2@infradead.org>
 <20261124232247.23169-20-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20261124232247.23169-20-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1795606450-C16D2B50-9DF2D785/0/0
X-purgate-type: clean
X-purgate-size: 983
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24/11/2026 16:22, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> cpu_ioreq_pio() and cpu_ioreq_move() iterated req->count times with no
> upper bound, so a count of UINT32_MAX kept the vCPU handler thread
> spinning through four billion iterations. Xen's instruction emulator
> clips a rep batch to at most 4096 repetitions (hvmemul_virtual_to_linear()
> and hvmemul_linear_to_phys() both apply that bound before an ioreq is
> sent), so reject larger counts as malformed, and reject a zero size, as
> the other framing checks here already do.
> 
> Fixes: 9ce94e7c8a99 ("xen: Initialize event channels and io rings")
> Reported-by: Feifan Qian <bea1e@proton.me>
> Closes: https://gitlab.com/qemu-project/qemu/-/work_items/3756
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/xen/xen-hvm-common.c | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
> 
Reviewed-by: Paul Durrant <paul@xen.org>

