Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC12606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 15:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LNaiPhoi
Received: from list by lists.xenproject.org with outflank-mailman.1481971.1685862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQnYN-0004Wt-U6; Tue, 10 Nov 2026 15:14:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481971.1685862; Tue, 10 Nov 2026 15:14:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQnYN-0004Wm-Pn; Tue, 10 Nov 2026 15:14:31 +0000
Received: by outflank-mailman (input) for mailman id 1481971;
 Tue, 10 Nov 2026 15:14:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <clg@redhat.com>) id 1xQnYM-0004WV-Kn
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 15:14:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQnYM-00BaTf-1S
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 16:14:30 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <clg@redhat.com>)
 id 6af334cd-e002-0a2a0a5209dd-0a2a45029a7e-18
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 16:14:29 +0100
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <clg@redhat.com>)
 id 6af334d4-6ca4-0a2a45020019-aa0a857c5af1-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 16:14:29 +0100
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-Ui8AhzLxPMaxtfLDdDKcCg-1; Tue, 10 Nov 2026 10:14:27 -0500
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-49323e268aeso1690271f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 07:14:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:1292:d530:6448:8ad:27f1:8b49?
 ([2a01:e0a:1292:d530:6448:8ad:27f1:8b49])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4983284c990sm5329189f8f.3.2026.11.10.07.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2026 07:14:24 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Autocrypt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794323668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9/iPuFJxlwY+n/Ypo+AfMxO8Im+A6KkQW8J+SFi0m7U=;
	b=LNaiPhoiEXzkP7Ldp5yPN0UhaPEepGlgn91PHDGVGDo1irTDTiHhZMuCg6UbNAHAQhhfoS
	Ev0jbq93sP9ve7hkWD4xnnr8j78hMFrPmES4rhyO1wiAynd05IZof725mrCHjS/y65A7Va
	p8Pcf03EvrAjko7paouOFudAXbD2/8w=
X-MC-Unique: Ui8AhzLxPMaxtfLDdDKcCg-1
X-Mimecast-MFC-AGG-ID: Ui8AhzLxPMaxtfLDdDKcCg_1794323666
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323666; x=1794928466;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9/iPuFJxlwY+n/Ypo+AfMxO8Im+A6KkQW8J+SFi0m7U=;
        b=oKqO4+uOS0Dq77ZVq8UbN+5GZIrR42VSbqt7NylsM0p1M2wxQRcw0DgMT0n1/rpT8/
         ygKZXAD3bwUYDZ7ACu+UEaIq7dZmYN7hEySfvQyZZ55NYdE4Ea+K7N7mjykaZ2tonsQf
         S5b2KAfPY2dl1XU+ODy/hr2ahGtERjRH85Y817QfvlOO/Z3D8ZYqtwuZQhzco/4QhXv9
         iEY/pF404fBgDEnL7vi9OhQsgS4zCv+54sMJwrmraBPoyu6RTcU/PXnr/2zVnGAahBmG
         uu0NwPaF48rnlsLLfw5sfinIqU/qcJz3+2Cqb6m6vbd1q7AcQnmbhfMJfsb/9SWCMmEI
         muuw==
X-Gm-Message-State: APuU4Z+TNU6Qwm22dhoMs+TQyzPWWtUyEIUZcks1uWuVxp01+JBRg/X2
	/BZWtE3CmncIHb6eUL/BbNEJvRQpVpm/9+LAw7TP1TiZ8H1EisYDWzr/y/Ou0KoUoLubsJotWzp
	DzLL/B8GA8WpZ4/4bnJcn6IWgcg2lp9g1td8kWcjduJQpVMIohU3BxR4baXctgL7e1dQ8
