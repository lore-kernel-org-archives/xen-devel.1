Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B4BC624D3
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 11:22:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408280.1640922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Rzz-0001Fg-Le; Fri, 04 Sep 2026 11:22:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408280.1640922; Fri, 04 Sep 2026 11:22:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Rzz-0001FZ-II; Fri, 04 Sep 2026 11:22:23 +0000
Received: by outflank-mailman (input) for mailman id 1408280;
 Fri, 04 Sep 2026 11:22:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mst@redhat.com>) id 1x2Rzx-0001FD-Si
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 11:22:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2Rzw-00AahF-S9
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 13:22:20 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mst@redhat.com>)
 id 6a9aa9db-2eae-0a2a0a5409dd-0a2a45078164-34
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 13:22:20 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mst@redhat.com>)
 id 6a9aa9ea-b4ea-0a2a45070019-aa0a857cac51-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 13:22:20 +0200
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-7HRuqFJcPhu4xQfw7Gujvw-1; Fri, 04 Sep 2026 07:22:17 -0400
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-48437090e74so586460f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 04:22:17 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485885bfe14sm5761659f8f.35.2026.09.04.04.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 04:22:14 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788520938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DZtNHj4dJNQM8XNol7kcuN6tcN2rtdw5KbaZPWFxkZ8=;
	b=AIr/gL6OFTp1xK/r9Pgnw9sM2YdxfnZamYnlwwbTWSQpPGGIdP8fa+A7wISCxZoZRkil7N
	wFsveyohXqtYtKeLcPWTT7YmuTx5vOGMU1yIunG/Qn/3Cw4ctOT0EK0ZnxjQmbTw5/IXci
	oz5QTz6Z2PIGzHhmJ5BczirySKiAYno=
X-MC-Unique: 7HRuqFJcPhu4xQfw7Gujvw-1
X-Mimecast-MFC-AGG-ID: 7HRuqFJcPhu4xQfw7Gujvw_1788520936
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520936; x=1789125736;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DZtNHj4dJNQM8XNol7kcuN6tcN2rtdw5KbaZPWFxkZ8=;
        b=CWEoxjxx/MEX9qWxFoxepyTLr62E+jdcEf20T0e1CdP5BJsWQG9XjSY5MlmEP75OPw
         mZdOJK0Wq4af778VuBIpjUIj/JNAR60tTuqmZDiwUKfNqq6TruitX0NKBp5mFSP9knHl
         T2fJonc7Zzowob0CJRayrXEdZokbQWXqlhrvcUtjpHKyH3Wc0fMUqDH9jtm/NnYWsdRX
         XPKD+SxoOC3jBTdyeQ8aFdw9Iu5V/QQUtzkbiLe2l239e5o3ihvDmgjj0NIhW7xre1Lz
         DvkaoH2PtRY81ZCm5+QcEnZksynTFxVtoaTF55xhKZesTyWNToMB17CszlY+jxGOxDqP
         S4RQ==
X-Forwarded-Encrypted: i=1; AKwUvBxB8gyXEKznVN+4BmjDtSGHq8aGJOJigueAE7dO9vVKQ+ujN48YrSkZN9EzB2iA1h3cgZHUEPnNIwY=@lists.xenproject.org
X-Gm-Message-State: AFuF++kWbiI2ogWgNl2jPq6ulDeFBR4L3vHPvH98xR8S5k/Iw2Liyx0U
	IwBCM7ei4Ddg7z8B3XI+irHjtjDenj9y3RkhE12rtuPugo1RYm7G+00/unepWZMliYGcU2o9s7p
	gSf32HTOKDPh00bs13IkzbU0ntIptgf26DoU/t7oXIwNLOXdyaD3okBecFB3EebHDxMMW
