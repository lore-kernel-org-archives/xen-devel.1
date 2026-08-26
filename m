Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29FFC5DF97
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 09:04:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399725.1635710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wz9YO-0001P1-L6; Wed, 26 Aug 2026 09:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399725.1635710; Wed, 26 Aug 2026 09:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wz9YO-0001Ou-Hu; Wed, 26 Aug 2026 09:04:16 +0000
Received: by outflank-mailman (input) for mailman id 1399725;
 Wed, 26 Aug 2026 09:04:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1wz9YN-0001Oo-6f
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 09:04:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wz9YM-00CX3E-10
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 11:04:14 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6a8eac0a-8faa-0a2a0a5109dd-0a2a450bb008-16
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 11:04:13 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6a8eac0b-b7e8-0a2a450b0019-aa0a857c8077-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 11:04:12 +0200
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-658-VIg-u96BNVaDP5wBPRPqIA-1; Wed,
 26 Aug 2026 05:04:07 -0400
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EBEFE1953996; Wed, 26 Aug 2026 09:04:05 +0000 (UTC)
Received: from redhat.com (headnet05.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.117])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 79316195422E; Wed, 26 Aug 2026 09:04:02 +0000 (UTC)
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
	s=mimecast20190719; t=1787735051;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dMUx3CkXN0hFHp2GTyMbE3ZjLMT8j6sNqup++Lhq3UU=;
	b=DMzUEC32KF1svLL/+Zkv6ua3yga8r5+NnHKEeExu4nP/f4NYh/SbYV/sJJl6Bf8EEI0Mfr
	h+CH/WTqEtdvTOVUnlibRCB9LmsK3yMAD21LbbZS0+RLaqHgKnIUeRH6pZNbeUIRxVYBPo
	2uVdhw5SJXGSW5ng+JMyTLwWS+N75a4=
X-MC-Unique: VIg-u96BNVaDP5wBPRPqIA-1
X-Mimecast-MFC-AGG-ID: VIg-u96BNVaDP5wBPRPqIA_1787735046
Date: Wed, 26 Aug 2026 10:03:59 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, dave@treblig.org,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
	Markus Armbruster <armbru@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 42/49] hw: guard BusClass::print_dev with CONFIG_HMP
Message-ID: <ao6r_y3LVtdhCnLj@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20260825-qemu-no-hmp-v4-0-af60857c2fbe@redhat.com>
 <20260825-qemu-no-hmp-v4-42-af60857c2fbe@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20260825-qemu-no-hmp-v4-42-af60857c2fbe@redhat.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: W7hrufOA-hhfotAyZ14bLbxmSW9vpn-gwWSKgAt9mNk_1787735046
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1787735052-19AC09EA-DBBDEE38/0/0
X-purgate-type: clean
X-purgate-size: 1009

On Tue, Aug 25, 2026 at 11:09:49PM +0400, Marc-André Lureau wrote:
> The print_dev callback is only used by HMP 'info qtree'. Guard the field
> in BusClass, all implementations, and the caller with CONFIG_HMP.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/char/virtio-serial-bus.c |  6 ++++++
>  hw/core/sysbus.c            |  6 ++++++
>  hw/misc/auxbus.c            | 16 +++++++++++-----
>  hw/pci/pci-hmp-cmds.c       |  2 ++
>  hw/pci/pci.c                |  2 ++
>  hw/usb/bus.c                |  6 ++++++
>  hw/xen/xen-bus.c            |  4 ++++
>  include/hw/core/qdev.h      |  2 ++
>  8 files changed, 39 insertions(+), 5 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|


