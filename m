Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852FAC43327
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jun 2026 10:09:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1347434.1605285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we8vo-0002pP-3F; Mon, 29 Jun 2026 10:09:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347434.1605285; Mon, 29 Jun 2026 10:09:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we8vo-0002pI-0A; Mon, 29 Jun 2026 10:09:36 +0000
Received: by outflank-mailman (input) for mailman id 1347434;
 Mon, 29 Jun 2026 10:09:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1we8vm-0002pC-Ix
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 10:09:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1we8vl-0034kP-Vp
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 12:09:33 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a424445-e002-0a2a0a5209dd-0a2a4501d356-48
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 12:09:33 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a42445d-400f-0a2a45010019-d155dd2dec2e-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 12:09:33 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-463f1165e16so3200842f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 03:09:33 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1ee0189esm50574795f8f.9.2026.06.29.03.09.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 03:09:32 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782727773; x=1783332573; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3J7crPza2txJo6zGn2WAQ3UH7EPrTtciJ4vYC2TRTao=;
        b=FLuvsA596Ppof2/UhHrkSRicxVjsU7LY7vVZnBxth1Z+o3ncnn9Wb/p4GwaxjUq4FQ
         iGWDcgGs0S82PyjxoIdAGU2TD6RdvMSfsaqO8DCI8TvjR3dZAqSZ4ptRoo9YB+tb65V+
         elLENzF4cdk/Lz6NVRpX2aPr+aJbl127ZphMStnCPX9C895Z6YxxSE5Fst2atV/oFEDW
         v9f5DQwL0JicizysN7j2dswzHUp7vvYLVglSHz/vKABx8L9SdBe6BnLVe1MXSahUvDlL
         9uf/TW9H3ZVP7LbN00tIx15+wvMQhgqyr24yAzz+VNOV3F0+efNEGXmdWQLltQkIRt3I
         1aDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727773; x=1783332573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3J7crPza2txJo6zGn2WAQ3UH7EPrTtciJ4vYC2TRTao=;
        b=HoJICV6GEz8knf+TvwuNolA6YyqU0yPh6wkn1bxJk9kbNsggry/7I0uu8qrCBrjtrn
         rSXR4pIWuiCuj0Mx9aCY26rdbYbraqMLmssghhitDs3rVJvK13EotBnPPb/cQvW8IM0O
         hBfCUoFkkEBObgTHVVUyxgMWXaum/s6Rdbv37tE9Q+iABTYT/xn8Uy1J88I9Jy9D+a8n
         KLEx+gMFyxpsYlAr0nmi8LjdK/aiwRHX6c7dNyDD8sSDyMxlq1u6aEFFMSsMLGk/QUdH
         yZ5GaOh3yAsGH87Gwz9JMkq53Bbrm6RWumCn4/ikga99qPSw3BWKjx9jwvReqW0EYleG
         9C9A==
X-Forwarded-Encrypted: i=1; AFNElJ/8tHDgUOfAY22JTXLZ235FkTzSRVwbx2X+Y2ZuF4hROjz+23nEFI8Ld29ioPO/NQZDwvOUAXScGfo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4Z2JUwPn+jo4Xh2h5mC7eH11PyRgY1qUQYA75QWl+GzjiNxtd
	dB12IpfFCcftgEhPNgJ73cq+0byOVQUA4vklPew5itzXYAFYERjXUnTK
X-Gm-Gg: AfdE7cmDeraBJtXAdiQndkBNT21Bi+yME9fV0ahYpA57fuU0AYqGdnmJAw1VLiq6usr
	lSvl0RdmDJXv+DE2CnEAa3kA3hUJvjVZAukxUM0Q9afaoT2K/7gxbDNQbj8WdqoM7BDO3UTQjBq
	yueIipj9k9hkGP485KWAoQJRvpf7GeM6ey/NEmLF6GcymjyBIfS2nw6qLxVvWpgPgTGyfZVcyIc
	ov5vYWgjJmg/Sel/qyHpBVuLJAtDnamf3y5Xwx9sAN4x+J0jIBxoTViTW7YxWC43jOYQ9mjIDML
	BOZjUU7WlbMGxz41/ywROoFS4rq6Dhe0KUJXAfa+ZLNSHY/xlKvAgjoWwLCrvtDUUXoLU5/Xzxi
	xPyqgjFgiK8xqEk6bz0LdKlHV9NgUJx0pKcL3GRJx5T4bm8O8MMEw1JqIsjvGih0LD/MALv2oxa
	mgQnEWsGr41FjsOr3IV3sxa7yrD4h6b/N4q43wf/vINznCAmO/p1hZ4IU40/DVhW2cztQ=
X-Received: by 2002:a05:600c:8b30:b0:493:92c9:1e6d with SMTP id 5b1f17b1804b1-49392c91fbdmr128187855e9.33.1782727773350;
        Mon, 29 Jun 2026 03:09:33 -0700 (PDT)
Message-ID: <f3aa7825-15a8-44aa-851b-f7a85c19bdc4@gmail.com>
Date: Mon, 29 Jun 2026 12:09:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2 2/4] xen/ppc: introduce a dummy irq_to_desc()
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260629094531.55555-1-roger.pau@citrix.com>
 <20260629094531.55555-3-roger.pau@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260629094531.55555-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1782727773-838C81E0-C5EDE67B/10/73395122804
X-purgate-type: spam
X-purgate-size: 1013



On 6/29/26 11:45 AM, Roger Pau Monne wrote:
> In preparation for irq_to_desc() being called by common IRQ code.
> PowerPC doesn't have an irq_desc array defined, so it cannot use the
> generic irq_to_desc macro in the common header.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>   xen/arch/ppc/include/asm/irq.h | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/xen/arch/ppc/include/asm/irq.h b/xen/arch/ppc/include/asm/irq.h
> index 5c37d0cf2500..fa70fd7d46dc 100644
> --- a/xen/arch/ppc/include/asm/irq.h
> +++ b/xen/arch/ppc/include/asm/irq.h
> @@ -30,4 +30,10 @@ static inline int platform_get_irq(const struct dt_device_node *device, int inde
>       BUG_ON("unimplemented");
>   }
>   
> +static inline void *irq_to_desc(unsigned int irq)
> +{
> +    BUG_ON("unimplemented");
> +}
> +#define irq_to_desc irq_to_desc
> +
>   #endif /* __ASM_PPC_IRQ_H__ */

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

