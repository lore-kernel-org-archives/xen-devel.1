Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF11606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 11:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xgn5cT/0
Received: from list by lists.xenproject.org with outflank-mailman.1502069.1698061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWAvc-0004Ul-OQ; Wed, 25 Nov 2026 11:12:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502069.1698061; Wed, 25 Nov 2026 11:12:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWAvc-0004Ue-LE; Wed, 25 Nov 2026 11:12:44 +0000
Received: by outflank-mailman (input) for mailman id 1502069;
 Wed, 25 Nov 2026 11:12:43 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xadimgnik@gmail.com>) id 1xWAvb-0004UX-7P
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 11:12:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWAva-00Bs3D-K9
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 12:12:42 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c290-2eae-0a2a0a5409dd-0a2a4502ad1a-40
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:12:42 +0100
Received: from [209.85.218.48] (helo=mail-ej1-f48.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c2aa-4900-0a2a45020019-d155da30c959-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:12:42 +0100
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-c516a194350so38823766b.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 03:12:42 -0800 (PST)
Received: from [10.45.18.224] ([15.248.2.12]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513ae6841asm632892366b.24.2026.11.25.03.12.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 03:12:41 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1795605162; x=1796209962; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pEX7sSGGqH9r9dbED+AryYL0YCArWKQ+VCNohAWeAkk=;
        b=xgn5cT/0XKIpKDMZWuOkrgJY7jFwqbEyXZW+l23+ryarS4nHKj0gfj/HmQaDOgF0Op
         ayLiPL9zYQ1yyDA9YImDJttXRkTFPlFa5vgft/gZzS/+cUVerKnMg15X/YlcsWwi87N+
         PSscWZJ2Ea5AREksOe9OQ4Xy8/izsHaaQ5NsGBaTI0IYn8f/SxIJVJR1sDs2ei3h191s
         oaDF9YH8sQspuHMHmCkIQ9BJKe0CpzXuQV3oeVKr/U33iijjFQEeD4cwGzbu2/Q9MbOy
         xhA2LKuIXpyzvuT4THUi9Su7I4TMt0prKlE1k9R9Ll7gGb6bPn73LRlJ0tOot40IlMyP
         Qrhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605162; x=1796209962;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pEX7sSGGqH9r9dbED+AryYL0YCArWKQ+VCNohAWeAkk=;
        b=wZOCkIMNzw5g0C8s2fTunIbzo9MOpIvgr/Upy4WF1jUaZaIloKltA5srxrdZarnLSq
         YG/rVYDGofudvhfzLGmK4rbVE/wO3/6hGBbSfqoON41mGTuiEkGiV4G2LKPHklinHk5Y
         6QkdJ5e3/k3f7/bZJVlIHBw86pP/vXPWecXUijH0wBpUcVFOBHq5v8BxLt1Hm2bDK6bG
         oUIg9XkTSD20GefWBI8gmmI3vZUK9pC28JFcxwCKM3Pe+DZoEsufT3G+7BX27HkhMR7P
         4uqIu6KrCg775PP9oSKTq/qt5RbNuLkbxwQhAifzLA0LVY+HpQKQjZXTEBm3oPJHp6Wv
         HA8g==
X-Gm-Message-State: APuU4Z89YLs+J3hn60O4axNlZPI6UbIVeGMvwaB2Op9uUKdVlO/xrjOn
	jqfJNDJddeMUAdOHERd13wbDRu1Px2daPw+vzqWLRGWTHOodHnfXcOUS
X-Gm-Gg: AZFdTZcP55U5+oLUagRuUmLQNfyFWcVCqgdAQCNnKDdQAynHdr4p5tJAJKfXPDdGsN6
	DR3pDcgSkc9+qB05cehfgO2+MMHQxbb7h4CKbpa1cy3YzHTsdLCyJs/nJz5tDTfy7sikB6mYHmi
	GKa4eC8H8nmF40ON8OPEZay5y5oqTMEJ5MCnCf2R7MQFLMmMKrjpGJxumseRmfMhdz3vXc5YCIe
	qV5AcukAKtaDDODvOg9j0iY4RU29NFyGk59mpXdvZEvUY5S+wwZfTEHbvHd/SV36KlQIgW9FGn3
	r7sIFIo3EbWoJz9SJRet4HPCFV8cLrmisPB4pQMfGJtobpIsDB9M6F1SrrjFrTE1asmJpdmizmx
	s9XPf2iDRS1VJKZQ2+zMDv+VxD8d+5w1hZVvzNWGiTkBWGMih1W2oEkLF4HrTkQrKE0eZkicxcK
	hwnbndMCeWHaebUUnJx9U7T0FEOXa9ZGpYRKWVk4ydZ7bb1k8hYbwOe/Xt1/lC901pEr8OtT8sC
	sX5zfVL7L8tbbNvGCdUdIK/6jlss7aqp+4gZTmJEp1PzQlasR10pqCd+zbnbxMIxDYNhZdFcKNt
	tKAl4RAGK/4qur0ikhiLckrXrMqpkUmMzMw=
X-Received: by 2002:a17:906:3388:b0:c3e:e726:9548 with SMTP id a640c23a62f3a-c513a5ec801mr1091772566b.14.1795605161989;
        Wed, 25 Nov 2026 03:12:41 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <ce509f0c-8c79-43e1-81b3-b1a864db5abd@xen.org>
Date: Wed, 25 Nov 2026 11:12:40 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/21] hw/i386/kvm/xen_evtchn: Validate PIRQ numbers in
 physdev operations
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
 <20261124232247.23169-8-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20261124232247.23169-8-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1795605162-F1B8F6C6-D39B9232/0/0
X-purgate-type: clean
X-purgate-size: 1256
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
> xen_physdev_eoi_pirq() and xen_physdev_query_pirq() used the given PIRQ
> number to index the PIRQ tables without checking it against nr_pirqs.
> Reject out-of-range values, and reject PIRQ 0 in bind_pirq and
> map_pirq. PIRQs 0-15 are reserved for the initial domain's identity
> claims of the legacy ISA IRQs — the allocators, Xen's and ours alike,
> never hand them out — and an HVM guest has no such claim. QEMU's
> gsi_pirq[] and MSI target lookups both treat 0 as "no PIRQ", so a
> guest-mapped pirq 0 could never deliver anything; better to refuse it
> than to create a silently dead mapping.
> 
> Fixes: CVE-2026-123070
> Fixes: 799c23548f0d ("i386/xen: Implement HYPERVISOR_physdev_op")
> Reported-by: bubblehuntr <https://gitlab.com/bubblehuntr>
> Reported-by: Hui Peng <benquike@gmail.com>
> Closes: https://gitlab.com/qemu-project/qemu/-/work_items/4525
> Closes: https://gitlab.com/qemu-project/qemu/-/work_items/3639
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
Reviewed-by: Paul Durrant <paul@xen.org>

