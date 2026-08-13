Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298F8C5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 15:29:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1390210.1630721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuXMx-00062t-02; Thu, 13 Aug 2026 15:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1390210.1630721; Thu, 13 Aug 2026 15:29:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuXMw-00062m-SG; Thu, 13 Aug 2026 15:29:22 +0000
Received: by outflank-mailman (input) for mailman id 1390210;
 Thu, 13 Aug 2026 15:29:21 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wuXMv-00062g-Iv
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 15:29:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuXMu-0072YA-SQ
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 17:29:20 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7de2b1-bab6-0a2a0a5309dd-0a2a4504ca34-42
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 17:29:20 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7de2d0-b57f-0a2a45040019-d155dd2be4a6-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 17:29:20 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-47f703a9d05so1574920f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 08:29:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f20051esm165872f8f.7.2026.08.13.08.29.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 08:29:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1786634960; x=1787239760; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hCHZX0GXymXgC2X3W51AHc2x34jZNDZpsT8/tP8znWs=;
        b=KQlHCoe4rC8dNFX3zxfj7AwMEcYaQ05/z7qTbg5pVfaXN1xiV+BFIy2WbOm5zbYNU2
         ResNKCm2ZcEZYydzL7rxeL2FMkSU0zpmdV7ZYV125u3QLjBb8hq18kQ3ulSl7VVhvKGX
         N+dH+uaF1a54AixbyUwoh11G8lUYafplLE5gxLjTf696wdzQ8aX5mYaIZIz7nRShzSkd
         4XgHfsmI2bSxDa+9Ixg6aaacloC7ahAfb0eMUOx7bHA2t/d7jkCTk7cSahNM0+Y59N/S
         3AZl0kTvTO5nyTC83rfYCJU165stPNIAZ3iwLoxrqjNPsGAzji3iXLjD/rtF24Na0NJJ
         zRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786634960; x=1787239760;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hCHZX0GXymXgC2X3W51AHc2x34jZNDZpsT8/tP8znWs=;
        b=TOWCFRo6IpeiBY5gqHDFq2H59CKW/crnr+DDgA6tQbc0FOEJcWQ67GlD6KddLl0qsb
         5axXLJNNIIfUwj3YfUR/b2cKfyy6z0M58+HraKWsHA2YFVDC0x8BdWCFJe+FAg+6gxnM
         u50fLPzh7FXVb135qQwjHFONEFXWaGr1/mpPQ6AEvljjoEbXi6OJZOgqhFSFp9NT77tD
         gYmkwnaqGML9TAsM56XVmQb+JXhsvc7gSBXvullHSnIi83LlVCeatGhUejiqA/1XyxZG
         TprAhBBMTec/mBxuqb1j0sJ+w+o7lwFpDYL+ao76sphVVuFXoTwbRHdMmggAlWBrPKvv
         bYTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqb+5pmBSYmffv9ZuqYFm39IWZY6uvYnCQjq/4sNJGSp0Qvg0WzGnmWMTL19Lgp3yMQOHBb3t+48rM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxfgJaFso9ZDVNqqwp1VCdo3SXkCxLdLN8LjsqotUkLPmqaeaId
	i6VZJXGCsq7IPkxU7GmY+YrN3uxv+/xakxkrxND1Z7IHYf2sqT4F9XdNxbAclfPJ8g==
X-Gm-Gg: AR+sD11EYYblMaVEjQdl+5ItKtAYkNoOs599unpmnAavCQx6E94LuxSeFWbwfTAQtWv
	8F2aKMEkVhLFZ8TmhDpGH/ZJN6DZdqpCaDPnofAXQRqMjKQrhXDMBA3D/XRnK5JlBHsFBh+QIk3
	AXFyS7+CB6Sa9ivAJRtzn9tfVfErCFJmfPHFhfSYgA5H79aFyIjOWeRmg7iYKWvYQ6wfmQt7DEZ
	DEb58PIXrzZzCAmCxs2YlSHicsVjpq9uxhGbsZI4iNNWFYSu1Sby0W9sm4UiLjjruu80qvAUfSv
	o5jq9vB50Pk5/8Rlt/CrxmnOa+aArmyRrP5/WZ8JbS5ctVvyT39Mz+U152U8uiT5bPOsbSGEYGx
	hVEeWyzOjqiteg+2xqIsKhU0AycYwMWMEAPq6sz4bqMQ9HHiB/y4PcCCEP3TAVSK1Ub0n3BHBxO
	0GlruE8jDyP7huTHXJFOoCMFBJqvllCGUn6s6qjB4Uiw4qBVzVftIxCoTQ+4ZTcSq8F4Doplwxh
	nlltQkaVnVsZnLcGaca1iNuzBrNJbR1Nntah/3NAQSCe+mV6D/Y
X-Received: by 2002:a05:6000:1363:b0:47f:8fc8:a8b1 with SMTP id ffacd0b85a97d-4815a0223c2mr8378512f8f.14.1786634960237;
        Thu, 13 Aug 2026 08:29:20 -0700 (PDT)
Message-ID: <73e2a6fd-8cd9-4dc1-9a83-e48baec6c13e@suse.com>
Date: Thu, 13 Aug 2026 17:29:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] x86/nSVM: Expose the FlushByASID CPU Capability to L1
 guests
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, teddy.astie@vates.tech,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <05107cae0af8ea9cd66c133200296d3f667c8295.1786630293.git.abdelkareem.abdelsaamad@citrix.com>
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
In-Reply-To: <05107cae0af8ea9cd66c133200296d3f667c8295.1786630293.git.abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1786634960-C38C1B50-09A1CA75/0/0
X-purgate-type: clean
X-purgate-size: 1676

On 13.08.2026 16:56, Abdelkareem Abdelsaamad wrote:
> On the AMD platforms, the Xen hypervisor requires the FlushByASID CPU
> capability to support HVM nested virtualization (see start_nested_svm).
> Consequently, the L1 hypervisor must report FlushByASID CPU capability support
> when intercepting CPUID instruction for the CPU feature from the L2 guest to
> support nested virtualization levels beyond L1. Extend the exposed HVM CPU
> policy to surface this CPU feature support for the guests.

While the change makes sense, I have to admit that I consider it a stretch
to justify changes by multi-level nesting, when a single level of nesting
is in need of a lot of work to actually behave sensibly. Further, "to
support nested virtualization levels beyond L1" looks pretty Xen-centric:
Other hypervisors may permit this without the feature.

> While at it remove the dangling `exitinfo1 = ns_vmcb->exitinfo1;` assignment
> inside the nested exit handling of svm_vmexit_handler().

Unrelated adjustments to somewhat nearby or related code are generally
okay, but here you're touching a different file and entirely unrelated
code. I think the two changes want splitting.

> Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
> ---
> Testing:
>  - Using a locally developed XTF test to call cpuid_edx(0x8000000aU);
>    - without the change, EDX returns 0x4AB (the FlushByASID 6th bit is not
>      set).
>    - with the change, EDX returns 0x4EB (the FlushByASID 6th bit set).

And the CPUID test that XTF has wasn't suitable?

Finally: Can you please drop Roger's old email address that you still
had on Cc?

Jan

