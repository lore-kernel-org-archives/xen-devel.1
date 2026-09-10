Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B458C79FB9
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 08:42:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414165.1643964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4aMc-0002yg-KR; Thu, 10 Sep 2026 08:42:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414165.1643964; Thu, 10 Sep 2026 08:42:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4aMc-0002yY-HQ; Thu, 10 Sep 2026 08:42:34 +0000
Received: by outflank-mailman (input) for mailman id 1414165;
 Thu, 10 Sep 2026 08:42:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4aMa-0002yQ-N4
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 08:42:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4aMa-005HuE-3k
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 10:42:32 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa26d6f-bab6-0a2a0a5309dd-0a2a4507a658-30
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 10:42:32 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa26d77-b4ea-0a2a45070019-4a7de14c8c82-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 10:42:32 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-4843172bff4so605485f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 01:42:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48588390e30sm47425843f8f.7.2026.09.10.01.42.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 01:42:31 -0700 (PDT)
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
        d=suse.com; s=google; t=1789029751; x=1789634551; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1pWuZG3C9ZMCfHNOsmsZlnGOIA4yXPpXBgL2cwq5Bkc=;
        b=KJTOEuwSUP99YkaPecKiibamO1m70hGtY0nSkiB++upCP5lrN2K4K9iiAimqtq4RQL
         8MSbCVNzRXGbUt+AdFz02CO2KISpYEQJgQyi+gfPFP+EcKYmKugfxGkBX/Z99G66BVAd
         r/xspqbyBFcfKEudzyvmcefXR/cov20agR5HSpJRKVpQRh+2VHSJFu1EoyXWQmThC06N
         mfI+2aBnPwrCNculTsYTYCeGtwZIZTV1RgWlWXCL2JJSbk9GfIxrCX+xHS1WkCzKthg5
         vwRJODSRqYZhxvwQGJDkSLBLceLPC6XpLSPcZzGXE+RV4EZGFDv62/1mC8jjt+Kew9b+
         iFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789029751; x=1789634551;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1pWuZG3C9ZMCfHNOsmsZlnGOIA4yXPpXBgL2cwq5Bkc=;
        b=GMXl8gG+QaGJx7iqCRzBc+bLuKLVGUrowaYSjoRJbblyGm4uFZ6PPwgl3h/U09MNqK
         Ll8OFHNpfwcjMvYzbqe48zE/n5dS4t27eJO1Xf4iEEBONthD1uJiMyAJZUOMD9UOd7sd
         KTPiCgv+bcQynol7SSfydwdynh8k7L0bGZjEfgWyiS+8zzkRTOwlKx0s4Sm2KgEjoNXG
         dztkSvHqR/e/ws2+NDArZs662HuDEDFHHbbckpHDUDD2UcWvE+6tea8Zw+y7SYBKQMDH
         yWxN//DfX1glvUTNyS1XJSg3LjVHUHSRjn+mGjImNRnYKuku8OjbEqzhktAAVUvw+dpU
         gAjg==
X-Gm-Message-State: AFuF++msFw4dA9gCbO/xJoKr5I4VY36GWXCEZArvUWH2O+Os2h9gy3QR
	mlJZy63TswfFX0Pnz6pE2Ee9jvgqVhlCavGYJcCImsECa9VaZmFNytTs2SSYDzSpHA==
X-Gm-Gg: AYBFou2xBv6x8WTwOnk2LQsNy9LC+/FPDxf/G6YIHnMyPzdWLeHCnPHV4YbZlB6fWMW
	0vnVn3lUiANh4oSvg2OXtFc8bLS0y9+hx+40oWbKkqmATl7d9jkewJJj4XRyMJ5fFUPSZB46n/0
	8rUG0KYWI7uKA++uIHUVPB41+gbJSzzZFVl0R9TZ71otbfBt4bCFZL7Bf/izejGdcOSQbAq3YyB
	P3exXHO6bamH0qZytNMF98tY+J75D4MA5zbVHbhP3AVWi5mN+j/5xMdfD3ryMKz45le6Zi+mhtY
	AqBfzpSyDwrYzb06+g+9O23SZAxbLWeWWSldIL3Ly9Co1eNyJlK+4dFTNB+9BVdFV/ylXRPB4F0
	60PJO0jLMjWRYXG5oQ6ecc3fO+ns1BgxRZWtobGXCaLb+AWbCraX01/unyTPx7b7ylyys/EEulL
	zATPtXbOWuXmAd5MTeVKVmqmQ4hW0h3AFTzxOX/BphmQTeI3mtYP51mjxS5zAbxTjxvG80GwxO9
	MO9orQr1ZaOgv5tKr0IDmJBCrdahBuk8IVFa45EWzVzg+oZlerhbaBUCOT8Nvs=
X-Received: by 2002:a05:6000:4020:b0:485:8f37:79b7 with SMTP id ffacd0b85a97d-485c23d66camr5721741f8f.33.1789029751489;
        Thu, 10 Sep 2026 01:42:31 -0700 (PDT)
Message-ID: <8bf3576c-2d76-49c2-9df1-a8303f0090d2@suse.com>
Date: Thu, 10 Sep 2026 10:42:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] x86/nSVM: address Misra 2.1 rule violation
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
 <b5601922-1f8b-46ff-ac3d-0e4310773f85@suse.com>
 <aqJfx8-8t1I-wtAn@macbook.local>
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
In-Reply-To: <aqJfx8-8t1I-wtAn@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1789029752-37CD7AE4-0C473EED/0/0
X-purgate-type: clean
X-purgate-size: 881

On 10.09.2026 09:44, Roger Pau Monné wrote:
> On Fri, Aug 28, 2026 at 09:06:20AM +0200, Jan Beulich wrote:
>> The 16-bit range of "port" is fully handled by the switch(). Therefore the
>> default: case is reported unreachable by Eclair. Insert BUILD_ERROR() to
>> annotate this for Eclair.
>>
>> No functional change.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks.

> That however is a bit weird IMO, as we have usually said we would
> prefer not to use fixed width types in general, and hence one might
> argue that port should be unsigned int. Then the BUILD_ERROR() might
> trigger?

Yes, such a type change would need accompanying by removal of that
BUILD_ERROR(). The default: case then also wouldn't be deemed
unreachable anymore (even though in practice it still would be).

Jan

