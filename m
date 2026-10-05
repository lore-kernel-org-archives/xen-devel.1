Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06BCCA5FCE
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 11:54:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440771.1658220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDhGs-0000hQ-Mc; Mon, 05 Oct 2026 11:54:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440771.1658220; Mon, 05 Oct 2026 11:54:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDhGs-0000hJ-JX; Mon, 05 Oct 2026 11:54:18 +0000
Received: by outflank-mailman (input) for mailman id 1440771;
 Mon, 05 Oct 2026 11:54:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDhGr-0000hC-Rx
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 11:54:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDhGr-001QSf-8W
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 13:54:17 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac38fe6-8faa-0a2a0a5109dd-0a2a450bb85c-28
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 13:54:17 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac38fe8-b7e8-0a2a450b0019-4a7de18cc1e7-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 13:54:17 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ffde3cec6so10923675e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 04:54:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a16bcb9a21sm309258525e9.10.2026.10.05.04.54.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 04:54:16 -0700 (PDT)
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
        d=suse.com; s=google; t=1791201256; x=1791806056; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n8gcPZMNK/kYqEshazKTqD1jOk9Nm5uLCDmpta+uW1A=;
        b=Z+EDPqjNxK7LK4NdZXU7j84DDHvKOhOIbIrVHCfcr+qJs760jz+k0lykZskyqp0dgE
         K4+Z0IYcB0ky8/JwJqByfmT31nvPTNRMbdNqTe5WwcM2txae2caU7RXqW1P+983D+ish
         8Yf8vpo/84C/Cae/todHtbF3MGCb/xitei33iFI949vxcKL/vSsiPKyh3duFasdEZaxG
         Fhc8tHIqcYFx26hq22PHe3DAXPB33aANOANJfgfIFayzwvoThQy5m5+JPWCcGfhSBSkZ
         aTw0DmnzwYA90e+PblR5IXymQQqAHmjiumUmKIZDOrq3stYb2+2oCR5bEoIYUkVOW+v1
         MxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791201256; x=1791806056;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n8gcPZMNK/kYqEshazKTqD1jOk9Nm5uLCDmpta+uW1A=;
        b=a8QnV8VIf72sIqofKeATtAETrcuhgTpzFkzidG1Y8005dhOrH/jNZ2DN9h+cHsesEI
         6u7BUAsU5LCSpVOaTqqItHNMqLoRkJvg1YjO5cRZ0fnECLvi3cuRogzGz17cDK0JHPy1
         RN+CvAHFxI/uVNZPkK6YWhdaclDWizQhWr4/a63YpOYF3QzLYwdEDQ+q2om9ozD5z6tz
         ni29LpL+NU3rZAhDOF6J/Ljh1YWKagYaK3DPwYHC0SUe4oeHcYxE8wsyLgvkRbzjXiV0
         YmeZWg38UGAiGaRHxDv1K9BzF7DKkp5Ri0sbZs4NYYwsrgE25kZnFDtQbaq+zzwQfAMU
         7BMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbB0zpZb8rOYYfhzEM5GzX/mREwItbgu1VBxA4uavsCf37zHf7t+t2dD7fMw/KvFq8uc6Dp0Vbk2c=@lists.xenproject.org
X-Gm-Message-State: AFuF++l/UQQesMH+e7Y89Vg5rm9SVOLTDALqBKO8ZP2hw/oknA6EN5RX
	3u5IFcU7URr+EiBkie/y/Z9pSa4q4/LH1oDUx2+De+ji8ac1cNU5Ms1SKVU8QbHaJQ==
