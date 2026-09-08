Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804D6C79F99
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 14:29:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412115.1642603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3wot-0006Gm-L6; Tue, 08 Sep 2026 14:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412115.1642603; Tue, 08 Sep 2026 14:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3wot-0006Gf-HS; Tue, 08 Sep 2026 14:29:07 +0000
Received: by outflank-mailman (input) for mailman id 1412115;
 Tue, 08 Sep 2026 14:29:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3wos-0006GT-98
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 14:29:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3wor-00ASxI-0l
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 16:29:05 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa01ba7-8faa-0a2a0a5109dd-0a2a45029f92-10
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 16:29:04 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa01bb0-6ca4-0a2a45020019-d155dd2ed9ae-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 16:29:04 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-485850cf499so3112412f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 07:29:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858e239862sm31233518f8f.9.2026.09.08.07.29.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 07:29:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1788877744; x=1789482544; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LqPm/7OXv4D6CUb3M2PsRvj/xLPM7MkqPNPKCiLldDg=;
        b=Lf629HStqKGcpsla3/zE4BQiRFPi47MJEKFNdoZ24tqeQmDU89WBcg8ngLQLd6mFzs
         jsE5wjeRjZ2TZ1CVrjzAIsK7hchcO/5s/qA/XTsIRSuaW2nY4iviVjvbR7ov87po6uX2
         6cuuiTN5i1+ilH1VbL2DRBmxXaxK3bsGfZYT/GPoI2A8vRYkFe4SLJYWTQ8GbLKSS6n5
         K99Ry9ZokTwGhETMct6IJ787Iraud2yjXRa5+mJK5XHnqnhsO6o4i1P+OehYSLYzfC0V
         S9GCvDDcvxDogDDhVdmOZyDECcvrcRbFdE1djsguNgoX+PSPyd2t/UjAZiTZNkG1f3lt
         klmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788877744; x=1789482544;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LqPm/7OXv4D6CUb3M2PsRvj/xLPM7MkqPNPKCiLldDg=;
        b=shQ7DGf78v02U15aWm+uDduQtMnmiGzvl0XIb70iZecLlybPgvZ9ODz1nvGewyw0ca
         /Bmi/IRl5kT4vIfbP3WqgSpf4v8aWyiMswNW0CPJZVNYUCn3w/x1oSXj/ojc/aw4dDKK
         d42TMj1nBg8ad2avj+jHegskYelLa+SACc+bnswcnVuW8FfDQBjgE9lek+HycqivPd/i
         kqfERUAEw4wA41W7tqs2ForqlHadi/vmJnwk1trrpCjQwrsy1UGjv4uZfU9cbuv0dBio
         Y6C181MM79WhUO8oKK0pwxvC9kTyS9Zvk9yWndLPTiK7Ocrrg7b6AyVyHSQ5r5qOHyOf
         Xjbw==
X-Forwarded-Encrypted: i=1; AKwUvBxtYzSbGXw6c0Ky/j+IMdcm33TaNrQ66sLMXKPHmKrb5Sw/k2B29vXNmerJLY5xQbY9YhiV0V5si6k=@lists.xenproject.org
X-Gm-Message-State: AFuF++mwxLoKfeXf7l5EUNHQnV3WzwHm5yGxKaqnhrGmxyzsRrc2+zHH
	koEvhfomUfahIK66Zj8G/y0vSdkWYIthkumQBO9qmiT3o6oK7Dxmu1esg41R4YZdBA==
X-Gm-Gg: AYBFou3uYMNJsafBvN3c4+bRbNKsVoX5PZEahOqL7bZzfNtHQiOG1MrWw34n1E+05FH
	HZj3jMbzeFIBnmydKN4m9Ol/X+yMYWJDKqRSX4lr0Dg6Yty+sb9wQaxTp6C/oxnwpr37bHYLksn
	w67FEFg0TYSdB8sF1Os9higjcrrmlUJZe0Ta6XbLUexK75ebsnzZ1Js61o1scC9p/NLYGN/mxyj
	D8vmcNXwc12F5998+qUPThxeBwDA4KWbmyvuHTANXU+17F0p0LoeDDRikDCUOXz3H8etRaQS4F5
	lCD3m0hXE6FwTMmcD/YH1Mk3Oozve6CfOyneIVn5QMkHUrBZZsYsP5bQPJUgb1A4FV5VsWIz2nh
	pxVqVBxmgXBg6hoeHwvB2ZKqaFLAcL2jMOoSTCLsqwStenq8La1N1a1tZRoFcM8lmHovEy1lO8V
	1Kv0+Zxslka5vDc+e8oMy4+XwsMK/hrq9HXomIJv4tGNsUSKpTp5DXNJIBGSVUABdiLmzAsbKd1
	J93LDTWbfGzs4KzRc2PCxs0xMIfeMXAUn2nCXnhcTchoGsTGtEwm/sANk50f3g=
X-Received: by 2002:a05:6000:25fc:b0:47f:e886:6dff with SMTP id ffacd0b85a97d-48587087196mr32260366f8f.4.1788877744289;
        Tue, 08 Sep 2026 07:29:04 -0700 (PDT)
Message-ID: <3c5dab15-3daa-4941-a09a-29ca7d7a370f@suse.com>
Date: Tue, 8 Sep 2026 16:29:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/14] x86/pv: remove stashing of GDT/LDT L1
 page-tables
To: George Dunlap <dunlapg@umich.edu>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Alejandro Vallejo <agarciav@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
 <20260901-asi-part2-6-ecc269f268b7@xenproject.org>
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
In-Reply-To: <20260901-asi-part2-6-ecc269f268b7@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1788877744-F38BC2AC-53E9AA05/0/0
X-purgate-type: clean
X-purgate-size: 1232

On 02.09.2026 11:43, George Dunlap wrote:
> From: Roger Pau Monné <roger.pau@citrix.com>
> 
> There are no remaining users of the stashed L1 page-tables in
> pv_domain.gdt_ldt_l1tab.  Remove it, and all helpers.  This removes a
> globally-mapped xenheap allocation, and sets the stage for per-vCPU
> root page tables.
> 
> pv_create_gdt_ldt_l1tab() now passes NIL() rather than the stash
> array.  This will cause create_perdomain_mapping() to still eagerly
> allocate the L1 tables covering the GDT/LDT range; but their addresses
> are no longer handed back.  Doing this is necessary because
> populate_perdomain_mapping() only fills existing tables, and treats
> missing structure as a bug.
> 
> Another side effect of passing NIL() rather than a pointer is that the
> L1 tables move from the xenheap to the domheap.  Residing in the
> xenheap was only ever a requirement when the stashed pointer had to
> stay usable; with that requirement dropped, we can relax the
> allocation requirement as well.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Assisted-by: Claude Code:claude-fable-5
> Signed-off-by: George Dunlap <gwd@xenproject.org>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


