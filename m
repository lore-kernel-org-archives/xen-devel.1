Return-Path: <SRS0=s5AT=DT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A11BDC433DF
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2020 14:27:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4318920709
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2020 14:27:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D9z/fy+W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4318920709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.5957.15524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRynA-0005EU-BL; Mon, 12 Oct 2020 14:27:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5957.15524; Mon, 12 Oct 2020 14:27:12 +0000
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
	id 1kRynA-0005EN-8N; Mon, 12 Oct 2020 14:27:12 +0000
Received: by outflank-mailman (input) for mailman id 5957;
 Mon, 12 Oct 2020 14:27:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3Icg=DT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kRyn8-0005EI-VL
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 14:27:11 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 314f5422-3e7d-49e2-8a4c-02e0335de2b1;
 Mon, 12 Oct 2020 14:27:09 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-DM2oIv67Nm-9F6tyvIgkbg-1; Mon, 12 Oct 2020 10:27:07 -0400
Received: by mail-wr1-f69.google.com with SMTP id t17so9412352wrm.13
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2020 07:27:07 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id f6sm11354830wru.50.2020.10.12.07.27.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2020 07:27:05 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3Icg=DT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
	id 1kRyn8-0005EI-VL
	for xen-devel@lists.xenproject.org; Mon, 12 Oct 2020 14:27:11 +0000
X-Inumbo-ID: 314f5422-3e7d-49e2-8a4c-02e0335de2b1
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 314f5422-3e7d-49e2-8a4c-02e0335de2b1;
	Mon, 12 Oct 2020 14:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602512829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vo+2idY1iOLKCcCi+5C1utcyJaMx4cV6n4V4S3DSJYU=;
	b=D9z/fy+WqrDNWlxzzfefNn6zPD0BBBa+EtAUPnP0QIKljaCwIcPQnkYUFlOfB/RM1SHnYg
	9+5OSiDrOqjJgEJKP+KUM/x0/42tFv+cNW+1WmlThjPKziglTJUC7fvU8AhAUX5VnayQsJ
	xRt9rdPWU+rdGxPIxekx45/dFhy8fGc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-DM2oIv67Nm-9F6tyvIgkbg-1; Mon, 12 Oct 2020 10:27:07 -0400
X-MC-Unique: DM2oIv67Nm-9F6tyvIgkbg-1
Received: by mail-wr1-f69.google.com with SMTP id t17so9412352wrm.13
        for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2020 07:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Vo+2idY1iOLKCcCi+5C1utcyJaMx4cV6n4V4S3DSJYU=;
        b=igSRNVOjnPAdyw6ECpqBgLyaEVZmEivOjDQQOV5Qp2DgPziuY/A7bqz/1lOIQ9wtov
         UhpGU3cuMxe6F3GG8bmrghZRFwP0QO/lnFqLr7TVZh7BTtzKnbK5GMDvyuHqUVsYmJ/K
         tdso6S4AEj4xN+dwBua1of+ANS9ooGZQGMZkBmF1iwFa0zliC95MLKC3gfCzufyJpPTU
         4ISADIhD4aV8hi7/EjNnkGoX6fA35Ouvpt+WHqX5diSvxz70VmhLTPV7YHND9Om8RtDH
         sOo+8UEXWWlXVvwInRvmpQUrGA8RsYHP+ZpesvGxEPIgnHYkaaGyD+Ug4BCvFh4GY0Li
         tZeA==
X-Gm-Message-State: AOAM531pTAOS2yGM9ODY42k4sEpT2UcnEC4UiPhn3zcShB28BHip29Gq
	yaD3yuwIEq1v/bmOhn7/LUAIttZGVzCRcMO41+QN7V3Ml480sBdPCZXOUnPjk9ROw/00klTLkxP
	n+/4tQDlG4hXu3126ZnXbZxilKcs=
X-Received: by 2002:adf:8b92:: with SMTP id o18mr30897969wra.54.1602512826430;
        Mon, 12 Oct 2020 07:27:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyN/JUPdkMsHaZBYIgaydnOJmnNwLH0QYzEln08Ptid/yaqlyzjllxaKTcU7OhsAYIHHDu0Gg==
X-Received: by 2002:adf:8b92:: with SMTP id o18mr30897939wra.54.1602512826234;
        Mon, 12 Oct 2020 07:27:06 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
        by smtp.gmail.com with ESMTPSA id f6sm11354830wru.50.2020.10.12.07.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2020 07:27:05 -0700 (PDT)
Subject: Re: [PATCH 1/5] hw/pci-host/bonito: Make PCI_ADDR() macro more
 readable
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paul Durrant <paul@xen.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-trivial@nongnu.org, Helge Deller <deller@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20201012124506.3406909-1-philmd@redhat.com>
 <20201012124506.3406909-2-philmd@redhat.com>
 <3894edd-a214-3edf-8cbe-3566842e8a4@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <aadc1813-9289-85eb-18b9-70c4189fd879@redhat.com>
Date: Mon, 12 Oct 2020 16:27:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <3894edd-a214-3edf-8cbe-3566842e8a4@eik.bme.hu>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10/12/20 3:55 PM, BALATON Zoltan wrote:
> On Mon, 12 Oct 2020, Philippe Mathieu-Daudé wrote:
>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> The PCI_ADDR() macro use generic PCI fields shifted by 8-bit.
>> Rewrite it extracting the shift operation one layer.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> hw/pci-host/bonito.c | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
>> index a99eced0657..abb3ee86769 100644
>> --- a/hw/pci-host/bonito.c
>> +++ b/hw/pci-host/bonito.c
>> @@ -196,8 +196,8 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
>> #define PCI_IDSEL_VIA686B          (1 << PCI_IDSEL_VIA686B_BIT)
>>
>> #define PCI_ADDR(busno , devno , funno , regno)  \
>> -    ((((busno) << 16) & 0xff0000) + (((devno) << 11) & 0xf800) + \
>> -    (((funno) << 8) & 0x700) + (regno))
>> +    ((((busno) << 8) & 0xff00) + (((devno) << 3) & 0xf8) + \
>> +    (((funno) & 0x7) << 8) + (regno))
> 
> Are you missing a << 8 somewhere before + (regno) or both of these are 
> equally unreadable and I've missed something? This seems to be 
> completely replaced by next patch so what's the point of this change?

I might have missed a parenthesis somewhere indeed =)

I'm happy to merge it in the next patch, I thought it would
be easier to review but it isn't.

Thanks for reviewing!

> 
> Regards,
> BALATON Zoltan
> 
>>
>> typedef struct BonitoState BonitoState;
>>
>>


