Return-Path: <SRS0=oC9Q=C6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9830C43464
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2020 10:16:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45A3A207BC
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2020 10:16:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="YmM/Ql1J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45A3A207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKIrs-0000Kg-Ii; Mon, 21 Sep 2020 10:16:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tSXE=C6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kKIrr-0000Kb-7d
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 10:16:19 +0000
X-Inumbo-ID: 9d19d771-0204-4c7b-acf6-cc950eaa8113
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d19d771-0204-4c7b-acf6-cc950eaa8113;
 Mon, 21 Sep 2020 10:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600683377;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=N+ySsO4jyqMjBOEHOZPGt6FhuFUjqW27V++lXl81950=;
 b=YmM/Ql1J4aqmg1UTz8cOGCF7571c71U+glJI/nwI3k4+NGSJ5mK/F16W
 +SV+dR2hEfcNkrxPqnQkd8ixqO6daQ2MgpvNSpUGPmyNxtLILyLiuE0/W
 5DPQOJA8FCBYjlCj8Tm1lIvArB0LsbusgecJYnwK9rjmcmVzn/5GIzreR U=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 85YTaE/U6dj9z0JbEHSvryZYKLw/6h4ZrJfeOVqIcnIfa+qINhcLpzCke5ORdXRb3zk/4DzpDj
 rYsy7gD9fU5Ydz4qp9MswqjtRH1ygEF7Wzvw5ixWGOruxQElKr1/mP8MKk3pDFIThOn9/8KRVO
 1utHgtVdMgHDFWqlhuiWksMy1EnpXokFZhQaoUTUL9sa0ctW4LAp2znsOYBM14GMvQ7SmzlGt3
 t0Sqd0Og8pHBtU6i230uNvK1RiJpCYhGfuRV/agc5MKo8L+vW4bCRm69jvPzdKwURpp+2ZHpik
 BnA=
X-SBRS: 2.7
X-MesageID: 28132089
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,286,1596513600"; d="scan'208";a="28132089"
Date: Mon, 21 Sep 2020 12:16:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <paul@xen.org>
CC: 'Ian Jackson' <iwj@xenproject.org>, "'Debian folks: Michael Tokarev'"
 <mjt@tls.msk.ru>, 'Hans van Kranenburg' <hans@knorrie.org>, "'Xen upstream
 folks with an interest: Andrew Cooper'" <Andrew.Cooper3@citrix.com>,
 <pkg-xen-devel@lists.alioth.debian.org>, <xen-devel@lists.xenproject.org>,
 "'My Xen upstream tools co-maintainer: Wei Liu'" <wl@xen.org>
Subject: Re: qemu and Xen ABI-unstable libs
Message-ID: <20200921101606.GF19254@Air-de-Roger>
References: <24420.58027.291045.507128@mariner.uk.xensource.com>
 <001b01d68fe9$fb3ae060$f1b0a120$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <001b01d68fe9$fb3ae060$f1b0a120$@xen.org>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Sep 21, 2020 at 08:36:55AM +0100, Paul Durrant wrote:
> > -----Original Message-----
> > From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Ian Jackson
> > Sent: 18 September 2020 17:39
> > To: Debian folks: Michael Tokarev <mjt@tls.msk.ru>; Hans van Kranenburg <hans@knorrie.org>; Xen
> > upstream folks with an interest: Andrew Cooper <Andrew.Cooper3@citrix.com>; Roger Pau Monné
> > <roger.pau@citrix.com>
> > Cc: pkg-xen-devel@lists.alioth.debian.org; xen-devel@lists.xenproject.org; My Xen upstream tools co-
> > maintainer: Wei Liu <wl@xen.org>
> > Subject: RFC: qemu and Xen ABI-unstable libs
> > 
> > Hi all.  Michael Tokarev has been looking into the problem that qemu
> > is using Xen libraries with usntable ABIs.  We did an experiment to
> > see which abi-unstable symbols qemu links to, by suppressing libxc
> > from the link line.  The results are below.[1]
> > 
> > Things are not looking too bad.  After some discussion on #xendevel I
> > have tried to summarise the situation for each of the troublesome
> > symbols.
> > 
> > Also, we discovered that upstream qemu does not link against any
> > abi-unstable Xen libraries if PCI passthrough is disabled.
> > 
> > Please would my Xen colleages correct me if I have made any mistakes.
> > Michael, I hope this is helpful and clear.
> > 
> > 
> > In order from easy to hard:
> > 
> > 
> > xc_domain_shutdown
> > 
> > This call in qemu needs to be replaced with a call to the existing
> > function xendevicemodel_shutdown in libxendevicemodel.  I think it is
> > likely that this call is fixed in qemu upstream.
> > 
> 
> I just pulled QEMU master and it appears that destroy_hvm_domain() is still calling xc_domain_shutdown().
> 
> > 
> > xc_get_hvm_param
> > 
> > There are three references in qemu's
> > xen_get_default_ioreq_server_info, relating to ioreq servers.  These
> > uses (and perhaps surrounding code at this function's call site)
> > should be replaced by use of xendevicemodel_create_ioreq_server
> > etc. from libxendevicemodel.  I think it is likely that this call is
> > fixed in qemu upstream.
> > 
> 
> These references are in compat code for Xen < 4.6. Use of (non-default) ioreq server has been present in the code for a long time.
> We can remove them by retiring the compat code.
> 
> > 
> > xc_physdev_map_pirq
> > xc_physdev_map_pirq_msi
> > xc_physdev_unmap_pirq
> > 
> > These are all small wrappers for the PHYSDEVOP_map_pirq hypercall.
> > PHYSDEVOP is already reasonably abi-stable at the hypervisor level (in
> > theory it's versioned, but changing it would break all dom0's).
> 
> The hypercalls are non-tools and directly called from the Linux kernel code so they are ABI.
> 
> > These calls could just be provided as-is by a new stable abi
> > entrypoint.  We think this should probably go in libxendevicemodel.
> > 
> 
> Rather than simply moving this calls into libxendevicemodel, we should think about their interactions with calls such as
> xc_domain_bind_pt_pci_irq() below and maybe have a stable library that actually provides a better API/ABI for interrupt
> mapping/triggering although...

I've thought the same when speaking with Ian about this, as (for HVM
passthrough) we use the physdev op to obtain a pirq from a physical
device interrupt source (a MSI entry in the QEMU case, because the
legacy interrupt is bound by the toolstack IIRC) and then use that
pirq to bind it to a guest lapic vector.

I think in a sense such physical interrupt abstraction (the pirq) is
helpful in order to simplify the binding, as you don't end up with a
hypercall with a massive number of parameters to identify both the
source and destination interrupt data. It's also helpful when the
guest changes the interrupt binding, as you then only update the guest
side and keep using the same pirq.

We might want however to have an interface more specific to
passthrough, such that the pirqs (or maybe we could just call them
handles) returned by such interface can only be used with guest
specific bind hypercalls?

> I've long felt PCI pass-through should not be done by QEMU anyway (not least because we currently
> have no mechanism for PCI pass-through to PVH domains).

Having xenpt in tree would be fine IMO. Now we have all the proper
infrastructure in place to allow different pci devices to be handled
by different emulators IIRC, which is all that's required for this to
work correctly.

Thanks, Roger.

