Return-Path: <SRS0=3ye+=63=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 991DBCA90AF
	for <xen-devel@archiver.kernel.org>; Wed, 13 May 2020 14:18:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C37A204EF
	for <xen-devel@archiver.kernel.org>; Wed, 13 May 2020 14:18:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FIKEdliu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C37A204EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYsDJ-0001Br-8N; Wed, 13 May 2020 14:18:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FcTI=63=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jYsDH-0001Bm-JF
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 14:18:23 +0000
X-Inumbo-ID: 9a5d6714-9524-11ea-b07b-bc764e2007e4
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a5d6714-9524-11ea-b07b-bc764e2007e4;
 Wed, 13 May 2020 14:18:23 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id b1so13471360qtt.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2020 07:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=K9Wqtawrn3d5LUJiPdInY5dz3Pq2E+yl4crIH2wi+jw=;
 b=FIKEdliuagLFhAbjk2w/BLI4gzsD8hNAPYJsOdlzcorus+MJjz6LbYG26Lbw5iCd3d
 FNnVwv27tkNEC8q83WvdNKK0ds702HzLMmk5Rm13gh65QWZBRw4LG2R9JtjupkdrIjAR
 I5irJD7x/zZyoPWVvvp2/2w1bzNSi6fWWtto94qRANG6sJZiPuQ257B8Ys5ru1B+b02n
 lh/qv7fbjWQvIDDtJKJo3YpwAthXKWGbxLVSZqttoAoosHvj/c/iDCD57EoZnxpBk7V+
 +rNOn93JciBQW+TGd2Ys7zGFsXG6nl0KjAU/ub/J4tjaKg+lUIJOHO1m9TrMQYexQgLd
 3vzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=K9Wqtawrn3d5LUJiPdInY5dz3Pq2E+yl4crIH2wi+jw=;
 b=ntrpPZHColDurZM5s+23Ql2p5vm5C96OxEL/11PnEcZ/fPrwmoN936ANekakbVaWmW
 ggElIRGBBN/5AUk1oH+zh9qGteLOILJFy0lfda8lAKbi3g99UyKPTh+n1jmV6EGCcne4
 xBGeWZEfEebFXSzYUd0oViz1PXW6/DuRaI5Es95aH+uhxganRNUBr9y5y8V0pGI6sYuV
 Mb1xMCa+3XD3BMzvUIhM5NfOFXUkAhqcFoZg8YPYEtMvImQYc+kKlYVsG/U/Oo68efUO
 3qLZM/YK7d/Y2v6tSSbdDuE3ThohQ6zi5uaMtfHZPkBwOCd11DRuwPnirZHlFnzgK8xX
 9y3A==
X-Gm-Message-State: AGi0PuZIhIdoZ9QLtjjE8/+VPVidfATGFCxP2hLsGA2Xp8KN3tkQx9Hx
 AwnwRSub61Cev+0pD/45bmdoL0WKQCU=
X-Google-Smtp-Source: APiQypJtXRvrt1SV2ezjZovYN4JKLah2zLAnzwbmfflsyhMneZ+P6mT0RGo8YchEn+5S61frzxuebA==
X-Received: by 2002:ac8:660d:: with SMTP id c13mr15089567qtp.267.1589379502140; 
 Wed, 13 May 2020 07:18:22 -0700 (PDT)
Received: from six.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id o3sm15045707qtt.56.2020.05.13.07.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 07:18:21 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 0/1] initialize xenlight go module
Date: Wed, 13 May 2020 10:18:18 -0400
Message-Id: <cover.1589379056.git.rosbrookn@ainfosec.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

These patches setup an initial Go module for the xenlight package. The
go code is tracked again, since the module is defined in xen.git as
xenbits.xenproject.org/git-http/xen.git/tools/golang/xenlight. The final patch
adds a README and LICENSE to tools/golang/xenlight so that the package
will show up properly on pkg.go.dev and be available via the module
proxy at proxy.golang.org.

Changes in v2:
 - Use xenproject.org instead of xen.org in module path.
 - Use `go build` instead of `go install` in xenlight Makefile.
 - Use LGPL instead of GPL for xenlight LICENSE.
 - Add entry for xenlight package in SUPPORT.md.
 - Change some wording in the README for clarity. 

Changes in v3:
 - Use LGPL as-is from [1].
 - Wrap lines in README.

[1] https://www.gnu.org/licenses/old-licenses/lgpl-2.1.txt

Nick Rosbrook (1):
  golang/xenlight: add necessary module/package documentation

 SUPPORT.md                        |   6 +
 tools/golang/xenlight/LICENSE     | 502 ++++++++++++++++++++++++++++++
 tools/golang/xenlight/README.md   |  28 ++
 tools/golang/xenlight/xenlight.go |   2 +
 4 files changed, 538 insertions(+)
 create mode 100644 tools/golang/xenlight/LICENSE
 create mode 100644 tools/golang/xenlight/README.md

-- 
2.17.1


