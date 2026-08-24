Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F406C5DF9B
	for <xen-devel@archiver.kernel.org>; Mon, 24 Aug 2026 12:09:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398808.1635007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyTU2-0002DD-GO; Mon, 24 Aug 2026 12:08:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398808.1635007; Mon, 24 Aug 2026 12:08:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyTU2-0002D4-Cm; Mon, 24 Aug 2026 12:08:58 +0000
Received: by outflank-mailman (input) for mailman id 1398808;
 Mon, 24 Aug 2026 12:08:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wyTU0-0002Cy-H3
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 12:08:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyTTz-00EbC9-B2
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 14:08:55 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8c344a-2eae-0a2a0a5409dd-0a2a450ac44a-22
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 14:08:55 +0200
Received: from [209.85.218.47] (helo=mail-ej1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8c3457-f2d2-0a2a450a0019-d155da2fe0c3-3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 14:08:55 +0200
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-c1c52d920b8so479739666b.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 05:08:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2496734bfcsm1318100366b.43.2026.08.24.05.08.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Aug 2026 05:08:54 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787573335; x=1788178135; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j2YhoGNkBJjMBx0aA28w01+IZzX50bmCA+2GGcuYGk8=;
        b=UhI4V6NXtx+nz+j1VJW/JFoirarzU9kosAecdiQXNQXTXJUl6C9kmvwYxnag0A4kye
         Cj1YYNDJmadUwrhIjkJ1UrjCZzuTaL2MpJ6sVlPJz1HlZkeEk9sxxdoH8RUfewDMI3fV
         V7+qI94Lij1WeJkGN6gJgm72AmsvugmovUlthdmnaMMmcUzA1cDFWLdknkLzAqyeNe04
         mOG9vQAics9lvW0Ui3haF9JhR6SOK5mM87p7+vekx8AiEXr0X66jOWCBGHZ7Lo3U2rXL
         cH6IgtvAQovf63azp1bMCC2YPeND/VCBbR0zk2fVjWAYSDtUsk4HJbK4dxBrkh6QSb+j
         HvAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787573335; x=1788178135;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j2YhoGNkBJjMBx0aA28w01+IZzX50bmCA+2GGcuYGk8=;
        b=VjCc0p1vUlCpi+1ph1o4BOcgEjM23n0buwxDpXD0khQF59cpMOzOgpscn4UkqNAuO5
         mwI7HJtbemhn11Ab1rCFzpI4nanyqmayPo5JUsCWkKdgpj9eJEIoutcN7Ql9cP4LOH96
         DQo6C3cxM31SGFUR43dqQQgEgugk4lv1Wxams+kgQCg0xm+NJqqKYiYj1132VEjWH3Sy
         AmNF9YMlGyCHFd/qzca1QSl//M+8Sluv7RebS2nS2urBP/hbU4osI4mufqcZHgJI+QwA
         iXcFqR1/CcEErLrpK5aj6nMLynBRIpJtKNA3CGu3qGR2RdD2cj8xFVMNTirYs7Hnf3eN
         3BZw==
X-Forwarded-Encrypted: i=1; AHgh+RpMm2Sf4Hfn9ItD5Ll1Yzq4BDREhlkBrFWw7XPyP1pp2ksblWTAVzjZtu30x7YCLa4/LO5ITsVzZ0k=@lists.xenproject.org
X-Gm-Message-State: AFuF++lS9DCYMNHP4dD31NAxQHaV5rAP/LPWVBNM9Bu2GocKOLQlvlIq
	f7XVH4mKNQXYXdZ8FyerXDJXce21/yWXPdTV3nATJa75UHdzH/gmFWcGeAkqW5HbZA==
X-Gm-Gg: AR+sD11omI8broRjdujgebaD8LAPPZjcnnNwdeNzS65bhuEgHmqbb4IMPvzYX/BEYIS
	sjh0iF4X7gBulStoUU4JYyvJFbTUypXuTrm4Sdg4ynWfJaIL/Hxl3t9pYHJeAGoa0+XPBITXvhp
	pB0C3F1u/2cDVhlRLRUFFTdG2K7Xzf1E5bO9+LfRJ3mOPcZelYRBTqHeDb5aQx5AZUFZBZ8B3SC
	sn0Xg1NrBMYakVSTzmbZQBzIyq73Dr8AKGbQNmJJInsdcHjG+QY55zUqWbGree1p2gc6V4aB+uI
	rsBn1wyaTzEBJ2v6PWVyqXXJbMi+Is6cCRBIE9Umb1srXaj4tgGU8SQRPuHcdS+omxdu7Zpawj2
	FclmlQuKuKa4uPmGVLOtVsItjnpbHMo5npcDmSakVhL/mKwYsfLYn5ECOUck4ProRCyLTowmalk
	WXevzFPqjSVcsqYNCQKpk/suKX5GhYyyeRlerCOXX4pKvqR49x0+zvG4rbqDSgiKvj66Ye/LMcS
	9il35KGGz29MTAVP8/RtCsvg4Apw4L1XhNveZhN4YZGbZmNMRri
X-Received: by 2002:a17:907:cd07:b0:c24:b11c:6c05 with SMTP id a640c23a62f3a-c24b11c6ce6mr1310025266b.14.1787573334715;
        Mon, 24 Aug 2026 05:08:54 -0700 (PDT)
Message-ID: <94e4e14c-11bb-48cf-aced-7ed6be8ad34a@suse.com>
Date: Mon, 24 Aug 2026 14:08:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] public/xen.h: Update comment on mmu_update sub-command
 size and PTE alignment
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, xen-devel@lists.xenproject.org
References: <1787563949.8631fc262581453bbf619ec5b2062170.1a0331d3dbc000c4f3@vates.tech>
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
In-Reply-To: <1787563949.8631fc262581453bbf619ec5b2062170.1a0331d3dbc000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1787573335-51AC4CFC-1AED0AEF/0/0
X-purgate-type: clean
X-purgate-size: 2493

