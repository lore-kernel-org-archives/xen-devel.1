Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E263EC79F9E
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 09:03:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410712.1641506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3VFY-0007L4-Aq; Mon, 07 Sep 2026 09:02:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410712.1641506; Mon, 07 Sep 2026 09:02:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3VFY-0007Kx-6X; Mon, 07 Sep 2026 09:02:48 +0000
Received: by outflank-mailman (input) for mailman id 1410712;
 Mon, 07 Sep 2026 09:02:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3VFX-0007Kr-Kf
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 09:02:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3VFW-00CGCP-Rb
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 11:02:46 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9e7db0-2eae-0a2a0a5409dd-0a2a4502caee-20
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 11:02:46 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9e7db6-6ca4-0a2a45020019-d155dd2db558-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 11:02:46 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-485843aeab8so3660015f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 02:02:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885bbb51sm28002855f8f.30.2026.09.07.02.02.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2026 02:02:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1788771766; x=1789376566; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qsOUt6UxOYz2imrFrcbysjwwValjgsYgX7ewlR2PANM=;
        b=Tjkc2++KcXq8NxnoHvcHQOMPXRI8prxZiObYZA9XRvvvyDSrTf4Mroz5v2uXH4hN1R
         U8JvV1YyWJcHVmnbXLV8rmhLio/Xw1gcveBnKgUtlMws/8Os11Vv8b8pJS5C7BnAbmfU
         SdWSmykqHKr0P37AYV4gGcO08pUR6vZrIDDdE4xyG5G+4DhqZi9j6Y4QhBj+PgCwa1/U
         cp+1gvniDHjA65wlFKOQPX8g2kYkc0DmGa4ph94nlSRJnvQJX7YJkLnr/u0y6xD4BN+z
         fGfs69sKGv9ZV5Ik77F4X2Ihd0ca1Cmp433k7Spnt1hnxWmHcnIeXPyMh/mkNgJ5YbPS
         g+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788771766; x=1789376566;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qsOUt6UxOYz2imrFrcbysjwwValjgsYgX7ewlR2PANM=;
        b=eEo9/VvEAnBTQlXsWU5on3OaDQ2vAmKIbf20mZW72P0jBNWk6wjFwppqHIKx2PWCMS
         mmLrBV1mdWJdM8FBlZBWyuAWtF92bM3fJl2wlrw0eG4d8riBS61wA1k9IXp53fnN5XCF
         BMYQe1IY3kqrpCAjKh7Y5nezztg5/WhgTuvB8jB7Gntf/0Ks1v/SNZAP906HDcDyeSBz
         VdCKkICZC/42cF7+sfXEF3GD7oFIoNC1Qkgd4qGSYKeWJ3Y7KvzuPKMJHWmcWDh2nukK
         xq1wLjbrnRIsKt5W7mcp/dCT0QS74JKII11TkSWTY2rY66tVgP5YKzGsaazz9MdsmYnY
         XLWQ==
X-Forwarded-Encrypted: i=1; AKwUvByVU386WHRve6P9Mn22mrU71tCp9b9jc23MUO5k/YGWByRV0Q3GFTIkGVTK9fVQ+vXeURo3TvmrrSU=@lists.xenproject.org
X-Gm-Message-State: AFuF++nTSmcPudo/1RRvYncbNV6tIHRejxs99JLxfa0fH+9MxcaMU8Vs
	cSwQPj3BV/z6/zDgpGJDnM/cvK7+hS9wmedC3F/4rLI3d9q+Z54mScnomYmSWZVwKg==
X-Gm-Gg: AYBFou0emQoJZoBj4T6PhLQyO054Mie9yfV6TgXSCRjq++JdyYfmFTgjN/EnqtkU+2T
	oToPzqZeBuMwq3lJ3uIxn25gLVLMxZ1hATeoVw3MK2WJUjwPV5GO3oUEWmgvPmQHUj04io9nzRE
	B3OLCZ+6B2X6rhgb+4+4TsdZzhUge7YojW4HeJ/38a5QprNRWquvHkLbMaGsdrcUfT4uTqSCnHN
	vFQ0GGYUlMAbpqxj6sKlS6IHcDk9EkpH8wSb2hSqWGfcud0XR1YBXrqIoxc7DHNQ+C+XopzrIW1
	73MKFNOVTzfNm1JADCLG8Crsl2XTweo6E+qa0yj2tOA9V8LE2Ft/pZ6U6E2v1b6QIE5Au4j1T2H
	TCOAf65vtd8XNgLbqLLPz4E+uRM2qkQ64OEgNs/loOcz1rWx1umvxgv9jAZW9ywSR/tH14zBmL4
	fLsVEyN+S72XP1Vcdm/oNyFa5DWTpGACOf7NxpXPBqN0MLgkcjlnE+wFVXmAvJyDOX3efF2IMeK
	cM+KVaEs95rEnQVRttXxG5TZFvlTYV+2JbGLUJm0j1zSrLf38v+
X-Received: by 2002:a05:6000:41cb:b0:482:f61c:7cdd with SMTP id ffacd0b85a97d-48586e4a6bbmr45364305f8f.4.1788771766197;
        Mon, 07 Sep 2026 02:02:46 -0700 (PDT)
Message-ID: <db00bf99-31b4-4410-8a08-4b285f4f85a6@suse.com>
Date: Mon, 7 Sep 2026 11:02:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] x86/viridian: Implement synthetic timer direct
 mode
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260904141516.367862-1-ross.lagerwall@citrix.com>
 <20260904141516.367862-3-ross.lagerwall@citrix.com>
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
In-Reply-To: <20260904141516.367862-3-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1788771766-F2AB52AC-34825D84/0/0
X-purgate-type: clean
X-purgate-size: 1235

On 04.09.2026 16:15, Ross Lagerwall wrote:
> @@ -368,11 +379,18 @@ int viridian_time_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
>          if ( !(viridian_feature_mask(d) & HVMPV_stimer) )
>              return X86EMUL_EXCEPTION;
>  
> +        new.as_uint64 = val;
> +        if ( new.direct_mode &&
> +             !(viridian_feature_mask(d) & HVMPV_stimer_direct) )
> +            return X86EMUL_EXCEPTION;
> +
>          stop_stimer(vs);
>  
>          vs->config.as_uint64 = val;
>  
> -        if ( !vs->config.sintx || !vs->count )
> +        if ( (vs->config.direct_mode &&
> +              (vs->config.sintx || vs->config.apic_vector < 0x10)) ||
> +             (!vs->config.direct_mode && !vs->config.sintx) || !vs->count )
>              vs->config.enable = 0;

Personally I find conditionals like this one ((a && ...) || (!a && ...))
pretty odd to read. Imo that's a case where the conditional operator is
quite helpful:

        if ( (vs->config.direct_mode
              ? vs->config.sintx || vs->config.apic_vector < 0x10
              : !vs->config.sintx) ||
             !vs->count )

(Of course further adjustments are going to be needed here to address
Roger's comment.)

Jan

