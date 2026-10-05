Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C253CA5FF0
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 16:47:25 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441041.1658661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDlqM-0003gw-AI; Mon, 05 Oct 2026 16:47:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441041.1658661; Mon, 05 Oct 2026 16:47:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDlqM-0003gp-7N; Mon, 05 Oct 2026 16:47:14 +0000
Received: by outflank-mailman (input) for mailman id 1441041;
 Mon, 05 Oct 2026 16:47:12 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <cohuck@redhat.com>) id 1xDlqK-0003gj-QI
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 16:47:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDlqJ-00Bjqk-Nt
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 18:47:11 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <cohuck@redhat.com>)
 id 6ac3d46d-8faa-0a2a0a5109dd-0a2a450386c2-38
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 18:47:11 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <cohuck@redhat.com>)
 id 6ac3d48e-fae8-0a2a45030019-aa0a857c6837-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 18:47:11 +0200
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-354-G_wea8NIOxmqaYJPF5ieKw-1; Mon,
 05 Oct 2026 12:47:08 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0BF0C190FFA4; Mon,  5 Oct 2026 16:47:01 +0000 (UTC)
Received: from localhost (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 617C43003EFB; Mon,  5 Oct 2026 16:45:45 +0000 (UTC)
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
	s=mimecast20190719; t=1791218830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mfE4jn8R5CeMJqVd+Sml4oHZnPiAjulZz6wtCK0m3zk=;
	b=BjhWk091tapyyXnU2Ezz1dkksTIEMm9SH9wP1nzhBvIvxjMQ+hCZ1lSnN85VQ5pZFOyRG3
	vtI5+EqQlPOGFhFXsXHdIHnf8BgJmmO1GRrOJ4YTeHsvP3/AxUP0eYgizn/WKruvqF6JB0
	TWWbhFfiD7JzR8bTItv2bsBzlB/E4yo=
X-MC-Unique: G_wea8NIOxmqaYJPF5ieKw-1
X-Mimecast-MFC-AGG-ID: G_wea8NIOxmqaYJPF5ieKw_1791218826
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH 11/28] hw/watchdog: mark some watchdog devices as secure
In-Reply-To: <20260911143627.2743803-12-berrange@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-12-berrange@redhat.com>
User-Agent: Notmuch/0.40 (https://notmuchmail.org)
Date: Mon, 05 Oct 2026 18:45:43 +0200
Message-ID: <87qzi4jdu0.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: XS7Q-_8f1RBLIvpB0PHQruNrlsaMWpT1J1DQrwdefS0_1791218826
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-33051d/1791218831-762FD4E9-133B60A9/0/0
X-purgate-type: clean
X-purgate-size: 728

On Fri, Sep 11 2026, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> The ib700, i6300esb, gwdt, spapr and diag288 watchdog devices are marked
> as secure since they have traditionally been, or are intended to be,
> used in virtualization use cases on x86, arm, ppc and s390x architectures
> respectively. Other watchdogs are primarily for emulation.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  hw/watchdog/sbsa_gwdt.c      | 1 +
>  hw/watchdog/spapr_watchdog.c | 1 +
>  hw/watchdog/wdt_diag288.c    | 1 +
>  hw/watchdog/wdt_i6300esb.c   | 1 +
>  hw/watchdog/wdt_ib700.c      | 1 +
>  5 files changed, 5 insertions(+)

Acked-by: Cornelia Huck <cohuck@redhat.com> #diag288


