Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC5ACA6019
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2026 11:25:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444260.1661191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xF8ip-0000oF-9B; Fri, 09 Oct 2026 11:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444260.1661191; Fri, 09 Oct 2026 11:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xF8ip-0000o8-63; Fri, 09 Oct 2026 11:25:07 +0000
Received: by outflank-mailman (input) for mailman id 1444260;
 Fri, 09 Oct 2026 11:25:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xF8in-0000o0-FS
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 11:25:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xF8im-002RQ2-SR
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 13:25:04 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ac8cf10-2eae-0a2a0a5409dd-0a2a4504d64a-0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 13:25:04 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ac8cf10-b57f-0a2a45040019-d1558032b5c0-3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 13:25:04 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4a180fbeef5so27249105e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 04:25:04 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf2343asm94420665e9.9.2026.10.09.04.25.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2026 04:25:03 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791545104; x=1792149904; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nfVrsniM2DhNE5QjrHY1Qlgp3HIW0cjW0j90MKoAzw4=;
        b=kEPRES4zqtaVoygJN/zlPujjMJIzaadLpNOLH8rDDfHgUCQyPKeCUlVvX3B3p9bnh+
         /bxCpraSstZeGj26L8ivHmMHHE7QzRaZY1zu4aIvsR2ZrNLiHjkku2TfTmffqhJuqyMA
         3agW9hGEe5D/qTc0YEKYtTVKMrDksKIj4w96DkuWgr7/ipYQwNJ8MP2Q8VN2xDSKSOL6
         3xG6XxhSJ2HMzsCkjB249zJTD787sLSIUYa/mPaQaVqS1p9A0WCtB6pPUnrKLjOFo+vb
         HjymH0XSoFIb1ojTClqR3uOhGG5gCHTZ/cyRzura43Df6UocqosG5ZMxfh3w/2z3b4wG
         uScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545104; x=1792149904;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nfVrsniM2DhNE5QjrHY1Qlgp3HIW0cjW0j90MKoAzw4=;
        b=F32Z1AtKKssAVTagvBJB77OQoyXBBQCAHxTTQRBST78bwK43Ginf+ZI2b+HBzRW+gP
         u62qJSWO8Ven00xjRxnKuhR3vDqZbMr2rSp1qfjuBTAyE1u6lc1mG+i+6l4182XbVUOI
         zZ9cIR1qP4JXaagPUTYcWnn8OzgH0yePXpWTs/lpO/SAtTLw4hosy+swo6lDTEjgVtj6
         kQiMu5TSs3Mca4Fgf/P122lAwl2YcihRJF2kJhcg9A7ldzo+G0yIDDyFnVj5TgqCU8OU
         2iz7bhsgM/hZLMtJIJoUkH43CBhxRNfM37jjJu5sHveNpUivSnFjNvScYDZl6m8Xal/q
         P8Dg==
X-Forwarded-Encrypted: i=1; AKwUvBw1fFuRdjEEMXAqIUQ0Dmui/jNsp2BAhpltSYtUleyVpuqEwkkdLrdYyGkTJKkyfl2ju+tBrUjB4pE=@lists.xenproject.org
X-Gm-Message-State: AFuF++ks0mio497HhYmS47H9k+QP/y1O/B0kQibWQQNoN4dNL2mmGYb4
	u2xVqS6Surt9FqcWpk38Uka7fvXFfU0fPxszQT6zk8BAtIJmnVK7Udvx
X-Gm-Gg: AYBFou0mRitYuXNMombvdwmnSjbNsIjKzNvQveFfjqoqx4xCMYIjM+pDme9qfprv6WK
	RCCmSpC0gi2hwx4OGka+FIg/67N66okwDEYhQ146IeNotuh6vW4qmJ6kATNQmJQaKdAXcdP5gQ6
	nKUHHkyHjCMVNld7bKXL5OtdZYhWKdZd9tQHeQH11cU/oN16e7NQOBKyGG9GfUcO/pKHBVlnOSN
	5d+EImlf70UxXBeXXTd1CTMynfEpLcizp3OmESvIdPydK9S8FyAoGwmy/y8l7RqBGcViuYcvKcw
	rd3fRK526VWkH5f7JPvxv9G6nCv5CzcLF1VSugAT/dH1anGSxHU8XsoqagxHndFiEZnc7lJoFoi
	gW0s4beUP+pwpfALExw0VrlasyZfclBpw+QyEnHXUfeoOJO2TabDnPJ/aze5h1Wu7ifEnBaCfwm
	oPSKAaZaJ8RPz+McifFQ3WvWHpdNP4SnWx7ffqZ0dfKxe12oLVvtR3ArIyXFDpxdLTicswhQ/20
	+Q+Ml8ewOEyepzh1o5pEOLNVbcMYxfJxGkVpDfs2XV0hqy+zg==
X-Received: by 2002:a05:600c:8b28:b0:49f:bd3c:bc1b with SMTP id 5b1f17b1804b1-4a18e499da4mr27083925e9.22.1791545104192;
        Fri, 09 Oct 2026 04:25:04 -0700 (PDT)
Message-ID: <7090790f-6777-4706-b44f-a7720b52fadc@gmail.com>
Date: Fri, 9 Oct 2026 13:25:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] riscv/nospec: Make nospec helpers always_inline
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20261007143117.757375-1-alejandro.garciavallejo@amd.com>
 <20261007143117.757375-3-alejandro.garciavallejo@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20261007143117.757375-3-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1791545104-C20D5B50-5170AB3B/10/73395122804
X-purgate-type: spam
X-purgate-size: 1109



On 10/7/26 4:31 PM, Alejandro Vallejo wrote:
> While today they don't implement fencing in a way that would block
> speculation, once/if they do they'll absolutely need to be inlined, even
> if -fno-inline is passed.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> ---
>   xen/arch/riscv/include/asm/nospec.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/riscv/include/asm/nospec.h b/xen/arch/riscv/include/asm/nospec.h
> index f9b0241c98..f9bba8b2bb 100644
> --- a/xen/arch/riscv/include/asm/nospec.h
> +++ b/xen/arch/riscv/include/asm/nospec.h
> @@ -4,12 +4,12 @@
>   #ifndef ASM__RISCV__NOSPEC_H
>   #define ASM__RISCV__NOSPEC_H
>   
> -static inline bool evaluate_nospec(bool condition)
> +static always_inline bool evaluate_nospec(bool condition)
>   {
>       return condition;
>   }
>   
> -static inline void block_speculation(void)
> +static always_inline void block_speculation(void)
>   {
>   }
>   

LGTM:
  Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks!

~ Oleksii


