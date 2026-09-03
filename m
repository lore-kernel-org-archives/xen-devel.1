Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FD5C624D7
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 20:17:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407665.1640615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2DsM-0002bU-BN; Thu, 03 Sep 2026 20:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407665.1640615; Thu, 03 Sep 2026 20:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2DsM-0002bN-7y; Thu, 03 Sep 2026 20:17:34 +0000
Received: by outflank-mailman (input) for mailman id 1407665;
 Thu, 03 Sep 2026 20:17:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mst@redhat.com>) id 1x2DsK-0002b8-ML
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 20:17:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2DsI-008TeF-QV
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 22:17:30 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mst@redhat.com>)
 id 6a99d5b6-8faa-0a2a0a5109dd-0a2a450498c4-42
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 22:17:30 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mst@redhat.com>)
 id 6a99d5d9-b57f-0a2a45040019-aa0a857c5b9b-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 22:17:30 +0200
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-8pBVAKiHPSeoYsmz6NBrmA-1; Thu, 03 Sep 2026 16:17:27 -0400
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-49b7c1dc61eso2585915e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:17:27 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee6158e9sm96154145e9.12.2026.09.03.13.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 13:17:25 -0700 (PDT)
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
	s=mimecast20190719; t=1788466649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D24gK67PaiLCP7h+ayMzbPrsYL1do2o4/gKLggEB7CE=;
	b=As7kjHAC4f0S4qAOu7zTIlkij9l2NjoOc0M/d1dQDeVqo05zIxtR6rinY7o41eZfXbMN8h
	Qc1Lz8Qf5bwOiL3RgBZyxHPmlxORnfaSqlpZTsNzJgSX2vGbFO/3H5Ac9srlw0JNL3YuUI
	Khr1C7CEPqu5VYAwa1i7nYlOr6tKZIM=
X-MC-Unique: 8pBVAKiHPSeoYsmz6NBrmA-1
X-Mimecast-MFC-AGG-ID: 8pBVAKiHPSeoYsmz6NBrmA_1788466646
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788466646; x=1789071446;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D24gK67PaiLCP7h+ayMzbPrsYL1do2o4/gKLggEB7CE=;
        b=KydcuZkt7lpAZl8SBUb/qwMoxb6WATe+RgvAX1iXI940jLaCXYhkcLlL6HiHra/034
         yXTAlXRhkBXDQDUi4+TcmEv6DwpE6iN6Gr52Xcn2FyYkoDEm8GOCrFQTNjZPLh3o4wEW
         z7ZG32QyrIUVRZdCgCv99ffcvDdkhpODq3nIPXYiFMxGYtuozylDpuYZ/kwn8K0C618b
         GwYRJH2nUGC9FzI7H7Ll+eF2SZUvrgXeidn0SLe9XqssWb81Frplt1SSpyi0KU50VHX9
         qObHrwDQx8510K1L/gRIx7AdBdSIWu06bBrkvWQ1El43sEEYhBtxev956wwurmoOlQP5
         41og==
X-Forwarded-Encrypted: i=1; AKwUvBwSxyZh5dUSeFP8NKoAvsvL4DqMbLa1r5fhGAcV3F/aaWwkCJ+Xu+B1RJ49f+Oh6/wFLojyqtkqlfE=@lists.xenproject.org
X-Gm-Message-State: AFuF++mp+VY7mN+oxfPsT/yk6bOoI2UX3giyV+N4PMhuje+iWVX4WoLr
	sXJ3pCMOaBG2HjB1m07kgPOQiHa48X92ChsToC/wCXEB5DDuMnmMDqQNUcok9d33ctpAERptbXu
	ZY6AaOmzMBeyN5wkrI1l65VfnwzlmqzlckJZoFmHPvWdMbcnzfKd3Die3grzvXpOVU8Bu
