Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA25C79F9E
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2026 08:56:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410686.1641479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3V8t-0004SN-5N; Mon, 07 Sep 2026 08:55:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410686.1641479; Mon, 07 Sep 2026 08:55:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3V8t-0004SG-1l; Mon, 07 Sep 2026 08:55:55 +0000
Received: by outflank-mailman (input) for mailman id 1410686;
 Mon, 07 Sep 2026 08:55:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <mst@redhat.com>) id 1x3V8r-0004S8-Fd
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 08:55:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3V8q-007t7b-3V
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2026 10:55:52 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <mst@redhat.com>)
 id 6a9e7c10-2eae-0a2a0a5409dd-0a2a45068424-26
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 10:55:51 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <mst@redhat.com>)
 id 6a9e7c16-195a-0a2a45060019-aa0a817c99cf-3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 10:55:51 +0200
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-pH3RCcqBM0-dUY0gV0E7gg-1; Mon, 07 Sep 2026 04:55:49 -0400
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-47f4bff865cso1763819f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Sep 2026 01:55:48 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883c5bc5sm28593436f8f.24.2026.09.07.01.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2026 01:55:46 -0700 (PDT)
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
	s=mimecast20190719; t=1788771350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z5bsH4JVOIdSG44t0GSgJUXlu2Xpc7hHFUMLKgNg5Gg=;
	b=VvKIO4SQ64CWg7Dlsie7LC00If58JGEBJ10v7R13ocdlJ5Zi1LaJeaaUDsS/0uGEJPc4v6
	FQ6PQE+A5IwkjszpouY32jYpGd7bdSlWMpzL4+/uOMxO41ArwZCHuDCF8IqUoJOkfaogRA
	Zi4L4JPZgYB4yLjmbQnk4yBEE/mSXZw=
X-MC-Unique: pH3RCcqBM0-dUY0gV0E7gg-1
X-Mimecast-MFC-AGG-ID: pH3RCcqBM0-dUY0gV0E7gg_1788771348
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788771348; x=1789376148;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=z5bsH4JVOIdSG44t0GSgJUXlu2Xpc7hHFUMLKgNg5Gg=;
        b=MadrBfZN6Y4Svz2uuAUlDJPLdm6RjZeFMaWaahK4b919zu1xk0M+ZusEW0vwC1Gx0+
         uvtK/4in3IXRMfhLEZEP3b/96da4Lz92f3FpLkcMJ1zadOR/yJce4kCGslghrg5GOg/p
         cCdXZ++BCH5HlDEIUGrBWUTfzeNycBsnG0L+hx6KBJeJ5dR9MI1p2PROoS7aYnWAqww4
         h2NdlVWNmeXwZyYe3HxlJujuW+sM7gmOE+OiKxzJiDCxiunG1NbYUK9Rhw5fmMnVcJM1
         +2wBrW7g/xauEamoRXwNkwIjLhjH/pfCxrjNHXSrLCWn9ZO01IPE30Hh9bHS5O7HZm3V
         KW0A==
X-Forwarded-Encrypted: i=1; AKwUvByulgY7aQMSWFsdilGPcTdcxMpU7rWvCF0i3e7de3NKVDn2kjjGo9va9mHRdMDutDkhS0SWaGf5Cxg=@lists.xenproject.org
X-Gm-Message-State: AFuF++mpOD+So4wLCLvkuM2lEplZtNCjfcoCuRaV1OPTDw8RIZXG2vMi
	LssyaDs85m9Oc94SlSvpq8rwtrnHo6A/izu9SDtHnopJWJSkXPq5WlJAcXcGEzLCnIITNR6md89
	PecE1loF1rjKVpO2GMgSeubmZmysmB+hT4tSPdKTiYd5zm+E/BYn9gAUMplYpiyNgDvl1
