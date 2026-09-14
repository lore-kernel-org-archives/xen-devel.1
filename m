Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7430FC88E66
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 12:23:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1420893.1647109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x65iH-0002ts-G7; Mon, 14 Sep 2026 12:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1420893.1647109; Mon, 14 Sep 2026 12:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x65iH-0002tl-DY; Mon, 14 Sep 2026 12:23:09 +0000
Received: by outflank-mailman (input) for mailman id 1420893;
 Mon, 14 Sep 2026 12:23:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x65iG-0002tf-LE
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 12:23:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x65iF-008lA0-TI
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 14:23:07 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa7e729-2eae-0a2a0a5409dd-0a2a450abb4a-14
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 14:23:07 +0200
Received: from [74.125.228.76] (helo=mail-ed2-f12.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa7e72b-f2d2-0a2a450a0019-4a7de44ce2cc-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 14:23:07 +0200
Received: by mail-ed2-f12.google.com with SMTP id
 4fb4d7f45d1cf-6a605c198fdso3517914a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 05:23:07 -0700 (PDT)
Received: from ?IPV6:2a02:778:142:8f01:2700:bad4:284c:5aa5?
 ([2a02:778:142:8f01:2700:bad4:284c:5aa5])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a9b5912644sm4178916a12.11.2026.09.14.05.23.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 05:23:06 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789388587; x=1789993387; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cmCZh2AH2E7mtWOqD/SFB0LdOZ8LeKTlc+r7cOKCVrs=;
        b=bwHE9x5vEXJVDwl/lULWeCsOIhZb2Gk6XaAtJil098eFmc5EBMBDUp9dURaB3VOa8h
         suDF48ZySzIwHOkEyMHc9AZwlZWFYh5vdxsMWrtNAjZ4elF6dyCUMqWN6FGkdjJG569Q
         8RJXPQCEckEonm1iO99GAxMjBlROY97wqgOSQtgtxUHleV4IG6BBvEK6BhPQWc6qrpdx
         YMP3iFEPCbOj9i3GpPD4u+wBAPusHKEEXh5gLAFyBaV9r1HhZApYJvJOyFxjLE8DKvxe
         ljyozeW0p4M9JwWH2w2N/Tqh6fAZ4bpaKrYE5olaerHCbknVEnBhvs41BzW4wmqfB9Et
         N8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388587; x=1789993387;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cmCZh2AH2E7mtWOqD/SFB0LdOZ8LeKTlc+r7cOKCVrs=;
        b=IxFxZDO49CiPLDSzuNgIWlbo1QRW7qc7w6lTuNwXtQd63nMPsqGRSzfPk4xbwbWlJ1
         S0pSj+Dg0eb8JuWBjbbj+iDNDr7rSo4jzDK/B709qvOEqZgHZtOk968ADiCXHITR6ZmX
         XEGQlGEAvTASIVnK9kzmurU0b2krD3T8/SdiMEejzKUn1ZLCOxqLt0rBNQacroq3VmML
         mp0OYdJkPAGX3iXNUyLyR68c8zP4yjzoOCRhScPJG4gGzikSJ+H1zGbODBGOvcwzzen9
         njIQiYA/MIetfqzMUh6aFVyLB5buEEZG+M9boqzP4MrBVrRqlmJBrD/UlFLVI48Kcs3L
         LyjA==
X-Forwarded-Encrypted: i=1; AKwUvBzvpfnL8tTqL+XW5Ar15bzuGTW2Ba6bUBVWXUa1farXCbP00Ih5yD1efKNgVqGT7ipKPDjWRMpURjA=@lists.xenproject.org
X-Gm-Message-State: AFuF++nrCzKtYHmNc0OfQUwYHV3YhaSWZPWT3LQFbY0UKytIPlj1R3eW
	JM6E4tR6Lpjh62eNJvAfBYUj7j9sMqfMKOSg0LLb4ppP2xnbh5Z65AGc
X-Gm-Gg: AYBFou2kFyn6cnSjkZOkLsHINiQDNpldI3w7970BT2q1fEpgdOpFZyCifYGGzQNNVXH
	XwCzBo4m3t036ThsUCjorlHGksw3MMYEQKBw/+Dp27irZyrBhJWKfrPXOwYiQLwJyIwg/xny+uG
	2zggou2D6ahlD/7L44cPt2DFrY9dIS+T3/IKDvwZU6xFhKab2MubcvQJhXIjTpoQ9mm9SA4SDeN
	XCJQPPiw6YHGzj24pMCC65zK4f+m8ALgvRNaLqdMqEhxrmTcWbrrsk73WaEZVHAfN4euB5d2mx5
	nZnx9QFTH1zv5jS7TPzJKaQcaVQfMJJ6Xk0MZzz2e5mXlPr4uuoR83rqg59xsEFLo/WrZd7tIG8
	j19iPSm0KkuadhAJaq/qEBtZLBP9PlBIueOQ2w6QEYjyXjGp5vKV4Hz5VuBDtJdAzp5JiaZpZy/
	IZtpFYhn+4mlJEjsiFrT8yUclY0NsQ0SEfI8PvBF+fgAQGhXW6mjArXGdFj1oB9aqUnQsFwatGH
	NNp0gyYGP7gtGw3BTmGbN+2ncSL3yswB7oTKSZR2aFAyPoJ6jx5AdU=
X-Received: by 2002:a05:6402:4504:b0:6a7:ea54:376 with SMTP id 4fb4d7f45d1cf-6a9f6282363mr1323794a12.30.1789388587160;
        Mon, 14 Sep 2026 05:23:07 -0700 (PDT)
Message-ID: <8cb54ae1-a195-4b05-8024-b7b613e2e956@gmail.com>
Date: Mon, 14 Sep 2026 14:23:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 16/20] xen/riscv: implement IRQ routing for device
 passthrough
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1788876411.git.oleksii.kurochko@gmail.com>
 <afef58245a58f4084e38ea1d9880282a8e8beeef.1788876411.git.oleksii.kurochko@gmail.com>
 <e1d611bc-115d-4050-89c9-9781e9900ea1@suse.com>
 <d8f7e714-4c62-41a3-9a1b-aed30f4f586e@gmail.com>
 <3e05825b-9762-4fba-a064-821bd3d7f8d6@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3e05825b-9762-4fba-a064-821bd3d7f8d6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1789388587-530D9CFC-67A6AFE0/10/73395122804
