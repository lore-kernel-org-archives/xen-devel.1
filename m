Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2ED606A31E
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 12:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dZubWSsa
Received: from list by lists.xenproject.org with outflank-mailman.1461251.1672230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLJu4-0005Rb-HX; Mon, 26 Oct 2026 12:34:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461251.1672230; Mon, 26 Oct 2026 12:34:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLJu4-0005RT-Df; Mon, 26 Oct 2026 12:34:16 +0000
Received: by outflank-mailman (input) for mailman id 1461251;
 Mon, 26 Oct 2026 12:34:15 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLJu2-0005RN-UL
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 12:34:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLJu1-00GiSy-VF
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 13:34:13 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf48b3-2eae-0a2a0a5409dd-0a2a4505cc36-36
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:34:13 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6adf48c5-4cb1-0a2a45050019-d1558030a9fd-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 13:34:13 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a2072b9832so20621425e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 05:34:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebcb90dsm14817858f8f.22.2026.10.26.05.34.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2026 05:34:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1793018053; x=1793622853; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6pFjLNmWXuu2WEFu2QcsD11soqSfI8L3JokaqcvE5hw=;
        b=dZubWSsawlC2h4oVyO8yOR8/u828ht8TL5kmcicGlUhMiC7fhlE1APFN1+jEuCQVM1
         ffUp7Lu/iNde8j5nNgkYG2hxOb+3whbWcOzJriuTBx+8/h3w/sx70EdmpY7GcdUxBuce
         0Z3wIlYAU/TDxCiAzQP7XgW5FBaty4SXNrCZ1zAKdjm/Jm4SPXH/2rYTBKCae508xAGB
         u5aHq0zMDZsiFDWzn7Nb36L6ut2DM+8UtyJU+WUa6661/Y2iMIjjomR5WmQgCG+G8Poh
         7mTs2RYYpw6kWhPElr0rzhf6hkDNJkpLygHBsB6NNT6VGgFwm0/qSCLfxJItdHaaYpIt
         skQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793018053; x=1793622853;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6pFjLNmWXuu2WEFu2QcsD11soqSfI8L3JokaqcvE5hw=;
        b=p4v4PtuZlGLwKhh89p4pmSA53bc6DiRzVhrNuKYhcHex2hn3Zc5pThboTP3ZEdjlgA
         RZlAUoIfZpPMsYS9ubcoPPEoG/jDI7rbirMaLkyx1sQwfcXzFp0WQxUoioRPAFJdHhN3
         pdlEylUGwJ+bclTEuRQAjm8KaA0P+rAsSDbpGO20Qkr6TiKNbK45VGBXQvoFiBXu4lKP
         ICH9KnWzJUtfeoAI7BmeKYyF/UxNQhn5XI4Z8cDhbW9U/nTfCuH6FfSCD5c9GKDzHpVN
         zq5lTorj53Bf5RqCRTbOBYdGJi/Pw7pGpqEjmbOenTQLh13Teszj4npWgATVM8ofQqYW
         0Xfg==
X-Forwarded-Encrypted: i=1; AKwUvBySAuRoaGCNnAoomNBwrcD7j3CFUI1klFxA8t952MTDigNMYJrbavUp5ztV7r/inG47JhxGv4MT8Nc=@lists.xenproject.org
X-Gm-Message-State: AFq9FYK7e2L4Qn9V1l765x72aqXQA7N7ERLT3TeXRbdlolC/1/xDljCH
	lFZYxWXsQJXeVp3GCIC59jZVh7gA8A25rpTV9RVHUc7LQd5VPdVr6mC4A5qzcAdmCA==
