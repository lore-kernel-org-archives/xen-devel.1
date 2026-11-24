Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82A7606A322
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 13:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DsL/bLXM
Received: from list by lists.xenproject.org with outflank-mailman.1500959.1697006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVqhC-0003l2-Kw; Tue, 24 Nov 2026 13:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500959.1697006; Tue, 24 Nov 2026 13:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVqhC-0003kv-IB; Tue, 24 Nov 2026 13:36:30 +0000
Received: by outflank-mailman (input) for mailman id 1500959;
 Tue, 24 Nov 2026 13:36:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVqhB-0003kp-RA
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 13:36:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVqhA-009cKk-SD
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 14:36:28 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b0592d9-2eae-0a2a0a5409dd-0a2a4507c45e-30
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 14:36:28 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b0592dc-b4ea-0a2a45070019-d155dd31b5ef-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 14:36:28 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-49465892f7bso3300905f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 05:36:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6b2050f1sm27783397f8f.38.2026.11.24.05.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2026 05:36:27 -0800 (PST)
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
        d=suse.com; s=google; t=1795527388; x=1796132188; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UZ0fJUDZCaD9fA4fYaaEdjhmz/jIpU3fsFTQkxOERUw=;
        b=DsL/bLXMtw2eonNKKdCNM/fY5ddsXjQb77Q7Fe4+kk4a0v3P66hgd4z9x3hlAPFPPq
         DJFdolrIpz6aHF54UkbhICGyh3QsZJXZlCE/BE4b5zPKfjbbiKj+rbybn5FsJTADhX/0
         lyRzpL1gxFZh9gdnj4R/U049F4LH/Xk0SJ9HV6sTNVJhy77YbmlhPiMr3rdnXMqB6C7X
         slnVysecelSUf6JZIQ/qvJ5hIIlkqo31rPa4TcRR8ljR/l1aDRNJQOFgbvuCLzBIy4lM
         Ex29vU9QCpnUZRiaLacnCWE3JDSTiPRHhiq2e95CeGwavA/Ugg4ADYM7/eWA9uDQ3251
         tIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527388; x=1796132188;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UZ0fJUDZCaD9fA4fYaaEdjhmz/jIpU3fsFTQkxOERUw=;
        b=NBYfR3XEibiKsI5BqEs+nfUoFAyNAs8VG2hF73NlQWRF1z+Zh9Jo/R3093TyufaX5Y
         RUeg/W/B4UYhnQNTZ0sM6kcIT/v+k34n0xaNjzff6IHe5l1rP9FLVvszgTl/YYc0+6wL
         P52sp+wu2nEKq+xuIY8DEvpKfBJKw8JggjnB8LjKGGmgvNI3Ta8e/Aa7yBNvoZiXn3Dg
         rzczRlugx2MDgF/06Nv9dUB6fyP03KVi8a6+7PNwzIK06sQfY9Wcv7XUXjxdspROuROk
         1GvLH9vorDpuJgMtCmseBRSG89RTFm/pXMxAFd2hUFMEbvKT4hD4wZ1n4AmIMP5OvFQx
         UB+A==
X-Forwarded-Encrypted: i=1; AL+hErGm4bwW11scOIHv29sdO1usGiDkkdy5uYxP8v83pb6OHKkGGUumW0HedX3gdKEsz2qdjupHakvLtqc=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9Rol+0ySSxbVabJJDtIMRPx/j9vqS3CF08rCokRc7qppuRpRtw
	uxBGbax6PzaiYNeaHfqOimyYdCcIJizXZsIfPpbUdKq7m+xGjbqs7awPwBlF9IffhA==
X-Gm-Gg: AZFdTZcVm6A5C5jCI93DDGgLHRCc6xHtKNZS4dCjJypCNG0Qy9Fh+jGIQWugjJZDyXE
	4ruuwjC7zpSXLwTiMa71OyDuBBAgIHgIx6EJXLpp7nnnjw8Zme8+B0ljjBotYrbuIgly2GnG43d
	PBafPiGxEwnvL6Mgv2ZTqL30gx2NYgmzF8FgMzfa2wH+RYOZs+5/U16ZKta0a7ZE+6QCq4L9LcX
	Mf/GGflnsqjj5GRG+sI7TxUYEeh2ko5cnXk5U/aWSu0gqDtS21S+4xcv5CFFsUrhN+WtEeiVUld
	qzIqPBxI9Rcv9UtnOgIPC1k0uuU+wwZ6JOireDlPTsiLHkzMT5fk7pdG2Cjmh+nRyEPxgp+81QV
	KwUgrKu8aRzVU3hV30VA1WcAAGL80q0RYykdxLeUBP+ExQGjDk6ACs+lYhszZJGU2KxEvcqs9Zi
	8lOrideM15YjhkWIhAhS5s2EW3Ok4rKDrNyy6b2/yZw+Y5gRFuLImAqmIHd97ecy2B4S6+mec1E
	lkItYPwVt7Eufib8586ZXnTuIDzszSWGJ/h2MAtkBhaNtyiB4EDbh/aY3mfIlL0jmYrfQkF+NL0
	kIm1Qy2eIdh+p/MtDprBJDvobssj9c5JilDA2EQ4b54MpNmxmOSG1jd0OuYjm+rprzn0qxeott3
	Sd7yD+cgdynqeP1Hs
X-Received: by 2002:a5d:5d81:0:b0:4a6:f154:b402 with SMTP id ffacd0b85a97d-4abb1baaae4mr29378321f8f.10.1795527388162;
        Tue, 24 Nov 2026 05:36:28 -0800 (PST)
Message-ID: <3959519c-4445-4098-bf7f-326eab6b2244@suse.com>
Date: Tue, 24 Nov 2026 14:36:27 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/emul: Reject MOVNTI without a memory operand
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261124123743.273123-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261124123743.273123-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1795527388-34CCFAE4-3E3F2214/10/78276251493
X-purgate-type: spam
X-purgate-size: 421
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24.11.2026 13:37, Andrew Cooper wrote:
> MOVNTI encoded with two registers is treated as a plain reg->reg move by the
> emulator, but it's a nonsensical encoding which hardware rejects with #UD.
> 
> Fixes: 372da9b41e0f ("x86: add movnti emulation")
> Reported-by: Teddy Astie <teddy.astie@vates.tech>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


