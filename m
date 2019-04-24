Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F19DC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 17:00:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 038502148D
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 17:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 038502148D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJLFk-0007nS-Ux; Wed, 24 Apr 2019 17:00:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8RIj=S2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJLFj-0007nC-8v
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 17:00:11 +0000
X-Inumbo-ID: 6b529442-66b2-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 6b529442-66b2-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 17:00:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F363AEBD;
 Wed, 24 Apr 2019 10:00:09 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D87713F557;
 Wed, 24 Apr 2019 10:00:08 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 24 Apr 2019 17:59:47 +0100
Message-Id: <20190424165955.23718-5-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190424165955.23718-1-julien.grall@arm.com>
References: <20190424165955.23718-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 04/12] xen/arm: mm: Introduce _PAGE_PRESENT and
 _PAGE_POPULATE
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
Message-ID: <20190424165947.fB8J5YiN3l5g9U__J_UK8FH-CvTj53DafG6RhEujTXc@z>

QXQgdGhlIG1vbWVudCwgdGhlIGZsYWdzIGFyZSBub3QgZW5vdWdoIHRvIGRlc2NyaWJlIHdoYXQg
a2luZCBvZiB1cGRhdGUKd2lsbCBkb25lIG9uIHRoZSBWQSByYW5nZS4gVGhleSBuZWVkIHRvIGJl
IHVzZWQgaW4gY29uanVuY3Rpb24gd2l0aCB0aGUKZW51bSB4ZW5tYXBfb3BlcmF0aW9uLgoKSXQg
d291bGQgYmUgbW9yZSBjb252ZW5pZW50IHRvIGhhdmUgYWxsIHRoZSBpbmZvcm1hdGlvbiBmb3Ig
dGhlIHVwZGF0ZQppbiBhIHNpbmdsZSBwbGFjZS4KClR3byBuZXcgZmxhZ3MgYXJlIGFkZGVkIHRv
IHJlbW92ZSB0aGUgcmVsaWVuY2Ugb24geGVubWFwX29wZXJhdGlvbjoKICAgIC0gX1BBR0VfUFJF
U0VOVDogSW5kaWNhdGUgd2hldGhlciB3ZSBhcmUgYWRkaW5nL3JlbW92aW5nIHRoZSBtYXBwaW5n
CiAgICAtIF9QQUdFX1BPUFVMQVRFOiBJbmRpY2F0ZSB3aGV0aGVyIHdlIG9ubHkgcG9wdWxhdGUg
cGFnZS10YWJsZXMKClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL21tLmMgICAgICAgICAgfCAyICstCiB4ZW4vaW5jbHVk
ZS9hc20tYXJtL3BhZ2UuaCB8IDkgKysrKysrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBi
L3hlbi9hcmNoL2FybS9tbS5jCmluZGV4IDZiMWQ0MWNmYmEuLmI2MTIxN2FiZDAgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL2FybS9tbS5jCisrKyBiL3hlbi9hcmNoL2FybS9tbS5jCkBAIC0xMDc1LDcg
KzEwNzUsNyBAQCBpbnQgbWFwX3BhZ2VzX3RvX3hlbih1bnNpZ25lZCBsb25nIHZpcnQsCiAKIGlu
dCBwb3B1bGF0ZV9wdF9yYW5nZSh1bnNpZ25lZCBsb25nIHZpcnQsIHVuc2lnbmVkIGxvbmcgbnJf
bWZucykKIHsKLSAgICByZXR1cm4geGVuX3B0X3VwZGF0ZShSRVNFUlZFLCB2aXJ0LCBJTlZBTElE
X01GTiwgbnJfbWZucywgMCk7CisgICAgcmV0dXJuIHhlbl9wdF91cGRhdGUoUkVTRVJWRSwgdmly
dCwgSU5WQUxJRF9NRk4sIG5yX21mbnMsIF9QQUdFX1BPUFVMQVRFKTsKIH0KIAogaW50IGRlc3Ry
b3lfeGVuX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcgdiwgdW5zaWduZWQgbG9uZyBlKQpkaWZmIC0t
Z2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9wYWdlLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL3Bh
Z2UuaAppbmRleCAyYmNkYjBmMWE1Li5jYWYyZmFjMWZmIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVk
ZS9hc20tYXJtL3BhZ2UuaAorKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL3BhZ2UuaApAQCAtNzYs
NiArNzYsOCBAQAogICoKICAqIFswOjJdIE1lbW9yeSBBdHRyaWJ1dGUgSW5kZXgKICAqIFszOjRd
IFBlcm1pc3Npb24gZmxhZ3MKKyAqIFs1XSAgIFByZXNlbnQgYml0CisgKiBbNl0gICBQb3B1bGF0
ZSBwYWdlIHRhYmxlCiAgKi8KICNkZWZpbmUgUEFHRV9BSV9NQVNLKHgpICgoeCkgJiAweDdVKQog
CkBAIC04NiwxMiArODgsMTUgQEAKICNkZWZpbmUgUEFHRV9YTl9NQVNLKHgpICgoKHgpID4+IF9Q
QUdFX1hOX0JJVCkgJiAweDFVKQogI2RlZmluZSBQQUdFX1JPX01BU0soeCkgKCgoeCkgPj4gX1BB
R0VfUk9fQklUKSAmIDB4MVUpCiAKKyNkZWZpbmUgX1BBR0VfUFJFU0VOVCAgICAoMVUgPDwgNSkK
KyNkZWZpbmUgX1BBR0VfUE9QVUxBVEUgICAoMVUgPDwgNikKKwogLyoKICAqIF9QQUdFX0RFVklD
RSBhbmQgX1BBR0VfTk9STUFMIGFyZSBjb252ZW5pZW5jZSBkZWZpbmVzLiBUaGV5IGFyZSBub3QK
ICAqIG1lYW50IHRvIGJlIHVzZWQgb3V0c2lkZSBvZiB0aGlzIGhlYWRlci4KICAqLwotI2RlZmlu
ZSBfUEFHRV9ERVZJQ0UgICAgX1BBR0VfWE4KLSNkZWZpbmUgX1BBR0VfTk9STUFMICAgIE1UX05P
Uk1BTAorI2RlZmluZSBfUEFHRV9ERVZJQ0UgICAgKF9QQUdFX1hOfF9QQUdFX1BSRVNFTlQpCisj
ZGVmaW5lIF9QQUdFX05PUk1BTCAgICAoTVRfTk9STUFMfF9QQUdFX1BSRVNFTlQpCiAKICNkZWZp
bmUgUEFHRV9IWVBFUlZJU09SX1JPICAgICAgKF9QQUdFX05PUk1BTHxfUEFHRV9ST3xfUEFHRV9Y
TikKICNkZWZpbmUgUEFHRV9IWVBFUlZJU09SX1JYICAgICAgKF9QQUdFX05PUk1BTHxfUEFHRV9S
TykKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
