Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C25BC61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 07:57:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406508.1639783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x22Jk-0003fC-J2; Thu, 03 Sep 2026 07:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406508.1639783; Thu, 03 Sep 2026 07:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x22Jk-0003f4-Fl; Thu, 03 Sep 2026 07:57:04 +0000
Received: by outflank-mailman (input) for mailman id 1406508;
 Thu, 03 Sep 2026 07:57:03 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x22Ji-0003ey-SH
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 07:57:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x22Ji-0001cr-8i
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 09:57:02 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a99283d-bab6-0a2a0a5309dd-0a2a4503e436-48
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 09:57:02 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a99284d-fae8-0a2a45030019-d155dd35d16d-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 09:57:01 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-48433e9562bso430916f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 00:57:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448eeacbbsm11480338f8f.30.2026.09.03.00.57.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 00:57:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1788422221; x=1789027021; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zwVC0s7RgBYPakJyb8PmnZCruLYy2tXNZIysC6TdEIM=;
        b=WQAGKHHLcjsVnfxlOYOWPM/oaQJHlNMGORCI2yA/r2XTwbc2fn98dtZJxQEODyJXD6
         NvmEAy5YRkgyJE82LZ4kcOYFIx+R8X+xOfv+yMrmgl5ApX7CTDlhqADCdqOJmekYQ4dX
         uEQGzl0UEtgjmsoUOJvhxVT7zXJJgSbm2SFO69OtMtmj9SbAjSkuOjwvrQbnj6Pb16UF
         orVSBpsqWreFsdkWqXvxtu4E5/zAwdyX9Ql0sIloMuTgRpe/c9DnCp+d0dCe7JRK7laM
         DFwOpviZscOJzntAnmOcSYV4M42bMF+JBagZUmd944UdW65vkSFjOmL5HYoegOwP0lkG
         9l/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422221; x=1789027021;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zwVC0s7RgBYPakJyb8PmnZCruLYy2tXNZIysC6TdEIM=;
        b=rYvOd9lpepun5sT0BGnTfwJcFKICcXx41SfkU2+oaJ9O1Zyw34xJm2l51YTUupqLbN
         UdQ8Qw6Zjg5zSx8Gj8svnuE9goEaKgHAi6vDYP0RsMyQkjpQFRftTgjO2KwTYvGTrtYg
         OEZ0O04a9BHW/Ucr+zWO0+tHKKnsAlAoAdWXAgNYEzAeCv+CYKTXwDFXv1Oxu0H2cql5
         h1oxbwrGPgcU5hRbqg4PiMto2S2BTipSirAD6Fec5+AHyaSSNYTn8/SkinrhE7g29xwp
         Q4zke4COIulgw5GUalSv5qjdCfln+2PU2/VpTsqpwEsvpZH4ggLMzyXeTFFTKb4qj3V/
         lhGg==
X-Forwarded-Encrypted: i=1; AKwUvBxZ5uwubczKOGQYJWf2MHkpvb/99cRtk4JJ2V+22GHD52vGR4nBFyf3oYvkQ7xOaaf+2GdjcAmSc4k=@lists.xenproject.org
X-Gm-Message-State: AFuF++k5udth/r0alw2Ug19m5yHrfQaTP+vh26hJ11kH61Myzuu6e0jE
	pyvZKl2mUvSxYwjfxX/7dN0Q+QlCIaZH4bT4AX/z40eE/CsooyGMuol5MFYGodczXQ==
X-Gm-Gg: AYBFou2cXz0BPZD0UFi8hGi0OPWl3GFRuDC+h49oosnGEPkU4Y7qDe1HNx/SiXcnuSL
	c7/9zUeAzBoY8wP2/O992T4r5dlCgtt6A/nrm6irDSTMxafVZNY8pkfZLiAGRUP3uBKj+eYxIJh
	OL/75n5NfvwmQ65OfLNRTjF6A+gJ0oRWa1T5RUfSRmc3oAChUZeJBp0xqteUKVfSKtTIb/w9W78
	8fEie/Y9ccTS34bxmtXeSfxA11XVi3/NpiVYKKZwFhq/9Bf3XfS3u5GaoiwFht9P1tGcQ/Bofel
	pmh3pTwCJuj2ZvcFz6T1JmNUHORE/3J8+RgQcto+5z9mRNVhlGWxP+K4Bb8KRey6FTVZGmzteV4
	AqFGR3QCPAXDMZ41AELps0muc/ufwMETbAhW+LjIpR7VqaPw5U5b8LZJtsQQlQ4xF4TNlw0ghMx
	pWVyypyWVpNfOop7nOc6uMk9nxnZ/qRybBENZU51L82cq3E1UKweuQAKLN2o0PvgQsH6ZAlMMxY
	M7hj8k8zZRVO+hoIP5Nu/tgmv481WEtx9w/yAXSFpGm0Q0OMc6+
