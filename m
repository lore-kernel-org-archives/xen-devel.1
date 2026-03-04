Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679B6EDEC05
	for <xen-devel@archiver.kernel.org>; Wed,  4 Mar 2026 01:52:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1245072.1544430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxbPb-00069m-Gu; Wed, 04 Mar 2026 01:52:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245072.1544430; Wed, 04 Mar 2026 01:52:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxbPb-00069e-CJ; Wed, 04 Mar 2026 01:52:31 +0000
Received: by outflank-mailman (input) for mailman id 1245072;
 Wed, 04 Mar 2026 01:52:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0T8J=BE=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1vxbPa-00069T-2D
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 01:52:30 +0000
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [2607:f8b0:4864:20::a2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc37d289-176c-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 02:52:28 +0100 (CET)
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-56a9402b52fso5382138e0c.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2026 17:52:27 -0800 (PST)
Received: from gmail.com (ip190-5-140-138.intercom.com.sv. [190.5.140.138])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ffaca9c848sm303553137.10.2026.03.03.17.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 17:52:26 -0800 (PST)
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
X-Inumbo-ID: cc37d289-176c-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772589147; x=1773193947; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AZ079vS7A/A4BZyc3h4DSpRr2ArVx5hvIslaT33EcVI=;
        b=BtFTWad5DkwJTTsn9YQ1I0lkM+rXW2InQx2Wa7mEo0F2eSkCeHecbgeGJ6TO57cIMq
         IFp+G48Egg51qGHS7eeXSdPoZ6dXfkN/gdYPCW5oixtMU54VsUcSA0bXOb+3wUCnD8pQ
         /It3WuzQURDfpOn9EmbkcBoz0M22P7GeH99BtR0jleSJTM6h0K+wKzOgtPzWIfpYt04K
         cRCv3dzStAePmciuDEnIyBwtNmVpl2PIts68CjNbXFGKelLph1riTFYh4cITdpoUyyxu
         0YFjZ8bQ1bYfCiWNF35LaPKy9nj7UwQdKsCceywV8KRjNMOqa6Rccw6ExjjEFkQH9LJA
         fpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772589147; x=1773193947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZ079vS7A/A4BZyc3h4DSpRr2ArVx5hvIslaT33EcVI=;
        b=U/hKgEZYSdJV+tj2faztW9/UFaVKgVNA7xFCp+YSHpo2pBkBhSZV+gCziIxE12xgY4
         98fMA9dxtW77OBMXE/eM5vGKexBNFCxKZUXbh69YReH8BAEs6M0dub8rCtWbSbHp2Sjz
         dDhbf0ceTV3Uz6GIPw7rv9XzBS9P9kmeL67XSx4W1tk8ZvAHP5E/a6smvGt0IMT7TdAj
         1jqKQEJL2lxjRkC0q48qLDbWVGdKHGUTUXvsltQsZ52++at8DZDNWGFCU6DmlN3HjY3M
         vlp2KpehFPKmU9k4G6sg0o08iSi1u8FYbyv3UmHyOwpNgPz7LaGCHkHvHiVy4fLL4m48
         HHcA==
X-Forwarded-Encrypted: i=1; AJvYcCWp8Ku7VL0khdf8aJ6dJxBWwLHVO+ufnxMeyXvvn6FOisqNKWfZgSxoXryN5u6VItGBuJu+mcikJq4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3iWo59kx+F8YBwh8pPsSqhatEfjZdF4qA19XRdDX/9ZEsJi5K
	vLVbz9DeyhropXvT/Oj//C8IWRRg0GQH/daDxnhoG7XCGCd4CkKtCZ6a
X-Gm-Gg: ATEYQzy2RJNeNWvN9kOtLrLzj5d4NLQ5THl/EUcCZJVk4APZX+W0hbZaypQtnj7WB4n
	iP8Dbjz5xNbHG/tdbDoFkjSuDo0YcKoT5Jnqp3/DTHMA7qEkidDFfvSqa3GGVymjQxmCRvyfeQS
	FGaciL64U73ttePDNmJmBkvESqrSTvZ87ChBeN21ZcBZ5nO4KeHwk706L+Of6FUPsjG0BUl17Ja
	DLCHGMx3qqO7tyKMTbI81kuSivBVO1kneDB/LOG7IkTBtW/AZLGTKqCZyF8GNLj60Wa4tZ6/Xyg
	dz4p//XLasuXW+naRLPFVc7oCZd2j4/Rv9yeO3xpn0ZzWmYsqSRJX9hB8lrIyN9rM1NNK1zhNOo
	XvmfAV0KFcnDTWSDCN3nHHdRlkALjiZd3uYwa8c3ir7T7vpWFfdopme/S5fUtcBaFQJBX2kBVpi
	rs3Oym8X26iK5sWFfeXa5zgM6sdYt8jgibUUSDYzsS8e0zXm6kKd1m2SidnA==
X-Received: by 2002:a05:6102:f10:b0:5f7:307e:80d9 with SMTP id ada2fe7eead31-5ffaafc647dmr351581137.28.1772589146690;
        Tue, 03 Mar 2026 17:52:26 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org
Subject: [PATCH v1 0/5] xen: pvh: Add machine option to disable the mapcache
Date: Wed,  4 Mar 2026 02:52:16 +0100
Message-ID: <20260304015222.979224-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

This adds a mapcache option to the PVH machines allowing users to disable the
mapcache. To remain backwards compatible, the option defaults to "on".

When disabled, all guest memory is mapped at startup rather than on demand.
Starting QEMU may take longer in this mode, but runtime overhead is reduced and
it also enables virtio vhost backends to work.

As a trade-off, grants are unavailable without the mapcache and guests with
large amounts of RAM can take quite a while to start.

Cheers,
Edgar
 
Edgar E. Iglesias (5):
  xen: mapcache: Assert mapcache existance
  xen: mapcache: Add function to check if the mapcache is enabled
  physmem: xen: Conditionalize use of the mapcache
  hw/xen-hvm: Add a mapcache arg to xen_register_ioreq()
  hw/xen: xenpvh: Add prop to enable/disable the mapcache

 hw/i386/xen/xen-hvm.c           |   2 +-
 hw/xen/xen-hvm-common.c         |  18 +++--
 hw/xen/xen-mapcache.c           |  16 ++++
 hw/xen/xen-pvh-common.c         | 134 +++++++++++++++++++++++++++++---
 hw/xen/xen_stubs.c              |   5 ++
 include/hw/xen/xen-hvm-common.h |   3 +-
 include/hw/xen/xen-pvh-common.h |   2 +
 include/system/xen-mapcache.h   |   1 +
 system/physmem.c                |  13 ++--
 9 files changed, 169 insertions(+), 25 deletions(-)

-- 
2.43.0


