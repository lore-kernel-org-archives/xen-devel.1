Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60B4606A321
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 12:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PtDx28ru
Received: from list by lists.xenproject.org with outflank-mailman.1479950.1683847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQOSN-00055P-Td; Mon, 09 Nov 2026 12:26:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479950.1683847; Mon, 09 Nov 2026 12:26:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQOSN-00055I-R6; Mon, 09 Nov 2026 12:26:39 +0000
Received: by outflank-mailman (input) for mailman id 1479950;
 Mon, 09 Nov 2026 12:26:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <yhlee@isslab.korea.ac.kr>) id 1xQOSM-00055C-LH
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 12:26:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQOSL-003obI-2M
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 13:26:37 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6af1bbf2-2eae-0a2a0a5409dd-0a2a450cb26e-26
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 13:26:36 +0100
Received: from [209.85.215.171] (helo=mail-pg1-f171.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <yhlee@isslab.korea.ac.kr>)
 id 6af1bb46-f479-0a2a450c0019-d155d7abc8b6-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 13:23:35 +0100
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-cdb681de50eso215414a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 04:23:35 -0800 (PST)
Received: from yhlee-960QFG.Davolink
 ([2406:5900:1044:110c:3d70:1891:1a66:b169])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b127912d62sm6836905a91.11.2026.11.09.04.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2026 04:23:33 -0800 (PST)
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
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794227014; x=1794831814; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I1mjq6MyeA/h9ILt+jeLEku3zY9kIcs3gn2aPes0dRk=;
        b=PtDx28ru6azKqHTZjrK/lWTd1ubu8uKI01FUP5ROxpEeHH+Z4QysmRdmlSmstfm5sf
         40HhboIk4k+PJt4rSi/NWEFibjhGJ3E3qqbYZSett2SwJorEBuARfEfzOhNoGKAHckvU
         ehs5Ch++6AF8tkGHhIcMcQF2uAQ83k6cN3DFXDLpF8e+wo2WwG+ftIVFDUSJyM5ri9ry
         srbIrS3u0I5oinkWtK3lGR6mxU8P/HNynd7JXLRKtMLaieTUQgGrK55PHdsTO/qZy609
         DHgU33/YvV21J7QjTwStUe2DNbMk+VNHIeluXGU2xjWR9GuIXN7nP+Vii0XOkWbU1atA
         DbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227014; x=1794831814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I1mjq6MyeA/h9ILt+jeLEku3zY9kIcs3gn2aPes0dRk=;
        b=ZAcYFfwTnlXifFZAfVzyFcrebR3AC8I61v1UJHJAn2FiHvycjEPdyj+5nEbLfcpCpb
         OS0Zz3+rbt7d8DPMSJ0vS0veAwT2IxI9mAWZ9kpwuIUGDu59hm0ty+U4A8TOACAB6oAG
         BN1uMcXM6BNMQAW9/9UYJjTh/ksFHnB7Odle0VgtOcsZBl7RG+WwlzXhxaxGP5FjcDgK
         I20L4vDa3P+t97710qKUxXy1UI7SfFXNJ5/pSoxmKWLmFjhrVQ2S30sDdkVjZH0y1TrE
         9rCeCZghFKidqLHatCKOQxQAYQ2OQmpzCXBtnspQGeGm9vgf4PgFbIhM+Q3G1SUe64gP
         1VQg==
X-Forwarded-Encrypted: i=1; AL+hErEDRzNzB2NF5wx2ULgyZYmyAqcYyFPYJ4fxtKqlki0MdO91khSeZt7ADJeNZ7d1CD3bq45LWjMU6vM=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/ZtnePlW0LVewDT7NsxEdL18BcIZrWUMRQGWehMxef7h21bqRr
	5fZRCRpt1BfWgJTX3ztQcwc9/jGZ1/ZEGPmkkhJHFR3WlaN/ja48sa74NEOv4stsYHw=
X-Gm-Gg: AYBFou2oYhDx6CKg20RZDA/4nzl2sKHPG+DWP2uVazYsQqCCMEw6oekixhOql97oDOS
	Oz8ZBo966chh9mhuZ+6Evc0tssGAuhx7aMht9ZLhlyD/bNQEIN2/lMVzU8Yk91z0vOOXdCYdupz
	mBWXHXzJGo9Q67FKbCi0NuE+SIF6tkdtPmS5rh8zJLR3fwOJ66P7CxUWEnU0pxwRfkhYZ0n+IBT
	Kg7KHbEAJNsayyFBVb5wTYQYVaIOQ7Z1x75GXUzPE6URO5KNL3kxpwCbke0SnCWm7zahhJDGaUe
	MgFcC0gLE95ASOt9XnjsLpHIrxS8Ts9WqwLA5r5c0PyqFgeyMgPwuUGhhXP17Z067UoNgRgG0/G
	9ERMEQMzUGl1npfbVMiWF5yGuu0LsKnyOLwXNB4ipRBvi3JLnZrbqKIQGH/fX9/58TbVfSLFba9
	xLFY+/sWHGU14UcTc7oDWi0yMpsjIuPMGnQfwTNpIGbe3CSlvvNqkANaC28lvHvx3C1H+sbwB18
	wA1kTUTshir8Xv0tHGPcm887+TJ20wx+mSfW4NbFzaTvg3Scd4UPN9YveDM6ZYOI7efiC7HRVts
	zynAnEUiJzaZ8FUdwF1YWlxcWMULssiBSmWp1Vf5YirGmcdMeymaEiHog6o54ggHgcN4rO/ssPB
	ONJ/G7LXj3OvkZy/QhQV3QUGWAztGOaw2rHZE09ZsIIPdBBQHfGQq4StycDE=
X-Received: by 2002:a17:90b:3dcd:b0:3b0:b35e:b373 with SMTP id 98e67ed59e1d1-3b12d0e71famr3766813a91.4.1794227014043;
        Mon, 09 Nov 2026 04:23:34 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: jgross@suse.com,
	sstabellini@kernel.org
Cc: oleksandr_tyshchenko@epam.com,
	boris.ostrovsky@oracle.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 0/2] xen/pvcalls: fix the backend error path and a workqueue leak
Date: Mon,  9 Nov 2026 21:23:22 +0900
Message-ID: <20261109122324.30134-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1794227016-51B35A5B-3773BBD8/13/0
X-purgate-type: clean
X-purgate-size: 929
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

Yehyeong Lee (2):
  xen/pvcalls: unwind pvcalls_new_active_socket() step by step
  xen/pvcalls: destroy the per-socket workqueue on release

 drivers/xen/pvcalls-back.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0