X-Gm-Gg: AYBFou2otCaZjPeJBPO/gKnH8UEvWgqkq9YDl0MHbqBKS2/UNTk+nzEApahe8fScYd+
	bbmrSK2+v25+Q5xfAaNbjB9zXraZqKew5DkBU1ZXG/AVAXMTwhQQ+Nx5dBEhNhKjN00pqC5Lh/g
	UDmC3/64H3cyyqWWjABt2eG2jCwwiFmI9TBHQ+So1kWv3xOr8PFwdUI73M7kzUEalFYQTfZuNC9
	TwN1lzeFOk2zJ8weK0tORVYJ2IaiMIA0gVTzTQy7RtSgbsKUDyXwOaqBsYwrMDvleIzprqb48OP
	dwpOtIUCiyWpL7+W/wtvSMJuGbWHctbgXUUscHjIS/1/X9yxCjLFtWMYLe4RBjhng+RRrd4XEYO
	NcekWonYK10KkCs178LK5aJs=
X-Received: by 2002:a05:6000:1acb:b0:485:8b5d:96d with SMTP id ffacd0b85a97d-4858b5d0d2dmr33824029f8f.19.1788771347747;
        Mon, 07 Sep 2026 01:55:47 -0700 (PDT)
X-Received: by 2002:a05:6000:1acb:b0:485:8b5d:96d with SMTP id ffacd0b85a97d-4858b5d0d2dmr33823972f8f.19.1788771347225;
        Mon, 07 Sep 2026 01:55:47 -0700 (PDT)
Date: Mon, 7 Sep 2026 04:55:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: Igor Mammedov <imammedo@redhat.com>,
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
Message-ID: <20260907044608-mutt-send-email-mst@kernel.org>
References: <20260824011420.752806-1-dongli.zhang@oracle.com>
 <aoxY4Rxst2qAyn5z@redhat.com>
 <01ee4841-76d8-4749-a80e-eb945ab8799a@oracle.com>
 <20260903172835.0e253a25@imammedo>
 <6154b857-16b3-476b-a2cb-8837464dd4cb@oracle.com>
MIME-Version: 1.0
In-Reply-To: <6154b857-16b3-476b-a2cb-8837464dd4cb@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EtH5O6Ew4p8Dq20iqk_OScyHyLNmcNRZFDDy31Cd6fA_1788771348
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1788771351-1FACA77B-E0EC0B94/0/0
X-purgate-type: clean
X-purgate-size: 6402

On Mon, Sep 07, 2026 at 01:26:57AM -0700, Dongli Zhang wrote:
> 
> 
> On Thu, Sep 3, 2026 8:28:35AM -0700, Igor Mammedov wrote:
> > On Wed, 26 Aug 2026 09:15:47 -0700
> > Dongli Zhang <dongli.zhang@oracle.com> wrote:
> > 
> >> On Mon, Aug 24, 2026 7:44:49AM -0700, Daniel P. Berrangé wrote:
> >> > On Sun, Aug 23, 2026 at 06:13:30PM -0700, Dongli Zhang wrote:  
> >> >> Hot-unplugging a PCI device can require cooperation from the guest. For
> >> >> ACPI PCI hotplug, QEMU notifies the guest through ACPI and the guest
> >> >> eventually writes the ACPI PCI eject register. For PCIe native hotplug,
> >> >> QEMU notifies the guest through the PCIe hotplug mechanism and waits for
> >> >> the slot unplug flow to complete. Only after that completion does QEMU
> >> >> unrealize the device and emit DEVICE_DELETED.
> >> >> 
> >> >> This can leave a device stuck in the unplug pending state when the guest
> >> >> does not cooperate. Examples include:
> >> >> 
> >> >> 1. The guest has panicked, or the relevant ACPI/PCI hotplug driver is
> >> >> unavailable.
> >> >> 
> >> >> 2. The guest is stalled and cannot handle the hot-unplug event. For
> >> >> example, stalling the Linux [irq/9-acpi] kernel thread can reproduce this
> >> >> for ACPI-based hot-unplug.
> >> >> 
> >> >> 3. The device was attached to a slot that the guest cannot use. For
> >> >> example, a pcie-root-port only supports slot 0. If a device is added to a
> >> >> non-zero slot below a pcie-root-port, the guest may never discover the
> >> >> device and therefore may never complete the unplug request.
> > 
> > all of above is actually expected, no (functioning) driver => no hotplug/unplug.
> > it's the guest problem. Once device it exposed to guest its life-cycle
> > not longer owned by QEMU.
> > 
> > That's what one would see in real hw as well, you press eject button
> > but it will not do anything if OS doesn't process it.
> > also see comment at the end.
> 
> Users are generally more tolerant of issues with real hardware.
> 
> In virtualization and cloud environments, PCI hotplug is more commonly used for
> NICs and storage devices. Users are less tolerant of disruption or unexpected
> failures.


