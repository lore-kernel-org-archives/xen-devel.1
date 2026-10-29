Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678C3606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 07:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=B8q6iUKC
Received: from list by lists.xenproject.org with outflank-mailman.1464249.1674978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMKrL-00062l-02; Thu, 29 Oct 2026 07:47:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464249.1674978; Thu, 29 Oct 2026 07:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMKrK-00062T-T1; Thu, 29 Oct 2026 07:47:38 +0000
Received: by outflank-mailman (input) for mailman id 1464249;
 Thu, 29 Oct 2026 07:47:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMKrI-0005qd-Vz
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 07:47:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMKrI-004iMd-7D
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 08:47:36 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae2fa07-bab6-0a2a0a5309dd-0a2a450bba56-40
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 08:47:35 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae2fa17-b7e8-0a2a450b0019-d1558033f1ff-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 08:47:35 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso18718455e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 00:47:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa7f7f4cdbsm52610815e9.7.2026.10.29.00.47.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 00:47:34 -0700 (PDT)
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
        d=suse.com; s=google; t=1793260055; x=1793864855; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TbAAvEu/zKVmCKhVcl1XqJ60T2QI4v+kGuAA3utzWw=;
        b=B8q6iUKCcyT0HK8zMpQCkUkXEkX9MX8YxZ4hInhJ7yoeJoezBuTP7lSSZC/Oyvqnbf
         jGTs+oq6HEjqXFpb68vPBRQFLWajwqAroK7I35/5+qY24UD3TOsZXSGeP4nqU3aC6Fq/
         z/dYYvrmDzgUJCovSPp82QEYaEekrHA7PbCz6sfdI0YRpnMb3K2AwAAtqQj0F2Q2yXkS
         JiVDAcPSrFy6/4LjZm69bMuFU2quOPMbJdgVWzT6ccOfKqC5hl8BST1djmcX2jHj/PQR
         9azhmvlie04QP1Lkkjmc1qe6JQ7JozdBqUwuCUyGAOgvyCNT6+fq6v1nJbDA3hBulavj
         llyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260055; x=1793864855;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TbAAvEu/zKVmCKhVcl1XqJ60T2QI4v+kGuAA3utzWw=;
        b=ZBo9ZpMrt/a1+ud8wqfRFp97WwmUMRrEUWs4qHemjXBIAYARhF5ZreyAx+JS5sucIN
         oURUJqtDrmorbYNKx3T/Rr5PIEsoatQnjxpiU5POaBU1ytXiAcihTIb4VWNr9eZlaeB/
         G3RX87RDTbqFubCSyr6X+cT+DewXXS3MqLuw+h8Uut83OuIaBg8lZxefKvXZDfNZ41ho
         +htMXp6qx+JdVN+Sn92MG/P6Jcvm27q3Ied2+1dGk2+x56wkv0s+Tg9gJ4gABMqgokLi
         YLE0IAlWdSBdVBQMJ3C3viNIq8pkldp1QN0P5nmJbrRxBsnhWhQz03F/oaYm/mhDIvko
         aKbw==
X-Forwarded-Encrypted: i=1; AKwUvBxwHMQNTUQ2iTlmOBMF9EgcW5VkceM2D0trHJXWMZ5t9iro1vsHm7wQrV5haY2aVunkPT/qVkiRw8M=@lists.xenproject.org
X-Gm-Message-State: AFq9FYL9pxQi93qhVObqCDt3OkDiQpX8Gnh7Et2d0oQyB4XtJKr0PI9a
	pWLGbgwhufOLbY/1wsww1gQ3REMbSCbeiHgrljw+3BoKd8NQ7tXFA1pUF0DnhkT2Zg==
