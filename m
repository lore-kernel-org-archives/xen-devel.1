Return-Path: <SRS0=Jb4W=DF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF7A8C2D0A8
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2020 10:55:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 667492074B
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2020 10:55:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="j47a41MC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 667492074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMqo2-00045x-T5; Mon, 28 Sep 2020 10:54:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMqo1-00045s-I7
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 10:54:53 +0000
X-Inumbo-ID: e700fdc8-2518-4c7c-acdc-f143c070f7f2
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e700fdc8-2518-4c7c-acdc-f143c070f7f2;
 Mon, 28 Sep 2020 10:54:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601290491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qws5fKafNcdbnbM1Hj4ODyscdm/15K/S0hw1FOXdRDQ=;
 b=j47a41MCUvc+RoHHPQc7w8vqZcVqupyA6IVzOHn0RSid6nvwXfJnhoi7qC9Cra06qImk3j
 d8Ch3vKpn2DcNIlyO+LYuQq9C8FPLpplA09t16UoDcPlOODuTrNldwDTROtRMH3QaOAXCs
 a1Rc4W0J1dZF1fCY1V2ndtHBEyxvHBY=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0CD01AE07;
 Mon, 28 Sep 2020 10:54:51 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 00/12] evtchn: recent XSAs follow-on
Message-ID: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
Date: Mon, 28 Sep 2020 12:54:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

These are grouped into a series largely because of their origin,
not so much because there are heavy dependencies among them.

01: refuse EVTCHNOP_status for Xen-bound event channels
02: avoid race in get_xen_consumer()
03: don't call Xen consumer callback with per-channel lock held
04: evtchn_set_priority() needs to acquire the per-channel lock
05: sched: reject poll requests for unusable ports
06: don't bypass unlinking pIRQ when closing port
07: cut short evtchn_reset()'s loop in the common case
08: ECS_CLOSED => ECS_FREE
09: move FIFO-private struct declarations
10: fifo: use stable fields when recording "last queue" information
11: convert vIRQ lock to an r/w one
12: convert domain event lock to an r/w one

Jan

