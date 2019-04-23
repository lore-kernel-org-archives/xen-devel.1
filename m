Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4C3C10F14
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 10:55:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C365520811
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 10:55:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C365520811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIt4s-00089e-RH; Tue, 23 Apr 2019 10:55:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jhle=SZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hIt4r-00089F-BS
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 10:55:05 +0000
X-Inumbo-ID: 3f2a5530-65b6-11e9-98f1-bf3c3d1c3991
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f2a5530-65b6-11e9-98f1-bf3c3d1c3991;
 Tue, 23 Apr 2019 10:55:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B2A83AE8D;
 Tue, 23 Apr 2019 10:55:02 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org
Date: Tue, 23 Apr 2019 12:54:56 +0200
Message-Id: <20190423105457.17502-3-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190423105457.17502-1-jgross@suse.com>
References: <20190423105457.17502-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 2/3] xen/swiotlb: simplify
 range_straddles_page_boundary()
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
Cc: Juergen Gross <jgross@suse.com>, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org, konrad.wilk@oracle.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

cmFuZ2Vfc3RyYWRkbGVzX3BhZ2VfYm91bmRhcnkoKSBpcyBvcGVuIGNvZGluZyBzZXZlcmFsIG1h
Y3JvcyBmcm9tCmluY2x1ZGUveGVuL3BhZ2UuaC4gVXNlIHRob3NlIGluc3RlYWQuIEFkZGl0aW9u
YWxseSB0aGVyZSBpcyBubyBuZWVkCnRvIGhhdmUgY2hlY2tfcGFnZXNfcGh5c2ljYWxseV9jb250
aWd1b3VzKCkgYXMgYSBzZXBhcmF0ZSBmdW5jdGlvbiBhcwppdCBpcyB1c2VkIG9ubHkgb25jZSwg
c28gbWVyZ2UgaXQgaW50byByYW5nZV9zdHJhZGRsZXNfcGFnZV9ib3VuZGFyeSgpLgoKU2lnbmVk
LW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIGRyaXZlcnMveGVu
L3N3aW90bGIteGVuLmMgfCAyOCArKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jIGIvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYwppbmRl
eCA0MmEzOTI0ZTZkOTEuLjQzYjZlNjVhZTI1NiAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vc3dp
b3RsYi14ZW4uYworKysgYi9kcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jCkBAIC05MiwzNCArOTIs
MTggQEAgc3RhdGljIGlubGluZSBkbWFfYWRkcl90IHhlbl92aXJ0X3RvX2J1cyh2b2lkICphZGRy
ZXNzKQogCXJldHVybiB4ZW5fcGh5c190b19idXModmlydF90b19waHlzKGFkZHJlc3MpKTsKIH0K
IAotc3RhdGljIGludCBjaGVja19wYWdlc19waHlzaWNhbGx5X2NvbnRpZ3VvdXModW5zaWduZWQg
bG9uZyB4ZW5fcGZuLAotCQkJCQkgICAgIHVuc2lnbmVkIGludCBvZmZzZXQsCi0JCQkJCSAgICAg
c2l6ZV90IGxlbmd0aCkKK3N0YXRpYyBpbmxpbmUgaW50IHJhbmdlX3N0cmFkZGxlc19wYWdlX2Jv
dW5kYXJ5KHBoeXNfYWRkcl90IHAsIHNpemVfdCBzaXplKQogewotCXVuc2lnbmVkIGxvbmcgbmV4
dF9iZm47Ci0JaW50IGk7Ci0JaW50IG5yX3BhZ2VzOworCXVuc2lnbmVkIGxvbmcgbmV4dF9iZm4s
IHhlbl9wZm4gPSBYRU5fUEZOX0RPV04ocCk7CisJdW5zaWduZWQgaW50IGksIG5yX3BhZ2VzID0g
WEVOX1BGTl9VUCh4ZW5fb2Zmc2V0X2luX3BhZ2UocCkgKyBzaXplKTsKIAogCW5leHRfYmZuID0g
cGZuX3RvX2Jmbih4ZW5fcGZuKTsKLQlucl9wYWdlcyA9IChvZmZzZXQgKyBsZW5ndGggKyBYRU5f
UEFHRV9TSVpFLTEpID4+IFhFTl9QQUdFX1NISUZUOwogCi0JZm9yIChpID0gMTsgaSA8IG5yX3Bh
Z2VzOyBpKyspIHsKKwlmb3IgKGkgPSAxOyBpIDwgbnJfcGFnZXM7IGkrKykKIAkJaWYgKHBmbl90
b19iZm4oKyt4ZW5fcGZuKSAhPSArK25leHRfYmZuKQotCQkJcmV0dXJuIDA7Ci0JfQotCXJldHVy
biAxOwotfQorCQkJcmV0dXJuIDE7CiAKLXN0YXRpYyBpbmxpbmUgaW50IHJhbmdlX3N0cmFkZGxl
c19wYWdlX2JvdW5kYXJ5KHBoeXNfYWRkcl90IHAsIHNpemVfdCBzaXplKQotewotCXVuc2lnbmVk
IGxvbmcgeGVuX3BmbiA9IFhFTl9QRk5fRE9XTihwKTsKLQl1bnNpZ25lZCBpbnQgb2Zmc2V0ID0g
cCAmIH5YRU5fUEFHRV9NQVNLOwotCi0JaWYgKG9mZnNldCArIHNpemUgPD0gWEVOX1BBR0VfU0la
RSkKLQkJcmV0dXJuIDA7Ci0JaWYgKGNoZWNrX3BhZ2VzX3BoeXNpY2FsbHlfY29udGlndW91cyh4
ZW5fcGZuLCBvZmZzZXQsIHNpemUpKQotCQlyZXR1cm4gMDsKLQlyZXR1cm4gMTsKKwlyZXR1cm4g
MDsKIH0KIAogc3RhdGljIGludCBpc194ZW5fc3dpb3RsYl9idWZmZXIoZG1hX2FkZHJfdCBkbWFf
YWRkcikKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
