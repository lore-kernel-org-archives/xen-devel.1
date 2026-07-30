Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA8EC55162
	for <xen-devel@archiver.kernel.org>; Thu, 30 Jul 2026 15:32:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1378034.1623687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpSjd-0005kP-1D; Thu, 30 Jul 2026 15:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1378034.1623687; Thu, 30 Jul 2026 15:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpSjc-0005kI-Ud; Thu, 30 Jul 2026 15:31:48 +0000
Received: by outflank-mailman (input) for mailman id 1378034;
 Thu, 30 Jul 2026 15:31:47 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wpSjb-0005jw-60
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 15:31:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpSja-000REa-IV
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2026 17:31:46 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6b6e62-5cb7-0a2a0a5109dd-0a2a4505d35c-2
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 17:31:46 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a6b6e62-4cb1-0a2a45050019-d155802ed0ee-3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 17:31:46 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-495757ccbc1so20505225e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jul 2026 08:31:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49801216694sm63565325e9.13.2026.07.30.08.31.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2026 08:31:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1785425506; x=1786030306; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=viBYRoSDI7ee1BZStIOQBNdO7Jplt9GiO1VVw1iopGU=;
        b=ArBG4mu4CGb0uvW6NAG/CJMQOaSL9e17nFLIp3HeU4D+/obbK20iiCEfCkPk30fJSy
         cXrISxHmw6anvMXC7vycxo/sZV2joRlMjRdIFob1JwXKUJQy74Izsm1rfCchN4DVVPUv
         GYXPL9vCt5D2cwjj/899lq1yDY8f5QLQJaOIkLwupSVMTwdzxWHsOM8vd1YyRf6RlYD8
         +wOhHhGPyKfsnjAj3uv1X3UFpcY0130ULnWt1zZ5P9AnfUrMhsYnE7KsQoV4dWenEGMd
         xoAe4c+2O55TQm+Xp5GN6H2bw5le8DTfP04xwARunnbFCGzzMloNYRAIp3REMZkOAYmE
         r8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785425506; x=1786030306;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=viBYRoSDI7ee1BZStIOQBNdO7Jplt9GiO1VVw1iopGU=;
        b=BSFUGV0nUGFEkpDBwR+R9uEwupGk4TPOFUC8dIWDzLp3lVzv2HK4tIYejitEgnYf1v
         ZuqcecnwnRIOlT/3RAp+vcwyLZx47/0uTPxup/TYXg2YI9B+WeETqBdosVvk0zUinsgC
         zej1dZhRwaBFLMKRKKiuVb/l8ZVsfeefmu6vBoDCkL5aViiwWt8UhEbvarihb8EPlr8Y
         6w5PDW0R/VIfHzsr06TFZJiv6Um6cDmhmsjEIzp8QgUHDjWtc4IxCkkB+8PlQPuH5ZOo
         a7It5lXSsSN+3VSR/3wbD3z0aGhJ+IIQcMY8At22gny9UVeoa7GKoIvUiS9Sl0N4tZp3
         T5BA==
X-Forwarded-Encrypted: i=1; AHgh+RqImLnBbQ56X4vufp7sAIEwpkfNVo6FTAbQxYemzwIy3gfmxd5kTQQN8SM6Jly1mg0C6lSDvyOxObc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHP1ICkhFOdaqhGCaYnUb+aKZJQgxzXfWsBbO98VuZKoMMPT6u
	PmUenMGZT+IMsBXYy6WmJF7kRWY7Pv+IiBCx1mQdpI68PSwBiymTv9OpLjtSeRknfQ==
X-Gm-Gg: AR+sD11KJcQJ3fKcr8E0UtWesZI8TSIUqDUY7CDlgd5Lv33vpD27iJOUNbXgv5GqO04
	wd27btTdDBwDK2O5Tm4GaAIEM+b2GQVEV2+KVmfiZCqW+c361jathyRJUR9bmnLSAp59TFMzZ0r
	XcBTb82YGzibLLjDI8mAkE9puLyg//hcVvcbTsxgTexdw4WhV2eCvaqBxvpD9+0UOxAV29julOM
	xr17qcxH6W/Yeq8n27EfK5ijOvth1hEHlI35T172xZp3hG39VMPk8BMG3cZgawv/DnHrE75uAlQ
	NQG5Mt9TbFgLTt2E4RPjlbf6jICr0ACtW6ovmPLT2htYwKTZJU6MN2O8TZ11bPyARTYD6B/L7Dr
	DiuLsCownNU4zt+JXmJRBTqt2TOKYJcL+fF/ypf1w3vtKNI/IVF9ZPJhi/2tx+RJ9y48HnH5W48
	afeJjOjBFlp9NMcRWxic/uqCVuqeBufPG5V0NEykoDnKNS+dbYXEgOd7CP7ZT7U9nGxChgWIMjR
	uJprJQVwWxnImJ7BI6k7kq53QQV/9iYN05OYeVobAmItjFIxpVQobntm262Eic=
X-Received: by 2002:a05:600c:4f81:b0:493:f262:b8 with SMTP id 5b1f17b1804b1-49800e6d286mr40910955e9.1.1785425505917;
        Thu, 30 Jul 2026 08:31:45 -0700 (PDT)
Message-ID: <f46bf144-b602-48d2-a170-58944d17fdbd@suse.com>
Date: Thu, 30 Jul 2026 17:31:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Xen/gnttab: adjust two uses of sizeof()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0ddff6c4-7ec7-41a9-9417-687ca16aaafd@suse.com>
 <d360b101-0368-4f59-854b-2cb881e5d552@citrix.com>
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
In-Reply-To: <d360b101-0368-4f59-854b-2cb881e5d552@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1785425506-72EB12A1-15F083AC/0/0
X-purgate-type: clean
X-purgate-size: 703

On 30.07.2026 17:25, Andrew Cooper wrote:
> On 30/07/2026 3:57 pm, Jan Beulich wrote:
>> The use in gnttab_map() is latently buggy, as "frames" there is
>> xen_pfn_t *, not unsigned long *.
> 
> ARM32 has 64bit xen_pfn_t's.  At least it's wrong in the safe direction.

No, that alone would make it unsafe - we'd have allocated only half the
size. What keeps the problem being latent is that the problem is on the
PV-only path.

>>  Adjust the correct use in
>> gnttab_map_frames_v2() as well, just to avoid the problematic pattern of
>> sizeof(<type>).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

Jan