X-Gm-Gg: AYBFou3JjqgLPH+JB7oXkBFF6kY3fi3MuZbWhy1OGDBHbc8DCBt3oYjPjAuuPI2jARr
	AOi2HRmyAJRPCxLtqAvvV+JtoFb05hNg41JgfoWiEloB+5aNdhiuGCaoML80iYKciwPU9yiGrkd
	UlwtzgNAvPWOWzM8kz0r2vvBPaWdOOXGOuD3eZ4H6hZWh7YRqk+L9x234AvyQGax9hKB6BCXVuu
	8hJn7oBuHbhaWaDad8L6iaMi7Cz5a/eo2XASZD6dzHw12silVi5P8yQPVhp/00bFaW04fCAz1Rb
	LMBkVYZlvkZ/hbKyA3SSNTLPwZHLkzMfDOGWpSCkZmIj57nwZOa3Eo+JmSE7vdLtmjXez9iMGRs
	movMYOTh6N+Lu42cWb5MiVYwp7MRykgb1wyLqWXuPXc5SZMMfv/KkIfDJCmGfkEXir3ONbOH2i3
	RBOW/O8jVRN5U=
X-Received: by 2002:adf:f04d:0:b0:48e:7833:2e7b with SMTP id ffacd0b85a97d-4982c1da22cmr4074689f8f.1.1794323665589;
        Tue, 10 Nov 2026 07:14:25 -0800 (PST)
X-Received: by 2002:adf:f04d:0:b0:48e:7833:2e7b with SMTP id ffacd0b85a97d-4982c1da22cmr4074633f8f.1.1794323665008;
        Tue, 10 Nov 2026 07:14:25 -0800 (PST)
Message-ID: <370bf56f-af15-4969-921d-a282b9703865@redhat.com>
Date: Tue, 10 Nov 2026 16:14:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/28] hw/vfio: mark all VFIO object classes as secure
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-8-berrange@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <20260911143627.2743803-8-berrange@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yEe2gW2mho6iMpg8ZkfcY5qUiRgf3AFzFIbXwWlUR0w_1794323666
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1794323669-F18AC2AC-34CF198D/35/111497
X-purgate-type: clean
X-purgate-size: 4964
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 9/11/26 16:36, Daniel P. Berrangé wrote:
> The VFIO subsystem is about securely passing host PCI devices
> to a guest, so all the classes should be presumed to be offering
> a security boundary.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/vfio-user/pci.c  | 1 +

vfio-user too ?

