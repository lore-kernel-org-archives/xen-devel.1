Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B618C79FAD
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 12:26:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412946.1643221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4HO2-00072Q-RG; Wed, 09 Sep 2026 12:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412946.1643221; Wed, 09 Sep 2026 12:26:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4HO2-00072J-Of; Wed, 09 Sep 2026 12:26:46 +0000
Received: by outflank-mailman (input) for mailman id 1412946;
 Wed, 09 Sep 2026 12:26:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4HO0-00072C-Sr
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 12:26:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4HO0-00CRQp-92
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 14:26:44 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa15082-2eae-0a2a0a5409dd-0a2a4505896e-4
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 14:26:44 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa15084-4cb1-0a2a45050019-d1558034e04c-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 14:26:44 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-49b8e527d63so70819995e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 05:26:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858d312ca0sm45662274f8f.4.2026.09.09.05.26.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 05:26:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1788956803; x=1789561603; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kYMa0F1IAPGmOPjH8uSmEseFasQH0wqDn+4S/HZLdVE=;
        b=PPNMlXKX1KSEF5VDEXgJQ7jlAZK+t+PSUrBD+6UX7zbxv4D8BBp7pUZeU/bO3WlLVd
         vC1yKTrczAuidc7m8CXTpMU5mdP55KoP65voh5viIrrKcGMwCxety/D6MT7r72dcgr8B
         p1FtlYgJM+6JuwHRlkAgi/YzXJX3kx2Moy1/FH07jOGsz894mAO3U90HbIied1Iln2I1
         /b2jrmlQng7ifxGNVtDyqiEfgrbXEi8Lp5uJg2ZGMPaInnu3vZ1xljeTchTTS3aGeaOh
         R8+R8e+Uzx+9YHl83wGcpNkvUHidJhnwH1rpcu+mXM+2T2Zp5v5s8qqPcMoPGk6VNeO8
         k9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788956803; x=1789561603;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kYMa0F1IAPGmOPjH8uSmEseFasQH0wqDn+4S/HZLdVE=;
        b=Ru+50GIg3IafEDMj7dEfz36AhURZIUx5cBYaPdVQpj0lgl07j7ddBX5785AfRJwYhv
         jGeKUxhUss782E/pAHi2YgY+0JI4Suvfh8NM3amQ/k9eKCMwQWX6iVB3tk1yn3BU0N6l
         7smR3FpPAtKkpF4GgT1/Aytyqe4F19bl2VB9yfrPdK9+Jlay1jHma9v2rXGnUVXDeDZs
         gJgfoKohiwfuMhusns3Jl9UN1QAoio2lhmEIc8LmXtsNbJEIbCPd9KeJkPSgiKnRRudE
         lcYdgyBGzh99Cf8rFT1FloYPjxYwvkl7uJR6QIz3fUZKU5hzqHaSNhlQWDRQUWZOJ3TY
         m0tg==
X-Forwarded-Encrypted: i=1; AKwUvBxHwWjM4+DYikSLdfotST/YTeQatSKysp1jxyqQG66Hfxr6jQMwPVCsMC2ssp6nUliWkTsC7BkaSww=@lists.xenproject.org
X-Gm-Message-State: AFuF++nv/M05yxUwtV7r+oTcSMWHAn+7T+AsXYr0Yk/hmFnpam9Uioih
	mUuXy/mvTGm8KcdxByOdwNmYribrkUJW25TvFHlBwZq7nwWoL94cogWU0OjWI84skw==
X-Gm-Gg: AYBFou066flKwAsFRfaghkoHbx123pEbKBaaj6CtG816V2otHXZzHC7AWjv9mu4icL8
	LXsStI5wUvpKtBylsJ/hhq6zinozvDbxVSrFBeUuUkpj/TUwsUrB7lG5B0vAruHuQJmllnZG2Pg
	XcbkfTnNUbIQt3Ddq5iFCS0mkTKcvqNuz0HedbuExgrRY7PyiirXiUi1Heh3Gls2KO3bw3EVwFW
	9N0SXHn/I5p+4DphwNac+nShOZ4krsa06A7re2n5qIVZxU38NUGFIMGP322AS9+wL6xPxg46KFZ
	ra6leQj1kcgJGXHJeuKxtj285E3QcGXpFvCVfQ6PnWh8pywQtnLz2LgZN0itVxfgekOREsb9tN1
	p7u8CZaIxurHKmRPQ4Pzd19VJds/c9tf59LJhb1y55218VPBKpAvv/otxlVeRt/bjBhbVLDsC/U
	MAfV4y8W+N8Q6wHc34nUt/Z8qgS6ohYs2so9nYvLLg937O1i5Vh8yvzYonskO2kCx55jH3w5VXl
	lnUgBwFUkgWdADz6aX9aSHRplIU0LNw4y8VnFSNM19CrrAdRV7jKs0WzrwNoYo=
X-Received: by 2002:a05:600c:154f:b0:49c:fc6e:8cb5 with SMTP id 5b1f17b1804b1-49cfc6e8ee3mr358556145e9.25.1788956803570;
        Wed, 09 Sep 2026 05:26:43 -0700 (PDT)
Message-ID: <5e51bf1d-8e2e-4638-b9ba-c192bb97f539@suse.com>
Date: Wed, 9 Sep 2026 14:26:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Use __has_include() in xen/percpu.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260909115342.3376342-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260909115342.3376342-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1788956804-F62AB2A1-153FAF14/0/0
X-purgate-type: clean
X-purgate-size: 312

On 09.09.2026 13:53, Andrew Cooper wrote:
> Only x86 has an asm/percpu.h.  Have the compiler only include it if it's
> present, rather than symlinking an empty file.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


