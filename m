Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B64C61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 06:42:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406418.1639719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2190-000711-Vr; Thu, 03 Sep 2026 06:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406418.1639719; Thu, 03 Sep 2026 06:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2190-00070u-T9; Thu, 03 Sep 2026 06:41:54 +0000
Received: by outflank-mailman (input) for mailman id 1406418;
 Thu, 03 Sep 2026 06:41:53 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x218z-00070o-Cy
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 06:41:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x218y-00BlJk-PY
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 08:41:52 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9916a3-2eae-0a2a0a5409dd-0a2a45039c4e-24
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 08:41:52 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9916b0-fae8-0a2a45030019-d155802cc5eb-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 08:41:52 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49b8ce9b733so14222305e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 23:41:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf2531232sm18597005e9.7.2026.09.02.23.41.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 23:41:51 -0700 (PDT)
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
        d=suse.com; s=google; t=1788417712; x=1789022512; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=opHFwBmqlMiUcGGwdL5PLV8yTv+ErZ+I9vGrfTm88+4=;
        b=GCOPy7kZQVvI6xM/F0Igcyj3ZrKVDq9kZEX/hJ1VVOmmOE5bVcHHfDyz/ZNs/6U+l3
         i31a8VL/l48nRoP4PkR+oWWwNRKOjcKOFEuwuwXng2JIVQQb3psArHmWoWO8UUebyGHI
         G4C4Mw9vU5WM9w+KW+gWo7gpqLCj2Sb/kTjMR/8SZo0tZepbVD+m+gBu8fxTJVDrq7fz
         BuTsL5Px65dfAomACT8ljOb1tHDw7+PH5zPccw+SbsmIoHtiww7Itya0CWWCtLbMGziQ
         n6w8bG3QvjyBZN5LlNA8SX8J7sQo/oC1wpoFQyMIFpzVNJA2XowEWVrw+hyiy7XJoxkB
         C8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788417712; x=1789022512;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=opHFwBmqlMiUcGGwdL5PLV8yTv+ErZ+I9vGrfTm88+4=;
        b=UYRmFHaCPhfYKTfteN/UfZWFTzVWz5aQ90UgrcqclyQUm/HFecSTpse4pZ9isf/OCL
         y7r8gCuL11zSULuGBLjZFXAegc23BJf3RK55pPnCOIxeho10NP4wLq9KJZDAG2zBLkSR
         44fAQSoXI+mRkWgT98A/hEobcONmcFOrU3/GC7dGA3r5vW7umiASrKEg9eB4W7U8h6+D
         rlvh6cG2Pp/XqpmSg6gKDC3GleYwRMDyHaPnn7WNEErpJ4QpKKeyz0ZpoSkMXXFdE54G
         xFQ77phtJBSK7QP79mA6kO9pzvOrAg+clcpZ4UzazxPmUwxGAChOl3dssVPNYDST0LCW
         F19w==
X-Forwarded-Encrypted: i=1; AKwUvBzS1amd78VOMqtWb0yUZDbL/uGmT1crIQZV9vn1vOvJ9LCvnN5liDlz/mGAtoaiJuniJ2pbdoX/WPE=@lists.xenproject.org
X-Gm-Message-State: AFuF++kuWEei74KRvzlxArZMq1ngfwyYylq02x+QTep4XjYjgjk+W4dM
	7o4guv/xgRGJO/3kZ1uyum/MuPPanRZ3E9ssK7z4aXerOBuLqR4HwL+WxWYY2Zj+3w==
X-Gm-Gg: AYBFou0/D6RQ86EfwzCSh/fb644OCMTCLZv5InIAYTQXg2jVt25V1rtNuVlmco92RY9
	tlcSyVsEnda/ggQIKkNYs35WdJBJPUUwUNywVBK1laujBEgoANpuOZtp7OHxjdyEfZffbmfdGF6
	2HGFVjWwx6oej/iwGrA62IRJhEVyVmFbgJURlg7tuy8HDzMOqGgZzsr9KVJJy//fAX7edxvqRB+
	34mtZJ983yS0wRJ+Ckmr5nW+AQqEJ/gJVUhZaQkwGxK5mybWQvD3L99jTi1oiCzA0Wc84/+yy1i
	eN7cMoSUqOCM/cDZAJpxBtcomhFTbrDRQo/VAOmeaRz76NxqWaKMo+QUMvvqyil7dMjdnNWscJc
	Y/Z93aQq4I48nQ40WdkOxaas2loDuTWw6d52pfS4Mp7Z7htnwm1TuaX9YZ5kDXqIvTRrwkNK2p5
	q/ALiEH6/aEGnztNn3GF7W2Bhvjja2KPyxvv2I0Ah4u2bUvy1u/ocdwx7sdybRCnuuf1ADlBL6C
	ka1jFKtduSwdD+40GoMRCXZCAq4GYG35r+2JgpG0swpINwPPZUp
X-Received: by 2002:a05:600c:a417:b0:49c:eb04:1c49 with SMTP id 5b1f17b1804b1-49ceb041c7bmr159708215e9.13.1788417712087;
        Wed, 02 Sep 2026 23:41:52 -0700 (PDT)
Message-ID: <624b7832-873b-46a7-b1a8-9e7c20f45c07@suse.com>
Date: Thu, 3 Sep 2026 08:41:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ucode: Work around Granite Rapids erraturm GNR98
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260902221000.2967167-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260902221000.2967167-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1788417712-754844E9-FB521220/0/0
X-purgate-type: clean
X-purgate-size: 1429

On 03.09.2026 00:10, Andrew Cooper wrote:
> @@ -273,6 +274,35 @@ static bool microcode_fits_cpu(const struct microcode_patch *mc)
>      return false;
>  }
>  
> +static bool microcode_safe_to_load(const struct microcode_patch *mc)
> +{
> +    struct cpu_signature *cpu_sig = &this_cpu(cpu_sig);
> +
> +    /*
> +     * Treat pre-production as always safe - anyone using pre-production
> +     * microcode knows what they are doing, and can keep any resulting pieces.
> +     */
> +    if ( cpu_sig->rev < 0 || mc->rev < 0 )
> +        return true;
> +
> +    /*
> +     * GNR98.  Granite Rapids systems hang when loading new ucode on
> +     * sufficiently old firmware.
> +     */
> +    if ( boot_cpu_data.vfm == INTEL_GRANITERAPIDS_X &&
> +         boot_cpu_data.stepping == 1 && (cpu_sig->pf & 0x95) &&
> +         cpu_sig->rev < 0x01000405 &&
> +         mc->rev      > 0x01000405 )

The erratum text says "to 0x1000405 or later". Question is whether that's correct,
as it would mean that it's impossible to update from earlier than 0x1000405. Then
the workaround text says exactly this.

> +    {
> +        printk_once(XENLOG_WARNING
> +                    "microcode: Granite Rapids erratum GNR98 detected.  Skipping ucode 0x%08x\n"
> +                    "microcode: Firmware update recommended\n", mc->rev);
> +        return false;

Should we additionally taint the system?

Jan

