Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6235AC624D3
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 14:20:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405982.1639406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1lpJ-0000Ys-Vn; Wed, 02 Sep 2026 14:20:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405982.1639406; Wed, 02 Sep 2026 14:20:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1lpJ-0000Yf-Qj; Wed, 02 Sep 2026 14:20:33 +0000
Received: by outflank-mailman (input) for mailman id 1405982;
 Wed, 02 Sep 2026 14:20:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1lpI-0000YX-21
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 14:20:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1lpH-00BlOF-Ev
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 16:20:31 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9830ab-bab6-0a2a0a5309dd-0a2a4509bd38-32
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 16:20:31 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9830af-be1a-0a2a45090019-d155dd35f13d-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 16:20:31 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-482dd6ee390so1122069f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 07:20:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-484492ce236sm7656029f8f.35.2026.09.02.07.20.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 07:20:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1788358831; x=1788963631; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cnu+UhoY+TS0Wa2oSi2rdmrxyRsoa3I4M2hLDEA1cAU=;
        b=LuDeVItOLfgLOWcmguuDKVzKhr0cmLg955/GcsLTDuXTenD9L/JSM5mIvLghfTdcEe
         fLdjk/kOUQ1qNL3B03BDEDMSo9EzHIdsC1ezPQzgRH+IPQaMWuCo4ypE4jfyQea/1XjH
         QqkXPBfBBvEO+55omiWYFL7D/p0O/YN0qMvEG1ijrcWtNd3UoTZfHT5wPHk4Ryp49Y+1
         X5DkdtUhi0gXYukZCC+MDglwZAJZQ3lKAcoaDBZnM4A0wzF1Ektyl9s+d8/26pzQxuka
         OZ2qgKOuLM8yp/l6go1h01HDsww7w9cE3+8J9OPkWLrJ7jxp6n7be3SuYVweJLdItHPD
         9Gyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788358831; x=1788963631;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cnu+UhoY+TS0Wa2oSi2rdmrxyRsoa3I4M2hLDEA1cAU=;
        b=GzkwfqwkYcIDn+Enlkhueo4+bVnP2BwELrzKH094dX8PnD/R7KDasIFCNgCBWBNDmf
         T7ItEsZq5nSG80tunirDd4UlZcZ1rCTundaXu9Ug4mJ/nR06ntsGKJ/Yl4z08OE+hRo1
         auw+DwyjLg0v2syQ/lK8/+iPWCvGTjGxz6JjoFJVm/r/zOqXMVjIsmcQtmv6zsqDE6vo
         GsTytS0sIKkxRaa/Cw/yGfdbG4bxlJeQUMPkqojcXISSNxKqWsdUSUqfZKjX/Eb6ZeAR
         /RxtloBxfXV6SpBctT7sdyPpTRNisak1rRFh7VgnqBku+9lsLXRreEHNyJFagXDUnLZa
         0ZWg==
X-Gm-Message-State: AFuF++kadkrJQ8n9hVbAq/Ubp0ISY+/5y4fdeXV7NgdeFvwHwWcVZ3hW
	K1qO2PnUk3ZdCOZzmlXwH5q+/hb7ByR1JC2etGoU0Opl12kRR5kTh0aFPq0oygQgw8wEA6c23Vi
	CEDvrGQ==
X-Gm-Gg: AYBFou0tjxQA2V0Msha6ivFzeM0PA40OknbwH2UFAL+0u3EnJqTFdF18Sd8M1YSA4GT
	oe32YpAKkramDE/gMQrMDVvMSDJihFlkXXR8cqoFqQZEJefJNWArDEzc9v/ErnpoD0gCu2OicGZ
	FWaCAfJ40MiQbkfNnuXU1nSL26fpnSW5sK3tlT1dqmRfoO48Bwsexpl4gnaUmNMzFFCzT1mvgTc
	o2/KZ7P4D9/XS0OXEdOk4dqL81z5hAIVpNXPVPzQRCppo1/d8mD66VlAA51acACH9fzfcvtpZD6
	RRfldrkEXDZ4ORT3G8cA41ZPRSyZ6Sc98inFQve72//MmCDoLUEWx7TNL02JIpfQTR6oF8M7pc9
	pOcCBNOyXrBVRm3eSSLedUTz1peLsJbhF57lgvgJO6/ey83/MPOEYog87W7m0rnvnPDIq+6OfFS
	ivkJ99lCiMJIvai2h3sFLkMIW3pafFbdOOa3OmYHZO3HwLjaO0i/pWp4rTIHxOUs6fpMOoJKxRO
	tlM4nw3dUhcXcOr3Q1sCxSMzKkWzKdeOGmLqs0vXoNh0Ftrav7vGmWG+8+LbNk=
X-Received: by 2002:a5d:5985:0:b0:484:40f5:da6a with SMTP id ffacd0b85a97d-48488f103ccmr10742556f8f.15.1788358830737;
        Wed, 02 Sep 2026 07:20:30 -0700 (PDT)
Message-ID: <cf397f15-a9b6-4131-a44c-575d74e38d89@suse.com>
Date: Wed, 2 Sep 2026 16:20:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] x86/time: avoid early uses of NOW() to return zero
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <ec25e838-6bf6-496c-abbe-0fd71e2fb0d9@suse.com>
 <cb8d9a90-64ce-4e86-a188-36a32fe02970@suse.com>
 <apfWTzVihQi5LX9x@macbook.local>
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
In-Reply-To: <apfWTzVihQi5LX9x@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1788358831-BD8C1034-B927236F/0/0
X-purgate-type: clean
X-purgate-size: 817

On 02.09.2026 09:54, Roger Pau Monné wrote:
> On Wed, Aug 19, 2026 at 01:45:56PM +0200, Jan Beulich wrote:
>> I don't think Fixes: tags should be put here. If we did, we'd have to
>> enumerate all introductions of early uses of NOW() (or get_s_time()), with
>> the exception of those dealing with getting back 0 (which I expect is only
>> printk_start_of_line()). Will want backporting nevertheless (unless deemed
>> too risky).
> 
> I agree with backporting, current behavior of getting stuck in an
> infinite loop is worse than timing out earlier than expected (which is
> the worse outcome of this patch).

Question is how to find a good balance between pulling in prereqs (there
are quite a few, I think) vs sacrificing some functionality. Or whether
to make it an all-or-nothing decision.

Jan

