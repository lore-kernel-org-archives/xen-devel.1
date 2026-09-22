Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA74AC982F1
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 06:48:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428215.1650933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8uID-0007lM-E3; Tue, 22 Sep 2026 06:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428215.1650933; Tue, 22 Sep 2026 06:47:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8uID-0007kr-9v; Tue, 22 Sep 2026 06:47:53 +0000
Received: by outflank-mailman (input) for mailman id 1428215;
 Tue, 22 Sep 2026 06:47:51 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x8uIB-0007jX-Lj
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 06:47:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8uIA-006eoT-Of
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 08:47:50 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab2248c-2eae-0a2a0a5409dd-0a2a4506dd58-26
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:47:50 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ab22496-195a-0a2a45060019-4a7de18ceefd-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 08:47:50 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ccfd61ecaso32506715e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 23:47:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fdad2a3e0sm36681415e9.5.2026.09.21.23.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 23:47:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1790059670; x=1790664470; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9GsuyaOOPvxk/zCyls58dU6bakHBAdEItiM4x6nF+IA=;
        b=UPjp5f4vR04xmNRGAcu+RGX2K+lHExvQWAZtgokg2lggBQ0AfpKbriBIV0505IMGbt
         dJP9UEDflfNSSwGKmtJ3vS0s0agJVurfCxLHAGj37MixTlRmXf9Yfma4oSUMbtb1j2MG
         bYS4NnG5q4ZsDkFUx4eUBXD7qvJWOQpF7xGuGUnVBDXU6Bo1bZY92tc321ptaLNRGG8/
         1pgCqUb0EkJM5PrbkgkvoIXbKQakibFGjhljVqTk3aOKByUxxe23/G8XTthMGojN7K4u
         vVb2/AxQW3JvMe1EVFZ++IAAQ9SDxsv0p4b7mCRm/lkSOXv74DNxaWDlI6e/gtR+RNJ4
         fk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790059670; x=1790664470;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9GsuyaOOPvxk/zCyls58dU6bakHBAdEItiM4x6nF+IA=;
        b=pOEZlknfZVPSk1Pqbo7ihUb2bmU7KM2Kzgfq31FD3gLqWeA2OfD4Fq9ic4+jkYUAqP
         stEuIizH/lzJiiMRfRPVxgTUg2lBNrkDdsIdIiVisth8eYmjJRVJIZFxRkNZg4I2SkrV
         XSu7yUmKwSdFuSoaSbiUgL+4n6I9lfrrJQ6N5uukxZlzr6MfnEr4zYVIlIDjz6yqwXqB
         rDRZ6+tlqm9ooL4fFfmZ72TxjOJfrh8Z9HpkTpQccEswT0UFY+oJ92w2fKfZ81FkjCnM
         Pb7WpbTZ0gU6sGXsfgwHEke8+gBmjvlhO1b996/tyuRrV6K1MpDPzzfoQduOXmMFxpA8
         fAQw==
X-Gm-Message-State: AFuF++lOEspjBxMXV1IhKYAHtoYU9dOex+bUpmXsbtjHhhAzctDHQF/C
	wpht3tpxzDHuW5VUP/hP3kDjW7+kTvPNs/Nio3MSWayaJF3VZUR9GyYvInyONytg4w==
X-Gm-Gg: AYBFou3he7e4UxODM16QDKBK5PUkFarhjEslEGUJSFEjwg56MwnJf4HTHuhO1/AtjNL
	RzcsP1mLwi4ivKDqWSmJwA3L+zJmosmg25dGD02WDhXjaQNdiNWcQGjAEb1XqEO1swNt7/ujZ5Z
	GY/Hd92Te0MGCWVXMzVxX9+BZ9xgaFjpQDof6vk4mvZFwF822+iua/0Ge6CQABRXYdDnq9q7ugg
	zfdtutZKDnmKh2lDJu/DxJgnrOiSw+FQkH7htlprkEHm+8sVc0FHkOt5k62cOWtgoTz1VWI4O0B
	nh7JpMTas59VVGvFtKmpMcUi81xzuNkwqZIV9lLnvKQaK7TUZwwpHiyxHGyqtWAW4g9T/KlxCSL
	/1tzECE/GzTmpDo0pdxTnRzt0tuGPjxRFLay4upOTz304069DdULrfeo9CQS/MybffoETA1uS4t
	OEOr+OwataV/YGTVhiE5jGR6HZ5tK1QcWNi2sKsR73bswy2hCgyt4NNJg0kQERocgw1ndaNIsHX
	wXQCAeFmkgozanxYvMgm5GDlKpoUBswD4gRDhe8cjeVRqtSCsQG2hYuBE1A9Q==
X-Received: by 2002:a05:600c:1d16:b0:49f:bc8a:b103 with SMTP id 5b1f17b1804b1-49fc55c5361mr205757875e9.0.1790059670040;
        Mon, 21 Sep 2026 23:47:50 -0700 (PDT)
Message-ID: <8fd025af-f429-488e-9977-aec3fea2e78b@suse.com>
Date: Tue, 22 Sep 2026 08:47:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/14] ACPI: address a Misra rule 11.8 violation in Arm
 code
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
 <f6362f01-0057-476e-ba7b-b0bd8154c86e@suse.com> <87qzim6p5i.fsf@epam.com>
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
In-Reply-To: <87qzim6p5i.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1790059670-1F0C777B-ECBAD272/0/0
X-purgate-type: clean
X-purgate-size: 1538

On 22.09.2026 03:38, Volodymyr Babchuk wrote:
> Jan Beulich <jbeulich@suse.com> writes:
>> Outside of drivers/acpi/tables/ (which is excluded from Eclair reporting
>> for dubious reasons), arch/arm/acpi/domain_build.c is the only user of
>> ACPI_COMPARE_NAME(). Make the macro const correct, at the expense of
>> introducing a "const" variant of ACPI_CAST_PTR(), and at the expense of
> 
> I think you can avoid adding ACPI_CAST_PTR() by providing a const
> type. Like this:
> 
> +#define ACPI_COMPARE_NAME(a, b)         (*ACPI_CAST_PTR (const u32, a) == \
> +                                         *ACPI_CAST_PTR (const u32, b))

I don't think so. You did notice ...

>> --- a/xen/include/acpi/acmacros.h
>> +++ b/xen/include/acpi/acmacros.h
>> @@ -103,6 +103,7 @@
>>   * Pointer manipulation
>>   */
>>  #define ACPI_CAST_PTR(t, p)             ((t *) (acpi_uintptr_t) (p))
>> +#define ACPI_CAST_CPTR(t, p)            ((const t *) (const acpi_uintptr_t) (p))

... this, I assume. On the surface it looks odd, because one would expect
acpi_uintptr_t to be a scalar type, like uintptr_t is. But it isn't:

#ifndef acpi_uintptr_t
#define acpi_uintptr_t                  void *
#endif

The only alternative I see (somewhat more risky overall) would be to
introduce

#define acpi_uintptr_t                  uintptr_t

in acpi/platform/aclinux.h (or, imo less desirable, acpi/platform/acenv.h).

Then what you suggest would no longer cast away const-ness at any of the
individual casting steps.

Jan

