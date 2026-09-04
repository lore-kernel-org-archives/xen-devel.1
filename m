Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95289C624DE
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 12:08:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408373.1640985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Sij-0006WC-Io; Fri, 04 Sep 2026 12:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408373.1640985; Fri, 04 Sep 2026 12:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2Sij-0006W5-FC; Fri, 04 Sep 2026 12:08:37 +0000
Received: by outflank-mailman (input) for mailman id 1408373;
 Fri, 04 Sep 2026 12:08:35 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <imammedo@redhat.com>) id 1x2Sih-0006UH-E8
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 12:08:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2Sif-009hoY-EO
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 14:08:33 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <imammedo@redhat.com>)
 id 6a9ab4b5-2eae-0a2a0a5409dd-0a2a450abcc0-28
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 14:08:33 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <imammedo@redhat.com>)
 id 6a9ab4bf-f2d2-0a2a450a0019-aa0a817ca5f5-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 14:08:33 +0200
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-6iCtdctEP_6asNWKVLSgMA-1; Fri, 04 Sep 2026 08:08:30 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-49ccfad90f1so6533275e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 05:08:30 -0700 (PDT)
Received: from imammedo ([213.175.37.14]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce831af89sm120170135e9.1.2026.09.04.05.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:08:27 -0700 (PDT)
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
	s=mimecast20190719; t=1788523711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uiO1euU//keMnRJ/+D7RSwnTPu9S3MPbCCFcroBKMjc=;
	b=SSEHdeKi6/pRJkZGYmFGALqwHAAbD16v16gam/BpZ67XDCzd5UFy6cIBlgUl2wVmrvL3jZ
	9aMB64aZ8Qn0MyYGBTnq5lXQI+zCXGcC8VHNHFPm6VLZI1AbLY7eI30i4nuhc2wbq3UKTC
	FKaTsu+Ol9g/cM+P8TnIetpSeqh5Di4=
X-MC-Unique: 6iCtdctEP_6asNWKVLSgMA-1
X-Mimecast-MFC-AGG-ID: 6iCtdctEP_6asNWKVLSgMA_1788523709
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523709; x=1789128509;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Exst7EJqJQoSBYryil+QQ12+6GqWDbDrhmxI8WakeCY=;
        b=Gft0o2ucOqc+k4HWq5pI65Zx5sIz29inhy8gwrDUmiojyqHn/YgMRH74j+QVz++3M3
         OGWtaTKfDdc8ucGEcboVCOPtqyWlM6+LigHjsqj5iLcSB3iKCIHhg8NVezAOg3i42Sak
         AFWNI5cmBd+BhaqJMqJvHxMYUCp9o3I0gZTba8J1XNGynMFNchrnSKFTi6fsgAzD+C/0
         iyEV9m9tgwLCieZ95S+VdL79RiWguZ+Ld/ZduzBdnX8/cc3rmcmQvlpfusFGafbLtjj9
         Rj+qDH0BBYDVbVAOWOwT0DcHB/LObnbpqcP/fJfzModbiEw/IRDPPuC5qsjGisRiavvQ
         8rog==
X-Forwarded-Encrypted: i=1; AKwUvBzGhF2X82aK3Vz7RKtoV+xGrGTpYPxiuNPIrKg7mxnM1Zn5+qd5CpIA9f1eaN+0VupyMvCPTgLKbU8=@lists.xenproject.org
X-Gm-Message-State: AFuF++kqNLQEUNWuaGGnBOtnrUh8AJnB4f9OLS8Gh617nuBqNRZK3Yu1
	yxgLXshjUYOXBZyMQ+5dqf1Et/kSRiusHd15Sb1aGfnrmn1MnshZ01b6V9I+LTnAYs/LKAB1TvP
	OfkVd65fzxLBu4I2HzHgEiBFhAEyWzWXqjPckMDzeXnejNR8bQG+4Y2fsamOA1WqXnLso
X-Gm-Gg: AYBFou1IA/GwUslrGpOz4qLVEv02yZ+EGcA1AIXOxQqBVEJUviGaVW4+hHfB1TnoD0X
	D+/+rYCaANMo1H3Mo3ehl23EddrqOWsvdZbOTznzN50EBjstyH+3vWWXjLreEYmini6ozcxO60T
	L4buqTlavj/kNakYtlP5uw3HxcKyR2CF/ts+bpJUD1jdYwOyh/5DeMhUlE3IxZXSNNkDeHPB35Q
	bkkPQrIErtEcqkr6GcOxaP22otiohDIpka0pCxOy0HMkH1S8z9mIvRmq/7d8AtXDzcZR8UoAF1j
	S5bNukZluFcjXZuSruWTg7XkW9oR/ifc6sW053wrxWCbidIH46UPVFQwW1w=
X-Received: by 2002:a05:600d:864b:20b0:49c:fea3:8633 with SMTP id 5b1f17b1804b1-49cfea38642mr11745465e9.24.1788523709278;
        Fri, 04 Sep 2026 05:08:29 -0700 (PDT)
X-Received: by 2002:a05:600d:864b:20b0:49c:fea3:8633 with SMTP id 5b1f17b1804b1-49cfea38642mr11745025e9.24.1788523708810;
        Fri, 04 Sep 2026 05:08:28 -0700 (PDT)
Date: Fri, 4 Sep 2026 14:08:24 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Dongli Zhang <dongli.zhang@oracle.com>, "Daniel P. =?UTF-8?B?QmVycmFu?=
 =?UTF-8?B?Z8Op?=" <berrange@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org, dave@treblig.org,
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
Message-ID: <20260904140824.177711f8@imammedo>
In-Reply-To: <20260904072052-mutt-send-email-mst@kernel.org>
References: <20260824011420.752806-1-dongli.zhang@oracle.com>
	<aoxY4Rxst2qAyn5z@redhat.com>
	<01ee4841-76d8-4749-a80e-eb945ab8799a@oracle.com>
	<20260903172835.0e253a25@imammedo>
	<20260903160401-mutt-send-email-mst@kernel.org>
	<20260904130709.6769caee@imammedo>
	<20260904072052-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zUpocuwcSh1UufAzlEg4gTnmulrO6lGfw216fi_wUMg_1788523709
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1788523713-532D8CFC-BC561BD9/0/0
X-purgate-type: clean
X-purgate-size: 10073

On Fri, 4 Sep 2026 07:22:10 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Fri, Sep 04, 2026 at 01:07:09PM +0200, Igor Mammedov wrote:
> > On Thu, 3 Sep 2026 16:17:20 -0400
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >  =20
> > > On Thu, Sep 03, 2026 at 05:28:35PM +0200, Igor Mammedov wrote: =20
> > > > On Wed, 26 Aug 2026 09:15:47 -0700
> > > > Dongli Zhang <dongli.zhang@oracle.com> wrote:
> > > >    =20
> > > > > On Mon, Aug 24, 2026 7:44:49AM -0700, Daniel P. Berrang=C3=A9 wro=
te:   =20
> > > > > > On Sun, Aug 23, 2026 at 06:13:30PM -0700, Dongli Zhang wrote:  =
   =20
> > > > > >> Hot-unplugging a PCI device can require cooperation from the g=
uest. For
> > > > > >> ACPI PCI hotplug, QEMU notifies the guest through ACPI and the=
 guest
> > > > > >> eventually writes the ACPI PCI eject register. For PCIe native=
 hotplug,
> > > > > >> QEMU notifies the guest through the PCIe hotplug mechanism and=
 waits for
> > > > > >> the slot unplug flow to complete. Only after that completion d=
oes QEMU
> > > > > >> unrealize the device and emit DEVICE_DELETED.
> > > > > >>=20
> > > > > >> This can leave a device stuck in the unplug pending state when=
 the guest
> > > > > >> does not cooperate. Examples include:
> > > > > >>=20
> > > > > >> 1. The guest has panicked, or the relevant ACPI/PCI hotplug dr=
iver is
> > > > > >> unavailable.
> > > > > >>=20
> > > > > >> 2. The guest is stalled and cannot handle the hot-unplug event=
. For
> > > > > >> example, stalling the Linux [irq/9-acpi] kernel thread can rep=
roduce this
> > > > > >> for ACPI-based hot-unplug.
> > > > > >>=20
> > > > > >> 3. The device was attached to a slot that the guest cannot use=
. For
> > > > > >> example, a pcie-root-port only supports slot 0. If a device is=
 added to a
> > > > > >> non-zero slot below a pcie-root-port, the guest may never disc=
over the
> > > > > >> device and therefore may never complete the unplug request.   =
=20
> > > >=20
> > > > all of above is actually expected, no (functioning) driver =3D> no =
hotplug/unplug.
> > > > it's the guest problem. Once device it exposed to guest its life-cy=
cle
> > > > not longer owned by QEMU.
> > > >=20
> > > > That's what one would see in real hw as well, you press eject butto=
n
> > > > but it will not do anything if OS doesn't process it.
> > > > also see comment at the end.
> > > >    =20
> > > > > >>=20
> > > > > >> The non-zero slot case has also been discussed in:
> > > > > >>=20
> > > > > >> hw/pci: warn when PCIe device is plugged into non-zero slot of=
 downstream port
> > > > > >> https://gitlab.com/qemu-project/qemu/-/commit/     =20
> > > > > > ca92eb5defcf9d1c2106341744a73a03cf26e824     =20
> > > > > >>=20
> > > > > >> hw/pci: add comment to explain checking for available function=
 0 in pci hotplug
> > > > > >> https://gitlab.com/qemu-project/qemu/-/     =20
> > > > > > commit/67d045a0ef5b9c5f871c3a1d87325a8a42d2b9d5     =20
> > > > > >>=20
> > > > > >> pci: don't skip function 0 occupancy verification for devfn au=
to assign
> > > > > >> https://gitlab.com/qemu-project/qemu/-/commit/     =20
> > > > > > e228d62b4af29bca698ec57efdceb46f392f5444     =20
> > > > > >>=20
> > > > > >> For example, if root-port.1 is a pcie-root-port, the following=
 command adds
> > > > > >> a vhost-scsi-pci device to an invalid slot:
> > > > > >>=20
> > > > > >> (qemu) device_add vhost-scsi-pci,id=3Dscsi01,wwpn=3Dnaa.500140=
5324af0985,bus=3Droot-port.1,addr=3D01.0
> > > > > >> warning: PCI: slot 1 is not valid for vhost-scsi-pci, parent d=
evice only allows plugging into slot 0.     =20
> > > > > >=20
> > > > > > This rather looks like it should be a fatal error, not a mere w=
arning.
> > > > > >=20
> > > > > > If I follow the commit ca92eb5def it links to https://bugzilla.=
redhat.com/show_bug.cgi?id=3D2128929
> > > > > > which states that this configuration is going to lead to a cras=
h in
> > > > > > QEMU on guest OS shutdown. IMHO that crash is sufficient to jus=
tify
> > > > > > making this a fatal error.
> > > > > >=20
> > > > > > If we actually wanted this to remain a warning, then that shutd=
own
> > > > > > crash would need to be fixed.
> > > > > >      =20
> > > > >=20
> > > > > Thank you very much!
> > > > >=20
> > > > > I see that the issue has been fixed. The ticket mentions the foll=
owing.
> > > > >=20
> > > > > "What I am observing is that it seems when the slot ID !=3D 0, th=
e guest OS seems
> > > > > to ignore this and we never seem to hit ich9_pm_device_unplug_cb(=
)."
> > > > >=20
> > > > > Based on my experience and evaluation, ACPI-based hotplug is more=
 likely to
> > > > > encounter an issue where the guest VM does not respond to an unpl=
ug operation.   =20
> > > >=20
> > > > I'm not sure it's a good idea to delete device when guest still thi=
nks it's there
> > > > (you can make guesses on QEMU side if it's in use, how useful those=
 are is questionable).
> > > >=20
> > > > as far as I know, ACPI hotplug has no notion of surprise removal (p=
ls educate me if it's not the case),   =20
> > >=20
> > > why would it not?
> > >=20
> > > how do you think you can pull a laptop out of a dock?
> > > I expect bus check + _STA and config space saying it is gone
> > > will do exactly that.
> > >=20
> > >=20
> > > Here's linux code:
> > > static void acpiphp_check_bridge(struct acpiphp_bridge *bridge)
> > > {      =20
> > >         struct acpiphp_slot *slot;
> > >=20
> > >         /* Bail out if the bridge is going away. */
> > >         if (bridge->is_going_away)
> > >                 return;
> > >=20
> > >         if (bridge->pci_dev)
> > >                 pm_runtime_get_sync(&bridge->pci_dev->dev);
> > >        =20
> > >         list_for_each_entry(slot, &bridge->slots, node) {
> > >                 struct pci_bus *bus =3D slot->bus;
> > >                 struct pci_dev *dev, *tmp;
> > >=20
> > >                 if (slot_no_hotplug(slot)) {
> > >                         ; /* do nothing */
> > >                 } else if (device_status_valid(get_slot_status(slot))=
) {
> > >                         /* remove stale devices if any */
> > >                         list_for_each_entry_safe_reverse(dev, tmp,
> > >                                                          &bus->device=
s, bus_list)
> > >                                 if (PCI_SLOT(dev->devfn) =3D=3D slot-=
>device)
> > >                                         trim_stale_devices(dev);
> > >=20
> > >                         /* configure all functions */
> > >                         enable_slot(slot, true);
> > >                 } else {
> > >                         disable_slot(slot);
> > >                 }
> > >         }
> > >=20
> > >         if (bridge->pci_dev)
> > >                 pm_runtime_put(&bridge->pci_dev->dev);
> > > }
> > >=20
> > >=20
> > > so weirdly it wants bus check on a parent bus, otherwise it will
> > > not trim devices?  probably a bug, but easy to work around. =20
> >=20
> > Modern docks would use native pcie surprise removal path.
> >=20
> > As for ACPI, my old laptop, had an unlock button =3D> _LCK
> > and that relied on OS processing ACPI events, not so surprise.
> >=20
> > There might have been ACPI/hybrid docks that did surprise removal,
> > but then one need to find one and model after that instead of=20
> > just blanket force removal. (likely out come would a doc device
> > support only, not an arbitrary device removal)
> >=20
> > (not the case described in this series, though. hence my request to cla=
rify usecase)
> >=20
> > from what I see in spec there is _RMV method that says that device
> > supports surprise removal that can be used for devices that support it.
> > However I would hesitate very much to blank apply it to every PCI devic=
e.
> > (it's not even realistic to ask for proving safe tear down across vario=
us
> > drivers and OSes/versions)
> >=20
> > Rather than a knee jerk treatment of misconfig consequences,
> > I'd rather see patches to prevent misconfig in the 1st place
> > (subj to deprecation but doable).
> >=20
> > As for the cases where OS mis-behaves (apcihp thread starvation,...),
> > fixing guest to follow hotplug contract is a proper place to do it.
> >=20
> > On QEMU side we have it covered as well. If unplug was not processed,
> > mgmt is free to repeat action. =20
>=20
>=20
> Sorry if I am unclear. I just meant that it looks like we
> can support surprise removal with ACPI just by reporting
> bus check events on the parent.

maybe, but that ain't SPECed and might be OS specific.

The way I've read the cover letter, that won't work for mentioned mis-confi=
g cases.
Also what would happen on bus-check 'cleanup' would be a lottery.
hence I'm for being safe here.

It's better to implement native PCIE surprise removal if that's really need=
ed.

> > > > so I wouldn't do what you are proposing here at all, it's basically=
 asking for disaster to happen.
> > > > And all this is basically for dealing with abused qemu flexibility.
> > > >=20
> > > > Please (re)formulate usecase and make it more clear as what is elud=
es me
> > > > no matter how many times i've read this cover letter.
> > > >=20
> > > > On positive note:
> > > >=20
> > > > What you can try to implement is native PCI-E support for surprise =
removal.
> > > > How hard that would be I don't know. And I would well expect if one=
 deviates from
> > > > real hw expectations/configs (such as not 0 slot/partial func remov=
al),
> > > > one would quickly stumble upon issues as  that's not what what vend=
ors write/test
> > > > drivers for.
> > > >=20
> > > > Even if it's not likely to be used in practice (guest still might n=
ot support it),
> > > > it may serve as test-bed for guest drivers.
> > > >    =20
> > > > > Thank you very much!
> > > > >=20
> > > > > Dongli Zhang
> > > > >    =20
> > >  =20
>=20


