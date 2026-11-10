Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CF5606C645
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 09:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=TONSr5hd
Received: from list by lists.xenproject.org with outflank-mailman.1481354.1685210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQiBb-0003aN-H9; Tue, 10 Nov 2026 09:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481354.1685210; Tue, 10 Nov 2026 09:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQiBb-0003aG-EV; Tue, 10 Nov 2026 09:30:39 +0000
Received: by outflank-mailman (input) for mailman id 1481354;
 Tue, 10 Nov 2026 09:30:38 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQiBa-0003aA-23
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:30:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQiBZ-00Gr2t-Es
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:30:37 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af2e43a-8faa-0a2a0a5109dd-0a2a4503a5d4-0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:30:34 +0100
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af2e43a-fae8-0a2a45030019-d155dd2ea5b1-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:30:34 +0100
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-490d59c3edaso1289168f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 01:30:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4983284c9b1sm3691127f8f.6.2026.11.10.01.30.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 01:30:32 -0800 (PST)
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
        d=suse.com; s=google; t=1794303034; x=1794907834; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9GvdO8Qxf94NWxVkOAx2/KF9RU9+93ab0crOpa78VY=;
        b=TONSr5hd2ubHpdMiTt/EkTLBqOEtZ9Yua2jUvY0xgGr4kG2nVDgC5M7j71Wkq8gqEb
         7hwALZ1BHWsE6ziQbk6dFb9FD7xOw1H0PIynJ6IC3bUW4ZKEPfvmSBxeSMI4JdCo4EUe
         /z1czfhz7jEtxACkDdALEH5IduZjbQvwpo4Z6dEBryv7wWnfFFtsB9gqUeVGeDGyGPbH
         bJDleRVtIM9HQZauAmTuoIR/B8XvAJ1l6LwBGwRRkivLUNx4BMSyfuLEf1FDfaAiuRxQ
         +IXIWKSnSVN1BPBh46UdO41ynTsDSTsHcmukpgcsYYaity/TI307GUPLaRhmvgc6AzZe
         yvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303034; x=1794907834;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9GvdO8Qxf94NWxVkOAx2/KF9RU9+93ab0crOpa78VY=;
        b=OaYpFeP0pHx0XSd5qLoM7R63ng3upvytqRxVN7opSU8HXEFqexULmkGoHkkPx41nbw
         vpE+LpEQehKrdjUTbjRNtCVJtOU2BUIqVr+bcBAKNU1iH5OC+PwI6s59fYgHfLd2WDO+
         XHpEefwrTJ94Ra64vMo6oCG6UrNLxtmcr5nl3NHmdH+0Uj1NjOd8hP0mycqOyEvr1KsE
         qV/G1+AwWrALjo2MnvegIYA/gIOubjafP3LMiZe7IwFNkKX4VwKfCOI3z7Y9x27vYaza
         4tVM1bboqER6tdKso4iHrfEaI+haH6bAJK1iSbYJPbvkVZdb7os8wczaSCmV+e0GjtG2
         grnA==
X-Forwarded-Encrypted: i=1; AL+hErFuNIEE26tKtLllTJIjZF7rRvyN9NaCJxHQ43EBIZbOJskFMsFIcWZjusfHkt0uTLHwIho4zX7A/MA=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+4l//+OMF7cx/U8ZbdLBRy6seayC2psobAFegDgzGmsZxGHdto
	aRQ5Uii6zyct+xUCzKYzVk78vr1y3QvxKP4eij+bPD88FpxoBrn4X98Z34JnGMmDwg==