X-Gm-Gg: AYBFou2aa4F6wzyN5JcwR9M1ebp/qipOcFoVGxHgglGd3S7r8G1EyjJbxYIC9sT3R6Q
	V1uCSXq7tCoJpOTS26xqlRk2YMvX/oX7jdIvpb7uE/G2MPnvi7VT0a70qtdx42Zx0WRy9isrsNm
	SdxgVMJHfBtUSu+R/uB35IOv8JODrX9cHaMhwjoxp2Eo3h8ZCbFwiYGzhDgV+4CyjUL4U2QfGKn
	OiWklan1U3+Q2Rqsowt6VVOV5ymL1nsslYjLieMgou0F+R5feVvUscp0NfOkA4Ru01hrc+x5Meq
	TOx5ZY2Dy8CAYx33OO5TIMPXUhYKhNoZrkdxLPeCZTdU6LswICpirTPBAn3pm8ethwklCT9BHFg
	IKiMe30GpJevxFmHOytZWDis=
X-Received: by 2002:a05:6000:38c:b0:484:3fce:6ad2 with SMTP id ffacd0b85a97d-485872cd602mr9297372f8f.15.1788520935758;
        Fri, 04 Sep 2026 04:22:15 -0700 (PDT)
X-Received: by 2002:a05:6000:38c:b0:484:3fce:6ad2 with SMTP id ffacd0b85a97d-485872cd602mr9297283f8f.15.1788520935123;
        Fri, 04 Sep 2026 04:22:15 -0700 (PDT)
Date: Fri, 4 Sep 2026 07:22:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Dongli Zhang <dongli.zhang@oracle.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org, dave@treblig.org,
	anisinha@redhat.com, philmd@mailo.com, aurelien@aurel32.net,
	mjrosato@linux.ibm.com, alifm@linux.ibm.com, farman@linux.ibm.com,
	richard.henderson@linaro.org, iii@linux.ibm.com, david@kernel.org,
	pasic@linux.ibm.com, borntraeger@linux.ibm.com, cohuck@redhat.com,
	alex@shazbot.org, clg@redhat.com, akrowiak@linux.ibm.com,
	jjherne@linux.ibm.com, sstabellini@kernel.org,
	anthony@xenproject.org, edgar.iglesias@gmail.com,
	pbonzini@redhat.com, eblake@redhat.com, armbru@redhat.com,
	joe.jin@oracle.com
Subject: Re: [PATCH 0/8] Force detach PCI devices for ACPI-based and PCIe
 native hot-unplug
Message-ID: <20260904072052-mutt-send-email-mst@kernel.org>
References: <20260824011420.752806-1-dongli.zhang@oracle.com>
 <aoxY4Rxst2qAyn5z@redhat.com>
 <01ee4841-76d8-4749-a80e-eb945ab8799a@oracle.com>
 <20260903172835.0e253a25@imammedo>
 <20260903160401-mutt-send-email-mst@kernel.org>
 <20260904130709.6769caee@imammedo>
MIME-Version: 1.0
In-Reply-To: <20260904130709.6769caee@imammedo>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yozmuIOw72V5BfXifyuFKjwEZac17kosBAdrafa-GaM_1788520936
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1788520940-A72DCAE4-D74C530F/0/0
X-purgate-type: clean
X-purgate-size: 8918

