Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FA4C9830E
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 06:45:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1436879.1655552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBo3d-0003Rl-GS; Wed, 30 Sep 2026 06:44:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1436879.1655552; Wed, 30 Sep 2026 06:44:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBo3d-0003Re-Cz; Wed, 30 Sep 2026 06:44:49 +0000
Received: by outflank-mailman (input) for mailman id 1436879;
 Wed, 30 Sep 2026 06:44:48 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBo3c-0003RY-Gv
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 06:44:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBo3b-00EoqT-Mt
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 08:44:47 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcafde-bab6-0a2a0a5309dd-0a2a450aab7a-4
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 08:44:47 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcafdf-f2d2-0a2a450a0019-4a7de18de100-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 08:44:47 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49b912d3931so37325775e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Sep 2026 23:44:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01b1e7a46sm8369105e9.0.2026.09.29.23.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2026 23:44:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1790750687; x=1791355487; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sQZn4Yge03lonUUEgsIy3mzpluVxqic5ESVSNDxkHBo=;
        b=Q3mSopT9+2j7oJUhRYwc9Fsr0q1OoeVkQXtbssekNMdLXqQD7FVJIHouNQSYTeLmrN
         +9M5+/xFTR/5hrYiJBkWm/5USAy7i6hpNKjQRE9jOgeQk55h8Vsz6H7DLe1DP7VlU2eY
         QkKJ3ntC6QDQbdH9K4IEKnvL0xyP5e0GFfCH5lK/mPwSsMFdWB32XrdS/hroxdpk2fWH
         R84y+YUPUkpVOHZhzhAX3aSElHaaRjKvhCeOGUuIoD9MrKQzc28R6TgSfbx+dSNkgnPH
         uSmArTmrRbVjonQURvrn5vONYelcDaQNsw/R7DN7Fj5w5eydT6Rewml4UVcVxunIcWxn
         KxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790750687; x=1791355487;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sQZn4Yge03lonUUEgsIy3mzpluVxqic5ESVSNDxkHBo=;
        b=Htl4FA/wCRNU3+0DgkKlKk4JD59T4Wrzig6Iv02DgQUPG9VsKo5fsn/T1OaTdnZjBd
         jDHuLPtowmbf5ZSsUJjr0RnKYCk5nxUqCb8M37y8SPrVaYzK1twQfyNUH44LmPmE3+vP
         eAw8QXcimHV9OgBlQkHNMKYX8FsNXKpv6QxlSby13KLFELSmuYkYHanmV6vtU1w3i9VA
         GI6Hpn4ccAh26SV1ZetSDHI122vfEYv1fa30kYQagkUvgSKnlfn5Isu/6/skY8h2tzo7
         NHUJt9y7L8wl5GZOY4ywkNngz/s9FG7dohOc7QY+FeRM589NsvPwWmXhsrubBnqsk58A
         DRbw==
X-Forwarded-Encrypted: i=1; AKwUvBztpQZjo4B4FgbyfP3KaeNbz2hyzsu5JcbHFImvOm6yL3DagH5OJsdHQuasuMOM4JYuyLxnSd6/YjU=@lists.xenproject.org
X-Gm-Message-State: AFuF++mB7qa9EyzDYXzk4KuXhukSdbCtvmCtlOEsNEEIg1FKMaN4R47z
	eKUcUbbBepyoRS3Y1oDajiNenGx90ZkzVA92oyGWlPw0o3yvNrbmbsn8f7ORS/0bRg==
X-Gm-Gg: AYBFou3FvdjzqhjScdKFHb56QsIB/UFYBgTDdQTsaMzTTqjHS+jTj0JXymyC22ZFwck
	2cisbK8G/bGBQJk4WD0Ifmpx/VdnA8wYLYrBxVAMhYZ+eFfYq9hhUFBwmA7fmMH+kxKzQ3PIuyH
	aQoXsZn+g51NPC8nDTVSOj3VudEPaVfltZpXC76bBO0CvHTJnJOTykaeHkuVG5jhPw1qnM5O/qp
	b2S41pOlK6Jgkpvu7mfci1Gz0mfO8lpH2zerHu3NEjTcTNevOg2C2MiTQqZztvIb6uDRCEhTinI
	6coyrIKsWfAI7TYwIUmWRlHcqQy/vKMJ+BIbcrWRgGxDN0NGhIP2yC4BXsiwU4LLvgKKl4zKyau
	FJ+uai52dSkE4hcv2M5yW8pfCUvllJbYlgcM7A/G7ehrO1483OMbwgxdIqa7AH07yGebzjXV2WV
	OQZVK/707hf62adSC9HGtUcGpg+ATt8+tQ1KOlsGJGpKCRthq72YmJoXHb7ZY88RCcquWlAM1H8
	dAM9UKo+Yhs6+9voSDwJE0JH53QShNsoEu/GBSGdt31g90JobgpPHhv9IP0RPE=
X-Received: by 2002:a05:600c:3152:b0:49c:fc6c:be19 with SMTP id 5b1f17b1804b1-4a01b12603amr4514565e9.31.1790750686945;
        Tue, 29 Sep 2026 23:44:46 -0700 (PDT)
Message-ID: <1364c7b4-ec90-4182-a6cd-c63a92e96dfe@suse.com>
Date: Wed, 30 Sep 2026 08:44:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/nSVM: Save L2's CR0, CR4 and EFER on #VMEXIT, not
 Xen's
To: Lin Liu <lin.liu01@citrix.com>
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, roger@xenproject.org,
 ross.lagerwall@citrix.com, teddy.astie@vates.tech,
 xen-devel@lists.xenproject.org
References: <252b42e8-d710-46f6-b837-21a9e6198d46@suse.com>
 <20260930012651.1663413-1-lin.liu01@citrix.com>
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
In-Reply-To: <20260930012651.1663413-1-lin.liu01@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1790750687-526DECFC-31D891AA/10/78276251493
X-purgate-type: spam
X-purgate-size: 1368

On 30.09.2026 03:26, Lin Liu wrote:
>>> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
>>> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
>>> @@ -1079,11 +1079,11 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>>>      ns_vmcb->_cpl = n2vmcb->_cpl;
>>>  
>>>      /* EFER */
>>> -    ns_vmcb->_efer = n2vmcb->_efer;
>>> +    ns_vmcb->_efer = v->arch.hvm.guest_efer;
>>>  
>>>      /* CRn */
>>> -    ns_vmcb->_cr4 = n2vmcb->_cr4;
>>> -    ns_vmcb->_cr0 = n2vmcb->_cr0;
>>> +    ns_vmcb->_cr4 = v->arch.hvm.guest_cr[4];
>>> +    ns_vmcb->_cr0 = v->arch.hvm.guest_cr[0];
>>>  
>>>      /* DRn */
>>>      ns_vmcb->_dr7 = n2vmcb->_dr7;
>>
>> ... I still think it is a mistake to leave alone the similar CR2 handling
>> code further down in the function. Yes, #PF handling in
>> nsvm_vcpu_vmexit_inject() updates the value, but as indicated before that
>> (aiui) still leaves (at least) the case where L2 writes CR2 explicitly.
>> ...
>> Jan
> 
> Sorry I was about to reply in the thread of v1 ...
> 
> Yes, L2 guest can write CR2 explicitly, and the value goes to the shadow, e.g:
> n2vmcb, which is the good reason the value need to be copied back from n2vmcb,
> rather than the guest_cr backup.

Yet using v->arch.hvm.guest_cr[2] would be equally correct, wouldn't it?
svm_vmexit_handler() syncs the value first thing.

Jan

