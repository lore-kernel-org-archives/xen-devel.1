Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FBF606A321
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 11:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MjCpkR3/
Received: from list by lists.xenproject.org with outflank-mailman.1502089.1698080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWAzr-0005WH-EV; Wed, 25 Nov 2026 11:17:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502089.1698080; Wed, 25 Nov 2026 11:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWAzr-0005WA-BB; Wed, 25 Nov 2026 11:17:07 +0000
Received: by outflank-mailman (input) for mailman id 1502089;
 Wed, 25 Nov 2026 11:17:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xadimgnik@gmail.com>) id 1xWAzp-0005W3-I6
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 11:17:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWAzo-004yRB-Un
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 12:17:04 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c3af-2eae-0a2a0a5409dd-0a2a450bcf42-10
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:17:04 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c3b0-b7e8-0a2a450b0019-d1558029e959-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:17:04 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4bb6ba3b244so57707215e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 03:17:04 -0800 (PST)
Received: from [10.45.18.224] ([15.248.2.8]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb90660cb4sm454867055e9.2.2026.11.25.03.17.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 03:17:03 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1795605424; x=1796210224; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sDsbr5ve7lstRzCqqwaH7hey2ad4/GX/MTHn8iSlZz4=;
        b=MjCpkR3/JrqVZWkfAwqhV+DeIMXRTpAMPLO71Dy6rq5pPO0ROsIJg8jJGqAiH2XYn5
         0Fij5ocpFHdtVqyRRVBssHWpQI9FoH/tob3sq5txdlmu1pNlqm+vNBUh4CXsTgMzIury
         s5RXcqU9+ZF++YmGYjKiQGpODo/lOjQP9e4w0OGv+QTwEUnkeUkjz+jl11bZGWsJxhoL
         eir3A7vLJyP2JN6pFK28DmCBU+bkH2g8tPFJ9eZUTi2R45bWBbvgwhuT31nF9tVlFnJP
         DNYl/oG0IzPQetBzDmWmXRHOKDbTXnqBG17yIYJitv4wmLj/QZeBj5XebGX4r7S8WoR0
         1zIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605424; x=1796210224;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sDsbr5ve7lstRzCqqwaH7hey2ad4/GX/MTHn8iSlZz4=;
        b=sO6yHZVtrz2p86PQqVuQnkSGZAKXTNUvO8tDyErOQcHeWVrM18HlhOmbSV9Pyf9tMv
         kHYDab9plciDsimy4pCbPe1kUcRQoRtzvGXofjSyywrgT0PNV/gXQf36ZhY0XOA07nJE
         Mp13J3098UFIygRBU9Owtd+Qh25HPSLy8aAxpcYip4rlFM4S+aVNljeALaY6dGocvqmE
         B1UIMAwKqalbnGvrS1p/JAbal9jgwA7YnAl/VWPjZgO199eGUTYZk8bJvWoc4aBa1mRx
         t2OQtkw8ZTNtfso5J4AMWAzg4Z9iXQ0TyNygeWRx+ZpLRvzNKl8kUAuWf4tCpjD+rTQu
         QN3g==
X-Gm-Message-State: APuU4Z+eJ083hx9k5ZK8awSwgGev5UUn4p2jJ/t42Z4A86xynqcod9L3
	xxmuQCO5tsaCScIS38FozQxaIReLf+msLHNDilj5T9gBACP0two6venC
X-Gm-Gg: AZFdTZeyrR8XLfCJlxyDCKST7Y54MuBaU1lHQVE0S6VEwKw+fyt6r9O50jwitqdCzXR
	44OSXQ2CbV7z1QHTpcTpQRmhgG/mg7h2RSytP/F8ju+miQQs3cb7tKbuokoAlmPfnrvcATZ033h
	2e6wEPiSZpMwuyHJ4QjNss4w73yb3t2/BpnN/rAX341WQhvEiF+rcHZB5YpPje+aAnXTBAyRP3b
	dwzfRwrB73NZ/gaF88OtnrcEUzqg3FrtIjvzRSy2jjLhyHlkZSxWvbHdv5AaQiI8AcXClXs6FoS
	9IMcOaBHLQFMRy+0uqpxK7NnvZTk5DdjVeRZIizyDk0wdUizELBfZcrL50neRZE7m6OvOd6mZkk
	mKrXPo1f6Nap6dEtEb/xgN0NzI2PFWDBwO+feCiivi+rmhEVsqLdob9yINy/f96EX26V9ZE8Qm8
	lyZcfpf6m/pSj4nezPhLMvNNp2342PMj1tcthHm1ayKXPWikdoDmBorotcTFVsUe0sTpDQhFQjM
	nQLQUAPJM4IaN0RIyI+3+9gdJSYBxwUjwSOPlQaUNYb0ERGPyDsSay++II+3yn3Jclj9YZqTLu8
	0UyIhPzfA+mRxYrQiW/w4dV/4+kpUfxSKPp+LAZYgUQiM5yjxTR86/U=
X-Received: by 2002:a05:600c:45d4:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4bb8880988cmr372815065e9.6.1795605424154;
        Wed, 25 Nov 2026 03:17:04 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <719ac82d-4638-43c1-b563-af0a33b25d1e@xen.org>
Date: Wed, 25 Nov 2026 11:17:02 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/21] i386/xen: Don't inject event on invalid port in
 qmp_xen_event_inject()
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
 <20261124232247.23169-10-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20261124232247.23169-10-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1795605424-2C39B9EA-7A5A9D27/0/0
X-purgate-type: clean
X-purgate-size: 645
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
> qmp_xen_event_inject() reported the invalid port with error_setg() but
> then carried on regardless, passing it to set_port_pending(). Return
> after setting the error.
> 
> Fixes: 507cb64d6e66 ("i386/xen: add monitor commands to test event injection")
> Reported-by: Hui Peng <benquike@gmail.com>
> Closes: https://gitlab.com/qemu-project/qemu/-/work_items/4525
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c | 1 +
>   1 file changed, 1 insertion(+)
> 
Reviewed-by: Paul Durrant <paul@xen.org>

