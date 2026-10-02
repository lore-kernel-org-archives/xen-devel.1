Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E738CA5FD4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 05:41:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438851.1657392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCW18-0002wt-Vb; Fri, 02 Oct 2026 05:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438851.1657392; Fri, 02 Oct 2026 05:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCW18-0002wm-SO; Fri, 02 Oct 2026 05:41:10 +0000
Received: by outflank-mailman (input) for mailman id 1438851;
 Fri, 02 Oct 2026 05:41:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xCW17-0002wg-Q1
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 05:41:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCW17-00Bj9U-6y
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 07:41:09 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abf43e6-8faa-0a2a0a5109dd-0a2a4502c4da-30
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 07:41:08 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abf43f4-6ca4-0a2a45020019-4a7de18cf4f7-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 07:41:08 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-4a01ff8c098so9657835e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 22:41:08 -0700 (PDT)
Received: from ?IPV6:2003:ca:b707:3710:a919:1c08:7b2a:ed1?
 (p200300cab7073710a9191c087b2a0ed1.dip0.t-ipconnect.de.
 [2003:ca:b707:3710:a919:1c08:7b2a:ed1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a03feed16bsm31670505e9.4.2026.10.01.22.41.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 22:41:08 -0700 (PDT)
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
        d=suse.com; s=google; t=1790919668; x=1791524468; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3UDuurVu1kGvinm9tGR3rninp0ic8BEwVGideZiO2f8=;
        b=ZK7BxZpTwKfQIG8V91x/sX2a1GwRU7+71w+uSfY97llYFqDUOjYi+xWX/r+mcSuQKI
         kcte+q6lruyC5kN1VtLBg207+DZZp9f42GUwOo4Ow02SKr+PRP5nrowEFKRLCF30Uxo4
         hkqPLNcxBUapUfVUXmLfjEBhUYL0ZI6P4cVntwoGeTs8VBbnzgCP7AimuGEdQQhr3+tF
         ulKf24kwodp138ioQK0Aj3w/pZeVXGlmONWPANnSbIFbrZIB6ZGLuJvda33fBhcCjP8X
         ehDsucqedNhqiIWsr1xVV7M2H6eSAPrr1+hZjYK4P85hqBJpTtDrfK+DtFADxFmh9kxa
         Hcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790919668; x=1791524468;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3UDuurVu1kGvinm9tGR3rninp0ic8BEwVGideZiO2f8=;
        b=XsxVDc6W4N4CxuFBPF/inWE52ihyCkkrZFV33XW7D/yoGvzv1spugboH/f5WF1RLKN
         EKPG7pdtv7Wbu/uea4nrBKuqaKJik+3tv6LAt8OPOw2mE7l6vF+Uog64+fHTCMUQsq5u
         NDNBT8gknIHi4voQl87cz9qS8FiaeYwBLhE9KndPmEPeKkVQe1HeqFGLrGdRk394oEcD
         Tpa4vIT5psVrN8W83TIvivFKyZ3IETveB4mPE6A4rOVRqU2ESYr6X4vwyu+5qvHgmvvF
         jo/oQp2rDIs5kyibta4LBdrLj2Ri//Mb0lryvg1FHwB/rRS+YyHOBJlUsZ1v3qJ+YpzI
         axIg==
X-Forwarded-Encrypted: i=1; AKwUvBxY5aDAIeTCOpXy3vpIDVhT+/glBpxKMP3/8uGHcBZsG9PoN9KhDuBj5ZKKKdrLU8Zd6S8cjay4vF0=@lists.xenproject.org
X-Gm-Message-State: AFuF++kBcsPFKvnOb4HVataibk+HcFdIWFApSRByRIgOZjQQHshLvpbH
	MBG/EzsepQiD7+a8Le9IWEH2sRcFiA2gnVRqwRivIaIh7QfLBuTBWsdITx1IplJGmbO/UU6yqrj
	DVXMabxx6
X-Gm-Gg: AYBFou0GYjqBm/GSkdSgxY9LhGAKtCSqZLhvVyeOWHD8nYT/cpqoWC5GpRTmJuohtc9
	hFTnolF/5srmzxUtDl7BGv1rb98/e3gyS43QpwVVL1Xo1nRwaeor2Umj6S7A+8zcuw7hMpSZVMj
	5ZNMA0Tg23KRY1VI3Qho/ISEsB99CCBwRpQbiNhxfkTGW0oMUKLJX7LNkShnl3ZeJZ7H4vM7KQh
	FXMHBxH5YqEBqET9cSpM0qV/11mUmRFpg8yL3J6gqqNNt6vtk83sWUF0h5Dfu1DFdRgXXJyLXeN
	GTHc27SY5KZvGSrPL4yF5P5rscKqLxCwd/zkX0982nSPL+5KWBbClAVOgJDr7i/R6B3ZqYRczWS
	tP0fRVffwaorYrWsaQdldpc8+zWQ8pZfeJg3gdNhoUM42QeLmQL/hrJUt5tpE9/BoOu8xzgAw1o
	7I1c4NwSy82IBmQc8dylM+QJwh0s0egTfu58pdKfyhYI7SIgcnMgIkF13Qup0oEt5wuRbk24qhh
	Y8SDOV8uhK0swZDz6IVMXp0h5rDAacS15kuhWtNVH7xf0Ws/oEN9eQtbnUEo813sDqE+pGaJmoY
	IlmhQjJtuRhAEwg3BXuizuFcGHkA
X-Received: by 2002:a05:600c:c162:b0:4a0:1b77:db0 with SMTP id 5b1f17b1804b1-4a0276b86b5mr29649085e9.35.1790919668468;
        Thu, 01 Oct 2026 22:41:08 -0700 (PDT)
Message-ID: <23f1d834-44fb-4949-ac2f-8d639e8378dd@suse.com>
Date: Fri, 2 Oct 2026 07:41:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/svm: Work around VMRUN's corruption of
 VMCB.INTR_SHADOW
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Jason Andryuk <jason.andryuk@amd.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Doug Covelli <doug.covelli@broadcom.com>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Borislav Petkov <bp@alien8.de>,
 David Kaplan <david.kaplan@amd.com>, David Woodhouse <dwmw2@amazon.co.uk>,
 Shivansh Dhiman <shivansh.dhiman@amd.com>,
 Nikunj Dadhania <nikunj.dadhania@amd.com>,
 Santosh Shukla <santosh.shukla@amd.com>
References: <20261001190518.438643-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20261001190518.438643-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1790919668-31FD62AC-39476CCE/10/78276251493
X-purgate-type: spam
X-purgate-size: 890

On 01.10.2026 21:05, Andrew Cooper wrote:
> I was asked me to explain the comment beside STI in the svm_asm_do_resume(),
> and, in trying to do so, things unravelled.
> 
> The original fix inherited from KVM prevented the guests INTR_SHADOW being
> changed from 0 to 1.  This prevents undue delay to interrupts, but it caused
> the value to get changed from 1 to 0 if the guest was in an INTR_SHADOW.
> 
> Whether this matters for IDT guests is unknown; it depends on what else VMRUN
> can do beside event injection and still write back the wrong value.  This does
> matter for FRED guests, as INTR_SHADOW is exposed architecturally in the FRED
> frame via the STB field.
> 
> Fixes: c989ff614f6b ("x86/svm: Separate STI and VMRUN instructions in svm_asm_do_resume()")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


