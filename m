Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6512EC10F14
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 06:53:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B14B20873
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 06:53:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B14B20873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hETaF-0002AV-Nk; Thu, 11 Apr 2019 06:53:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=i7IS=SN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hETaF-0002AQ-2v
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 06:53:15 +0000
X-Inumbo-ID: 7929e9ee-5c26-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7929e9ee-5c26-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 06:53:12 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 11 Apr 2019 00:51:11 -0600
Message-Id: <5CAEE3DF0200007800226799@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 11 Apr 2019 00:51:11 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH v2] x86/mem-sharing: statically initialize audit
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411065111.e3LgLD6x63oGO5w2rI2a7nhumRbRKIWVOT2oKin8aY4@z>

VGhlcmUncyBubyBuZWVkIHRvIGV4ZWN1dGUgYW55IGluc3RydWN0aW9ucyBmb3IgZG9pbmcgc28u
IERyb3AgdGhlIHRoZW4KZWZmZWN0aXZlbHkgZW1wdHkgbWVtX3NoYXJpbmdfaW5pdCgpIGFsdG9n
ZXRoZXIuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0t
LQp2MjogRHJvcCBtZW1fc2hhcmluZ19pbml0KCkuCgotLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVt
X3NoYXJpbmcuYworKysgYi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwpAQCAtNjUsOCAr
NjUsOCBAQCBzdGF0aWMgREVGSU5FX1BFUl9DUFUocGdfbG9ja19kYXRhX3QsIF9fCiAKICNpZiBN
RU1fU0hBUklOR19BVURJVAogCi1zdGF0aWMgc3RydWN0IGxpc3RfaGVhZCBzaHJfYXVkaXRfbGlz
dDsKLXN0YXRpYyBzcGlubG9ja190IHNocl9hdWRpdF9sb2NrOworc3RhdGljIExJU1RfSEVBRChz
aHJfYXVkaXRfbGlzdCk7CitzdGF0aWMgREVGSU5FX1NQSU5MT0NLKHNocl9hdWRpdF9sb2NrKTsK
IHN0YXRpYyBERUZJTkVfUkNVX1JFQURfTE9DSyhzaHJfYXVkaXRfcmVhZF9sb2NrKTsKIAogLyog
UkNVIGRlbGF5ZWQgZnJlZSBvZiBhdWRpdCBsaXN0IGVudHJ5ICovCkBAIC0xNjUwLDEzICsxNjUw
LDMgQEAgaW50IG1lbV9zaGFyaW5nX2RvbWN0bChzdHJ1Y3QgZG9tYWluICpkLAogCiAgICAgcmV0
dXJuIHJjOwogfQotCi12b2lkIF9faW5pdCBtZW1fc2hhcmluZ19pbml0KHZvaWQpCi17Ci0gICAg
cHJpbnRrKCJJbml0aW5nIG1lbW9yeSBzaGFyaW5nLlxuIik7Ci0jaWYgTUVNX1NIQVJJTkdfQVVE
SVQKLSAgICBzcGluX2xvY2tfaW5pdCgmc2hyX2F1ZGl0X2xvY2spOwotICAgIElOSVRfTElTVF9I
RUFEKCZzaHJfYXVkaXRfbGlzdCk7Ci0jZW5kaWYKLX0KLQotLS0gYS94ZW4vYXJjaC94ODYvbW0u
YworKysgYi94ZW4vYXJjaC94ODYvbW0uYwpAQCAtMzY4LDggKzM2OCw2IEBAIHZvaWQgX19pbml0
IGFyY2hfaW5pdF9tZW1vcnkodm9pZCkKIAogICAgIGVmaV9pbml0X21lbW9yeSgpOwogCi0gICAg
bWVtX3NoYXJpbmdfaW5pdCgpOwotCiAjaWZuZGVmIE5ERUJVRwogICAgIGlmICggaGlnaG1lbV9z
dGFydCApCiAgICAgewotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21lbV9zaGFyaW5nLmgKKysr
IGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tZW1fc2hhcmluZy5oCkBAIC04OCw3ICs4OCw2IEBAIGlu
dCBtZW1fc2hhcmluZ19ub3RpZnlfZW5vbWVtKHN0cnVjdCBkb20KIGludCBtZW1fc2hhcmluZ19t
ZW1vcChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9tZW1fc2hhcmluZ19vcF90KSBhcmcpOwog
aW50IG1lbV9zaGFyaW5nX2RvbWN0bChzdHJ1Y3QgZG9tYWluICpkLCAKICAgICAgICAgICAgICAg
ICAgICAgICAgc3RydWN0IHhlbl9kb21jdGxfbWVtX3NoYXJpbmdfb3AgKm1lYyk7Ci12b2lkIG1l
bV9zaGFyaW5nX2luaXQodm9pZCk7CiAKIC8qIFNjYW5zIHRoZSBwMm0gYW5kIHJlbGlucXVpc2hl
cyBhbnkgc2hhcmVkIHBhZ2VzLCBkZXN0cm95aW5nIAogICogdGhvc2UgZm9yIHdoaWNoIHRoaXMg
ZG9tYWluIGhvbGRzIHRoZSBmaW5hbCByZWZlcmVuY2UuCgoKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