X-Received: by 2002:a05:6000:22c8:b0:484:4779:bcdb with SMTP id ffacd0b85a97d-48488deb822mr19125762f8f.6.1788422221346;
        Thu, 03 Sep 2026 00:57:01 -0700 (PDT)
Message-ID: <2dc4bd75-f57d-432a-8d09-6d0bf7345fae@suse.com>
Date: Thu, 3 Sep 2026 09:56:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ucode: Work around Granite Rapids erraturm GNR98
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260902221000.2967167-1-andrew.cooper3@citrix.com>
 <624b7832-873b-46a7-b1a8-9e7c20f45c07@suse.com>
 <76f8b54c-1e1c-4ea4-baeb-43d7b7996746@citrix.com>
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
In-Reply-To: <76f8b54c-1e1c-4ea4-baeb-43d7b7996746@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1788422221-778C54E9-41EC3069/0/0
X-purgate-type: clean
X-purgate-size: 2507

On 03.09.2026 09:51, Andrew Cooper wrote:
> On 03/09/2026 7:41 am, Jan Beulich wrote:
>> On 03.09.2026 00:10, Andrew Cooper wrote:
>>> @@ -273,6 +274,35 @@ static bool microcode_fits_cpu(const struct microcode_patch *mc)
>>>      return false;
>>>  }
>>>  
>>> +static bool microcode_safe_to_load(const struct microcode_patch *mc)
>>> +{
>>> +    struct cpu_signature *cpu_sig = &this_cpu(cpu_sig);
>>> +
>>> +    /*
>>> +     * Treat pre-production as always safe - anyone using pre-production
>>> +     * microcode knows what they are doing, and can keep any resulting pieces.
>>> +     */
>>> +    if ( cpu_sig->rev < 0 || mc->rev < 0 )
>>> +        return true;
>>> +
>>> +    /*
>>> +     * GNR98.  Granite Rapids systems hang when loading new ucode on
>>> +     * sufficiently old firmware.
>>> +     */
>>> +    if ( boot_cpu_data.vfm == INTEL_GRANITERAPIDS_X &&
>>> +         boot_cpu_data.stepping == 1 && (cpu_sig->pf & 0x95) &&
>>> +         cpu_sig->rev < 0x01000405 &&
>>> +         mc->rev      > 0x01000405 )
>> The erratum text says "to 0x1000405 or later". Question is whether that's correct,
>> as it would mean that it's impossible to update from earlier than 0x1000405. Then
>> the workaround text says exactly this.
> 
> "Correct" is complicated.
> 
> The text is technically correct when considering all pre-production
> microcode that Intel had during development.  It is not correct for
> production systems where OEMs followed instruction about which first
> version to use.  Specifically, 0x01000405 does load safely on the first
> production-certified firmware.
> 
> Critically, >= breaks the aforementioned "more complete solution" (which
> can safely load up to latest even on old firmware) where I'm still
> waiting on Intel to adjust the blobs in the ucode repository.

Can this difference to the erratum text then please be mentioned in
the description (or even a code comment)?

>>> +    {
>>> +        printk_once(XENLOG_WARNING
>>> +                    "microcode: Granite Rapids erratum GNR98 detected.  Skipping ucode 0x%08x\n"
>>> +                    "microcode: Firmware update recommended\n", mc->rev);
>>> +        return false;
>> Should we additionally taint the system?
> 
> Why?  We've done nothing to make it potentially unstable/problematic.

We've done nothing, literally. That leaves the system in potentially
problematic state (newer ucode available, which likely addresses known
issues).

Jan

