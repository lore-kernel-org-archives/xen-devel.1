Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D053C79FB9
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 08:39:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414157.1643955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4aIp-0001Un-5N; Thu, 10 Sep 2026 08:38:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414157.1643955; Thu, 10 Sep 2026 08:38:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4aIp-0001UN-2B; Thu, 10 Sep 2026 08:38:39 +0000
Received: by outflank-mailman (input) for mailman id 1414157;
 Thu, 10 Sep 2026 08:38:38 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4aIo-0001U6-5n
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 08:38:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4aIm-001qTP-UV
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 10:38:36 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa26c84-8faa-0a2a0a5109dd-0a2a45058a6e-24
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 10:38:36 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa26c8c-4cb1-0a2a45050019-d1558033ed16-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 10:38:36 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4998b5a63e2so78283305e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 01:38:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d26bc08edsm36238895e9.3.2026.09.10.01.38.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 01:38:35 -0700 (PDT)
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
        d=suse.com; s=google; t=1789029516; x=1789634316; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lZZC7wigyBTvp1BFyhOuPgXhvvKf9IAra8F/1p1aImM=;
        b=DipOqXdLcVeIHnglixtvqvQ3EKEwRtZ2DteRpXI8EODndV+a5Kl4dG8hJJlL70HzHN
         aZEUO7s7sQY28tJOo/Ir/jXPQ7whlnil1g/PhF5prxydD8T92/dYtGsSEeSksnLs8zv5
         HI47OvZmO1RWGwr4cA0I7v4sCULmjW6NvpZfdCybgAzrHegwObt72l7YtGGnHA9TZTOC
         CDzYdK72UQ7ECcGBypNonRKrElcsoC6Qa6+EuPN4RKHKlXWBZWZ4KFEI954bFUeiTbil
         WKsGydjySPg+TZqT/mkZM5nwZH3a4IgYBiFqxhGhDUzD+hVoRqcsGCiNyCs2OiNgQvbS
         txtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789029516; x=1789634316;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lZZC7wigyBTvp1BFyhOuPgXhvvKf9IAra8F/1p1aImM=;
        b=A8co1h5WnpbY1bmJeg6YBap4zcVvOxt/n7VTQqaj02k0I+cN+D+vOrW6S8t0+Hf+kV
         SohFzfoUm9gCpLUu6uYCadwO8AqaOL63nWX/Nx3MmI+wIN+yJ0hvR2+2+VcSXPT32TCd
         YEb4usziK7Y42fmEcSegWpveA/4KSwiQRzf1UxRZ1yJGzOyRe2RhstZn4oxh1TuCKRLR
         TBgp9CEJiJGNl8VX5uaexhgjQ4/16V91Zsm7y4ll0Tx7HSVMH9Ysg10Y1kAaBx9IjmLm
         WMGDxhCHoh1KLqjfbhtDEcwqA6U+KRN83iEd8xPmxLN1xjk6kag3rwX1SczN8cPGLSWW
         5j5Q==
X-Gm-Message-State: AFuF++m1OewApJbPaH4ADmX4iKgeQtweUoT4KHC0eB9+Hb4SIv38q+Ec
	5iyeSuUwQ2LOSCv/LaANT//6kalRr+VrmU8A7qReuLubhtf46Bn3egyQ4dOSV7NJDQ==
X-Gm-Gg: AYBFou393GAVSLHdpHol+wa9M/8vMzV7dlM1yAdMW/737c/05qG3cvpaHH+6Ceu6exw
	96YWzBImRNL03f+AnX9dgnGGdGlsHCh123H2sCEeoWIztD0VoNXeSpfw/jPAR9Hl1B7XSz+DxME
	rnFudEyoEZUgl6mPRfsb139gu0YEzyMmtXtGJGsUznZ01c4eoyUY/z61ExRsvufn7vlYG0uJz/f
	NKyvTJ17vdoV5wEcsYJvx+mWBmnf2cE54c4/NIO4DPvs8gjFK4pfZ2W/WOiPcNJjZEb420WuArF
	TPa+Z/cWUt8mf3dBcNUfbuL0yqYOLm57Pm5vnsOIalIf5Wo3ox+EP9nrDr+YDU/IQhxSzJEjcUJ
	6W3+v6pNca6lS/oONmPxFy1ZZkNsN9Yrx8gyfRJGtPacJJHPPVmNIe0FK8KKHDGrfbhg7OhcOqn
	ALwkQ/fEQRLHlFpKGD4dRAqPMrMAcIBYBdBjtf6blhADSrCklStg1rZnkOigcVRv8wCSwGnJRBp
	9C5HWeXRLAVaP36Cmh+l6LK2VFnyp0uWeOBo7J+JF61BwJmJsDXKn1wOzFVZyQ=
X-Received: by 2002:a05:600c:190b:b0:49c:fc6c:be12 with SMTP id 5b1f17b1804b1-49cfc6cc0acmr332222285e9.24.1789029515881;
        Thu, 10 Sep 2026 01:38:35 -0700 (PDT)
Message-ID: <f17563f9-3a42-4002-afa0-b763e125dcd6@suse.com>
Date: Thu, 10 Sep 2026 10:38:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] x86/crash: address Misra 2.1 rule violation
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
 <96de425a-29f7-4759-8466-b72bbe40b90b@suse.com>
 <aqJhJO2FtkrJCabM@macbook.local>
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
In-Reply-To: <aqJhJO2FtkrJCabM@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1789029516-F64B42A1-88AD3134/0/0
X-purgate-type: clean
X-purgate-size: 570

On 10.09.2026 09:49, Roger Pau Monné wrote:
> On Fri, Aug 28, 2026 at 09:02:18AM +0200, Jan Beulich wrote:
>> The use of unreachable(), when unreachability is visible to Eclair (and
>> compilers), is deemed a violation. Drop the redundant statement.
> 
> Urg, isn't that something that should be fixed in Eclair then?
> Otherwise all the unreachable() calls in our codebase are likely to be
> found by Eclair sooner or later, and will need to be removed.

No, aiui most are covered by deviations. In particular ones in BUG() and
ASSERT_UNREACHABLE().

Jan

