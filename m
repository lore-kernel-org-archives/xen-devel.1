Return-Path: <SRS0=GvgA=T5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F98CC28CC0
	for <xen-devel@archiver.kernel.org>; Wed, 29 May 2019 09:04:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DDBF21670
	for <xen-devel@archiver.kernel.org>; Wed, 29 May 2019 09:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DDBF21670
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVuVL-0005VY-HQ; Wed, 29 May 2019 09:04:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=krOM=T5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVuVK-0005VC-Af
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 09:04:14 +0000
X-Inumbo-ID: b935d389-81f0-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b935d389-81f0-11e9-8980-bc764e045a96;
 Wed, 29 May 2019 09:04:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C6A11AE56;
 Wed, 29 May 2019 09:04:10 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org
Date: Wed, 29 May 2019 11:04:06 +0200
Message-Id: <20190529090407.1225-3-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190529090407.1225-1-jgross@suse.com>
References: <20190529090407.1225-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 2/3] xen/swiotlb: simplify
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
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
LW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpSZXZpZXdlZC1ieTogQm9y
aXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KLS0tCiBkcml2ZXJzL3hl
bi9zd2lvdGxiLXhlbi5jIHwgMjggKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYyBiL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMKaW5k
ZXggMWNhYWRjYTEyNGIzLi5hYmE1MjQ3YjkxNDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3N3
aW90bGIteGVuLmMKKysrIGIvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYwpAQCAtOTIsMzQgKzky
LDE4IEBAIHN0YXRpYyBpbmxpbmUgZG1hX2FkZHJfdCB4ZW5fdmlydF90b19idXModm9pZCAqYWRk
cmVzcykKIAlyZXR1cm4geGVuX3BoeXNfdG9fYnVzKHZpcnRfdG9fcGh5cyhhZGRyZXNzKSk7CiB9
CiAKLXN0YXRpYyBpbnQgY2hlY2tfcGFnZXNfcGh5c2ljYWxseV9jb250aWd1b3VzKHVuc2lnbmVk
IGxvbmcgeGVuX3BmbiwKLQkJCQkJICAgICB1bnNpZ25lZCBpbnQgb2Zmc2V0LAotCQkJCQkgICAg
IHNpemVfdCBsZW5ndGgpCitzdGF0aWMgaW5saW5lIGludCByYW5nZV9zdHJhZGRsZXNfcGFnZV9i
b3VuZGFyeShwaHlzX2FkZHJfdCBwLCBzaXplX3Qgc2l6ZSkKIHsKLQl1bnNpZ25lZCBsb25nIG5l
eHRfYmZuOwotCWludCBpOwotCWludCBucl9wYWdlczsKKwl1bnNpZ25lZCBsb25nIG5leHRfYmZu
LCB4ZW5fcGZuID0gWEVOX1BGTl9ET1dOKHApOworCXVuc2lnbmVkIGludCBpLCBucl9wYWdlcyA9
IFhFTl9QRk5fVVAoeGVuX29mZnNldF9pbl9wYWdlKHApICsgc2l6ZSk7CiAKIAluZXh0X2JmbiA9
IHBmbl90b19iZm4oeGVuX3Bmbik7Ci0JbnJfcGFnZXMgPSAob2Zmc2V0ICsgbGVuZ3RoICsgWEVO
X1BBR0VfU0laRS0xKSA+PiBYRU5fUEFHRV9TSElGVDsKIAotCWZvciAoaSA9IDE7IGkgPCBucl9w
YWdlczsgaSsrKSB7CisJZm9yIChpID0gMTsgaSA8IG5yX3BhZ2VzOyBpKyspCiAJCWlmIChwZm5f
dG9fYmZuKCsreGVuX3BmbikgIT0gKytuZXh0X2JmbikKLQkJCXJldHVybiAwOwotCX0KLQlyZXR1
cm4gMTsKLX0KKwkJCXJldHVybiAxOwogCi1zdGF0aWMgaW5saW5lIGludCByYW5nZV9zdHJhZGRs
ZXNfcGFnZV9ib3VuZGFyeShwaHlzX2FkZHJfdCBwLCBzaXplX3Qgc2l6ZSkKLXsKLQl1bnNpZ25l
ZCBsb25nIHhlbl9wZm4gPSBYRU5fUEZOX0RPV04ocCk7Ci0JdW5zaWduZWQgaW50IG9mZnNldCA9
IHAgJiB+WEVOX1BBR0VfTUFTSzsKLQotCWlmIChvZmZzZXQgKyBzaXplIDw9IFhFTl9QQUdFX1NJ
WkUpCi0JCXJldHVybiAwOwotCWlmIChjaGVja19wYWdlc19waHlzaWNhbGx5X2NvbnRpZ3VvdXMo
eGVuX3Bmbiwgb2Zmc2V0LCBzaXplKSkKLQkJcmV0dXJuIDA7Ci0JcmV0dXJuIDE7CisJcmV0dXJu
IDA7CiB9CiAKIHN0YXRpYyBpbnQgaXNfeGVuX3N3aW90bGJfYnVmZmVyKGRtYV9hZGRyX3QgZG1h
X2FkZHIpCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