X-Gm-Gg: AYBFou3pQhvr0OGBhtyMqlOe1KP8e5Qw0KrRXlW6lYkr0peCNbfnbqjHbhTGBKw162L
	78J3cPPD5u8PFY1/emvpkunrJw6VJxqxtq+0N4Ad4Hb8mVFlky8YFY5bNPzbPxpo6qVLF32zXC8
	FIMIiGkwbiweF42CLWGIO1JzYf0oaq5wnVFyv4VcsaiaHrm1KTxGlyA4lPsL1JgSTO4eBVaQkjX
	1sOQoqrQsc3wICoHj4G6Wk7wajg9pXAZP85Lm8JZLng6NvRdVmZ0GdCvj6E7Y1H5F5OhSFmiNj3
	i5Ab727KGoL66+8ftiSGLmTi3Ouv1ArWKg1mOZie55AIwCvDrCUOCvKV3xwqQtkJNmfiFFGsPld
	Zz2o47+7p1i9juPeeFVp0gCU=
X-Received: by 2002:a05:600c:8b05:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-49cf82787camr7856025e9.15.1788466646251;
        Thu, 03 Sep 2026 13:17:26 -0700 (PDT)
X-Received: by 2002:a05:600c:8b05:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-49cf82787camr7855325e9.15.1788466645715;
        Thu, 03 Sep 2026 13:17:25 -0700 (PDT)
Date: Thu, 3 Sep 2026 16:17:20 -0400
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
Message-ID: <20260903160401-mutt-send-email-mst@kernel.org>
References: <20260824011420.752806-1-dongli.zhang@oracle.com>
 <aoxY4Rxst2qAyn5z@redhat.com>
 <01ee4841-76d8-4749-a80e-eb945ab8799a@oracle.com>
 <20260903172835.0e253a25@imammedo>
MIME-Version: 1.0
In-Reply-To: <20260903172835.0e253a25@imammedo>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EAh02STIwY8mYAYNjkdh-89iPgDAiRh1oc3sXZI54ZU_1788466646
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1788466650-585C7B50-598268B2/0/0
X-purgate-type: clean
X-purgate-size: 6661

