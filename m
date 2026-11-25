Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169CA606A329
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 11:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=spgTFzJ2
Received: from list by lists.xenproject.org with outflank-mailman.1502213.1698196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWBEQ-0006zY-3X; Wed, 25 Nov 2026 11:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502213.1698196; Wed, 25 Nov 2026 11:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWBEQ-0006zR-10; Wed, 25 Nov 2026 11:32:10 +0000
Received: by outflank-mailman (input) for mailman id 1502213;
 Wed, 25 Nov 2026 11:32:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xadimgnik@gmail.com>) id 1xWBEO-0006zL-Oi
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 11:32:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWBEO-00Con2-3u
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 12:32:08 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c735-e002-0a2a0a5209dd-0a2a450781d0-16
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:32:08 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c737-b4ea-0a2a45070019-d1558035ac22-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:32:07 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4bb72b44a97so48670965e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 03:32:07 -0800 (PST)
Received: from [10.45.18.224] ([15.248.2.12]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb905f1489sm314735755e9.0.2026.11.25.03.32.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 03:32:06 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1795606327; x=1796211127; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XNwgaAJrA/u9YSk7hAtdQI/k6k5HNaRRAtIFaDIjJqU=;
        b=spgTFzJ2jYFh/3xNeFSO8NvDb0d6wovj/80/suo4c7BxhECzbtO82qigsw+ZNa6+jG
         xnn3Og7ZaaKdmElhN/SOGtjy90a0N7x1D6n4FDAupZ6co5IfcmUJJcXWjerNpqgSHZBN
         1coh1gmELWdhD7zvzGmq/dzzTK7V9RC0pNNROMuBBByKG/wXvfuFOHogsSBE7Ngtw1PL
         xAh2WJoTbQuTz0tB9evbq/3fWO6E4XRACvMhmtLjQR3FVC+FvbnqY77/b2mYBJhIJd3a
         /xV3ekXezQdjz7hbM4gzu9RO9/TWwn9CFDMovUjNi2bV9gYq8POkif04OR+P9BjXTxcL
         PrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606327; x=1796211127;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XNwgaAJrA/u9YSk7hAtdQI/k6k5HNaRRAtIFaDIjJqU=;
        b=bXFPXrq/RPTezmNTf0XYDO5LYKGAxZMprIxPzwNSb7t2NUZ4sFeAti7aYkMjIPAPG5
         1UFp9nlDfSAUp9vbqyOTV2l4tV+zzGiNLsA4sk8/PWxcE1/N0vuqi3+PAWKVLKwHcgQ7
         T8wMK5b/Z9mEGg79aefuPvDPWC9nG02N3IYm7ZdmmbJApLW07hOwS7oJUR1pgRU7NzCW
         PfOvkh0XpZfZ3gViFZQQV8HZ9J6JmouCi5H4ymE4RChCtcGPP30B+qgw0thphB+g3251
         ArPzTZBDeiI7lyWZFHkqDSKiuQXN35tpKxh4ycH2xD96tFEMLtv4Ft+BXPM8G4PpvLlD
         3idA==
X-Gm-Message-State: APuU4Z/cjR1vjuG3fj5c8ULAzOXrW9RsezMAkNM9DfgAeNJzFclo8wTX
	DI4XdjTNSE9294rOyzYQoiqnArlVk/edlbi6UDj05VPtdl6yS32pI0w1
X-Gm-Gg: AZFdTZcXNoZ2kapYkY26b7VLW8ffWtNoOimyrEJc9wwowJaO9X70N0IvseYJsHy/+Cw
	ZMrfAmc/Z2yYwN4aAhY4Vcfz6T88zCdKlgYAQSXKIARChS9BKM5e5kjMZho4uuJzw7uybN2WYjt
	xCRfqdQcc+f7R6Ta+fUmHzpvFwoqU2XyNyyvuU0xuQORVCulX3cKdi/76UjT+gJp39PIKY6k8WO
	D0w+dCdiOfCleFPXWJoJQFx1MW7V1zm6lewkekDuoJTL/ekq+i5lwuojguXgimFMA006pVCAIx3
	JdQ7gh+ZZJMljMsorYACGyWmbbFfvyUw9zNdMskxVvmWiRBnCDVhiWPZQGENL/zQasI7tgYOH53
	/UHJ72PArQj+pHIbc3CTxaXM6fDR5TzqimToMQpmMvIxjOIk4SofVujVPOBZddRiFui4WzcH8M2
	W9ccvuWZRih1Y2quub24ylPK7qjtnX+0sRfvLEj7IZrhlPT0i5JBRFc2NKm6ndz2uqpGgE4DQ2Z
	FuILIw+FeOd1Q3m1Hved/9hcT6TTOXOU7CA+j1BXe+9GSIuWDQQY8U1m1lVHO+q1BOs49kNJzK5
	RyTGBGO5lqy5+yFlqTMfFpJPR5ucn+gz4Ub7I2lWxX0OhNTwk3YIuyJy
X-Received: by 2002:a05:600c:848d:b0:4a4:3a2d:15da with SMTP id 5b1f17b1804b1-4bb88812026mr333238515e9.15.1795606327221;
        Wed, 25 Nov 2026 03:32:07 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <02403720-6eaa-49d2-aa2c-297e9a9aa6c2@xen.org>
Date: Wed, 25 Nov 2026 11:32:05 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 18/21] hw/net/xen_nic: Bound the TX and RX rings'
 producer index
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
 <20261124232247.23169-19-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20261124232247.23169-19-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1795606327-A54C3AE4-FDB28241/0/0
X-purgate-type: clean
X-purgate-size: 737
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24/11/2026 16:22, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> net_tx_packets() consumed requests until req_cons caught up with the
> raw req_prod from the shared ring. A bogus req_prod made the loop
> process up to 2^32 stale slots while holding the BQL. Check
> RING_REQUEST_PROD_OVERFLOW on both rings, as xen-block already does.
> 
> Fixes: e613b064a88a ("xen: add net backend driver.")
> Reported-by: Hui Peng <benquike@gmail.com>
> Closes: https://gitlab.com/qemu-project/qemu/-/work_items/4515
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/net/xen_nic.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
Reviewed-by: Paul Durrant <paul@xen.org>

