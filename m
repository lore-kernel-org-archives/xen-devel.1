Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7A2C4451B
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 09:25:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366372.1616255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlkEy-0007eJ-SL; Mon, 20 Jul 2026 09:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366372.1616255; Mon, 20 Jul 2026 09:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlkEy-0007eC-Pc; Mon, 20 Jul 2026 09:24:48 +0000
Received: by outflank-mailman (input) for mailman id 1366372;
 Mon, 20 Jul 2026 09:24:47 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wlkEx-0007e6-89
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 09:24:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlkEw-00FHGH-L6
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 11:24:46 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5de95c-2eae-0a2a0a5409dd-0a2a4504c00e-24
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 11:24:46 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5de95e-b57f-0a2a45040019-d1558035dd09-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 11:24:46 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4954d383e64so13551975e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 02:24:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49563969482sm13264435e9.3.2026.07.20.02.24.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 02:24:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1784539486; x=1785144286; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mg49d2uHDrySGYWaWYu6sAnX/u1V5+K2k0j/XhpA/eU=;
        b=aI35841E3pk1tQCKpQkIyedj0buzkzgZEb2XR4Vvi3c8EB8fh1ZH9OgR5Aa6LE0jz9
         G2xNG7PfU0jZGUxNZmnAco3A3Koxp2SBxhw9qHp644EQke9Gw5S1lSjqYr3tX8ldWRLG
         g5Dp1cP2cuqrx8eRgxtU7d6H2trtMddPyWhcGa9+C5dlv9MRDO+n6s2SAE8qHcVJo6+V
         AOMf9iwOO9oZnd8ECC93nzwLF6G4uDUn041w2yjjVpLvol3aMTHC2a7gfOfggT+zMrqm
         qeyp1CiwxKJjDu8qwNrvoF9ioYNhg09HiX30QPs6toxMCRVOcPrv9Dd3Uim3J1wArcjm
         dDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539486; x=1785144286;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mg49d2uHDrySGYWaWYu6sAnX/u1V5+K2k0j/XhpA/eU=;
        b=bqX7oSV17VJa1ruULpK7er6INU3uWVvSZv4CNYSu9PPviJK9MOmEt0kN2RmXPMfPc/
         9Y0GWyZAjbuRp4yea+hsYhVQKN+94jcX7tTzn6DacvQJwp1E56pUMqGkQirgdDncqr/U
         IDa7RWE6NwZMg1J5+3aP4VlcpQRw5KXNLQnyOIuFKZe1urYiTNPc89Mu8bB44DkWqqZa
         fmbUmEtLh9JGBePwxLuPg3h3pc/JBVgKjbYj2FizVZi5QmEl+43Stpe7tVKGJUZPk1TP
         fsh6XSHHnjP68mIi5UuByO1PrbLYsAhjW2+B+cHYF8ktUHPSsmv3q/uNn3o3/tZV7g0r
         JwjA==
X-Forwarded-Encrypted: i=1; AHgh+Rpc4BsHu6r2CSE11bpryx167yQlolmFGgMrWzAGbbaT6Nf0n0mR5nUglMJrgJ6aAP1zdTZG+Or5txQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyyupXyK6h7wnorRGDUbAI+CdBNF/xHLQC8kn4Z6/RFMHPr+vlj
	ddOLlq3mvZ/DkHaW2PZFpy5bxg559bBIWf6vsHcB7lqsHYxUOLqr5/0zE9MvLX4H6A==
X-Gm-Gg: AfdE7ckelqd3t/GWncEs0BWJiZt17B+7hV/AsRC0sllKthXQuG4/BO8zDxI6ilr9JzH
	VAMR3f5ootY1URbCipdKO1gtxUR5fBTU6lov2EKXFmRn29+mYkug0+w7w0eouWI7H2dXgDVa2kp
	eGB0BKsu9hbaz9nSF1HRe3amR+FZlGXZPuZtNjWdbQhwwUBLy6TjMc52cYELrKAFgCDeVdJ2Z1c
	jDmXNYDUfJFbtu5ym05gKSOlCRbiJ7qsLSlyCa1AsocPtp8XJG6lV8l84+ToWvB94nvHOhM1CEj
	ZmnmqSSzkvDg87C07NcDJ5fT2iQhBvDVN7eQ0KCxsyGaQO4DLQL4HQYsSlXhn0BRQ/3k26tQecL
	fRaRGDcKJKAUdfPcUzKWh3fjRlsl6oTR6PNPQbcTab5yJZAHRNyJKRtCu4vlefOzRexKThSroU+
	bz2M6a8JCOj1GPDnLBlWNQmwx7NXSistWhF4sHC0kCnZbOxLEc6NyMEAwb6Hu3KK8CHPUUIAkmO
	wB4
X-Received: by 2002:a05:600c:4687:b0:495:4df2:7412 with SMTP id 5b1f17b1804b1-4954df27450mr119124705e9.32.1784539486057;
        Mon, 20 Jul 2026 02:24:46 -0700 (PDT)
Message-ID: <8dc8f977-73af-4167-84d0-af78515d9c86@suse.com>
Date: Mon, 20 Jul 2026 11:24:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/domctl: Reorder user_regs accesses for efficiency
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20260720092238.2094500-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260720092238.2094500-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1784539486-C04DBB50-86A80E2E/0/0
X-purgate-type: clean
X-purgate-size: 583

On 20.07.2026 11:22, Andrew Cooper wrote:
> The current order is derived from expanding XLAT_cpu_user_regs() which uses
> the x86_32 cpu_user_regs order.  This is correct for one the blocks, but not
> the others.
> 
> In order to work with the prefetcher, rather than against it, loads want to be
> in field order.  Make this so for the three paths reading an x86_64
> cpu_user_regs.
> 
> No functional change.
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


