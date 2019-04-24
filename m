Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48ABFC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 17:00:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 251F52148D
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 17:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 251F52148D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJLFu-0007qj-Bt; Wed, 24 Apr 2019 17:00:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8RIj=S2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJLFs-0007pn-QE
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 17:00:20 +0000
X-Inumbo-ID: 70fe5c76-66b2-11e9-a695-fff1a3e162a4
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 70fe5c76-66b2-11e9-a695-fff1a3e162a4;
 Wed, 24 Apr 2019 17:00:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9609115BE;
 Wed, 24 Apr 2019 10:00:19 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B9DD3F557;
 Wed, 24 Apr 2019 10:00:18 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 24 Apr 2019 17:59:54 +0100
Message-Id: <20190424165955.23718-12-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190424165955.23718-1-julien.grall@arm.com>
References: <20190424165955.23718-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 11/12] xen/arm: mm: Don't open-code Xen PT
 update in {set, clear}_fixmap()
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
Cc: Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>,
 sstabellini@kernel.org, Andrii_Anisov@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190424165954.971vvpcaYELQ2ZzI7778lRLvhIYoxBy6mAWFS5dE0U8@z>

e3NldCwgY2xlYXJ9X2ZpeG1hcCgpIGFyZSBjdXJyZW50bHkgb3Blbi1jb2RpbmcgdXBkYXRlIHRv
IHRoZSBYZW4KcGFnZS10YWJsZXMuIFRoaXMgY2FuIGJlIGF2b2lkZWQgYnkgdXNpbmcgdGhlIGdl
bmVyaWMgaGVscGVycwptYXBfcGFnZXNfdG9feGVuKCkgYW5kIGRlc3Ryb3lfeGVuX21hcHBpbmdz
KCkuCgpCb3RoIGZ1bmN0aW9uIGFyZSBub3QgbWVhbnQgdG8gZmFpbCBmb3IgZml4bWFwLCBoZW5j
ZSB0aGUgQlVHX09OKCkKY2hlY2tpbmcgdGhlIHJldHVybi4KClNpZ25lZC1vZmYtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL21tLmMgfCAx
NiArKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tbS5jIGIveGVuL2FyY2gvYXJt
L21tLmMKaW5kZXggMDIyOTY3ZmY5Zi4uN2U2ZGY5Zjg3NyAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
YXJtL21tLmMKKysrIGIveGVuL2FyY2gvYXJtL21tLmMKQEAgLTM0MywxOSArMzQzLDE5IEBAIHN0
YXRpYyBpbmxpbmUgbHBhZV90IG1mbl90b194ZW5fZW50cnkobWZuX3QgbWZuLCB1bnNpZ25lZCBh
dHRyKQogLyogTWFwIGEgNGsgcGFnZSBpbiBhIGZpeG1hcCBlbnRyeSAqLwogdm9pZCBzZXRfZml4
bWFwKHVuc2lnbmVkIG1hcCwgbWZuX3QgbWZuLCB1bnNpZ25lZCBpbnQgZmxhZ3MpCiB7Ci0gICAg
bHBhZV90IHB0ZSA9IG1mbl90b194ZW5fZW50cnkobWZuLCBQQUdFX0FJX01BU0soZmxhZ3MpKTsK
LSAgICBwdGUucHQudGFibGUgPSAxOyAvKiA0ayBtYXBwaW5ncyBhbHdheXMgaGF2ZSB0aGlzIGJp
dCBzZXQgKi8KLSAgICBwdGUucHQueG4gPSAxOwotICAgIHdyaXRlX3B0ZSh4ZW5fZml4bWFwICsg
dGhpcmRfdGFibGVfb2Zmc2V0KEZJWE1BUF9BRERSKG1hcCkpLCBwdGUpOwotICAgIGZsdXNoX3hl
bl90bGJfcmFuZ2VfdmEoRklYTUFQX0FERFIobWFwKSwgUEFHRV9TSVpFKTsKKyAgICBpbnQgcmVz
OworCisgICAgcmVzID0gbWFwX3BhZ2VzX3RvX3hlbihGSVhNQVBfQUREUihtYXApLCBtZm4sIDEs
IGZsYWdzKTsKKyAgICBCVUdfT04ocmVzICE9IDApOwogfQogCiAvKiBSZW1vdmUgYSBtYXBwaW5n
IGZyb20gYSBmaXhtYXAgZW50cnkgKi8KIHZvaWQgY2xlYXJfZml4bWFwKHVuc2lnbmVkIG1hcCkK
IHsKLSAgICBscGFlX3QgcHRlID0gezB9OwotICAgIHdyaXRlX3B0ZSh4ZW5fZml4bWFwICsgdGhp
cmRfdGFibGVfb2Zmc2V0KEZJWE1BUF9BRERSKG1hcCkpLCBwdGUpOwotICAgIGZsdXNoX3hlbl90
bGJfcmFuZ2VfdmEoRklYTUFQX0FERFIobWFwKSwgUEFHRV9TSVpFKTsKKyAgICBpbnQgcmVzOwor
CisgICAgcmVzID0gZGVzdHJveV94ZW5fbWFwcGluZ3MoRklYTUFQX0FERFIobWFwKSwgRklYTUFQ
X0FERFIobWFwKSArIFBBR0VfU0laRSk7CisgICAgQlVHX09OKHJlcyAhPSAwKTsKIH0KIAogLyog
Q3JlYXRlIFhlbidzIG1hcHBpbmdzIG9mIG1lbW9yeS4KLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
