Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A188606A32A
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 08:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RNkzm6Pe
Received: from list by lists.xenproject.org with outflank-mailman.1493936.1693643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTact-000517-O3; Wed, 18 Nov 2026 08:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493936.1693643; Wed, 18 Nov 2026 08:02:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTact-000510-KE; Wed, 18 Nov 2026 08:02:43 +0000
Received: by outflank-mailman (input) for mailman id 1493936;
 Wed, 18 Nov 2026 08:02:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTacs-00050u-9j
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 08:02:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTacr-00En8d-E2
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 09:02:41 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd5b98-bab6-0a2a0a5309dd-0a2a4509d31a-40
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 09:02:41 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd5ba1-be1a-0a2a45090019-d1558035d03c-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 09:02:41 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4ba013938d7so6090475e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 00:02:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a65100bf42sm3068766f8f.1.2026.11.18.00.02.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 00:02:40 -0800 (PST)
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
        d=suse.com; s=google; t=1794988961; x=1795593761; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FdC7gtfPvlV8zt9Q5d7wUuxFdtuRtZi87OqjOjEV3dk=;
        b=RNkzm6PekkNSJFtktNTZD6NTxLp93QWK27kqqRafvkq6d5cRqkIh2BAsUXOVZn45Vs
         Qo2cwmWJNPx2bDLIVRAVvNqkEDpxAWt3pC7KViIk2oj3zYVcNL+wRcZX+GwCDy1ATz4O
         iFKmALq8FamZWpXrB924FyMAPbQ+j8o8K+2P/Jv7g+a9ro2+GGTdp6ALCO3fjQK3x8F5
         4VFJQzoHBOC/7lxYTib1kOrnDpBe1yq2DrqN+Qapp5MsT4w1CaM4oI64ZxuFZV8hdxqN
         RYL+2d5jawGWcIiEo62cfO/tUBIpApwIwR7ekzibkUyh54ZhPPuGC7b+VeDMBed+6FW6
         TGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988961; x=1795593761;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FdC7gtfPvlV8zt9Q5d7wUuxFdtuRtZi87OqjOjEV3dk=;
        b=qMvSpZD2wL+xzYETST6WPT+ZxgDy5LIrkwhGk9wX/FAs/mlj+MUZP/MPRE7orbmHdo
         944h/HfidtK0DLaYUvN4PIkD2WiTaa/PYDrIGazA5yS3rgLZwnbeQnyRS5uToTtd0ygR
         7XPpQnUzpkX/2zZd9+owMn8nIkIgM4mpm3W2uAm8aKMweKsZhuUqxCdY+2lUxaEX2A78
         Vz3eSqO87YIgFWm2mVJX95qnJtWnN/1VZnDLm/w7n07uxpViobSsPM1dyOO0/Xrxr5Td
         5ajlwebUB8StET2LbUu7HxL0KA2ipHsYwB8DQXU8Vu/T6HCZAZMewUtdFdVhWQNgjtSn
         nXVA==
X-Forwarded-Encrypted: i=1; AL+hErExNOGB0O3kd/CgSnDlrtAMVrn6mEn4b1g24/qvHZbGJP2EMrwQbM8vlmXcHWyvARqX5o5HEcuogvA=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8t/QylN4SN6MVnpk/d+o8nLQ74LbCxIatbGXHj8qnY6J+kA124
	o0uetEws5cfptYmIvLz79dXs537nq7a6LviskUfTj/QJY+cGVOG9V2jOQG4Ek0I/QA==
X-Gm-Gg: AYBFou2xIIBd8r6xiO+MHBt7ZTNQ3SdA1kpnIJ25vDVrbAvBUkCb2e7wlRUV3tkRpC2
	VoF0qgxSbZfU31SkocbUUwtC3RNXblmxBAxUMvW3o+eBNCY7KvDd2VLEtTc8kqz+GRlLMCHnecF
	jzDiFKFAUgZCZlzgQclc85GMaUP/3ACjPB5L188W1mFfNOWtPXlpaH8jH2rVbh8b8iPFMdpPRYv
	uD/yzAbbXdu68XJ4Z9xHRBTdL7374o92SOm8FyTXoxFQO4rbdN5enFbUAxEBAfTD2FMr4WDjKji
	FqXtsRWh3EvPO5S8Uh/SzGamiDVOAOmPuSTcDFxeBnDSe3Gj+HlZ9aZ0yzfqQ8q4hunUxswe5/E
	+hyDG6ZJa+kPnhpGt8KU446uUtJdyX7ytTeb1DEITGL+TvD5JbUGPVS4+IDdEH1fuBnVCEviQVA
	pko6xakS+vHiGdnGvCgn8OqGTB+vocoXI2xVx8qmDbvUdFCRQXQHO2/YqYprOLh7zflqOKJAF5q
	Qra1cfTuHXNNzVRMkoXwshEDsKjsQt1PdF5UVuGLES75N22+K0DgrDWK0QZ4GCfhnsDPAhscPGG
	PA0B3KINYigAAuR4adNxyYNiLqx7LE9gCVtKo4IgK9VxnV+1b7yt1AN5FRQ3s0JTKmlS7SiwG4T
	11s3N22D2C/MDHTInzw==
