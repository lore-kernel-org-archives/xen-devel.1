Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCC2606A320
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 11:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GtYCiz2N
Received: from list by lists.xenproject.org with outflank-mailman.1494363.1693970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTeH1-0000Mx-Tw; Wed, 18 Nov 2026 11:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494363.1693970; Wed, 18 Nov 2026 11:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTeH1-0000Mq-R6; Wed, 18 Nov 2026 11:56:23 +0000
Received: by outflank-mailman (input) for mailman id 1494363;
 Wed, 18 Nov 2026 11:56:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTeH0-0000Mi-Fx
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 11:56:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTeGz-005PUu-SS
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 12:56:21 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd925f-2eae-0a2a0a5409dd-0a2a4502cc58-20
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 12:56:21 +0100
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd9265-4900-0a2a45020019-d155dd36bdae-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 12:56:21 +0100
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-490d59c3f0aso359336f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 03:56:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4a65560bd46sm4312591f8f.31.2026.11.18.03.56.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 03:56:20 -0800 (PST)
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
        d=suse.com; s=google; t=1795002981; x=1795607781; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x5WOddq/jlrwBJFK/p8AP8PX8OwjNJG3EdvFAD88FzE=;
        b=GtYCiz2N1nrwfEKNXwIsgA206/xZLlGYp+OV67dLqI0hdXFgfPHyFVm7imCKlmeg7O
         /TMiaOKviZqv0KjIQT6MyvF7wCvuwU7czyYRaGO5XegJZmLRraj8Xc+fobb2rBNQhcoJ
         yHJ/Cviied9NKef98DAhXK4JRLuco0y/bwg83Kldevms4kKHt1pUVifIt9jlvtW2a/oz
         WEFzdlEl8akakmZY4563GC38JvXanKiEow2Aq8wyoZiEj1JJnGUDhgMyjf1ijW2Zlz5Q
         xDEcAWJUQvyjlOHc6Is+0FpHfrLl2/0+J5aldKk+oD5BoceGZr1F8oQ02CC+ggmOEeP9
         BHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795002981; x=1795607781;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5WOddq/jlrwBJFK/p8AP8PX8OwjNJG3EdvFAD88FzE=;
        b=b7vmnCvn6eAkJaQVUmBEfvYAK8xO26JCOAE2t2f2jUg8Ols+bYV39rYFMdgP7vxHKp
         Z6WTMSGMat8m2NG+K8M3CYPy5rx4YgSyPPk3FB/X+lvGy1b3hxkjs2Vlx2PyWyr6KO0z
         41fWGvaOZyijx018l8Hai3KMOD3tLaC2m6WSFoRc6QiIaPBYEYl4sNhuIeb6EaGCOru3
         FM/O225qOiTkvFbgZ/6Reng+aKqZfgHXnUETMUDcZoRuNzezpmT3QoYCikaEjCUQQcVf
         BJXsR26x+p3KPnCjxCJH3IB76OUIWezC6FfErYKn3vQ6pYBBI1srTmWZ1VwvP+oNDmkJ
         NpVA==
X-Forwarded-Encrypted: i=1; AL+hErEMspQvS8R9qZTNqxkuySAd0b3tP5Qkn7yQRSvSODDxmfFTMaEaoMN9ba3cJi2aPfCeX2qeWCLpoM0=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9tW1HMKismE1+EctEPPgHPyTs3Y4gWd59uRPSp3FnsDjRmQWRp
	HVBOFobCVJSbMfLDtsu4j22SnuuYH8QBUAwrG3Wzk4A179srRHyipr9wRcNcw1GGjkX6Nx0Es5W
	XIdwtvQ==
