Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0B7606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2026 13:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MZW8enqD
Received: from list by lists.xenproject.org with outflank-mailman.1500407.1696569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVU3S-0003kH-PK; Mon, 23 Nov 2026 13:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500407.1696569; Mon, 23 Nov 2026 13:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVU3S-0003kA-Mg; Mon, 23 Nov 2026 13:25:58 +0000
Received: by outflank-mailman (input) for mailman id 1500407;
 Mon, 23 Nov 2026 13:25:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVU3R-0003k4-OV
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 13:25:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVU3Q-005vJx-Tw
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 14:25:56 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b043edb-2eae-0a2a0a5409dd-0a2a4507b5f2-18
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 14:25:56 +0100
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b043ee4-b4ea-0a2a45070019-d155dd2eec22-3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 14:25:56 +0100
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-498f5fa4f70so2678148f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 05:25:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6baa3882sm22196064f8f.49.2026.11.23.05.25.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2026 05:25:55 -0800 (PST)
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
        d=suse.com; s=google; t=1795440356; x=1796045156; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hcq1uI/p1QO+S14xXs/U/hDeKa19edUxwkhVWpnWbxE=;
        b=MZW8enqD+B9+9qpPOCcKHsMfC0XpWQBJ2kWS2JzOFQy7LNgZ5qEWcVKeVoneIBrdAI
         gaynyrlYFkySzkn6NsFzLrspUwQ3Xs61FIzEKz9JfaEjZbQWbHprrk+3O7ne5T9W4JRK
         /3z+uQNRqZYf3wQdhS6+oGlKuXXDwklWH5hLmnzRdIg4rfJsRHgEFR/pEkbz3TCix+nP
         oR+N3MC0Wen3cM+bhvkgkXFMoe9CUB5kfMcmRlrMOHfAR+8PbOfp/C21OrfyBxc/XgBW
         GoaSvWXKiUNs+aWuZJGP4butnpHN6Wyp9RvaCeN11g1sTpN+j8rIoKObl1EdsUwA6MHX
         oQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440356; x=1796045156;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hcq1uI/p1QO+S14xXs/U/hDeKa19edUxwkhVWpnWbxE=;
        b=S6jUeq0mE4DkDyBPpRbUEYrzjYOTwNWYP8CretRzslvJijhVMHhpmgZSKeKMbHZHVA
         f34R/RJLZZ1puu0pkit5vg+bMROARVyUY2kwPuAfzLIYjH3xkBGlndy2/guXrIdfIntk
         VSkKMUcPEhBcOMqLYMd3PSRSmCgxg16uUQaw49vA1BbFBD5F6vrMeGVtYFOuFfxB7X4x
         KTBlez61UX7YV1ojZkXAzMnZbNXLAM4SQLxqlD5VpO7UhL3q+/hn/4YLHrjgvr4sig+6
         754L0k6zjZgIUzODYxT0aay5Ss28qMHkkj+mbBmAZgYmu3AOD9CNeqhxVVdAl+vvEmja
         WEIA==
X-Forwarded-Encrypted: i=1; AL+hErFoJQLg7OHFJRkymXEqPtaAphYvqbUg4MEDq8hnfNwFc78Nv6b2VSzu0bwnSkUYipeP/y905xk+rxs=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+K1zZjn+rw51Z96mKvmROE1pPAMcAGpCTD66CU3OW6wDffhrPC
	wvfaHddBo8G+aHp/SeHqPXHOwagu8QhDEAlKbmt/Z6OY65VaMrVXUms3TKU5JNgBXKYqQeQbbTq
	xmgyjFg==
X-Gm-Gg: AZFdTZfLelwyhEE37GS9KojTaYZy073UqHSCBy2QHAb1LBkn15mvRymGRWTclHpvEri
	ZBXU93yE4vkFF5GtBccSCPqYE0PrwxGWezKyC6ZAXoLuBE6gACVkSkVfBvLc0eIlhYkuJo7HQx8
	AcOHX0IrJ+wuz8innkkMVTzgnb+/8UqaO/KW67BL3ssPmniLY4g540MFI97+LRU+R005ELV75yJ
	BRBD9QOWH7yZFc1+gSK5jxXIlCCYeNUhVJlT8Zg5LHLiVnGAPfb199xRSXzLSObqVQBfvQpMsCP
	rpeFLEUf6KvMwgTG4rN2aXLomrpD4+ZZbPsjZApKEp8wyE/0JwwNS/pALcg6/XDbtYlESe1Leyt
	l5o6MZHwc/7AdCye5XVFl8JdOh+LBnuC9gVL1/VztKOgFeBj75VT3GUJYu6pSfK6h8jmGGa4Jzf
	6lqrzabDv0XAYve8hw4HLK2zgwfujEcuBSGDOYxP/3pY3kRdAXyYkT2lzjYJRUZIEgi7r9o17mf
	VaxPsOHy6W/OzgTSU6bdD254zRo+7eTo9L51mCCHOUOq+wn2NVIAIsnhEhU8ZIiKuUzxN3yXedq
	e+3hx8VPUk0FGX/kqkbBT4ggwNfIJruq4CYPzZ5nuVqMgMgKJ8zLT9p4WCYVbrn/QAIgkki0yOu
	O4EBYyGeJILVR9qwlYw==
X-Received: by 2002:a05:6000:2dc7:b0:4a5:bb9f:9c3c with SMTP id ffacd0b85a97d-4abb4c7ac0dmr27824363f8f.53.1795440356268;
        Mon, 23 Nov 2026 05:25:56 -0800 (PST)
Message-ID: <cfe33c3d-7b0b-49b6-a250-81da2b8c3b53@suse.com>
Date: Mon, 23 Nov 2026 14:25:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/50] x86/mm: introduce populate_perdomain_mapping()
To: George Dunlap <gwd@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261119-asi-hvm-v7-0-6551b6d5c879@xenproject.org>
 <20261119-asi-hvm-v7-1-6551b6d5c879@xenproject.org>
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
In-Reply-To: <20261119-asi-hvm-v7-1-6551b6d5c879@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1795440356-A54C3AE4-CD8749CE/10/78276251493
X-purgate-type: spam
X-purgate-size: 1845
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19.11.2026 22:06, George Dunlap wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> The per-domain area has central machinery for building its page-tables
> and for managing the backing pages it owns itself:
> create_perdomain_mapping() / destroy_perdomain_mapping(), used by the
> mapcache and the compat argument-translation area.  What the interface
> lacks is a way to install a caller's own pages at a chosen address,
> which a per-vCPU state window, introduced by a later patch, needs: its
> users allocate their pages themselves and map them there.
> 
> Introduce populate_perdomain_mapping(v, va, mfn, nr, flags) for this.
> It writes the given MFNs, with the given page-table flags, into v's view
> of the per-domain area, walking the per-domain page-table structures
> with transient mappings, so v need not be current.  Callers don't need
> to know where the page-tables live or how the area is structured.
> 
> We require the range to already have been populated down to the L1
> tables by create_perdomain_mapping().  TLB flushing is left to the
> caller.  A present entry not owned by the area (!_PAGE_AVAIL0) is
> replaced.  A present entry owned by the area (_PAGE_AVAIL0, installed
> by create_perdomain_mapping() itself) is never expected: such a page is
> referenced only by the mapping, and no caller replaces area-owned
> backing.  Should one ever do so, the page is leaked with a message
> rather than freed.
> 
> The function is not for contexts with interrupts off: its users map
> their pages when allocating them.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8, Claude Code:claude-opus-5-5
> Signed-off-by: George Dunlap <gwd@xenproject.org>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


