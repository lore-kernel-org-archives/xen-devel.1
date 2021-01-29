Return-Path: <SRS0=v1SG=HA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C8DC433E0
	for <xen-devel@archiver.kernel.org>; Fri, 29 Jan 2021 20:00:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9D6161477
	for <xen-devel@archiver.kernel.org>; Fri, 29 Jan 2021 20:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9D6161477
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.78470.142750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Zw7-00081W-KN; Fri, 29 Jan 2021 20:00:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78470.142750; Fri, 29 Jan 2021 20:00:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Zw7-00081P-Gt; Fri, 29 Jan 2021 20:00:07 +0000
Received: by outflank-mailman (input) for mailman id 78470;
 Fri, 29 Jan 2021 20:00:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pfjn=HA=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1l5Zw5-0007xX-OR
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 20:00:06 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 2d11d9e7-f8b7-43f7-92dd-2aff2f43bc64;
 Fri, 29 Jan 2021 19:59:59 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-y32E2zuwOBSwQDoPD3VECg-1; Fri, 29 Jan 2021 14:59:57 -0500
Received: by mail-ed1-f70.google.com with SMTP id w4so5463663edu.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jan 2021 11:59:57 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id v20sm5046031edt.3.2021.01.29.11.59.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 11:59:55 -0800 (PST)
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
X-Inumbo-ID: 2d11d9e7-f8b7-43f7-92dd-2aff2f43bc64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611950399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LVJAKwgL2J/Sbi3aE8IaYzY6ykS/WBovm/x50m/MFYc=;
	b=drwyhP5xGMPxn5SnM9DcSFuDHjlKTWkEwR22GsFYUqKeX324CZrm6IxU5h6Q3n/+F7SHM+
	734mzP3vlbdc5C79jLM8txIq4aw6c4VqPcncOzjoAzXFrnhJJELmG4BdtC8J1cmDtwMAJ9
	mriRohCum6Hu8nk9lUK6yXBvZ7AgPd0=
X-MC-Unique: y32E2zuwOBSwQDoPD3VECg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LVJAKwgL2J/Sbi3aE8IaYzY6ykS/WBovm/x50m/MFYc=;
        b=jt9WCH3VJCcSC1gJ5Y8QxKDQOm1zXbpag98NDGyW1nhU0nk4vWVyoHP0k+syk++1WI
         rzZHaEchiWTnjDqe3DLZ8LaUX53qk3TAbt04MJBIpue4RpcmXSoYrhGMp5eQnSsB0Nbs
         +7l56Kh6a6nAU8LOgZ58GVzvDqUxobybjLzK2bW5NdQEmkJI0fKyQ/1W0Y6iGFnlfprU
         Bguy3k5JuWw+AcVf2rles8nh8J503nbMXRc5F56nRSrZtn0ZRhL2Wh+06q1tGxrMWQRA
         mHAifKA+K1Idc84nbLonmxmjLrbSlhU3AMRQmpPjOtwhp5nUzJ6vNw9cCY2TVx6GJtRv
         yixQ==
X-Gm-Message-State: AOAM533rFPimvX6oAjzTwi7xr+xJ2d9VInsylwYz9gQQuuaBjgRmEyse
	sNvkgUEK9Hiem0izGln8M87D7YCHHe/LeSHxOi9guZR9EE4PRb/6M7m64o4u3rvyFrU1o06atNn
	zEdKEfg7Ywo55vbcFOqS3FMcraLOmbB9xJBHQyK/ojMqja5c7sg3Z/kHyM6gS92zT/s3Rd602JK
	nO9Yo=
X-Received: by 2002:a17:906:f1cc:: with SMTP id gx12mr6139164ejb.489.1611950396080;
        Fri, 29 Jan 2021 11:59:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDPq5nhLEY39tW3G8HpSzSL3Us2oCkLLaS2ClB9iSF+zBPK0A3cBkMtI7wVPn/pJGa6W8Drg==
X-Received: by 2002:a17:906:f1cc:: with SMTP id gx12mr6139144ejb.489.1611950395912;
        Fri, 29 Jan 2021 11:59:55 -0800 (PST)
Subject: Re: [RFC PATCH 1/4] hw/ide/Kconfig: IDE_ISA requires ISA_BUS
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Thomas Huth <thuth@redhat.com>,
 Paul Durrant <paul@xen.org>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, xen-devel@lists.xenproject.org
References: <20210129194415.3925153-1-f4bug@amsat.org>
 <20210129194415.3925153-2-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <39ac2417-c4ee-49ca-0bc0-347981ec6fb3@redhat.com>
Date: Fri, 29 Jan 2021 20:59:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210129194415.3925153-2-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29/01/21 20:44, Philippe Mathieu-Daudé wrote:
> hw/ide/ioport.c has a strong dependency on hw/isa/isa-bus.c:
> 
>    /usr/bin/ld: libcommon.fa.p/hw_ide_ioport.c.o: in function `ide_init_ioport':
>    /usr/bin/ld: hw/ide/ioport.c:61: undefined reference to `isa_register_portio_list'
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/ide/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
> index 5d9106b1ac2..41cdd9cbe03 100644
> --- a/hw/ide/Kconfig
> +++ b/hw/ide/Kconfig
> @@ -12,7 +12,7 @@ config IDE_PCI
>   
>   config IDE_ISA
>       bool
> -    depends on ISA_BUS
> +    select ISA_BUS
>       select IDE_QDEV
>   
>   config IDE_PIIX

This is incorrect.  Buses are "depended on", not selected, and this is 
documented in docs/devel/kconfig.rst.

Paolo


