Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C502CA5FF5
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 13:24:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440827.1658313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDifq-0008Di-C5; Mon, 05 Oct 2026 13:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440827.1658313; Mon, 05 Oct 2026 13:24:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDifq-0008Db-9L; Mon, 05 Oct 2026 13:24:10 +0000
Received: by outflank-mailman (input) for mailman id 1440827;
 Mon, 05 Oct 2026 13:24:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1xDifo-0008DV-Pf
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 13:24:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDifn-00CdJz-Ht
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 15:24:07 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6ac3a4f3-e002-0a2a0a5209dd-0a2a4509e6b2-22
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 15:24:07 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6ac3a4f6-be1a-0a2a45090019-aa0a817ca4dd-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 15:24:07 +0200
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-63-obwuuQIhOZGiBRqBapSW4A-1; Mon,
 05 Oct 2026 09:24:02 -0400
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B00DE18345B8; Mon,  5 Oct 2026 13:24:00 +0000 (UTC)
Received: from redhat.com (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B0D4F1800446; Mon,  5 Oct 2026 13:23:57 +0000 (UTC)
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
	s=mimecast20190719; t=1791206645;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KV90x+3zFHk7cNPd+HxS6xQi8Qt1QYZt5hhvtroAleM=;
	b=ivTG/lEMHhYMVj2bZKpzKAOX+U2IonxUdUzUmVKIBRwagu0i9vse+z+QRso24+EosHZxp4
	b4yTgnb+P0V2OdGDKKEX6e0OYPecC+ESbBR3oCtPaEe2knleRHcW0ScXHzI5FWvocgMIZ2
	bgVjw3SnmUhqlqzEeY4hb7eQAJRKUDQ=
X-MC-Unique: obwuuQIhOZGiBRqBapSW4A-1
X-Mimecast-MFC-AGG-ID: obwuuQIhOZGiBRqBapSW4A_1791206641
Date: Mon, 5 Oct 2026 14:23:54 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 01/28] hw: mark secure machines for x86, s390, ppc, arm,
 loonarch, riscv
Message-ID: <asOk6i4CNT9P6Bs-@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-2-berrange@redhat.com>
 <f1481bad-4dbb-414c-801e-aa24a6977b18@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <f1481bad-4dbb-414c-801e-aa24a6977b18@oss.qualcomm.com>
User-Agent: Mutt/2.4.2 (2026-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: WoMkaC7mblLDCGgvFO_a5kt-6g9kgWo091E37P6ttUA_1791206641
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1791206647-39AC0034-D518AF42/0/0
X-purgate-type: clean
X-purgate-size: 1926

On Mon, Oct 05, 2026 at 03:06:08PM +0200, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> On 11/9/26 16:36, Daniel P. BerrangÃ© wrote:
> > The versioned machine types are typically present for use in
> > virtualization use cases and can be expected to provide a security
> > barrier. The only exceptions are the m68k versioned machine types
> > which are only used with TCG. There are also a handful of other
> > machines declared secure in docs/system/security.rst, notably
> > the Xen machine variants and microvm.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >   hw/arm/virt.c              | 1 +
> >   hw/arm/xen-pvh.c           | 1 +
> >   hw/i386/microvm.c          | 1 +
> >   hw/i386/pc_piix.c          | 4 ++--
> >   hw/i386/xen/xen-pvh.c      | 1 +
> >   hw/loongarch/virt.c        | 2 ++
> >   hw/ppc/spapr.c             | 1 +
> >   hw/riscv/virt.c            | 1 +
> >   hw/s390x/s390-virtio-ccw.c | 1 +
> >   hw/xen/xen-pvh-common.c    | 1 +
> >   hw/xenpv/xen_machine_pv.c  | 2 +-
> >   include/hw/i386/pc.h       | 1 +
> >   12 files changed, 14 insertions(+), 3 deletions(-)
> 
> This patch should be split per machine / area of maintenance,
> so maintainers can officially Ack their commitment to security
> boundary for their machine.
> 
> I'm not sure LoongArch / RISCV / PPC are. If this was previously
> discussed, then pointer to the public discussions should be listed
> in the patch description.

Those are explicitly documented here:

  https://www.qemu.org/docs/master/system/security.html#virtualization-use-case

so this patch is just encoding what has already been defined.

With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|


