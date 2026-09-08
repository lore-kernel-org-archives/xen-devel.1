Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86867C79FAA
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 15:56:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412254.1642798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3yAf-000851-0p; Tue, 08 Sep 2026 15:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412254.1642798; Tue, 08 Sep 2026 15:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3yAe-00084u-UG; Tue, 08 Sep 2026 15:55:40 +0000
Received: by outflank-mailman (input) for mailman id 1412254;
 Tue, 08 Sep 2026 15:55:40 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3yAd-00084n-Sc
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 15:55:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3yAd-00Dtws-5I
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 17:55:39 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa02ff2-e002-0a2a0a5209dd-0a2a450ae898-44
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 17:55:39 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa02ffa-f2d2-0a2a450a0019-d1558035bd28-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 17:55:39 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-49556f97a9dso40520805e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 08:55:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf7740d44sm881426855e9.15.2026.09.08.08.55.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 08:55:37 -0700 (PDT)
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
        d=suse.com; s=google; t=1788882938; x=1789487738; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T18GByUwBPJxm1HBGtNW/Ap/ZlYW2LSyeoW6v3TNUUI=;
        b=d/ZgOphAU/5mIupF6V0mUclTb3STLDN8nd5Be01OpZJgeFSEc/E9KML79c0qouegau
         LvLnk2+0i+zLjbjjnXXfJ3CWGatz4O3H2A9gFXTa9mtpZxfoax1giKzK9Fq6Qw8K64xr
         1Ixbo0oGSPuzF9J5L553t7DMsd/cLizmBPql96m+l8l7ZSnkGwfdri6f7KpwW+hEIRQW
         YwOoc8PEzAqwfiZej7OsLGzA4YHmQ5ebj91S73LRLrICWGtGERmX5zcGb2WPdnKargn5
         XnnCsx2sVIxs96v7VonBPVEm6072mGMoba8XDAfya/uCHyrePY8WZW4kYu3c2gLC0VYn
         9loA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788882938; x=1789487738;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T18GByUwBPJxm1HBGtNW/Ap/ZlYW2LSyeoW6v3TNUUI=;
        b=dL1spWMwRJ1N8/P27tQI7k3s+M8ql5JAEGQzroWJN5r1MYX2dbDmbRiEzsDslvUVOa
         E5DkyX8cJCMUNKk0SbCzbqAY6ITTePZEVWRs+oiKNTAp7T+blYzp3dzq1Y2eP/Tn6gKA
         +KDd+2FmjYR50z6JhwgGozWfc8NSJgiUmYUwUcdccQuth7k/xTAW8H8BHCmUVM6FT2AY
         /7tACkco7qvOlpeIctc+vjhke9VQFAGikwBF4YzJrajCS9JzTtk8MLe48EVCZ6PNhB9c
         5K8c4TpQmTKYX802vodIqC6bt6dkNxhVaIuvqOF3tsGRB9HwkV/me0f1W9mgwycDI8Rs
         09sQ==
X-Forwarded-Encrypted: i=1; AKwUvByk/cHOYxaryUvHbwwhQVXtiXfzDnnD5DlPUTXXe2OmuM8nQtgzhCxbNTQmVBsEYtFWlSP5zNEMAkM=@lists.xenproject.org
X-Gm-Message-State: AFuF++mIDoB/gieiYu50CC7rQ43HZDv81awfWbhp1247c7LN1RIp947N
	3NPSkM7jeJQW2eYpXgzhJU/aGP/vM2HRvUl9yZ7fhEwXiyiGXtIKw33gsM2b7uxjOw==
X-Gm-Gg: AYBFou3hAXJgZutVZz8ANv/23JB5vreTjrfRJI5M/NFVQsiUGmOQrZHS/PDHFXjUHqA
	NqolkgUXlfPkljmXMb5gnW1pxfIT0RhwEkSE4bd5qf9txgYlPLf5svSn8D8ck6gtkVzXZ05wzh3
	OHc29I2emSbNeuII+vl2fXH7WujdoBEo4mbWmOGTPcVBV5Mwq7RHToe8P+ZqvZRgDZJ4nRx/jM+
	D2dK1CDLY+SpA19vpiaQYfh2OnDBHI3eW/o7O1TR3LmxIwXWhLBiiVPhwR8fGpHP9lGf90nt9dW
	1P9f9yfk5yr5gis4e761d7UCYSnAUJnNYPNvIxSNZeCPavsqIXIOxqCAJd2WG5JbvjNWqAYvbEa
	LsV3xTePoJBdey9EpWPEZBsEMIJ9eAqE5w0Xxsj7kuEwJG7Wz/Duh/8fKj7ul5ROuZe8xn8KZzU
	mmavRS9JYNRC2t2w+gahvN4VApPhuLtYLBlojY6KE77Kl712F1fWB4+IzY7AXCopZC3ydImCn91
	Ja+Vv9hJl5eb/wBdQLr7rMUD23AjGjkcYOyJSsBxkUreBhyQyoL
X-Received: by 2002:a05:600c:1986:b0:49c:fa21:e744 with SMTP id 5b1f17b1804b1-49cfa21e906mr246470085e9.26.1788882938434;
        Tue, 08 Sep 2026 08:55:38 -0700 (PDT)
Message-ID: <5b5a8303-b018-4b5a-a4d2-6eabd4c48559@suse.com>
Date: Tue, 8 Sep 2026 17:55:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/14] x86/domain_page: drop redundant
 create_perdomain_mapping() call
To: George Dunlap <dunlapg@umich.edu>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Alejandro Vallejo <agarciav@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
 <20260901-asi-part2-10-ecc269f268b7@xenproject.org>
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
In-Reply-To: <20260901-asi-part2-10-ecc269f268b7@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1788882939-5A7DACFC-5E31D95D/0/0
X-purgate-type: clean
X-purgate-size: 1469

On 02.09.2026 11:43, George Dunlap wrote:
> --- a/xen/arch/x86/domain_page.c
> +++ b/xen/arch/x86/domain_page.c
> @@ -256,7 +256,7 @@ void unmap_domain_page_irqoff(const void *ptr)
>      do_unmap_domain_page(ptr, true);
>  }
>  
> -int mapcache_domain_init(struct domain *d)
> +void mapcache_domain_init(struct domain *d)
>  {
>      struct mapcache_domain *dcache = &d->arch.pv.mapcache;
>      unsigned int bitmap_pages;
> @@ -265,7 +265,7 @@ int mapcache_domain_init(struct domain *d)
>  
>  #ifdef NDEBUG
>      if ( !mem_hotplug && max_page <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
> -        return 0;
> +        return;
>  #endif
>  
>      BUILD_BUG_ON(MAPCACHE_VIRT_END + PAGE_SIZE * (3 +
> @@ -277,9 +277,6 @@ int mapcache_domain_init(struct domain *d)
>                        (bitmap_pages + 1) * PAGE_SIZE / sizeof(long);
>  
>      spin_lock_init(&dcache->lock);
> -
> -    return create_perdomain_mapping(d, (unsigned long)dcache->inuse,
> -                                    2 * bitmap_pages + 1, false);
>  }

At this point rather than removing this, all of what is done ...

>  int mapcache_vcpu_init(struct vcpu *v)

... in this function (per-domain-mapping-wise) would want moving into
mapcache_domain_init(). The present arrangement, aiui, is a leftover from
when d->max_vcpus could change post-domain-creation. Question is - would
that go against further ASI plans? (Likely the answer is "yes".)

Jan

