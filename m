Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F92CA6007
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 08:05:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443022.1660382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEj88-0000pN-1c; Thu, 08 Oct 2026 08:05:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443022.1660382; Thu, 08 Oct 2026 08:05:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEj87-0000pG-VJ; Thu, 08 Oct 2026 08:05:31 +0000
Received: by outflank-mailman (input) for mailman id 1443022;
 Thu, 08 Oct 2026 08:05:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEj86-0000pA-Kk
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 08:05:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEj86-00ASNz-1G
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 10:05:30 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac74ec8-8faa-0a2a0a5109dd-0a2a450bca38-8
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 10:05:29 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac74ec9-b7e8-0a2a450b0019-d155dd2fb96b-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 10:05:29 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-487048857f6so2273752f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 01:05:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c71c0b604sm10153971f8f.13.2026.10.08.01.05.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2026 01:05:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1791446729; x=1792051529; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mT/WMTwC9Pntbn7PkhRaBjdPQb+5Cm86/PMMKaL6YGw=;
        b=QQ/EFpcl99zbW1885RelSZx7r4o3nnjfNkL9WKNgH91dWVmoTNnAVXeSBV7vpKtjcO
         hsy9MjJ4XfBTk4i7bLIqVWY3u8974wLo0qbRuzUZAiw08uy8X5CUEdJ+fF7QShb9X+IV
         6c6ieBzUOFiXjUsr5V/ti7fE3+yR3uof8dmxzUHPg1k39VGaiFV2WoeSPAf7K/8ZP7YJ
         3FzssjlhKY77yh+ROqnmqlxxNtRhL3OAPxMvc0iVZBu4Fetd9vTT9HYemQ/Q8KXf3Ted
         C1IDQzvbE+kL69ZEbnyvFoPh3JWnguUrc8pLEVRtT3ffhAzqMWo5LfQlwr7crb8l5nJr
         Wxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791446729; x=1792051529;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mT/WMTwC9Pntbn7PkhRaBjdPQb+5Cm86/PMMKaL6YGw=;
        b=XzM/X5eV+gg3NSYYPxGDMsKnZae9ia3Z2Gbe+GYqvmDjcNzBoU7cvfCs/goD6qySuB
         oBXgwFJ0bPls+1prcENWp6QvnWM9KLI7CeWmBW8AAgsuwU3KWzwkG0AtbVo12uwkhWyw
         JrQiy92oD3TjfWhwTYJVVgTOphPw5yOIKT382jVRZOuAJXiAm9alYFKYr71v6Wfl17I6
         wQr+8bFgv1H5ydR9+TzGepplgqq3oVVee7sAiXilKEB30heMNVzlsrfP2dde45VwSAV7
         x35dMhtlB2VvnpL3DV3181EcmwdaPljG4ov/XLvL0+E1zfsuGFftzoZupwTK+UavnEIG
         MM6g==
X-Forwarded-Encrypted: i=1; AKwUvBx+BYHSzv4Kl9Qlg+aKh0A7sfFGJaaM4BEsdz1x/Ys0Yag0jfxwPx269DAKlNUVQx3gw5zuM1FFrUA=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIkH8CAETrhXUByxM3kHbCcxZvxvAMtXMY+mfVlfz1kkqlL//Qa
	aKCjyLOmtY1kYdLpbL6er7EPwFGeeuhmGHZdJSIHN7TxXpxQMBPM87dhVQfcJT6LzmYQclOftNI
	GHYd+IA==
