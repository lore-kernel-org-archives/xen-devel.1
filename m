Return-Path: <SRS0=TkWG=EY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F213EC5519F
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2020 16:40:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 657912483D
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2020 16:40:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=cardoe.com header.i=@cardoe.com header.b="LDV/hWDT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 657912483D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cardoe.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.30107.59852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfQVX-0003Qe-TY; Wed, 18 Nov 2020 16:40:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30107.59852; Wed, 18 Nov 2020 16:40:35 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfQVX-0003QW-QX; Wed, 18 Nov 2020 16:40:35 +0000
Received: by outflank-mailman (input) for mailman id 30107;
 Wed, 18 Nov 2020 16:40:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PiVl=EY=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1kfQVW-0003QO-0F
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 16:40:34 +0000
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ce7615a-fdcf-4e80-b6e2-8b40eaf9350f;
 Wed, 18 Nov 2020 16:40:33 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id i12so2101555qtj.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2020 08:40:33 -0800 (PST)
Received: from doug-macbook.local ([2600:1700:7b90:52f0:fcda:1820:8a59:569b])
 by smtp.gmail.com with ESMTPSA id
 y44sm17248319qtb.50.2020.11.18.08.40.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 08:40:32 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PiVl=EY=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
	id 1kfQVW-0003QO-0F
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 16:40:34 +0000
X-Inumbo-ID: 9ce7615a-fdcf-4e80-b6e2-8b40eaf9350f
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9ce7615a-fdcf-4e80-b6e2-8b40eaf9350f;
	Wed, 18 Nov 2020 16:40:33 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id i12so2101555qtj.0
        for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2020 08:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cardoe.com; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=w1Rh0RZEBiXnIYfEPCG0oVkDIRGmJh8N/wsHoBI5mrI=;
        b=LDV/hWDTl4mdRMGKl68VTnFoxSth/J3Ckbj2ZBxWCuV2J31pps2c/ZEp9UvMHS+fM4
         6xEYU+w3ye6+gDIAucrVT9AOBtrIhrwVkaUszR4EvpRycg0v76Ortc1PTaa4r0L/x58I
         zS5N0tQPHZaqhsqILEDxADgDVYNx3Ps60qIWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w1Rh0RZEBiXnIYfEPCG0oVkDIRGmJh8N/wsHoBI5mrI=;
        b=KrDe7JB4Kn3yeAub1fNjZOE+0UeKvy8sgti4t/qZMep5uXP1JgNcjLQDNYaeosdJ/U
         YwkI0B7+W6GEmD6ziAh3ch5As1+Wz9uemzmHFxrurKqcKtmpVyZ04EqXzJ18x8274XZI
         5ykbzxrUDCAgsr3B1c1XTTl4The1WZhIlaoMvIN++PAgnbDjYmkLCVXG7xpY0Vg2c9ON
         E98OdZW8jO8Xva0xlN0NLF5p49bXI3F+ZkPQHtvr/2oc2jDrAUfcuz8XTzBi73GR3TBd
         1QFSC7/ife8l0PUryk8rjcHqm5sPm6xo2uHN/yNr1ylrd5fneamEfbQqZkb/ftmLzHTt
         Q+iQ==
X-Gm-Message-State: AOAM53077OIy65GcgSBMM9YRDCvoMxsPWIa9X3SCTJLzi4c1inhie/eQ
	R+iBFJcoqu7QvimOtAkqLIXqoXsCamebQA==
X-Google-Smtp-Source: ABdhPJwbJ+d6g63DdTHRsf3pF+9LL9xyPkkltsiL04CLrAqk9a/nLehN7IgTTCSaC8+E5n4wHOrZJQ==
X-Received: by 2002:ac8:787:: with SMTP id l7mr5478250qth.137.1605717632922;
        Wed, 18 Nov 2020 08:40:32 -0800 (PST)
Received: from doug-macbook.local ([2600:1700:7b90:52f0:fcda:1820:8a59:569b])
        by smtp.gmail.com with ESMTPSA id y44sm17248319qtb.50.2020.11.18.08.40.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2020 08:40:32 -0800 (PST)
Subject: Re: [PATCH v1 2/4] automation/: add Ubuntu:focal container
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1605636799.git.edvin.torok@citrix.com>
 <42b2b80779e264d60fa3daf01110fece34f00696.1605636800.git.edvin.torok@citrix.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <6d97bb1c-dce1-0813-6c8b-0f4ca223dc51@cardoe.com>
Date: Wed, 18 Nov 2020 10:40:31 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <42b2b80779e264d60fa3daf01110fece34f00696.1605636800.git.edvin.torok@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 11/17/20 12:24 PM, Edwin Török wrote:
> Signed-off-by: Edwin Török <edvin.torok@citrix.com>

Looks good. Do you have permissions to push the container or do you need
me to?

Acked-by: Doug Goldstein <cardoe@cardoe.com>

