Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B0F606A330
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 14:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=WLO7ixIm
Received: from list by lists.xenproject.org with outflank-mailman.1485913.1688946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRVal-0007Ur-JC; Thu, 12 Nov 2026 14:15:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485913.1688946; Thu, 12 Nov 2026 14:15:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRVal-0007Uk-FR; Thu, 12 Nov 2026 14:15:55 +0000
Received: by outflank-mailman (input) for mailman id 1485913;
 Thu, 12 Nov 2026 14:15:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xRVak-0007Ue-5W
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 14:15:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRVaj-00EJxG-I7
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 15:15:53 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af5ca0f-e002-0a2a0a5209dd-0a2a45078ffa-40
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 15:15:53 +0100
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af5ca19-b4ea-0a2a45070019-d155dd2bc05b-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 15:15:53 +0100
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-491aaed7565so2572560f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 06:15:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-498361f674fsm17266317f8f.33.2026.11.12.06.15.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2026 06:15:52 -0800 (PST)
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
        d=suse.com; s=google; t=1794492953; x=1795097753; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HUTqZ8Nc490YhpEdhjnu8PJBicv8/9Qn4KR88ZuEhrQ=;
        b=WLO7ixImFF9kycKGG+HbdIG3DeiqtowiIPIKV5+90bFBTNwrjlktvgkS0/gtXTvPXo
         STzo7G0HHP1dfD0suGwsXc/Jj9Vhs7RvQOEm1XDG25GppDAsWpZqw3kxeLXGJAVWaTzp
         Z4/Yt039x+4EC0hgdFe6CgY6gldu2VIyaE9VMCSxdJ35zsXNGyt9RHfuiSYRJgM6CJOr
         221BHkoWpvcawtteKXJDb6modtjtWPCOoztIQIPZfoT3Fi/dRkDJrvwW+X6icyyhNkxy
         x2QI7wK3dzrMC2r7/CSBp08ATePjoOHiUe/zDLz9pd5xTaZGRUElugOfHAx6js4E8SUH
         Scww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492953; x=1795097753;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HUTqZ8Nc490YhpEdhjnu8PJBicv8/9Qn4KR88ZuEhrQ=;
        b=f936sEavm8pUQBEde5nlA+OtrV7thajRc6MfwiOCOshHJkYpGyqrDeg0+DznuHYtKy
         VejCXnGWnhDpFD/ZGo4t/hkv5fod5Hs9nGeE79jkNxEilHs5f7jtp3iRIVf2Uy6Z/1v+
         sNY+9oZebsFm4hpBQP4eKQNBoV3BKxCaI1CGSac+K9CQVDKBeKS3U/scs+Kkt3c8a+DV
         SoNwUK6X2MtxEIpmsm6kl+c+6p0boT3exZ1nAFFQ5g8h2RBQpKpQXjgntrGWFioPVpds
         W3bCqRtzWWRuarU6P8FCBAM+veFFGxaC79RQvbcXw5n3bUkJA7UvqmWs/RjY1QTotlHi
         4OCQ==
X-Forwarded-Encrypted: i=1; AL+hErE/gonzRhLfb0DWGbUDmtHmPlbl4LcFDmBzTUFRYtTEL09owgy1znpkWNVdkkVm/Lk7BTAhluQ1WnI=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9PWRq1vbYlUpjGBEwwXU7Unz6yuikZcMoWC12cYvArg+KlfFiU
	zfrLIXO/ijgMEVdYBhPAxN2HlE9wUe/u+B3xxJxBZ71pbIyy7VUgEb+i6FuOMzgTRA==
X-Gm-Gg: AYBFou1MXTfSe7MAzOE6YH8Bjnl+Ve33sHEES6NXXPLfeAoDLLitobm7xb3OH9227bF
	oPHJ8s7vtH15fUtktYfXTwCmeo7scu5WGByrOanFDP7BhHj7hWgMlNmXNGCcOM53YGASTFetByY
	0cHZTfnCchRXuwAg+TiTeuVFliHl+2wi8KvxtF2HVwYuQkJKa20xckvZVRI8yUG7D8p69qO42G0
	gO+HvglhdQ7oh8W097LzUlwJpdBpbjTJTyQz5ygNGnJT5VqRJx2sqczr2fgXIq2UjfAk1hlrW/f
	EEoy5778d4+zsBsWoZXLUw66XBuK/bC7E+UyPLQl0T05Q3Ze4yuV47Gf61/3A+G0Ez1mfuSoAsM
	8qxa1Xt3T27szBN/zCsLtUkePOq5jzrLwthfnfoPp2VkwNtWuAUXIpvSu2Cj2tT5qPLkdEdAR2e
	Fv2XK/6haST3ue5J5ZZWOmD+w9E5ybw6TJxiCk68ygak4YOLbwkOZG+rgLdr9+KPpJrwxbcpGCr
	qYeKJUYQVNHE1OhSfvmn3La6zyUu+1g1tOo+mOFQn1jH4cRjSBz2Mhl3hfEl9jxGgJZ1+C98wE6
	oStRVks9b1ff3ybb+sV8sxE4iUIyNkMtkxfODXOC7Yp3MdDJEQczn/0B5hX/N/xTQ3hwVhYnVT7
	idfqqYG29GZZk+bjoer4=
X-Received: by 2002:a05:6000:454f:b0:499:d9a9:5158 with SMTP id ffacd0b85a97d-499d9a951c3mr6523377f8f.31.1794492952772;
        Thu, 12 Nov 2026 06:15:52 -0800 (PST)
Message-ID: <4d445414-07bf-4743-a358-cca5fd6ac913@suse.com>
Date: Thu, 12 Nov 2026 15:15:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] x86/hvm: don't let EFLAGS.IF block #MC in
 hvm_interrupt_blocked
To: chunjie.zhu@citrix.com
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, roger@xenproject.org,
 teddy.astie@vates.tech, xen-devel@lists.xenproject.org,
 ross.lagerwall@citrix.com
References: <cover.1794482561.git.chunjie.zhu@citrix.com>
 <b1b1e6b0b0f5630debc9d6f2a05ccc90693c1631.1794482561.git.chunjie.zhu@citrix.com>
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
In-Reply-To: <b1b1e6b0b0f5630debc9d6f2a05ccc90693c1631.1794482561.git.chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1794492953-366DAAE4-D0A067A5/10/78276251493
X-purgate-type: spam
X-purgate-size: 644
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 12.11.2026 12:35, chunjie.zhu@citrix.com wrote:
> From: Chunjie Zhu <chunjie.zhu@citrix.com>
> 
> EFLAGS.IF doesn't mask NMI or #MC, but hvm_interrupt_blocked() only
> exempted NMI from the EFLAGS.IF check, so a pending #MC was held off
> while the guest had interrupts disabled.
> 
> Exempt hvm_intsrc_mce as well.
> 
> Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
> ---
> v3:
>  * New patch.  hvm_interrupt_blocked() only exempted NMI from the EFLAGS.IF
>    check, not #MC, as noted by Ross.

I.e. Reported-by: wants adding? (Happy to do so while committing.)

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