X-Gm-Gg: AYBFou38EkZTXDxZLovejfUpeGQfmypne99GtDstNWP0y+99BeISdJ0HSq53BgaW4WZ
	FkLX2XkocJU2GJWDXGW/DO+YBDK16gxzcGZJsELgHjB2LSKR4YGeeteFzO79nUD8OrOxkWQ3kY4
	TIPh826K16Fu4pQxZ7L4oGktlxe6wQqPmiwHMNWrWs5Zp+Ti3nkFlvIcpEWmcCPoXOh0H8oLvyO
	1F2EsrLZNYknEJV2ssqQpFUQTATvu++/8CY301ObY0zPoco5+nkWEpZo5FKhpM/kNNWClJwX9zm
	sJQQZSLljDyvAFZCrs9o5h+ISpMXfv6X491eqryQIcq6XLJZWWIB8JIoIFAIw6dbt7q+8rbkYgG
	ZNW1KTjrA+ZRZeWbxin5lDbrmK4/UMjQbxqKfFShR8UM7ybbcEriBtb37j3qnqG2sMjY5VnZlFO
	HSfwg3eGoN65Pwkd7LbQQsnlxLz40R+NjBT8AfvqKtuyx+BaVGGVv1pzXopx6kSkaWPBya+6veI
	oPlRo8Vw2niibvrFw1vGIqUv29wr57RYGA+aHujMjmbeqonYASRA8KYSM86bVJQ7AEnjC44YSEc
	qQZ2suX/L+48p1ulWuMDoZrSI1b26GBiT5gIBZ/wIiH6KQ/EfzFU9vCUXPjYjI/mlw==
X-Received: by 2002:a05:600c:3395:b0:4a2:1104:7ca7 with SMTP id 5b1f17b1804b1-4a35ac99833mr79836015e9.11.1793018053241;
        Mon, 26 Oct 2026 05:34:13 -0700 (PDT)
Message-ID: <8b2fa10a-17ac-4807-b9d2-874f84a85efc@suse.com>
Date: Mon, 26 Oct 2026 13:34:11 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] vpci/msix: separate out common MSI-X code
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1793012250.git.mykyta_poturai@epam.com>
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
In-Reply-To: <cover.1793012250.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1793018053-F62AB2A1-F5BD3DD4/10/78276251493
X-purgate-type: spam
X-purgate-size: 1664
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26.10.2026 13:27, Mykyta Poturai wrote:
> This is preparatory work to make vPCI MSI-X functional on Arm. Split the
> vPCI MSI-X code so that intercepting the MSI-X table and PBA stays x86
> only,

This likely is related to peculiarities of Arm's interrupt handling, yet
on the surface I can't see why not intercepting MSI-X table accesses
would be safe. Would it be possible to extend background here a little?

> while the MSI-X capability handling becomes common. No functional
> change intended.
> 
> This is a continuation of work done by Rahul from February 2022[1].
> 
> The approach is inverted, instead of moving out the x86 parts, move out
> the common ones that will be needed on Arm. Subsequent arm patches for
> reference can be found here[2].
> 
> [1] https://lore.kernel.org/xen-devel/cover.1644937405.git.rahul.singh@arm.com/T/#t
> [2] https://github.com/stewdk/xen/tree/pcie-passthrough-arm-vpci-v26
> 
> Rahul Singh (1):
>   vpci/msix: move helpers to common
> 
> Stewart Hildebrand (2):
>   vpci/msix: move msix region removal to msix.c
>   vpci/msix: move common msix code to common file
> 
>  xen/arch/x86/include/asm/msi.h      |  21 ---
>  xen/arch/x86/msi.c                  |   2 +-
>  xen/drivers/passthrough/amd/iommu.h |   2 +-
>  xen/drivers/vpci/Makefile           |   6 +-
>  xen/drivers/vpci/header.c           |  30 +----
>  xen/drivers/vpci/msi.c              |   3 +-
>  xen/drivers/vpci/msix.c             | 197 ++++++---------------------
>  xen/drivers/vpci/msix_common.c      | 202 ++++++++++++++++++++++++++++

Nit: New file's names want to use dashes in favor of underscores.

Jan

