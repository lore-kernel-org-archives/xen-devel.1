Return-Path: <SRS0=9xPH=TC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1EF6C46460
	for <xen-devel@archiver.kernel.org>; Thu,  2 May 2019 17:53:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8418A20C01
	for <xen-devel@archiver.kernel.org>; Thu,  2 May 2019 17:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8418A20C01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMFtS-0006hX-D4; Thu, 02 May 2019 17:53:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yl7K=TC=citrix.com=prvs=018ff06f8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hMFtQ-0006gq-Sd
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 17:53:12 +0000
X-Inumbo-ID: 2729a1ba-6d03-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2729a1ba-6d03-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 17:53:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,422,1549929600"; d="scan'208";a="84983437"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 2 May 2019 18:42:34 +0100
Message-ID: <20190502174238.23848-6-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190502174238.23848-1-ian.jackson@eu.citrix.com>
References: <20190502174238.23848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 5/9] mg-repro-setup: Break out
 compute_adjusts
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190502174234.jsiPxZcA8FmLn73fU47yefMpxhboo1sGiC03QV2xW-M@z>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBtZy1yZXByby1zZXR1cCB8IDIwICsrKysrKysrKysr
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9tZy1yZXByby1zZXR1cCBiL21nLXJlcHJvLXNldHVwCmluZGV4IGM4
YmNhZDMzLi4xMGFiNjVhOCAxMDA3NTUKLS0tIGEvbWctcmVwcm8tc2V0dXAKKysrIGIvbWctcmVw
cm8tc2V0dXAKQEAgLTU0LDcgKzU0LDYgQEAgc2V0IC1lIC1vIHBvc2l4CiAKIG1nZXhlY2ZsYWdz
PSgpCiBhZGp1c3RzZXRzPSgpCi1hZGp1c3RzPSgpCiBhbGxvY3M9KCkKIGxvZ2ZpbGU9dG1wL21n
LXJlcHJvLXNldHVwLmxvZwogZHVyYXRpb249MjhkCkBAIC0xMDQsMTQgKzEwMywxNyBAQCBhZGpy
dW52YXIgKCkgewogCWRlbHJ1bnZhciAiJDEiCiAJYWRqdXN0cys9KHJ1bnZhci1zZXQgIiRqb2Ii
ICIkMSIgIiQyIikKIH0KLQotZm9yIGFyZyBpbiAiJHthZGp1c3RzZXRzW0BdfSI7IGRvCi0JY2Fz
ZSAiJGFyZyIgaW4KLQkhKnxeKikJZGVscnVudmFyICIke2FyZyM/fSIJCTs7Ci0JKj0qKQlhZGpy
dW52YXIgIiR7YXJnJSU9Kn0iICIke2FyZyMqPX0iCTs7Ci0JKikJYmFkLWFkanVpc3RzZXQtcGF0
dGVybgkJCTs7Ci0JZXNhYwotZG9uZQorY29tcHV0ZV9hZGp1c3RzICgpIHsKKwlhZGp1c3RzPSgp
CisJZm9yIGFyZyBpbiAiJEAiOyBkbworCQljYXNlICIkYXJnIiBpbgorCQkhKnxeKikJZGVscnVu
dmFyICIke2FyZyM/fSIJCTs7CisJCSo9KikJYWRqcnVudmFyICIke2FyZyUlPSp9IiAiJHthcmcj
Kj19Igk7OworCQkqKQliYWQtYWRqdWlzdHNldC1wYXR0ZXJuCQkJOzsKKwkJZXNhYworCWRvbmUK
K30KK2NvbXB1dGVfYWRqdXN0cyAiJHthZGp1c3RzZXRzW0BdfSIKIAogd2hpbGUgWyAkIyAtbmUg
MCBdOyBkbwogCWFyZz0kMTsgc2hpZnQKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
