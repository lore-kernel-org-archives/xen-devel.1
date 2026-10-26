Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105AE606A31E
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 09:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Wqb3CE78
Received: from list by lists.xenproject.org with outflank-mailman.1460986.1671885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGzM-0003pI-8e; Mon, 26 Oct 2026 09:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460986.1671885; Mon, 26 Oct 2026 09:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGzM-0003pB-5R; Mon, 26 Oct 2026 09:27:32 +0000
Received: by outflank-mailman (input) for mailman id 1460986;
 Mon, 26 Oct 2026 09:27:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLGzL-0003p1-0B
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 09:27:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLGzK-00FznV-6I
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:27:30 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf1d01-2eae-0a2a0a5409dd-0a2a4505d214-2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:27:30 +0100
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf1d01-4cb1-0a2a45050019-d155802adda2-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:27:30 +0100
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4a2084d62cdso21662815e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 02:27:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a5698f1sm182719755e9.8.2026.10.26.02.27.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 02:27:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1793006849; x=1793611649; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1yxdFSvoGm1tiD5mW+muhqSQWQzX3PlEBtKQexFJe5U=;
        b=Wqb3CE78sKYsKINbVhs6CWqSwSYnQsWmAnfgU+vqbr2Mv/wURWsEzjWYm+b3wlzyAr
         H/Qkg62PGIVuQPR15Je6f9SuaL+U+QwHrkHPkG3pJXBBA2yqK7G9MzD0QncdEdrVDatU
         eObVWL+n4PWA84z3DHEv81Ti6g05mzSXehBKoSXkQC2vBc7/EcbrQzMDfn4/kobmTE1O
         MItYzdtShX5p3Imsxq7jvG87RP+Qvx7D/joJXgI+kcIRV+Dzm5QtQ8Q6pLwI2EJFbXOy
         AYSRO6vZ3WPVEXzPpqNnCQPD1ZaUOafNNVtS6Ss0CD36bmgeoXeK0pFQYmQNpRdUVO4X
         4hOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006849; x=1793611649;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1yxdFSvoGm1tiD5mW+muhqSQWQzX3PlEBtKQexFJe5U=;
        b=xB/vVibjvIxkpM4rnT6TWyK318DP0g7uetf60l9zaMeIrfE1koY0tEkkuOq2UUxsN4
         xxiXcbIZEfIwxjmjHuHxx+Q52CAGzmOxDYys6zDc1MpdxwsH/HunZ2GrYRO5z8RYWxNH
         iOztCkFdPjTvWHwFmPDlD0mDf6aPtNBt0lQxQCRR7CpbbFn5cYjNF1FQ0V4Ve3cdImlR
         0KyhVv8US2BasLfMFwzJnSI3LHWDRMMniyPRd+MGwR0YbGOiXOGu2/TjTcoT+tCjE07O
         X5D+cDc8ZHpHCfDtYgef1SoC6F03tVlsjoiwMCjrBxnEk27SF3hOhbctW4F85fbliopE
         1ZGw==
X-Forwarded-Encrypted: i=1; AKwUvByexTqa/Ue9VoNvL+/8hJ/I3QsZr/sVQttGM3jQ3f9R12VksiTeIxBS0QakmzTsDrhqic00Xv1onXc=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKiuRHWBnf9mcdKJq8daLz7jtQlAWDJb3D4TfR111dd9Cg8nGPR
	GjYm2ejCV4YVONcEkttcPNU4t1hZvK6PYLQum2lIOeUh3LxH97VDuvON94pqA5afhA==
