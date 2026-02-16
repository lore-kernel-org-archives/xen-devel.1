Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4ECE7BD83
	for <xen-devel@archiver.kernel.org>; Mon, 16 Feb 2026 10:28:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1233925.1537296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrvpo-0007H4-B7; Mon, 16 Feb 2026 10:28:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1233925.1537296; Mon, 16 Feb 2026 10:28:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrvpo-0007Gx-8K; Mon, 16 Feb 2026 10:28:08 +0000
Received: by outflank-mailman (input) for mailman id 1233925;
 Mon, 16 Feb 2026 10:28:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFbs=AU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vrvpm-0007GJ-T5
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 10:28:06 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d9cc9c9-0b22-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 11:28:04 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-4362507f396so2910315f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 02:28:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac8075sm25490876f8f.29.2026.02.16.02.28.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 02:28:03 -0800 (PST)
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
X-Inumbo-ID: 2d9cc9c9-0b22-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771237684; x=1771842484; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vbGAUbh83zv1zGGDp3qrk7Ehax0tg4wH84OFianLnCQ=;
        b=XRZCxMpp8w0Kt2CF1/AjW+jRajV6dKhd5nk1hNqqepLJ6BxKBAw8m0z6OjbW1HPXkh
         gJD1ZvR04D+YMYYkk4jHSHX+c9Desa0u1ssiqzLDN0nIy6aRHGIg8uVYl3e/35gO1JE/
         5xmJekDckOdYtWqfbQrMp1otV47CliUHtJEU9k3nDqWgYI5D/YYJmiwxAkIoBUf5mZZ6
         Hy5yARDAiGWSUa9pMEvU7WFTrTnXZuUWoHiyrHzopST1YySQxIJI8VZE25WdC+Mc8UJs
         bETE9lSsiHzwviFAM02EeRMDjMsQh9E5yw88a6DxaamrIWbhEEWv4tceOKk6E4gTdg6q
         vtJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771237684; x=1771842484;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbGAUbh83zv1zGGDp3qrk7Ehax0tg4wH84OFianLnCQ=;
        b=dJrQYg8seWMy25z83101a56GCzIPjg6GyN+H1I/375n3LXP4tr/1ApZNB6CYk29AfL
         GIjRhiJrpgRqsDpccq4z/cvvHsF8+2L4FH//VPBPwLEzKMIFZeEOU5uFpQPVcVvTk3fW
         Fda8eTqO6lSn0zg0nEhYDQpc+Y1XlmeOC25q9MI//Jm3leLLLFLcwTLHjohJy+7OKam/
         htQIJzwxpGp82vQcWrryBTyZ6TAgx19kHcvKgzV80zREwSIZ0ZuoYR/R7BUI5R3spcsW
         KjzlBPFd7IBhWkS4PSV5vExc2fDppLH+i8j5RQXscm7HTX1IfgeymcS/tpTCXvPeqml9
         detw==
X-Forwarded-Encrypted: i=1; AJvYcCXNYXwpeu/xfsoGAD8bfJvTyuODIlW/iHw/jeuGtuYO5JqvGlnCtr2nwDSJGHSL7lPoAwqegbbYyhQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIWJu090h2bVno91ltIyb9JxNxCryzI3Rs6o3LbeLRXXU6pGVb
	vXQIMCstQIXzbo5u2d71tC83I7L3TIMubdiTE9q75SVIXUN9KU6wqg9WeDXOEPKT1A==
X-Gm-Gg: AZuq6aLnCuMN0XuwbHcTd7fiIEpigWAj/4GEJZ9ZJH/ShSEuyA3SE0vls6dkmSfmMIy
	OIWPQK1NbfGnp16O/O4+AtccS327/PQU4NAHfWYBCsXfxKJBnWSTpyrCiSDyIk0pVONUZGoEsWJ
	l0lJKPtABrUz09ahlMTuCrWZQwo7cKFpPZvhgvzfPvdOnS8jxJnQeHmM5beM+YZGWWnt9bJCjyw
	YNRHHivALuXJC0Bvn0jzR8DZPr4ky6KZUkHePm1oermRy0icUQXTFVrt3SsX/pCgCJaiaOdp5aH
	eL8A7aWp1Yw0d67jDaVhIE9KKbtQ8giBDdDHRmlIl8uMkW9Qhty1LIREEbSODBUAGWlLfHJEGiW
	XKEYZl0MtKp0EcX5/XhWbKbJtPIjthcKqHlTxb1V4xMeIKRDZiJsNi8JQeDDqQqJtJvicTUV64D
	1W3OL37//RmEYMRBGMV2RvG4sFRkMC7oCjJDUz2aDZaVly52aBkpMjUQr1uWtRfSkQ2k7QU9TkL
	1QYwSELv+dhYqU=
X-Received: by 2002:a05:6000:4007:b0:435:a52e:7758 with SMTP id ffacd0b85a97d-4379793f44dmr16898644f8f.57.1771237684200;
        Mon, 16 Feb 2026 02:28:04 -0800 (PST)
Message-ID: <1a8c1f40-7b8f-4ffe-bc26-afc56261b92a@suse.com>
Date: Mon, 16 Feb 2026 11:28:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] x86/svm: Add Enumerations for the SVM virtual NMI
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1771177081.git.abdelkareem.abdelsaamad@citrix.com>
 <8b09eece639ba9cdff0d259e0941f7ef3dae7701.1771177081.git.abdelkareem.abdelsaamad@citrix.com>
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
In-Reply-To: <8b09eece639ba9cdff0d259e0941f7ef3dae7701.1771177081.git.abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.02.2026 19:16, Abdelkareem Abdelsaamad wrote:
> --- a/xen/arch/x86/hvm/svm/vmcb.h
> +++ b/xen/arch/x86/hvm/svm/vmcb.h
> @@ -336,13 +336,17 @@ typedef union
>          u64 tpr:          8;
>          u64 irq:          1;
>          u64 vgif:         1;
> -        u64 rsvd0:        6;
> +        u64 rsvd0:        1;
> +        u64 vnmi_pending: 1;
> +        u64 vnmi_blocking:1;
> +        u64:              3;

Can we have a blank please ahead of the colon, to make it a little easier to
actually notice?

Further for both rsvd0 and ...

>          u64 prio:         4;
>          u64 ign_tpr:      1;
>          u64 rsvd1:        3;
>          u64 intr_masking: 1;
>          u64 vgif_enable:  1;
> -        u64 rsvd2:        6;
> +        u64 vnmi_enable:  1;
> +        u64 rsvd2:        5;
>          u64 vector:       8;
>          u64 rsvd3:       24;
>      } fields;

... rsvd2 (i.e. the ones you touch anyway) I wonder if their identifiers
couldn't be dropped at this occasion as well.

Jan

