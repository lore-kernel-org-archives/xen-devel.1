Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD665606A7F1
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 13:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FSxxvxN1
Received: from list by lists.xenproject.org with outflank-mailman.1481731.1685659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQlbH-0001mw-L1; Tue, 10 Nov 2026 13:09:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481731.1685659; Tue, 10 Nov 2026 13:09:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQlbH-0001mp-IA; Tue, 10 Nov 2026 13:09:23 +0000
Received: by outflank-mailman (input) for mailman id 1481731;
 Tue, 10 Nov 2026 13:09:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <yhlee@isslab.korea.ac.kr>) id 1xQlbF-0001bn-Pg
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 13:09:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQlbF-0069wo-6B
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 14:09:21 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6af31773-8faa-0a2a0a5109dd-0a2a45079514-10
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 14:09:20 +0100
Received: from [74.125.82.42] (helo=mail-dl1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6af3130a-b4ea-0a2a45070019-4a7d522accb8-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 13:50:19 +0100
Received: by mail-dl1-f42.google.com with SMTP id
 a92af1059eb24-170135e43c7so2998892c88.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 04:50:19 -0800 (PST)
Received: from yhlee-960QFG.Davolink
 ([2406:5900:1044:110c:88e2:4271:a9b8:cc50])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b3b5b79649sm7614830c88.21.2026.11.10.04.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 04:50:16 -0800 (PST)
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
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794315017; x=1794919817; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hIqePvJF9vqtDiaaoJWj4mMGLwExY1SZs6wpgpJb2hI=;
        b=FSxxvxN1MPIva++zHmZrEPRDUd0RVN6mGO2DBE2xAHd11HxYkMdsc7XwYxd7ArLnwn
         QSL78mc9/Vxo5q3VVHCYeiF4NXEQgwPC7SvRuc1vDBz2a6HugNY1WGVygqKTY/HIz/8e
         rK2oPt79lqbKjmU9wjLeaBxfeONBXi3+IO5/do5XjZRiL0Nrmhh661Wvm0V4Ze+Pansh
         HfVlIv43vqULcN6dkYwf7Kkir+Ziy/JkLQVoljJj3xOInTWciXd2dOCNDeFeR4F47Xr7
         ZS6MBWesYkB2E57kCsgpFEZzZdJPhWiZjGOsyXka9rFqf6Z9hXrIQUo1UEZEAIgYYBXS
         76ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315017; x=1794919817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hIqePvJF9vqtDiaaoJWj4mMGLwExY1SZs6wpgpJb2hI=;
        b=HvDsQHFkAEK8OOIyRDw4LH+WWKwSFkOYdUkaQvcNfjeLBBRw1vX/r4StmrMutAA8xF
         vtfOGK0ktRyNcL3VcC0A3YCtNVhABnAQ0AAB6GUb8CQw1uRIf1b4S9npAcL6vj5EdCN6
         Zq4l5Nm0teAJHdRRm6xybvfnbbfCVu/ngcrKSUIZXjDLAsWD76IPQkTrgFhEqaI2Jjsn
         yK96u8uQgE8KNRDm5bPo3JzoG7m5hM7NijT/ETpMSmU1J05BH7TobxXFoEUvemZNwViR
         gNCHaGkigiu3lFrRKbeEqQjYgkQiUO9Z2JheluN1ykgXCnX2MT6KIFvGU/Cku0VgImVx
         SEog==
X-Forwarded-Encrypted: i=1; AL+hErHnuRk59jkHfV2KPD7zEmdyT3NIKNk59TflOVzixGIhYLRhIDhXlM3mGycdT1pV3p6PHXYodtvv6qY=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+Avd/n7y0Oeu/mguMyr2lSeA1vg7Lb4rtPfGZdDrkPqKaDC2fM
	0hTWLekODKYqKzie/ROtbJG8BnJ0VRgsP6fJlv4afhP4z5vFbOoiBCB5i4/2OIkbAac=
X-Gm-Gg: AYBFou0kCSP+PX+FWa63OZs/Dsvp1dlsrppep6AX/mzumkFdTv4Nra9ofD+ihfgTioQ
	1F9pHbE//eTVgn/zqZVA6cW31Eg78jLQy/lkeMe+w6hdKRo1AZI9etOPSAIMq/XsrASdqWHTX7f
	v/MtQXNKNua2aQiFG6zMF7DKcrhYddK2ZGMP5ocSrfETRYMqLL0whOXKFG/S07Gyf7T/1iF3nNs
	JaIcneQjcLIcM2dVgjjTLDyxpxekL6pRHgudq8AmyZKEJfh8sOOeLeTLh5pP5j/2K7Mo42zQgXW
	IdSIZgnxg9NbJVT9x1zC8NwnG2MACPUteDbN84oZh4R+iJLg6e8HSvoEKDMS+tpsHJzLWNxn2d3
	j6FuwbFIZRhdMwLt7mNOozmHrpQ2fAH33FQBBX5cLfu01j+6yRHTCYLtZk0ONCkodkapHus35sX
	H1q8Qdl+eoVdXlgBObPsvRG1UpGjmgOAB/nlLs/exTfJxsUHJvFuZ1F8CTzjnQkGT4zwBsW1TNS
	jUR0Xcq79icyCCzgpG0EPcDKtaBnZf1phodCOyfYYYDgYENgUI2F4x9/VOzk39fievLQjoc6PPD
	gQ347KSKWCDCviw/P9+txLynbJxwlt5Y4Q8NE3qNLeiPaYd1BXAVWwoSBpiMq1JPHmk3iiqvqgh
	aWCT6Jk3i19RBy90Xbedd5e7EVsl9D7vvLpXAAQ==
X-Received: by 2002:a05:7022:ed02:b0:196:aa86:fcf3 with SMTP id a92af1059eb24-1b3ba7b2b01mr1258881c88.26.1794315017171;
        Tue, 10 Nov 2026 04:50:17 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: jgross@suse.com,
	sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com,
	boris.ostrovsky@oracle.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] xen/pvcalls: destroy the per-socket workqueue on release
