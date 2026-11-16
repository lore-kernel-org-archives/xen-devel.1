Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B3B606A323
	for <xen-devel@archiver.kernel.org>; Mon, 16 Nov 2026 08:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YkSCyQ5e
Received: from list by lists.xenproject.org with outflank-mailman.1490240.1691170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSs7O-0002xF-SQ; Mon, 16 Nov 2026 08:31:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1490240.1691170; Mon, 16 Nov 2026 08:31:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xSs7O-0002x8-Om; Mon, 16 Nov 2026 08:31:14 +0000
Received: by outflank-mailman (input) for mailman id 1490240;
 Mon, 16 Nov 2026 08:31:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xSs7N-0002wz-1I
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 08:31:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xSs7M-005fvL-0V
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2026 09:31:12 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afabf49-2eae-0a2a0a5409dd-0a2a4507cd68-34
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 09:31:11 +0100
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afabf4f-b4ea-0a2a45070019-d155dd2fa5db-3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 09:31:11 +0100
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-490d59c3edaso1817601f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Nov 2026 00:31:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5d22394esm21575419f8f.3.2026.11.16.00.31.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2026 00:31:10 -0800 (PST)
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
        d=suse.com; s=google; t=1794817871; x=1795422671; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7lUUIA1hK/sb+BUYZXf+DtIxb0Iuc+JGeikw1w4xYec=;
        b=YkSCyQ5ebgfpQ3dobn8CVolmZCFXl7oHPi7em7jNs1A1iHtBgzqNWJMUH2yg3EiHcN
         10ZfWRTr0entxFH+OYBVN/eYCBRU4X+mS8ySdFUV4NIWBF7duPGUGke9BDztB1ZvJE9w
         BmjGa20IDnwqYb3qo/Tax7tndPV8FsdB1Gle4og4icsid6vguiJGTFb/742KSZcTMuFs
         gJBiGqWiMvcDrHUz/cv/HxtwJtQtw4EQBDqDCCB9NFwRFZXhD/fmrd+omz1zpWBwrvTP
         OcWVaelTPoO9pGGmtTQjpHaxN78axcQmfw42chuCSI9aCCepijByLlorw2w+HYCoXy51
         oW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794817871; x=1795422671;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7lUUIA1hK/sb+BUYZXf+DtIxb0Iuc+JGeikw1w4xYec=;
        b=sNpWrHKFe3p1Y/a8UsQPYUf+SBCDYjTQMtPgCXJFht4qo/rMtdzbHRLaOcvQ7TvoKb
         ZkIA5rSZC65QBKfBFduG9G8BKECVq7ZSspQrR1DqG6j7jUo6ZQY13Jb0urwIBCL1NJmi
         DKQD2nksfPwjpK6DRHUT1ZobUJhshJPPwEkWC8J4LaUxI30YkLiULFxPMke1v2VA+Tq6
         lic9kQ21xILTbdNO3n0p1yS9zz26RiReKvpR8Uuqn1E+drs5Z3wqS+NY0I70hObtHBdC
         e6iDf3xnFQE6FOLmJwcgUh69DBXz4k0SPCkOLXIX0f/cVzirYF3hoz5SrBPPu6aNCzHM
         IZ+Q==
X-Gm-Message-State: APuU4Z/WQNVpDFdEvnacX+ykj6eHZ1leFwA8xVK+Vb2xlNLaOl3S6VF7
	I6KICGGN/zO681a+FejdfpFZ7b2iJlGODRliFYRyhWbqk6BWnd5rpTnkqEHiw+qbB5S6is0D7gB
	9TIU3Fg==
X-Gm-Gg: AZFdTZfnJtRWMvkpGO9sxafQgK/GCvmfb0XRjNmPASENSgRE6tealWmB2etkgvoTemH
	JoNDcBFjE42+6FtjoyNHXnw0C9y9W3gJBqYbOCt48rwnpB40u5CS5ywwPvR9/GA0pARIhENaKnK
	B0JxUb3yy/GPkSuVHCIJMw3hINac7WA/TibGP1GMDEAo6JScnonJwxOsRvlER7xo6MlbccNOfj5
	Zg26rzO6SCjTD+euQyGNVVFUicQWQ2aVZ4K4o9RgmVUDxICFUIvCSqqbTplnFWHMszfIaFYJfjp
	erZrNKoWixtFaaQ8KcK0oONJLOWO1ojuvZdNDErtX+Fy0/UaWT8VUG52H+nNt8+NbTmpMQT2Wdf
	lq8VnctoXHJ4KUiu9EfVoNM09WGAONIhaAK1YaF2uw4QARXPO50JFpHQBsSLGJDnOQJKPXpOowL
	Z9bU04HeO/b9II057j5iCILWYCsylKa82/XUzj0K8kdre+2HKJ3tvTHQZj44WneaQschhmTuSsI
	sski/lBETdeADijUQWrAQuzjLoGVaNFtb4Fl9S/Jl/UhYRihJiMWdA7RARTVOyl/Gdu2TjGs0ZR
	jdR+TG/YbsJ58Ogjqouoo4Tx/Ah4wF/7QLhT36DWCUHZM58BOpqhm+zhirSymldkeslEdXCTyaM
	tTux6uIF5sVqylYckbvSZ9S6m0aQ/RrZBs9mAxuE=
X-Received: by 2002:a05:6000:4305:b0:49b:d8e6:1723 with SMTP id ffacd0b85a97d-49c6d452d42mr24195813f8f.2.1794817871184;
        Mon, 16 Nov 2026 00:31:11 -0800 (PST)
Message-ID: <c0dc6aa6-0ffa-49f9-8fdb-b3229409f696@suse.com>
Date: Mon, 16 Nov 2026 09:31:10 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] EFI: avoid use-after-free when chaining config files
To: Anandu Padinhare <Anandu.Padinhare@electrifex.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 "dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>
References: <PNYPR01MB1144475DAC5E2D3611133EADFFD7C2@PNYPR01MB11444.INDPRD01.PROD.OUTLOOK.COM>
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
In-Reply-To: <PNYPR01MB1144475DAC5E2D3611133EADFFD7C2@PNYPR01MB11444.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1794817871-A58C1AE4-8E00096B/10/78276251493
X-purgate-type: spam
X-purgate-size: 1312
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16.11.2026 04:58, Anandu Padinhare wrote:
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1584,9 +1584,24 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
>              name.s = get_value(&cfg, "global", "chain");
>              if ( !name.s )
>                  break;
> +            /*
> +             * name.s, and section.s if it came from "default=", point into
> +             * the buffer freed below.  Copy both before freeing it.
> +             */
> +            name.w = s2w(&name);
> +            if ( section.s )
> +            {
> +                size_t len = strlen(section.s) + 1;
> +                void *ptr;
> +
> +                if ( efi_bs->AllocatePool(EfiLoaderData, len,
> +                                          &ptr) != EFI_SUCCESS )
> +                    blexit(L"Unable to allocate string buffer");
> +                section.s = memcpy(ptr, section.s, len);

Upon the 2nd and further loop iterations this duplication of the string is
unnecessary.

I further wonder whether we wouldn't better encapsulate this operation into a
local helper (strdup()-like, but named a little differently, possibly simply
_strdup()).

As to patch submission itself: Please send To: the list, with relevant people
Cc-ed.

Jan