X-Gm-Gg: AZFdTZeNzL1oIe49lXeahg+CNRDx2+7y41MMM7a9r+ObA5LHFzDqRYougAfXCvkdNmp
	ASd61dBF5locigfZWlcMCDCQ/juFvUAZRF8s/SK8DjwZ9rWxSSXcKSNEMoNdFw7yzl0qL9Ph9OH
	BCtLQXW2qvs9rX7VAy4MED9NAwa5m4r9MmovqR/HvtRtF+qcUHPnZOrrkl2tJMjf6Tg4AqXxBN6
	SxCMewHbL3y/KSbN3UcrUQ2usbww3+sWl8GJPGTilT25D1J58ZlZXPpznqzLBdKgIj+cusTTC2e
	eqSGET0Y93YbbJChwYR0yDeFMez3W5BiVcAwF/omYQA+wCJrLLxjT4t6IKR16UZ/IzCmuCcMXgT
	CJ6X8PqcTLA9myrAcl5LX7mCJ1VB6X0GWCJ5jv8iXckH0WBAAi/vPU/aVFtDquX7lAUN8SpWw51
	SCmWNPAxRxFGzLjce/xTNX3kl2Zz/vT1MncGfPgthmiqlOLG6VuBYzQfycQ6Kab90N49ZPTy2qS
	39ePVPHPkg5CjV5Lk0uZCFnPWB9JIdSpY1p1BG2u1yxbEX6LaGUhwIdoYPto6cygmXkBd3cnMAS
	8kUP+cKwrFgUoqyDCNPP2obAr6iElv0GESQyMsxKctb2A6jSF2xYlgBWGS36M/EvN8XijV29yfw
	JUUwcKuF8yGYHh8bDjw==
X-Received: by 2002:a5d:5d0c:0:b0:4a7:593a:f421 with SMTP id ffacd0b85a97d-4a7593af8b3mr2907997f8f.47.1795002980906;
        Wed, 18 Nov 2026 03:56:20 -0800 (PST)
Message-ID: <e32caa77-9c47-4ffe-9858-0c26e1854b54@suse.com>
Date: Wed, 18 Nov 2026 12:56:19 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 15/44] xen/gunzip: process pending softirqs once per
 deflate block
To: George Dunlap <gwd@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20261103-asi-hvm-v6-0-59dbc5ce9615@xenproject.org>
 <20261103-asi-hvm-v6-15-59dbc5ce9615@xenproject.org>
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
In-Reply-To: <20261103-asi-hvm-v6-15-59dbc5ce9615@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1795002981-F83246C6-73ED2757/10/78276251493
X-purgate-type: spam
X-purgate-size: 1668
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03.11.2026 23:13, George Dunlap wrote:
> Nothing in the gzip decompressor lets the CPU run softirqs.  The NMI
> watchdog treats a CPU as stuck once its timer softirq has not run for
> the watchdog's timeout, 5s by default, so a decompression that runs
> that long panics the host.
> 
> Decompression is normally quick, but it need not be.  Every compressed
> deflate block builds its Huffman tables with xmalloc() and frees them
> with xfree(), and those calls reach the xenheap whenever a request is a
> page or more, or a free empties an xmalloc pool page.  A subsequent
> change can make every xenheap free end in a TLB flush on all online
> CPUs.  With it in effect, decompressing the PV dom0 kernel and reading
> its ELF headers on a 480-CPU host took 5.2s instead of 0.5s; with
> cpufreq=xen:performance max_cstate=1,0 dom0_nodes=0,relaxed added to
> the command line as well, the watchdog fired before decompression had
> finished, on each of eight boots.
> 
> Process pending softirqs after each deflate block, as libelf does for
> each ELF note since c5089fae0f6f ("x86: avoid tripping watchdog when
> constructing dom0"), and as the PV and PVH dom0 builders do in their
> long loops.  Every caller of perform_gunzip() runs during domain
> construction at boot, on the boot CPU with interrupts enabled and no
> lock held: x86's PV and PVH dom0 builders, which call
> process_pending_softirqs() themselves, and kernel_decompress(), which
> Arm uses for dom0 and for dom0less domains.
> 
> Assisted-by: Claude Code:claude-opus-5-5
> Signed-off-by: George Dunlap <gwd@xenproject.org>

Acked-by: Jan Beulich <jbeulich@suse.com>


