Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F51606A320
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 12:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XJ/9zu3D
Received: from list by lists.xenproject.org with outflank-mailman.1494426.1693989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTePn-0003U1-Ew; Wed, 18 Nov 2026 12:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494426.1693989; Wed, 18 Nov 2026 12:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTePn-0003Tu-CC; Wed, 18 Nov 2026 12:05:27 +0000
Received: by outflank-mailman (input) for mailman id 1494426;
 Wed, 18 Nov 2026 12:05:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTePl-0003To-Um
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 12:05:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTePk-004O9h-Vl
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 13:05:24 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd9477-8faa-0a2a0a5109dd-0a2a450caeb4-44
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 13:05:24 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afd9484-f479-0a2a450c0019-d1558030b912-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 13:05:24 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4bb6886d30aso7741485e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 04:05:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb7e57f6f9sm25398735e9.2.2026.11.18.04.05.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 04:05:23 -0800 (PST)
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
        d=suse.com; s=google; t=1795003524; x=1795608324; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NeOITHB8HaqupD5XRqsRVfIrRGpp4ch21Aw8dCOP6g8=;
        b=XJ/9zu3DQi3qYt0ycf2F5xLnzgYjbpXkc9IreC8b95F5Woec7nHq5rGpOqyo5D+2fI
         8lim5YgdOuLfRKPdvsgTFOc/lCzF+aY7sGhxk83rBPKQc0/rKjRJE+TgchH+4Fq+hXht
         23BeGIxPexXf8theCMLZT0sgZkdU7IL3sTXMD7T82zE8AHzXM8PsFGd4y13qXoX8vYfh
         tBURjvyfDX/P9GHrjZHhE++jxuZgGx9oSshW+97l02CwFJKJP2Ja0Kde5vTa+E9KMbMc
         H9jFIRMk8kYoGWeCDBwlNCKBNhX+zduZ+cRTIMi2v6Hds9L8HVwWD9e2xifI6rdbOxOj
         fLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003524; x=1795608324;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NeOITHB8HaqupD5XRqsRVfIrRGpp4ch21Aw8dCOP6g8=;
        b=k/jDz/5N94rqxCAQcmBINJaLrXpGuWySsQldCuHzo03wlaEdZbEYQVRep101Gwd4va
         y3wezoMI2vvsUWplpzJNWmmN9bFZnDJwjeav8ohU571bd+yDgFXsrBDQ+okn28zrj7Yj
         AUPwPRUKoRHOQouuth9hc/XXvGdbF1BDpz1ea+9I+s0t1tBe6wIG46O2Rx14MjhC0puz
         w2DhiH15s1v7rvPQCtSofp5oULyiw1cmUhgH+MqMNSvTM+/wBYLzQ67g5PPI33/ULxy+
         M4CPLuxGKfnyP6EcUCeIjEci3LvQepbkWYNwhAmr0ADFVZAaU1t+/+4IYGSFyifyPIy3
         ivQQ==
X-Forwarded-Encrypted: i=1; AL+hErEigVeDLHnG95HLkQG1ro9xFlvqd8QjC4D694GevhoGEUhUf1AHYYITMp9mxifvdHta8i1gvl/3BDs=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+rrssXA54qzLcgUnvgghpkfbODpw8qpNquqcW147dLLI2xniwi
	lvPOiglJZGLvHhrxgrhwXFwp7LerXzbFWiMKmrz7hgyfM61vvQJSCfYW4sL+EpZL6w==
X-Gm-Gg: AYBFou1S6Hr6bZYeEWjQaI2mqgEs5tiPbpROwZI5rQ3p6e8INOfVKUnjfnPh4UytLcg
	MXIEHhDfjl1nCnH+x4S3XmoXNHxQcloJ+8zuEzjmFAOIp1XMhL9prO0R8Ewm7MJy7y3zsKz//3S
	NfWdnAuTzQElacXynVUxHdiYUqHpVXyfEd4RFc6UPD+Hu7AO4nbqS47sY4W6JvB/QlKFQkZWEyc
	tqqBk28ZsNuiXa3nQgJa8mWxU0bSqt2NvyDejJ94aQuyXxTtYssoD8vEm+yYKXRKqxTlniqL722
	9HSq39xn3+lBbbyGsBvEnJAWUWrTycuc4JK1wUNoxWsjy/GATa5xpFEeePbFY9uROy96IEvD/Fx
	/Q/1KSGDfsYMy25/G7Ts73a9WbsC0R0EXnrwfbrxcpQjAP15GRZOsTesgFMnkclGt4gQheBCexg
	kEEobpC9qe8eql+oVmSS4FM4GQaOFd22VMVDRSGEJ4i8w8kbqsZ1b4cdzFnPWZ41OfHCc5Xx8rp
	N7DyXp72I40U1v/GkPL/bqaKs59gdslg57w4x62dFY1MC0FzVkMm9XMpIbeTPqim9Xc63oQBZx3
	dPWXVWfp39jHHn9p5y5MshlBuDp3EqrVKvm85lGCJvqowLlDFgy1Ao25k+gdtjGWFz1gaaZfPN2
	yMs8H64Wo+QmVDlLp7Q==
X-Received: by 2002:a05:600c:45d4:b0:4bb:5f45:c97f with SMTP id 5b1f17b1804b1-4bb7da29ad4mr41790785e9.27.1795003524176;
        Wed, 18 Nov 2026 04:05:24 -0800 (PST)
Message-ID: <8a0e1a5a-18af-4e6f-aaf3-cfa4e44d980d@suse.com>
Date: Wed, 18 Nov 2026 13:05:22 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 22/44] xen/xmalloc: return an emptied region after
 dropping the pool lock
To: George Dunlap <gwd@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20261103-asi-hvm-v6-0-59dbc5ce9615@xenproject.org>
 <20261103-asi-hvm-v6-22-59dbc5ce9615@xenproject.org>
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
In-Reply-To: <20261103-asi-hvm-v6-22-59dbc5ce9615@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1795003524-766DEA5B-A270B7F6/10/78276251493
X-purgate-type: spam
X-purgate-size: 1388
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03.11.2026 23:13, George Dunlap wrote:
> When a free leaves a whole region of an xmalloc pool empty,
> xmem_pool_free() hands the region back through pool->put_mem() with
> pool->lock still held.  For the xenheap pool that is
> free_xenheap_pages(), which takes the heap lock inside the pool lock
> and runs arch_xenheap_pages_free().  On x86 with a sparse directmap
> view configured, the latter takes the page out of the sparse view,
> at the cost of one to three rounds of TLB-flush IPIs to every CPU,
> while every other CPU's sub-page xmalloc() and xfree() waits on the
> pool lock.
> 
> By then the region is on no free list and no longer counted in the
> pool,

This, I think, isn't entirely accurate, as pool->num_regions still
accounts for the region (and pool->used_size still accounts for the
bhdr). Yet at the same time the change you make also better mirrors
the ->get_mem() side, where accounting is done only after the call.

> so nothing else can reach it.  Drop the lock first and return the
> region afterwards, as xmem_pool_alloc() already does when it calls
> pool->get_mem(), and say at both callbacks that they are called without
> the pool lock, so that they keep not relying on it.
> 
> Assisted-by: Claude Code:claude-opus-5-5
> Signed-off-by: George Dunlap <gwd@xenproject.org>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

