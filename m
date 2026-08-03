Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA4DC55175
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 07:04:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381197.1624755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqmiF-0004Xu-F5; Mon, 03 Aug 2026 07:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381197.1624755; Mon, 03 Aug 2026 07:03:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqmiF-0004Xn-AN; Mon, 03 Aug 2026 07:03:51 +0000
Received: by outflank-mailman (input) for mailman id 1381197;
 Mon, 03 Aug 2026 07:03:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wqmiD-0004Xh-RK
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 07:03:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqmiD-00Dxvj-4A
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 09:03:49 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a703d4a-bab6-0a2a0a5309dd-0a2a45059f20-38
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 09:03:48 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a703d54-4cb1-0a2a45050019-d155dd2fc4e5-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 09:03:48 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-4728c12ba97so1523518f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 00:03:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd41d17f2sm33644859f8f.2.2026.08.03.00.03.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2026 00:03:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1785740628; x=1786345428; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QKOmY2KE6KPejC5HiiQ7SG5gdG6x5qoQ/fhwL1B51YE=;
        b=M44zeSMqprEQeZ21Eom2rgZ62YOmWYCX7nAAPzLJ27aC9FMcs0qAsaOw8+/Ygq4zmh
         yzOtLnOL3MsUQgYKoeFN3XBsk/edniqZriAG1FqdXd9FHPK+EE+oJR5oRlF5Q0wdiapF
         ZMx2Id8StPsFL90hSiosHKSzLtpcCid8p+VDKaGadObDHdfz6aD42fTy3C3GnzpgnLAb
         WFhyZqG5ky3D6ffBkFfP8yS22C36fmKbGoTsVP6CYfPxmC2/3JgurENeltB8gblYaiiS
         bECsqMitb81Za3kkFLLhhsan6Wp+IaJtOucoHC8usa0PTm/pVhWrtelxyYExLUsi7OID
         AbKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785740628; x=1786345428;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QKOmY2KE6KPejC5HiiQ7SG5gdG6x5qoQ/fhwL1B51YE=;
        b=d0m531XCsdzfIv9JPiSXwRpBrp+lxUh3uCROUBZ4mcpJlw1ItMVaGMANLgkt2pG6MO
         i90lUI3zowXYxCIXrg5Ovz+WehL6/72fO50NTigfjl2Dtkc+ROjBZiggPnNPYWuE662e
         NtKH6vRckscnNLY2IzKTo2yiF3FymMlOkjydwnDgSkr764YdNg/HarDVjGrtxdHdan1+
         CUwOU9hRzOjl7P5g3USit0kPLAho5GSX2UQRFGLWWHNwb3b/wnB6rLC4ClO5X7e9Iyjc
         F32fvZfp/Yws2GhgfhmkY/izoVmvJddUd7Q3ce7k8QnvDIJLK1sLr2Em1ChPbWzRRfU7
         46yg==
X-Forwarded-Encrypted: i=1; AHgh+Rrpqdnl2d73ppgBT4OhYNW7qxtzg3uLLKneLOIw3+6HMsnMRdZ15/TmnHM/Tr2DK+RILdr8+QIQdPc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzMb/NMyjioAYoaOi6ujsfkB0RXH2xVXVfTQ5wTb7RO1XsQAM/p
	9D7mL5L7rnno8Qcl3aXwVy1YtJLHJEX/gteScafpqra5oU5hSHXfm3al39jCQpAOHQ==
X-Gm-Gg: AR+sD12N+hXUw3f+pBLN1f0uiWUFNn865OR07lwFqXW/nm2FPghCdLdlaedZqNL9XFq
	3WQknL7hXd2lPdH/38P7ox+P1NWf32R0sr900ICf7LBNtbDSUkAUtHHze8cA+GumIn/v9wbQu49
	a7ufwNFBnEPy6lZDNRKPxbTsXN72T9GIKiaVRcZ35HoXiShVpH7InQMIZyN9SKb1By19RwYg1ef
	YqV2c1hZ1745QcLxiPEFQkfFEAAx0zCzWrM3bxf34dj2/nMEjWdqdWUIH9LNvHi5/8R5FiXDb7N
	gNDiwMU2aBIjuk4BQ3/m9+Pj/G7j0GCyhF59N1rfVak76lggX02J5gjr8CeHJmzq8VnKfxzw0U8
	VB8H1ZxeVa2g3kyW6LqEOjkD1oKrJDIUfSBuD+HqhALqfgRdc4pxbCCxW51xxwb8msaPUzWpUzA
	sVTgswqoNusByXS/2GAAZLlrPSrZfUwp5SMi8+i6Yx0smcIV9/LlfHP2LicMTdeSF9mYrTvfvSU
	GIj3HWx8Qba2qCf4aIjYgPQMKGDWu+6Lc5k51jnfNEX9yDN0jbIGXHC+phDrwYB
X-Received: by 2002:a05:6000:2a8a:b0:47f:95e8:2ebf with SMTP id ffacd0b85a97d-47fd72a5db8mr18316947f8f.12.1785740628030;
        Mon, 03 Aug 2026 00:03:48 -0700 (PDT)
Message-ID: <9d594e54-6409-4554-b555-d6de55e85840@suse.com>
Date: Mon, 3 Aug 2026 09:03:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/common: annotate saved_cmdline with
 __ro_after_init
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger@xenproject.org, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <20260803070047.3097846-1-dmukhin@ford.com>
 <20260803070047.3097846-2-dmukhin@ford.com>
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
In-Reply-To: <20260803070047.3097846-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1785740628-722AB2A1-183040C2/0/0
X-purgate-type: clean
X-purgate-size: 420

On 03.08.2026 09:00, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> The hypervisor command line is not modified after initialization.
> Annotate saved_cmdline with __ro_after_init to place it in the
> dedicated read-only-after-init section.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


