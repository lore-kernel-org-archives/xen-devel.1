Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633E8C5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 08:43:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392618.1631585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvswH-00077p-Rf; Mon, 17 Aug 2026 08:43:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392618.1631585; Mon, 17 Aug 2026 08:43:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvswH-00077g-Ou; Mon, 17 Aug 2026 08:43:25 +0000
Received: by outflank-mailman (input) for mailman id 1392618;
 Mon, 17 Aug 2026 08:43:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wvswG-000767-7z
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 08:43:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvswF-00G6uu-Ky
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 10:43:23 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a82c996-bab6-0a2a0a5309dd-0a2a4509ddda-18
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:43:23 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a82c9ab-be1a-0a2a45090019-d155dd2dad2c-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:43:23 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-47fe377a217so2059547f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 01:43:23 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5a7c55bsm2148710f8f.20.2026.08.17.01.43.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 01:43:22 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786956203; x=1787561003; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=07Vo9BSt6zO4QvTI9S+sSquddls5IYIUVjcjR1j18+c=;
        b=KJib6L4THdaL/HGSeerKPjjkvzqbBma2rhrnDjSt5vrUakw5uxfcKrWT2rDeEyelSO
         OJZskNcbZZQYfI40SUeM0wozYkwX03Vzkqjin04Tka80GEv3RmMo7OCiReQTDqtX2qCs
         nRfCj2JNEHOpbw71psxBpUByFNU2C5KgYrxgiG2DHy3PeyqSiEv2Cnm33gjkdF5Xwb4c
         y4o7wwyadkJUhPUbApJBQCyBiTBBNnbJqTc0G/21tChjA3nr1w/pw0I+XHBDfDm8kxUr
         uXYVYPqtD/xIGd5jkKwYhV2KPVrCMXLfCMJ8HCRBSd15JAPSCTHACYxNW3hjYJZZDjju
         Drgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786956203; x=1787561003;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=07Vo9BSt6zO4QvTI9S+sSquddls5IYIUVjcjR1j18+c=;
        b=B+eL+zSr0qzhI7gVc3Jq2i9zI/n/986rkV9jIV7QQpm5Ib1aDnzi5MXH1U524dOLpf
         +T2f8kd+3X2uaj/p4xLBZO0cM+zhWgAuqsaN9m8xW6aYWtlV2h17qR53oLGug4gfCuCq
         aSaXlKe2Nu9ycscRg3CdZ0/rAY8ZFZGsjqaTXcUW6SytFtxx+TUj6G3oSIjMLlJHypr5
         8bnDe6NfsE+xv7rLx8S1iizI9V03vetgBFVK6mO60D65j+V07/pOS+S7ZYzuezVE96Ls
         4FoC7/PkWTG6VO8ery7Czzk5x5mMi19RtZoLCDSNKRKVRInR7V7a3tiHjy6BTYSLC3Af
         Qvpg==
X-Forwarded-Encrypted: i=1; AHgh+RpADh4MX8oDTxJ9YOecBByn+B5RSxpIoLGoY56GVm4/uqq3+Y3xG2GL37iIaXLKrjgYddnhEmzEweE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMVX39dYQSzOv498kJ2L03uDbBGnEjqF6a4g/ZFQ8BEcCa4UjW
	rfknaxET6sjXeIHfbOdxqhRl75ARqktqBn2sXq+rcewYmczS65D53tXP
X-Gm-Gg: AR+sD123ytXIzPMXGdb5SIrGwSjZVsGrA7QOj6TuQA4p+PiN/Z3JYwGcjrWFeQIQqPd
	dgqmEljzyD7KLtQVoaYAMOpkbCpJALywg0Kv+yq0uz/7941KQcxpL6S026TPIeOMKD0TGNstokt
	2hoIL5nAEEN1+aZrQw7BWG70s+f1XNu4bcwZa9M+pWXGLjKPZAPAErfVEWK7WMguD7rHGJg89GR
	bBBXNxiBi7NKJjNS5aUEFDWiDKUlqFMlt34Quh9WQoONA3Vmb1PWnCJKlD74hMBRMM5sR94WAKy
	nuVPwHN+mCjhvvhMSMqJWX+J+f8fWyabz0ezgW6tMNQa6bkfSFkKHux0MXl3GiOdLyWtEM7BP7Y
	o2+z8z+kjjUJ/u2Z0xOAkzGgeZB+iv7qdicxfaKxe/QxXsHcWrJI12IvzaAFEw3PVai6jgACKjR
	ErFfHuY0mKumbpf3Xc8gIDkLp110HQUjSd0cadfBskNs7gc1Rjb3UQCa0jPobH6TJf+KCw3IJDm
	nKjqpRPAbWL7q4Bnnmkpl2EV2lUH+exTdZhhah6pw8=
X-Received: by 2002:a05:6000:1844:b0:481:5ba5:994c with SMTP id ffacd0b85a97d-4816077aab7mr36040760f8f.20.1786956202932;
        Mon, 17 Aug 2026 01:43:22 -0700 (PDT)
Message-ID: <eb97f777-3700-43e0-b200-8250bdae2311@gmail.com>
Date: Mon, 17 Aug 2026 10:43:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/17] xen/riscv: add vAPLIC state save/restore hooks
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <b8aad28481520eb241a1f7519336d3e4bc9aff9f.1784560663.git.oleksii.kurochko@gmail.com>
 <675c8106-a515-4567-ba30-09f2b0631634@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <675c8106-a515-4567-ba30-09f2b0631634@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1786956203-BD8C1034-6F772AA5/10/73395122804
X-purgate-type: spam
X-purgate-size: 1793



On 8/12/26 4:19 PM, Jan Beulich wrote:
> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/include/asm/vaplic.h
>> +++ b/xen/arch/riscv/include/asm/vaplic.h
>> @@ -34,4 +34,7 @@ struct vaplic {
>>   int domain_vaplic_init(struct domain *d);
>>   void domain_vaplic_deinit(struct domain *d);
>>   
>> +void vaplic_state_save(struct vcpu *v);
>> +void vaplic_state_restore(struct vcpu *v);
> 
> Why would these be needed? Can't ...
> 
>> --- a/xen/arch/riscv/vaplic.c
>> +++ b/xen/arch/riscv/vaplic.c
>> @@ -400,9 +400,27 @@ static const struct mmio_handler_ops vaplic_mmio_ops = {
>>       .write = vaplic_mmio_write,
>>   };
>>   
>> +void vaplic_state_save(struct vcpu *v)
> 
> ... both be static? 

They are only needed to cover potentially two cases (w/ MSI and w/o MSI 
support) but I see a sense two follow your suggestion below ...

> And don't they want to be cf_check?

Agree, cf_check should be used here.

> 
>> +{
>> +    if ( has_msi_support() )
>> +        imsic_state_save(v);
>> +    else
>> +        BUG_ON("unimplemented");
>> +}
>> +
>> +void vaplic_state_restore(struct vcpu *v)
>> +{
>> +    if ( has_msi_support() )
>> +        imsic_state_restore(v);
>> +    else
>> +        BUG_ON("unimplemented");
>> +}
> 
> If you're merely forwarding the calls, why can't ...
> 
>>   static const struct vintc_ops vintc_ops = {
>>       .vcpu_init = vaplic_init,
>>       .vcpu_deinit = vaplic_deinit,
>> +    .store_state = vaplic_state_save,
>> +    .restore_state = vaplic_state_restore,
> 
> ... imsic_state_{save,restore}() be used directly here? And whatever other
> pair of handlers for the case when it's not IMSIC?

... It could be done in that way. I will follow it.

Thanks.

~ Oleksii

