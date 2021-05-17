Return-Path: <SRS0=GMNG=KM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A214C433B4
	for <xen-devel@archiver.kernel.org>; Mon, 17 May 2021 13:41:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F25AD60FD8
	for <xen-devel@archiver.kernel.org>; Mon, 17 May 2021 13:41:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F25AD60FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.128247.240787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lidUz-000527-U5; Mon, 17 May 2021 13:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128247.240787; Mon, 17 May 2021 13:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lidUz-000520-R3; Mon, 17 May 2021 13:41:33 +0000
Received: by outflank-mailman (input) for mailman id 128247;
 Mon, 17 May 2021 13:41:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X6rY=KM=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lidUy-00051s-M3
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 13:41:32 +0000
Received: from mail-ot1-x32f.google.com (unknown [2607:f8b0:4864:20::32f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc42a2ee-2fc1-4a4e-b6fa-2c5d4192dcf2;
 Mon, 17 May 2021 13:41:32 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so5565191otg.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 May 2021 06:41:32 -0700 (PDT)
Received: from [192.168.99.80] (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id a19sm3183745otk.31.2021.05.17.06.41.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 06:41:31 -0700 (PDT)
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
X-Inumbo-ID: dc42a2ee-2fc1-4a4e-b6fa-2c5d4192dcf2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=367gddCLKIQMUSKWrDX1dfdM4/aoyN7KbKCA66qOI0c=;
        b=hEAy7E8piRYEtO0NfCWzNs9fm92Xeij1/nsUVb5/X6nKmXrHx2UVRVjGaVjoWiaHLK
         3VexaKHveGVJdT5PXr+lAyQ1qONbBOm1U79+Q6VZalapPHvIgqxxd2/LOgOg4/BTkweP
         mJ30xF+iOii+8PZ+jToYRkMU+L+HIY2iom/fptHcfLX1nkTrLrLdyY1gyGHZ4f8dubrC
         lBObasSkUtR4/ZDMrKP4ZfrC+LY/tnajzVz4dpYw4OZUwDOdjOP2a60Lyh0yWTtcLRwH
         qOgtg91MvKrt+ptACsRCMKREeSThMeVKLo3IcjE3DI6r3z8OTtjnQ8WHtJLd8cTZqzO+
         POZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=367gddCLKIQMUSKWrDX1dfdM4/aoyN7KbKCA66qOI0c=;
        b=mWnJhIABy1GT1sJbFYcLMbrj0XDJts4GF3FOpRg5kDLqL9xixKf4wp2gOqa+k+WDvK
         h5ia1gB2vB83g7orRa0+DW8L6Bw0gha3UQ1ThY1DiHqfDXnXMjLIDqGy65/TO3TyFqWW
         Ccno/EAFgj5acbMGVLsDqO8mD1Vn3JT+AT7kjUwkhmgOFrvqYTylYykosIgsjPNEG/II
         R0/gwM88wCCAx1EB2VAFhYQt9kLblekuERwtUbvFQbvDgN0S/dqJnD7lulg9NpsljrAy
         K8YNYZztkJpxnIQoeejKsICe0KPM9gE77CE0K8CMSA8Pyf68tf+CqxzR0chEv8RjkMFr
         B1dw==
X-Gm-Message-State: AOAM531xpf92k6DTDZPsZLVuN7X019zFZyW28BLu7+HxD41ZhX9OuVEu
	W32z3yFNNWsf6LVQIOkKu8U=
X-Google-Smtp-Source: ABdhPJw/4KPF6rbMWTH9G9q05p+HF1Asqzzkba6PyLLfowGcTnoJchrRCQYhLDrR/cAXEDacVwmqSQ==
X-Received: by 2002:a05:6830:248d:: with SMTP id u13mr49382062ots.121.1621258891721;
        Mon, 17 May 2021 06:41:31 -0700 (PDT)
Subject: Re: [PATCH] drivers/char: Add USB3 debug capability driver
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <9a6a15ebc538105c83be88883ab3a7125ed52d37.1620776791.git.connojdavis@gmail.com>
 <46931334-d4a8-eb89-0b81-727ff30c0ec0@xen.org>
From: Connor Davis <connojdavis@gmail.com>
Message-ID: <60cc20a9-03b1-214e-d3f2-6f383d10ac03@gmail.com>
Date: Mon, 17 May 2021 07:41:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <46931334-d4a8-eb89-0b81-727ff30c0ec0@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 5/17/21 3:36 AM, Julien Grall wrote:
> Hi Connor,
>
> On 12/05/2021 01:12, Connor Davis wrote:
>> +config XHCI_FIXMAP_PAGES
>> +        int "Number of fixmap entries to allocate for the xHC"
>> +    depends on HAS_XHCI_DBC
>> +        default 16
>> +        help
>> +          This should equal the size (in 4K pages) of the first 64-bit
>> +          BAR of the host controller in which the DbC is being used.
>
> Why can't you use the ioremap() for the new serial controller? Is this 
> going to be used by Xen very early?
>
> Cheers,
>
Yes it is used very early


Thanks,

Connor


