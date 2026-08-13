Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F52FC5CFDB
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 11:27:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389829.1630442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuTaV-0008C9-4D; Thu, 13 Aug 2026 11:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389829.1630442; Thu, 13 Aug 2026 11:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuTaV-0008C2-13; Thu, 13 Aug 2026 11:27:07 +0000
Received: by outflank-mailman (input) for mailman id 1389829;
 Thu, 13 Aug 2026 11:27:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wuTaT-0008Bu-61
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 11:27:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuTaQ-00H6uI-VD
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 13:27:02 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7da9fd-8faa-0a2a0a5109dd-0a2a45059ece-22
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 13:27:02 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7daa06-4cb1-0a2a45050019-d155802fcd62-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 13:27:02 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-498028b3d5eso6681495e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 04:27:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49981b62894sm56065245e9.13.2026.08.13.04.27.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 04:27:02 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1786620422; x=1787225222; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LF1FxIO16lZ95Yvt+36L44TtVDGW1s2HRYpmZYcZF7M=;
        b=Ffrhhj1vk2WlRHRXWQ874NayK0DTpcNgjnYt2bE5rCIzumTX1tmmejQaMlRv/QEkWT
         GLfuMzxbLEWkVmTexibIIjxk1O25fQUulmWtReImrf8MDmpIPRFPRVVaXU/mtDiauwQm
         sDQ+Syo5uQSn9h8bVBAeiJBFxycU+CVPHpfxtvOhR5eY7p8M8bdvlSYYkVuUNhPtIjzp
         +48rAwG/ZhrTPgG65t3S2otQzCqR0kFYWYsFGbOHyw52r61reJrqGR0O2p4qdQEHWDsa
         TxPpHNSLO/P1MFe9m3WoI+ecMF+vex3/lTaV96LgZu0/6bWQmR9CDJwy+1Zz0ERTDXxb
         WWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786620422; x=1787225222;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LF1FxIO16lZ95Yvt+36L44TtVDGW1s2HRYpmZYcZF7M=;
        b=Pi6ukTlYGjilE2scAd0SV5Rq8oPFdnjwHH3fTy3I/dUPAKAoc4VzhnzndlqnP3E7U9
         GKaQuz0l4y9P2y4662OK+RBOt+v3CXSdz3ob2CyeZbozmX8RU7m2P7PjfPPZNT+ZxlwB
         /sw3jdKbqIq6TthtI/gHjnfF/ealjRP5D7sN84wOKh9GjYfU40hGITqggnYDZxADarz4
         N39r828CBYELHmvueWlRfvxvS8YQjbTsb8wJI/beZ8wr7/UHtvlRHr7OakcnNeNpahcX
         LvGHnErNMHM14+ZbPwqKtjbckodEhO41VcBoog2a+p8LrRYHufAU1MspdOPWr8uXc+gg
         Z27A==
X-Forwarded-Encrypted: i=1; AHgh+RoQSm7T+aMRantJdTE6sI91J/hnPz5eeYAdjjb7BH2bSQ8W22Zzx7GunbxBt2tiC+7JxQegLcGkfzk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxlUl3fj2nt125WEaocq+t/Ckt1Nl7EZIgxFOfbV/fXVG5k4BEm
	BW1bidvzWJf79stvQ0jZXIOH0PR9LqeabWGKmLqPL8zQDNp/qzWTY4ntWzJ4jMVqIA==
X-Gm-Gg: AR+sD11ReNHpYpUH+gcl2xllnvc34N8wQmaefMbkFN6GvY2WA213dEaF6Z4xesHBI9L
	AESYPX8dT3sYT60u2FLJvjvVfq8f1+C+l+PubtzriYIB7N2v1IjuBvn2z3iv0imufgfXDFdeYOd
	ahZD9NeETff4SPT0sZoZpQhE9t8aM5Nt830tr5+CqiL5a7vwuSr5RWJoJzAob6FcNuiPzfU1ACO
	/zX6dh5LRiIdwD8hRsHNRtKmR6G7jTqhhKZg70sfRuTnLq0fuR3SAHSOO/0/d0bee1UTeu0ZPGv
	qQFejKrZkxwhU7MGuhgF4zzaj8yq9hrpFfYrnjWrFANF7rBifzRJpBAa8cR0VtVFWcWw1u3yLOe
	x3SnO2wyOFu8yG/i6Y8MWYJRh5jLDTWFzMAKt3/2xK5RSlx3sHx/YrYuX7YyTEurCx6nhv1K8tC
	bZzPEae9j2W6ApKvAYSJLZx+UOFllz1YCZl9d65bI9+IqVjGAR7LKVR+xwTgZz/kTu60Ihmcv9K
	3y9pCYRxwVUVNh3b1NJE89N5shMJRPdT1rHFa0blSAdoVqJudD/
X-Received: by 2002:a05:600c:1c07:b0:497:ff73:68d5 with SMTP id 5b1f17b1804b1-49982108004mr62463775e9.0.1786620422371;
        Thu, 13 Aug 2026 04:27:02 -0700 (PDT)
Message-ID: <1101df6e-bb36-4766-9b11-365d1043342b@suse.com>
Date: Thu, 13 Aug 2026 13:27:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/10] libs/guest: move batch_pfns into a separate
 structure
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org
References: <20260810103018.54564-1-frediano.ziglio@citrix.com>
 <20260810103018.54564-3-frediano.ziglio@citrix.com>
 <d41d0fa2-7273-4723-a5e0-6424d030cf0a@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <d41d0fa2-7273-4723-a5e0-6424d030cf0a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1786620422-F52A32A1-0462A273/0/0
X-purgate-type: clean
X-purgate-size: 1823

On 13.08.2026 13:08, Andrew Cooper wrote:
> On 10/08/2026 11:30 am, Frediano Ziglio wrote:
>> Preparation for a followup patch "libs/guest: allocate various migration
>> arrays just once".
>>
>> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
>> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
> 
> Coverity thinks this change has memory corruption.  I have to admit that
> I'm not completely sure why it's noticed now; possibly because now it
> can see the size of batch_pfns[] where previously it couldn't

I had looked into that too, and I'm puzzled that ...

> ** CID 1700057:       Memory - corruptions  (OVERRUN)
> /tools/libs/guest/xg_sr_save.c: 284           in add_to_batch()
> _____________________________________________________________________________________________
> *** CID 1700057:         Memory - corruptions  (OVERRUN)
> /tools/libs/guest/xg_sr_save.c: 284             in add_to_batch()
> 278         int rc = 0;
> 279     
> 280         if ( ctx->save.nr_batch_pfns == MAX_BATCH_SIZE )
> 281             rc = flush_batch(ctx);

... the tool can't spot that flush_batch() resets ctx->save.nr_batch_pfns
to 0 in the success case. And ...

> 283         if ( rc == 0 )

... only the success case is what matters.

Jan

>>>>      CID 1700057:         Memory - corruptions  (OVERRUN)
>>>>      Overrunning array "(*ctx).save.buffers->batch_pfns" of 1024 8-byte elements at element index 1024 (byte offset 8199) using index "(*ctx).save.nr_batch_pfns++" (which evaluates to 1024).
> 284             ctx->save.buffers->batch_pfns[ctx->save.nr_batch_pfns++] = pfn;
> 285     
> 286         return rc;
> 287     }
> 288     
> 289     /*
> 
> 
> ~Andrew
> 