X-Gm-Gg: AYBFou3FGUngv8SfwC0/VB+8f6ZGXO/4XuIp/2IBhOe6+fogmeDzmqVZYi/a7rnEuvT
	bi6zGcyOygKJ64v+EApwjwhgSRfbMxDYsyQKX3r3RpGJO1UiNoEbA/0lXbVOcON9afsIdyOAj2l
	Q6M8TOi3e0bR2spSqIRB2aCShNtMyJYgmxgGYlPZ/peersSe8NeMU1HRpw2CgsKoo55zcmwfZmD
	h4WWj29k3hHBKflLuZfV8fzEwQs5nG+sst6yxF+van090aulYHzwIx2Ppi//G0Y47vvnaXa/Moj
	X22+ESCVkoHrCdcpvqcJnOoMlK+JAeOPlY7+saVI7Aw2EAD9gXvQ0MhGVCLCT3WUgrrBV/N0j9B
	1emRrXJCHekWwVsOlOiE9yIZj93RhUOqOdaB5MzYAnKO6eEfgJka4sdkvrdHP1zQiry2OopJW3B
	3ldrgqL9UXs31yxkwUN1sP42/8AmU5eDqTt2Inur1dh8EKmHCgv1De7iTzMPXt7Ank6Z4pJjE6f
	Cj3DCbgoD4gZy9o0m93Y1DwXdrdAbUgAsx7m2U6o6qXT+Vj9aj7jjBO+vragB73b8C9iuJ6LQ8s
	HAjM/ZcK3xKtF+iumFC4iwP4i6GnvEn6DkX2BXoeIoWoSpmYjRgOZCAnqHrWk39e
X-Received: by 2002:a05:600c:524c:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4a35ac8bdc6mr111086315e9.8.1793006849580;
        Mon, 26 Oct 2026 02:27:29 -0700 (PDT)
Message-ID: <5bd6b475-5f3b-4a25-b140-427005a4e1ef@suse.com>
Date: Mon, 26 Oct 2026 10:27:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] xen/riscv: fix A/D bits in Xen's page-table
 mappings
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>, xen-devel@lists.xenproject.org
References: <1792164706.8631fc262581453bbf619ec5b2062170.1a14557373c0008425@vates.tech>
 <1792164866.8631fc262581453bbf619ec5b2062170.1a14559aa020008425@vates.tech>
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
In-Reply-To: <1792164866.8631fc262581453bbf619ec5b2062170.1a14559aa020008425@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1793006850-738BE2A1-CF54284F/10/78276251493
X-purgate-type: spam
X-purgate-size: 2318
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16.10.2026 17:34, Baptiste Le Duc wrote:
> Xen does not handle page faults caused by clear A/D bits, so it presets
> them when creating PTEs. pt_update_entry() does so, but three places build
> leaf PTEs directly without going through it: setup_initial_mapping() (the
> boot page tables), check_pgtbl_mode_support() (the temporary root entry
> used to probe SATP mode support) and arch_pmap_map() (the fixmap).
> 
> On implementations that fault on clear A/D bits (Svade), all three fault
> on first access. For check_pgtbl_mode_support(), the fault is raised by the
> instruction fetch right after the SATP write, before any trap handler is
> set.
> 
> Add PTE_ACCESSED and PTE_DIRTY to PAGE_HYPERVISOR_RO, and build
> PAGE_HYPERVISOR_RW and PAGE_HYPERVISOR_RX on top of it. PTE_DIRTY is set in
> all cases for consistency with pt_update_entry() which sets it at runtime.
> 
> This fixes arch_pmap_map() for free, since it already builds its PTE from
> PAGE_HYPERVISOR_RW. Switch setup_initial_mapping() to use these macros for
> its default, text and rodata permissions, and check_pgtbl_mode_support() to
> use PAGE_HYPERVISOR_RX for its temporary root entry. The latter drops
> PTE_WRITABLE, going from RWX to RX, but this is harmless, as that entry
> only has to make the current instruction stream fetchable between the two
> CSR_SATP writes, and nothing writes through it.
> 
> Drop the now-redundant PTE_LEAF_DEFAULT, since converting the last
> open-coded site above leaves it with no user outside page.h itself.
> 
> pte_is_table() and pte_is_mapping() both assert that a PTE doesn't use one
> of the two reserved encodings, (V=1, W=1, R=0) and (V=1, X=1, W=1, R=0), by
> masking it with PAGE_HYPERVISOR_RW. Now that PAGE_HYPERVISOR_RW also
> carries A and D, a reserved PTE with A or D set would no longer be caught.
> Mask with the V, R and W bits explicitly instead, and factor the check out
> into pte_has_reserved_rwx().
> 
> Fixes: e66003e7be19 ("xen/riscv: introduce setup_initial_pages")
> Fixes: f89e1a170299 ("xen/riscv: introduce asm/pmap.h header")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


