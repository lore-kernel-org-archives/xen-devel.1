Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DC5606A321
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 12:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KfTQZtuW
Received: from list by lists.xenproject.org with outflank-mailman.1479951.1683856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQOSS-0005I7-3S; Mon, 09 Nov 2026 12:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479951.1683856; Mon, 09 Nov 2026 12:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQOSS-0005I0-0v; Mon, 09 Nov 2026 12:26:44 +0000
Received: by outflank-mailman (input) for mailman id 1479951;
 Mon, 09 Nov 2026 12:26:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <yhlee@isslab.korea.ac.kr>) id 1xQOSQ-0005Hm-Jz
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 12:26:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQOSQ-003of7-0w
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 13:26:42 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6af1bbfa-bab6-0a2a0a5309dd-0a2a45059e20-18
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 13:26:41 +0100
Received: from [209.85.216.43] (helo=mail-pj1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6af1bb4b-4cb1-0a2a45050019-d155d82be044-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 13:23:40 +0100
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-3ae7626d14aso330888a91.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 04:23:40 -0800 (PST)
Received: from yhlee-960QFG.Davolink
 ([2406:5900:1044:110c:3d70:1891:1a66:b169])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b127912d62sm6836905a91.11.2026.11.09.04.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 04:23:38 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i="@isslab-korea-ac-kr.20260707.gappssmtp.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794227019; x=1794831819; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MdOqoOEupQFbfi4QuNxY8pxCO+41UFytiQ7mtp1SJ10=;
        b=KfTQZtuWcd8psAEeksLDeAa2CN+sTobr2LE7UzB1DRYvQYzYw9YfdxKxsmgiY8dl7+
         KeVcPNoktmJ1dASobt7D3yIV8bljAFwSyBsFK0Rxh9iZS7RmDoIrYK8QbGDQX/riHjVQ
         x7NpUDB6Vi2+/+XpE2J9OCdXLU1KHEJt9Ldbkpu+R+Su/CcSeJd+eL5AbTyLVafoXsz6
         L3iddhKgMR8NWhkBtWEEdYefnyjNzIKy2IICuRIKip1Kki5lzA2XnNShtrEfbm4LqXyH
         mg3czQPrAM1pseR02XJIjyIrnjJxYEdamdkqKS6cxsPgah02pl386Qxg1rTmZDbOBb68
         KHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227019; x=1794831819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MdOqoOEupQFbfi4QuNxY8pxCO+41UFytiQ7mtp1SJ10=;
        b=easdZfwd36D/dz4U/ZW3Sh0HXWAEgCi53Zp2p65DulU3XzWHsAKVJ0Ngjji/WUFRVY
         3qliMMwIGeL6j8faescCm1dW/p6ebZaP4UfcOoyucXduqODclWMxSCzLsQYIvUJJnsiB
         7u0s5spgEpDNOqPk1KP5eq5AY9um1G2HEHWeI7/ZTFxMmMuKuKLWueWDI0FcOTjPddjz
         qPq6hKHhb252KZqykkJJBUpHOZrHA27DQBgZItzk2plw8gdrb4jkY6mSbdTzV055eZtG
         RWYagto7PrqHxrK964yovReBkmWk8gkYBF00Iw00Hh2vO6FaP+mNm2TYbAUgAUqj1pdq
         unXA==
X-Forwarded-Encrypted: i=1; AL+hErEtDLNcR4YTu6o316GyYMuWJWEENn0QFf2F/YAfrc0vWAw0pv/XEApanV7Dr7ABZGPE9x2bWPx/vSE=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9iTKGK8IDODGPj1y0unAQVG6cEK7nBU0BdLHISSQ0VU9+JL9Ae
	VAfZwzOSd0Zr5OwaUq6o7EW3ujCTGS3djRj+6aXwDSeHMIdDPa40wRys/IEK+LdS8DA=
X-Gm-Gg: AYBFou0cNRkhGYjXKwzI2/YimJkQs85q11HQ0sUC18uVeA2jN68HUSqnSKQWh5XVLwg
	7HkuF2nMjFC18/yWrdwDtbqzeVWATqx62que1VIX8ZMj04Ca6huepp0XOwlHVLbd+X6FzKPazLN
	bz2jMnyIq0BQUsJKvACqgbrgSx8u7VbEM06cx1V3UYVQ70YHOe2pJTigGUr2hMuO9h1KB8ja9t0
	ijPSt5COO4RjG8N1HuzW5rojv1giv9/Wi5bJ/1nARowu2O2E0wp6o/35n22oTi5oxFoMODkH+DV
	swDlJlB5WLwYRtj/xAnVH8hSyJw11SHXcMmVFYfdcZDjc43we1aJt/qIIfaSD0VRsK5xnm2D0wJ
	eWo8gVZyn2MHD+cNnNTQ1tCzZZ12MMoS4ByunBMCduBWyoaikNW2Gj43/1/IJcHtAj8phMXP2l7
	IG8oNzery1YBRllDgSxrjkZIZj8SHjd4I4TmSZ1I0cUK2Ar7Z+QyzMwx0o+1ErgFWHSTfrBeaBU
	9vXj9SrYHYEPrkyedJhpOjfh5d+I8pml3Ea0YvAIbpHOvSUVRCOhYxunNhaEFssJi/MCuRQCJMk
	sc4wkMlWIFCXryfAsSQOpHEjaCxZO9lP3IAxhWYIcBx0pT6mPpMd2Uikri3q3bFLE5IYgNoxEqB
	Js4JgcQNozgOgzXVk6ysK2Zqp1bkxDTPrSprCUg==
X-Received: by 2002:a17:90b:2547:b0:3ac:8af9:4a77 with SMTP id 98e67ed59e1d1-3b12d4204e3mr3448890a91.10.1794227018821;
        Mon, 09 Nov 2026 04:23:38 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: jgross@suse.com,
	sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com,
	boris.ostrovsky@oracle.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] xen/pvcalls: destroy the per-socket workqueue on release