On Thu, Sep 03, 2026 at 05:28:35PM +0200, Igor Mammedov wrote:
> On Wed, 26 Aug 2026 09:15:47 -0700
> Dongli Zhang <dongli.zhang@oracle.com> wrote:
> 
> > On Mon, Aug 24, 2026 7:44:49AM -0700, Daniel P. Berrangé wrote:
> > > On Sun, Aug 23, 2026 at 06:13:30PM -0700, Dongli Zhang wrote:  
> > >> Hot-unplugging a PCI device can require cooperation from the guest. For
> > >> ACPI PCI hotplug, QEMU notifies the guest through ACPI and the guest
> > >> eventually writes the ACPI PCI eject register. For PCIe native hotplug,
> > >> QEMU notifies the guest through the PCIe hotplug mechanism and waits for
> > >> the slot unplug flow to complete. Only after that completion does QEMU
> > >> unrealize the device and emit DEVICE_DELETED.
> > >> 
> > >> This can leave a device stuck in the unplug pending state when the guest
> > >> does not cooperate. Examples include:
> > >> 
> > >> 1. The guest has panicked, or the relevant ACPI/PCI hotplug driver is
> > >> unavailable.
> > >> 
> > >> 2. The guest is stalled and cannot handle the hot-unplug event. For
> > >> example, stalling the Linux [irq/9-acpi] kernel thread can reproduce this
> > >> for ACPI-based hot-unplug.
> > >> 
> > >> 3. The device was attached to a slot that the guest cannot use. For
> > >> example, a pcie-root-port only supports slot 0. If a device is added to a
> > >> non-zero slot below a pcie-root-port, the guest may never discover the
> > >> device and therefore may never complete the unplug request.
> 
> all of above is actually expected, no (functioning) driver => no hotplug/unplug.
> it's the guest problem. Once device it exposed to guest its life-cycle
> not longer owned by QEMU.
> 
> That's what one would see in real hw as well, you press eject button
> but it will not do anything if OS doesn't process it.
> also see comment at the end.
> 
> > >> 
> > >> The non-zero slot case has also been discussed in:
> > >> 
> > >> hw/pci: warn when PCIe device is plugged into non-zero slot of downstream port
> > >> https://gitlab.com/qemu-project/qemu/-/commit/  
> > > ca92eb5defcf9d1c2106341744a73a03cf26e824  
> > >> 
> > >> hw/pci: add comment to explain checking for available function 0 in pci hotplug
> > >> https://gitlab.com/qemu-project/qemu/-/  
> > > commit/67d045a0ef5b9c5f871c3a1d87325a8a42d2b9d5  
> > >> 
> > >> pci: don't skip function 0 occupancy verification for devfn auto assign
> > >> https://gitlab.com/qemu-project/qemu/-/commit/  
> > > e228d62b4af29bca698ec57efdceb46f392f5444  
> > >> 
> > >> For example, if root-port.1 is a pcie-root-port, the following command adds
> > >> a vhost-scsi-pci device to an invalid slot:
> > >> 
> > >> (qemu) device_add vhost-scsi-pci,id=scsi01,wwpn=naa.5001405324af0985,bus=root-port.1,addr=01.0
> > >> warning: PCI: slot 1 is not valid for vhost-scsi-pci, parent device only allows plugging into slot 0.  
> > > 
> > > This rather looks like it should be a fatal error, not a mere warning.
> > > 
> > > If I follow the commit ca92eb5def it links to https://bugzilla.redhat.com/show_bug.cgi?id=2128929
> > > which states that this configuration is going to lead to a crash in
> > > QEMU on guest OS shutdown. IMHO that crash is sufficient to justify
> > > making this a fatal error.
> > > 
> > > If we actually wanted this to remain a warning, then that shutdown
> > > crash would need to be fixed.
> > >   
> > 
> > Thank you very much!
> > 
> > I see that the issue has been fixed. The ticket mentions the following.
> > 
> > "What I am observing is that it seems when the slot ID != 0, the guest OS seems
> > to ignore this and we never seem to hit ich9_pm_device_unplug_cb()."
> > 
> > Based on my experience and evaluation, ACPI-based hotplug is more likely to
> > encounter an issue where the guest VM does not respond to an unplug operation.
> 
> I'm not sure it's a good idea to delete device when guest still thinks it's there
> (you can make guesses on QEMU side if it's in use, how useful those are is questionable).
> 
> as far as I know, ACPI hotplug has no notion of surprise removal (pls educate me if it's not the case),

why would it not?

how do you think you can pull a laptop out of a dock?
I expect bus check + _STA and config space saying it is gone
will do exactly that.


Here's linux code:
static void acpiphp_check_bridge(struct acpiphp_bridge *bridge)
{       
        struct acpiphp_slot *slot;

        /* Bail out if the bridge is going away. */
        if (bridge->is_going_away)
                return;

        if (bridge->pci_dev)
                pm_runtime_get_sync(&bridge->pci_dev->dev);
        
        list_for_each_entry(slot, &bridge->slots, node) {
                struct pci_bus *bus = slot->bus;
                struct pci_dev *dev, *tmp;

                if (slot_no_hotplug(slot)) {
                        ; /* do nothing */
                } else if (device_status_valid(get_slot_status(slot))) {
                        /* remove stale devices if any */
                        list_for_each_entry_safe_reverse(dev, tmp,
                                                         &bus->devices, bus_list)
                                if (PCI_SLOT(dev->devfn) == slot->device)
                                        trim_stale_devices(dev);

                        /* configure all functions */
                        enable_slot(slot, true);
                } else {
                        disable_slot(slot);
                }
        }

        if (bridge->pci_dev)
                pm_runtime_put(&bridge->pci_dev->dev);
}


so weirdly it wants bus check on a parent bus, otherwise it will
not trim devices?  probably a bug, but easy to work around.


> so I wouldn't do what you are proposing here at all, it's basically asking for disaster to happen.
> And all this is basically for dealing with abused qemu flexibility.
> 
> Please (re)formulate usecase and make it more clear as what is eludes me
> no matter how many times i've read this cover letter.
> 
> On positive note:
> 
> What you can try to implement is native PCI-E support for surprise removal.
> How hard that would be I don't know. And I would well expect if one deviates from
> real hw expectations/configs (such as not 0 slot/partial func removal),
> one would quickly stumble upon issues as  that's not what what vendors write/test
> drivers for.
> 
> Even if it's not likely to be used in practice (guest still might not support it),
> it may serve as test-bed for guest drivers.
> 
> > Thank you very much!
> > 
> > Dongli Zhang
> > 


