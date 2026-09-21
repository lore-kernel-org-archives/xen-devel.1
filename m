Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050DBC982ED
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 17:54:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427764.1650591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8iDw-0002l7-Tp; Mon, 21 Sep 2026 17:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427764.1650591; Mon, 21 Sep 2026 17:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8iDw-0002l0-Qv; Mon, 21 Sep 2026 17:54:40 +0000
Received: by outflank-mailman (input) for mailman id 1427764;
 Mon, 21 Sep 2026 16:28:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <csh0052@gmail.com>) id 1x8gsq-0005zp-Bp
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 16:28:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8gsp-0059C1-Gf
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 18:28:47 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <csh0052@gmail.com>)
 id 6ab15b2f-e002-0a2a0a5209dd-0a2a450a9c90-8
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 18:28:47 +0200
Received: from [74.125.228.12] (helo=mail-pz2-f12.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <csh0052@gmail.com>)
 id 6ab15b3d-f2d2-0a2a450a0019-4a7de40cb546-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 18:28:47 +0200
Received: by mail-pz2-f12.google.com with SMTP id
 d2e1a72fcca58-8631d0023daso2349552b3a.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 09:28:46 -0700 (PDT)
Received: from SANGHOON. ([1.220.132.212]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cc72aee0fbasm3746033a12.25.2026.09.21.09.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 09:28:44 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790008125; x=1790612925; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ySNS+GwrhibfzjzLbLOnb295wmy2g2Ft16DvkrgaNXI=;
        b=GBGAgbM4cXGR1NqBuBKqr+HlU/ZQh54f5yER2/9ZUCTjBEgIljRpx0BROTfUmrxwQI
         eL7dkk9mM4k31JbRrEHybJvEoOb2PNjzkgb4zYa4YcA0PyuW4E/qjsYAQw6Vf2cpVj+Q
         3bMv0d/cLZI+wMU/dR+rBlMcMhr/JiL7hecwmNYKgn+vlfvcmOOqTQFxbQefyr5L+6wh
         nEVLTSGNTqW3aqLLicSzwI6YtiA5RIuV872gaF9geKKRqhn5wVQIlWNHym3X+MIzyxfZ
         sE9B/6ux4QK2oH5459AcCO7BC1A94nj+JNg9pvBdDFw3Gu5E8Ld5MC5WNZHtwzQYUNur
         HUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790008125; x=1790612925;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ySNS+GwrhibfzjzLbLOnb295wmy2g2Ft16DvkrgaNXI=;
        b=l1jXrNulWf0pPyTKcnCLPbQ3y45EVGv2UA5zJNliNh+WVRGebLnX0ng4oioAXKIoH5
         fORSxwS8XqU5NXS9aZ2KFt3jCr7QBNXjyU7Sx4d2KHxLvyfbBgUXErPaYo2KevoGNuwa
         ebpl4IYimTYqp7A77E0iP5wUJ9/8yQB7kr5VAZps5+HSZ9ylMRA4oK4RIQQp6/4094ja
         aWatfYTq97W3l0rAKF1MewkKivIz8YafZGZkbyM8LhQW041QnGZbaaXEV0WOzRZSGaZK
         M3f83TJTwJICVwGBThiw6CfuFxsFRtbEqoq1pQt4AC1mFQnXHSgkaLxdsmsnr/FpNcLV
         TUOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfhWiva0meoCZR+nla3utjvi8K3+tgj0JcSjN1DTfSlRoH426gCur861MPyMMlfBNcR9aMU2lA3fk=@lists.xenproject.org
X-Gm-Message-State: AFuF++mYiKmmQzYFlBKZzHRvtjEmX2uYThEpf6Z2z/duIpLkfaESgdS7
	tVygoVBREEZH7pnLjk92BCOcrijJ+B6N/M1mFYi6OSbBwNQJxvlSdXp2GSnKAtar
X-Gm-Gg: AYBFou1mw/moaFR7RXgPxKA0ScpFnnexIHur0yOx8exbpt12Vd0j/P9SdNbzIXYQ3xs
	NBexo9p2iITevHwRuM/ZJNGEbBVh8+iz7TGdFemZINzLyiZWY5G84mkx4EdHybi7JMdzQN7YFL0
	ldjDHsxDZnxqEdVGsEV/Y9JFit+FRImq6DEMxlabljV17zULt5rVGVBFLu0PG638ttWeQNynVyn
	nwu9stXIP0ypMQUajU1JS75/QtXQbGTL+PaDpsSQ4QIv3H+632pJno4a1Cubbb7U2pCE1EBMN7s
	NMf7O9a2lgKgtI6c7a+zB1RLtn0i4Yh8+ImDkNg1waJDTcWxZlVm4mVtSOspItkwxXcS6mPNtEO
	wRGq0P1lSKqn4e+5DaUn1oLv9wawVHMGXC1ANfmg7yr3MKcgwEZyV7h0zB1PU/OndGLyUi5BClJ
	UHw0wLfgDwu72RlK8ckIomxoyRhM0rrTwKgcmE/E8aIZt72y3WB+fQBImJ6XKTDRKOY9evxtEpW
	2NiN3kIX9v2wDfil0Vb0+k6
X-Received: by 2002:a05:6a20:c90e:b0:3dd:a195:dd5f with SMTP id adf61e73a8af0-3dda195e43fmr11708071637.65.1790008125115;
        Mon, 21 Sep 2026 09:28:45 -0700 (PDT)
From: Sang-Hoon Choi <csh0052@gmail.com>
To: Juergen Gross <jgross@suse.com>,
    Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
    Changyul Lee <lcy8047@gmail.com>
Subject: [RFC] xen/pvcalls: possible bind/disconnect mapping lifetime race
Date: Tue, 22 Sep 2026 01:28:34 +0900
Message-ID: <179000811428.1227592.17782105050930623388.idr-bug-82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1790008127-599C1CFC-F483B92E/0/0
X-purgate-type: clean
X-purgate-size: 2363

Hi,

I would like to report a possible race between pvcalls_back_bind() and
backend_disconnect(), found during source review.

The source reviewed is mainline commit
5dd1818b15d98d4a20806cd00b1b40320b06004f.

pvcalls_back_bind() inserts a new sockpass_mapping into
socketpass_mappings under socket_lock, then drops that lock before
installing the socket callbacks:

    radix_tree_insert(..., map);
    up(&fedata->socket_lock);
    write_lock_bh(&map->sock->sk->sk_callback_lock);
    map->saved_data_ready = map->sock->sk->sk_data_ready;
    map->sock->sk->sk_user_data = map;
    map->sock->sk->sk_data_ready = pvcalls_pass_sk_data_ready;

backend_disconnect() takes socket_lock, removes passive mappings, and
calls pvcalls_back_release_passive(). That function restores the socket
callback, releases the socket, destroys the workqueue, and frees the
mapping. The request IRQ is unbound only after this cleanup.

If disconnect overlaps the threaded request handler, this appears to
allow the mapping to be freed between insertion and callback setup:

    bind handler                    disconnect
    ------------                    ----------
    insert map
    drop socket_lock
                                    take socket_lock
                                    remove and release map
    access map->sock

A draft change holds socket_lock through callback setup. This preserves
the socket_lock -> sk_callback_lock order used during disconnect and
addresses the interval above. It is not a complete teardown fix: an
in-flight handler could still insert a mapping after disconnect has
finished walking the tree. Quiescing the request IRQ before freeing
mappings may be the better approach, but needs a separate teardown and
deadlock review.

The narrow draft was compile-checked as pvcalls-back.o with W=1 in an
x86 allmodconfig build at the commit above and passed checkpatch. It has
not been tested in a Xen frontend/backend setup. There is no runtime
reproducer or sanitizer trace, and no security impact has been established.
XEN_PVCALLS_BACKEND is marked experimental in Kconfig.

Is there synchronization outside these functions that prevents the
request handler from overlapping backend_disconnect()?

Reported-by: Changyul Lee <lcy8047@gmail.com>
Assisted-by: LLM

Thanks,
Sang-Hoon Choi