>   hw/vfio/ap.c        | 1 +
>   hw/vfio/ccw.c       | 1 +
>   hw/vfio/container.c | 1 +
>   hw/vfio/igd.c       | 1 +
>   hw/vfio/iommufd.c   | 2 ++
>   hw/vfio/pci.c       | 3 +++
>   hw/vfio/spapr.c     | 1 +
>   8 files changed, 11 insertions(+)


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> 
> diff --git a/hw/vfio-user/pci.c b/hw/vfio-user/pci.c
> index e7573d4a9f..ae26160f72 100644
> --- a/hw/vfio-user/pci.c
> +++ b/hw/vfio-user/pci.c
> @@ -482,6 +482,7 @@ static const TypeInfo vfio_user_pci_info = {
>       .class_init = vfio_user_pci_class_init,
>       .instance_init = vfio_user_pci_init,
>       .instance_finalize = vfio_user_pci_finalize,
> +    .secure = true,
>   };
>   
>   static void register_vfio_user_dev_type(void)
> diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
> index 6e2a1223ea..4b9d522f7b 100644
> --- a/hw/vfio/ap.c
> +++ b/hw/vfio/ap.c
> @@ -352,6 +352,7 @@ static const TypeInfo vfio_ap_info = {
>       .instance_size = sizeof(VFIOAPDevice),
>       .instance_init = vfio_ap_instance_init,
>       .class_init = vfio_ap_class_init,
> +    .secure = true,
>   };
>   
>   static void vfio_ap_type_init(void)
> diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> index c3dc7c1962..7a241aa02a 100644
> --- a/hw/vfio/ccw.c
> +++ b/hw/vfio/ccw.c
> @@ -721,6 +721,7 @@ static const TypeInfo vfio_ccw_info = {
>       .instance_size = sizeof(VFIOCCWDevice),
>       .instance_init = vfio_ccw_instance_init,
>       .class_init = vfio_ccw_class_init,
> +    .secure = true,
>   };
>   
>   static void register_vfio_ccw_type(void)
> diff --git a/hw/vfio/container.c b/hw/vfio/container.c
> index d09a663732..d4f20c6c81 100644
> --- a/hw/vfio/container.c
> +++ b/hw/vfio/container.c
> @@ -336,6 +336,7 @@ static const TypeInfo types[] = {
>           .instance_size = sizeof(VFIOContainer),
>           .class_size = sizeof(VFIOIOMMUClass),
>           .abstract = true,
> +        .secure = true,
>       },
>   };
>   
> diff --git a/hw/vfio/igd.c b/hw/vfio/igd.c
> index 413a49aae9..e9cef355f9 100644
> --- a/hw/vfio/igd.c
> +++ b/hw/vfio/igd.c
> @@ -311,6 +311,7 @@ static const TypeInfo vfio_pci_igd_lpc_bridge_info = {
>       .name = "vfio-pci-igd-lpc-bridge",
>       .parent = TYPE_PCI_DEVICE,
>       .class_init = vfio_pci_igd_lpc_bridge_class_init,
> +    .secure = true,
>       .interfaces = (const InterfaceInfo[]) {
>           { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>           { },
> diff --git a/hw/vfio/iommufd.c b/hw/vfio/iommufd.c
> index 242644aa00..64e588fe51 100644
> --- a/hw/vfio/iommufd.c
> +++ b/hw/vfio/iommufd.c
> @@ -1051,10 +1051,12 @@ static const TypeInfo types[] = {
>           .parent = TYPE_VFIO_IOMMU,
>           .instance_size = sizeof(VFIOIOMMUFDContainer),
>           .class_init = vfio_iommu_iommufd_class_init,
> +        .secure = true,
>       }, {
>           .name = TYPE_HOST_IOMMU_DEVICE_IOMMUFD_VFIO,
>           .parent = TYPE_HOST_IOMMU_DEVICE_IOMMUFD,
>           .class_init = hiod_iommufd_vfio_class_init,
> +        .secure = true,
>       }
>   };
>   
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 428ab2f069..b38877a1a8 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3854,6 +3854,7 @@ static const TypeInfo vfio_pci_device_info = {
>       .parent = TYPE_PCI_DEVICE,
>       .instance_size = sizeof(VFIOPCIDevice),
>       .abstract = true,
> +    .secure = true,
>       .class_init = vfio_pci_device_class_init,
>       .interfaces = (const InterfaceInfo[]) {
>           { INTERFACE_PCIE_DEVICE },
> @@ -4110,6 +4111,7 @@ static const TypeInfo vfio_pci_info = {
>       .class_init = vfio_pci_class_init,
>       .instance_init = vfio_pci_init,
>       .instance_finalize = vfio_pci_finalize,
> +    .secure = true,
>   };
>   
>   static const Property vfio_pci_nohotplug_properties[] = {
> @@ -4146,6 +4148,7 @@ static const TypeInfo vfio_pci_nohotplug_info = {
>       .parent = TYPE_VFIO_PCI,
>       .instance_size = sizeof(VFIOPCIDevice),
>       .class_init = vfio_pci_nohotplug_class_init,
> +    .secure = true,
>   };
>   
>   static void register_vfio_pci_dev_type(void)
> diff --git a/hw/vfio/spapr.c b/hw/vfio/spapr.c
> index 42690e4323..1027c434c0 100644
> --- a/hw/vfio/spapr.c
> +++ b/hw/vfio/spapr.c
> @@ -544,6 +544,7 @@ static const TypeInfo types[] = {
>           .parent = TYPE_VFIO_IOMMU_LEGACY,
>           .instance_size = sizeof(VFIOSpaprContainer),
>           .class_init = vfio_iommu_spapr_class_init,
> +        .secure = true,
>       },
>   };
>   


