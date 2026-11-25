Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56061606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 11:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oJ9Eachx
Received: from list by lists.xenproject.org with outflank-mailman.1502252.1698252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWBQb-0002xC-EW; Wed, 25 Nov 2026 11:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502252.1698252; Wed, 25 Nov 2026 11:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWBQb-0002x5-Ac; Wed, 25 Nov 2026 11:44:45 +0000
Received: by outflank-mailman (input) for mailman id 1502252;
 Wed, 25 Nov 2026 11:44:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xadimgnik@gmail.com>) id 1xWBQZ-0002w3-Rg
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 11:44:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWBQZ-002MRi-81
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 12:44:43 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06ca1e-e002-0a2a0a5209dd-0a2a4507ebac-40
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:44:43 +0100
Received: from [209.85.218.47] (helo=mail-ej1-f47.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xadimgnik@gmail.com>)
 id 6b06c6e1-b4ea-0a2a45070019-d155da2fc478-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 12:30:42 +0100
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-c4d21051042so56443966b.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 03:30:41 -0800 (PST)
Received: from [10.45.18.224] ([15.248.2.12]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513afc2579sm599898266b.52.2026.11.25.03.30.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 03:30:40 -0800 (PST)
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
        d=gmail.com; s=20260707; t=1795606241; x=1796211041; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Afcqxjv+MkGGt0UAmpL0zC/ETeooQhBIhJHHPCywLOU=;
        b=oJ9EachxZevaM598sPkHfFC9Xyn76axIfU7EC16JjV6eDDpuTld+DE9LIfyCfUwEVP
         yIpj6i331sJEFNrbdZpyt4CnKcBGIRJrPQHv76rtzmtw92yNG/IO7HSoEgExsTIJQC86
         ybKcrZCtqypIQAhnoUUgM+ZatjE23CKYMTM0TUn8TR9oKjag1K1ZWc64K7ErA8b5aOlS
         fbLMHA9VSK7gsoqbTPCucLJ4CBv6avlmOhpDYPIoDdUnKCZz358q0SIgLlFhk5MYD+6v
         iTrow9OcC2Yg+P/enOsm3EfsbRm0Rl1rJkycas0XUwPP6W2XYDyCkq/hnyOIbwRJ6UV2
         pHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606241; x=1796211041;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Afcqxjv+MkGGt0UAmpL0zC/ETeooQhBIhJHHPCywLOU=;
        b=iyivllbKi3sd9lhQXpH7wNiHQdI4H2t42v76omrfaWZ9asxNG83lm1/Glnf8qhACJs
         CaXsMhrX2+teUUrVYR9Dm5g040nD9MjVMjtedX7X+pd2WV2NI7K8W6tzeXyZYjK1gEB5
         cU06LJT3yntAcvt5HYb4noQ++xpbTapVcuaxWxN34AF3BXMkx7gS4gmgfFPyK4NmqKTI
         HX8uK7bSM/AsAi4q93Zx1o+8rknifdZ89/QFYOrSMh+LmhGXMNk2p63j41uyXd1Ofqwj
         ZuHt92hhmabxuLD2mgAStLicFyMqNfWjff2iRRX9sidIvy6WEPeqIa8AozD+pTbqnRTd
         7/lg==
X-Gm-Message-State: APuU4Z+FHvK1nm6KCxfWsSlQ7/Rwiv6dhekM5mrsZ42qVCnFfqpnJXrT
	c3/+Dtm7FYrVj1tprwJ1aOLIO1yuMO47ZYfOF2dSxCX9tLzGl2PzyzYL
X-Gm-Gg: AZFdTZdFgd1AhUV3hrmWZpbmEjoEWzSamBChMIYdFUdkzKhOpDhj3VkFvF/uB9fVMgV
	GahWLb9o+8HVYsxAcF8f1L6D0q4VOEyOTak1IAKY8IUdaC1lgsH8V3LqZPM8nL2DbVXY8Ik3ERE
	LMCY5RbFavJE4iAiUuyHqYoC+6BOUS1FlrDWR/QUtXYWa5QsI0RKBstM8nfYle9csBt6Z9yU+Qw
	r0lSiIKPzc2n14TlbpYVQwwM2naXikY8MrAUGxQstKUuI9RRP2G2Vfk89u8xquMXrmzh9Y3qzDE
	vhWZ/viZuM3sLp889bnAYZ2qivI/ulalUgQ4QW/VjGj2FG2Dd096PVZVQUDl8hebhECtZRkrNmg
	W+xpCesfu4zMIPreBiOuXRLfyMa3uKCn1esFpTUE/2sm+NSXtvAjsZufs6Jax8QnZQaedBHiJcs
	zRfO/ksWDdqNbHtJjueLn6zrII+JkTGlxvRnqQ4MPyEMsHWiYDSSOkOJjfxdQeU7bym5KO7+14U
	ZJWpqBYuX+jRv6s8eEGL98QO6atO9WIrMD734wgkR0kNClOK8oSsnL6jD61XGAWpgWXiKesDaYD
	7EszLB88DapGpIPQVNqhrJ79H01LPn2yFySc6kWRCdUxebYjqaFCSP6o
X-Received: by 2002:a17:906:1e04:b0:c3f:d912:ff8e with SMTP id a640c23a62f3a-c513a5ec26dmr1199239866b.16.1795606241345;
        Wed, 25 Nov 2026 03:30:41 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <cfc1fd74-4843-4017-899f-7b30b6baa448@xen.org>
Date: Wed, 25 Nov 2026 11:30:39 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 17/21] hw/9pfs/xen-9p-backend: Close event channel
 handle on disconnect
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
 <20261124232247.23169-18-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20261124232247.23169-18-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1795606242-348C9AE4-E2E61A63/0/0
X-purgate-type: clean
X-purgate-size: 660
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
> Disconnect only unbound the port, then dropped the pointer, leaking the
> handle and its file descriptor on every disconnect/reconnect cycle.
> Close the handle; closing also unbinds.
> 
> Fixes: b37eeb020123 ("xen/9pfs: introduce Xen 9pfs backend")
> Reported-by: Hui Peng <benquike@gmail.com>
> Closes: https://gitlab.com/qemu-project/qemu/-/work_items/4523
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/9pfs/xen-9p-backend.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
Reviewed-by: Paul Durrant <paul@xen.org>

