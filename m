Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B866CCA5FE4
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2026 17:21:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439333.1657679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgwr-0000OP-B8; Fri, 02 Oct 2026 17:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439333.1657679; Fri, 02 Oct 2026 17:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCgwr-0000OI-82; Fri, 02 Oct 2026 17:21:29 +0000
Received: by outflank-mailman (input) for mailman id 1439333;
 Fri, 02 Oct 2026 17:21:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1xCgwq-0000A3-7Z
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 17:21:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCgwp-005hbq-Kl
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2026 19:21:27 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe80f-2eae-0a2a0a5409dd-0a2a4506ad7c-8
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:21:27 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 6abfe816-195a-0a2a45060019-aa0a817c9975-3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2026 19:21:27 +0200
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-387-RsuvaWbCNU6Fy0yWVSacOQ-1; Fri,
 02 Oct 2026 13:21:22 -0400
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5D97F1806D3D; Fri,  2 Oct 2026 17:21:21 +0000 (UTC)
Received: from localhost (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 91C321800576; Fri,  2 Oct 2026 17:21:20 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790961686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e9nvmUr2zbUVTbvHTbhwfcDg5wbAhEW73Shs3YiPq8I=;
	b=dFrKbNlzEDiMa2jN/lHQbyvgwOv+rmLEiGGNRcKIY7/kob8o6s/nTYo9egg7+mwvOmbfTV
	jDvLL/n0A6oY1w+dFPpM3uYGiKmWkWoED2O7FVf1PAhK5Jci1CC7GR8wWYsBCy4jAxpAQz
	QPaLHd24InRVxWNJ7gnjiWMcYwfHeWg=
X-MC-Unique: RsuvaWbCNU6Fy0yWVSacOQ-1
X-Mimecast-MFC-AGG-ID: RsuvaWbCNU6Fy0yWVSacOQ_1790961681
MIME-Version: 1.0
Subject: Re: [PATCH 03/28] hw: mark all virtio PCI devices as secure
From: marcandre.lureau@redhat.com
To: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org, 
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org
In-Reply-To: <20260911143627.2743803-4-berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-4-berrange@redhat.com>
Date: Fri, 02 Oct 2026 21:21:01 +0400
Message-Id: <179096166110.3025252.6768256984831473183.b4-review@b4>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3371;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=GospWORxvPtPg6gnBQ7dvqsk9jcJVQRH3jLXkM10C5c=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqv+gBUwkiX50cyBdHiy6yEWHewc/R0CgJqBOM7
 rnWyAd8pw2JAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCar/oAQAKCRDa6OEJdZac
 5QgFEACmrMfF16N8JIcF1CCPQH4SbV7IsoMLIKEYYTYkokijSr1WOk2XRGGRxsoc8S5e8iPXunM
 +kDqRcSYef2u4k0/yv/Nk2YPSDxYzOvDkXfO80/OFcbK4NG64GKsqYyTKNLBgeGLiGNNaull6Sv
 TWrBjTrice0kyAVB9yMsUNqXWphqvVqBJeK2x7Si0YLVolSt5yk4oay7Qgo4w94mTm9onRrf/5o
 71tKe3RU+pF/CsiqdxwXfx7nNjAOQEhkFmKhFMv20/AmaYH3203J4DZhw0YquGilXgW4+JccPD6
 E5rbwKdRXwqH4dYMvB19MSYn4MmhM2/rObmsRLClWQOwZArQ+SNDhw0rhCR1h2+X8B6HRRHEtoe
 jlTGaC7ZG/L+3xP4dozO4rJSCcg60xItlqpBotEZydHaXKXv+9JvhgDYsGNBh62t7XJcXu7T1vL
 X/6E0wAJWOC6dF77VNbc+0Y3vVqDZHoqxK9jovQQngVT8xFkKQYQC7SI245ndEfhrx8h/wT4rjY
 Tx+c6lbb8SLxcnv4LUYAI/Du9VUVh6oLF20+kqDucW6Quog7CsHu8Bw6eJgoUan4OLH7nocby2S
 GfiCSXNpC5utmgVKGmye8Qqi27E6A4Fs/7AGsbQcZqlng3CBylAClMtVGNdOZ7QQ9rozmQFnIyJ
 Ha9UE9XGAHZcJSA==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: j_GwrVrERRdgyvmQ6Tq6KbxxJabQkp4d5ghx1dNePeM_1790961681
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1790961687-F76C877B-520C6121/0/0
X-purgate-type: clean
X-purgate-size: 3373

> These are all intended for use in a virtualization scenario and must
> provide a security boundary. This can be done for almost all virtio
> PCI devices by modifying the common type register helper.
> 
> The virtio-gpu devices are unusual in not using the common
> virtio_pci_types_register() method, so need marking directly.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-ID: <20260911143627.2743803-4-berrange@redhat.com>
>
> diff --git a/hw/display/virtio-gpu-pci-rutabaga.c b/hw/display/virtio-gpu-pci-rutabaga.c
> index 4db77cb868db..a8e5e1d96cf3 100644
> --- a/hw/display/virtio-gpu-pci-rutabaga.c
> +++ b/hw/display/virtio-gpu-pci-rutabaga.c
> @@ -34,6 +34,7 @@ static const TypeInfo virtio_gpu_rutabaga_pci_info[] = {
>          .parent = TYPE_VIRTIO_GPU_PCI_BASE,
>          .instance_size = sizeof(VirtIOGPURutabagaPCI),
>          .instance_init = virtio_gpu_rutabaga_initfn,
> +        .secure = true,

This is unusual, I wonder why it's not using the VirtioPCIDeviceTypeInfo

>          .interfaces = (const InterfaceInfo[]) {
>              { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>              { },
> diff --git a/hw/display/virtio-gpu-pci.c b/hw/display/virtio-gpu-pci.c
> index 22659ca196b5..0b0d926a5b95 100644
> --- a/hw/display/virtio-gpu-pci.c
> +++ b/hw/display/virtio-gpu-pci.c
> @@ -75,7 +75,8 @@ static const TypeInfo virtio_gpu_pci_base_info = {
>      .parent = TYPE_VIRTIO_PCI,
>      .instance_size = sizeof(VirtIOGPUPCIBase),
>      .class_init = virtio_gpu_pci_base_class_init,
> -    .abstract = true
> +    .abstract = true,
> +    .secure = true,

This is a base class, probably doesn't need marking.

>  };
>  module_obj(TYPE_VIRTIO_GPU_PCI_BASE);
>  module_kconfig(VIRTIO_PCI);
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 6f5db5fc42b7..cd5fe8f1d8d8 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -2520,6 +2520,7 @@ void virtio_pci_types_register(const VirtioPCIDeviceTypeInfo *t)
>          .name = t->generic_name,
>          .parent = base_type_info.name,
>          .class_init = virtio_pci_generic_class_init,
> +        .secure = true,
>          .interfaces = (const InterfaceInfo[]) {
>              { INTERFACE_PCIE_DEVICE },
>              { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> @@ -2555,6 +2556,7 @@ void virtio_pci_types_register(const VirtioPCIDeviceTypeInfo *t)
>              .name          = t->non_transitional_name,
>              .parent        = base_type_info.name,
>              .instance_init = virtio_pci_non_transitional_instance_init,
> +            .secure = true,
>              .interfaces = (const InterfaceInfo[]) {
>                  { INTERFACE_PCIE_DEVICE },
>                  { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> @@ -2569,6 +2571,7 @@ void virtio_pci_types_register(const VirtioPCIDeviceTypeInfo *t)
>              .name          = t->transitional_name,
>              .parent        = base_type_info.name,
>              .instance_init = virtio_pci_transitional_instance_init,
> +            .secure = true,
>              .interfaces = (const InterfaceInfo[]) {
>                  /*
>                   * Transitional virtio devices work only as Conventional PCI

otherwise lgtm

-- 
Marc-André Lureau <marcandre.lureau@redhat.com>


