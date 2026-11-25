Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A236606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 12:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=AGupt1HF
Received: from list by lists.xenproject.org with outflank-mailman.1502332.1698304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWCLx-0008KP-NX; Wed, 25 Nov 2026 12:44:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1502332.1698304; Wed, 25 Nov 2026 12:44:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWCLx-0008KI-Kh; Wed, 25 Nov 2026 12:44:01 +0000
Received: by outflank-mailman (input) for mailman id 1502332;
 Wed, 25 Nov 2026 12:44:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWCLw-0008KC-Fc
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 12:44:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWCLv-002bGv-OV
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 13:43:59 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b06d805-8faa-0a2a0a5109dd-0a2a45068046-16
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 13:43:59 +0100
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b06d80f-195a-0a2a45060019-d155dd2bc03d-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 13:43:59 +0100
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-4a3e706b5dfso3577036f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 04:43:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb906c089dsm292108475e9.1.2026.11.25.04.43.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 04:43:58 -0800 (PST)
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
        d=suse.com; s=google; t=1795610639; x=1796215439; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pPpXNDDyA2Nsepaq99Ud+hVgfX/t1kpDIdgX+vMCllM=;
        b=AGupt1HFc1aeoSvJ11IN2P5BBJ9r5jBpPWlWkDKdZGFgp368F9wqTzgZkEXF4ka+Da
         vRsV79INdViqTZxxcjHEIDhSUcnWAvO9R1AYmwHWqCqB/cHvNWTKKIRSrjTsMRTnEU1j
         OKDCOY+4PMJTaoKmgpUuemAYAvWZx5nKeA/etLG+KtMEQnPxvPhWQLJhhWty6gLEvIUI
         Pf7Fv+X08e3ga2lNcWi0koi7ZGzN5hFyMeZ4r5gATMVmblwxx19wa/beyhGsCx92LEc1
         FP5aPlx3Vr3uYKuAelKRA8pbf8xEYpiqGO1h32CrghTpJAJ33P/z6nu2QzCOuhKnYpN2
         ekVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795610639; x=1796215439;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPpXNDDyA2Nsepaq99Ud+hVgfX/t1kpDIdgX+vMCllM=;
        b=IcZ2ul+6xFv1bS9BySWfkJFky9lsE2Owivjb2tvUgC6MKfvPY3O2zcKWAYt6B+9NlG
         iZg6tX/IkftVH3ajcbPKSrezQ7D3Tg3r2tbL0V5Mb+ZnWX4p3+L08R+qohzM0cdJ+1AM
         t7BF3JXDrqeKqRSKil/CRM7bHkp/MpUMgX2dIqWdgI8OZkWeLo0H41dZmaqiolSxugqu
         WgyE5mCG4nv6v0A/HRTBlHXm+2yWbUzX5N6z59xmUf8TXuKghxBK5n13CvnpjVeseqfC
         1jcIPkhNYE6caYIHyNz+Zy+fTrviPVH71fYdpLszwCgj4IEdUnezT/cA0Fi+EJGGD+L/
         iZFw==
X-Forwarded-Encrypted: i=1; AL+hErG+f7SmPMsX2hzfImvE5sTwgCl0Ccb3/uDZuYJfyQbNOfEme1TaN1D01kfXdp1X3KNVBE6JjwL7CuY=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9E/Rl1m+QP1cptlQbQ5XMXeClAF+ArQBFsgSFWsIxH42SEIPWp
	oRt3rs5fwaOVqZweRb9BDuV54wrEm24K2mYlWGumcRZRr6sxMpHxXGSwvn8kwU6X+Q==
X-Gm-Gg: AZFdTZenWabuNcjz//ZytICdrGVYdx4+d9GrMh2CxrpFzaDtLmLmT5426u7jK1SyWx5
	ih57qpDhm+3AQiVa5Zpv2Xr27n9+efus1obWs2ukq1PntGMu+iZmGfZHtIZ2os9qj+zvinTPAU3
	tMMVDd3jdCuAJsSuyTxDAyNzwwKboH1MfBNUgje5eZwyhOo5qUwlGbmd0vSwApI2Fc6wFh3NEPZ
	aYDmlJ52GsLPQnvtoxm2mHDEMMQyxSRhtuq8h2ty2fPfCWCgRs6HgXUTDOu+5Fz3T9ULX9sLehj
	puXHPWiYQv+uLPZHVszWvkIxfYNSFijYJbbk+q3+mW3LbMDrDa4/iYCM9RWm6AkVuobbfAC4Wex
	gY44I4Yu2TrPhPNeMKHBowcSTdWrGQQYsK9arWG4u5o83XKMtYkIXaZXgkR2nKWwC9Ug/OJcGfg
	lvCFSQp8cI+ZUPr/UGlMG4Q1TvT5aT2e6x+nPMn3IjyHzN9IV9Lz+fzWeUHhrEf6n8ZVlboPKh0
	X48qN9CSynmFRcWwFHWxsYvB20wKvJnahsoQeZKzv4DXF8c+8M6m1HTII4j2p6ULj8qgub4R0sA
	mlDkWAL2lbK5il2oMo/ABEnlQnFJM+J7UgtTRjgL3jRbcZ6qrGUIgVEB0rWMTr9ex8OGXdyrh7N
	J1PfWWBUw30IfqdqMlgE=
X-Received: by 2002:a05:600c:5246:b0:4bb:6de4:2f7c with SMTP id 5b1f17b1804b1-4bb8881c5bdmr370882515e9.20.1795610639049;
        Wed, 25 Nov 2026 04:43:59 -0800 (PST)
Message-ID: <b86dc4c8-99e5-4cac-b5b0-9f5d03d0611d@suse.com>
Date: Wed, 25 Nov 2026 13:43:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/efi: Explicitly set NX_COMPAT on xen.efi
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20261125122352.578425-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261125122352.578425-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1795610639-F460277B-359FDA64/10/78276251493
X-purgate-type: spam
X-purgate-size: 590
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 25.11.2026 13:23, Andrew Cooper wrote:
> Binutils since 2.45 no longer set NX_COMPAT.

For completeness - ld prior to 2.36 doesn't either.

>  Programs have to ask for it explicitly.
> 
> Xen is NX_COMPAT-able; Xen does not execute from it's stack at all.  The
> property is mandated by the Microsoft UEFI signing requirements.
> 
> The --nxcompat option is available since binutils 2.20 and llvm 6, so can be
> used unconditionally given our toolchain baseline.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

