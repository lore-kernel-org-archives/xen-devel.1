Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C883CA5FBE
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 13:11:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437246.1656075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBu62-0000kY-UW; Wed, 30 Sep 2026 13:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437246.1656075; Wed, 30 Sep 2026 13:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBu62-0000kR-Rj; Wed, 30 Sep 2026 13:11:42 +0000
Received: by outflank-mailman (input) for mailman id 1437246;
 Wed, 30 Sep 2026 13:11:41 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBu61-0000jG-Bf
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 13:11:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBu60-00G9yY-LH
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 15:11:40 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abd0a85-bab6-0a2a0a5309dd-0a2a45088afc-38
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 15:11:40 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abd0a8c-f659-0a2a45080019-d1558036a42d-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 15:11:40 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a006d3fe83so12965565e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 06:11:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b029edea4sm3735529f8f.22.2026.09.30.06.11.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 06:11:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1790773900; x=1791378700; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DcPjqkAJzhravqxB0byJf5lCHbpT06I/0xFhDmixQms=;
        b=d55JlXHlpe8RJF7yaZrUFRiGaI8prk8ZXwf01/4XG2zgUeGOKx5W3R+T8D6erWnT59
         zkQ4ICjCTk6rVfEWQPraqfaXwkKl+ATFiLK/J/xUybu10S4d654yPHvVDSxhsS1WUm4v
         hGl3ChK1y5KcM/3QAuYhwy8O8jJp82f023lCD+7WqM9z+cGwWB/jCTWvm787YtHeFqKw
         meGu7WF/ipms988OIBU/MiZzxBlerKLb5Fcv1I9uCbpSvzMnyNNv8pGwK9G4MVCDm0uL
         wTZuS3C7+pBtf+8EB9iIyQAd60Z5UhCyVKUIpEDQwXP9j1oBVdAjDkI8vfzNPfsm7Ntw
         62Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790773900; x=1791378700;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcPjqkAJzhravqxB0byJf5lCHbpT06I/0xFhDmixQms=;
        b=A+7TKH+D/dtDVdGd07aIMRsWZrCChc6kcEgY2U7OP5e0AI0/0tI7mbqTFfhWMzVU7x
         x/1d0fdFtGbzfp4quHA16mpdFcenDjk6WK9TdwRKzVzTCg8nEHH4+H0Fniryhnr7Ha/J
         CD11/z4yWZcpY1/blfDw0H8jipR6yQ4dt+XNo++DPogT0+3PUdFjmsIEEp8lLWtdN5Xm
         cWyEjt1ROWOW8AAix252ccX5rtPuOM1wyy47Nx+lyvvFQ13vtzxxDJ5PcYZKD/S1gcU4
         u1pSfVWNWiXYLZ6SE3lph6G7zo3NBD7xPQaNaloCBoJq6rT/VkW9i9ChfzephjzayJFI
         Cl9A==
X-Forwarded-Encrypted: i=1; AKwUvBwplkpCOyU/+4/vaAz/mm+YTnX+d3oItAERljA12vax29N6242qTtVlTG8vqmTrmsJ9SuuHrihantI=@lists.xenproject.org
X-Gm-Message-State: AFuF++kRlS3KIAeiizoIA4MznvJULJ01tq3OD1+b1Dr3+W5F55bU8CIe
	0CcimpgkVJfeqZLrBJq1sE7OAUMG5Gh845+stWzquB+jDULdy18KGUn6clvRK9tRNQ==
X-Gm-Gg: AYBFou2+2Fe3cdDbeY6jhIM5DgXAO9IcDsLAG5O745GdVrR+k3WsdNSzNnBajqVcUtH
	j+uBo9Dw+cEAq4N3R37B4Kv2FVszq4B4MSN3ZbzrhIksgNflKbudk9IRxy9I/ywI06fiK6EXiQZ
	bCwJXxsWzficKQtfrG4XB/yeLqxYZuwX27bYYTuQWXgTZeojCNcJHx7+DPB7LJl+SEbZafNPW32
	OBl5yJipbBijgIil219S4kMsgnBg48oVlbaZwy3sybR3PvqSck9GNCPvLs1y5kTSE5ZXfRHV95T
	3mCTaxLGGurckWJLytubv15liX52zqyzsXkiyC34boq56aEQvJYWGKYdZhVSBnk0HoQ/LvTe/3J
	7x04wesNqHDVKqns+nAavwOzweNdCjPpl6vIIW0Jt6qdSSATHzYynxD7J/7U36pwjSYLPQOnHuA
	zmAoKeYy9ktnNcDamjpDfb9QI0B6QkBPW8XQAx9xYXhL25g6cIrvU8ZYej0QnO0pEvsAoHHQdX0
	ZviEZqUVK/uqtPD1+Px2fJ7DrjNfqAPNbnTgg09pPb/lyrLAzAQ7D+VKKG4ss0=
X-Received: by 2002:a05:600c:4a19:b0:49f:bb49:9cca with SMTP id 5b1f17b1804b1-4a01afe887bmr17679445e9.5.1790773899688;
        Wed, 30 Sep 2026 06:11:39 -0700 (PDT)
Message-ID: <0283cdff-983d-468e-9fa2-c4978cdc0dc3@suse.com>
Date: Wed, 30 Sep 2026 15:11:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] x86: New feature flag XENFEAT_mmu_pt_update_swap.
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, teddy.astie@vates.tech,
 xen-devel@lists.xenproject.org
References: <20260910203113.462943-1-kevin.lampis@citrix.com>
 <20260910203113.462943-7-kevin.lampis@citrix.com>
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
In-Reply-To: <20260910203113.462943-7-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1790773900-CDD4887B-4E263298/10/78276251493
X-purgate-type: spam
X-purgate-size: 1274

On 10.09.2026 22:31, Kevin Lampis wrote:
> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -690,7 +690,8 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>  #endif
>  #ifdef CONFIG_X86
>              if ( is_pv_domain(d) )
> -                fi.submap |= (1U << XENFEAT_mmu_pt_update_preserve_ad) |
> +                fi.submap |= (1U << XENFEAT_mmu_pt_update_swap) |
> +                             (1U << XENFEAT_mmu_pt_update_preserve_ad) |
>                               (1U << XENFEAT_highmem_assist) |
>                               (1U << XENFEAT_gnttab_map_avail_bits);

Nit: I don't see why you need to touch any of the existing lines. You can
just insert the new one you want; it doesn't need to be first.

> --- a/xen/include/public/features.h
> +++ b/xen/include/public/features.h
> @@ -128,6 +128,9 @@
>   */
>  #define XENFEAT_dm_msix_all_writes        20
>  
> +/* x86: Does this Xen host support the MMU_PT_UPDATE_SWAP hypercall? */
> +#define XENFEAT_mmu_pt_update_swap        21

If the restrictions put forth in patch 5 go away, the name is okay. If
not, those restrictions somehow need encoding into the name here, such
that the name above could be used when the restrictions were lifted.

Jan

