Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF330C5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 06:11:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392459.1631403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvqZB-0003Ve-TL; Mon, 17 Aug 2026 06:11:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392459.1631403; Mon, 17 Aug 2026 06:11:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvqZB-0003VW-Pa; Mon, 17 Aug 2026 06:11:25 +0000
Received: by outflank-mailman (input) for mailman id 1392459;
 Mon, 17 Aug 2026 06:11:25 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wvqZA-0003V7-Su
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 06:11:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvqZ9-007O62-6l
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 08:11:23 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82a608-bab6-0a2a0a5309dd-0a2a4506a842-4
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 08:11:22 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82a60a-195a-0a2a45060019-d155dd2ce5b0-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 08:11:22 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-4815bce4652so1820259f8f.1
 for <xen-devel@lists.xenproject.org>; Sun, 16 Aug 2026 23:11:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5a3b487sm1232263f8f.10.2026.08.16.23.11.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2026 23:11:22 -0700 (PDT)
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
        d=suse.com; s=google; t=1786947082; x=1787551882; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e3u9tF4r2QuCHyVAtgu30y4b/QROcSH9MWoc0U1I/88=;
        b=DtzU91DL4x+IrVQqLPVCpW8xILRGNOaDJuYQntSvP/unG3CBUwxBXnKPGDlVKS6wbb
         osQInDGlz1C0hQedYok72bp/EsWJS8G0Cgy8GS83/VGjbAMbMzOnhVJBn7LirfNn3L5g
         mRg3sOp3f14yIMN6xsrlHU2/2M9ML8+tlfQ79nJfoeO1SYwfaoE4l5l6Wy35gItupCPH
         sz55fYMLHmshgq6EbTfOEGhsOdyCoikPT/7oixwDCHGgumPD91clTU/c1ybbTLGVEldE
         K59QN4j5cqaYAhT3HklW7GWxEf7dJZ0QcvCnKPLJ5r+4db6Jajn7DgVueNHeiS35yZXx
         nIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786947082; x=1787551882;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e3u9tF4r2QuCHyVAtgu30y4b/QROcSH9MWoc0U1I/88=;
        b=Sy/yl99AozDbxXDxAbVDGcbhf6HnbyQss5zQyB/7txj9HLNMv41eXiIHIA/Pr/I73u
         awaWpMrR97mw17MMQEIKUEEAkyTB0XpKuVckI7jZ5BI15ZuMAvIVgL/dBKn7/bLi0bLK
         iWZ1ycdwOg3Wfh6GqME1YzblYj9Ci/AbEGBm8ucGQ2oGIV+sXLft3pamn+ff1xD3L8nB
         XSM9y7rR2/EtvrfErepu/DIENdiAxG2YTA2x5/hNAR9DxnkCPMHrKkzBRcLfwc8THNxo
         trHrMaHoR9W5+AOOw8gkgrdVOG93jAzQLnGt7V7Efw/1xK7lAZmoDNj9ipMOP5/PggeO
         GDJw==
X-Forwarded-Encrypted: i=1; AHgh+Rrgq6tZWrAHCYbD6U/2S2VMNV9GSsZIFr6LDR4/VYXPeeKKkbuuo2J/pRnBblNkcrbOzRaiijxMjdk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWdi80915JPqe8+WtyPd4D2afa/ZdQrUjCXtd3BEanUp4ipv+S
	bJ8y2TDHudxm8chcxrBKHLBTyfeRQu3d6RiUS8RKJpwJaYfSLEaZeUMQslyrB8Jx1w==
X-Gm-Gg: AR+sD11wOAqOmVAqkS+SEnqVMQkB8Ad0ppdCkaBtiE+r9OhA/p/sCge7qfLqmjoSdIB
	VbHltMZIhjIwQByo8lTXfghfc5sHFTcRlxdm/hmB5ALBlqxtIvMj5G/KqJKaowtwOzn1Sdtug4l
	lhVvaQlgAEnwwstesYYaAK0BuxRVnWCCsv81iS/CxxKbc00R7GJ0R/ExEuzaSGOzPiwrdfOL1ab
	4HKfWRDVl4NOrXDYP4Bebme29T815dC9e5fCYjCcozl6FPTdv5FNCga0ApHLGYa4Mu3616FfB/j
	Id0QJfq8D3rwK/HiTvbTCvftWq6yiQUOx1VuaVmqeU8MOAJAME0eP8wrZI7F3pErjy/QSpU5Fzu
	aIXxnStuTcZY8BgOk75pwFafQG42Xj8yGOdbVTS0CJRBjmx4mEkUFADqJlwAK46eI2R+yN/em+z
	0FOUG8v2fzLLf1BH30Kd6th9RqUZ4qpIYbav8LD3BmitNenkWT0CWtbRq68VF6zt4C6CiemtLpO
	rirP15BjGvDqhFzU/pGQC37kqMgxOzf7BotfOureTaaqk/L2f5M
X-Received: by 2002:a05:6000:4024:b0:481:5829:3f28 with SMTP id ffacd0b85a97d-48160723c18mr35113110f8f.5.1786947082436;
        Sun, 16 Aug 2026 23:11:22 -0700 (PDT)
Message-ID: <cf1eb6ef-763c-44d3-ab86-d9dd431cf606@suse.com>
Date: Mon, 17 Aug 2026 08:11:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/emul: Adjust comments in x86-types.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260814185841.1757421-1-andrew.cooper3@citrix.com>
 <20260814185841.1757421-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260814185841.1757421-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1786947082-1ECC577B-C7552A37/0/0
X-purgate-type: clean
X-purgate-size: 894

On 14.08.2026 20:58, Andrew Cooper wrote:
> x86_segment enumerates segments, not segment registers.  Adjust the comment to
> make this clearer.
> 
> Fix a stray tab with the closing #endif.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I wonder though if we wouldn't better ...

> --- a/xen/arch/x86/include/asm/x86-types.h
> +++ b/xen/arch/x86/include/asm/x86-types.h
> @@ -16,9 +16,10 @@
>  #endif
>  
>  /*
> - * Comprehensive enumeration of x86 segment registers.  Various bits of code
> - * rely on this order (general purpose before system, tr at the beginning of
> - * system).
> + * x86 Segments.

... insert "(kind of)" here: "sys" and "none" aren't really "segments", and
iirc we said we may need to gain one more such pseudo-segment here to deal
with WR{,U}SS.

Jan

