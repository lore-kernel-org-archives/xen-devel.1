Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F062CA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 13:39:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440880.1658404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDiuu-0006MI-PT; Mon, 05 Oct 2026 13:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440880.1658404; Mon, 05 Oct 2026 13:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDiuu-0006MA-MN; Mon, 05 Oct 2026 13:39:44 +0000
Received: by outflank-mailman (input) for mailman id 1440880;
 Mon, 05 Oct 2026 13:39:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1xDiut-0006Lk-9n
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 13:39:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDius-002yCn-Mw
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 15:39:42 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6ac3a89e-e002-0a2a0a5209dd-0a2a45058f66-0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 15:39:42 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6ac3a89d-4cb1-0a2a45050019-aa0a817cd765-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 15:39:42 +0200
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-319-r6z15yOkNo2bxv0SFns8Qg-1; Mon,
 05 Oct 2026 09:39:39 -0400
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1562B196C428; Mon,  5 Oct 2026 13:39:38 +0000 (UTC)
Received: from redhat.com (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 355761800446; Mon,  5 Oct 2026 13:39:36 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791207581;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n6vF1KMKYttXS817LHuQhd6SNLkTLI+56sGMUZLzBHc=;
	b=fo7/WrdE20CuJAhHNpn8ES3ZrUwhEtE1461iRu7XMpKPaUjRydKY7pAoLwEZahIdNeCJ3s
	4HGynQuUqMiN9ImWxpaT0DX4yrwKYU19djiU59zBCu1dM6pLwHb3gHvKg73yD2iYtA38yl
	sCATmpb23580sKjBi5V3nDbSP0nz/eM=
X-MC-Unique: r6z15yOkNo2bxv0SFns8Qg-1
X-Mimecast-MFC-AGG-ID: r6z15yOkNo2bxv0SFns8Qg_1791207578
Date: Mon, 5 Oct 2026 14:39:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 01/28] hw: mark secure machines for x86, s390, ppc, arm,
 loonarch, riscv
Message-ID: <asOolU1EMpc7jFNI@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-2-berrange@redhat.com>
 <f1481bad-4dbb-414c-801e-aa24a6977b18@oss.qualcomm.com>
 <asOk6i4CNT9P6Bs-@redhat.com>
 <5e64e1e0-d733-4f8e-98b4-8e6b554101b2@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <5e64e1e0-d733-4f8e-98b4-8e6b554101b2@oss.qualcomm.com>
User-Agent: Mutt/2.4.2 (2026-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: y3KS_CNFpAXzqN1fRQ7rEiF9cYLXzmBVIoHbyVt82kQ_1791207578
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1791207582-71EA92A1-0B09E821/0/0
X-purgate-type: clean
X-purgate-size: 2988

On Mon, Oct 05, 2026 at 03:34:52PM +0200, Philippe Mathieu-Daudé wrote:
> On 5/10/26 15:23, Daniel P. BerrangÃ© wrote:
> > On Mon, Oct 05, 2026 at 03:06:08PM +0200, Philippe Mathieu-Daudé wrote:
> > > Hi,
> > > 
> > > On 11/9/26 16:36, Daniel P. BerrangÃ© wrote:
> > > > The versioned machine types are typically present for use in
> > > > virtualization use cases and can be expected to provide a security
> > > > barrier. The only exceptions are the m68k versioned machine types
> > > > which are only used with TCG. There are also a handful of other
> > > > machines declared secure in docs/system/security.rst, notably
> > > > the Xen machine variants and microvm.
> > > > 
> > > > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > > > ---
> > > >    hw/arm/virt.c              | 1 +
> > > >    hw/arm/xen-pvh.c           | 1 +
> > > >    hw/i386/microvm.c          | 1 +
> > > >    hw/i386/pc_piix.c          | 4 ++--
> > > >    hw/i386/xen/xen-pvh.c      | 1 +
> > > >    hw/loongarch/virt.c        | 2 ++
> > > >    hw/ppc/spapr.c             | 1 +
> > > >    hw/riscv/virt.c            | 1 +
> > > >    hw/s390x/s390-virtio-ccw.c | 1 +
> > > >    hw/xen/xen-pvh-common.c    | 1 +
> > > >    hw/xenpv/xen_machine_pv.c  | 2 +-
> > > >    include/hw/i386/pc.h       | 1 +
> > > >    12 files changed, 14 insertions(+), 3 deletions(-)
> > > 
> > > This patch should be split per machine / area of maintenance,
> > > so maintainers can officially Ack their commitment to security
> > > boundary for their machine.
> > > 
> > > I'm not sure LoongArch / RISCV / PPC are. If this was previously
> > > discussed, then pointer to the public discussions should be listed
> > > in the patch description.
> > 
> > Those are explicitly documented here:
> > 
> >    https://www.qemu.org/docs/master/system/security.html#virtualization-use-case
> > 
> > so this patch is just encoding what has already been defined.
> 
> I probably missed when this was accepted, we are good then!
> 
> That said, 1/ Nitro Enclave are missing and 2/ this series organization
> is not easy to follow to me: I'd rather a per-machine approach, with a
> 'info qom-tree' output justifying the devices, then finish the series
> with busses-based devices expected to be secure. I dont quite follow
> this approach. I'm not asking to redo the series since it is already
> reviewed.

The structure is essentially, the machines listed in the docs, the
hardware accelerators, the paravirtualized devices, and then per
subsystem devices for the rest.

A per-machine approach would end up with 90% of the series added
in the first patch, as most devices are common to all machines
or targets.

With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|