X-Gm-Gg: AYBFou3UCm1SRRmt7bKET4BMWCINud4QLYxNp6G99bTaCqXtH2pwlOs/feL9a0DwRwk
	AGSi+bKlo8iY5+DPNzzmAOOY/aWs1Excoss991zJ0u+dRwDrHcp0I361d+knUxlzJwOupYShqWC
	dLoCmXf5AkEbbNMNqcVKmoFULY3LuvGKSqI3vZ90hGA6tiUxpHyYtUgMaOjKoWvfU0l33Sp2Ee8
	p/nuFH2kzgiVppZwl4k24kbTv8okyaCkD38pT2lCvYD68d5FZUh/tCsCUzmDEIvDJbJYsq+EeH1
	tArW0mGbItANF4TGMSt8Bb/kwd8iBMd/ZJqzUsGo9diLv8qPnlSInswB+282zELqWECaVjEZsro
	BKb2BysUAbhlwbXCP4sUFDln/FK0uUv0nsqYzO0ud3YfdNJt4xu4NJ6atTCb9QupRZGEBMbTyrC
	GR1ZTqQaxcZ5AH2BJUHobP5cQSQiTi4H9p9yclDRAuiJqa1A8cW0c2lONAjgvbygH/Ql0qmp6uE
	FVPYFQDS/uFOPvyNvEFErGETcLN/HBHpZqpXUc6QhBPyuGccOmljlqOGf19pohA/0+qqnCen4zQ
	Kd7BFmZ/H9Cs4U88znfowUkElr4urE/AVlUN0voWDn+pusYxxAxHIn5BSXxhWVlP9GTxlMaYWnY
	lQF8tIzxazSAR2V+bFFzU3QMf
X-Received: by 2002:adf:f04d:0:b0:48e:7833:2e7b with SMTP id ffacd0b85a97d-4982c1da22cmr2637600f8f.1.1794303033153;
        Tue, 10 Nov 2026 01:30:33 -0800 (PST)
Message-ID: <d62fbd3d-f3e4-479f-83d8-0f2807162d9d@suse.com>
Date: Tue, 10 Nov 2026 10:30:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] x86emul: mark the trimmed emulator's
 section-internal labels maybe-unused
To: Shuaidong Chen <shuaidong.chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, Michal Orzel <michal.orzel@amd.com>,
 Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Teddy Astie <teddy.astie@vates.tech>,
 Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 Penny Zheng <penny.zheng@amd.com>, Ray Huang <Ray.Huang@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261110071231.2888628-1-shuaidong.chen@amd.com>
 <20261110071231.2888628-2-shuaidong.chen@amd.com>
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
In-Reply-To: <20261110071231.2888628-2-shuaidong.chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1794303034-6CADC4E9-A4412AB3/10/78276251493
X-purgate-type: spam
X-purgate-size: 1403
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10.11.2026 08:12, Shuaidong Chen wrote:
> In builds where the FPU, MMX and SIMD sections of the emulator are
> compiled out - with CONFIG_HVM=n, private.h defines X86EMUL_NO_FPU,
> X86EMUL_NO_MMX and X86EMUL_NO_SIMD - every `goto' targeting
> simd_0f_fp, simd_0f_xmm, simd_0f_ymm, simd_0f_cvt, simd_0f_mmx,
> simd_0f_imm8_avx2, simd_0f_imm8_ymm, simd_0f38_common and
> simd_0f3a_common is preprocessed out, while the labels themselves
> stay.  They are unused by construction, which the build already
> acknowledges by passing -Wno-unused-label for this translation unit.

If we choose to go this route, why would we then keep passing that extra
compiler option? As to going this route - I wonder what the other x86
maintainers think. Afaic: I can live with the annotations, but I wouldn't
be over happy see them appear (as their amount is only going to grow).

> Say it on the labels as well, the way the rest of the tree does
> (unimplemented_insn here, done in blk.c).  That also clears the reports
> MISRA C:2012 Rule 2.6 (advisory) - "A function should not contain unused
> label declarations" - raises against them, with no new deviation:
> docs/misra/deviations.rst already recognises __maybe_unused as the way
> to express this.

Emulator code is excluded from scanning in various other regards. Is there
a particular reason why this rule needs complying with?

Jan

