Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B953CA5FAB
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 06:28:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436853.1655515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBnnH-0007e5-Hw; Wed, 30 Sep 2026 06:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436853.1655515; Wed, 30 Sep 2026 06:27:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBnnH-0007dy-EL; Wed, 30 Sep 2026 06:27:55 +0000
Received: by outflank-mailman (input) for mailman id 1436853;
 Wed, 30 Sep 2026 06:27:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBnnF-0007ds-Vw
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 06:27:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBnnF-0059xX-9b
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 08:27:53 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcabd0-2eae-0a2a0a5409dd-0a2a45028cc8-36
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 08:27:53 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcabe9-6ca4-0a2a45020019-4a7de14cccec-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 08:27:53 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-482f6351831so2879413f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 23:27:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b029f2b0dsm863114f8f.25.2026.09.29.23.27.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 23:27:52 -0700 (PDT)
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
        d=suse.com; s=google; t=1790749672; x=1791354472; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D6Nu3HL0OunCTSOQ/0sjGPRiO5Rv88/1NkyR9hgZ65s=;
        b=Nh1/vXd08x3uQJrbhPjzCy9fyIDTQkYFmvPdSO4MBEciXATyXWaqHwhOYQKjvRP3C3
         B+I1VfUNN5JetgWkAcQX6Jk4m0HkUJT7pp58bevSYu6/SpEd6U1ye9FU7WlBOn087oia
         Z5NVx7QIbotoJnL0ku5+mPBNg/nbwEU7obK+XW4oBC4piVwExohFe8d4yLvsFAd1hK3+
         ialTEwDUCUNjzCGrwHsttWQiyq/v5mjUMZHnxeGcVcw8FYkAT3MGIkjACb1fyQi+/Pyr
         LmTDfKGrsTtM+bAOCmdrT2FS8SfRVHmbkbVO8PTk2x/cV38zjTc/IRBkvlx6WJQGA0Gh
         kKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790749672; x=1791354472;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D6Nu3HL0OunCTSOQ/0sjGPRiO5Rv88/1NkyR9hgZ65s=;
        b=QVE1x6AM4geghQ5rWhdtSlNkvYTHdPqaIKxBQ+VtRXZKfK8fARrKXPZ9+KML2AGTtK
         y/HHCUpJVbhWCBk4kwFL9KxzT5a47qf2rh9U24WRVNi23vdovgCGrGrOniJnLP9PP2tk
         Pwoykz8jJj7tH2AI0LXJ7M/UoHh+p/tSMJwqSpOVPwoyLss/55ipNHq9q7apRw/P/+Yf
         zLQkdM+4b8ZyeaeCGMkfDJZ+ui7RSrgShboOYepYPTkZA2kZGjBtbFTDtMNrpzclGROx
         Bk34C6IeWD23eBBnLmcB1e5wWoTiy8+L9JP9/r4+u2f+C1+VCv64SzAky4Q6zF8+JtSZ
         O9fA==
X-Forwarded-Encrypted: i=1; AKwUvBxdy6ga6OpYgawxMKBi0CdUB7d+Ew+q17LXAK/jR7g6yp69dwHrqksDi/8M7qXM2l6jbFE0Q6Pbp6Y=@lists.xenproject.org
X-Gm-Message-State: AFq9FYK6l83u8zucSrUniD0tjmTWF20hyOsqUkL8bvgXz2izeqe2scAf
	c0hndtoHxxMfDjvbdzXNuIsHrhJRora30DTqIdqinTomnmCzdlVFxMhONUH/9GcoWX2AGv3GHHG
	weWK2ow==
X-Gm-Gg: AYBFou28k3Efu6XF1WVW2GoUtlPm19dvFZmw1Wa0NFFNc96o4mK34+vZQC5QgAYWLyK
	QAPH7YcfB4eY52fDlotHWDUIc6q1Y627kru3z/wVgAN1bJtCLASFydeJtEnBGRzuRdHGsrtmkuo
	SS6Y8rpBV+qWNBi2rSjMtin2w+LOslPS7fmkex7Pg0oMjjos32i5ij/ewv55Lu3egn5aymksbVt
	Q6ENJFbgXIKZckIQlNVyvDH2oge4EXASvotpS5A6nEQIwmBkzTGaLlsVnmoWBArqtP+L1xD6VMy
	jhO/YlnSzTMDvkr9fxnHnECn5y9us0y5zLnpIb9gPP6GjytB0gwNHrLX1e59FbcOgOEZWrBN495
	AuaJb4nq9oZc6ThnD3kL6EuZsQeIcM1YIXYRWW4lFtJdkc4ztlTErdiFPBJiDH8wjz+BM/q4VJA
	XsAv5pBWqpjK+q7q8d2SokwmfxfsbSP1pV73hNGADd/BN7/t7dPgpTdUBENg2fNz7pDLz73WirB
	cGG+7NUPfnp01u22dzphI39cjwbKLGXqLlzKdmq4FRmFKUotqMBnYv6eKl5Lb0yejGZBHi66w==
X-Received: by 2002:a5d:59c2:0:b0:488:8a5d:ffcc with SMTP id ffacd0b85a97d-48b024bc9d5mr807657f8f.13.1790749672700;
        Tue, 29 Sep 2026 23:27:52 -0700 (PDT)
Message-ID: <b7b37df2-b282-46e6-a6f1-1076ea78d334@suse.com>
Date: Wed, 30 Sep 2026 08:27:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] eclair: restrict scoping of guest copy deviation MISRA C
 Rule 11.8 violations
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <23fa33db36bde08b03b6be9913dc4a8e72206619.1790748103.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <23fa33db36bde08b03b6be9913dc4a8e72206619.1790748103.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1790749673-F3ABD2AC-3ED2025D/10/78276251493
X-purgate-type: spam
X-purgate-size: 416

On 30.09.2026 08:22, Nicola Vetrini wrote:
> The file scoping restrictions were spelled out in the documentation comment,
> but not enforced by the configuration.
> 
> Remove duplicated file tag asm_offsets while at it.
> 
> No functional change.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


