Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1504C60A2601
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 15:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Q3gkzlbg
Received: from list by lists.xenproject.org with outflank-mailman.1494773.1694109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xThYf-00079X-Ld; Wed, 18 Nov 2026 15:26:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494773.1694109; Wed, 18 Nov 2026 15:26:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xThYf-00079Q-Hv; Wed, 18 Nov 2026 15:26:49 +0000
Received: by outflank-mailman (input) for mailman id 1494773;
 Wed, 18 Nov 2026 15:26:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xThYe-00079K-Ci
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 15:26:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xThYd-00992q-Hm
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 16:26:47 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afdc3ab-e002-0a2a0a5209dd-0a2a4505d5fe-38
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 16:26:47 +0100
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afdc3b7-4cb1-0a2a45050019-d155dd2cd559-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 16:26:47 +0100
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-48e47347279so675606f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 07:26:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a656933956sm5747122f8f.44.2026.11.18.07.26.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 07:26:46 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795015607; x=1795620407; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UZJLGtej2F38Nz8k4Z2P9p+e9zwRm5Yc/sKFa5T3rcQ=;
        b=Q3gkzlbg8y6dl3SJnTk+uab0RNTWEH0MI3U70q82Yf3Zw0EVGvGAb1p9Hmczrw8hZW
         GhvWXuncIwdFN0lb09YwJlvdoDv/IsBmjfXpGmAsTVqWbsof17A1lL4ZSdL+hHf6DBZf
         wxJYXO+MPrYAlGn+cAdZQuy/fuHHS9dBYKgq1ALI6YAHWvCQFfPbLb8q4rxD7JDVp34q
         MsR9RdjB3X8II74dEDapagzkHHJKra5zEJgBFiTOF1JUNMlutsKFWdD2mw5tKHsna3cC
         KlW5D3Jy05ZXzpdzQZmq5/+v9Yjlv7nR4+5vigGedPGt/Si8RQiXst3Un09IUR0bbU7Z
         ZNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015607; x=1795620407;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UZJLGtej2F38Nz8k4Z2P9p+e9zwRm5Yc/sKFa5T3rcQ=;
        b=abiuA5tYUg8TbIUsa+odEYPXQLc6JvLQ+Tn02BznP/hGMFsZ/lB+eIJP5l/VoJDMto
         +oHATNkejQj7e/HeYawfYSRiNcnnxebk07UnQrnZWvSFloC0ScIGAVzXWJm/OhVCu4/s
         /0c7Jv22lBZLEK0UOy90fQdW+pEHQwxyEyt+ytGnQQslF8Mz/XONSvoq5Cx51l5DZh1T
         lka+s/UXZqhwF6VJxDathuZWrqyEhSDOvYbsT3rZecVVNZwGgvVeD6zj3sQheSwv7RYY
         eVP6vt5ZY7NdPBeamHd+O7+5iKPnDadWAEFJnHUF+APPSJx2G11P4rpJ+rwzCKlFyn5p
         BLuw==
X-Forwarded-Encrypted: i=1; AL+hErGrWBF2r2nXIvWsLrLbfhbCwkdx9DY16N+smlH/vJY6WvoH41U4FnUGpRy13Ejw9gdkeekk+jqngc4=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/W5lhbpaN69oV3/KYK+Q7UAoSmvluowSOtRgFFLE/spcopEkIW
	NccxZRCxe27z/C9KFoF2tQBucEf1yVUNlJLHqA+qQshS+Dy4LEhJDwaSBHXpfA9n/w==
