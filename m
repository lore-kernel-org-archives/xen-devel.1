Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF0C606A323
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 11:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mRXiFaP5
Received: from list by lists.xenproject.org with outflank-mailman.1502107.1698097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWB3L-0007yZ-7J; Wed, 25 Nov 2026 11:20:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502107.1698097; Wed, 25 Nov 2026 11:20:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWB3L-0007yS-4N; Wed, 25 Nov 2026 11:20:43 +0000
Received: by outflank-mailman (input) for mailman id 1502107;
 Wed, 25 Nov 2026 11:20:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xadimgnik@gmail.com>) id 1xWB3J-0007xE-Tf
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 11:20:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWB3J-003p2g-A0
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 12:20:41 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c485-e002-0a2a0a5209dd-0a2a4501c380-22
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:20:41 +0100
Received: from [209.85.218.45] (helo=mail-ej1-f45.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c489-5bcc-0a2a45010019-d155da2db9cd-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:20:41 +0100
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-c506a231b88so766864166b.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 03:20:41 -0800 (PST)
Received: from [10.45.18.224] ([15.248.2.12]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513afc244asm618232266b.55.2026.11.25.03.20.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 03:20:40 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1795605641; x=1796210441; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F0TEzX8owPDEFylfafKACLODZUkHUsBKXKTlKA6Xs3c=;
        b=mRXiFaP5Ufz4kd9emu/Z7uuchFUnjYSRIBRHScBQ4Eyu/9HxdmpnuG4bzsxG423dEK
         v2DROodJskLOnEJ+5FUBimGl+hc5ImygHH3Yy/R0UJb2HuYQRO9oaWQ0V2yj3cw1aFYQ
         /WJ01NzY539Iuc6+G7BeQWX7pf0ftqqqIhZGNNJHME59dM/RyGMCSXeCY8bZy4sCqZkD
         O8p/qEI0T9uv0qHv9aIPiLy2a5T97ZaBijeccY1I2nZ/asw6KEEJzkA+KbyLzKOJYB81
         ePuH4t2p43Sa/aA5D+515yri/DZxp2cVTD+4uXr1orKA4PMxXXgwR6tgCa+TLbTOYJCH
         LG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605641; x=1796210441;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F0TEzX8owPDEFylfafKACLODZUkHUsBKXKTlKA6Xs3c=;
        b=nGqDejHYvXAeJJ7oLmKfvLV6ZlX/1w+g8GVU2jXvXjgWDNwxEOy1B0rKcpEdwQrwH3
         FMAqHZgJ551UIv67aBBJIPaMJVXallq2vEzfLj7xzLEbHVuQmLJLjHz5sznkJGl2EYko
         MIocvsEReIx6vOyzbmFy65qA5QHP6VK/+5z8moOmTkEh8Nr0aWAE9ikUNRLS8Qm2m81X
         cxKHsK3bAnWMhHIk7TT2ehZLkjG+RRYQZGERAnMilx2wSkQDwpBbQO4tYjQtECoEbbfu
         Ce1fcDAE8uyWlg/gCaAkGs4k9kJ0ialjEBprYtmDThafKT4vK70X6V8TGYCuWG3hMw1x
         woJA==
X-Gm-Message-State: APuU4Z9jEbKKpVNb++SJI7W3W7yIJnLmFlrRmnEVGiaOx5ucjTxHgcRp
	lQS6B17OB3VbSfy/MczEWlGLjiZiV5u5ZF6psumT9/9owfZL5eP9jFkv
X-Gm-Gg: AZFdTZcPCPCGnU9IfA89Ulv2aCnsKNg3O3xLOqhUMADVqUFbytv6ce0DlUts9EK8NAw
	XesQZCoH1fkfhzCQSzNaPRWhnUVsUctyOIv9YKhAB/I8bE14dCXUSu5EVWZV2zcQreBmP65JaCI
	L5rJMZ6wElMSdpJRZ+/+ZQV/Ow/aaCpCpdenP6ZAbOmlGi3hRuMjDQEoBP6wE/qpJ/h0/ljEkP9
	cU8IuVE2REKc3PZvws4OZWwU7urA19sBQMdb7PFTmMcOyeYP3dOReXxD27p1D6A6rydw/5d4A/5
	oOC4IqcspgNSU61Oc6m/FeeHIeuUV6awBAxU4LLFWXTZF2jkWngzAyvECScT4l5aJwZk1hc/C+I
	nakVSxYxCt4y9hXUn88aulFWVXqhviHinP0A98mNrUO4JbbTX9BIeh0M/lnQXc9kkIwipU/z0GH
	Kr9G5vzG0NgwmxbMDKYxAlijRoGPV/je3GWa+N2OsEjdn/iH6QYHZWsw5B3kRO8mp6bBHnBowoL
	HEuE6jUytZReXR9sQGmqKLlrKDJlQ5dr6iLiHXclGPSeUymHIsDp19bvDPQyG61c804zAkPxLsx
	koafDmPCZ0a9q9YSuruPuIfnLypdx8Bzz9c=
X-Received: by 2002:a17:907:fd15:b0:c40:9e84:942a with SMTP id a640c23a62f3a-c513aade153mr1470090466b.48.1795605640666;
        Wed, 25 Nov 2026 03:20:40 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <e8d79c86-324d-427d-90fa-5a662b4815a3@xen.org>
Date: Wed, 25 Nov 2026 11:20:38 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/21] hw/i386/kvm/xen: Don't leak gnttab handle on
 reset
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
 <20261124232247.23169-12-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20261124232247.23169-12-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1795605641-BC4E75FD-A281E57F/0/0
X-purgate-type: clean
X-purgate-size: 863
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
> xen_xenstore_reset() and xen_primary_console_reset() open a new gnttab
> handle without closing the previous one, leaking it and its mappings on
> each guest soft reset. Close the old handle first; closing unmaps any
> remaining refs.
> 
> Fixes: d05864d23b1a ("hw/xen: Map guest XENSTORE_PFN grant in emulated Xenstore")
> Fixes: a72ccc7fc449 ("hw/xen: add support for Xen primary console in emulated mode")
> Reported-by: Hui Peng <benquike@gmail.com>
> Closes: https://gitlab.com/qemu-project/qemu/-/work_items/4525
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_primary_console.c | 3 +++
>   hw/i386/kvm/xen_xenstore.c        | 3 +++
>   2 files changed, 6 insertions(+)
> 
Reviewed-by: Paul Durrant <paul@xen.org>

