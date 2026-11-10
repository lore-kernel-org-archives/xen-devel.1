Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2D6606B14A
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 09:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ez2FaOIz
Received: from list by lists.xenproject.org with outflank-mailman.1481364.1685220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQiMD-0007S0-Gf; Tue, 10 Nov 2026 09:41:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481364.1685220; Tue, 10 Nov 2026 09:41:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQiMD-0007Rt-CU; Tue, 10 Nov 2026 09:41:37 +0000
Received: by outflank-mailman (input) for mailman id 1481364;
 Tue, 10 Nov 2026 09:41:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQiMB-0007Rn-RC
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 09:41:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQiMA-005TTJ-Ah
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 10:41:34 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af2e6bc-e002-0a2a0a5209dd-0a2a4509840c-44
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:41:34 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af2e6ce-be1a-0a2a45090019-d1558033b474-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 10:41:34 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4b7252a32c8so18850575e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 01:41:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba01fea745sm50839195e9.10.2026.11.10.01.41.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 01:41:33 -0800 (PST)
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
        d=suse.com; s=google; t=1794303693; x=1794908493; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2pbxogRiP9dDJDTzU11ocsl3p+0uztmOwc60sv1EXz4=;
        b=ez2FaOIzoA4U9Vz3W+oQm0yhpGI4H1pR3v8fR5NewuAu5n6apHiSfEwzSTLlgMhNiT
         fqyeGS3P/IVrLsbNMIMNDWC7nl1LU1Ku/z5WqKN5jMCNxQ+pOUhjQNct0eX5k/OlYhky
         eyDmkUg2h/NyL7U0CLOlIV8OWHMFfmal69qoTSka3pqhFn9sTcXWJPmS+Pbil4GZeDCE
         DaZA6sT34i/yqVhWBXcmTuX97EdLJQ+rm04YeRSmZHLaGQ0ZKzeIb1cJsrRnOPdOTEc7
         HOA+JegPCIo2A7JdZqIRAQdy1ynsk9lXGWQKhDlf0kcaJbgt8S6UrKrsQmtTGfPeKSr+
         1cow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303693; x=1794908493;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2pbxogRiP9dDJDTzU11ocsl3p+0uztmOwc60sv1EXz4=;
        b=WLKd3+WRNRWdIDuR2CCYk8zP8Swr2g68NxXUxU8e/Ivu+pTVMB8zvIRFI1K1p3aLLm
         eqJp66RyVCjUnReR9KogpsHwdKRShzNhrVTq0eBHwLp9l/PA629Kwa6qHG+iWqALcuMH
         nkj+dKpejUWP0rNmJl7AyjxwJHejJKFmFjWLkkzJEpgHNSWSuMpxyLr5rG4KejzvKnj1
         6iT/k5wMFKm5VK+DHNG8XHOfD4bpnuMInpP5oeOJB+955+kfLaw4xH8ZkAf4ZR2wAxdk
         iTU9mvXIFQ2Y52uycjKBXpuy+r/fWnVm6u/frLWpRwg63tdoRnrGPE1OB4/gx6y/Srnq
         IPTA==
X-Forwarded-Encrypted: i=1; AL+hErFvA2UdB6ySaRKSOwSyYFbqkMHEgC98S9fd3I/OWijHr197wE87gbIyjA4Egebnm5vOke677KNx4RM=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/yzTstjSIHWiKt29/zHzNinpITrlbwRkv1CnmYZjT8PGlB8kJ2
	8W6oPaYOX2d+MrRFnzY8aVWUIAsuZ/vLsPDosfxcBne8LwxP9HIu1LE8c/SzQ8GloQ==
X-Gm-Gg: AYBFou1d36HPjr42DwEfz3Cnmr2O/7i/9hP3z5NDS92jZ7bwFGszq2Za2IfYpEmGR4Q
	BcIE+ZTykCG/SLRpwMubF9chPyxXb5NshPK2f1AVvzvxaSNJeA8luuW9n1kf0mA8WrhffCuA3vv
	3TuVMwIeDK48yV06+j/mIOSbZPQGaZf7TQHOqpZXWkJrX11JThiWl6ZydZEIZQoSFNZJhGaAORE
	lGXPL2g1GOjRxHYeWUuYktXh8sQoh+xc2XazJsP4Raqm+XUbL7AczWfQ6fx4hKVGAbIEd7uSaFG
	hZcqDJSlxAh4eVvaBYd93J52HyNnjI+0YBJ7tpZpcdzsRSabPlu2eq17KMlUGsxiF165RPa73aN
	oqZcii0RIQB/f8IfyVj7/MtY78aylUPTA2xWMC3qp9U/WHNEbnjAdorcvFWCujuvbV04jAVRz+z
	4QhbqL5Bjc5A/anJ9xox93nyVjHbh1A4CX93J4vYRLswN9gEJ1VvgH/+rXUMkj7sYDBG2q43sgZ
	kJDXR8NiEH6/Ehz4LPj5tmTjlhBRvt5clTfXv2dH7GQKLN9DTuGNliXugIg7XyFXdjNnj68j8w4
	GkBdXlm9R4xfb7PXUvZVEyJEHZBwxN5yuVJ7COP4NdcRtFJeSG5VI7364mA6k1IMF/wJrj5Ek5P
	weWNYqCJbdTc4kdgO
X-Received: by 2002:a05:600c:c0cc:b0:4ba:6d8:df8f with SMTP id 5b1f17b1804b1-4ba06d8e26bmr8132545e9.15.1794303693573;
        Tue, 10 Nov 2026 01:41:33 -0800 (PST)
Message-ID: <49b1f05e-ed9b-49fc-84db-ede026e55343@suse.com>
Date: Tue, 10 Nov 2026 10:41:31 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] misra: deviate R2.6 for the labels generated by
 CASE_SIMD_*
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
 <20261110071231.2888628-3-shuaidong.chen@amd.com>
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
In-Reply-To: <20261110071231.2888628-3-shuaidong.chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1794303694-FC817034-651E60E7/10/78276251493
X-purgate-type: spam
X-purgate-size: 1346
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10.11.2026 08:12, Shuaidong Chen wrote:
> MISRA C:2012 Rule 2.6 (advisory) states that "a function should not
> contain unused label declarations".
> 
> When SIMD emulation is compiled out of the x86 emulator (CONFIG_HVM=n),
> private.h defines X86EMUL_NO_SIMD and the CASE_SIMD_* macros
> deliberately expand to plain identifiers instead of case labels, so
> that the opcode switch builds without conditionals around every case.
> The labels they produce (e.g. Cs0x0f_0x2b) are never the target of a
> goto, and the build already passes -Wno-unused-label for this object.
> 
> These cannot be annotated in the source: ECLAIR reports them at the
> macro's use site, while __maybe_unused could only live in the macro's
> replacement list, out of reach of the existing text-based R2.6
> deviation.  Extend that deviation to labels coming from the expansion
> of a CASE_SIMD_* macro, and document it.

__maybe_unused could be passed as another argument into the macros. That
would feel redundant, but if that's the only way to please Eclair, maybe
that's the way to go.

Like for the other patch I'd also like to understand why fiddling with
emulator code suddenly becomes necessary, when we already have a blanket
exclusion for e.g. rule 16.2.

Finally, for both patches - aren't your Cc lists excessively long?

Jan

