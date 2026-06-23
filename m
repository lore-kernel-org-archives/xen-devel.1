Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAEBCDB46F
	for <xen-devel@archiver.kernel.org>; Tue, 23 Jun 2026 14:44:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1344352.1603441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc2MP-0005Xa-Jv; Tue, 23 Jun 2026 14:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344352.1603441; Tue, 23 Jun 2026 14:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc2MP-0005XT-G6; Tue, 23 Jun 2026 14:44:21 +0000
Received: by outflank-mailman (input) for mailman id 1344352;
 Tue, 23 Jun 2026 14:44:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wc2MO-0005XN-2A
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 14:44:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wc2MM-00BYbX-NX
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 16:44:18 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3a9bbc-2eae-0a2a0a5409dd-0a2a4504d290-10
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 16:44:18 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3a9bc2-5f9f-0a2a45040019-d1558031dcac-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 16:44:18 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-49258ac7294so12342985e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 07:44:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923fe7ba08sm380600905e9.11.2026.06.23.07.44.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 07:44:17 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782225858; x=1782830658; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eN/B8faHyk23z1NLnyDeWJiBbbh4GL051+ewk+EUD7w=;
        b=VSzKslsf7qXIokknIE48HHPDvamf9OgK5eswnG3/dxdbbUq2lPLiF4vitE+Aqj3v++
         voWfR5jtYiiswyYHv0JpP4Lg1TA2fLtMs5HrscZRQKruE1U0X2HxZhoMT/avdU714mqi
         YLX+IefmJqvcplkefjFDFGRpi/BoLBlXDLbCUygVUdJ5zTEGvEqOLOG3y9RmYhGLf6L2
         r/qA5Obl0DIyouigtbteYXuqAjz5y2VzjDjl1FaA8Sv3NoL/SrK9ww6/qv8hBRyrGBtr
         sz6KEvV7EG/r2eCWGqn4vi0O5vYxjIMbPgzZ6Jc7nDGfozLtXcaoph6eQ4yuq44t4IQv
         EvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782225858; x=1782830658;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eN/B8faHyk23z1NLnyDeWJiBbbh4GL051+ewk+EUD7w=;
        b=nADAHdqnr1+wSO+lUOTpNfuJKs4G+3lqVz7rF8cHBlCbgHxxPhY9+CsLSoqXK3E8U8
         G5PnZz56cy4v+ky4hYWdDO9pvHNX7E1GlUxxz9kGh7IbRSoiTTRgMFAR6z1qZZPuNat/
         c+OO4Z8vktkqj7F9zYiT3whBAR2W8cuMxH44viEz0Z0RBMy4zW3QP+3j2LyUwk4u5CKJ
         02XULWAHqBEQtMxGPS/fr7Wnq787sBu7N2uQgBwvXTsSAXr5kyOTGvAbuEg7aT/hgR7A
         69xzxhM7TDRbE+MP8o0cvImuiOyalP2uYsLiyVCl9T504rpgAAE3db6ZNIRkPBEJiCSW
         sEpw==
X-Forwarded-Encrypted: i=1; AFNElJ/FX0LkwuvS9yiMDyf8txOePt+A2ng7EjQkCu2t5Tc0pQtDmBuQQaCfDep2jVI+IMwTKpvNsTNKaEY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwrUQ8TbtWayqnd1gf/35fYvxn33U9VIrWcbpqddU8zJUs6O8ZA
	i4GSaQtwD3+Xdnt6icLkP1/FIquNFHQocE2kwCPN+D9zjLfQ7m4oOgzej3IbI6HUgQ==
X-Gm-Gg: AfdE7ckfXIlvC9ZsBPzA01FpN0ynYgts5Xvqkvto964Anlk076GcPA/5DycwpZbjRV5
	nZGVEKna9vQWc/3Nd7qLfYQ8e1pkXU0sWFwmqYxDF6Alv2eDKl9skMsf5OxyTKr1+gPHeMWdYLz
	CzIad7VgtS0UEoL190umVw4iyJPoAw7EfeP1BvqQWrF5h/yv7wXOmY+f+1L48qV14MLSjVJUyjX
	c9e8l5UfAD14aAfKdA8L8IT4d7R8qkI5Dk21tbcivMfykSYFFHT95yiJaNS5oOmyFYlQFg/LAJO
	HwmKZQgfmcg0Mn5KAI04FaLX3aU86dBic+BCnDwm/WXLR6gXE/XuYn1DkyDcL/bBX9hKSSRUGVn
	VfOhK70ij6dJlmqQKHq7mtyZcB+CmUQsplPkVgkHpI9PS3lYPoufIslqL2/SBcXRzk3pP6ce7sa
	rwm3wyVgBkOXeqhHuNTSM5f0r463Azqn2FRhdVSbcwcOWJX3Sx4Sy2ps87bxbMp/eEXhT333Bip
	cD6
X-Received: by 2002:a05:600c:c4b7:b0:492:3773:a230 with SMTP id 5b1f17b1804b1-49240e9cb38mr316895785e9.27.1782225858019;
        Tue, 23 Jun 2026 07:44:18 -0700 (PDT)
Message-ID: <b7bfcd3f-acad-4637-a391-32cc9bd71a38@suse.com>
Date: Tue, 23 Jun 2026 16:44:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] x86/kexec: add digest checks
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 ross.lagerwall@citrix.com, xen-devel@lists.xenproject.org
References: <20260622151833.3397692-1-kevin.lampis@citrix.com>
 <20260622151833.3397692-2-kevin.lampis@citrix.com>
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
In-Reply-To: <20260622151833.3397692-2-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1782225858-477DD141-F15AEE86/0/0
X-purgate-type: clean
X-purgate-size: 938

On 22.06.2026 17:18, Kevin Lampis wrote:
> From: Ross Lagerwall <ross.lagerwall@citrix.com>
> 
> To support UEFI Secure Boot we must check that the kexec data has not
> changed between signature verification and actual execution.
> However, this is also a good check to perform generally.
> 
> During kexec load, calculate a digest over all the kexec segments. This
> digest is stored and verified again later prior to entering the image.
> 
> For now, only kexec crash images are supported.
> 
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>

I guess I'm not quite following here. For secure boot purposes, shouldn't
the new kernel already come with a digest (or really with a signature),
which we could check in both kexec_load() and kexec_crash()? If we check
against a digest we calculated ourselves, we'd apply more trust than we
should.

Jan

