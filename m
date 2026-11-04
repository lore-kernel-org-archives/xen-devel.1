Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF1B606A331
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 13:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=Iv2q0cOU
Received: from list by lists.xenproject.org with outflank-mailman.1471922.1680055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xObOy-0003iq-TP; Wed, 04 Nov 2026 13:51:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471922.1680055; Wed, 04 Nov 2026 13:51:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xObOy-0003ij-Py; Wed, 04 Nov 2026 13:51:44 +0000
Received: by outflank-mailman (input) for mailman id 1471922;
 Wed, 04 Nov 2026 13:51:43 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1xObOx-0003eU-Fi
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 13:51:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xObOw-00EfZF-Sd
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 14:51:42 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6aeb3869-bab6-0a2a0a5309dd-0a2a4502df3e-20
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 14:51:42 +0100
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6aeb3869-6ca4-0a2a45020019-d155dd29e98f-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 14:51:37 +0100
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48bbb06e746so470445f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 05:51:37 -0800 (PST)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b4107b7198sm27919235e9.0.2026.11.04.05.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 05:51:36 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1793800297; x=1794405097; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zyhWJc0WzTY4V2MRzOh2aP3P8zgX4P7gXVVJwlwaSC4=;
        b=Iv2q0cOUu91VEqaqpn4+JLlDUg/wuwNHSYQaWbRERkjUjAnb0ouQ4z0rOB1/kP9FCQ
         BBc9oez0mRvNARDNHjN9FLWyGRaJyDjNQYHJNBgvrBfBczNm++BurfXRVuw/UMoponxO
         MBVMy8gcIAiTB3Sjy/2nKDXwXvuoImX/r8Kbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800297; x=1794405097;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zyhWJc0WzTY4V2MRzOh2aP3P8zgX4P7gXVVJwlwaSC4=;
        b=yd9Z+vY8SUwhyBBDWo11Z1dnzIiSWwfB4b7Vgnd290mneK3leDV/bMZiWAO9GE3u+j
         Q+b5j9NUtk1ZIits9JzbCUyQIV6RdorzCKnjO0w8aBGNckA+R4lhVDggp0Q33p35D9Ff
         yqv68P0KQphZoPUpf8kIXfzvL4fBXM4diKgyl53BGeoTmfQNXKrVB9NarSJpmI+h8qAc
         06gp5/3DTSoNG9uugeYNLAVDOlPsHyPb58QmDHkXavtEBTVpWjNnJ36KCJiw4L28aGhi
         /kdpA/vyJcJ74QAey3s5pd8nFnoIBjdZ5IhuCxOBqSzye9D1t7iR05Bg0nn5cS9jjM+v
         wr9Q==
X-Gm-Message-State: APuU4Z8/q3vLtGK5h05j7qsv6ZRTsw+J3QQFPbXLqN7M9yubyI8ihsTl
	qolsGAxKGjgc9YbpHlN7xn35pY4Hddbam7udmlOBC9GnD2SeeUgpdX49fcxQolC4VTtB9Oc3pWH
	prtStTck=
X-Gm-Gg: AYBFou2f23YlzYuxl7DArUZwCcYqe6v4QV/PMUObfIozLJYj9zyj3y63leKv1P7tsaT
	xuKEwJVvA/gDFizTkNBpUD6mILgJs+aq1dutu2/8Lh+YAxzAB/KqgMSIpXil4kbvy0b3TzWcyBW
	uua0pA2O2TMOo8wzs0ZgIZDVyNCOgCzIe3hwHz03o3+sfsrlr8sEdoVuRafogTU7P6NGBJbmKlk
	iK+PgVOI7hv4Rp0QcpPJ5JklHfZQi/xZpXn+p1zUb0SxI8IE1NzPQxzFzYoHM4Acs5GZZk42Omz
	3bvx85Qn7Br+t7Dey7beCPMHSjw991MRA5/RJH+7RG4jeJbL2N0Pbdr4yMLH8dKHIC+bR9SoIeR
	uVAtgujxTtYaX2OvexjP6x980ajBrYpX6kpHhXdvqvrph9y07K3+bljSwBCPm7QkcX0cXUwI9Ii
	m6EL+DTfED8Ve3e2I+ARF5NR/Ty1/kV/8DJE2VJVWMcN/pfun/8dlsZMHlPNZZ24Fblw7NMlRIi
	xA10dprcXed5s3IhMtMo+NxsxQf3r7VlChjHExAyVU7mOTQCM/1WrwdpLO/SCd4ud2AeW7ERqvH
	2VHWJkBcDTTTlMgvqixgMxF7QEnE9yAdoPNjZFyjYftzRsLqXoGE3a/QMHR4xIyNSlPFqYkxGv0
	Oot4KSOYqslckij4Tlsb6vxFn
X-Received: by 2002:a05:600c:6212:b0:4a4:de70:2ad4 with SMTP id 5b1f17b1804b1-4ac17ffa395mr352272655e9.22.1793800296536;
        Wed, 04 Nov 2026 05:51:36 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/2] xen/build-id: Further cleanup
Date: Wed,  4 Nov 2026 13:51:31 +0000
Message-Id: <20261104135133.2209628-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1793800302-31DC92AC-58C54EAB/0/0
X-purgate-type: clean
X-purgate-size: 515
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is the final piece of work 32b63424e4e4 "x86/EFI: Fix detection of
buildid" which is rather overdue a first posting.

Andrew Cooper (2):
  xen/build-id: Introduce is_gnu_build_id()
  xen/build-id: Drop xen_build_id_check()

 xen/common/livepatch.c    | 11 +++-----
 xen/common/version.c      | 56 +++++++++++++++++++++------------------
 xen/include/xen/version.h |  4 +--
 3 files changed, 35 insertions(+), 36 deletions(-)


base-commit: 2043d22b7e926f508cc23391b4c75325fa7211e9
-- 
2.39.5


