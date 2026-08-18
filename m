Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F560C5DF70
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 06:33:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393453.1632261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwDOE-0000gR-6p; Tue, 18 Aug 2026 06:33:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393453.1632261; Tue, 18 Aug 2026 06:33:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwDOE-0000gK-45; Tue, 18 Aug 2026 06:33:38 +0000
Received: by outflank-mailman (input) for mailman id 1393453;
 Tue, 18 Aug 2026 06:33:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1wwDOC-0000gE-Qj
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 06:33:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwDOC-00CAgO-7Q
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 08:33:36 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a83fc9a-e002-0a2a0a5209dd-0a2a4508bf58-48
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 08:33:36 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a83fcc0-f659-0a2a45080019-d1558031d4f9-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 08:33:36 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-49954b88fffso47286615e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 23:33:36 -0700 (PDT)
Received: from notebook.. ([88.230.46.229]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49996188217sm490215315e9.13.2026.08.17.23.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2026 23:33:35 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787034816; x=1787639616; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jrY9WI5HPCaERTSxBCfhoLhMGiowgpjbqH2F9KzZUnY=;
        b=cOxon+Mp0868XIAJXpNL6oRyEGqoKUoaOx7vlgd4rxb2wIXhHrp/z6FmXujYsfulwY
         SXGVIRWcTQrF6srwU3feM7q2PVHpffmSV1RDAFGYioqpBhl0Umk+k1e7xEQ+0tvbuMNi
         30mBcPklrAbFSwGJ8SzJPpdsOQ2mcQDXPBxsV29WiHy3IXQ4fgVGWuZVNJPX8PVFcKwl
         CK/9E48PTQSju/V7WtwhwYCF77RFmLd3jTDshDjiNK9PkbjiBNYWWgWjjLKbhwOz+LU2
         DYKO7X3FLD02ghNrWa+5QTNEsNoI/4Qcbk+diOc8HchyHk+19MTpBts4zWW4Q51BbM2M
         CiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787034816; x=1787639616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrY9WI5HPCaERTSxBCfhoLhMGiowgpjbqH2F9KzZUnY=;
        b=FxFCi4ejweIj+PDCFrki+wQaRELgFbypf51eW1232kflrnhJYkZ/NAOy9xAcTq9uXb
         BihCP3xcRT0RPn3McAlNKZ4ZU7hC71Y6e4IoXRB8ZaKnrvBwBr5c9o+49D0pYlpeqG8t
         pz/sbaKpX5buk4nY3IWnrZKccyinVIRzGxT1etc2HTo5OxbQRj+wcVIcJgapczz/sRho
         KyoxP9CR7tqQFd0qL0cXcwImN3Bw4y3OhkjxRJ7TJ0NGminfmYIanDpYuTAi9uN54Ah2
         K2vhqTTzSBQHwqyVt1ByU7wKzsUzxYk9lYi7Jw9yG4j3Dqunjybe+dZW52FL9yP7FOwG
         FA4g==
X-Gm-Message-State: AOJu0YypOIjqJ79CPDFKQ4PnPF8gxJqwODvtMG+3Ni3MA7GWs19JJCG0
	lNbKjCWpRGvGIgUT0ruD3rpTdpQVOlLuxwMc3p9phF8vUGc7ZZNdn56xZ3Rctw==
X-Gm-Gg: AR+sD136GPDeoeuSNMQzV7YZxk+BN5zcRumXh39l/cI+mPr20Xv+Fx1C6Kv5gKOkvFL
	9mduUUV667VBB3FjoUXLpfq7C5+ycESne9FIOYuy2+ay7d2U77B0U0ircNnZImPpzC1wh1yYsIK
	cGAC4xuDVSpiq3l9/lfMZI0+0wLS2QJEkxzvvnPNiWtAnREStyEKfT70wwf9WF0eNvNc67hVgK7
	43looo4IIFO0Y+zvgUe08dQrteWng6Ce1sg54Q2TrOJj25MCQOcy498BouAfcxNC+Dzcyu1MXek
	QoYS2htJC/QABG/CyrS2vfvu8DOO5SFYCwVXv1zj+zG7Q1qGB5sx6Wabj/StodqDlwcWP9HQzUW
	KPovGsZlz+PmaSyfZXLfq8EiUSFhd1VKICWhZS/vF8MUmCJ/ToirAZQuf1Jud7+an6yYgkddU2I
	RM3rLKypmwZmgBk/ngGS2cqNbqV9jrV694A9GacHtSBi+LTyMvmYhmFaKoWb9+tA==
X-Received: by 2002:a05:600c:8b86:b0:499:a4d1:d7d9 with SMTP id 5b1f17b1804b1-499a4d1d80dmr27162405e9.9.1787034815510;
        Mon, 17 Aug 2026 23:33:35 -0700 (PDT)
From: Furkan Caliskan <frn1furkan10@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	dfaggioli@suse.com,
	gwd@xenproject.org,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH 0/2] xen/sched: fix crashes when vcpu creation fails
Date: Tue, 18 Aug 2026 09:32:57 +0300
Message-Id: <20260818063259.18733-1-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1787034816-D735D87B-9894919A/0/0
X-purgate-type: clean
X-purgate-size: 266

Furkan Caliskan (2):
  xen/sched: core: skip missing vcpu slots in sched_move_domain()
  xen/sched: core: kill unarmed timers on sched_init_vcpu() failure

 xen/common/sched/core.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

-- 
2.34.1


