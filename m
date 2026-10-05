Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E35CA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 16:42:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441025.1658634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDll3-0002Ee-CO; Mon, 05 Oct 2026 16:41:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441025.1658634; Mon, 05 Oct 2026 16:41:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDll3-0002EX-9m; Mon, 05 Oct 2026 16:41:45 +0000
Received: by outflank-mailman (input) for mailman id 1441025;
 Mon, 05 Oct 2026 16:41:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cohuck@redhat.com>) id 1xDll1-0002ER-UR
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 16:41:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDll0-006jWg-NT
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 18:41:42 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <cohuck@redhat.com>)
 id 6ac3d31e-8faa-0a2a0a5109dd-0a2a450aee36-42
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 18:41:42 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <cohuck@redhat.com>)
 id 6ac3d345-f2d2-0a2a450a0019-aa0a857cce01-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 18:41:42 +0200
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-78-a7WJijS0OcSgjgrqhC8cFw-1; Mon,
 05 Oct 2026 12:41:35 -0400
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 904E51977002; Mon,  5 Oct 2026 16:41:33 +0000 (UTC)
Received: from localhost (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3A47B1800446; Mon,  5 Oct 2026 16:41:32 +0000 (UTC)
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
	s=mimecast20190719; t=1791218501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rZB2mw8kdpwzfGr186lNQ1zojLkfVBrmJO82y15WJF8=;
	b=VPBidAeP7EC7kcL8NhHlzLPLtLKDsrhfeDruRk7X5b8kTh/v3Tq6SkBlj87slva00YusC2
	eaqbHIC9JI8r1ejrGwVn2XvElHq8gLD+Ql+IG57+AT5jSFTSB1KmGhGYYuUV0RPE0B+0F+
	jPrG5i9cIgXuQsm6y9rnPif938BLW6c=
X-MC-Unique: a7WJijS0OcSgjgrqhC8cFw-1
X-Mimecast-MFC-AGG-ID: a7WJijS0OcSgjgrqhC8cFw_1791218494
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH 01/28] hw: mark secure machines for x86, s390, ppc, arm,
 loonarch, riscv
In-Reply-To: <20260911143627.2743803-2-berrange@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-2-berrange@redhat.com>
User-Agent: Notmuch/0.40 (https://notmuchmail.org)
Date: Mon, 05 Oct 2026 18:41:29 +0200
Message-ID: <87zewsje12.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: LBdK1dWZafFwqF-0TIM4q9R9SgkYen6WDCUNHLdQ31M_1791218494
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1791218502-58FC6CFC-B9724F31/0/0
X-purgate-type: clean
X-purgate-size: 1086

On Fri, Sep 11 2026, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> The versioned machine types are typically present for use in
> virtualization use cases and can be expected to provide a security
> barrier. The only exceptions are the m68k versioned machine types
> which are only used with TCG. There are also a handful of other
> machines declared secure in docs/system/security.rst, notably
> the Xen machine variants and microvm.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  hw/arm/virt.c              | 1 +
>  hw/arm/xen-pvh.c           | 1 +
>  hw/i386/microvm.c          | 1 +
>  hw/i386/pc_piix.c          | 4 ++--
>  hw/i386/xen/xen-pvh.c      | 1 +
>  hw/loongarch/virt.c        | 2 ++
>  hw/ppc/spapr.c             | 1 +
>  hw/riscv/virt.c            | 1 +
>  hw/s390x/s390-virtio-ccw.c | 1 +
>  hw/xen/xen-pvh-common.c    | 1 +
>  hw/xenpv/xen_machine_pv.c  | 2 +-
>  include/hw/i386/pc.h       | 1 +
>  12 files changed, 14 insertions(+), 3 deletions(-)

Acked-by: Cornelia Huck <cohuck@redhat.com> #s390


