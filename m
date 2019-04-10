Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 599B5C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 10:58:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A9FA2075B
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 10:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A9FA2075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEAvm-0003dF-Ph; Wed, 10 Apr 2019 10:58:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=B5aJ=SM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hEAvl-0003d5-Er
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 10:58:13 +0000
X-Inumbo-ID: 8865f938-5b7f-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8865f938-5b7f-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 10:58:12 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 10 Apr 2019 04:58:11 -0600
Message-Id: <5CADCC40020000780022621E@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 10 Apr 2019 04:58:08 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH] x86/mem-sharing: statically initialize audit
 list head and lock
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410105808.Oqcj05ZAmH5BHHPStQtVIGeq2ORVQoGGEXKLOur7dY0@z>

VGhlcmUncyBubyBuZWVkIHRvIGV4ZWN1dGUgYW55IGluc3RydWN0aW9ucyBmb3IgZG9pbmcgc28u
CgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQpJIHdv
bmRlciB3aGV0aGVyIG1lbV9zaGFyaW5nX2luaXQoKSBzaG91bGRuJ3QgZ28gYXdheSBhbHRvZ2V0
aGVyIHRoZW4uCgotLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYworKysgYi94ZW4v
YXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwpAQCAtNjUsOCArNjUsOCBAQCBzdGF0aWMgREVGSU5F
X1BFUl9DUFUocGdfbG9ja19kYXRhX3QsIF9fCiAKICNpZiBNRU1fU0hBUklOR19BVURJVAogCi1z
dGF0aWMgc3RydWN0IGxpc3RfaGVhZCBzaHJfYXVkaXRfbGlzdDsKLXN0YXRpYyBzcGlubG9ja190
IHNocl9hdWRpdF9sb2NrOworc3RhdGljIExJU1RfSEVBRChzaHJfYXVkaXRfbGlzdCk7CitzdGF0
aWMgREVGSU5FX1NQSU5MT0NLKHNocl9hdWRpdF9sb2NrKTsKIHN0YXRpYyBERUZJTkVfUkNVX1JF
QURfTE9DSyhzaHJfYXVkaXRfcmVhZF9sb2NrKTsKIAogLyogUkNVIGRlbGF5ZWQgZnJlZSBvZiBh
dWRpdCBsaXN0IGVudHJ5ICovCkBAIC0xNjU0LDkgKzE2NTQsNSBAQCBpbnQgbWVtX3NoYXJpbmdf
ZG9tY3RsKHN0cnVjdCBkb21haW4gKmQsCiB2b2lkIF9faW5pdCBtZW1fc2hhcmluZ19pbml0KHZv
aWQpCiB7CiAgICAgcHJpbnRrKCJJbml0aW5nIG1lbW9yeSBzaGFyaW5nLlxuIik7Ci0jaWYgTUVN
X1NIQVJJTkdfQVVESVQKLSAgICBzcGluX2xvY2tfaW5pdCgmc2hyX2F1ZGl0X2xvY2spOwotICAg
IElOSVRfTElTVF9IRUFEKCZzaHJfYXVkaXRfbGlzdCk7Ci0jZW5kaWYKIH0KIAoKCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
