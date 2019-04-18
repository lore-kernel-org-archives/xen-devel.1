Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F1CC10F14
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8B1B2186A
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8B1B2186A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH9xJ-00020S-IC; Thu, 18 Apr 2019 16:32:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xH-0001zM-Vp
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:08 +0000
X-Inumbo-ID: 8191b2ab-61f7-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8191b2ab-61f7-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 16:32:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,366,1549929600"; d="scan'208";a="83913767"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 18 Apr 2019 17:31:45 +0100
Message-ID: <20190418163158.11408-9-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 08/21] starvation: Teach
 sg-execute-flight about job state starved
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
Message-ID: <20190418163145.mxS6CaMIqOJY7uJEldi2JkHkG_bkquCq0Xlzdtw2J7I@z>

SXQgbmVlZHMgdG8gbm90IG1pbmQgaWYgYSBqb2IgcmVwb3J0cyBhcyBgc3RhcnZlZCcsIGV2ZW4g
aWYgc2ctcnVuLWpvYgpleGl0ZWQgbm9uLXplcm8uCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3Nv
biA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBzZy1leGVjdXRlLWZsaWdodCB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL3NnLWV4ZWN1dGUtZmxpZ2h0IGIvc2ctZXhlY3V0ZS1mbGlnaHQKaW5kZXggYWVkOTgy
M2QuLjAyZjYzMzE2IDEwMDc1NQotLS0gYS9zZy1leGVjdXRlLWZsaWdodAorKysgYi9zZy1leGVj
dXRlLWZsaWdodApAQCAtMTg5LDcgKzE4OSw3IEBAIHByb2MgbWFpbl9pdGVyYXRpb24ge30gewog
ICAgICAgICBpZiB7ISRmb3VuZH0geyBlcnJvciAiam9iIG5vdCBpbiBkYXRhYmFzZSAkZmxpZ2h0
ICRqb2IiIH0KIAogICAgICAgICBzd2l0Y2ggLWV4YWN0IC0tICRqb2JpbmZvKHN0YXR1cykgewot
ICAgICAgICAgICAgcGFzcyAtIGZhaWwgLSBicm9rZW4gLSBibG9ja2VkIC0gdHJ1bmNhdGVkIHsK
KyAgICAgICAgICAgIHBhc3MgLSBmYWlsIC0gYnJva2VuIC0gYmxvY2tlZCAtIHRydW5jYXRlZCAt
IHN0YXJ2ZWQgewogICAgICAgICAgICAgfQogICAgICAgICAgICAgcXVldWVkIC0gcHJlcGFyaW5n
IC0gcnVubmluZyB7CiAgICAgICAgICAgICAgICAgam9iZGI6OmpvYi1zZXQtc3RhdHVzLXVubG9j
a2VkICRmbGlnaHQgJGpvYiBicm9rZW4KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
