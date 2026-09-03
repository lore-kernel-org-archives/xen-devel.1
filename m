Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8962C624A4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 16:11:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407514.1640570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2A1q-0003Q6-Ok; Thu, 03 Sep 2026 16:11:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407514.1640570; Thu, 03 Sep 2026 16:11:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2A1q-0003Pz-Lt; Thu, 03 Sep 2026 16:11:06 +0000
Received: by outflank-mailman (input) for mailman id 1407514;
 Thu, 03 Sep 2026 16:11:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x2A1p-0003Po-8p
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 16:11:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2A1o-00FNBn-2m
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 18:11:04 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a999bf9-2eae-0a2a0a5409dd-0a2a4508c6c2-48
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 18:11:04 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a999c17-f659-0a2a45080019-d155dd30a405-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 18:11:03 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-48586861639so1359f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 09:11:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448ed3716sm15980462f8f.22.2026.09.03.09.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 09:11:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1788451863; x=1789056663; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=clKMydZ7WjR5FV27BAvQbyuJnT+lNT7hRz9cPF4o8F0=;
        b=Hgzjob+bKkLFe6fKVO7xzitNh2iZM2SmHV34NJ3+gKlXG7ShbePzjBvbra7UqB9ZgB
         FGwmeJ0ISZQOdFU8F+o8VJWCBemqHor8nRyOa0cBNv9hMVKa+WCdPpDfyhZbUDnvx8Hy
         qYrME+9tPMJ8kIf8TDlkW0EntakCIkyx+GOmCTq1Dchi+JkkI2j1cXzMr8UztgAVepz5
         pBbUivKiCR7H8t2S+g0anATwFvnx9PlqnkWtkRrJY+JE18KJndFLQ4DFwGJJFGqKg+Lb
         8Y7OGki3c/RIr2RHpbqj1yiGx9cL3gYlepI2Gu0Yzyki0j5xBdufVoZlGHUvvmZlMY+O
         vwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788451863; x=1789056663;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=clKMydZ7WjR5FV27BAvQbyuJnT+lNT7hRz9cPF4o8F0=;
        b=ILDBPyhpKlA70+vW899ALwC7knbHFjPi3acNd/FhLXWJofKZZh6E5qzZQb4/D8vSgO
         yeUa/9aGHIK9R24Ok1QX/G5LBwHMfwNzg+mqX36/7EPoiVy02HMRO8x2L5jePioBO3H1
         nKYcLGGTfuCzOQv5YHnRehAJ+XoV8+KeavURI2+RzC9B6ZAkc1DY/j7SVVAbdaH8PI4w
         mmzpzbDjV3sUUnb4F2HKeoIpXYy3PK5UF4oFIZBD7epqBJOxgtO8rkl7QP27Wz8fIeNZ
         Fwr+QTAa3VgzpxkMZcsutG04EOwPfA+q4GYa3gsqzJN1bQIqh9lycq7QP2arWD+e0ebS
         JJhw==
X-Forwarded-Encrypted: i=1; AKwUvBzjYk1n2a4eSo/4DbBgk48umsNy+rf3nZH48xbMMI2vc9NfWwmQv7xBT6ZqNPgYsc4qjf31M8r6tzA=@lists.xenproject.org
X-Gm-Message-State: AFuF++mJIbfwpOlnfr+c4CQaoXCkocl48mheNXxosNyYiTM9n5CzzPWt
	w6irOeJWuzNn/8CaKDuAZWb3KYkUxGz04IQCStTKdaEQaonwQGIZymGNuRa02yo21w==
