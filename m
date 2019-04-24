Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C900FC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 17:00:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1E342148D
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 17:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1E342148D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJLFr-0007pc-Mo; Wed, 24 Apr 2019 17:00:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8RIj=S2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJLFq-0007ou-7w
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 17:00:18 +0000
X-Inumbo-ID: 6f5498a0-66b2-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 6f5498a0-66b2-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 17:00:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D40E7374;
 Wed, 24 Apr 2019 10:00:16 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B99843F557;
 Wed, 24 Apr 2019 10:00:15 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 24 Apr 2019 17:59:52 +0100
Message-Id: <20190424165955.23718-10-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190424165955.23718-1-julien.grall@arm.com>
References: <20190424165955.23718-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 09/12] xen/arm: mm: Use {,
 un}map_domain_page() to map/unmap Xen page-tables
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
Message-ID: <20190424165952.Fk7270B4phjZgXh7BXk-5P8bsbrAFLgGjqrp6aaQobA@z>

Q3VycmVudGx5LCB0aGUgdmlydHVhbCBhZGRyZXNzIG9mIHRoZSAzcmQgbGV2ZWwgcGFnZS10YWJs
ZXMgaXMgb2J0YWluZWQKdXNpbmcgbWZuX3RvX3ZpcnQoKS4KCk9uIEFybTMyLCBtZm5fdG9fdmly
dCBjYW4gb25seSB3b3JrIG9uIHhlbmhlYXAgcGFnZS4gV2hpbGUgaW4gcHJhY3RpY2UKYWxsIHRo
ZSBwYWdlLXRhYmxlcyB1cGRhdGVkIHdpbGwgcmVzaWRlIGluIHhlbmhlYXAsIGluIHByYWN0aXZl
IHRoZQpwYWdlLXRhYmxlcyBjb3ZlcmluZyBYZW4gbWVtb3J5IChlLmcgeGVuX21hcHBpbmcpIGlz
IHBhcnQgb2YgWGVuIGJpbmFyeS4KCkZ1cnRoZXJtb3JlLCBhIGZvbGxvdy11cCBjaGFuZ2Ugd2ls
bCB1cGRhdGUgeGVuX3B0X3VwZGF0ZV9lbnRyeSgpIHRvCndhbGsgYWxsIHRoZSBsZXZlbHMgYW5k
IHRoZXJlZm9yZSBiZSBtb3JlIGdlbmVyaWMuIFNvbWUgb2YgdGhlCnBhZ2UtdGFibGVzIHdpbGwg
YWxzbyBwYXJ0IG9mIFhlbiBtZW1vcnkgYW5kIHRoZXJlZm9yZSB3aWxsIG5vdCBiZQpyZWFjaGFi
bGUgdXNpbmcgbWZuX3RvX3ZpcnQoKS4KClRoZSBlYXNpZXN0IHdheSB0byByZWFjaCB0aG9zZSBw
YWdlcyBpcyB0byB1c2UgeywgdW59bWFwX2RvbWFpbl9wYWdlKCkuCldoaWxlIG9uIGFybTMyIHRo
aXMgbWVhbnMgYW4gZXh0cmEgbWFwcGluZyBpbiB0aGUgbm9ybWFsIGNhc2VzLCB0aGlzIGlzIG5v
dAp2ZXJ5IGltcG9ydGFudCBhcyB4ZW4gcGFnZS10YWJsZXMgYXJlIG5vdCB1cGRhdGVkIG9mdGVu
LgoKSW4gb3JkZXIgdG8gYWxsb3cgZnV0dXJlIGNoYW5nZSBpbiB0aGUgd2F5IFhlbiBwYWdlLXRh
YmxlcyBhcmUgbWFwcGVkLAp0d28gbmV3IGhlbHBlcnMgYXJlIGludHJvZHVjZWQgdG8gbWFwL3Vu
bWFwIHRoZSBwYWdlLXRhYmxlcy4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVu
LmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL21tLmMgfCAyNiArKysrKysrKysrKysr
KysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0u
YwppbmRleCA5N2U4NzZkODY2Li4xMTVlODM0MGYxIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0v
bW0uYworKysgYi94ZW4vYXJjaC9hcm0vbW0uYwpAQCAtOTY5LDYgKzk2OSwxNiBAQCBzdGF0aWMg
aW50IGNyZWF0ZV94ZW5fdGFibGUobHBhZV90ICplbnRyeSkKICAgICByZXR1cm4gMDsKIH0KIAor
c3RhdGljIGxwYWVfdCAqeGVuX21hcF90YWJsZShtZm5fdCBtZm4pCit7CisgICAgcmV0dXJuIG1h
cF9kb21haW5fcGFnZShtZm4pOworfQorCitzdGF0aWMgdm9pZCB4ZW5fdW5tYXBfdGFibGUoY29u
c3QgbHBhZV90ICp0YWJsZSkKK3sKKyAgICB1bm1hcF9kb21haW5fcGFnZSh0YWJsZSk7Cit9CisK
IC8qIFNhbml0eSBjaGVjayBvZiB0aGUgZW50cnkgKi8KIHN0YXRpYyBib29sIHhlbl9wdF9jaGVj
a19lbnRyeShscGFlX3QgZW50cnksIG1mbl90IG1mbiwgdW5zaWduZWQgaW50IGZsYWdzKQogewpA
QCAtMTAzMSw2ICsxMDQxLDcgQEAgc3RhdGljIGJvb2wgeGVuX3B0X2NoZWNrX2VudHJ5KGxwYWVf
dCBlbnRyeSwgbWZuX3QgbWZuLCB1bnNpZ25lZCBpbnQgZmxhZ3MpCiBzdGF0aWMgaW50IHhlbl9w
dF91cGRhdGVfZW50cnkodW5zaWduZWQgbG9uZyBhZGRyLCBtZm5fdCBtZm4sCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGZsYWdzKQogeworICAgIGludCByYzsK
ICAgICBscGFlX3QgcHRlLCAqZW50cnk7CiAgICAgbHBhZV90ICp0aGlyZCA9IE5VTEw7CiAKQEAg
LTEwNDksMTUgKzEwNjAsMTcgQEAgc3RhdGljIGludCB4ZW5fcHRfdXBkYXRlX2VudHJ5KHVuc2ln
bmVkIGxvbmcgYWRkciwgbWZuX3QgbWZuLAogCiAgICAgQlVHX09OKCFscGFlX2lzX3ZhbGlkKCpl
bnRyeSkpOwogCi0gICAgdGhpcmQgPSBtZm5fdG9fdmlydChscGFlX2dldF9tZm4oKmVudHJ5KSk7
CisgICAgdGhpcmQgPSB4ZW5fbWFwX3RhYmxlKGxwYWVfZ2V0X21mbigqZW50cnkpKTsKICAgICBl
bnRyeSA9ICZ0aGlyZFt0aGlyZF90YWJsZV9vZmZzZXQoYWRkcildOwogCisgICAgcmMgPSAtRUlO
VkFMOwogICAgIGlmICggIXhlbl9wdF9jaGVja19lbnRyeSgqZW50cnksIG1mbiwgZmxhZ3MpICkK
LSAgICAgICAgcmV0dXJuIC1FSU5WQUw7CisgICAgICAgIGdvdG8gb3V0OwogCiAgICAgLyogSWYg
d2UgYXJlIG9ubHkgcG9wdWxhdGluZyBwYWdlLXRhYmxlLCB0aGVuIHdlIGFyZSBkb25lLiAqLwor
ICAgIHJjID0gMDsKICAgICBpZiAoIGZsYWdzICYgX1BBR0VfUE9QVUxBVEUgKQotICAgICAgICBy
ZXR1cm4gMDsKKyAgICAgICAgZ290byBvdXQ7CiAKICAgICAvKiBXZSBhcmUgcmVtb3ZpbmcgdGhl
IHBhZ2UgKi8KICAgICBpZiAoICEoZmxhZ3MgJiBfUEFHRV9QUkVTRU5UKSApCkBAIC0xMDgyLDcg
KzEwOTUsMTIgQEAgc3RhdGljIGludCB4ZW5fcHRfdXBkYXRlX2VudHJ5KHVuc2lnbmVkIGxvbmcg
YWRkciwgbWZuX3QgbWZuLAogCiAgICAgd3JpdGVfcHRlKGVudHJ5LCBwdGUpOwogCi0gICAgcmV0
dXJuIDA7CisgICAgcmMgPSAwOworCitvdXQ6CisgICAgeGVuX3VubWFwX3RhYmxlKHRoaXJkKTsK
KworICAgIHJldHVybiByYzsKIH0KIAogc3RhdGljIERFRklORV9TUElOTE9DSyh4ZW5fcHRfbG9j
ayk7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