Date: Tue, 10 Nov 2026 21:50:02 +0900
Message-ID: <20261110125002.46683-3-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110125002.46683-1-yhlee@isslab.korea.ac.kr>
References: <20261110125002.46683-1-yhlee@isslab.korea.ac.kr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1794315019-35EC6AE4-5671CC62/10/78177266408
X-purgate-type: clean
X-purgate-size: 1939
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

Destroy it right after flush_work(): the IRQ is disabled and sk_data_ready
restored by then, so nothing can queue new work, and the rings are still
mapped while it drains - pvcalls_conn_back_read() reads map->ring and
map->data, which xenbus_unmap_ring_vfree() takes away a few lines later.
pvcalls_back_ioworker() does not take fedata->socket_lock, which the
backend_disconnect() caller holds here - only the socket's own
sk_receive_queue lock - so draining it from this point is safe; the
flush_work() just above already has the same requirement.

Fixes: 5db4d286a8ef ("xen/pvcalls: implement connect command")
Cc: stable@vger.kernel.org
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
v2: destroy_workqueue() moved to just after flush_work() (Stefano).  v1: https://lore.kernel.org/all/20261109122324.30134-1-yhlee@isslab.korea.ac.kr/

 drivers/xen/pvcalls-back.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/xen/pvcalls-back.c b/drivers/xen/pvcalls-back.c
index dcefa91a40cd05..d97c5eca5f3513 100644
--- a/drivers/xen/pvcalls-back.c
+++ b/drivers/xen/pvcalls-back.c
@@ -452,6 +452,7 @@ static int pvcalls_back_release_active(struct xenbus_device *dev,
 
 	atomic_set(&map->release, 1);
 	flush_work(&map->ioworker.register_work);
+	destroy_workqueue(map->ioworker.wq);
 
 	xenbus_unmap_ring_vfree(dev, map->bytes);
 	xenbus_unmap_ring_vfree(dev, (void *)map->ring);
-- 
2.43.0


