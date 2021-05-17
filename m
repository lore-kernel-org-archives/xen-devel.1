Return-Path: <SRS0=GMNG=KM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD29C433ED
	for <xen-devel@archiver.kernel.org>; Mon, 17 May 2021 14:24:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 873CB61995
	for <xen-devel@archiver.kernel.org>; Mon, 17 May 2021 14:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 873CB61995
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.128333.240950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lieAS-00087P-Jw; Mon, 17 May 2021 14:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128333.240950; Mon, 17 May 2021 14:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lieAS-00087I-Fz; Mon, 17 May 2021 14:24:24 +0000
Received: by outflank-mailman (input) for mailman id 128333;
 Mon, 17 May 2021 14:24:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X6rY=KM=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lieAR-000878-6N
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 14:24:23 +0000
Received: from mail-ot1-x335.google.com (unknown [2607:f8b0:4864:20::335])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a30cd112-584b-4abd-9a00-caaa86fa6486;
 Mon, 17 May 2021 14:24:22 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 d3-20020a9d29030000b029027e8019067fso5648315otb.13
 for <xen-devel@lists.xenproject.org>; Mon, 17 May 2021 07:24:22 -0700 (PDT)
Received: from [192.168.99.80] (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id 19sm2728380oiy.11.2021.05.17.07.24.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 07:24:21 -0700 (PDT)
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
X-Inumbo-ID: a30cd112-584b-4abd-9a00-caaa86fa6486
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=wP0qVRRFLaqKdNsvIebHqzMAQA0sHv3p78V+XQan4IE=;
        b=SIIetbEYExbcUM1QfmpytUTa2IVHHxjrX5L6JO2j1xRF6GNf1rzKAyM40K3Hi5hYwf
         REzXM3GmnmYKtfOC3JTzd+8Q5wzYuan+AmqRuwrgoXOPPqC9S/ccK8CLcBCIZT7ro76q
         vdQ4N0tLO/zXJP4b5wg1VMck/JcqcLbL+m0YijN1z9Wy4KH1jVjVXeFNlbqjhBuEZpFL
         clyJPWEn6AwkURWyVxA9BsFa3GCFHCy/9/3s1au+ksMHEydPpvbnXHqdH34qXED252Fr
         3ipPzVpKQiT02tYGuDwi4Puho9+BjNndIhyvsV44R5iSoKNE4kJ2qajjZsijf8TctP+u
         qB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=wP0qVRRFLaqKdNsvIebHqzMAQA0sHv3p78V+XQan4IE=;
        b=isZmC00gTfYyKNMr9kV5oYYzpQN5Fpd72C2uSdSXvdNHLC8Q9XI4nIViE6vxe7pEXU
         vFLbULKGRTZ56hIaykeaLTAbty6GXHNxqErech54FWfMIZ/CzsdfD2pxMVZHWoUKXASz
         fLS68pq0K/TwE27FCL6nO0y9jrOGIz/RTy9coKke5acItfCnxzBDIzpmv7Mst8DrhgnA
         SYhTLsjIn5g3V9UgfkQQLq30AJZPAcRJo8GAYVAwGOOaJsObgAcdyQajl4VPWENoRtoW
         quVpRfDOWlhkjMXCV+c6YIm/g6wYvO65q+qHpGTEAJdlOoJElhOZKRYtQwXEQtzE7nfJ
         ZS6w==
X-Gm-Message-State: AOAM533wTzMGj6pVEZgVLrWbPanXPrYKgYfrV/5eMOVDGBa8yIum3Sod
	MvIa9khRwZ0x4MZicbAy7+0=
X-Google-Smtp-Source: ABdhPJxdOLV4H8+0nYsjoYe7S0t3PHTaJfdsTy6vFeUExppMn/WtX8UkSoPTI9j9rQzIApvCTHBZWA==
X-Received: by 2002:a9d:4e88:: with SMTP id v8mr28025140otk.110.1621261462130;
        Mon, 17 May 2021 07:24:22 -0700 (PDT)
Subject: Re: [PATCH v2 1/4] usb: early: Avoid using DbC if already enabled
To: Jan Beulich <jbeulich@suse.com>
Cc: Jann Horn <jannh@google.com>, Lee Jones <lee.jones@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <cover.1620950220.git.connojdavis@gmail.com>
 <d160cee9b61c0ec41c2cd5ff9b4e107011d39d8c.1620952511.git.connojdavis@gmail.com>
 <8ccce25a-e3ca-cb30-f6a3-f9243a85a49b@suse.com>
 <16400ee4-4406-8b26-10c0-a423b2b1fed0@gmail.com>
 <ddb58cbd-0a72-f680-80f4-ce09b13a2cee@suse.com>
From: Connor Davis <connojdavis@gmail.com>
Message-ID: <55325db1-b086-fc81-9117-6560c4914a12@gmail.com>
Date: Mon, 17 May 2021 08:24:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ddb58cbd-0a72-f680-80f4-ce09b13a2cee@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/17/21 8:13 AM, Jan Beulich wrote:
> On 17.05.2021 15:48, Connor Davis wrote:
>> On 5/17/21 3:32 AM, Jan Beulich wrote:
>>> On 14.05.2021 02:56, Connor Davis wrote:
>>>> Check if the debug capability is enabled in early_xdbc_parse_parameter,
>>>> and if it is, return with an error. This avoids collisions with whatever
>>>> enabled the DbC prior to linux starting.
>>> Doesn't this go too far and prevent use even if firmware (perhaps
>>> mistakenly) left it enabled?
>> Yes, but how is one supposed to distinguish the broken firmware and
>> non-broken
>>
>> firmware cases?
> Well, a first step might be to only check if running virtualized.
> And then if your running virtualized, there might be a way to
> inquire the hypervisor?

Right, but if it was enabled by something other than a hypervisor,

or you're not running virtualized, how do you distinguish then? IMO

the proper thing to do in any case is to simply not use the DbC in linux.

Thanks,

Connor


