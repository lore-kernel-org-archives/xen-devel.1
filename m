Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACA3C44506
	for <xen-devel@archiver.kernel.org>; Fri, 10 Jul 2026 10:07:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1359025.1612813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi88i-00016h-Ur; Fri, 10 Jul 2026 10:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359025.1612813; Fri, 10 Jul 2026 10:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi88i-00016a-SH; Fri, 10 Jul 2026 10:07:24 +0000
Received: by outflank-mailman (input) for mailman id 1359025;
 Fri, 10 Jul 2026 10:07:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wi88i-00016U-96
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 10:07:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wi88g-00ERsZ-Sh
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 12:07:22 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a50c44a-e002-0a2a0a5209dd-0a2a4509ae92-44
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 12:07:22 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <jbeulich@suse.com>)
 id 6a50c45a-b440-0a2a45090019-d1558034c5a1-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 12:07:22 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-493c7902f47so6340225e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 03:07:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f4cbc620sm27552005e9.13.2026.07.10.03.07.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 03:07:21 -0700 (PDT)
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
        d=suse.com; s=google; t=1783678042; x=1784282842; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tpya6g8/Y41yLP57PF3RM6hdddwH9RFU9CqzacrXAb4=;
        b=OXA4kg8z6U3VtVTuRTch6BJ0BccidyEROuCOi5upHE+FrG+pE5l/9qJ6KqEQTwTTDB
         uDA854AwaNO1jS9Xs0wqIALeWIatWFgkEgJlkNkfqWFq56mVIN1iq2cjok9ypF7VHfKg
         xlUGA8+nDLRtV07ucoDNqdQW93zAPgyoXTX2bMQuarUoAZxQfN/3KdBgX0dw0V4/o5/Z
         QYCoZg9pN9jT3gRcbXvO8MbHF5FYIk8q2PInGPSUwn+xz7C1gKY39EE4fTbljkDjmIr1
         jftMQXPtTbdKM65JOVuWxrh7rDfONH6FbtyNV4jWUS6AWECtKn8oBqjDmQDPMV0So5Ae
         bLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678042; x=1784282842;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tpya6g8/Y41yLP57PF3RM6hdddwH9RFU9CqzacrXAb4=;
        b=fJziCiuvMEPotL/gvCNBmyEU9001GMh8CzIcQBB/xi+ewh37SVRbqO8wDIrQLPG7pg
         WmApe2bpQvby2ln9c9aDultX4oMxNdwO638H0YRmXePdVqdtHxe+SNi0XgNs05F6ZP8q
         poO+g4Q3zT1cZ8/J9shUiAEUbvCk7aAUI6MGNSadzjkcamdk5WQRtxRTCX26MAcSKISv
         l0rIm9HpRq62VKdH6GPFUb8vdRR6VjsA0EdKLBEuOpYHG1j4PdZ0anbdGhv+5PmX0eZM
         8R3RARNU22UMsasvnp4xYpUcOfqst7vDhHOAc5zlagSOJ0WVQgDG4zkjR44htDcE+v0j
         vUKw==
X-Forwarded-Encrypted: i=1; AHgh+Rqkrup/y+EZsOCxHTfuDRk8i8tNAdD8/Qh3IVUpt45Aw827fq/6Pecb5VGIu3XPaOh9Q71ciA+DPWM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuJNiW9h4pjLZWPEEpKNSvvLNK+JHUQNUaqDUlIY0HRiJs1eWF
	QKXlTtoKZyLBx/4Z21lpA5x+SutNvuOVQk6AF4NP8ClkSe+e0h9xX6C/LqbnnZs3ZA==
X-Gm-Gg: AfdE7ckrzvoI9rr1SfFlLP5Re/+1Kj3SVNN4n276Wtu00ud9LwmB/bdcwBm0x8yOavw
	7i77q6QE/Kj32b6zdFLu2lZsvfy8/gxlOypDMRrFKo6gnFTCuW9u0eK+HoYluHPT0V+xVSo/7ij
	TLFW6JkmI8hKTlUmNtSWs0TWBGtAqS4kYQ9bHOGugc7tj1dyN1fy2o0gNQk5XX1/IAbvRFXd6pb
	DCSY4OCwB1Q9OgSt4mTvkH67uZnrY/qx3OBBlumx9KOCMDGe9hxsd3NkGVo75s0uac5Q94E6BId
	jh48PjQ+ZoaZuqDvNK9joph2HHUfDWSTzca86jXbxPZHBZ8W05bTl2VKLpZ/dJS2ilscoFBP3Ep
	hGZzVBuSsVw2n1Vwom/Zgz5dNxvWW+lcs1/aKhCrRaYnJRjyNDtwqkLM2dPKGDg0YOBd1YJXQvs
	ge7CV1YnXM2nqA2vkep1njulIpOaAU/Cyon3sPdrITZ6488jVVk2zyK1f58MculiWyK/Sm/aaOL
	9H2
X-Received: by 2002:a05:600c:1d0b:b0:493:b6ee:fcb7 with SMTP id 5b1f17b1804b1-493e68432c5mr107827595e9.14.1783678042061;
        Fri, 10 Jul 2026 03:07:22 -0700 (PDT)
Message-ID: <e120d275-ec94-41cc-9c54-43966cc18dd8@suse.com>
Date: Fri, 10 Jul 2026 12:07:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CHANGELOG: add Arm and RISC-V entries for 4.22
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers @ xenproject . org" <committers@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <3111d0f6481046f6303e6d564ebafd381d763815.1783676659.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3111d0f6481046f6303e6d564ebafd381d763815.1783676659.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1783678042-5FD67A0B-673F0EDA/10/73395122804
X-purgate-type: spam
X-purgate-size: 1135

On 10.07.2026 11:45, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  CHANGELOG.md | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 356be88351a9..c6f1fcf5aeec 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -46,6 +46,15 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - On Arm:
>     - Support for guest suspend and resume to/from RAM via vPSCI.
>       Applies only to non-hardware domain guests.
> +   - Armv8-r MPU support.
> +   - Drop ThumbEE support.
> +   - FF-A v1.2 Support.
> +
> + - On RISC-V:
> +   - SSTC extension support for Xen (not for guest yet)
> +   - Add support of CONFIG_DOMAIN_BUILD_HELPERS which allows to load Linux
> +     kernel, initrd and allocation related things for domain when device-tree
> +     is used.

The first item maybe (with - nit - a full stop added). The second item I'm
having a hard time seeing how it could be relevant to anyone, until guests
can actually be created / started in at least a minimalist way.

Jan