Date: Mon,  9 Nov 2026 21:23:24 +0900
Message-ID: <20261109122324.30134-3-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109122324.30134-1-yhlee@isslab.korea.ac.kr>
References: <20261109122324.30134-1-yhlee@isslab.korea.ac.kr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1794227020-734BC2A1-868A180F/13/0
X-purgate-type: clean
X-purgate-size: 1504
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

pvcalls_new_active_socket() gives every active socket its own ordered
workqueue:

	map->ioworker.wq = alloc_ordered_workqueue("pvcalls_io", 0);

and nothing ever destroys it.  pvcalls_back_release_active() flushes
map->ioworker.register_work and frees map, but the workqueue and its
pool_workqueues stay allocated, so a frontend leaks a workqueue per socket
it connects and releases - a loop a guest can run as long as it likes.

Destroy it after the IRQ is unbound, so no new work can be queued, and
before map is freed.  pvcalls_back_ioworker() takes no locks, in
particular not fedata->socket_lock, which the backend_disconnect() caller
holds here, so draining it from this point is safe; the flush_work() just
above already has the same requirement.

Fixes: 5db4d286a8ef ("xen/pvcalls: implement connect command")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/xen/pvcalls-back.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/xen/pvcalls-back.c b/drivers/xen/pvcalls-back.c
index dcefa91a40cd05..27aa06289a7b92 100644
--- a/drivers/xen/pvcalls-back.c
+++ b/drivers/xen/pvcalls-back.c
@@ -456,6 +456,7 @@ static int pvcalls_back_release_active(struct xenbus_device *dev,
 	xenbus_unmap_ring_vfree(dev, map->bytes);
 	xenbus_unmap_ring_vfree(dev, (void *)map->ring);
 	unbind_from_irqhandler(map->irq, map);
+	destroy_workqueue(map->ioworker.wq);
 
 	sock_release(map->sock);
 	kfree(map);
-- 
2.43.0


