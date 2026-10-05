Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CD4CA5FFC
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 16:44:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441035.1658651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDlnu-0003Al-Up; Mon, 05 Oct 2026 16:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441035.1658651; Mon, 05 Oct 2026 16:44:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDlnu-0003Ae-SK; Mon, 05 Oct 2026 16:44:42 +0000
Received: by outflank-mailman (input) for mailman id 1441035;
 Mon, 05 Oct 2026 16:44:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cohuck@redhat.com>) id 1xDlnu-0003AY-AP
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 16:44:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDlnt-003PWq-Nd
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 18:44:41 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <cohuck@redhat.com>)
 id 6ac3d3f7-e002-0a2a0a5209dd-0a2a45098efc-4
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 18:44:41 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <cohuck@redhat.com>)
 id 6ac3d3f8-be1a-0a2a45090019-aa0a817c7943-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 18:44:41 +0200
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-59-Y2AVDQIvMEyt9ypAIuHz1g-1; Mon,
 05 Oct 2026 12:44:35 -0400
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 366FD195608F; Mon,  5 Oct 2026 16:44:33 +0000 (UTC)
Received: from localhost (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8916018004D4; Mon,  5 Oct 2026 16:44:32 +0000 (UTC)
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
	s=mimecast20190719; t=1791218679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a9BoSnEDgCJTNGC3lt5JXO3kHI9tlec5yV/ZrOKotUM=;
	b=AdsY/czO3CILJxngWwSToyHOdiH1z4YDMuja7MONeWvmGHwE24SRaQBUEpDWacZXru3fEk
	ZR5zb6kYLZJ8Fw4nNteiVe2LXg7yZTD3hjxDXGdYwKKiHPDT2KCr7O0adok154pB0MtblH
	7MquZZ0ubv/tTtrU2f0IZfIGBPrU5uk=
X-MC-Unique: Y2AVDQIvMEyt9ypAIuHz1g-1
X-Mimecast-MFC-AGG-ID: Y2AVDQIvMEyt9ypAIuHz1g_1791218673
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH 07/28] hw/vfio: mark all VFIO object classes as secure
In-Reply-To: <20260911143627.2743803-8-berrange@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-8-berrange@redhat.com>
User-Agent: Notmuch/0.40 (https://notmuchmail.org)
Date: Mon, 05 Oct 2026 18:44:30 +0200
Message-ID: <87tsn0jdw1.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: lZw_dNzykVxLJh8OibAx1BsGqctNbtS3Wo5YTVzKG9c_1791218673
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-bad1c0/1791218681-BE6DA034-9DA0472C/0/0
X-purgate-type: clean
X-purgate-size: 653

On Fri, Sep 11 2026, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> The VFIO subsystem is about securely passing host PCI devices
> to a guest, so all the classes should be presumed to be offering
> a security boundary.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  hw/vfio-user/pci.c  | 1 +
>  hw/vfio/ap.c        | 1 +
>  hw/vfio/ccw.c       | 1 +
>  hw/vfio/container.c | 1 +
>  hw/vfio/igd.c       | 1 +
>  hw/vfio/iommufd.c   | 2 ++
>  hw/vfio/pci.c       | 3 +++
>  hw/vfio/spapr.c     | 1 +
>  8 files changed, 11 insertions(+)
>

Acked-by: Cornelia Huck <cohuck@redhat.com> #s390 types


