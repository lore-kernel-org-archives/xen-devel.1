Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE01FC624D3
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 12:54:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405854.1639296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1kTf-0007J9-Ky; Wed, 02 Sep 2026 12:54:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405854.1639296; Wed, 02 Sep 2026 12:54:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1kTf-0007J2-IQ; Wed, 02 Sep 2026 12:54:07 +0000
Received: by outflank-mailman (input) for mailman id 1405854;
 Wed, 02 Sep 2026 12:54:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1kTe-0007Iw-3V
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 12:54:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1kTc-00Ggng-Vx
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 14:54:04 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a981c67-2eae-0a2a0a5409dd-0a2a4506dbde-4
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 14:54:00 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a981c68-195a-0a2a45060019-d155dd2aad2e-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 14:54:00 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-48433fad54aso663079f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 05:54:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e7fddbsm5953519f8f.11.2026.09.02.05.53.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 05:53:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1788353640; x=1788958440; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EVzIvntrdBachigCrXs5hhwAmXuepUUkG1cNV9+9DUA=;
        b=WVoRlSVEe7zEy3cB/3t6RrEWyzoR0Fi5+THRVCcWq7rK1ZOWIVmBV2Wj0EwtC6YSFi
         esuzoQQDG5ENvUhWE0w82i3LZl22sFhcbx7e3Mslg6iV6zpTEYDKYmBK03zZQwcd6KaI
         ijrgv1+9Kw28UBa7Ckg/KxWx8YT/7QD/pV2OtVRAdkOk3Niad8bN1laBumKb7kG5xNxI
         0TjAt2DRuFZH5i//I4OaJLdDatQZ0Af7dsoEF2pf6AtfhT0NtdHSxOb6PclF9zh1oI3k
         LVnaWtNjHIGONiakPlUazYyr99+oR5GzEb7zJsLp8BVWSWQtEn6lhpauC1OJTMX5cwrz
         Uhsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353640; x=1788958440;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EVzIvntrdBachigCrXs5hhwAmXuepUUkG1cNV9+9DUA=;
        b=Bs3E50eq6QkEV6N9EeM++qCyKnrIRQSEUQUm2rT24KnEnXhZtGJUuXao7IaDHseWOM
         KWGuxKWXBmdDDAeyfXt3PTRZOhfvAP52WO8s2z0U6ZA3EX5z113ms40aG1kC/A23ce8X
         kV2C9WIPxtEyRzI88EuS6SFIAeekpgSJHJTck4Sp4Kn4nosVhhSEVvMMEW5mbWeFi5pu
         +/nvzMag7VJ3VVULjC0/ucbexjY+2obj1AcWTD0lRmrtysr2Bkn8fyKguOdY8Gm/C8R5
         OVTj9sk0biTarL6ppG3tlHQmGZDBECUCtBNNkQt617C4AD5uBPVzN13Yn0zrvggkzfsZ
         95kQ==
X-Gm-Message-State: AFuF++kN9985rqBEG32HWyhfgF3C4tBfLYF9X0arQwK8AZJuyqFwpoaE
	eBQ9b9BHsz57WJb56nzccDOW9nGlMDkTCD6i4mj6EE/GlBtf6JCccHyFn4uV/Lehrg==
X-Gm-Gg: AYBFou0mwBmaJsxtCL3Bxnzh8EOEA8Y8k3LiTmeOsFYyHUOnyOx1ws4OQ2tD/s6cnqu
	QP/fYUBVGLlOce1bQxPMtyrnqSAlDLWDujb0o+f08GpelWOPYOfaBjNE0Lv3BQrq5FvxNhOLbzj
	NZ0i2mch+T8F9ddslAZYTs8ia45pGM+jWN5+492FDNEo/iyVKvkQWVSs3tGj3u2gPdtpZ3D9ys3
	HFGyqsxC3p3WvW5l5lZGcy+N5TH5ZHrW7kp6xktKHAginlNl/nKnyBeaU9F22MVOPCVWvSwFgUQ
	zaQnlmAQmohoZ4XjUKOT+eGzoGf9EOxNWgS05WKG9C2TCOxGx9HsTvllQK3I1rj/5aSyCRh2JXk
	O9xlENkQmr3Cpkww6yCMJf/vOLr5g+bAiCvblqX2TD+ddp4WOr5Gf+3BxGi6GxQxsf1XPX90rgY
	DuKsCrzDtCR65uOlfWMh/d7IclABzGqdDD2pX0/S1koE4p0c7szylUhamKYxFkBoRHWH6dPIc3f
	tUBoVgVVMWys+jSaejeb3Pk5egDZZpxKC6ldg9NJ9HGE9qYmQPRgQ==
X-Received: by 2002:a05:6000:2607:b0:484:3310:7110 with SMTP id ffacd0b85a97d-484914c272emr8008399f8f.28.1788353640244;
        Wed, 02 Sep 2026 05:54:00 -0700 (PDT)
Message-ID: <52dcd7cd-52db-4b59-90ef-f7cde79cf5bc@suse.com>
Date: Wed, 2 Sep 2026 14:53:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/14] passthrough/PCI: rework (s,b,d,f) init of struct
 pci_dev
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
 <baa05f9c-6787-44c3-9d53-e3adc0509140@suse.com>
 <apgaJh5ezRTmmyz2@macbook.local>
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
In-Reply-To: <apgaJh5ezRTmmyz2@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1788353640-1F0C777B-919E8FC9/0/0
X-purgate-type: clean
X-purgate-size: 1045

On 02.09.2026 14:44, Roger Pau Monné wrote:
> On Wed, Sep 02, 2026 at 08:36:27AM +0200, Jan Beulich wrote:
>> Right now we're casting away const-ness, to initialize the individual
>> elements despite the field(s) being declared const. Eclair validly
>> recognizes this as a Misra rule 11.8 violation. Hide this by switching to
>> the use of memcpy(), deriving the destination address from the (mutable)
>> struct pci_dev * which we hold in hands.
>>
>> No functional change intended.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Subsequently we may want to further leverage the sbdf local variable we
>> now have in the function. Yet of course the primary question is: Is this
>> an okay game to play in the first place?
> 
> I've wondered the same, while this might be obfuscated enough for
> Eclair to complain, aren't we still violating the spirit of the rule?

We do, but what do you do without dropping that "const" (which I'd really
like to keep), and without C++ concepts of initialization?

Jan