X-Gm-Gg: AYBFou0OVBFR9CWgiUTmxhZMrar3VNmMKTy4JQQEbzGUkl++dgtZ/lW8lmYrAdMGP9S
	AjLYORRy9SYueaVVRG1NXvir2lM49rwCHZXNNrjVAidmBND+w6S9wFt2+99YRRkeM0zSqrcv3QO
	c8SxfIVw4Ftir2OH6I85Lpv2mLJhCW45/Mf8WiMtNkw66dPGOjuGp2WPwxhpTt+sMWpebv0EF2B
	0FCnINRw+eccGaXr8CltrOddKK/6dc3qfzC0KIv5aJ4F4u7ZwvZBwjYk8KVRE129NSt13xDQWfP
	OaIhLaW1WBJmx2GXjx+pYJNTGM1JEu/eagGdunwDjHl3MjW7n+lESicbUQ3rl4/yN5VfeOKTyuv
	6JnOVLGGzlFSdLUEMEtx+SZiiOJDpgY1cLEnDhWF1OqyC5VOGc/MJY4BS7m484H7yifQubUwroB
	0mh3eN630Ar4qOeYss5ki948dDbgQvIFIvxAglb0pRrVbsfJVQGlSzD6eBSlmmPg5WNC0BawGO0
	FSIS8iSxCQfENIlSqTjoqskj/McQ1wd2PqcIX0rbT/vyte+h7ZwfupXaO5a5IUcVhPBUlACvcxj
	1BLZX/LyW5ph9R/EbM9SHrk5ov0IYQuEK0dzjVj6zu1leEIaeR/m/Gq+DFYTOzAUo/K4VbYwAex
	uNXzecbgatpHXdxLY
X-Received: by 2002:a05:600c:4f89:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4a966c4110fmr105857615e9.16.1793260055020;
        Thu, 29 Oct 2026 00:47:35 -0700 (PDT)
Message-ID: <f29b4d27-650e-4463-a0bb-785ce507c644@suse.com>
Date: Thu, 29 Oct 2026 08:47:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/45] x86/mm: refuse to promote an L4 while the domain
 has no per-domain L3
To: George Dunlap <gwd@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20261028-asi-hvm-v5-0-13b908e0df0b@xenproject.org>
 <20261028-asi-hvm-v5-2-13b908e0df0b@xenproject.org>
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
In-Reply-To: <20261028-asi-hvm-v5-2-13b908e0df0b@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1793260055-AA6DA9EA-62F91209/10/78276251493
X-purgate-type: spam
X-purgate-size: 1469
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 29.10.2026 00:05, George Dunlap wrote:
> init_xen_l4_slots() puts the domain's per-domain L3 in slot 260 of the
> L4s it fills.  Since fcf91ce9de66 ("x86/pv: don't populate the GDT/LDT
> L3 slot at domain creation") a PV domain gets that L3 with its first
> vCPU (pv_create_gdt_ldt_l1tab()).  Only mapcache_domain_init() makes it
> earlier, with the domain, and release builds skip that unless memory
> hotplug is enabled or the host's memory reaches past the part of the
> directmap PV guests can see.  So in release builds on most hosts, an L4
> that is promoted before XEN_DOMCTL_max_vcpus has created the domain's
> vCPUs gets a slot 260 entry made from a NULL page (0x803e900000000063),
> pointing far beyond the host's memory.
> 
> Have promote_l4_table() return -EINVAL while the domain has no
> per-domain L3, before taking any reference.  The other callers of
> init_xen_l4_slots() all run once the L3 exists; have init_xen_l4_slots()
> check that with a BUG_ON().  An ASSERT() would not do: the case above
> arises only in release builds.  libxl is unaffected: it creates the
> vCPUs before it builds or restores a domain.

Isn't setup_compat_l4() similarly affected? XEN_DOMCTL_set_address_size
may (in principle) be issued ahead of the domain having any vCPU-s.

Independent of that, how about pulling hvm_domain_initialise()'s
create_perdomain_mapping() up into arch_domain_create() instead of the
code additions you do?

Jan