X-Gm-Gg: AYBFou1CknyT59iIfo47fal11RgyPS4mjI4UAGoDhGrxcPlhVHqOrFig1at9DMuc/7f
	QntgVahG516rEbaxPIX3JahRFkfYuZK/r3T+gopvo6fs/l/ccW+hlukM3MMQwDI4B05V2zRLCHK
	C0BYbsQlTQqB2IOig4lDR6AS30tC04G71MVcuJG9cX2KeTETZ2yMbCkDpblKqnXy8iJUj0nCODn
	H/wUTHX++ZUO5s1Oc+sgLiHBZOHjS+jw4QeTZh6oxiTe0edD0CfLJhKGjAkCJDWbACv+2A0ucfO
	EnSepcj1W7PmAWY6dTEclSxRh6raBwktYVQB4R6shJ66eE4YQgkH6QiXBHy4HkeE8hz1wVyZ/GD
	yCv9iXCfyg3ooM6k8A0/lHEFr6Zymf21jLstcJ5Zlfxw2KyNLVtKJwQ84im5hkh/fkPloOMqg6W
	ZmkDWroGSZ2NZ0NB6hIlBtIgtU95g5yTR0Ax/bNoh7LCvG0ziDeVHQF3seLT67l3yxixgKx4LhD
	VX/AzwABv/j1pzV2yLPfDIcls6F+UnL82MA8fuWnCNbj5YxYtuZz1AsuScJR6sj
X-Received: by 2002:a05:6000:2310:b0:484:42d7:50fe with SMTP id ffacd0b85a97d-485823163d4mr4977325f8f.4.1788451863316;
        Thu, 03 Sep 2026 09:11:03 -0700 (PDT)
Message-ID: <554687e3-1fab-4d23-9a4e-0bdc3bc1fc60@suse.com>
Date: Thu, 3 Sep 2026 18:11:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/14] x86/pv: use populate_perdomain_mapping() to map
 the Xen GDT
To: George Dunlap <dunlapg@umich.edu>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Alejandro Vallejo <agarciav@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
 <20260901-asi-part2-3-ecc269f268b7@xenproject.org>
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
In-Reply-To: <20260901-asi-part2-3-ecc269f268b7@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1788451864-DFAD487B-D1DE0C07/0/0
X-purgate-type: clean
X-purgate-size: 2142

On 02.09.2026 11:43, George Dunlap wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> Currently, update_xen_slot_in_full_gdt() uses the stashed direct-map
> pointer in d->arch.pv.gdt_ldt_l1tab to update the incoming vcpu's
> page tables with Xen's GDT, by writing a stashed per-cpu copy of a
> pre-baked L1 entry (either 64-bit or compat version).
> 
> Switch this to using populate_perdomain_mapping(), which doesn't rely
> on the stashed address of the l1 page in the direct map.  Rather than
> also stashing a pre-baked value for the payload, compute the mfn from
> the per-cpu GDT pointer at use: the conversion is a handful of cycles
> on a path costing thousands, and computing at use removes the
> parallel {,compat_}gdt_l1e bookkeeping along with its boot-ordering
> constraint (the cached value could only be generated after Xen's
> physical relocation, and had to be in place before the first context
> switch; a use-time lookup is correct by construction).  The flags on
> the final mapping are identical.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8
> Signed-off-by: George Dunlap <gwd@xenproject.org>
> ---
> Changes in v2:
> - Drop the {,compat_}gdt_mfn caching entirely (suggested by Andrew
>    Cooper): compute virt_to_mfn() from the per-cpu GDT pointer at use.
>    The PDX lookup behind it measures ~5-10 cycles warm against a
>    ~1,500-cycle context switch, and this removes the double
>    bookkeeping and the after-relocation caching constraint.  The
>    cached-MFN assertion goes with the cache: a use-time computation
>    from a live pointer needs no staleness check.

This looks to contradict what 564d261687c0 ("x86/ctxt-switch: Document
and improve GDT handling") used as justification to put in place the
caching. Also Cc-ing Jürgen, who also was involved there, for possible
further insight.

Functionally the change looks okay to me, but the above will need
sorting, at the very least by specifically discussing why effectively
undoing that earlier change is okay.

Jan