X-Received: by 2002:a05:600d:6011:b0:4a2:1050:aff with SMTP id 5b1f17b1804b1-4bb7da12dd2mr30557805e9.6.1794988960568;
        Wed, 18 Nov 2026 00:02:40 -0800 (PST)
Message-ID: <d9368119-12de-4fa7-b417-4c66bf9ad07e@suse.com>
Date: Wed, 18 Nov 2026 09:02:39 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] EFI: avoid use-after-free when chaining config files
To: Anandu Padinhare <Anandu.Padinhare@electrifex.com>
Cc: "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 "dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <MA0PR01MB92175BB14F25D806EB78D171FD7A2@MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM>
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
In-Reply-To: <MA0PR01MB92175BB14F25D806EB78D171FD7A2@MA0PR01MB9217.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1794988961-BEEDE034-91EF373A/10/78276251493
X-purgate-type: spam
X-purgate-size: 3355
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18.11.2026 08:50, Anandu Padinhare wrote:
> When following "chain=", efi_start() frees the buffer holding the
> current config file (if it was allocated) and only afterwards converts
> the chained file's name, which points into that buffer, with s2w().
> The section name, when taken from "default=", also points there and is
> used for the subsequent lookups in the chained file.
> 
> read_file() may well get back the very pages just freed (as observed
> with OVMF), so the section name may end up referring to arbitrary text
> of the chained file, selecting the wrong section (or none).  With
> firmware overwriting freed memory (e.g. Ubuntu's OVMF 2025.11, which
> fills it with 0xAF), even the file name is garbage, and loading the
> chained file fails with "Open failed for ...: Invalid parameter".
> 
> Convert the file name before freeing the buffer, and duplicate a
> section name taken from "default=" the first time round.  A
> configuration relying on the stale pointer happening to refer to the
> chained file's own "default=" value will now use the section named in
> the original file instead.
> 
> Fixes: 81da4016bfeb ("x86-64/EFI: allow chaining of config files")
> Assisted-by: Claude
> Signed-off-by: Anandu Padinhare <Anandu.Padinhare@electrifex.com>
> ---
> v2:
>  - Introduce _strdup() and use it (Jan).
>  - Duplicate the section name only once, and only when it was taken from
>    "default=" (Jan).
> 
> Tested in QEMU booting xen.efi directly (x86 with OVMF and a PV Dom0,
> Arm64 with AAVMF up to Dom0 construction): chaining with and without
> "default=", across several levels and (x86 only) with the section given
> on the command line; booting without "chain=" is unaffected.
> 
> A pre-existing issue is left for a separate change: "chain=" has never
> detected cycles, so a config file chaining to itself makes Xen loop
> silently (unless the firmware garbles the freed name first, as Ubuntu's
> OVMF does).  I can send a patch limiting the chaining depth, if so
> desired.
> 
>  xen/common/efi/boot.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 89b5831691..6db3573030 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -285,6 +285,17 @@ static char *__init w2s(const union string *str)
>      return str->s;
>  }
>  
> +static char *__init _strdup(const char *s)
> +{
> +    size_t len = strlen(s) + 1;
> +    void *ptr;
> +
> +    if ( efi_bs->AllocatePool(EfiLoaderData, len, &ptr) != EFI_SUCCESS )
> +        return NULL;
> +
> +    return memcpy(ptr, s, len);
> +}

While I agree with the use of size_t and char here, the use of void (vs VOID)
is a little questionable. The EFI maintainers will want to judge.

> @@ -1441,6 +1452,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
>      UINTN gop_mode = ~0;
>      EFI_GRAPHICS_OUTPUT_PROTOCOL *gop = NULL;
>      union string section = { NULL }, name;
> +    bool section_in_cfg = false;

This doesn't need to live at function scope, it can move into the more narrow
if()'s one.

Then:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

(Perhaps the adjustment(s) could be made while committing if no other need for
a v3 arises.)

Jan