X-Gm-Gg: AZFdTZeX7BYJPEQHy+QAfWPihqlxjobmy1ixrTHmEjRzAz6fR1PRZW3I5xFf8GEPMA1
	xpdQTvxmpMrWAAWxwtpMLVtQUn/g1xNQvla29SPjs7Dqbsg8Tqh0/Lya+VRmjHcC2KWFdWf7fuI
	HD9F3QE8RUo/czA1VDB5oz4vRyEJVKTJZ5Tkt8B5RaGijlYcun/zKD3DJ8BUWRq1+cKeJpp50zV
	AOz3ZaK/WbwDMGbST7/Orq52ql96qIwYHnnbxir6xKvhAa9BoSxx/nr5rzkG8KmLWJr7ND6zS4q
	YLuwtMpwE7nccdlBFrL4sJVHiiJa/xAFvLgRaAoU9W4eiCg8UrtKmxpLJsLNXKGWi3Tdhvxwsls
	DNFM49bUfP4tRRLkuaWR7v/mWCT3hfXK3RHhNjKmxrzIb4N5w+qPcblLdyNNYPj8vHCapNW64uw
	y462b53ZvC6XQEQ52OdpnPQ1tiPQz03ym7DdH2TUQkRYOXgKL0A3XeP3ZU1EKjWO6EI2CVkfB0V
	UZYLPi3nUPDuMCahvlVM8ihXBxKBnXB1DFw1YZBpsvG0+DqoMs6KyaGfsppsNX1/VNcJhsX/3al
	GUeWUkbcDhvx8erHWfkMTj3uMEQ0jn+JSAEO8KJ2hB/Ppmv05OLZYt/X3H+DEHgcCJ9TQKrUtZg
	27Mh/xOS3LJp9hWispg==
X-Received: by 2002:a05:6000:4b1e:b0:48d:f9dd:e3df with SMTP id ffacd0b85a97d-4a638bd6a63mr6190995f8f.18.1795015606748;
        Wed, 18 Nov 2026 07:26:46 -0800 (PST)
Message-ID: <74833d84-cacf-4956-86c0-f056b3907ba4@suse.com>
Date: Wed, 18 Nov 2026 16:26:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/28] x86/hvm: avic: add VMCB state initialization
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, roger@xenproject.org,
 teddy.astie@vates.tech, dmukhin@xen.org, xen-devel@lists.xenproject.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-8-dmukhin@ford.com>
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
In-Reply-To: <20261105013347.719392-8-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1795015607-F56AD2A1-8A93BF83/10/78276251493
X-purgate-type: spam
X-purgate-size: 1446
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05.11.2026 02:33, dmukhin@ford.com wrote:
> --- a/xen/arch/x86/hvm/svm/vmcb.h
> +++ b/xen/arch/x86/hvm/svm/vmcb.h
> @@ -346,7 +346,9 @@ typedef union
>          u64 intr_masking: 1;
>          u64 vgif_enable:  1;
>          u64 vnmi_enable:  1;
> -        u64 :             5;
> +        u64 rsvd2:        3;
> +        u64 x2avic_enable:1;
> +        u64 avic_enable:  1;  /* bit 31 */
>          u64 vector:       8;
>          u64 rsvd3:       24;
>      } fields;

This may want type pruning before adding further fields, to use bool
where boolean is mean, and unsigned int for about anything else.

> @@ -478,7 +485,11 @@ struct vmcb_struct {
>      uint64_t nextrip;           /* offset 0xC8 */
>      uint8_t  guest_ins_len;     /* offset 0xD0 */
>      uint8_t  guest_ins[15];     /* offset 0xD1 */
> -    uint64_t res10a[8];         /* offset 0xE0 */
> +    uint64_t avic_backing_page;      /* offset 0xE0 */
> +    uint64_t res09a;                 /* offset 0xE8 */
> +    uint64_t avic_logical_id_table;  /* offset 0xF0 */
> +    uint64_t avic_physical_id_table; /* offset 0xF8 */
> +    uint64_t res10a[4];         /* offset 0x100 pad to save area */

Was this comment mistakenly copied from ...

>      uint16_t bus_lock_count;    /* offset 0x120 */
>      uint16_t res10b[3];         /* offset 0x122 */
>      uint64_t res10c[91];        /* offset 0x128 pad to save area */

... here?

Jan

