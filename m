Return-Path: <SRS0=dV6x=CK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57CD2C433E7
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2020 00:11:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2499820866
	for <xen-devel@archiver.kernel.org>; Tue,  1 Sep 2020 00:11:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STiggL29"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2499820866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCttE-0001ry-7Y; Tue, 01 Sep 2020 00:11:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hn3Q=CK=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1kCttC-0001rt-Hs
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 00:11:06 +0000
X-Inumbo-ID: 3d64fd09-28bc-48eb-9dc7-c1fe6a118fd1
Received: from mail-qv1-xf2a.google.com (unknown [2607:f8b0:4864:20::f2a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d64fd09-28bc-48eb-9dc7-c1fe6a118fd1;
 Tue, 01 Sep 2020 00:11:04 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id x7so3511001qvi.5
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2020 17:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Ul6MxsOwKMDD8i0rQhCuPqwZE+XurAQL28Q3KVG6RdM=;
 b=STiggL29wmsIcucLgRZlzHdAGTpF7Y7yd+jnR8AelZO5Bx93tWXhTyO4POOqH0+EQA
 Sod3VLfUd8UxMtZTGzza/9J9UC4cN9Tf7FFyte92/W7aO6uRu1yoJgF+R7lomwa4trDQ
 zITcbgdvMCQjL7hER8wvcMUiSHEUKSEpgmJf1SGQW4wnmjODeN+zSr+7gnnG6if35Ggc
 j4eNWgLsF1mhoWP8Xjl2XkoCA0OMUbuW2hk0OIehPULFOh/RfE4o/EEReDI1GexEv/ms
 QdmwIcC7yw7wiU5IvEZWkM9HeP4hvhCyy/04TTlfumetZqc7dm1uZv2uXT0O4JtX37qc
 lL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Ul6MxsOwKMDD8i0rQhCuPqwZE+XurAQL28Q3KVG6RdM=;
 b=sEA8tNgZVrDORbtfvP4sBnObMfqiGubAJKEmjAqZLqWlSlidknRMozTuKVbeTPPfUb
 UjtSb2iGdg1QP7YwhhnaMwoubIjjXtaJ23Bo/k71pssr7sWVWdwn8g+xXmLAmKocs1g4
 RlmNQjiY+9UA/U9yTf471WFtQ66vtd46Rx6guYK2UhCR3OxkSSw4TeEVKHkxjDQ01tCM
 LXvRn+A/2vX31UPTjnibOW2smHl0dBfwFzulbZguC8Foo9AGJwzIsPzVqgdQGB1U9ZKP
 kWgppftUp2jMbnMR64F5AMKCQlKDg/VWcDIC4RsjsHKbL5zEzyTgRj6dBZAzTG9WWOLk
 6F8A==
X-Gm-Message-State: AOAM530rrJ7ReIZQAII8WJZRMhSGqIMOw7DGstip8GNzqKVQjNZT4Glg
 g/zjFr3kJeLL8tjdUZUR//in5f3KyfHYQQ==
X-Google-Smtp-Source: ABdhPJz1GxCemUQ2zav47WFAzBu3gD9XFkxilULqfJse7hz1hVYkoVkMeD4ZyvTub69R6mDFx6Ac4A==
X-Received: by 2002:ad4:4c89:: with SMTP id bs9mr3656807qvb.210.1598919064197; 
 Mon, 31 Aug 2020 17:11:04 -0700 (PDT)
Received: from six.home (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id
 d10sm3371675qkk.1.2020.08.31.17.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 17:11:03 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 0/2] make keyed union types easier to marshal
Date: Mon, 31 Aug 2020 20:10:56 -0400
Message-Id: <cover.1598918801.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
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

These patches make changes to the generated "keyed union" types that
allow marshaling and unmarshaling easier, specifically when using the
encoding/json package from the Go standard library.

Nick Rosbrook (2):
  golang/xenlight: export keyed union interface types
  golang/xenlight: use struct pointers in keyed union fields

 tools/golang/xenlight/gengotypes.py  | 10 ++---
 tools/golang/xenlight/helpers.gen.go | 44 ++++++++++-----------
 tools/golang/xenlight/types.gen.go   | 58 ++++++++++++++--------------
 3 files changed, 56 insertions(+), 56 deletions(-)

-- 
2.17.1


