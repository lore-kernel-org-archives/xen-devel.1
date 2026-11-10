Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85111606A330
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 13:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=aLTT6xuC
Received: from list by lists.xenproject.org with outflank-mailman.1481848.1685751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQmNP-0004lb-G2; Tue, 10 Nov 2026 13:59:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481848.1685751; Tue, 10 Nov 2026 13:59:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQmNP-0004lT-Cc; Tue, 10 Nov 2026 13:59:07 +0000
Received: by outflank-mailman (input) for mailman id 1481848;
 Tue, 10 Nov 2026 13:59:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQmNN-0004l9-L2
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 13:59:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQmNM-00EI7l-SS
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 14:59:04 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af32314-bab6-0a2a0a5309dd-0a2a4508d20c-38
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 14:59:04 +0100
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af32328-f659-0a2a45080019-d155802df0df-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 14:59:04 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a35d5d4a20so24511785e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 05:59:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ba0204ee67sm67771745e9.13.2026.11.10.05.59.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 05:59:03 -0800 (PST)
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
        d=suse.com; s=google; t=1794319144; x=1794923944; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8oWI6KSgQGvjA8OXqgOile+qmGJ7ltWuL7UT/yRCwiQ=;
        b=aLTT6xuCBLXmEs9LrJhxAWQihQ42KDXlCvmXCwBvoJENZ1ZhyDyptsLYvHYmIt30kg
         x4lAKG7Y5viWJQHUG1GQBwPuhk42idxDtrxcfyYfl5hcCoAelOTO4DrA16zrUb0iNhzo
         g1eeSpGwFNDz7CoLwoWoJY/RVLQ82pZF3oRatz9ABc3WpXMG+BchhI1jy8AYI8nwQ6GC
         IfjK+/Sf9jpfJUChJ1EHRE5KU11lIBU2kYbTpr8536X1TLClHt+jFrunk2x/aisHjsBX
         BTeLXUS2uMDFEPDA5b9A59nVo+eHymnHL1amnBpHANLBJX9JFly0P+k6ty1TW+AL0Jej
         eaaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794319144; x=1794923944;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8oWI6KSgQGvjA8OXqgOile+qmGJ7ltWuL7UT/yRCwiQ=;
        b=EF5jASqnuZKvWAeCpmDNWwt0a1IjrJiokszTXUEXSLfMx4hBII4VuG9HyoXXSD2D6o
         2sN3+7gj9XJXpNd/gmrGV3z1LZfm4NkG2sflj53yhygQNMhe+eORiKkMbMXazQb+KINH
         ACpYVjn+HLCCKld6rJyeZ5KE9U783QIbGzA/s6/4fDZanzShtz7nI7+ngdeaFRR+Gfwn
         R5XgIUjn3dRZI+GwBqXKLGtcO95w9L27Ztl3tklNHMGQEQ6NJceMvpzFfXtbQyI4RBmV
         Am5ifspfYiUDqc6Kcl1DZDXzlR3e1q8dOmc0Zdt8G7wHQYkAyXwHsQsaGWjhTFR55L5s
         GYKw==
X-Forwarded-Encrypted: i=1; AL+hErGV68hay1fd9iVIpS/mTL5VqX0Y1ElRDKxw+i/Q21T58DYD8LQpVX7UDKWMhq+c1d/L8+hEO87c5aE=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/6TBIUeHBcvf2kYMWhJ7iS2HbPRKQGuAcvHHaGjf/t42iI5tOm
	fUTfZrxCMU3xiePYHhFCcSPmHjK33ocX5QrZl9u3L2FLMZ0SPd4JjR35JXL7QJnLNg==
X-Gm-Gg: AYBFou2bCayDG5ZVN79q9vQZF9/ROhLYIuv/ag2OP2f2iF98eiH1sh3Qnwr3CVF98co
	MNuOi302j/eZ3boq8zj0JNPIGypZ3a0+56QSdO/CxCR/aLhrN31nw2rOTI0WX8d1lJzbNDfn+Fw
	xTIEPZGke0NronFsJVpMFHNucayK+UiYb7WIdQOgMCszckN6M0FOsQ+5tMdlEjXlhlRFTXhCcGP
	ygDi8miH8Y0qc8D9mNzxnwEhA9SF3VgPCHQtkmof2uxBHldOsShTKczhCd/fR7j/taMUymq8zXk
	dU7+Bvv8KPQL7D+CgUaRk5I8fUC3+AUQKT2an16zMPltU+eUVj68y/T4nbotu/n0/seNsw+/4zo
	C7WZqW2GMobZmo2qVxgpRFr7iE/pHdknG8/0OoFQPedbqcRgx7X/89h5rwv2G9jLth1iu7wRiXp
	ar/0mYHQXa4st7ou59zuZmuHUoPcPiW/uwyto0CV/5p4++qJsEQ/xWkQ2LQ5WSv5wmpyJJ1FNkh
	0QZE9Fd8ZDVvGi8TfaS9MWI4cWVZtz44ZpQU8CVaGiRKuD7DhEoY1zP4iymd2ZDb27luUSA9TPJ
	cYa0+AERmgDmu9dncskEA0SBKLKWJL/6gjiI4nRGIZGjSYQI+LPcoLMMF5DdpXDer6QEGBAVgIC
	6gCR8c6v9yiiDXRv6UtAES0ytMaxRMqTbNnedvA==
X-Received: by 2002:a05:600c:1d8c:b0:4a1:f625:2108 with SMTP id 5b1f17b1804b1-4ba0235658bmr47421215e9.33.1794319143592;
        Tue, 10 Nov 2026 05:59:03 -0800 (PST)
Message-ID: <be1c388f-e69a-42ca-9d21-219af6b01571@suse.com>
Date: Tue, 10 Nov 2026 14:59:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] automation/eclair: deviate R2.6 for the x86 emulator
To: Shuaidong Chen <shuaidong.chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20261110134902.2891528-1-shuaidong.chen@amd.com>
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
In-Reply-To: <20261110134902.2891528-1-shuaidong.chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1794319144-CEF5F87B-ABF7E525/10/78276251493
X-purgate-type: spam
X-purgate-size: 1094
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10.11.2026 14:49, Shuaidong Chen wrote:
> MISRA C:2012 Rule 2.6 (advisory) states that "a function should not
> contain unused label declarations".
> 
> Depending on which parts of the x86 emulator are compiled in, some of
> its labels end up with no goto targeting them.  For example, with
> CONFIG_HVM=n private.h defines X86EMUL_NO_FPU, X86EMUL_NO_MMX and
> X86EMUL_NO_SIMD: the CASE_SIMD_* macros then expand to plain labels
> instead of case labels, and the gotos to several hand-written simd_*
> labels are preprocessed out, leaving 91 unused labels in
> x86_emulate.c.  The build already acknowledges this by passing
> -Wno-unused-label for that object.
> 
> Annotating these labels would only add churn to the emulator.  As done
> for Rule 16.2, deviate the rule for the emulator as a whole.
> 
> Signed-off-by: Shuaidong Chen <shuaidong.chen@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com> # docs/misra/

As on a few earlier occasions, the constraint on the ack can be dropped
if/when Nicola or somebody else have confirmed / acked the .ecl change.

Jan

