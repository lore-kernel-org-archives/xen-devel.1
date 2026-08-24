Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E973C5DF94
	for <xen-devel@archiver.kernel.org>; Mon, 24 Aug 2026 14:45:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1398898.1635149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyVvG-0001z2-CI; Mon, 24 Aug 2026 14:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1398898.1635149; Mon, 24 Aug 2026 14:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wyVvG-0001yv-8c; Mon, 24 Aug 2026 14:45:14 +0000
Received: by outflank-mailman (input) for mailman id 1398898;
 Mon, 24 Aug 2026 14:45:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1wyVvE-0001xk-En
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 14:45:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wyVvD-00CbXe-Dv
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2026 16:45:11 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6a8c58f5-8faa-0a2a0a5109dd-0a2a4501a056-10
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 16:45:11 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6a8c58f6-5984-0a2a45010019-aa0a857cebe9-3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2026 16:45:10 +0200
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-634-0lVCBpGIPpa5qIn8mlZKmw-1; Mon,
 24 Aug 2026 10:45:06 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9C75018608D3; Mon, 24 Aug 2026 14:44:59 +0000 (UTC)
Received: from redhat.com (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6758230002EF; Mon, 24 Aug 2026 14:44:52 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787582709;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=EPOW8a1Tm5zdmBXLIQzgCEl2lsjK7trOWqEpSuUEMD8=;
	b=Q3fqVUoe9mllwv/6i4NVdPhiuN1ACpLFUBe5CuQORE0Yn5TXZeilPzIbZI7FdB8aistIkk
	7iNY3+h9gn3REznpfI/kCMbJPwbpHCTD5xfgio241vPoUCHyuW0cijMVl1KExBuv+KXKhd
	mMey5d7wPd33SthgtB6VyWb0SPyStVI=
X-MC-Unique: 0lVCBpGIPpa5qIn8mlZKmw-1
X-Mimecast-MFC-AGG-ID: 0lVCBpGIPpa5qIn8mlZKmw_1787582700
Date: Mon, 24 Aug 2026 15:44:49 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org, dave@treblig.org, mst@redhat.com,
	imammedo@redhat.com, anisinha@redhat.com, philmd@mailo.com,
	aurelien@aurel32.net, mjrosato@linux.ibm.com, alifm@linux.ibm.com,
	farman@linux.ibm.com, richard.henderson@linaro.org,
	iii@linux.ibm.com, david@kernel.org, pasic@linux.ibm.com,
	borntraeger@linux.ibm.com, cohuck@redhat.com, alex@shazbot.org,
	clg@redhat.com, akrowiak@linux.ibm.com, jjherne@linux.ibm.com,
	sstabellini@kernel.org, anthony@xenproject.org,
	edgar.iglesias@gmail.com, pbonzini@redhat.com, eblake@redhat.com,
	armbru@redhat.com, joe.jin@oracle.com
Subject: Re: [PATCH 0/8] Force detach PCI devices for ACPI-based and PCIe
 native hot-unplug
Message-ID: <aoxY4Rxst2qAyn5z@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20260824011420.752806-1-dongli.zhang@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20260824011420.752806-1-dongli.zhang@oracle.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: cl8Le9jqAnXR1Rmnr1zvpPL4DK9sh8MbAMlh2DiJvOo_1787582700
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-purgate-ID: tlsNG-d62444/1787582711-BE27A757-B8F3E1D9/0/0
X-purgate-type: clean
X-purgate-size: 5160

On Sun, Aug 23, 2026 at 06:13:30PM -0700, Dongli Zhang wrote:
> Hot-unplugging a PCI device can require cooperation from the guest. For
> ACPI PCI hotplug, QEMU notifies the guest through ACPI and the guest
> eventually writes the ACPI PCI eject register. For PCIe native hotplug,
> QEMU notifies the guest through the PCIe hotplug mechanism and waits for
> the slot unplug flow to complete. Only after that completion does QEMU
> unrealize the device and emit DEVICE_DELETED.
> 
> This can leave a device stuck in the unplug pending state when the guest
> does not cooperate. Examples include:
> 
> 1. The guest has panicked, or the relevant ACPI/PCI hotplug driver is
> unavailable.
> 
> 2. The guest is stalled and cannot handle the hot-unplug event. For
> example, stalling the Linux [irq/9-acpi] kernel thread can reproduce this
> for ACPI-based hot-unplug.
> 
> 3. The device was attached to a slot that the guest cannot use. For
> example, a pcie-root-port only supports slot 0. If a device is added to a
> non-zero slot below a pcie-root-port, the guest may never discover the
> device and therefore may never complete the unplug request.
> 
> The non-zero slot case has also been discussed in:
> 
> hw/pci: warn when PCIe device is plugged into non-zero slot of downstream port
> https://gitlab.com/qemu-project/qemu/-/commit/ca92eb5defcf9d1c2106341744a73a03cf26e824
> 
> hw/pci: add comment to explain checking for available function 0 in pci hotplug
> https://gitlab.com/qemu-project/qemu/-/commit/67d045a0ef5b9c5f871c3a1d87325a8a42d2b9d5
> 
> pci: don't skip function 0 occupancy verification for devfn auto assign
> https://gitlab.com/qemu-project/qemu/-/commit/e228d62b4af29bca698ec57efdceb46f392f5444
> 
> For example, if root-port.1 is a pcie-root-port, the following command adds
> a vhost-scsi-pci device to an invalid slot:
> 
> (qemu) device_add vhost-scsi-pci,id=scsi01,wwpn=naa.5001405324af0985,bus=root-port.1,addr=01.0
> warning: PCI: slot 1 is not valid for vhost-scsi-pci, parent device only allows plugging into slot 0.

This rather looks like it should be a fatal error, not a mere warning.

If I follow the commit ca92eb5def it links to https://bugzilla.redhat.com/show_bug.cgi?id=2128929
which states that this configuration is going to lead to a crash in
QEMU on guest OS shutdown. IMHO that crash is sufficient to justify
making this a fatal error.

If we actually wanted this to remain a warning, then that shutdown
crash would need to be fixed.

> 
> In this situation, the device may be impossible to remove through normal
> guest-cooperative hot-unplug. Production environments also need a host side
> recovery option when the guest kernel is the reason that unplug does not
> complete.
> 
> This series adds a force option to QMP device_del and HMP device_del. When
> requested, QEMU asks the selected hotplug controller to complete the unplug
> through a new force_unplug callback.
> 
> This series implements forced unplug for ACPI PCI hotplug and PCIe native
> hotplug, which cover common pc/q35/virt cases. SHPC is not implemented by
> this series.
> 
> 
> Dongli Zhang (8):
>   qdev: Add force argument to qdev_unplug
>   qdev: hotplug: Add force_unplug handler callback
>   qdev: Support forced device_del in QMP and HMP
>   hw/acpi/pcihp: acpi/pcihp: Add forced slot unplug helper
>   hw/acpi/piix4: Support forced PCI unplug
>   hw/acpi/ich9: Support forced PCI unplug
>   hw/acpi/ged: Support forced PCI unplug
>   hw/pci/pcie: Support forced PCIe native unplug
> 
>  hmp-commands.hx                 | 11 ++++++-----
>  hw/acpi/acpi-pci-hotplug-stub.c |  6 ++++++
>  hw/acpi/generic_event_device.c  | 15 +++++++++++++++
>  hw/acpi/ich9.c                  | 15 +++++++++++++++
>  hw/acpi/pcihp.c                 | 17 +++++++++++++++++
>  hw/acpi/piix4.c                 | 15 +++++++++++++++
>  hw/core/hotplug.c               | 11 +++++++++++
>  hw/isa/lpc_ich9.c               |  1 +
>  hw/pci/pcie.c                   | 20 ++++++++++++++++++++
>  hw/pci/pcie_port.c              |  1 +
>  hw/s390x/s390-pci-bus.c         |  4 ++--
>  hw/vfio/ap.c                    |  2 +-
>  hw/vfio/ccw.c                   |  2 +-
>  hw/vfio/pci.c                   |  2 +-
>  hw/xen/xen-legacy-backend.c     |  2 +-
>  hw/xen/xen_pvdev.c              |  2 +-
>  include/hw/acpi/ich9.h          |  2 ++
>  include/hw/acpi/pcihp.h         |  3 +++
>  include/hw/core/hotplug.h       | 12 ++++++++++++
>  include/hw/core/qdev.h          |  2 +-
>  include/hw/pci/pcie.h           |  2 ++
>  qapi/qdev.json                  | 11 +++++++++--
>  system/qdev-monitor.c           | 23 +++++++++++++++++------
>  23 files changed, 160 insertions(+), 21 deletions(-)
> 
> base-commit: eea8fe61b8be8f3016e522e6af24924a0266ca95
> 
> Thank you very much!
> 
> Dongli Zhang
> 

With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|