Simply put, surprise removal exists in the hardware.  Emulating that
makes sense, at a high level. Nor is it too hard.
However, guests, especially Linux, do not
handle it all that well generally. Exactly because users
would tend to impatiently reach for that tool, then
blame QEMU after a crash, we avoided emulating that.


I'd expect much more in the way of research into how guests behave,
perhaps some ways to limit it to devices that work well, and
likely some linux patches to make it work better, before we commit to
supporting such interfaces.


> > 
> >> >> 
> >> >> The non-zero slot case has also been discussed in:
> >> >> 
> 
> [snip]
> 
> >> >   
> >> 
> >> Thank you very much!
> >> 
> >> I see that the issue has been fixed. The ticket mentions the following.
> >> 
> >> "What I am observing is that it seems when the slot ID != 0, the guest OS seems
> >> to ignore this and we never seem to hit ich9_pm_device_unplug_cb()."
> >> 
> >> Based on my experience and evaluation, ACPI-based hotplug is more likely to
> >> encounter an issue where the guest VM does not respond to an unplug operation.
> > 
> > I'm not sure it's a good idea to delete device when guest still thinks it's there
> > (you can make guesses on QEMU side if it's in use, how useful those are is questionable).
> 
> By instrumenting the QEMU functions related to device hotplug and PCI
> initialization, we may be able to make informed assumptions.

So try. But just know that pci initialization is commonly done by firmware, not
the driver.

> > 
> > as far as I know, ACPI hotplug has no notion of surprise removal (pls educate me if it's not the case),
> > so I wouldn't do what you are proposing here at all, it's basically asking for disaster to happen.
> > And all this is basically for dealing with abused qemu flexibility.
> > 
> > Please (re)formulate usecase and make it more clear as what is eludes me
> > no matter how many times i've read this cover letter.
> 
> Here are some use cases in virtualization and cloud environments:
> 
> 1. Suppose there is a QEMU user configuration error and a PCI device is attached
> to slot 1 of a pcie-root-port that uses ACPI-based hotplug. The device may not
> be detected or ejected. As a result, there is no way to detach it from the
> user's QEMU instance until the guest VM reboots.

sounds vague. if users can not configure qemu what are the chances
they will use force detach responsibly?

> 2. For an unknown reason in the customer's guest kernel (Linux, Windows, or
> BSD), a PCI device may still be referenced by the guest kernel or its services.
> As a result, the guest never writes the eject register for ACPI-based hotplug,
> and QEMU cannot detach the device. The customer may blame QEMU for not removing
> it. A force-detach option could provide an escape hatch, with a warning that it
> may make the VM unstable or insecure.

So just reboot the guest.

> 3. Suppose a VM is stuck because of a guest kernel bug, such as a Linux kernel
> panic without a kdump kernel being triggered. The guest kernel is unresponsive.
> Force detach could allow the block device to be temporarily attached to another
> VM without resetting the currently panicked VM.

So just reboot the guest.

> 4. Provide a mechanism to demonstrate that force detach is unsafe. Otherwise,
> users may repeatedly attempt it and mistakenly conclude that QEMU is at fault :)

We have that - we don't support unsafe detach.

> Thank you very much!
> 
> Dongli Zhang
> 
> > 
> > On positive note:
> > 
> > What you can try to implement is native PCI-E support for surprise removal.
> > How hard that would be I don't know. And I would well expect if one deviates from
> > real hw expectations/configs (such as not 0 slot/partial func removal),
> > one would quickly stumble upon issues as  that's not what what vendors write/test
> > drivers for.
> > 
> > Even if it's not likely to be used in practice (guest still might not support it),
> > it may serve as test-bed for guest drivers.
> > 
> >> Thank you very much!
> >> 
> >> Dongli Zhang
> >> 
> > 