X-Gm-Gg: AYBFou2TDhWjK8LOdv9jL69RltbH4J6cxPMmMskoFdo6Sx7cUO4/L1Vfa8yiYnQ42IF
	x62kHBPeEdxBFMwXFeeV43WKJazguIOBAU7/WkaU9TjOQbsGbVTsttC2DCfRuRgSLHxxy7UFFch
	OdK9yp0MFhhrY3oOsy09+gPu/VT+3erKZXGMngz0af0/P9BhrR98uCnzOijQ9Z8LRBLn6G1EapJ
	dsNAbGu1nKjaItxUXtyh4QnMdfhlA2zb/Wnxuq5odaRLyeNSeRNIeU4qEDOmyuDEJn0emmc36rX
	MwpiOnjxKrFIecaFVCY/CQ7oP8uaLWahGkjEksPlZveSSusxb3xWe/4WDxWADg6PxQ3gAs2pYbj
	NI28zN7mtTODs/hyv3nw3/40Ex+fRV6IwupWo80sqjOA8ChAASqlrbjQHsA0IacGuK00oHKzKdu
	vdyakkfGhUkdJ11SLR8uhh+9HhNxypHDexofEDtm07rCy8w0wfLg8jYujF6EEUHO8SCAopjNW8o
	HWy6kP2OeRTG4xha66XRX3yY2CRrC79ANS5wm2WKNOxYWA2WlEHwya/E3h3ZA==
X-Received: by 2002:a05:600c:3493:b0:49e:817a:ca7 with SMTP id 5b1f17b1804b1-4a02754310cmr182417995e9.8.1791201256535;
        Mon, 05 Oct 2026 04:54:16 -0700 (PDT)
Message-ID: <44c2b3db-4958-4ade-9503-737f0f986cf9@suse.com>
Date: Mon, 5 Oct 2026 13:54:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/pdx: fix offset-compression merge of a contained
 range
To: Weiqi Wang <coolhaoyt@gmail.com>
Cc: roger@xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, michal.orzel@amd.com, julien@xen.org,
 sstabellini@kernel.org, lucas.cordeiro@manchester.ac.uk,
 Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>,
 xen-devel@lists.xenproject.org
References: <20261005102713.94033-1-coolhaoyt@gmail.com>
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
In-Reply-To: <20261005102713.94033-1-coolhaoyt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1791201257-A8CCF9EA-4498D493/10/78276251493
X-purgate-type: spam
X-purgate-size: 2361

On 05.10.2026 12:27, Weiqi Wang wrote:
> From: Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>
> 
> When sorting and merging overlapping ranges in
> pfn_pdx_compression_setup(), the merged range is set to end where the
> second range ends.  If the second range is fully contained in the first,
> this truncates the first range, and the tail of it is then neither
> compressible nor translated correctly.
> 
> Keep the end of the merged range as the maximum of both ends.
> 
> On x86 the ranges come from the SRAT memory affinity entries, and
> overlapping entries for the same node are tolerated with a warning by the
> NUMA code.  The caller's subsequent coverage check catches the truncated
> range, so the effect is that PDX compression is disabled with a "RAM
> region ... not covered" message rather than memory being mistranslated.
> 
> Add a test case that fails without this change.
> 
> Found with the ESBMC bounded model checker.  The counterexample was
> confirmed by running it natively against the unmodified code.
> 
> Fixes: c5c45bcbd6a1 ("pdx: introduce a new compression algorithm based on region offsets")
> Assisted-by: Claude Code:claude-opus-5-5 # finding the issue with ESBMC, patch creation
> Signed-off-by: Weiqi Wang <weiqi.wang-2@postgrad.manchester.ac.uk>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I think though that ...

> --- a/tools/tests/pdx/test-pdx.c
> +++ b/tools/tests/pdx/test-pdx.c
> @@ -87,6 +87,18 @@ int main(int argc, char **argv)
>              },
>              .compress = true,
>          },
> +        /* Range contained in a previous one. */
> +        {
> +            .ranges = {
> +                { .start =                                                 0,
> +                  .end   =                          ((1UL << MAX_ORDER) * 1) },
> +                { .start = (1UL << (MAX_ORDER * 2)) |                      0,

... these lines now want padding with two more inner spaces, so that in
particular the multiplication aligns with ...

> +                  .end   = (1UL << (MAX_ORDER * 2)) | ((1UL << MAX_ORDER) * 4) },
> +                { .start = (1UL << (MAX_ORDER * 2)) | ((1UL << MAX_ORDER) * 1),
> +                  .end   = (1UL << (MAX_ORDER * 2)) | ((1UL << MAX_ORDER) * 2) },

... these. Happy to adjust while committing.

Jan

