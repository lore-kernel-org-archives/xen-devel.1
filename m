Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C555C10F14
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:27:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D754A20850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D754A20850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEBc-0001Dx-Sb; Wed, 10 Apr 2019 14:26:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEBb-0001BQ-Iq
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:26:47 +0000
X-Inumbo-ID: 78f2c99c-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 78f2c99c-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:21 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227690"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:27 +0100
Message-ID: <20190410142408.22848-22-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 21/62] ts-kernel-build: disable host1x,
 which doesn't build
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410142327.dsz5kJlOw7OAmNatzKu7g19br9zAOHAJ8AkIgSMOFbw@z>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCkVtcGlyaWNhbGx5LCBvbiBzdHJl
dGNoIGFybWhmOgoKICBkcml2ZXJzL2dwdS9ob3N0MXgvY2RtYS5jOiBJbiBmdW5jdGlvbiBgaG9z
dDF4X3B1c2hidWZmZXJfaW5pdCc6CiAgZHJpdmVycy9ncHUvaG9zdDF4L2NkbWEuYzo5NDo0ODog
ZXJyb3I6IHBhc3NpbmcgYXJndW1lbnQgMyBvZiBgZG1hX2FsbG9jX3djJyBmcm9tIGluY29tcGF0
aWJsZSBwb2ludGVyIHR5cGUgWy1XZXJyb3I9aW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXNdCiAg
ICAgcGItPm1hcHBlZCA9IGRtYV9hbGxvY193Yyhob3N0MXgtPmRldiwgc2l6ZSwgJnBiLT5waHlz
LAoJCQkJCQkgIF4KZXRjLgoKVGhpcyBpcyBibG9ja2luZyB0aGUgdXBncmFkZSBvZiB0aGUgWGVu
IFByb2plY3QgQ0kgdG8gRGViaWFuIHN0cmV0Y2gKc28gZGlzYWJsZSBpdCBmb3Igbm93LgoKU2ln
bmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KQ0M6IEp1bGllbiBHcmFs
bCA8anVsaWVuLmdyYWxsQGFybS5jb20+CkNDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+CkNDOiBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwu
Y29tPgpDQzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwotLS0KIHRzLWtlcm5lbC1i
dWlsZCB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvdHMta2VybmVsLWJ1aWxkIGIvdHMta2VybmVsLWJ1aWxkCmluZGV4IDIxYjhmNzhhLi4wYmM0
NDNkZSAxMDA3NTUKLS0tIGEvdHMta2VybmVsLWJ1aWxkCisrKyBiL3RzLWtlcm5lbC1idWlsZApA
QCAtNTk0LDYgKzU5NCw5IEBAIGNhc2UgJHtYRU5fVEFSR0VUX0FSQ0h9IGluCiAgICAgKikgOzsK
IGVzYWMKIAorIyBEaXNhYmxlIGNvbXBvbmVudHMgdGhhdCBkb24ndCBidWlsZAorc2V0b3B0IENP
TkZJR19URUdSQV9IT1NUMVggbgorCiBleGl0IDAKIEVORAogfQotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
