Return-Path: <SRS0=ysB/=AF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB117C433DF
	for <xen-devel@archiver.kernel.org>; Wed, 24 Jun 2020 12:31:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA5E120781
	for <xen-devel@archiver.kernel.org>; Wed, 24 Jun 2020 12:31:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uqHXuvYP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA5E120781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jo4YG-00087H-Ot; Wed, 24 Jun 2020 12:30:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Mms=AF=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jo4YE-00087C-RY
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 12:30:50 +0000
X-Inumbo-ID: 893f9d40-b616-11ea-8496-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 893f9d40-b616-11ea-8496-bc764e2007e4;
 Wed, 24 Jun 2020 12:30:50 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l10so2089852wrr.10
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2020 05:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=d+a2gUl07F0ZUgzubj1rIDmfWgWm8vAiCo/wzafStfg=;
 b=uqHXuvYP10Vfc0poUxXhoAxEgjcIOEKhkTloMAvbcLBCZNNqTkYtQMPApfgO18u3cB
 /CjHFcGhlH+WNzJ3gTBlXdS3cPgBlS5znOzL0sFYoI1hpB+nruuUTli5CY1+Wqj9cE4l
 dGsUywTZtDFutOSW/aUsKBBfda+WAVvTuGjwoQCthysU8PAMstXG20v6Qi7Y758jkNzY
 SkK1ylLYAY2UZbAgwnodHtBMDNBrVObeYksrROuZ5N1k10QiQs45SMGqb6YUsWIWszUh
 0KgEZlsC4evnsw7QLCNOUs2i7fLJZIjQ0Kpa33u8xYDgfk0M5g+ye5AzynukYUjfcEW6
 Bkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=d+a2gUl07F0ZUgzubj1rIDmfWgWm8vAiCo/wzafStfg=;
 b=JfKRKMobiE7ztC9Uz6yUw2yLMk80HpzdqyNxihfLoWiBWmtox+HKQoTYDt02WiGXny
 7mpjPJfL9uQu+jPkIq2vQ32QkShUU3zTX9KcIrFCOGhRidgBDTCmgP65s2es0S63wEwm
 zRcg4ysthFonwZL9v0ZUhjQwDS19taIdOsgBm/xeDDjfNNx/KO3aXI/kIDvEf+F4gn2c
 1ChzZtswPqvlViFv1UCHpRlgfKDTVeVbGZ3aLe1v7/NYjQw9i5FUw4vRmMS61YyS6S9+
 9SQsg340gDd2e/sRerALjVfYXk4x9l6bD5zq8pxM9zDAiaynsqLcIdzd8Rs91nc24PDW
 VGEQ==
X-Gm-Message-State: AOAM532neGwUACAWWkZNRFZ40Pjnd2VMgxXMdxsaWfkTUiYJ4Z1z/HgA
 6GB7jnBAQN1lc4hkwou++IQ=
X-Google-Smtp-Source: ABdhPJwdWkiuvxZQhBc8cWxD+knonuDTYnM/NcsBtM505tCqOyS8b6fo/jwqWpAgEy4bxAdZstRHzA==
X-Received: by 2002:adf:e6cb:: with SMTP id y11mr25769251wrm.282.1593001849266; 
 Wed, 24 Jun 2020 05:30:49 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id f14sm9612823wro.90.2020.06.24.05.30.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jun 2020 05:30:48 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jason Andryuk'" <jandryuk@gmail.com>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>,
 "'Anthony Perard'" <anthony.perard@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <20200624121939.10282-1-jandryuk@gmail.com>
In-Reply-To: <20200624121939.10282-1-jandryuk@gmail.com>
Subject: RE: [PATCH] xen: Fix xen-legacy-backend qdev types
Date: Wed, 24 Jun 2020 13:30:47 +0100
Message-ID: <000a01d64a23$4a595e90$df0c1bb0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJVIeVpfNhOuJ/7wV1uDlt3SOiQn6fqAo/Q
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: qemu-devel@nongnu.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jason Andryuk <jandryuk@gmail.com>
> Sent: 24 June 2020 13:20
> To: Stefano Stabellini <sstabellini@kernel.org>; Anthony Perard <anthony.perard@citrix.com>; Paul
> Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Cc: Jason Andryuk <jandryuk@gmail.com>; qemu-devel@nongnu.org
> Subject: [PATCH] xen: Fix xen-legacy-backend qdev types
> 
> xen-sysdev is a TYPE_SYS_BUS_DEVICE.  bus_type should not be changed so
> that it can plug into the System bus.  Otherwise this assert triggers:
> qemu-system-i386: hw/core/qdev.c:102: qdev_set_parent_bus: Assertion
> `dc->bus_type && object_dynamic_cast(OBJECT(bus), dc->bus_type)'
> failed.
> 
> TYPE_XENBACKEND attaches to TYPE_XENSYSBUS, so its class_init needs to
> be set accordingly to attach the qdev.  Otherwise the following assert
> triggers:
> qemu-system-i386: hw/core/qdev.c:102: qdev_set_parent_bus: Assertion
> `dc->bus_type && object_dynamic_cast(OBJECT(bus), dc->bus_type)'
> failed.
> 
> TYPE_XENBACKEND is not a subclass of XEN_XENSYSDEV, so it's parent
> is just TYPE_DEVICE.  Change that.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Clearly we raced. This patch and my patch #1 are identical so I'm happy to give my ack to this.

  Paul

> ---
>  hw/xen/xen-legacy-backend.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
> index 2335ee2e65..c5c75c0064 100644
> --- a/hw/xen/xen-legacy-backend.c
> +++ b/hw/xen/xen-legacy-backend.c
> @@ -789,11 +789,12 @@ static void xendev_class_init(ObjectClass *klass, void *data)
>      set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>      /* xen-backend devices can be plugged/unplugged dynamically */
>      dc->user_creatable = true;
> +    dc->bus_type = TYPE_XENSYSBUS;
>  }
> 
>  static const TypeInfo xendev_type_info = {
>      .name          = TYPE_XENBACKEND,
> -    .parent        = TYPE_XENSYSDEV,
> +    .parent        = TYPE_DEVICE,
>      .class_init    = xendev_class_init,
>      .instance_size = sizeof(struct XenLegacyDevice),
>  };
> @@ -824,7 +825,6 @@ static void xen_sysdev_class_init(ObjectClass *klass, void *data)
>      DeviceClass *dc = DEVICE_CLASS(klass);
> 
>      device_class_set_props(dc, xen_sysdev_properties);
> -    dc->bus_type = TYPE_XENSYSBUS;
>  }
> 
>  static const TypeInfo xensysdev_info = {
> --
> 2.25.1



