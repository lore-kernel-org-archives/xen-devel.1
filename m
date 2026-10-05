Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45C3CA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 16:50:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441052.1658669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDltS-0005Xr-QP; Mon, 05 Oct 2026 16:50:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441052.1658669; Mon, 05 Oct 2026 16:50:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDltS-0005Xk-No; Mon, 05 Oct 2026 16:50:26 +0000
Received: by outflank-mailman (input) for mailman id 1441052;
 Mon, 05 Oct 2026 16:50:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cohuck@redhat.com>) id 1xDltR-0005Xe-Rs
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 16:50:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDltQ-009Xv5-SQ
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 18:50:24 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <cohuck@redhat.com>)
 id 6ac3d53a-8faa-0a2a0a5109dd-0a2a4506df88-18
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 18:50:24 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <cohuck@redhat.com>)
 id 6ac3d54e-195a-0a2a45060019-aa0a857cb3c1-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 18:50:23 +0200
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-180-h9WCb5LYNwy5fV-4unEZ5A-1; Mon,
 05 Oct 2026 12:50:20 -0400
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 91B0C190A0B5; Mon,  5 Oct 2026 16:49:22 +0000 (UTC)
Received: from localhost (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D89AF1800446; Mon,  5 Oct 2026 16:49:21 +0000 (UTC)
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
	s=mimecast20190719; t=1791219022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gRXaaB6TgFoC+NdH0TFCz50Ponj3MuleqX92hryoqx0=;
	b=h/rt+M8bnKb22E14bqGTD5di62w7sEVfRZqTiULYEe1b+lgAN8+iG5NRy/Z9rOlzImidYr
	P3XObvvGwq8FgRtnPmy8nsCN8f7yME8fOfzaTt50GfpxmVbVn8U8QAXVcJTY6GkX27/lew
	+iyHWP2v4tDGoOXWUtyU78fuilIZHRs=
X-MC-Unique: h9WCb5LYNwy5fV-4unEZ5A-1
X-Mimecast-MFC-AGG-ID: h9WCb5LYNwy5fV-4unEZ5A_1791219019
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH 16/28] hw/pci-host: mark common x86, ppc, arm and s390
 PCI hosts as secure
In-Reply-To: <20260911143627.2743803-17-berrange@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-17-berrange@redhat.com>
User-Agent: Notmuch/0.40 (https://notmuchmail.org)
Date: Mon, 05 Oct 2026 18:49:19 +0200
Message-ID: <87o6d8jdo0.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: SV76-CISmH8UIvZ0hPVsCoOuM_P16Qa2XTEQl2u2f9E_1791219019
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1791219023-FC80577B-D0A8A65D/0/0
X-purgate-type: clean
X-purgate-size: 977

On Fri, Sep 11 2026, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> Mark the PCI hosts secure if they are used from machine types
> that are considered for the virtualization use case.
>
> There is also a special case for the 'remote' type and the
> Xen passthrough type.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  hw/pci-host/gpex.c          | 2 ++
>  hw/pci-host/i440fx.c        | 2 ++
>  hw/pci-host/pnv_phb.c       | 2 ++
>  hw/pci-host/pnv_phb3.c      | 3 +++
>  hw/pci-host/pnv_phb3_msi.c  | 1 +
>  hw/pci-host/pnv_phb3_pbcq.c | 1 +
>  hw/pci-host/pnv_phb4.c      | 4 +++-
>  hw/pci-host/pnv_phb4_pec.c  | 1 +
>  hw/pci-host/q35.c           | 2 ++
>  hw/pci-host/remote.c        | 1 +
>  hw/pci-host/xen_igd_pt.c    | 1 +
>  hw/ppc/spapr_pci.c          | 1 +
>  hw/s390x/s390-pci-bus.c     | 4 ++++
>  13 files changed, 24 insertions(+), 1 deletion(-)

Acked-by: Cornelia Huck <cohuck@redhat.com> #s390


