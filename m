Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1D1C88E64
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 10:09:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420682.1646933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x63d0-0005uV-FT; Mon, 14 Sep 2026 10:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420682.1646933; Mon, 14 Sep 2026 10:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x63d0-0005uO-B1; Mon, 14 Sep 2026 10:09:34 +0000
Received: by outflank-mailman (input) for mailman id 1420682;
 Mon, 14 Sep 2026 10:09:33 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x63cz-0005uI-3h
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 10:09:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x63cy-00FJ5r-93
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 12:09:32 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7c7d3-2eae-0a2a0a5409dd-0a2a4503aec8-36
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 12:09:32 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa7c7db-fae8-0a2a45030019-d155dd32f03b-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 12:09:32 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-4858303de5dso3185856f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 03:09:32 -0700 (PDT)
Received: from [172.18.123.208] ([185.104.138.131])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-486eb33e020sm27075947f8f.18.2026.09.14.03.09.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 03:09:31 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789380571; x=1789985371; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EL1LH8FSvrtGc6aSbK2aArEjtvYc/uo76nQ7Y2KbdGw=;
        b=G+/KBflHkkk+vtin5oV3cl76CXqcrjIBxJXSBBJLUKIOz9PJ1OrezBDiGBHae+lrHA
         Vk0fN0WxsPSJZdVZZtnpiqh6Y5YBfgjkErZ9Y+B6h/+bvAZaQpJqZRi9TolibWauJwu6
         nsRng5GbzdDGO/gT7FeqWACD4yGa7OzmCjpudKmYG3BSPAdWilHg8fyUfzry8NPIIY7H
         DEdY3kdDEgtOtW5zyoNgEo3UEBVaITo6qyOLde/7qsimD+XgInVExH4ZWcNCVJ6NqCyy
         3puzWEt5/XjTfCSgNA6eE8qqF7LxckkNDBk4B0djObaw+0bHSMts0TCGo7mBjQiyV6bB
         az9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789380571; x=1789985371;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EL1LH8FSvrtGc6aSbK2aArEjtvYc/uo76nQ7Y2KbdGw=;
        b=cv64B6LlczMIXfI2fEPKXYxbDK2z1RRCSE5EEnrwGvsxGw7wFo3zLFZ9tXiDV4pCbF
         NhmDkzve2+P+yBemQ08N/84PPIvnxOLKKsOFhbjhagYXuHY9168litu226v+3BJFSGPS
         zfKcptKfS6oAoJhd5EGmPSSTGZfMH9PcUYyMk9xL4giQH4tRLD2RquO1X4bjTyrfj/14
         tWKEvtTe/PhfowUSiVtM4IJI1sg4L1781itROE9jJ+5GSd0Hevs9dOsWgbj+h0h1les8
         cEZ17lk2Q0NKqsYz6G4nFTED9xdxOLnZbk7iyHeeOxq50MzcN4/L++hEquPwawqoMZjP
         8OPA==
X-Forwarded-Encrypted: i=1; AKwUvBwQXizyGDSS7F3c5rLAuCXFnSX7fpTYzeooZkxNi5f3Nm543iMZ8t14Ssdbl3lOIAEdmXnkLUU8bjc=@lists.xenproject.org
X-Gm-Message-State: AFuF++m5NFO0tNl9BIdex9kqwXbHEs0JsMO07FV2hYjyFFK7vfTZur5o
	W+GW98TTburacPSzak6uUbeqi7EH4DI113B0sd3RWWiKRoTaMRee+y+VKmT8Thhv7Q==