X-purgate-type: spam
X-purgate-size: 1107



On 9/14/26 1:36 PM, Jan Beulich wrote:
> On 14.09.2026 12:54, Oleksii Kurochko wrote:
>> On 9/10/26 2:53 PM, Jan Beulich wrote:
>>> On 09.09.2026 17:07, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/arm/irq.c
>>>> +++ b/xen/arch/arm/irq.c
>>>> @@ -205,7 +205,7 @@ void __init init_IRQ(void)
>>>>    static inline struct irq_guest *irq_get_guest_info(struct irq_desc *desc)
>>>>    {
>>>>        ASSERT(spin_is_locked(&desc->lock));
>>>> -    ASSERT(test_bit(_IRQ_GUEST, &desc->status));
>>>> +    ASSERT(desc->status & IRQ_GUEST);
>>>>        ASSERT(desc->action != NULL);
>>>>    
>>>>        return desc->action->dev_id;
>>>
>>> Why did an Arm change slip into a RISC-V patch?
>>
>> Considering that this code is executed under the spinlock it is fine to
>> not use test_bit() so it is part of dropping of bitops functions.
> 
> Perhaps, but then in a separate patch and changing all places consistently
> (I didn't go check, but I'm pretty sure there are more).
Oh, sorry, it is really Arm file. I overlooked that... It shouldn't be 
really touched in this patch.

~ Oleksii

