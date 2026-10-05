Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95693CA5FCE
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 13:35:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440862.1658369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDir3-000481-Iy; Mon, 05 Oct 2026 13:35:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440862.1658369; Mon, 05 Oct 2026 13:35:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDir3-00047u-Eq; Mon, 05 Oct 2026 13:35:45 +0000
Received: by outflank-mailman (input) for mailman id 1440862;
 Mon, 05 Oct 2026 13:35:43 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1xDir1-00047a-NT
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 13:35:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDir1-006GCn-4D
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 15:35:43 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6ac3a7ad-8faa-0a2a0a5109dd-0a2a450aa2ee-2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 15:35:42 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6ac3a7ad-f2d2-0a2a450a0019-aa0a857c6cd7-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 15:35:42 +0200
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-682-yYWFsrshO_qvQ2caxQ9Wuw-1; Mon,
 05 Oct 2026 09:35:36 -0400
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E20CD18088B8; Mon,  5 Oct 2026 13:35:33 +0000 (UTC)
Received: from redhat.com (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 93F431800446; Mon,  5 Oct 2026 13:35:31 +0000 (UTC)
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
	s=mimecast20190719; t=1791207341;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=edsWgcTvJSh2xQnmTdTIDoWg/t2feMO6k0rNtRTjdUU=;
	b=Ex/4p4MS0Ya+Yljj2+uExBSF0yixVzyfO6be/EAoHVH/se6I6nceAGNeMWBg+oTkYW3RD3
	JcXx1F9lQYkHM22aYMTxwsRkcTYyNcQ3aVoJVUP6nSLOYheQQEds56zJFlJqA2t+CmR3+7
	TQW+jgGRlvVDC2u3Uatxqb23NMxMfB4=
X-MC-Unique: yYWFsrshO_qvQ2caxQ9Wuw-1
X-Mimecast-MFC-AGG-ID: yYWFsrshO_qvQ2caxQ9Wuw_1791207334
Date: Mon, 5 Oct 2026 14:35:28 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 14/28] hw/ide: mark ICH9 and ide-hd/ide-cd as secure
Message-ID: <asOnoKDrx_wwOIn2@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-15-berrange@redhat.com>
 <63427797-e8ed-4345-b8c7-469d20865165@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <63427797-e8ed-4345-b8c7-469d20865165@oss.qualcomm.com>
User-Agent: Mutt/2.4.2 (2026-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: k9GDF-P78jnHusmzDIiouAy6jsYCQmnElpe997TZyVc_1791207334
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1791207342-50ACCCFC-D46AB456/0/0
X-purgate-type: clean
X-purgate-size: 2025

On Mon, Oct 05, 2026 at 03:30:09PM +0200, Philippe Mathieu-Daudé wrote:
> On 11/9/26 16:36, Daniel P. BerrangÃ© wrote:
> > These have a long history of usage in virtualization scenarios on
> > x86, for OS which lack modern virtio drivers for storage, and thus
> > must be considered secure.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >   hw/ide/ich.c     | 1 +
> >   hw/ide/ide-dev.c | 3 +++
> >   hw/ide/piix.c    | 2 ++
> >   3 files changed, 6 insertions(+)
> 
> 
> > @@ -252,6 +254,7 @@ static const TypeInfo ide_device_type_info = {
> >       .parent = TYPE_DEVICE,
> >       .instance_size = sizeof(IDEDevice),
> >       .abstract = true,
> > +    .secure = true,
> 
> We shouldn't accept abstract secure device class IMO because it
> will be to easy to merge new devices that ended secure and we do
> not want to consider them. I'd go a step further and assert both
> can not be set together.

Setting 'secure' in a parent device does NOT imply that all children
have the same, only the reverse. ie, if a leaf device is secure, then
by definition all its parents must be secure.

This series only intended to mark leaf devices as secure, but a
followup series will explicitly mark the whole parent chain as
secure too, and also validate that chain in tests.

Another followup is to require non-user creatable implied devices
as secure. ie if a machine creates devices X, Y & Z, then if that
machine is secure, then X, Y & Z must be considered secure too.

Note, this would be just for those implied when "-nodefaults" is
given.

> 
> >       .class_size = sizeof(IDEDeviceClass),
> >       .class_init = ide_device_class_init,
> >       .instance_init = ide_dev_instance_init,
> 

With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|


