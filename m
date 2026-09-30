Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D226CA5FB1
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 06:34:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436859.1655525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBntM-0000ls-4o; Wed, 30 Sep 2026 06:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436859.1655525; Wed, 30 Sep 2026 06:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBntM-0000ll-1I; Wed, 30 Sep 2026 06:34:12 +0000
Received: by outflank-mailman (input) for mailman id 1436859;
 Wed, 30 Sep 2026 06:34:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBntK-0000le-Oo
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 06:34:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBntJ-00B8eq-Di
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 08:34:09 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcad5a-bab6-0a2a0a5309dd-0a2a450ceb32-30
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 08:34:09 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcad61-f479-0a2a450c0019-4a7de18cb749-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 08:34:09 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912e4b11so29214065e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 23:34:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0174e13b6sm31696055e9.4.2026.09.29.23.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 23:34:08 -0700 (PDT)
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
        d=suse.com; s=google; t=1790750049; x=1791354849; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KV6JTAUNGQFAn0Of750KaTkphbjAkPO7np2qpGA403g=;
        b=IZ05LjInkxIyDA9yNJeZohtmtDELdA1dNKiZr6QS4iP8c9RbiKu7aP9JoIyPBd0wn6
         1tHUtGtSnO2Rk0b269YwFtBh5WiGVQ+adMgvpL3tJKj65pZ1UD/JZSPL+yhWQ5/9GxRb
         ceYvOUHHCmR5FK54liXjN+h6A70KfyPZUUvIFQM+Yjl5c2MphpkCRkooF/Dq6HY/uejW
         pi00UyGDD5Xx3XAibt/yPXjottuj9UujL7LStcRksIbZWbxiOR4ngCWT5zHYbJiG4qHY
         L561/C5QchWjFj5c4v/Iu2fJWsb0mhhEgFKnZtmUynjRJ4IwKO25SPVnj2d8dDUFqwtt
         J/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790750049; x=1791354849;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KV6JTAUNGQFAn0Of750KaTkphbjAkPO7np2qpGA403g=;
        b=VQmLg1/VFKYtQ4bdGzuCVTJ7O2K6UtLfKH2vkMWv8loN53cGdHxiIPboZDkfIu7I3P
         AqvduN/YbbN8OsVcZeG3YI07g5Uou8eYXk9ZdPDwZMVs71KOmTSt56jrE7ccONBx4yR7
         SW1R+ZQeLg+H3kPgrkNXvHh+e3HEAUJ9ed5IIQZvw2w5coCRtECMfQkQ7u7u5vFW1I21
         U9yT5I0PllRkCTzcBK+pC4S7R5IJxnJ6HqAdsAHNWBSKELiuv1z4FvBCiapQRhaP5t3x
         7hUtyPYAeOTHF29J/bV7+0R9DXUqnuoZvJVMkx7DAukNgjN4Q0lVZ+TROlIgpXzd7hQj
         mdFg==
X-Forwarded-Encrypted: i=1; AKwUvBxYu/vOw5MtrG3V8uNfKeu0qf4L4CAuSP/m5/k6necj1VnTHhzitrDs7fPqvrgBfjjqFcWWGqaIlhc=@lists.xenproject.org
X-Gm-Message-State: AFuF++n7OopnmJVXzOgOfLMPs+fj/5Ajb3bE4Lpz7nto3w4aU4aGFJzS
	WOt4KI9iMwYCwJOlmONmWV2YSN2E8CNTDsa8bmBdtQ6Bk95hgcYJGaRZcf0mg1ZPPQ==
X-Gm-Gg: AYBFou3DElIP+JAkLPug8xMck7BRcQ8DHZSUGxI8g0LqyE0ztxgh0Pj8xu/VS3mQaHv
	wWsvFzQPBSWNCvpEr8sp8w6UlZWK/XAtnzT1EY5K4K/aeUNJMvWsiizm4o9l6hBDJogKjTGNiOL
	63wIyJPpcuaxlufh0a9wYsnGX5wuvkjK1oiJ+LyVi9xEbnELTwM5Dl2QYYbXchzLd9I9+oVS3d5
	d8ZDr5P3QbmYjyxGGosc7xzr0xqni5G+d6Uq7d/pwxYclWWeFtHdiwgCewAErOrhf4kOvSsNNHb
	tfxequVqB48yvQHD3h1U4WMmWBcOBehPtwG7CCg3HjCT4aPeDZfO9W70VDnM7hOSZt6bx4GauB2
	gWOrX89nDxpP26qlx81RXYfsf5qAh1qgoLjYX88Oe/E/DMV6wmcJbbgrKonmdBuqZ36Is3T/uA8
	0u+E6yk1H6ysn5/6KJ5NxjL5PX41lWFKgapqWkDpjVcrtER7JpuE4hspdB+7dXIK+o4cK+ElKrz
	RgENzBye+5AaazvIZeeYDZQtARu2XcqT4F03Sp0TAIHpSomGFFZ8ahwVO3aKw==
X-Received: by 2002:a05:600c:c8a:b0:49e:7862:c09e with SMTP id 5b1f17b1804b1-4a01adec28amr4770295e9.14.1790750048700;
        Tue, 29 Sep 2026 23:34:08 -0700 (PDT)
Message-ID: <690753f4-5cc4-4657-b622-d1b690092140@suse.com>
Date: Wed, 30 Sep 2026 08:34:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] x86/svm: Cleanup virt_ext_t type
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20260928140248.1543013-1-ross.lagerwall@citrix.com>
 <20260928140248.1543013-4-ross.lagerwall@citrix.com>
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
In-Reply-To: <20260928140248.1543013-4-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1790750049-004CFA5B-378C62FC/10/78276251493
X-purgate-type: spam
X-purgate-size: 492

On 28.09.2026 16:02, Ross Lagerwall wrote:
> --- a/xen/arch/x86/hvm/svm/vmcb.h
> +++ b/xen/arch/x86/hvm/svm/vmcb.h
> @@ -353,12 +353,12 @@ typedef union
>  
>  typedef union
>  {
> -    u64 bytes;
>      struct
>      {
> -        u64 lbr_enable:1;
> -        u64 vloadsave_enable:1;
> -    } fields;
> +        bool lbr:1;
> +        bool vloadsave:1;

Like for patch 1 - since you switch to bool, assignments using constants also
want to move to use of false/true.

Jan