X-Gm-Gg: AYBFou2AC8X7huSL9XA+HYLRnAWGzXR/1mr7+fB6x5dWsSE7rMsBcHFViLS90E8DZlY
	fO145zpoUlI7QTNAom1H2ZssPPW0+50Noqyr7rl2qfrs+1cniiYrsimll8eU+lFiucVnbSOmhwm
	kZ/EJdi7jKLx3nbg24LkztjoG/CgV6GsM4nSSOJMtYCChnoWjYQBN2LDdYVZ6ui7yLVt9jt68Ye
	N3j7yvehRaa18hMvQQsmjk2Xu7Oy6iqPHWOis0jInKn2zWMihQ0+I9WsTwpZd4abf5MmHTU8o+P
	1P7oOqAPCvLFrVsAcLtk9p0PMOPyZxdJ3FBf3zEwTfXBfaos0a9gLyliQcp6JH2EkKfo2N0BQsQ
	71qdBVGfeVAfKpgLUgn/qjjxuZukEZb/9UR6Z/Y3fscfoAthuRRXSWVX0vuASvmN64dkY4qSDgl
	7N3Xj+St7R6L85b+t9GkolCaSbmhq6Bm6wiH65ng+FPglX9e/LaZpvDn5nySJN+XaSuC6ZimeKQ
	rAoe7qmFxs5
X-Received: by 2002:a05:6000:983:b0:486:f46d:a13e with SMTP id ffacd0b85a97d-48702a2480cmr1886444f8f.0.1789380571539;
        Mon, 14 Sep 2026 03:09:31 -0700 (PDT)
Message-ID: <e565227b-943a-4af1-a1c0-f21079f44a9a@suse.com>
Date: Mon, 14 Sep 2026 12:09:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/svm: Intercept CR0 writes selectively
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20260911095121.1177503-1-ross.lagerwall@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20260911095121.1177503-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1789380572-6EACC4E9-B7893CA6/0/0
X-purgate-type: clean
X-purgate-size: 2202

On 11.09.2026 11:51, Ross Lagerwall wrote:
> Since 3356d685dbda ("x86/svm: Remove lazy FPU support"), Xen does not
> need to track when the TS or MP bits change so opt to intercept CR0
> writes selectively. Aside from potentially reducing a few VMEXITs, this
> fixes a nested virt bug where L1 intercepts CR0_SEL_WRITE and L0
> intercepts CR0_WRITE. The hardware prioritizes CR0_WRITE and so L1 never
> sees any CR0 writes.
> 
> Since CR0 TS/MP bits may now change behind Xen's back, sync CR0 on
> VMEXIT so that the emulator sees the correct values.
> 
> Shadow mode continues to use the full CR0_WRITE intercept since with
> Shadow the CR0 in the VMCB is not the same as the value Xen tracks on
> behalf of the guest and allowing the guest to change one of them
> directly would be fragile.
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Independently, ...

> @@ -2519,7 +2520,10 @@ void asmlinkage svm_vmexit_handler(void)
>  
>      v->arch.hvm.guest_cr[2] = vmcb_get_cr2(vmcb);
>      if ( paging_mode_hap(v->domain) )
> +    {
> +        v->arch.hvm.guest_cr[0] = vmcb_get_cr0(vmcb);
>          v->arch.hvm.guest_cr[3] = v->arch.hvm.hw_cr[3] = vmcb_get_cr3(vmcb);
> +    }

... we really want to change to !paging_mode_shadow() here and ...

> --- a/xen/arch/x86/hvm/svm/vmcb.c
> +++ b/xen/arch/x86/hvm/svm/vmcb.c
> @@ -154,6 +154,13 @@ static int construct_vmcb(struct vcpu *v)
>          vmcb->_cr_intercepts &=
>              ~(CR_INTERCEPT_CR3_READ|CR_INTERCEPT_CR3_WRITE);
>  
> +        /*
> +         * Xen is not interested in changes to the MP and TS bits so use
> +         * CR0_SEL_WRITE to avoid unnecessary intercepts.
> +         */
> +        vmcb->_cr_intercepts &= ~CR_INTERCEPT_CR0_WRITE;
> +        vmcb->_general1_intercepts |= GENERAL1_INTERCEPT_CR0_SEL_WRITE;
> +
>          /*
>           * No point in intercepting INVLPG if we don't have shadow pagetables
>           * that need to be fixed up.

... here, as that's compile-time constant when SHADOW_PAGING=n, while
paging_mode_hap() is compile-time constant only when HVM=n (i.e.
useless here).

Jan

