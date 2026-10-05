Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65910CA5FFC
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 16:43:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441030.1658644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDlmY-0002gp-Nt; Mon, 05 Oct 2026 16:43:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441030.1658644; Mon, 05 Oct 2026 16:43:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDlmY-0002gi-JB; Mon, 05 Oct 2026 16:43:18 +0000
Received: by outflank-mailman (input) for mailman id 1441030;
 Mon, 05 Oct 2026 16:43:16 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cohuck@redhat.com>) id 1xDlmW-0002ga-NS
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 16:43:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDlmW-00E2lE-0u
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 18:43:16 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <cohuck@redhat.com>)
 id 6ac3d378-2eae-0a2a0a5409dd-0a2a4504edcc-44
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 18:43:15 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <cohuck@redhat.com>)
 id 6ac3d3a2-b57f-0a2a45040019-aa0a817cab6b-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 18:43:15 +0200
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-511-mCLtMEfGN2O4RnS1sIZrZg-1; Mon,
 05 Oct 2026 12:43:12 -0400
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E6C6C1955F0D; Mon,  5 Oct 2026 16:43:10 +0000 (UTC)
Received: from localhost (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 45FEB471; Mon,  5 Oct 2026 16:43:10 +0000 (UTC)
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
	s=mimecast20190719; t=1791218594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qh49U003KLBLBhYbnCnOLFLAvwjn1I14DaZ3+ke48lY=;
	b=LKULJpYRlj1jftqifBEJZbXyKq51J0PPnAzxIcDwJYgfWBEN5jL0/4QulVivYVgn+1Jny0
	sGcUs0+ZLtEa7wT7K5bwu2QIVv/lZYAnVKT4oTJhjJHczt2OAwUo30+QzXi6NWoRi22sep
	AX7LW8NoauFgyaF3sBk15NOnvonE1gw=
X-MC-Unique: mCLtMEfGN2O4RnS1sIZrZg-1
X-Mimecast-MFC-AGG-ID: mCLtMEfGN2O4RnS1sIZrZg_1791218591
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH 04/28] hw: mark all virtio CCW devices as secure
In-Reply-To: <20260911143627.2743803-5-berrange@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-5-berrange@redhat.com>
User-Agent: Notmuch/0.40 (https://notmuchmail.org)
Date: Mon, 05 Oct 2026 18:43:07 +0200
Message-ID: <87wlrwjdyc.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: ufB3wGeLK1uUOD__V48ZCdw8LOn6e9YjWLUGay2aNIw_1791218591
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1791218595-583C0B50-405CA57D/0/0
X-purgate-type: clean
X-purgate-size: 987

On Fri, Sep 11 2026, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> These are all intended for use in a virtualization scenario and must
> provide a security boundary.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  hw/s390x/vhost-scsi-ccw.c     | 1 +
>  hw/s390x/vhost-user-fs-ccw.c  | 1 +
>  hw/s390x/vhost-vsock-ccw.c    | 1 +
>  hw/s390x/virtio-ccw-9p.c      | 1 +
>  hw/s390x/virtio-ccw-balloon.c | 1 +
>  hw/s390x/virtio-ccw-blk.c     | 1 +
>  hw/s390x/virtio-ccw-crypto.c  | 1 +
>  hw/s390x/virtio-ccw-gpu.c     | 1 +
>  hw/s390x/virtio-ccw-input.c   | 5 +++++
>  hw/s390x/virtio-ccw-md.c      | 1 +
>  hw/s390x/virtio-ccw-mem.c     | 1 +
>  hw/s390x/virtio-ccw-net.c     | 1 +
>  hw/s390x/virtio-ccw-rng.c     | 1 +
>  hw/s390x/virtio-ccw-scsi.c    | 1 +
>  hw/s390x/virtio-ccw-serial.c  | 1 +
>  hw/s390x/virtio-ccw.c         | 1 +
>  16 files changed, 20 insertions(+)

Acked-by: Cornelia Huck <cohuck@redhat.com>


