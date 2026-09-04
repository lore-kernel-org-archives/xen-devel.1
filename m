Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FDBC624D3
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 11:07:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408206.1640848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2RlQ-0002f1-5w; Fri, 04 Sep 2026 11:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408206.1640848; Fri, 04 Sep 2026 11:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2RlQ-0002eu-2p; Fri, 04 Sep 2026 11:07:20 +0000
Received: by outflank-mailman (input) for mailman id 1408206;
 Fri, 04 Sep 2026 11:07:19 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <imammedo@redhat.com>) id 1x2RlO-0002ek-SD
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 11:07:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2RlN-000cgN-1i
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 13:07:17 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <imammedo@redhat.com>)
 id 6a9aa664-2eae-0a2a0a5409dd-0a2a45038b72-6
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 13:07:16 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <imammedo@redhat.com>)
 id 6a9aa663-fae8-0a2a45030019-aa0a817c59b9-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 13:07:16 +0200
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-oKXwv1ynOZiCKZGWew2UnA-1; Fri, 04 Sep 2026 07:07:14 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-49b8c651ac0so15387955e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 04:07:13 -0700 (PDT)
Received: from imammedo ([213.175.37.14]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf755c22esm62275895e9.0.2026.09.04.04.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 04:07:11 -0700 (PDT)
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
	s=mimecast20190719; t=1788520035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=COwhqAov+nLJAVa8MRbosYqYAf0VB6LVyz5Coc61zuI=;
	b=J93HoMYEea9DaUk8MolKIdsdpsijHAhjzWnYLYBTMaauoAGq7LDh/euTy7iuG2H5apsuQa
	v99gfyfpBJ7fayGdMFFMfGbf0NDxNUCHl9udNTO07nH94TWhARrq/L3IZkprOU7+Spby8N
	53g20eFXY34IXXRrNYRxQEdqm5iwHJo=
X-MC-Unique: oKXwv1ynOZiCKZGWew2UnA-1
X-Mimecast-MFC-AGG-ID: oKXwv1ynOZiCKZGWew2UnA_1788520033
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520033; x=1789124833;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rma0vtMwq9+HEP9ZApTJBKj1zxbRdaELT3NPMRD9Df8=;
        b=V/Xh2+bwruGAp8t+zChcGYBgvRtwsfii+FiHwjjuDKdsBt6MmImAcC3XfMi8yMGxk6
         5ojB3VBnGXCnYD7b4lRmMpRXhTxY65gD8ziqdFsNBR05rf26k1uNRIXXrF3mJgxfi8+5
         8nabjbEW6pmDWBCn2GEErDXvOpr0Stgw2DCZ0psaWWwt5Bou9rnrT27hdl9hTPEupDZT
         4LOXL1jaAkV2JpUxGXQU98aig2279cFIPU0XpAsS0rmLWRr2P4bbOG7z4DhkvoKzbAqY
         Sb+BrdSRWubyUSElPeZyA4Kk8HF6UNAZEGxkullgDe9pTkKteS1pVCO36o28vtwQe/Jt
         ZcOA==
X-Forwarded-Encrypted: i=1; AKwUvBz+WNST9Sc1SjGY4wZ5lqSnDUFg2PzxClnmC0MlNq7D3RulRtN9KWRwb9jfJv8dho77YoUAPDngoHY=@lists.xenproject.org
X-Gm-Message-State: AFuF++nfUabxlWAwQdnjDmxl0lbzBrwTo/CHAiTXDj9JuUW6aL7UdL+4
	ve2VNe5DtTYtc10BemA6Le1je5i0olq4SAMLKG6I9s2VGCcUcptWKwMIkMQ54HyCOo+yrd7TzsY
	WDyKtuPdyg/l4xvsVK88a6QgwRZRXFngtP6hV+pQgzBL6iAfp1yzMYpY6obyNqZrBlAev
X-Gm-Gg: AYBFou0clf9vaIvFNo8rdW/B2CfvJUbK6hZVKahEScnBeOIiUXdN69AMMmxMCuH9iRV
	XmjX3QIsZqSy772D1a0+XdkrCcuhVyfkNe0sMg9ZQmGy4BlTr9ZVjb0ivO8h5xQil8/bfucB3+t
	MHofCZvO1S1ACBg5+1kCgyvcD61TB9NOdR9dvcqo7zpChs7xNDhY11sa6B4dxgewIx+pSFPiXG+
	hajZXwO0ChZ63zQ9C1Lyo0crU69fxnndrWxfDpKaMQxtrLwIdppr5wE5IUmO+y3hh6cQ+lECCy8
	GyanGPYuH/iMX/yKAmmNaS+ypFr1VFtjoSKkAqrXIXPg2gb2uFOzyWe9kIs=
X-Received: by 2002:a05:600c:8b05:b0:499:be2d:c290 with SMTP id 5b1f17b1804b1-49cf824e751mr61823175e9.9.1788520032852;
        Fri, 04 Sep 2026 04:07:12 -0700 (PDT)
X-Received: by 2002:a05:600c:8b05:b0:499:be2d:c290 with SMTP id 5b1f17b1804b1-49cf824e751mr61822205e9.9.1788520032319;
        Fri, 04 Sep 2026 04:07:12 -0700 (PDT)
Date: Fri, 4 Sep 2026 13:07:09 +0200
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
Message-ID: <20260904130709.6769caee@imammedo>
In-Reply-To: <20260903160401-mutt-send-email-mst@kernel.org>
References: <20260824011420.752806-1-dongli.zhang@oracle.com>
	<aoxY4Rxst2qAyn5z@redhat.com>
	<01ee4841-76d8-4749-a80e-eb945ab8799a@oracle.com>
	<20260903172835.0e253a25@imammedo>
	<20260903160401-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: v16B5CGhdqHcmcnUk69wu-5GOlaexUtywqsZPk7VUi8_1788520033
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1788520036-6F4C74E9-54AC7336/0/0
X-purgate-type: clean
X-purgate-size: 8591

On Thu, 3 Sep 2026 16:17:20 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Thu, Sep 03, 2026 at 05:28:35PM +0200, Igor Mammedov wrote:
> > On Wed, 26 Aug 2026 09:15:47 -0700
> > Dongli Zhang <dongli.zhang@oracle.com> wrote:
> >  =20
> > > On Mon, Aug 24, 2026 7:44:49AM -0700, Daniel P. Berrang=C3=A9 wrote: =
=20
> > > > On Sun, Aug 23, 2026 at 06:13:30PM -0700, Dongli Zhang wrote:   =20
> > > >> Hot-unplugging a PCI device can require cooperation from the guest=
. For
> > > >> ACPI PCI hotplug, QEMU notifies the guest through ACPI and the gue=
st
> > > >> eventually writes the ACPI PCI eject register. For PCIe native hot=
plug,
> > > >> QEMU notifies the guest through the PCIe hotplug mechanism and wai=
ts for
> > > >> the slot unplug flow to complete. Only after that completion does =
QEMU
> > > >> unrealize the device and emit DEVICE_DELETED.
> > > >>=20
> > > >> This can leave a device stuck in the unplug pending state when the=
 guest
> > > >> does not cooperate. Examples include:
> > > >>=20
> > > >> 1. The guest has panicked, or the relevant ACPI/PCI hotplug driver=
 is
> > > >> unavailable.
> > > >>=20
> > > >> 2. The guest is stalled and cannot handle the hot-unplug event. Fo=
r
> > > >> example, stalling the Linux [irq/9-acpi] kernel thread can reprodu=
ce this
> > > >> for ACPI-based hot-unplug.
> > > >>=20
> > > >> 3. The device was attached to a slot that the guest cannot use. Fo=
r
> > > >> example, a pcie-root-port only supports slot 0. If a device is add=
ed to a
> > > >> non-zero slot below a pcie-root-port, the guest may never discover=
 the
> > > >> device and therefore may never complete the unplug request. =20
> >=20
> > all of above is actually expected, no (functioning) driver =3D> no hotp=
lug/unplug.
> > it's the guest problem. Once device it exposed to guest its life-cycle
> > not longer owned by QEMU.
> >=20
> > That's what one would see in real hw as well, you press eject button
> > but it will not do anything if OS doesn't process it.
> > also see comment at the end.
> >  =20
> > > >>=20
> > > >> The non-zero slot case has also been discussed in:
> > > >>=20
> > > >> hw/pci: warn when PCIe device is plugged into non-zero slot of dow=
nstream port
> > > >> https://gitlab.com/qemu-project/qemu/-/commit/   =20
> > > > ca92eb5defcf9d1c2106341744a73a03cf26e824   =20
> > > >>=20
> > > >> hw/pci: add comment to explain checking for available function 0 i=
n pci hotplug
> > > >> https://gitlab.com/qemu-project/qemu/-/   =20
> > > > commit/67d045a0ef5b9c5f871c3a1d87325a8a42d2b9d5   =20
> > > >>=20
> > > >> pci: don't skip function 0 occupancy verification for devfn auto a=
ssign
> > > >> https://gitlab.com/qemu-project/qemu/-/commit/   =20
> > > > e228d62b4af29bca698ec57efdceb46f392f5444   =20
> > > >>=20
> > > >> For example, if root-port.1 is a pcie-root-port, the following com=
mand adds
> > > >> a vhost-scsi-pci device to an invalid slot:
> > > >>=20
> > > >> (qemu) device_add vhost-scsi-pci,id=3Dscsi01,wwpn=3Dnaa.5001405324=
af0985,bus=3Droot-port.1,addr=3D01.0
> > > >> warning: PCI: slot 1 is not valid for vhost-scsi-pci, parent devic=
e only allows plugging into slot 0.   =20
> > > >=20
> > > > This rather looks like it should be a fatal error, not a mere warni=
ng.
> > > >=20
> > > > If I follow the commit ca92eb5def it links to https://bugzilla.redh=
at.com/show_bug.cgi?id=3D2128929
> > > > which states that this configuration is going to lead to a crash in
> > > > QEMU on guest OS shutdown. IMHO that crash is sufficient to justify
> > > > making this a fatal error.
> > > >=20
> > > > If we actually wanted this to remain a warning, then that shutdown
> > > > crash would need to be fixed.
> > > >    =20
> > >=20
> > > Thank you very much!
> > >=20
> > > I see that the issue has been fixed. The ticket mentions the followin=
g.
> > >=20
> > > "What I am observing is that it seems when the slot ID !=3D 0, the gu=
est OS seems
> > > to ignore this and we never seem to hit ich9_pm_device_unplug_cb()."
> > >=20
> > > Based on my experience and evaluation, ACPI-based hotplug is more lik=
ely to
> > > encounter an issue where the guest VM does not respond to an unplug o=
peration. =20
> >=20
> > I'm not sure it's a good idea to delete device when guest still thinks =
it's there
> > (you can make guesses on QEMU side if it's in use, how useful those are=
 is questionable).
> >=20
> > as far as I know, ACPI hotplug has no notion of surprise removal (pls e=
ducate me if it's not the case), =20
>=20
> why would it not?
>=20
> how do you think you can pull a laptop out of a dock?
> I expect bus check + _STA and config space saying it is gone
> will do exactly that.
>=20
>=20
> Here's linux code:
> static void acpiphp_check_bridge(struct acpiphp_bridge *bridge)
> {      =20
>         struct acpiphp_slot *slot;
>=20
>         /* Bail out if the bridge is going away. */
>         if (bridge->is_going_away)
>                 return;
>=20
>         if (bridge->pci_dev)
>                 pm_runtime_get_sync(&bridge->pci_dev->dev);
>        =20
>         list_for_each_entry(slot, &bridge->slots, node) {
>                 struct pci_bus *bus =3D slot->bus;
>                 struct pci_dev *dev, *tmp;
>=20
>                 if (slot_no_hotplug(slot)) {
>                         ; /* do nothing */
>                 } else if (device_status_valid(get_slot_status(slot))) {
>                         /* remove stale devices if any */
>                         list_for_each_entry_safe_reverse(dev, tmp,
>                                                          &bus->devices, b=
us_list)
>                                 if (PCI_SLOT(dev->devfn) =3D=3D slot->dev=
ice)
>                                         trim_stale_devices(dev);
>=20
>                         /* configure all functions */
>                         enable_slot(slot, true);
>                 } else {
>                         disable_slot(slot);
>                 }
>         }
>=20
>         if (bridge->pci_dev)
>                 pm_runtime_put(&bridge->pci_dev->dev);
> }
>=20
>=20
> so weirdly it wants bus check on a parent bus, otherwise it will
> not trim devices?  probably a bug, but easy to work around.

Modern docks would use native pcie surprise removal path.

As for ACPI, my old laptop, had an unlock button =3D> _LCK
and that relied on OS processing ACPI events, not so surprise.

There might have been ACPI/hybrid docks that did surprise removal,
but then one need to find one and model after that instead of=20
just blanket force removal. (likely out come would a doc device
support only, not an arbitrary device removal)

(not the case described in this series, though. hence my request to clarify=
 usecase)

from what I see in spec there is _RMV method that says that device
supports surprise removal that can be used for devices that support it.
However I would hesitate very much to blank apply it to every PCI device.
(it's not even realistic to ask for proving safe tear down across various
drivers and OSes/versions)

Rather than a knee jerk treatment of misconfig consequences,
I'd rather see patches to prevent misconfig in the 1st place
(subj to deprecation but doable).

As for the cases where OS mis-behaves (apcihp thread starvation,...),
fixing guest to follow hotplug contract is a proper place to do it.

On QEMU side we have it covered as well. If unplug was not processed,
mgmt is free to repeat action.

=20
> > so I wouldn't do what you are proposing here at all, it's basically ask=
ing for disaster to happen.
> > And all this is basically for dealing with abused qemu flexibility.
> >=20
> > Please (re)formulate usecase and make it more clear as what is eludes m=
e
> > no matter how many times i've read this cover letter.
> >=20
> > On positive note:
> >=20
> > What you can try to implement is native PCI-E support for surprise remo=
val.
> > How hard that would be I don't know. And I would well expect if one dev=
iates from
> > real hw expectations/configs (such as not 0 slot/partial func removal),
> > one would quickly stumble upon issues as  that's not what what vendors =
write/test
> > drivers for.
> >=20
> > Even if it's not likely to be used in practice (guest still might not s=
upport it),
> > it may serve as test-bed for guest drivers.
> >  =20
> > > Thank you very much!
> > >=20
> > > Dongli Zhang
> > >  =20
>=20


