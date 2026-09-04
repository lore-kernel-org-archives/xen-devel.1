Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F3FC624D3
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 12:03:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408358.1640966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2SdV-0004t8-QV; Fri, 04 Sep 2026 12:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408358.1640966; Fri, 04 Sep 2026 12:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2SdV-0004t1-NN; Fri, 04 Sep 2026 12:03:13 +0000
Received: by outflank-mailman (input) for mailman id 1408358;
 Fri, 04 Sep 2026 12:03:12 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x2SdU-0004sk-6m
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 12:03:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2SdT-00GOgH-Jm
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 14:03:11 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9ab36f-2eae-0a2a0a5409dd-0a2a4501c1b0-42
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 14:03:11 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9ab37f-5984-0a2a45010019-d155dd2be176-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 14:03:11 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-47de0093c42so792459f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 05:03:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce58da3acsm394796045e9.0.2026.09.04.05.03.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Sep 2026 05:03:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1788523391; x=1789128191; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HHi0410SQaXfTp/+4Wcu9ZXeoJ1qz1SOw0DK4y6zNMQ=;
        b=EMIjDxpxskdiq4rp0fBT+1MxuDL7+6gHcWp74Cthcm6lLQYbUKOc5yKCJ0Tv5vAzX/
         0cadzWtix2zGuQFI9O8iP96LRnxbm+xp6JMOx8AnwCybAvHm8xAtRM7bHinQWvkWkOna
         H6Bt98+pNiIMXkRmSEKA4qozqDUsFahww8SIu0LevlJ0lIvPqVWoyuV46L10kLBRY+dK
         I8XXE6H4Wf8YWPbGo9FYnOBLDEokdXUhcgDjBT86EvrJKVIlKAB2J3RNfaNIzlaaX7k3
         +nuv4URsTMIgJexQ7OEtx5mFVG9xg5xmG/bPIjFeHJHLZXBcL3iQixXWlBc9aODOaNDH
         TlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523391; x=1789128191;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HHi0410SQaXfTp/+4Wcu9ZXeoJ1qz1SOw0DK4y6zNMQ=;
        b=MiUTi6bbQeZHetiROF3LxuI/6la5G+r7YPLT9qA11UQhG/58N2fhHJGA+VQrQsCsBU
         YjLfBPtDgYo72b5DMdqsXqHiL+mgfspj7lpSSR4M6KXN9lcZuVTD1ovD3fP2cT9zRIQ4
         RPfh4BFNT3/J8kUJH5I8yqlYw40LZwGuV8r4d/u0alMLn26D5Ge96HO8O88o1EAkMhfs
         Rh0RavUek5P/HFiA7LcfpzA9ylpY9+V2do+XwKB5zHuYdbRjW9CzaTRhClTEVZz6NfRZ
         NIWzJfbR8zVgYqRHR5opi2gKVuCodrraCFgXYpXZzyv606T1oZl69p+uoRwzkZX6GJKh
         CLDQ==
X-Gm-Message-State: AFuF++nVv0eYztvWNtuL8asRewbe/PIha3m9cnUOzGH964Ra0BH+lH/v
	2KdZ9LbJl5w6z0VmhDB3gP9CoUcQgeLs0DSIIYJHfV3IzSpnHXAt53YJCS3wefDx2g==
X-Gm-Gg: AYBFou3pS0heSCQDw3u46VMeo0MBvGZaWBEvbBIHYmqxOAgADkUe8ALBi6/JeKV4UqA
	1mKyERDM26bewKz/FP1xuDWVI21TzAoWpBizG9xoqRAeA8WFZGjUsL7tF+EJ+7fhM34xfh40Gj6
	I2DazY4E3ydw6HF0fWz68XIud1EmKZRrJLmc+4PJrcZUwm2TXOp1mwS2+mmRGAGt6qrt6aeE/6z
	PdF02hwv1/C7R+k+wmkhI3Leh2gnA2y/oio058moyg5Aj6a95G73CWG1S+CDnGLHkE0GnF4TVET
	J5npkmNQpgzuZ/BPhpDOS6nlMOvjS3am5zS3ePlIApJigFrBeUzltdH5Nj3zQdhKjLEqIujhbZk
	dpJjApkjvKOk/tw6XCFAfDgreD+xPnA1pvZBwkttXpnuU3Es+Dpy3teV0TYbaapo9bGi/L/KkAI
	RCt1wQ2uQJgcbFksOpMGJvlv126eNiy2yya4dn6q+gpmeb1rHkEYtxnDJTT/UmsUoh/1/cNQAf4
	WPyEV2dfe9yEEvQCu3UoqEf3LOsHSQniHZUzw==
X-Received: by 2002:a05:600d:848e:20b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-49cf824f697mr43311415e9.10.1788523390789;
        Fri, 04 Sep 2026 05:03:10 -0700 (PDT)
Message-ID: <02cb695f-c827-4623-8f65-530bd7b740d6@suse.com>
Date: Fri, 4 Sep 2026 14:03:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/39] xen/riscv: implement virtual APLIC MMIO
 emulation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <4413e157dfe67167f651df1ea92ab61ca4182723.1787838835.git.oleksii.kurochko@gmail.com>
 <1788349915.8631fc262581453bbf619ec5b2062170.1a061f620c5000c4f3@vates.tech>
 <957e4e19-5349-437b-9ec0-ea661292eaf5@gmail.com>
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
In-Reply-To: <957e4e19-5349-437b-9ec0-ea661292eaf5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1788523391-1E465757-E9555FA4/0/0
X-purgate-type: clean
X-purgate-size: 910

On 04.09.2026 13:58, Oleksii Kurochko wrote:
> On 9/2/26 1:51 PM, Baptiste Le Duc wrote:
>>> +uint32_t aplic_msi_target_gen(const struct vcpu *target_vcpu,
>>> +                              uint32_t base_val)
>>> +{
>>> +    unsigned int guest_id = vcpu_guest_file_id(target_vcpu);
>>> +    unsigned long hart_field = aplic_hart_field(target_vcpu->processor);
>> Nit: could be const
> 
> Techically I agree. Then for guest_id it should const too, right?
> 
> But it seems like Xen in such cases don't use const. Have you found a 
> rule that we have to use const in such cases?
> 
> I don't mind to put const here but then it would be nice if someone will 
> tell me some kind of rule...

We want const on pointer targets whenever possible. We don't normally want
const on plain variables, unless it needs emphasizing that a variable is to
change value (which should be very rare).

Jan