X-Gm-Gg: AYBFou12DXQkHxtsHNz1deR//MouWe0Rt1UUCUNm7QRXPTZhdORJqG3spn02Hc4JYuo
	57/jwuBz8shcPzFDM/R8rHAXQHnzoi8EW9Cp/T9aXuxlzFTV/IvuJfYSxB4BMHe8d37KIR/ljP6
	QZIUtINFwlXlHruX/rWtqhYepJKSthEJsubL9rActg+YtNnHpuHvpCZKmjX32b+jCU+CGzy2gho
	nITAJcl7zJqCAg55aqg27SMbbRgViJDGBofnHUcIcDJpdizPloI78vgsCibagGouzsS+j6LUh6P
	ZkgRP91EGCYF/YCZBhCE2MAvn+Faq33IvXsRoYNhNMF3GrnAgP8U4/T3Fo2gRu/PIxBdZIcVemE
	PqDMPsYizksiNX3NqRgT2qDURb+ggvIuMxnh94b5j/Ty9e0gWE3UkxCcWFjj49kRSbWum5ldXsC
	HfdopD/fT0RIGLyPNLQpr9KNN9soQm2eiKZu2dFn6Y8A/svxEeeBl8XqM8DxrEvvTyPtd4GHXzO
	O3pknQzBhvfe0XSRSnMSWdM1zVtyBDYktqQHGT0dNyI8GY2waak4Xdmdi8+0ufxzVuGwnIZkg==
X-Received: by 2002:a05:6000:38f:b0:48a:fb6e:bc50 with SMTP id ffacd0b85a97d-48c727891c3mr8801688f8f.27.1791446729056;
        Thu, 08 Oct 2026 01:05:29 -0700 (PDT)
Message-ID: <4042778c-8648-44a6-9b9a-eeec138b1d58@suse.com>
Date: Thu, 8 Oct 2026 10:05:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/18] x86/mm: prepare create_perdomain_mapping() for
 per-vCPU perdomain areas
To: George Dunlap <gwd@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261007104051.48841-1-gwd@xenproject.org>
 <20261007104051.48841-6-gwd@xenproject.org>
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
In-Reply-To: <20261007104051.48841-6-gwd@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1791446729-19CC79EA-EE02236E/10/78276251493
X-purgate-type: spam
X-purgate-size: 2820

On 07.10.2026 12:40, George Dunlap wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> We want to change per-domain mappings to be per-vCPU mappings.  In
> preparation for that, we want to arrange that
> create_perdomain_mapping() work either with a single perdomain area,
> or with a per-vCPU perdomain area.
> 
> Most of the remaining callers are already in a vCPU context.  This is
> no accident: the perdomain area has always been laid out in per-vCPU
> slices -- each vCPU has its own GDT/LDT window, its own
> COMPAT_ARG_XLAT pages, its own window of mapcache entries -- and each
> vCPU's slice is set up as that vCPU is created.  For these callers, we
> just need to change the parameter from a domain pointer to a vCPU
> pointer.  Once the perdomain area itself becomes per-vCPU, the same
> calls will populate the owning vCPU's own area rather than slices of a
> shared one.
> 
> One exception is the call in hvm_domain_initialise().  An HVM vCPU's
> monitor table is created during vCPU initialisation, and
> init_xen_l4_slots() stamps the perdomain slot into it at that point --
> far earlier than for PV, where the Xen slots are written only once
> guest page tables are built.  hvm_domain_initialise() therefore had an
> explicit create_perdomain_mapping() call just to make the perdomain
> root exist ahead of that.  Move it to arch_vcpu_create(), covering HVM
> and PV alike.  With a single shared area, the call allocates at most
> once per domain; but once each vCPU has its own perdomain area, this
> is the call that will allocate every vCPU's root before any page
> tables referencing it are built.  vCPU creation is
> where the call must end up; move it there directly.  For PV guests
> nothing observable changes: the root was already being created during
> vCPU creation as a side effect (by mapcache_vcpu_init(), or failing
> that pv_create_gdt_ldt_l1tab()); it now merely becomes explicit.
> 
> Note that we cannot yet do a parallel movement of
> free_perdomain_mappings(): the per-domain page-table hierarchy is
> still a single domain-wide structure shared by all vCPUs, so tearing
> it down from a per-vCPU path would pull the mappings out from under
> sibling vCPUs (e.g.  on a partially failed, retryable
> XEN_DOMCTL_max_vcpus), and vCPU-create error paths can rely on domain
> destruction to free a partially set up hierarchy.  Teardown will move
> to vCPU scope only once the structure itself becomes per-vCPU.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, Claude Code:claude-opus-5-5
> Signed-off-by: George Dunlap <gwd@xenproject.org>

Preferably with Roger's suggested comment adjustment:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

