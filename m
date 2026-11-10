Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E8F606A744
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 13:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=c8aRxsct
Received: from list by lists.xenproject.org with outflank-mailman.1481729.1685642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQlbD-0001MI-6h; Tue, 10 Nov 2026 13:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481729.1685642; Tue, 10 Nov 2026 13:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQlbD-0001MB-3n; Tue, 10 Nov 2026 13:09:19 +0000
Received: by outflank-mailman (input) for mailman id 1481729;
 Tue, 10 Nov 2026 13:09:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <yhlee@isslab.korea.ac.kr>) id 1xQlbB-0001Kv-M4
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 13:09:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQlbA-00AkkS-VA
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 14:09:16 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6af31775-2eae-0a2a0a5409dd-0a2a4508d8ae-20
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 14:09:15 +0100
Received: from [74.125.82.44] (helo=mail-dl1-f44.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6af31305-f659-0a2a45080019-4a7d522ce462-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 13:50:14 +0100
Received: by mail-dl1-f44.google.com with SMTP id
 a92af1059eb24-1a2af4c8d00so684419c88.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 04:50:14 -0800 (PST)
Received: from yhlee-960QFG.Davolink
 ([2406:5900:1044:110c:88e2:4271:a9b8:cc50])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b3b5b79649sm7614830c88.21.2026.11.10.04.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2026 04:50:11 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i="@isslab-korea-ac-kr.20260707.gappssmtp.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794315013; x=1794919813; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2+X51G9ewXmU9QYzYDv2H+VC+EelW5F82dLqqoHsS6I=;
        b=c8aRxsctQVYMRP5DR3NBl7lyP+TzKWuTmGdxyxff1wqrWSq2F8dBCyCggAp+QBeXX6
         jz8/wb0SOVfcNlfObyeh4k2JlEgAJ4oSJb9KH7cd9WMYDdSM2r6LzWd3TTeph/VcOTiY
         Wx3aDdA6IkG2+AbydPpyeyM1bVs2DdOq/4pOvYKvsWDlttpzFtrZQoagahjxUn95qeAH
         Ja9jxyRMQf3xTbf/1ka7NThEqeCqBQMfVYZS2TerulwzyTgj6n+SAbW/D157Jg4ILHf4
         y6IBuRupzi8prSRAO+AG1RirS+MBh1V/6od/bYo8HJqMdQgLUBdQBGQxtE4SCICDRrB+
         Ocjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315013; x=1794919813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2+X51G9ewXmU9QYzYDv2H+VC+EelW5F82dLqqoHsS6I=;
        b=qb3nzZbGLjrAF7KLH7HAGr8cUcE2eyGA7z6ZLdZNy8CgH62chtVcmN5QAW1hQX7nwX
         TQSbamjyYoJAdqY1OKPpEdrxMq1XYwwte9GFYTilhxeJzB0ElMurBvogy5EdCGdDxDqc
         133r0iHryb82bo1GawqYFSbTO3et0jwZnuBBVvlNaOqYTaBOdqLmWHBLGmPSiQ7/qVJY
         xH5oqN0SyalT62B07t9Y8ESUvU+EjxBadgoRPvfroR3IhkDzATBHXrPu4VDVaR6UOFXb
         g7PFqgWEsuzKfmzns/Jj2I759JJGwOlKPQMdXEtYxm2l5qakWMGb/VOX/ur7uMA3PNoE
         5m+Q==
X-Forwarded-Encrypted: i=1; AL+hErFQJ0AH5ZyNRlmw3m8nx6av1pK9iXYYH3BN393M/3PGEX4B0Q/H3pXGiJhallKkQRRpyAJVaYHMaLs=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/xl+e/qb24HZ8t3a6+GVP5chE5c6TZUjFrCEfMT2Zsp3N3VG01
	4yvgM4byY22+/DvujL7s58CZT0T1dwqoiw5teduudkROok9vE/fdSsIGFCmU7HoA0Tk=
X-Gm-Gg: AYBFou3e0uFD4C6P7tqcTBVbShWfmisS3UjPJuROOdYh6KIhjVmNzAe5xs7ig35yZPA
	Wo/UURYrffppE3jJLyvxpj3zejKAICZZ10gtUk9eYKE21efdHA4IibInAt/tGotWq6X0ewbOq0l
	e8XOUbBw+4GIR4dI4alL8N0OtqF3rkTO9H9ZGZVJYbGaJSSDJiZmzI4qq+9Ahsx2UTcKfiEvGA7
	9nKvAKNp2LG4zEkJLtTqGSz2vRMSr0srt1FgujuGc9SJ3/C7itIS9Vj7p+/dvlSTB9jj8rIGat7
	TghIzB893ErZhpAFZ579jEVocF+KVblo/VLSfu09CoOmVuinuYIFSjzJL6CN0CLOANzvOguYEQ0
	2fnvDt2OUZhCxr68kzbH55y5eQHMjVeQsCnLF36W9fRLso5IWbkKpYLcbShVncM6xNv8OuiUID9
	QngmnVM5sCQC8w44E/wzpg1y1NUuOLgnXwCGGZBjuczSoDonqXRXU3HT01DIBT+2sWQs6YPPOg8
	Zjvhw2B+iFNBikrubOa+0kAMIExJZnPDd3/xi3hpoBK+H3lBFl1j/xgwGL0TEPKnkitKk9gJ7LA
	HivOauTw6KZEICNDc0OJivqQFqEvKY4Zq7srqS+NiKfpkmCGfVUQSmVuiSN6gXHFgkCuxq9Ngg/
	QSGb1Z18NO3gpC0zEX8p7yUbdGvHIn525Eb1ouw==
X-Received: by 2002:a05:7022:3c18:b0:181:73fc:e53 with SMTP id a92af1059eb24-1b3b617f6b5mr3186213c88.29.1794315012523;
        Tue, 10 Nov 2026 04:50:12 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: jgross@suse.com,
	sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com,
	boris.ostrovsky@oracle.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 0/2] xen/pvcalls: fix the backend error path and a workqueue leak
Date: Tue, 10 Nov 2026 21:50:00 +0900
Message-ID: <20261110125002.46683-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1794315015-CF75B87B-B36E251D/10/78177266408
X-purgate-type: clean
X-purgate-size: 1109
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

1/2: every error path in pvcalls_new_active_socket() runs list_del() on a
{NULL, NULL} list_head, holding socket_lock.  2/2: the per-socket workqueue
is never destroyed.  A frontend reaches 1/2 with one bad ring_order and 2/2
by connecting and releasing sockets in a loop.  Nested-Xen lab: 5 of 5
cells oops as shipped and 0 of 5 patched, a normal connect moves the same
bytes both ways on both arms, and backend/pvcalls/<domid>/0/state after
teardown reads 4 before and 6 after.  Reported to the Xen security team
first; PVCalls is not security supported, so posting here as suggested.

v2: 2/2 destroys the workqueue right after flush_work() (Stefano).
    Picked up Reviewed-by.
v1: https://lore.kernel.org/all/20261109122324.30134-1-yhlee@isslab.korea.ac.kr/

Yehyeong Lee (2):
  xen/pvcalls: unwind pvcalls_new_active_socket() step by step
  xen/pvcalls: destroy the per-socket workqueue on release

 drivers/xen/pvcalls-back.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)


base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
-- 
2.43.0


