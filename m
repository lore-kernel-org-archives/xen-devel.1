Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E683DC624D0
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 08:56:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405375.1638874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1glm-0008Ho-T3; Wed, 02 Sep 2026 08:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405375.1638874; Wed, 02 Sep 2026 08:56:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1glm-0008Hh-QJ; Wed, 02 Sep 2026 08:56:34 +0000
Received: by outflank-mailman (input) for mailman id 1405375;
 Wed, 02 Sep 2026 08:56:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1gll-0008HS-W0
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 08:56:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1glk-00FtXH-TD
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 10:56:32 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97e4be-2eae-0a2a0a5409dd-0a2a450bce04-4
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 10:56:32 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97e4bf-b7e8-0a2a450b0019-d1558029bc07-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 10:56:31 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so6936825e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 01:56:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce10153sm142724845e9.4.2026.09.02.01.56.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 01:56:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1788339391; x=1788944191; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EkGNW96hwwDqWM0OQ1Pr+8RqFw6eRJES3MQo+mTzoGU=;
        b=VEVKMeNNS1gF2LiEKd5StZ5HYKkWgqKm6TiDkfvNx6byE2TFb5wvsIsluB37yOeywK
         Pn8WOiN/5PlleVvybJ/Pqfr9XD1mvinOhIE03JXsvv66hPhZXdPIpTDm2QvajKpGlOWC
         h2T3GvED9KLKGU32CCWD1HwC52JEo+UqXBZ75z5ui/M7U02IwcPLdoiFHT5IuMB54KDq
         ODQko35tp8PD1a03zS/FPCmHUpkPsoNI5XVoWJNS8//u2Ra87TjH0xEk6caIKBmjGt9w
         VvHBRjdpJzeDCqOWKyu1mOt4vMlZvfkWw82Fzyst51V731w9ma//pEaxheYjf2SqMGQ9
         q/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339391; x=1788944191;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EkGNW96hwwDqWM0OQ1Pr+8RqFw6eRJES3MQo+mTzoGU=;
        b=Dqg78vUFy+y6IQYPuU+NrhwpL7xRNE/fy5bxn/fq6glme0fDxYffUjQRbgmDu2rOTt
         XnsA45sbcaWGeVmPz+cUcEGRI2ZAaNBc8/xWOoiPj3qXdD/fQyx1Q0UH84VeaIikQI8X
         QAqESTtb0TUb6U4etr0Zz3eCvrNn2A7Uj2J2wgihn+oKy7QKrUGf/zylwNRh3kzsQE7/
         azfEeQ/WQOVNpINcXeeHtFJeogeIiz5QIl13CNnyNsGVykq+5QOrlnkpQVFOlzDcRQra
         0E6FXG1+kKBc3m4nTMinP8hQXEYVWlXSk4Mcn/bXC80GywtDuPFR27SfYLF0tdYuG1Il
         ZYeg==
X-Forwarded-Encrypted: i=1; AHgh+RoqpouD24uvtEDAqEbyGrtRDmmrKywLRpTJUaA86aLlfXJa3WIxQfJZdYse2ku6RuD0PCP/K7T612Y=@lists.xenproject.org
X-Gm-Message-State: AFuF++l1RqASbBmNAasly0Mtz3x4LxqkAIDhFC6zNhdkaUMb21uPX8od
	i8wBYjyjjtQIwSuAmr2vQvWTtEMvjPCXimSBF5Sy6n8pDK8v7gtzradUBrbrSsal+Q==
X-Gm-Gg: AR+sD11apiwyb24yZuVRZWRBwrfcCBS75NDlDXx2imZVM0uqQFbEW/faY5d445VBq9b
	PSa8o8VT41Zv8BVmoXF3msD334SsGZwgloarNU7Mc/9pLIarXrAytZ4u7yXeJI4y6zZP7vmVzai
	wg0jqgKxPcdhjxXd36haUwVugz7FXlgEGGesh/Cp/rlW2alSS+wYKk+lKN6qrFLTvptjEL+ben9
	2XWwswjRtiQ/xNnKv8VhzKwb9Dwv6vEmjNcWt9MTuyoQB1mSOj13hEuqFbQhqkJJSDm9OGRCXw9
	LL3WEM0hcie3jz92Bkl1A60pBQOEB0NxIrTObVdg3h8I/zIfZsJksHy27QBjYinsQsi75VGnTpO
	MC3VC/Z1C98ckIz5a3P+N4uZU/rzfvSGqv2MfR1T/yzm6u8VHrHGZp7VLAK1cn2dLsXPiZ7zN8E
	rU/fNcMzdO44OZDuI/tayrlxC6a/Z9z8BT7tJMvu8daoCIruy7mqpGmfbFZDm5yd20Wp62xtSN+
	w6RtZbEXsnSKFgf8R2MrcPVbLB4s7JN7a9T77RtTOeTS/0/YCQR
X-Received: by 2002:a05:600c:8b05:b0:499:b65d:124f with SMTP id 5b1f17b1804b1-49ce5823d9dmr66172685e9.11.1788339391259;
        Wed, 02 Sep 2026 01:56:31 -0700 (PDT)
Message-ID: <8efb31c8-cb19-4cc7-b752-7786139afafa@suse.com>
Date: Wed, 2 Sep 2026 10:56:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drivers/char: Check if console=dtuart for ACPI SPCR
 serial bring up
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260902073606.61062-1-michal.orzel@amd.com>
 <20260902073606.61062-3-michal.orzel@amd.com>
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
In-Reply-To: <20260902073606.61062-3-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1788339391-194C39EA-093942C1/0/0
X-purgate-type: clean
X-purgate-size: 598

On 02.09.2026 09:36, Michal Orzel wrote:
> dtuart denotes a generic UART parsed from a device tree (back then it
> was the only method, hence dt prefix) or ACPI SPCR table (they all use
> the SERHND_DTUART serial handle). Currently we only check if console= is
> set to dtuart in the DT flow and not in the ACPI flow. This means that
> even if we set console=none we would still bring up ACPI parsed
> serial device for nothing. Move the check to uart_init() to cover both
> paths.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


