Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3557CA9ED0
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 15:51:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446456.1662572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGIJC-0000kO-7B; Mon, 12 Oct 2026 15:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446456.1662572; Mon, 12 Oct 2026 15:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGIJC-0000kH-4B; Mon, 12 Oct 2026 15:51:26 +0000
Received: by outflank-mailman (input) for mailman id 1446456;
 Mon, 12 Oct 2026 15:51:25 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <egon.ojamaa@protonmail.com>) id 1xGIJA-0000kB-PC
 for xen-devel@lists.xen.org; Mon, 12 Oct 2026 15:51:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGIJA-00FxAU-4H
 for xen-devel@lists.xen.org; Mon, 12 Oct 2026 17:51:24 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <egon.ojamaa@protonmail.com>)
 id 6acd01e9-2eae-0a2a0a5409dd-0a2a4502d45e-12
 for <xen-devel@lists.xen.org>; Mon, 12 Oct 2026 17:51:24 +0200
Received: from [185.70.43.166] (helo=mail-43166.protonmail.ch)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <egon.ojamaa@protonmail.com>)
 id 6acd01fb-6ca4-0a2a45020019-b9462ba6426d-3
 for <xen-devel@lists.xen.org>; Mon, 12 Oct 2026 17:51:24 +0200
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=protonmail3 header.d=protonmail.com header.i="@protonmail.com" header.h="Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1791820283; x=1792079483;
	bh=lhyhzQs/6WjvVNEukWWqKI2Z4VNNq8e4uRKMZdqtw3g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=rfYJLs8xAcO2fyxYTqRpjyscDtKiD2qJ0YtaeJnRa20N+bT4o9HXFJl73w9qp5sfv
	 ZzgQvSKelVpgIM0umwVC2rGmuL29Z7zIN6RCINJbrXSOlm5Bg9QrlIYco2pG/wkv24
	 cyvKykHvoWblbiF6tMSxgsuB3CGS7QVA7pZcrxQpf3KJSE6GwW2I0sI1/bO1pc1DGU
	 cNuu8eondapk9z3vdOhwGsLCy2nKdr6+UdY+HQJ6xgC1w+T1o8ZMKPQr6MH1QEFMzo
	 GpUPGtF6KYZMKQT7IiIDPgdICTMUGD0jEYNsEVPPzA4GZ7GHJmvoSbKioSJ2ddKY82
	 kCcs7kE0KsVtQ==
Date: Mon, 12 Oct 2026 15:51:18 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Egon Ojamaa <egon.ojamaa@protonmail.com>
Cc: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Subject: Re: [BUG] Xen Dom0 fails to boot with "nvme.poll_queues=24" and "dom0_max_vcpus=6 dom0_vcpus_pin"
Message-ID: <ZdqnKSsFVZlobgEnQFmNe3daMG07IiG61QPJ3-wiX2CyHwXUpxeJOZUPM4dC_a29p0uGFn4czWO4TmACvBQisQeHPhPO2Osjwb4G9MiD3Z8=@protonmail.com>
In-Reply-To: <e3aa9017-1481-417b-8588-6c7af6c4875f@suse.com>
References: <U7HCP3LJd4EyfAH4QnOSFByAb7GtqgCBigeGGjopZ501a2wAYBQ8ySpQ5_tHz9UCQ8Si5_3lEV0trGVLcQO0c2_ZWGnlwK0kF2gRVOHTv5w=@protonmail.com> <e3aa9017-1481-417b-8588-6c7af6c4875f@suse.com>
Feedback-ID: 7420290:user:proton
X-Pm-Message-ID: 21fa49fcbe3dc8836143a184b59ce036adadc948
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1791820284-F26B72AC-216DA1F7/0/0
X-purgate-type: clean
X-purgate-size: 3080

Hello,

I did a follow up on: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/=
2170270/comments/2
Confirms same bug on 5900x Zen3 system, ubuntu 26.04 LTS , kernel 7.0.0-38-=
generic , non server MB.

AFAIK, dom0_max_vcpus=3D I think can be any value.
For sure happens with 6 and 12.

I cant find anything in logs, so I suspect it does not boot to the point lo=
gging can work properly.

I tried now to get somesort of log, not sure how useful, get IPMIscreencap.=
7z :
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2170270/+attachment/60=
08530/+files/IPMIscreencap.7z

More info on comment 3:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2170270/comments/3

Egon O.

> > Hello, Real human writing, not AI here ;)
>=20
> Good to know such can still happen.
>=20
> > #### Problem:
> >
> > Booting Xen hypervisor with Linux Dom0.
> > GRUB loads, Xen kernel messages load up to "Using 6 CPU"
> >
> > # From this point:
> > Next screen goes black and stays blank for 10+minutes.
> > Have to force reboot and choose non XEN kernel booting option via GRUB.
> >
> > # From this point expected behaviour without bug:
> > Next screen goes black and stays so for 30-70sec and Dom0 kernel messag=
es appear,
> > Next login is possible and system is running, "xl info" and other xl co=
mmands function.
> >
> > #### Cause:
> > I spent 2 days rebooting to narrow this down..
> >
> > This happens if we set both settings same time:
> > NVME io polling and XEN kernel CPU limits, via default grub configs:
> >
> > GRUB_CMDLINE_LINUX_DEFAULT=3D"nvme.poll_queues=3D24"
> >
> > # Can also be set via /mnt/oldroot/etc/modprobe.d/nvme.conf
> > # For proper polling setup nvme.io_poll=3D1 should also be set,
> > # but symptom already appears if we set only nvme.poll_queues=3D24
> >
> > and
> >
> > GRUB_CMDLINE_XEN_DEFAULT=3D"dom0_max_vcpus=3D6 dom0_vcpus_pin"
>=20
> Did you isolate which of the two options it actually is that causes the
> problem, or whether it needs to be both together? Also, is 6 a necessary
> (exact) precondition to the issue occurring?
>=20
> > Sadly not my personal system, so I can not do further heavy testing on =
it.
> > io polling does give very good performance boost to Gen5 NVME, and even=
 Gen4.
> > Sad we cant use it, as CPU pinning is more important for XEN hypervizor=
 system.
> >
> > This has been also reported to launchpad.net:
> > https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2170270
>=20
> As was meanwhile also indicated in that report: What's completely missing
> here, but very likely necessary for further analysis, are logs. That may
> also help establishing whether it's the kernel (driver) that's hung, or
> whether the system as a whole (i.e. Xen) is stuck. If nothing else in the
> log has any indication either way, issuing a debug key (for starters just
> 'h', later maybe others) may help telling one from the other. If issuing
> debug keys isn't possible anymore, try adding "watchdog" to the Xen
> command line.
>=20
> Jan
> 

