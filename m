Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD735606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 11:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvzOwYBQ
Received: from list by lists.xenproject.org with outflank-mailman.1502249.1698242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWBQT-0002fL-3s; Wed, 25 Nov 2026 11:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502249.1698242; Wed, 25 Nov 2026 11:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWBQT-0002fE-0h; Wed, 25 Nov 2026 11:44:37 +0000
Received: by outflank-mailman (input) for mailman id 1502249;
 Wed, 25 Nov 2026 11:44:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xadimgnik@gmail.com>) id 1xWBQS-0002T5-39
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 11:44:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWBQR-008fRR-FI
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 12:44:35 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06ca17-e002-0a2a0a5209dd-0a2a450b9432-38
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:44:35 +0100
Received: from [209.85.218.43] (helo=mail-ej1-f43.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c806-b7e8-0a2a450b0019-d155da2ba4e7-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:35:34 +0100
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-c4d5b2db4bbso1084586266b.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 03:35:34 -0800 (PST)
Received: from [10.45.18.224] ([15.248.2.12]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513afc42bbsm616068466b.61.2026.11.25.03.35.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 03:35:33 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1795606534; x=1796211334; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i17fHcvxw+7ZL4SDpaGzZuZ4XTXyMvScmMDjyMswMVw=;
        b=qvzOwYBQvMRs2r1mNoIZls59xWY7LcR5pmT9ATX6va8khxb0vc82NTneEpsmqn80oX
         BK9YhpSB/p+/CL+wHFw7LQ1naYo3/WshIbkEwN1NcuNwxxjyncTRUjwEeQNkbYTwMpkM
         51P557PaIWRWzqI8xkDg8OwmPDWUdW50sNZL3RKKLUGMjYKBMmNa4QkHT7WU0FQCK4KG
         fBEeABlBUUlepPT9CfFHstKaZCNWfI57Hbtgal+y/4Mt3vqmPnfdKE+oNi7TEmjSrXaY
         ZtzRfyXwCfvM0Yo/SxmWckBaIF6mDFHZRtvOhjND913nzSIOMDU7IGSMTDGmjA9B1pVk
         dntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606534; x=1796211334;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i17fHcvxw+7ZL4SDpaGzZuZ4XTXyMvScmMDjyMswMVw=;
        b=OVNyDcIFJKeej4NrTemc9Haw6PrmE1lNKkU2JjtjZNYiipnel6CZQjTkWFH5QdJIKF
         9FiyqVSnOceiA/N32TZy+RvUzD/xcpeDjH57xVf/F6vqEtR5ej93BmUylR7hn7GLKNqZ
         SxVj/xOra5f4h6WzA6m0RHC/+vsAwzG9YN9gVaqsM8LZRP9goxEMdn2IWzhseJ1V34HB
         hWObF6kcDb6CHlvvWkSAvazFZ6AlicAbYP0rB6Zeo0DhyiVTmrptzlvK2W9ZrRdIRSOG
         GLiWx5/xFeKpT/77gNuHNQ3Mdt1QV/Lxy6VctVqiqdzDJszJMjmFhYUxT8cQC9wVdcUP
         Vb3g==
X-Gm-Message-State: APuU4Z93tdJMqbzq5usnK6d2XvjCmyyZBb4bF3aqaX2GtQXqnPUMGWtU
	eBRA43eJ1fdfqWLZJVsLlz7hyUkTH6mn+5OBfM+2y2cgdJIXNjn6Kif/
X-Gm-Gg: AZFdTZeE/ugGSsqzZ/mtFay6i8wmytSFsTex/L/l2jUBVGfon3gJ0q4CIH+39EwHnkR
	LUeJah53lWC9h4eslCtnH9u4CRnykMvDyulYIxznzyMLbVqNkJ4INaol7C6bcgrpW31sQuaioVM
	zFXv4hVITMFcZ+VatlzJlchdc4ooBHR4jbPq2enhSi0+SCHke3DA3K93e3jMYcFI3Cf+dScMdld
	yr47k6cTqh8rEwiVaUqZZ27LaszvC30e7fZmzEKOzUKqTFmOlE75DmN14qsi5shNZw4qvfYzSmh
	C5Ukghu59+ZHOCI4MrARivZBuSStggVYeQ6+B8AZLe2qB4hvKL8uhOlcKrYNN8ydh9TEZrbJnvr
	qfgPYfNTWGUF5L38unpE87KjeJD2cMaRYH0tvWq94cCKd6gfg3uKtgiZJOQxh80SRLDK6fhQq9U
	Cybo1jyvx3/AtO8A/c1SQOXHVxNTkfd7qUyrMaK7RvftYQs/FUg1jaB9Vjd040N/CDFVWN6z77C
	WTQgDZIIZ/ph+fFuaMbJvuW1ivdZRbS8AYQuumbxVNRiS7FCjCm8xiZEDmsVRzmrIh0N0Why+3t
	Vv+RQ//741h6lk+hr7jawKMofUQuGX2teTg=
X-Received: by 2002:a17:906:a158:b0:c3e:d0ca:d30a with SMTP id a640c23a62f3a-c513a5e6b79mr1111910166b.4.1795606534265;
        Wed, 25 Nov 2026 03:35:34 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <e45e2c3b-7996-4f8f-8b80-2d852e032166@xen.org>
Date: Wed, 25 Nov 2026 11:35:32 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 20/21] hw/i386/kvm/xen_evtchn: Hold port_lock for whole
 of bind_pirq_op
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
 <20261124232247.23169-21-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20261124232247.23169-21-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1795606534-AB0DD9EA-B7051CDA/0/0
X-purgate-type: clean
X-purgate-size: 1174
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24/11/2026 16:22, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The check for an existing binding read s->pirq[].port before taking
> port_lock, and the allocation wrote it after. The BQL serialises the
> writers in practice, but holding port_lock across the check and the
> allocation is clearly correct and lets Coverity see it too.
> 
> The region now under the lock is pure port_table/pirq bookkeeping.
> The MSI unmask and kvm_update_msi_routes_all() calls must remain
> outside port_lock: they can re-enter via the MSI translate function,
> which takes port_lock itself. The PIRQ→evtchn→GSI delivery paths have
> further BQL/port_lock ordering constraints — see the comments in
> xen_evtchn_set_callback_level() and xen_evtchn_set_gsi().
> 
> Resolves: Coverity CID 1527403
> Fixes: 6096cf7877bc ("hw/xen: Support MSI mapping to PIRQ")
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c | 25 +++++++++++--------------
>   1 file changed, 11 insertions(+), 14 deletions(-)
> 
Reviewed-by: Paul Durrant <paul@xen.org>

