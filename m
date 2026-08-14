Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED613C5CFC1
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 07:48:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390889.1631004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wumeJ-00018g-Qm; Fri, 14 Aug 2026 07:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390889.1631004; Fri, 14 Aug 2026 07:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wumeJ-00018Z-Nm; Fri, 14 Aug 2026 07:48:19 +0000
Received: by outflank-mailman (input) for mailman id 1390889;
 Fri, 14 Aug 2026 07:48:18 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wumeI-00013c-J2
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 07:48:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wumeH-00Blrz-8F
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 09:48:17 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7ec82a-e002-0a2a0a5209dd-0a2a4501c954-44
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 09:48:17 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7ec83f-5984-0a2a45010019-d155802af1a7-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 09:48:17 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-49800c6a846so7557645e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 00:48:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49987b2e6b6sm31853825e9.3.2026.08.14.00.48.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Aug 2026 00:48:15 -0700 (PDT)
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
        d=suse.com; s=google; t=1786693695; x=1787298495; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u8USBfCyP2EQaBisKnXCIX7wTTLpE4ngLpwbAIM3xM8=;
        b=Vo2h456eU1SElh+dCcGGVqAKzwCizgjk4h1kwi+HFAe849pvdzSNwOX5zQOevRjOjL
         Nfr3+ci6UDmQux/IXs1mXr4Hv0zRGXh91ceANR+RyA9Otqu91pX6zU0VrZYljMSIsS6y
         VAcW6WWgbyYNfli1RPIl+C39jdIv1Vs5xH9X/enCSzmjeuPXmflxS05Sr3NF/QSVQnAK
         HrH6QKd/2YfUQy3j+kjUhydUTKSALv1/IwWnaVGaOPzI1xTywgxSbAGDdOQ5DQDorjRN
         4Az+NwitN0e54lc5xhzlF23ard4OO5LjNErrkRgnq3KJDHNKFjn+5FlJMn1fIAnIx2Ss
         D8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693695; x=1787298495;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u8USBfCyP2EQaBisKnXCIX7wTTLpE4ngLpwbAIM3xM8=;
        b=SKWgVHY1skT4PL5UViUdGiuXxsnkMIHZNKig2zCKY1JJGt3nq5VkOVREqVn4yln+8+
         IGrJNcXbJIdX+vSvTv3H7vlS3hmPy2cpoKz+uEpeiMlo/p3ymeAQ9dcgu2oAUOTO6+DK
         yAovWESti2fmuxnt5in75VePg3M2NGNGRPEbCp3JPatCwhFBpiSbY7pogsVhYd7Q12FO
         GaOn3hNJcJKN2pxaDDp1earP2AFAU9ieDOHwS0Y9YQOOFNMyR5nqI7LZ+CYlG14yfcRC
         M1JY3E+/oirTnPGqBVdYxsW+Z53UW50mXMD9rF8pFC6Su9oa3m4w5Jp61VOmq+fxAfwU
         WywQ==
X-Forwarded-Encrypted: i=1; AHgh+RqWiQzEbW3bpY5nNAWUfgOG7Ehep8YIpoKa8PfKr8z50mv1Gl+92zQe1ULwk6+2585/gnAuOJCI3us=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwcqAlD+4QMaH7nK7ssmEihbzqPeTDsz4LJsCQ/HffhwmKa7+5M
	nZd9+GbmRbk8K+I1xyfyn38A+lHRL4ZHBAj9pun7x6aRJVyPrhzZBkMmluveJoA691pBK6jAkdU
	2d5NdAw==
X-Gm-Gg: AR+sD12hW1U8jzvVbxT8C1LITWMrK10cI+wHshOZxsIqmCu6tIbgd8GFviKCxSw46SQ
	9fvh2OKO3JzoI+TMWCVh0AiOP7kMbWWXgWXVBpoUEWA6I/qjflrLe5dl6kMQXjcsz7ys9W2HAgs
	QCiQ0dYAwm1oLb4i5UuZcjWKF10EbmVeHeQl1kD9mrvffyM5JypNnLBzf3XWs0azHDkANgiWB7O
	zDl1PkIlOHuf1rkVRAK2OpUYCFCIZKJ0J8es9qyzsk7DUzIC06O9TiWlJo3myaPJgZ+Gtefy6Z3
	xxYIC0Xp+FjCL2wvVAFktBu0lCjQDW0ocSL5Q1p8LLYLpdh8dZnX4AqXaitzZGNyApXx0Ej+nZU
	rXAU+NdR6MzgysXFYKZApyWaHKzyhnaDz5cp+e6dfOpDCr72WaiAI0CQiLBxwiugVXc1R0eTy/M
	YPD3mLaKdWUsA6lvtsudtyolj1itJ8VDx7yzML8hUVDxAxFtHRHoqQQHG20XHPClj5cptjvSfDu
	hBfzoU9o41Ud4Zi5quDFnliqPzh8i6qDVm0pIHcQbYvgo5cK1vp
X-Received: by 2002:a05:600c:8714:b0:499:8704:242c with SMTP id 5b1f17b1804b1-499878ca13bmr61276965e9.0.1786693695466;
        Fri, 14 Aug 2026 00:48:15 -0700 (PDT)
Message-ID: <50553714-94be-42f7-b8db-f176cb328059@suse.com>
Date: Fri, 14 Aug 2026 09:48:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: tools/hotplug: fix invalid frontend path for set_mtu
To: James Dingwall <james-xen@dingwall.me.uk>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20260814060441.923061-1-james-xen@dingwall.me.uk>
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
In-Reply-To: <20260814060441.923061-1-james-xen@dingwall.me.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1786693697-1EC61757-CB8A7AE3/0/0
X-purgate-type: clean
X-purgate-size: 563

On 14.08.2026 08:03, James Dingwall wrote:
> This is a resubmission of patches previously discussed in this thread:
> 
> https://lists.xen.org/archives/html/xen-devel/2022-04/msg02209.html
> 
> It appears they fell down a crack after review and never made it to git.

Indeed, and I think you could validly have retained Anthony's R-b on patch 1.
Now that you've re-sent without it, I think it's better for him to re-supply
the tag. He's now also in the position to actually commit the change.

I can't spot any earlier R-b for patch 2, though.

Jan

