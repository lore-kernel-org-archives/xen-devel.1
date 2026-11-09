Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046C2606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 13:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Csm50TaI
Received: from list by lists.xenproject.org with outflank-mailman.1480023.1683952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQP5u-0007vR-PX; Mon, 09 Nov 2026 13:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480023.1683952; Mon, 09 Nov 2026 13:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQP5u-0007uV-Md; Mon, 09 Nov 2026 13:07:30 +0000
Received: by outflank-mailman (input) for mailman id 1480023;
 Mon, 09 Nov 2026 13:07:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQP5u-0007u3-1r
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 13:07:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQP5t-002rOT-79
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 14:07:29 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1c57e-bab6-0a2a0a5309dd-0a2a4502b2ee-32
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 14:07:29 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1c58e-6ca4-0a2a45020019-d155802ebd26-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 14:07:26 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a4d7ae1ae9so7523545e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 05:07:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7efb272f5sm240933215e9.15.2026.11.09.05.07.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 05:07:25 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794229646; x=1794834446; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3R7NupMc2lCg+/pdJmDIfs3OJ68ffldwbjuDmgWU7T0=;
        b=Csm50TaIHpHVf8l9HSjeGrsr2Tu8/xorwLpx8vuK1v3Djyd1edetnsDjiaBMnUHjqo
         TxhXtU2UQZJ1WylGg8HTIUqyNVAXFwPzBgYBdzLI2obl1K5A5zavm2d3QUJT9TTRuBF2
         /biAF4MjTB9l2jpKR96Tjeq6D2ZLG1F2vN+pFBxpRnY+gySDMtT/NzWdB6RIoa6wS+RC
         9s+MDfg795WOmJyipMXjDij3S3cF3k46K3VSKjM6HOlWhkboBg6UYrCR5v0mZtfJh5CQ
         ahHB6cfMDImfeEwdeeZSppdjbnqUuKlFgIFN89fhMCNR3kVFj8RWJEEq/DzcXZ48RFzA
         wPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229646; x=1794834446;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3R7NupMc2lCg+/pdJmDIfs3OJ68ffldwbjuDmgWU7T0=;
        b=SZ1x4YFqzSvrQLsZJGhqHyHQtYLtyCWSJsTwq8w4cxQJDCg06apU2MOURimoDcXO2h
         GVBbfsHFIqC1kJEPehFj2sHMGzhmxwJ5KcnZq6CZj8OwNAB9zFyd6cxqeq6prVBVt5md
         +5Wfkn+piEXK1+u8erBOwpAeeazDKOv61ARNps2/2GvDV5t+PAnSnPC/T+h2GttErqBm
         hBgGZ/5cv76dEgFQ+ihhf9ffiOaIkViFdkwTAhSbRyZ46QbeQMlB4jWJWl0Ws4NkVk9B
         +gSmZhViDmsIz8TNfzOP7FTJQxX1jJGkvQglY1Hi2Z9p6kmYjD48n45K9sVtuEpLeMJK
         BAlQ==
X-Gm-Message-State: APuU4Z//LSg5wbgUrwo6fs5FKqM6YGxinGw+2E2KsCVJnplPa1eJrBSK
	MC7pORj7Pjnlq5l1FxPRb2hyRJGmNLGrNgQIJTCQkP65+MXKGC/DsxWrWfxAOkMj1W6QC55vgds
	izwuqkw==
X-Gm-Gg: AYBFou35dwgwvVNhtz/ccTGErNquTGwqkUWfNR8YhtuTQ/VEIOhOXN2TCSqaUF3QTMr
	TqC1EZ4ydsVGfn7WcbPni7p2129PhdJb+S7vJy2Ci4uncgkDWDaFOHSokBUFtIjjUP5q8kKCbYN
	FNfakdZfiGDO8VNLJi2qpFJxR/4MK5//2Mfz/ZQ9SvvdpDLD5IUMTJ2OqI8cUxd+SdcKL+1I8Pz
	J02L8pjrjeBZtT2JZRUzDHKoY7u0t86TAFMzNthk27uZEvZrrBh3M1KCRsj/s0glYCIcdDUBqIA
	uGJqDevqDA/KA/Sp2yESgwz0Ak2rVWEGKTAGJhf7tmDV9tS2nSYCP753SrVv3m1Tr4YMGywXCq4
	zXhr1JAMb/EuKopC1DiZVlAF1P7frb8o9Mj3kAdLvjgv7pMU/ytDFHbGNvca5Iszum0SxlBgv04
	hRmYcmRM66VbjXqe61aZGe+XyiW1/O0XxIhjJRgxqAm3RiAiJHQ9sHxBC3hyUm9s9IZgfR6MNdB
	u1W+TpToIm7uAxZg0Dt/9yu2lEMgp+LFWKYzGvMul+9x60TpSNLM1YguMayX38bk9vin3+o24GB
	QoHscTM1Hw6S+s3b735nMVo8hJN+dKa2xSuW7xppvYMKIC7idT16haHdvur4Mc+PJ3vcuEMhgTh
	uN/BSFGc6xFopsPN8
X-Received: by 2002:a05:600c:3b03:b0:4a1:d97e:cd60 with SMTP id 5b1f17b1804b1-4b963c6c875mr73492705e9.16.1794229645885;
        Mon, 09 Nov 2026 05:07:25 -0800 (PST)
Message-ID: <d0de0425-a0fd-4ced-9768-ff102b953a22@suse.com>
Date: Mon, 9 Nov 2026 14:07:24 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5 0/4] x86: CET-SS related adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
Content-Language: en-US
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1794229646-F0AA52AC-B870C612/10/78276251493
X-purgate-type: spam
X-purgate-size: 473
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

One might think of this as follow-on to XSA-451, but that's not quite
the right order of events.

There are a few open aspects; see in particular the final patch.

v5 addresses review feedback on just the 1st patch; the other three are
unchanged from v4.

1: record SSP at non-guest entry points
2: traps: use entry_ssp in fixup_exception_return()
3: traps: reduce indentation in fixup_exception_return()
4: prefer shadow stack for producing call traces

Jan

