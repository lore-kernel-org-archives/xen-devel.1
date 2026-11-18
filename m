Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37655606A330
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 15:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LC/QUI3N
Received: from list by lists.xenproject.org with outflank-mailman.1494710.1694073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xThKY-00038T-Nq; Wed, 18 Nov 2026 15:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494710.1694073; Wed, 18 Nov 2026 15:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xThKY-00038M-Kd; Wed, 18 Nov 2026 15:12:14 +0000
Received: by outflank-mailman (input) for mailman id 1494710;
 Wed, 18 Nov 2026 15:12:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xThKX-00038G-Fu
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 15:12:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xThKW-008jqs-SL
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 16:12:12 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afdc042-2eae-0a2a0a5409dd-0a2a450bce44-34
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 16:12:12 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6afdc04c-b7e8-0a2a450b0019-d1558029ed9f-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 16:12:12 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a1b07c3c5fso10687445e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 07:12:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb783862d6sm131255405e9.2.2026.11.18.07.12.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2026 07:12:11 -0800 (PST)
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
        d=suse.com; s=google; t=1795014732; x=1795619532; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7y8/JFODXEayvbJmnavHX3i9f1fPg62799kZs6FhA5s=;
        b=LC/QUI3NYIWdJimFlyNP8bM0VHJ0txj0pj0sHPmoCA5WBvY47W4ZEtgvoZQhWjGvZH
         sqaZXQL6I9lMDsKE2ta5pwV1iqGBg/gTn/jLn2+3ZT9LtAJzSIpqGOw6rHvkrKZnvJKs
         7/d3C2NuWkfOPzvkxepV8Wp3qFJJb8e9v0yRSvT5fe24TC2P28qNCVMnzEk2fn77+Bs0
         TbBcGbfQI44Kmo6FijPWT6D8ZoC4vBeJ8b7JDG4pDiFiGHe89L9TOvu0QR/aYD9V5EL+
         Z8xtVvVPqzN/8GmIfAWlUbIO6PeCy6nfrO6gIVqnohNHKsmTMKc+1paTjN27gj2I+fWu
         KCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795014732; x=1795619532;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7y8/JFODXEayvbJmnavHX3i9f1fPg62799kZs6FhA5s=;
        b=T3/UPAdAUlfvLx/GSBXg0y4ZMs2S4n0HpzT1+VzgrltuXtmUnhGekwJ7sETHhVhHgp
         VOwYoSzpkISKTB3fbFzM1W+/1yI2nPPrBd+05lPEYU5Bdi6rVwr9bl6BdF88PbTTAW/i
         cmtxncKUV3Qb3DVUYVY2f+inP42esXCYZ8cikjddysvpLhPDDzPNmqLRLJTg97jDhfEP
         cCz7UYQsZzb/PgzWSRjjB9DR4H4ABr9qbhedyZXJwnRn/tesmT/z6oBf/RayK6TK1/Su
         LfDUK8RkDw5dOI/J/XAAg3rdhsqYQcEXV3nFfaPXIJ4q/UQOf/dqa5PZAJkf/sfgtk7P
         Jk5w==
X-Forwarded-Encrypted: i=1; AL+hErE7+/s62Ccvi/PuL9m26k54ACOhmKW139Z83H7pErLFD1svk+JV3FYIU7gT+ODtZs7sAhoUiF747Bc=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/R4+rUYa1LZiRwW2QBLgI5VPpvXAfgpbr2eH/wEIIgS8hMCBC8
	/LIBZ99JLd3SDsRXwX5YA5QD17XcRq+fcPiKqU9f/1m3qUpmMtwscsEqPY7XxKz6QQ==
X-Gm-Gg: AYBFou0Nl1zA+XLYpX2cp+ll96hhTQ0S0bKw0S8zdqTP5VY0OScP3Gkb1NN4VVGg/Lz
	RxLRqJPzgSjN2W9R3TZrRHrybRVQLg2VnmIxZOyQjDWJo6trBEV0f5dSyWO4fe4cf0tbvCdBAcV
	x7xW1FMPXNN8na5P/06W4D9HGRagj/Tz6uZ4sukwnBSbYTHoaz8qeLTO7Loe3dWmGflaPFp77fo
	lpoitSiN/KHkDrWTMcAujEyGNXwHEXMaiIJW92XaJMB1sx0mfthpSvTlgWfdfUbE7uSAs+qBJkC
	FsPuMblH913AsWyvUcMw7n8DGQYFE5sN1pwbk8T3VAfAtIxuWmH2/EBgD/ig3UvNSEKYIf4OEVj
	BHsfBNUiR8JwFwyzWRsLWvnFYqU2qwJPg8ZUKkMvUkIOjW9Ljh9TormeZ5yy/Rmfzx0loBaCkK6
	AjUs9m8CJTvLQzrLHnFs7/04X2PaAwiI7r6xKC3jXmiO2xH205GLrxDiN4PW4suRNeJnAapJJQ3
	FpdSmpJdeSpWRVBMUfcGuFkKXylWXrHorsk+os70rNuAsN3tbKXNyFj7DcFmqvYHzBF2WhB226r
	8UN7pyiJaqr9eHEpPf24w70RZX9HVpFQD1Dq7AX/JB1jSCieCQmNZhAWEDpmJ0XRjTtRRMyuPFA
	aaJ8Q2FqXVA8FfLnBEQ==
X-Received: by 2002:a05:600c:8b42:b0:4bb:7033:de79 with SMTP id 5b1f17b1804b1-4bb7da4afa7mr54493295e9.35.1795014732130;
        Wed, 18 Nov 2026 07:12:12 -0800 (PST)
Message-ID: <5e1f6c26-60d5-48ec-9f6a-cfac7d16ff81@suse.com>
Date: Wed, 18 Nov 2026 16:12:10 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/28] x86/hvm: report SVM x2AVIC support
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, roger@xenproject.org,
 teddy.astie@vates.tech, dmukhin@xen.org, xen-devel@lists.xenproject.org
References: <20261105013347.719392-1-dmukhin@ford.com>
 <20261105013347.719392-4-dmukhin@ford.com>
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
In-Reply-To: <20261105013347.719392-4-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1795014732-186CA9EA-CEFB5701/10/78276251493
X-purgate-type: spam
X-purgate-size: 316
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 05.11.2026 02:33, dmukhin@ford.com wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Report SVM AVIC support from CPUID Fn8000000A_EDX[X2AVIC](bit 18).
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

On addition to what others have said - can't this and the earlier patch
simply be folded?

Jan

