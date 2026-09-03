Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1704C624A4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 15:29:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407467.1640542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x29Ms-0003cg-8V; Thu, 03 Sep 2026 15:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407467.1640542; Thu, 03 Sep 2026 15:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x29Ms-0003cZ-5i; Thu, 03 Sep 2026 15:28:46 +0000
Received: by outflank-mailman (input) for mailman id 1407467;
 Thu, 03 Sep 2026 15:28:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <imammedo@redhat.com>) id 1x29Mq-0003cT-Ni
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 15:28:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x29Mq-00AwBe-44
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 17:28:44 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <imammedo@redhat.com>)
 id 6a9991f5-8faa-0a2a0a5109dd-0a2a4504a9e2-44
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 17:28:43 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <imammedo@redhat.com>)
 id 6a99922a-b57f-0a2a45040019-aa0a817c79f5-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 17:28:43 +0200
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-fVqUXbuQNIil-MQnG6u7yw-1; Thu, 03 Sep 2026 11:28:41 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-496bbcf7d1eso36475e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 08:28:40 -0700 (PDT)
Received: from imammedo ([213.175.37.14]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee5f9114sm76185195e9.5.2026.09.03.08.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 08:28:38 -0700 (PDT)
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
	s=mimecast20190719; t=1788449322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ztegjQ1POBwSGppr2l4gUAmCFrMM6q1VpOdlFUL088=;
	b=b/sDAEPVf0uefwEp/SVroNz0zUBQVs8w9zkIPOLO8togYDTGVt4FYjOTIBz9vDLtp6Viwj
	pclyKzXXBX5xnyD13e913aexS6QD1N3MVtxN9kvTlYR2uf3hoLsiShpPOU5z++qgop6j2q
	R2uLq9LCF1667d90yqHu7rliGMydpH8=
X-MC-Unique: fVqUXbuQNIil-MQnG6u7yw-1
X-Mimecast-MFC-AGG-ID: fVqUXbuQNIil-MQnG6u7yw_1788449320
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449320; x=1789054120;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zZlgcpyErJlCEJFwxXWLl2G2MJ6RenYBs5jbw6Dpw5Q=;
        b=LBI40bttvsxgoPXsBwcnIw9Dlau1+jDcaNpoI94agoOxCYV/VFJh7dyPM4bsE9O6Pf
         JtWG+sZlxsbqmhDsUkPMchl42sE/M8j7suwww+jsHzzZwnnKwjfWhPbvm6Qh9M8ZGZ7k
         0PamDY9hcfeeXUN1a4Tc2cH9+XQ3n5M3lFljx4nWjpTXHBe8ovTm2gllHZE3lKA+b/Xx
         YMv/nMKTYAoK5bnf92cj5lxyA04RKzzk9IerPYFlJYeSkknea3MMGXyKFI0qB56in2nG
         w8BA62gqjiQ54fp44wn8cBd/RoomKx8Y4c/q28n+Q9nq+QYQBXrQ7Ob0Yco0nOxOdAIR
         oFvA==
X-Forwarded-Encrypted: i=1; AKwUvBxrfAMOAo2i/fuU5B71mJ3dbediYRSSYDounoxDENCksXVBsek/4+kbtF7yIrPQU1WQmpsBIKp3hKU=@lists.xenproject.org
X-Gm-Message-State: AFuF++lBLLovVjCG/w5GwQcns9K4su+wkYLHopRJPnkRu+KB+4N33Z3T
	VM4URQnIEFdGfd0o0xSeNyQxSZbCjdgSOWjCkP7FF408S5SV4Bd9IlHq5gog+uTIp+ua3hG2xpF
	Ag5GLlod4wJ3Q32ZNhHQhMC1qzI3gmtAck2c/+dafRnPxd0kUt1KMCXKZxRCdTG0NGxk4S/fC+3
	AJ
X-Gm-Gg: AYBFou3bnREqMRI2dWbVeZ7SUczVPVBz6r3/RBP6rc4QujjI8B/VE0knnlV/jj8hqQJ
	YLGBcxlROe7VxXtvPzCOOfX+8mWneR7W/xKQSqwO9fwmx/6qgJCqASdXMFMwcl2JS4rvs80+uf0
	bfd2Am3p5F1Tlzci1RBkLTtrkmMwIgYLfCely7cWaZEjc+30AufjHKHogcUarARixaMvQbC/DsA
	n2HvmiCAtaZF3SYXg9vnmr1AogBC5fLr2idWazov4JIn75+LLlfQZDvrQ6hbc47t8795ZYGAQ+9
	8jk1of/R413Ys0Y91/mmSj572JA0YuJ792T2AKRZosMi
X-Received: by 2002:a05:600c:81c9:b0:49c:df2b:15fc with SMTP id 5b1f17b1804b1-49cf5b79c84mr17210205e9.8.1788449319984;
        Thu, 03 Sep 2026 08:28:39 -0700 (PDT)
X-Received: by 2002:a05:600c:81c9:b0:49c:df2b:15fc with SMTP id 5b1f17b1804b1-49cf5b79c84mr17209195e9.8.1788449319587;
        Thu, 03 Sep 2026 08:28:39 -0700 (PDT)
Date: Thu, 3 Sep 2026 17:28:35 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 xen-devel@lists.xenproject.org, dave@treblig.org, mst@redhat.com,
 anisinha@redhat.com, philmd@mailo.com, aurelien@aurel32.net,
 mjrosato@linux.ibm.com, alifm@linux.ibm.com, farman@linux.ibm.com,
 richard.henderson@linaro.org, iii@linux.ibm.com, david@kernel.org,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com, cohuck@redhat.com,
 alex@shazbot.org, clg@redhat.com, akrowiak@linux.ibm.com,
 jjherne@linux.ibm.com, sstabellini@kernel.org, anthony@xenproject.org,
 edgar.iglesias@gmail.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, joe.jin@oracle.com
Subject: Re: [PATCH 0/8] Force detach PCI devices for ACPI-based and PCIe
 native hot-unplug
Message-ID: <20260903172835.0e253a25@imammedo>
In-Reply-To: <01ee4841-76d8-4749-a80e-eb945ab8799a@oracle.com>
References: <20260824011420.752806-1-dongli.zhang@oracle.com>
	<aoxY4Rxst2qAyn5z@redhat.com>
	<01ee4841-76d8-4749-a80e-eb945ab8799a@oracle.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BvBP7bAlVza0ri1EfJZlH_Jan3Gbj_-4GQP_VVq2Ahg_1788449320
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1788449323-C3AC0B50-0B122C6C/0/0
X-purgate-type: clean
X-purgate-size: 4919

On Wed, 26 Aug 2026 09:15:47 -0700
Dongli Zhang <dongli.zhang@oracle.com> wrote:

> On Mon, Aug 24, 2026 7:44:49AM -0700, Daniel P. Berrang=C3=A9 wrote:
> > On Sun, Aug 23, 2026 at 06:13:30PM -0700, Dongli Zhang wrote: =20
> >> Hot-unplugging a PCI device can require cooperation from the guest. Fo=
r
> >> ACPI PCI hotplug, QEMU notifies the guest through ACPI and the guest
> >> eventually writes the ACPI PCI eject register. For PCIe native hotplug=
,
> >> QEMU notifies the guest through the PCIe hotplug mechanism and waits f=
or
> >> the slot unplug flow to complete. Only after that completion does QEMU
> >> unrealize the device and emit DEVICE_DELETED.
> >>=20
> >> This can leave a device stuck in the unplug pending state when the gue=
st
> >> does not cooperate. Examples include:
> >>=20
> >> 1. The guest has panicked, or the relevant ACPI/PCI hotplug driver is
> >> unavailable.
> >>=20
> >> 2. The guest is stalled and cannot handle the hot-unplug event. For
> >> example, stalling the Linux [irq/9-acpi] kernel thread can reproduce t=
his
> >> for ACPI-based hot-unplug.
> >>=20
> >> 3. The device was attached to a slot that the guest cannot use. For
> >> example, a pcie-root-port only supports slot 0. If a device is added t=
o a
> >> non-zero slot below a pcie-root-port, the guest may never discover the
> >> device and therefore may never complete the unplug request.

all of above is actually expected, no (functioning) driver =3D> no hotplug/=
unplug.
it's the guest problem. Once device it exposed to guest its life-cycle
not longer owned by QEMU.

That's what one would see in real hw as well, you press eject button
but it will not do anything if OS doesn't process it.
also see comment at the end.

> >>=20
> >> The non-zero slot case has also been discussed in:
> >>=20
> >> hw/pci: warn when PCIe device is plugged into non-zero slot of downstr=
eam port
> >> https://gitlab.com/qemu-project/qemu/-/commit/ =20
> > ca92eb5defcf9d1c2106341744a73a03cf26e824 =20
> >>=20
> >> hw/pci: add comment to explain checking for available function 0 in pc=
i hotplug
> >> https://gitlab.com/qemu-project/qemu/-/ =20
> > commit/67d045a0ef5b9c5f871c3a1d87325a8a42d2b9d5 =20
> >>=20
> >> pci: don't skip function 0 occupancy verification for devfn auto assig=
n
> >> https://gitlab.com/qemu-project/qemu/-/commit/ =20
> > e228d62b4af29bca698ec57efdceb46f392f5444 =20
> >>=20
> >> For example, if root-port.1 is a pcie-root-port, the following command=
 adds
> >> a vhost-scsi-pci device to an invalid slot:
> >>=20
> >> (qemu) device_add vhost-scsi-pci,id=3Dscsi01,wwpn=3Dnaa.5001405324af09=
85,bus=3Droot-port.1,addr=3D01.0
> >> warning: PCI: slot 1 is not valid for vhost-scsi-pci, parent device on=
ly allows plugging into slot 0. =20
> >=20
> > This rather looks like it should be a fatal error, not a mere warning.
> >=20
> > If I follow the commit ca92eb5def it links to https://bugzilla.redhat.c=
om/show_bug.cgi?id=3D2128929
> > which states that this configuration is going to lead to a crash in
> > QEMU on guest OS shutdown. IMHO that crash is sufficient to justify
> > making this a fatal error.
> >=20
> > If we actually wanted this to remain a warning, then that shutdown
> > crash would need to be fixed.
> >  =20
>=20
> Thank you very much!
>=20
> I see that the issue has been fixed. The ticket mentions the following.
>=20
> "What I am observing is that it seems when the slot ID !=3D 0, the guest =
OS seems
> to ignore this and we never seem to hit ich9_pm_device_unplug_cb()."
>=20
> Based on my experience and evaluation, ACPI-based hotplug is more likely =
to
> encounter an issue where the guest VM does not respond to an unplug opera=
tion.

I'm not sure it's a good idea to delete device when guest still thinks it's=
 there
(you can make guesses on QEMU side if it's in use, how useful those are is =
questionable).

as far as I know, ACPI hotplug has no notion of surprise removal (pls educa=
te me if it's not the case),
so I wouldn't do what you are proposing here at all, it's basically asking =
for disaster to happen.
And all this is basically for dealing with abused qemu flexibility.

Please (re)formulate usecase and make it more clear as what is eludes me
no matter how many times i've read this cover letter.

On positive note:

What you can try to implement is native PCI-E support for surprise removal.
How hard that would be I don't know. And I would well expect if one deviate=
s from
real hw expectations/configs (such as not 0 slot/partial func removal),
one would quickly stumble upon issues as  that's not what what vendors writ=
e/test
drivers for.

Even if it's not likely to be used in practice (guest still might not suppo=
rt it),
it may serve as test-bed for guest drivers.

> Thank you very much!
>=20
> Dongli Zhang
>=20


