Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6DBC61DB9
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 05:53:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400311.1636023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzT2T-0005qZ-KX; Thu, 27 Aug 2026 05:52:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400311.1636023; Thu, 27 Aug 2026 05:52:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzT2T-0005qR-FY; Thu, 27 Aug 2026 05:52:37 +0000
Received: by outflank-mailman (input) for mailman id 1400311;
 Thu, 27 Aug 2026 05:52:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzT2S-0005qL-RR
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 05:52:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzT2S-0033bH-4l
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 07:52:36 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8fd08e-e002-0a2a0a5209dd-0a2a45049ae2-24
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 07:52:35 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8fd0a3-b57f-0a2a45040019-d155dd33ccf0-3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 07:52:35 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-47f633e6058so1266302f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 22:52:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482e28dc0d6sm6758168f8f.18.2026.08.26.22.52.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 22:52:34 -0700 (PDT)
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
        d=suse.com; s=google; t=1787809955; x=1788414755; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YO1u/fRL+aimoEXPc0EgFEsF7jAcrCcNsZWgq1BcbkU=;
        b=FTxZl43sA72+QktW4Uoq5lmhgsWj2PMnS2JILOcevpV9FOQ6O/J5XApkwKg7w6h4UY
         7KG4jT0CdkVQMdu9Op5lod5In5eLM58AkQS599unIh8XJzdb2YMTgoRZleBSxk9hfMXz
         mJ37ciy7YtWWPIf4A9lJJDQKchJe6GF0F+I+ZQmByAjzTnQzDHkupmmNpNAISkK2uEMP
         7Yb3ocNsBJ6BvV00SGHlv7HIDSN71m89RRu3C1DA79APTJF+kIdnXr1spEQON+ixjPfL
         e3BM/i11xqIJVDFGdP9XSFpYL6x7n1bee00mjE2htEgdANlw91mVTE0KDZNbmFa4JF1R
         mlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787809955; x=1788414755;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YO1u/fRL+aimoEXPc0EgFEsF7jAcrCcNsZWgq1BcbkU=;
        b=WTwEH/qo+oTZat0nJlJnw30LIfxppKXBvt8+i3/91/LOakX9A+srfol4bh/60ZBNgl
         jBvNhNj8+kEY7lm6uPbm2sR1jtTHHsBPMVXIEA7JxcbLYZmFCUsHNd79r5mnzv9/HfW0
         FhjW4e3iv+xupiBJdSdNApXlbjc7VqCo1bxbVWbMCftiiHAa6LVo1hriz9hL0WyHz06F
         B8N1bxU2me1fMAlkcIdhEBAeHQtggjAOQTMUIg6gNrpprIs4HhCQLiNww+FiY83CEb2g
         kJG5NG//YYk3v0JHShsxuxicSFYVx2OHwJ9KtC3Iiqk5GfmTgQEVnVMCVRj1isvbuc0/
         jtNw==
X-Forwarded-Encrypted: i=1; AHgh+RrcNydnIcWJpZI8HKI4X2WU21SLRcK/YyLLUBggGPL5phkCDP91BVhHi2zofY8eknwu4b5hP1dTcpY=@lists.xenproject.org
X-Gm-Message-State: AFuF++n1Wtw8vfxnvrL3VY0Wdj20L8ZCQ4pp1YoJ5Vw/UWKs/nm8KTXY
	Pxve8JHFRzhCEQUJal4/LLk9/Ye+CMrJzAGoUtQPqR2f2TKvfZERwgPNdcAbgdB/8SnPKC+ecCe
	4Q3QL1A==
X-Gm-Gg: AR+sD11t3dANLoyApzOyGe3ppzoiQ5YyNFkN+WN2nflwTDVMpsW0frhw1MS+IWaqDK8
	mR7RiEKtHFoHV72f+dQWPxMiKhX4ySxbQePGyaRxy7DQ9Z78KKPK0zpWYxQ/k+6M8iuy+877R7o
	blB9QszFhVAysRQSYdBe8h7im9Dd+Bhn2kgwvW1QssbvGHi/sQjSCe8XZB+buesqnoEFs+FEA4n
	y0IRR9MMexwQydJasVkZ2J762Qnvl7mrvmIEs/rW9I/Ic1tAbw7nMj2EXyMJl0ja6OsJ4rD6sia
	axahPG8arEr5QBi/Jmd4h8udmGZjIMI7M4xxe2W6fEMZBq78V3YuKsLHk1tZJJJJNvk1Pwr7npz
	qaMJCE2DatzK+hf2SAtOAuzxapgPr9AqsfjZNfMBOXblfX387emAqqmUsqbPc3xKa5t45TxuyuE
	m0M4o1z42dUEOAMuxjUyu8wJhKxhqSWMUyG44Uy3DBTo+QDUgLgfVtMrEI4/3vX6NYytl5jiZXL
	7Cm1LCHuFFGP+/R8nhMYW7OcZMx5RJKs7M/pfgsK1vNHNBaqkbf
X-Received: by 2002:a05:6000:2503:b0:482:984d:fdd2 with SMTP id ffacd0b85a97d-482e26f8247mr14373236f8f.20.1787809955308;
        Wed, 26 Aug 2026 22:52:35 -0700 (PDT)
Message-ID: <57c498a4-863e-48c7-815d-3c70b1432d33@suse.com>
Date: Thu, 27 Aug 2026 07:52:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/nSVM: Expose the FlushByASID CPU feature support
 to L1 guests
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Cc: andrew.cooper3@citrix.com, roger@xenproject.org, jason.andryuk@amd.com,
 teddy.astie@vates.tech, xen-devel@lists.xenproject.org
References: <616bf3633e902f2fdba5d00691653d3bb82444ce.1787765809.git.abdelkareem.abdelsaamad@citrix.com>
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
In-Reply-To: <616bf3633e902f2fdba5d00691653d3bb82444ce.1787765809.git.abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1787809955-534C3B50-D3416492/0/0
X-purgate-type: clean
X-purgate-size: 931

On 26.08.2026 20:09, Abdelkareem Abdelsaamad wrote:
> Some hypervisors explicitly require FlushByASID capability to function under
> nested virtualization; otherwise, they fail to boot or run nested guests, see
> see Xen's start_nested_svm and (1) and (2). To ensure functional nested
> virtualization support and allow L1 hypervisors to correctly detect this
> hardware capability, extend the exposed HVM CPU policy to surface the
> FlushByASID CPU feature to the L1 guests when nestedhvm is enabled.
> 
> (1) VMWare (Launchpad Bug #2008583) https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2008583
> (2) https://lore.kernel.org/all/b9915c9c-4cf6-051a-2d91-44cc6380f455@proxmox.com/T/#u
> 
> Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

For the future: Please send patches To: just the list, with maintainers
uniformly on Cc:.

Jan