On 24.08.2026 11:31, Teddy Astie wrote:
> HYPERVISOR_mmu_update passes a set of request, where each request has a pointer
> to the PTE along with a sub-command.
> 
> The PTE alignment padding is used to transport the sub-command while the rest

There's no "alignment padding" here. It's the low bits of a necessarily-aligned
PTE which are used.

> is used as an address to a PTE entry. The current documentation state that the

Nit: states

> 2 first bits are used for sub-command, hence the other ones for PTE which

Better "2 low its", as "first" is ambiguous.

> imply here a 4-bytes alignment on PTEs.

The part after the comma I'm having trouble parsing. Can this please be re-
written some?

> On PV64 and PV32-PAE guests, all pagetable PTEs are 8-bytes aligned, hence
> off-by-4 PTEs addresses are always incorrect. Non-PAE PV32 guests used
> "legacy pagetables" which had 4-byte aligned PTEs. However, support had
> been completely removed since Xen 4.0, and was only available when Xen was
> built in 32-bits non-PAE mode [1].
> 
> Current Xen logic behaves as if 3 bits are used as sub-command, thus all
> off-by-4 PTEs are actually rejected as being unknown sub-commands.
> 
> Adjust the documentation to match the current logic implemented in Xen,
> also expanding the documented sub-command parameter to 3 bits.
> 
> [1] 84d54d5d8b31 ("i386: Remove non-PAE hypervisor build target.")
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Did you forget to also add a From: tag?

> @@ -260,21 +260,26 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
>   * hypercall. Also if so desired the OS can also try to write to the PTE
>   * and be trapped by the hypervisor (as the PTE entry is RO).
>   *
> + * Note: Historically, Xen had support for non-PAE PV guests with 4-bytes wide
> + *       PTEs (if Xen was built in non-PAE mode); which support got removed in

A native speaker may correct me, but "which support" reads odd to me. Imo either
"that support" or "support for which" (and then perhaps with a comma in place of
the semicolon).

> + *       Xen 4.0. As a result, in current Xen,, all PTE are now always 8-byte

Nit: Double comma (when perhaps none is needed at all in that place).

> + *       aligned which allows expanding sub-commands part (now 3-bits wide).

Whether the part from "which" onwards is really relevant here I'm not quite sure.

Jan