On Fri, Sep 04, 2026 at 01:07:09PM +0200, Igor Mammedov wrote:
> On Thu, 3 Sep 2026 16:17:20 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Thu, Sep 03, 2026 at 05:28:35PM +0200, Igor Mammedov wrote:
> > > On Wed, 26 Aug 2026 09:15:47 -0700
> > > Dongli Zhang <dongli.zhang@oracle.com> wrote:
> > >   
> > > > On Mon, Aug 24, 2026 7:44:49AM -0700, Daniel P. Berrangé wrote:  
> > > > > On Sun, Aug 23, 2026 at 06:13:30PM -0700, Dongli Zhang wrote:    
> > > > >> Hot-unplugging a PCI device can require cooperation from the guest. For
> > > > >> ACPI PCI hotplug, QEMU notifies the guest through ACPI and the guest
> > > > >> eventually writes the ACPI PCI eject register. For PCIe native hotplug,
> > > > >> QEMU notifies the guest through the PCIe hotplug mechanism and waits for
> > > > >> the slot unplug flow to complete. Only after that completion does QEMU
> > > > >> unrealize the device and emit DEVICE_DELETED.
> > > > >> 
> > > > >> This can leave a device stuck in the unplug pending state when the guest
> > > > >> does not cooperate. Examples include:
> > > > >> 
> > > > >> 1. The guest has panicked, or the relevant ACPI/PCI hotplug driver is
> > > > >> unavailable.
> > > > >> 
> > > > >> 2. The guest is stalled and cannot handle the hot-unplug event. For
> > > > >> example, stalling the Linux [irq/9-acpi] kernel thread can reproduce this
> > > > >> for ACPI-based hot-unplug.
> > > > >> 
> > > > >> 3. The device was attached to a slot that the guest cannot use. For
> > > > >> example, a pcie-root-port only supports slot 0. If a device is added to a
> > > > >> non-zero slot below a pcie-root-port, the guest may never discover the
> > > > >> device and therefore may never complete the unplug request.  
> > > 
> > > all of above is actually expected, no (functioning) driver => no hotplug/unplug.
> > > it's the guest problem. Once device it exposed to guest its life-cycle
> > > not longer owned by QEMU.
> > > 
> > > That's what one would see in real hw as well, you press eject button
> > > but it will not do anything if OS doesn't process it.
> > > also see comment at the end.
> > >   
> > > > >> 
> > > > >> The non-zero slot case has also been discussed in:
> > > > >> 
> > > > >> hw/pci: warn when PCIe device is plugged into non-zero slot of downstream port
> > > > >> https://gitlab.com/qemu-project/qemu/-/commit/    
> > > > > ca92eb5defcf9d1c2106341744a73a03cf26e824    
> > > > >> 
> > > > >> hw/pci: add comment to explain checking for available function 0 in pci hotplug
> > > > >> https://gitlab.com/qemu-project/qemu/-/    
> > > > > commit/67d045a0ef5b9c5f871c3a1d87325a8a42d2b9d5    
> > > > >> 
> > > > >> pci: don't skip function 0 occupancy verification for devfn auto assign
> > > > >> https://gitlab.com/qemu-project/qemu/-/commit/    
> > > > > e228d62b4af29bca698ec57efdceb46f392f5444    
> > > > >> 
> > > > >> For example, if root-port.1 is a pcie-root-port, the following command adds
> > > > >> a vhost-scsi-pci device to an invalid slot:
> > > > >> 
> > > > >> (qemu) device_add vhost-scsi-pci,id=scsi01,wwpn=naa.5001405324af0985,bus=root-port.1,addr=01.0
> > > > >> warning: PCI: slot 1 is not valid for vhost-scsi-pci, parent device only allows plugging into slot 0.    
> > > > > 
> > > > > This rather looks like it should be a fatal error, not a mere warning.
> > > > > 
> > > > > If I follow the commit ca92eb5def it links to https://bugzilla.redhat.com/show_bug.cgi?id=2128929
> > > > > which states that this configuration is going to lead to a crash in
> > > > > QEMU on guest OS shutdown. IMHO that crash is sufficient to justify
> > > > > making this a fatal error.
> > > > > 
> > > > > If we actually wanted this to remain a warning, then that shutdown
> > > > > crash would need to be fixed.
> > > > >     
> > > > 
> > > > Thank you very much!
> > > > 
> > > > I see that the issue has been fixed. The ticket mentions the following.
> > > > 
> > > > "What I am observing is that it seems when the slot ID != 0, the guest OS seems
> > > > to ignore this and we never seem to hit ich9_pm_device_unplug_cb()."
> > > > 
> > > > Based on my experience and evaluation, ACPI-based hotplug is more likely to
> > > > encounter an issue where the guest VM does not respond to an unplug operation.  
> > > 
> > > I'm not sure it's a good idea to delete device when guest still thinks it's there
> > > (you can make guesses on QEMU side if it's in use, how useful those are is questionable).
> > > 
> > > as far as I know, ACPI hotplug has no notion of surprise removal (pls educate me if it's not the case),  
> > 
> > why would it not?
> > 
> > how do you think you can pull a laptop out of a dock?
> > I expect bus check + _STA and config space saying it is gone
> > will do exactly that.
> > 
> > 
> > Here's linux code:
> > static void acpiphp_check_bridge(struct acpiphp_bridge *bridge)
> > {       
> >         struct acpiphp_slot *slot;
> > 
> >         /* Bail out if the bridge is going away. */
> >         if (bridge->is_going_away)
> >                 return;
> > 
> >         if (bridge->pci_dev)
> >                 pm_runtime_get_sync(&bridge->pci_dev->dev);
> >         
> >         list_for_each_entry(slot, &bridge->slots, node) {
> >                 struct pci_bus *bus = slot->bus;
> >                 struct pci_dev *dev, *tmp;
> > 
> >                 if (slot_no_hotplug(slot)) {
> >                         ; /* do nothing */
> >                 } else if (device_status_valid(get_slot_status(slot))) {
> >                         /* remove stale devices if any */
> >                         list_for_each_entry_safe_reverse(dev, tmp,
> >                                                          &bus->devices, bus_list)
> >                                 if (PCI_SLOT(dev->devfn) == slot->device)
> >                                         trim_stale_devices(dev);
> > 
> >                         /* configure all functions */
> >                         enable_slot(slot, true);
> >                 } else {
> >                         disable_slot(slot);
> >                 }
> >         }
> > 
> >         if (bridge->pci_dev)
> >                 pm_runtime_put(&bridge->pci_dev->dev);
> > }
> > 
> > 
> > so weirdly it wants bus check on a parent bus, otherwise it will
> > not trim devices?  probably a bug, but easy to work around.
> 
> Modern docks would use native pcie surprise removal path.
> 
> As for ACPI, my old laptop, had an unlock button => _LCK
> and that relied on OS processing ACPI events, not so surprise.
> 
> There might have been ACPI/hybrid docks that did surprise removal,
> but then one need to find one and model after that instead of 
> just blanket force removal. (likely out come would a doc device
> support only, not an arbitrary device removal)
> 
> (not the case described in this series, though. hence my request to clarify usecase)
> 
> from what I see in spec there is _RMV method that says that device
> supports surprise removal that can be used for devices that support it.
> However I would hesitate very much to blank apply it to every PCI device.
> (it's not even realistic to ask for proving safe tear down across various
> drivers and OSes/versions)
> 
> Rather than a knee jerk treatment of misconfig consequences,
> I'd rather see patches to prevent misconfig in the 1st place
> (subj to deprecation but doable).
> 
> As for the cases where OS mis-behaves (apcihp thread starvation,...),
> fixing guest to follow hotplug contract is a proper place to do it.
> 
> On QEMU side we have it covered as well. If unplug was not processed,
> mgmt is free to repeat action.


Sorry if I am unclear. I just meant that it looks like we
can support surprise removal with ACPI just by reporting
bus check events on the parent.


>  
> > > so I wouldn't do what you are proposing here at all, it's basically asking for disaster to happen.
> > > And all this is basically for dealing with abused qemu flexibility.
> > > 
> > > Please (re)formulate usecase and make it more clear as what is eludes me
> > > no matter how many times i've read this cover letter.
> > > 
> > > On positive note:
> > > 
> > > What you can try to implement is native PCI-E support for surprise removal.
> > > How hard that would be I don't know. And I would well expect if one deviates from
> > > real hw expectations/configs (such as not 0 slot/partial func removal),
> > > one would quickly stumble upon issues as  that's not what what vendors write/test
> > > drivers for.
> > > 
> > > Even if it's not likely to be used in practice (guest still might not support it),
> > > it may serve as test-bed for guest drivers.
> > >   
> > > > Thank you very much!
> > > > 
> > > > Dongli Zhang
> > > >   
> > 


