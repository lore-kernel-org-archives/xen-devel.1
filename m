Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76F7C61DFD
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 08:32:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1405325.1638828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1gO0-0002oF-2t; Wed, 02 Sep 2026 08:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1405325.1638828; Wed, 02 Sep 2026 08:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1gO0-0002o8-0I; Wed, 02 Sep 2026 08:32:00 +0000
Received: by outflank-mailman (input) for mailman id 1405325;
 Wed, 02 Sep 2026 08:31:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x1gNz-0002o2-Ee
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 08:31:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1gNy-00Afxf-NS
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 10:31:58 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97dee3-bab6-0a2a0a5309dd-0a2a4506aaac-34
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 10:31:58 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a97defe-195a-0a2a45060019-d1558031bdc8-3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 10:31:58 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-49556f97a9dso5534225e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 01:31:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce0b425sm130615495e9.1.2026.09.02.01.31.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2026 01:31:57 -0700 (PDT)
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
        d=suse.com; s=google; t=1788337918; x=1788942718; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IINVuEzp4YLCCtb10Q6NLVvUfyFwcP6QDZL5igfiRmM=;
        b=YFUjqlJHgjCF+82GaBBASfQNn0MZt789U+XFU7XUVhspwD3VYBRpXOQJOEYjjqOzCm
         D/Rxy+oorTm0EpN0QtkixugiO0eK19KBejc4JpwLWvBIAKOx4zGtD1Id+kcXgLdwm5il
         mUkg9C1Z/ufOLVWq5JRyKIxNEPSvlVGTBKTWe6VWPR5CfOhYAXFCFeG33qKRIJ8S3ZFK
         EpsEoa21HVGKZfi3Y0MsSqEQsMcH/96vh82qo6U+dDZoU8mCuBzu26GZuSHLsewBXjyZ
         zWeIpocPm2Tdq7tWSIVE5ssVMxJmLkPGSN/WkXrYdVS8MwQOoKCILyt7CS1/tnjCrlT9
         MsCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788337918; x=1788942718;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IINVuEzp4YLCCtb10Q6NLVvUfyFwcP6QDZL5igfiRmM=;
        b=ILbl7QA8JiB/4scYFKWzt2hG40QwtHvkZSLfYMoONHZ+XAuQCacbd7Jk+7Jwld8v+J
         KHO5i/Y45sFbrVdVdbqWHepgLmckQrUePYQgjCSJutZdrou4mH4/iRXT9hN4gdMrRpiI
         g+1/wCnkLgCAA4RmjfarJOxeLlDyft36NBXBvaQuz/rFGqezNJ4IgSyE0lfAw722fT9/
         qSQERfr3XmAgnB5Fzo13Yj2n1JHnLabivbJjEDfWGUjwAqLzcqMt49vcYkbM2ZbQ1t7P
         v42SWmn4WxC8F+AgsW7/tDLDKEhNXHdtoNoElm/xXp+pI0POGaNOwvomFMwwT5GWIOQ2
         Ypzg==
X-Gm-Message-State: AFuF++mkF8YTVppww3JVdottko011fyJw4yXg0QBX5piBVYnnA1C5Ci6
	l4tKQjg9th3swd4CUMSqOqOYeTm6kOhm6RtzWKjmvMp3LA86y3Z4LTCqvyJ7vR3vZQ==
X-Gm-Gg: AR+sD13w9QJJsOqe2bQWI5Z1SVS5wq6t6tVCeoCi4/GqWxYFY7vk9KHty9zLJWt6AxW
	WLxLdpBDLpPvJL0KC7+uvkLTEgWUeCPYmxdHJ/q3Qm0OvALarzGG1MMy9xlrl4C7GkULH3jIf45
	Yp4ibdE2rmjYqTuRbHlsvGFg3HA1hwtwezwNFBMiVdX9QcKgEYSSxJHRkWrHp7g4yxJnxKK0XZc
	3HVOBovm70hNmTB6F9EdhtATAwHpYAsLVcZdZaib7eLKjVz2kT1Vh0RJ0Y6hzTZdw32qUglc0VS
	y//WxaiOgczBujToIvs32O+L8KwutGdsZmEf1zhjNYOC/ofS1yro9upckrPrfQAs/wWCFnX3pi1
	WXIAFgv4VDUFqWgu4EXsiOOETJf2pImLXYy6RtBC77sJ0rF+WI6Y5kzOZ7lCq9oxjwEYLUhxNYa
	c4WZ0x8WLy/EhKrPK2aYR4sfDjklclf6UAAoSHVsFR5gyWX/sI/yPMZKZUHdS8YnR+Oo4CvSEsh
	U+8c2ZhkPOwhkiAjTvm7Yyipw5hlHw8POqb+UQ5T+PAQJbcefbB
X-Received: by 2002:a05:600c:8705:b0:49c:cedf:f870 with SMTP id 5b1f17b1804b1-49ce58366f0mr53581555e9.16.1788337917466;
        Wed, 02 Sep 2026 01:31:57 -0700 (PDT)
Message-ID: <89352ea0-7284-4f6f-bba4-5a6a334b1551@suse.com>
Date: Wed, 2 Sep 2026 10:31:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/alternatives: mark .altinstructions r/w
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <a16d4079-cd8c-4eca-8a60-3cef40173cfd@suse.com>
 <apfPz0njzKVwJ22s@macbook.local>
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
In-Reply-To: <apfPz0njzKVwJ22s@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1788337918-F72C677B-5C8972AA/0/0
X-purgate-type: clean
X-purgate-size: 912

On 02.09.2026 09:27, Roger Pau Monné wrote:
> On Wed, Sep 02, 2026 at 09:15:46AM +0200, Jan Beulich wrote:
>> Forever since the introduction of the .priv member it has been wrong to
>> record the section as r/o.
>>
>> .alt_call_sites, otoh, is legitimately r/o, hence
>> __alt_call_sites_{start,end}[] would better reflect that.
> 
> Right, we don't however have a .init.rodata section, and hence it gets
> placed in the .init.data section which is r/w.  No objection about the
> addition of const, it's the right thing.
> 
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks.

> I think you want:
> 
> Fixes: 4008c71d7af2 ("x86/alt: Support for automatic padding calculations")

I was pondering to add this, but then decided against (it's an inconsistency,
not really a bug). Since you ask for it, let me add it then.

Jan

