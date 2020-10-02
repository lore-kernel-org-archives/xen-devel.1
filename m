Return-Path: <SRS0=mHc1=DJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 519E8C47423
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2020 13:39:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFE5A20795
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2020 13:39:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jI1Qp3NS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFE5A20795
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.2121.6290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOLHY-0001mL-EW; Fri, 02 Oct 2020 13:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2121.6290; Fri, 02 Oct 2020 13:39:32 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOLHY-0001mE-BJ; Fri, 02 Oct 2020 13:39:32 +0000
Received: by outflank-mailman (input) for mailman id 2121;
 Fri, 02 Oct 2020 13:39:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vuVU=DJ=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kOLHW-0001m9-Uu
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 13:39:31 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 77bda39c-0282-427d-baa6-7e104d0205b8;
 Fri, 02 Oct 2020 13:39:29 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-Dq-uan-7NGKD4Nj_AWAQFg-1; Fri, 02 Oct 2020 09:39:27 -0400
Received: by mail-wm1-f70.google.com with SMTP id x6so540382wmi.1
 for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2020 06:39:27 -0700 (PDT)
Received: from localhost.localdomain (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id k8sm1632520wrl.42.2020.10.02.06.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 06:39:25 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=vuVU=DJ=redhat.com=philmd@srs-us1.protection.inumbo.net>)
	id 1kOLHW-0001m9-Uu
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 13:39:31 +0000
X-Inumbo-ID: 77bda39c-0282-427d-baa6-7e104d0205b8
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 77bda39c-0282-427d-baa6-7e104d0205b8;
	Fri, 02 Oct 2020 13:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601645969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gJa6lLjujz4Z6eodBHhDkQDnUdrQBiirVQpBE1f30O0=;
	b=jI1Qp3NSAg5mIkSR+LFYc60ABOHs570gXQRDW19u7oOFbWo6dc1mTLPNHlyE6CpZz5BoZ1
	/prq3xjomuOpGFXNgXhSJbZ41V1JgNVilznBxvg4i2K97T8xqzGuDljO/Mm8Bvx2Z8K7RD
	IFnFmVdqaCgOSoyom9DAQUmWOwV0+Hc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-Dq-uan-7NGKD4Nj_AWAQFg-1; Fri, 02 Oct 2020 09:39:27 -0400
X-MC-Unique: Dq-uan-7NGKD4Nj_AWAQFg-1
Received: by mail-wm1-f70.google.com with SMTP id x6so540382wmi.1
        for <xen-devel@lists.xenproject.org>; Fri, 02 Oct 2020 06:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gJa6lLjujz4Z6eodBHhDkQDnUdrQBiirVQpBE1f30O0=;
        b=X5Kcelz8jKgrACm6S6oQqX3mnpHWEGi4GqOblFijlqHSOeNwBxDTgbW7N058HxG+0Y
         /ltr2/GZ59qqpeT6HfYg4eiIAg3l7TcIYWdCi+foJeaUu0MPDKDbumJnY0f5LbxVilBk
         9aaO/i6f8OSBSDG6NW0bEUqvU4dXcZHydlO56DEV+HOu6Jj14LMGARYs+ZEUz/goXMLn
         P2OshggXhtBFqoMdTsqh/oxSe+p6Yutq02nEwMOz2gIr9+KckByY/HhBTVYDXhVDG8Hp
         2xYvvuXq1bFuzdo0NS0i0Gv8QSi/4cNK8Ufp/qTovZJ0nQu8Nl66C8kVVVQztZRQ+oyx
         KjEg==
X-Gm-Message-State: AOAM530nSUPAqkmIyquGttjD/ccSQAHr4+JjHAWqB0GEIiGpU5U7a4xe
	+lg0vGDIifR5GJkIXmsutcrmtH0habpDrabAv+l11P9gMpvLytOCY4E7Q/Pg3X0sbtvgkHU84xS
	fuSAhGKfp5ipwjJCuB1km21B3Tgk=
X-Received: by 2002:adf:a418:: with SMTP id d24mr3198323wra.80.1601645966803;
        Fri, 02 Oct 2020 06:39:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtxtNy6fW+4PHTbuPzJPXeHOxCiDquXwGv5njMeErxQZK42D+who95M+frGMmK92H78CfTVA==
X-Received: by 2002:adf:a418:: with SMTP id d24mr3198294wra.80.1601645966623;
        Fri, 02 Oct 2020 06:39:26 -0700 (PDT)
Received: from localhost.localdomain (74.red-83-53-161.dynamicip.rima-tde.net. [83.53.161.74])
        by smtp.gmail.com with ESMTPSA id k8sm1632520wrl.42.2020.10.02.06.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 06:39:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	xen-devel@lists.xenproject.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Eric Blake <eblake@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 0/5] qapi: Restrict machine (and migration) specific commands
Date: Fri,  2 Oct 2020 15:39:18 +0200
Message-Id: <20201002133923.1716645-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Reduce the machine code pulled into qemu-storage-daemon.

Philippe Mathieu-Daudé (5):
  qapi: Restrict 'inject-nmi' command to machine code
  qapi: Restrict 'system wakeup/reset/powerdown' commands to
    machine.json
  qapi: Restrict '(p)memsave' command to machine code
  qapi: Restrict 'query-kvm' command to machine code
  qapi: Restrict Xen migration commands to migration.json

 qapi/machine.json      | 168 +++++++++++++++++++++++++++++++++
 qapi/migration.json    |  41 ++++++++
 qapi/misc.json         | 209 -----------------------------------------
 accel/stubs/xen-stub.c |   2 +-
 hw/i386/xen/xen-hvm.c  |   2 +-
 migration/savevm.c     |   1 -
 softmmu/cpus.c         |   1 +
 ui/gtk.c               |   1 +
 ui/cocoa.m             |   1 +
 9 files changed, 214 insertions(+), 212 deletions(-)

-- 
2.26.2


