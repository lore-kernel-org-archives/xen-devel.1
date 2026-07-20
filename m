Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321ECC4452A
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 14:09:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366599.1616532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlogS-0003cF-8W; Mon, 20 Jul 2026 14:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366599.1616532; Mon, 20 Jul 2026 14:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlogS-0003c8-5d; Mon, 20 Jul 2026 14:09:28 +0000
Received: by outflank-mailman (input) for mailman id 1366599;
 Mon, 20 Jul 2026 14:09:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peterx@redhat.com>) id 1wlogQ-0003c2-Si
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 14:09:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlogP-00Bzk1-Oy
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 16:09:25 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peterx@redhat.com>)
 id 6a5e2c04-e002-0a2a0a5209dd-0a2a4508a696-38
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 16:09:25 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peterx@redhat.com>)
 id 6a5e2c14-f659-0a2a45080019-aa0a857cb72f-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 16:09:25 +0200
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-k1yeNmwjOSqxxUt9VpP_vA-1; Mon, 20 Jul 2026 10:09:20 -0400
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92e5fc4c7e9so861104285a.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 07:09:20 -0700 (PDT)
Received: from x1.local ([174.91.117.74]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-930b52dd4fasm875197485a.4.2026.07.20.07.09.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 07:09:17 -0700 (PDT)
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
	s=mimecast20190719; t=1784556564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u3IRo2FfwSRH3SmDYXoFL3FfZdxPQ3jnnPGCl1NtgQQ=;
	b=EwFo9sSY+m39DKwu4F4d+L8aeglgO6T4vydUDjIkBZStRyBRABoLwS/h/G186G/Id55W+B
	ck1gRwUXWlNTAPO9AQXBdMoOt9PdWrZfWRXpwrecHj0ofIO4CWtmq2q5Jiw3YraWsBekVf
	5k8Qedg1ew1pDXzMuswxBXUoQJ5kbnY=
X-MC-Unique: k1yeNmwjOSqxxUt9VpP_vA-1
X-Mimecast-MFC-AGG-ID: k1yeNmwjOSqxxUt9VpP_vA_1784556559
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784556559; x=1785161359;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u3IRo2FfwSRH3SmDYXoFL3FfZdxPQ3jnnPGCl1NtgQQ=;
        b=GSGcQcaqzEx5lJGE/fkBCRtet0V8sWDta2sPTB89SLULGwF9h6LBervNVpnsoM0hs4
         d3QekeGdaxHCl+a564+7yUvFlYb+n9reyeyiB5kaSfgpAQCAm8RVz+2IDIBPLcv2BVb1
         PpebD49y1aKI9c3AKR8j2oYOOk6YmxkNEv5WrRuz0R22W85ZpGTHCe9tH4TCVN7TVDxx
         KfAkEGKzEbSxEQ0x7eH6ufVLUKjmjtfgxCRj4bqcJyqLjtCulyAHDetQOZwJiDKcblGC
         UYYmugZ7MyMlqHvjgMHxi89WlZHVLIyKDVEX7kBBYUim0QN6W3mYb+Taf+xNGBHn7LpA
         ppag==
X-Forwarded-Encrypted: i=1; AHgh+RoAGZpNMfe1EmYdP2G2GOyVP3Yak3PmhR8JXPigOIY2KLlodbzEIxdb6XClON47ZKHs55Gk6KcSmHM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw21L8Qtvbdy5R/4vNckESdi23VK9GE+Mld7LJa8VuHwgFpVqhm
	+34OpkiZVuIpsANqVk6mAaqsHuVTpO0yzQQru14qi3yvvIOuzgfX0nSBn4LuyhVsmWZi68wdddO
	WDPRhuXakUaYqG0eo0rIyOAYY7vwoDZppWzwBTHgXjkzu8bCGLcwvhpwCIHGe6jYGjAGj
X-Gm-Gg: AfdE7ckCvVbMnVT8hHGnxwfscbXiu/yGuco7KQiRAiVpJm/yB3fnxXppKZLpmQY/B0f
	R5j74IMuI10/kbsCbff75PJ44wlDgPEo1oqSJbizE/Gh0iSTmr3G/1Wo+iOITtwTFd5JWKiQnpR
	ueAq2s359JdMIiRieO/6r6q3P34z1BepQT4UWwEPUo+8iDAmLovyACX275XpqvtLg02u1wlNZjE
	vKdWDUFRNoiJgiYWQS3ITTN3OsEKi7ckyyCEtJpbLH4+HyzKHbCWzluzVixs1ke96Ky0AuGO/T0
	unbpdXK2dHRmrmXpWwCuG6p9Yt8dLAGr1fydQ0MVctJeq7GonOlqNc+yOgwMChPkG2T4
X-Received: by 2002:a05:620a:6cc2:b0:915:83fa:b3e0 with SMTP id af79cd13be357-930b3e4919fmr1369859785a.5.1784556559096;
        Mon, 20 Jul 2026 07:09:19 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc2:b0:915:83fa:b3e0 with SMTP id af79cd13be357-930b3e4919fmr1369851885a.5.1784556558528;
        Mon, 20 Jul 2026 07:09:18 -0700 (PDT)
Date: Mon, 20 Jul 2026 10:09:13 -0400
From: Peter Xu <peterx@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
	qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Fam Zheng <fam@euphon.net>, "Denis V. Lunev" <den@openvz.org>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Greg Kurz <groug@kaod.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org, Li Zhijian <lizhijian@fujitsu.com>
Subject: Re: [PATCH 2/8] migration: fix qemu_get_counted_string annotation
Message-ID: <al4sCVxUxqrtmLjd@x1.local>
References: <20260720-co-v1-0-fabb4db3c204@redhat.com>
 <20260720-co-v1-2-fabb4db3c204@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20260720-co-v1-2-fabb4db3c204@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7CApyeYNLTsHXpAcVSB8QXWAEI2ltXxC2bF8rzYHmyc_1784556559
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1784556565-CFED287B-4288AD98/0/0
X-purgate-type: clean
X-purgate-size: 275

On Mon, Jul 20, 2026 at 11:55:31AM +0400, Marc-André Lureau wrote:
> Fixes: 394b9407e4c ("migration: mark mixed functions that can suspend")
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


