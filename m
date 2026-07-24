Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9D7C531F9
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2026 13:22:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1370019.1618436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnFqW-000362-Q6; Fri, 24 Jul 2026 13:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1370019.1618436; Fri, 24 Jul 2026 13:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnFqW-00035v-NP; Fri, 24 Jul 2026 13:21:48 +0000
Received: by outflank-mailman (input) for mailman id 1370019;
 Fri, 24 Jul 2026 13:21:47 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kwolf@redhat.com>) id 1wnFqV-00035p-7z
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 13:21:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnFqU-00AbuR-Jd
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 15:21:46 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kwolf@redhat.com>)
 id 6a6366e4-5cb7-0a2a0a5109dd-0a2a4507afaa-10
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 15:21:46 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kwolf@redhat.com>)
 id 6a6366e9-b4ea-0a2a45070019-aa0a857cc25f-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 15:21:46 +0200
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-128-qyhE3JscPfyzrkmZmiM3Ow-1; Fri,
 24 Jul 2026 09:21:41 -0400
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D05CF1955D5B; Fri, 24 Jul 2026 13:21:38 +0000 (UTC)
Received: from redhat.com (unknown [10.44.33.93])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 286121954213; Fri, 24 Jul 2026 13:21:31 +0000 (UTC)
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
	s=mimecast20190719; t=1784899305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RNdgEp2/7vVlFiygJ8fO8AWC5qhdC3DykmCksO9GiQE=;
	b=ff7ksm9tW9Wi78Dp998y0IF7UCme4/slsFreNmltro4wFU6JKiV9IEvqqNpik812Hx0CRx
	XjZ0AJKhBNXlxolPa54NchoTC68fglmE6etOMOEm74TloWqQLUO9WcilWtd2mxbR4rS12L
	y/GsoThPTqjoI0pjVOaSADt8sU2oVec=
X-MC-Unique: qyhE3JscPfyzrkmZmiM3Ow-1
X-Mimecast-MFC-AGG-ID: qyhE3JscPfyzrkmZmiM3Ow_1784899299
Date: Fri, 24 Jul 2026 15:21:29 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
	"Denis V. Lunev" <den@openvz.org>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Greg Kurz <groug@kaod.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org, Li Zhijian <lizhijian@fujitsu.com>
Subject: Re: [PATCH 4/8] block: add missing coroutine annotation
Message-ID: <amNm2a9S0a-vRYVQ@redhat.com>
References: <20260720-co-v1-0-fabb4db3c204@redhat.com>
 <20260720-co-v1-4-fabb4db3c204@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20260720-co-v1-4-fabb4db3c204@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: 4sj9clEysXCZeN0B5qU2E0Bsp365bBrzSx-byF9wEVk_1784899299
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1784899306-360C5AE4-9DA8D1D3/0/0
X-purgate-type: clean
X-purgate-size: 316

Am 20.07.2026 um 09:55 hat Marc-André Lureau geschrieben:
> The function was extracted without carrying the annotation.
> 
> Fixes: 23743ab282af ("block: move commit_run loop to separate function")
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


