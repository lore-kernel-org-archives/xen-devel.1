Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63580606D805
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 13:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=d1uU4VRe
Received: from list by lists.xenproject.org with outflank-mailman.1480077.1684017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQPEn-0004q2-VU; Mon, 09 Nov 2026 13:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480077.1684017; Mon, 09 Nov 2026 13:16:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQPEn-0004ps-Rr; Mon, 09 Nov 2026 13:16:41 +0000
Received: by outflank-mailman (input) for mailman id 1480077;
 Mon, 09 Nov 2026 13:16:41 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQPEn-0004pk-41
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 13:16:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQPEm-007VAa-Gr
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 14:16:40 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1c7b2-8faa-0a2a0a5109dd-0a2a4503d4fe-26
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 14:16:40 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1c7b7-fae8-0a2a45030019-d1558035ec36-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 14:16:40 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a2d6d01ecbso4846555e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 05:16:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b79501bdedsm147514265e9.3.2026.11.09.05.16.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 05:16:39 -0800 (PST)
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
        d=suse.com; s=google; t=1794230199; x=1794834999; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JVdZsM9yHnk8thbSju40rrnpQnLwEEl4e8YgDqbWhTI=;
        b=d1uU4VRehKcwfiKjSVc6WZ5zWzVvchyVlKv/Pfl9Y5ItcJ+Yy+7CF4OvsL90kRcIU7
         256sOYH4hJS/IFNRFGYFIHUS+xnK1g9dhUxb/O6dxNHoNCuCqaJ3vvulCCZhFmCWJJUH
         bR4Txw5s18oetsgcnBLPW/TIi1nTvc8BXtVh1xDZ162u2MdTNv/0SRN83C2rUr9tSV2R
         ZR0HvzOLEJ/FuL3/GRH40rnrhFEqFKXNak+xo9tojKXAc+Uem5Gdar+OWmGD2KOorOkU
         NZHAlAyywj1gC0LGyEI+sdvE5Vb/2Q+JnahpTjvOSavSlI/Hspi4sOHLCZlyYv9UBbgo
         DDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230199; x=1794834999;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JVdZsM9yHnk8thbSju40rrnpQnLwEEl4e8YgDqbWhTI=;
        b=yawgXLGKe0LJBvLgrSHVp6zS741ko0PBHi6BraH7/eNauLG2qTAdIN9QVTKKsSpiCO
         3WXr+g5101Mo98aImrSdLpGpXp1Vw2a+WoT3uyG7YqKOuxu9x+r6pFnHaCidiEwiQYP0
         F5p9T/tb0j/VyjL12PE4iZmKoEbJJc5V7XGJXqWtuZ+el4097nxWXxSLJi44i912+6mO
         W91Gr9Bvb1oFq2yALOFos4d9CPeBDbb2I9m3SbZDzEPTHvMlxixjaIAcLilH9p/kkldc
         4Lg6rb8Wntc62VoYzSmvDIuoiINZs8tLkttKRMzssd/yqmmfwsmiElkfGQ87+DaoTO7l
         4Vxw==
X-Forwarded-Encrypted: i=1; AL+hErGLiFUqc5mDeDZuDZq1QL0Yb6xWXuceLV5SMXfWFXQruvzbRsofk9Ly1986QNgTfkuvo9bHBT05zWg=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/twDkgntflDaC8XY6QLZUkQc1fiWzBupLSsCT23WS3jMuwPqu0
	SIxEnkVBTYVoQVT7Ej+rGxfIkqbqTYzgoGJyYvnXpEYYtmX3g5yzm2qkE+d2Eovdyw==
X-Gm-Gg: AYBFou1Ink+hWw+QmJjtqb5NVbHDuDreLYLR8ZnShUQq0joph/pwHGzZQOfxIf6Ldes
	2VmkL48UAam5vA7KNSpE1gOYQhRWHXL5XckxufNcbtHy0NA94+sik7rxP4c+bi+Yv/JOsOIeSpA
	EJ/6i4i0BXPtw+Jh/HDsVTpL+XrlYZO3N/ejgHlLYyVDEYTVAIcY6F7vf9q5gNxbCfkWUAuf0jF
	+gmlFMVtoqClph5w2otVugkhoaLt9pRZ/FN5fdkzGLk00/GXcdm+LP2KuNyVAdn3tp+bH1sWQ/i
	QflebDUNhOgBfgRPn7klkxX4nTHyGIeE9rectv8vU6dStJr5P3VHTCO7mFGD0uiYEWp/pwPIGh9
	GyzXPDj73gUULTo60JIvjE0weRf3wjl6k9smzNcvZGzVCMkuYy5R7NazShaA2JKsaPglx/0lp0x
	RTDSrhhuMADjdfjIN0GuF/4KgAvRhN7xZu6/St6a4ztGTQfIYJJYHKEkM/G/w84QvpG+OvgsG7h
	C3XeMeuibuodb0zkLbd0bptWozb7Q0eEtWVLj0e2iKXwW+EATiKDlA/JlgTU1eWnaeimJSmN6gr
	tnYSexyBj1ymhS2DseIoRhLl+099qQO2+nr2wm7pV4yKODM/TgiRu97ozqKOirJ+lgP4bdRXDs4
	BfL5+GRLDSkvUHpm2
X-Received: by 2002:a05:600c:3492:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4b963c7ce07mr70096745e9.24.1794230199526;
        Mon, 09 Nov 2026 05:16:39 -0800 (PST)
Message-ID: <31b70011-02c0-42b5-84b7-110b6e7d3931@suse.com>
Date: Mon, 9 Nov 2026 14:16:39 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] xen/riscv: skip disabled CPU nodes when probing
 ISA extensions
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20261109124937.78186-1-oleksii.kurochko@gmail.com>
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
In-Reply-To: <20261109124937.78186-1-oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1794230200-6C2E04E9-F3B2E21A/10/78276251493
X-purgate-type: spam
X-purgate-size: 671
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 09.11.2026 13:49, Oleksii Kurochko wrote:
> riscv_fill_hwcap_from_isa_string() intersects the riscv,isa of every CPU
> node under /cpus, including the ones with status = "disabled". Such a
> hart is never used by Xen, yet it can still remove extensions from the
> host ISA: e.g. a disabled hart without the H extension makes Xen panic
> with "Xen requires extension: h", even though every hart Xen runs on
> implements it.
> 
> Skip CPU nodes which aren't available.
> 
> Fixes: f74ebf58b518 ("xen/riscv: identify specific ISA supported by cpu")
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


