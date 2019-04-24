Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58104C282CE
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 17:00:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BF292148D
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 17:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BF292148D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJLFu-0007qw-Ma; Wed, 24 Apr 2019 17:00:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8RIj=S2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJLFu-0007qV-22
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 17:00:22 +0000
X-Inumbo-ID: 71db77c8-66b2-11e9-9fa8-dfc6e70f8e3d
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 71db77c8-66b2-11e9-9fa8-dfc6e70f8e3d;
 Wed, 24 Apr 2019 17:00:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1477374;
 Wed, 24 Apr 2019 10:00:20 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6D073F557;
 Wed, 24 Apr 2019 10:00:19 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 24 Apr 2019 17:59:55 +0100
Message-Id: <20190424165955.23718-13-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190424165955.23718-1-julien.grall@arm.com>
References: <20190424165955.23718-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 12/12] xen/arm: mm: Remove
 set_pte_flags_on_range()
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
Message-ID: <20190424165955.uL9tWCEtB_A4_p3lOdtIRve5Sk59z9wUvm6jlwSx2CY@z>

c2V0X3B0ZV9mbGFnc19vbl9yYW5nZSgpIGlzIHlldCBhbm90aGVyIGZ1bmN0aW9uIHRoYXQgd2ls
bCBvcGVuLWNvZGUKdXBkYXRlIHRvIGEgc3BlY2lmaWMgcmFuZ2UgaW4gdGhlIFhlbiBwYWdlLXRh
Ymxlcy4gSXQgY2FuIGJlIGNvbXBsZXRlbHkKZHJvcHBlZCBieSB1c2luZyBlaXRoZXIgbW9kaWZ5
X3hlbl9tYXBwaW5ncygpIG9yIGRlc3Ryb3lfeGVuX21hcHBpbmdzKCkuCgpTaWduZWQtb2ZmLWJ5
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgotLS0KIHhlbi9hcmNoL2FybS9t
bS5jIHwgNTggKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDQ4IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tbS5jIGIveGVuL2FyY2gvYXJtL21tLmMKaW5k
ZXggN2U2ZGY5Zjg3Ny4uNTgxMGQ1NjllZSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL21tLmMK
KysrIGIveGVuL2FyY2gvYXJtL21tLmMKQEAgLTEyNzIsNTIgKzEyNzIsNiBAQCBpbnQgbW9kaWZ5
X3hlbl9tYXBwaW5ncyh1bnNpZ25lZCBsb25nIHMsIHVuc2lnbmVkIGxvbmcgZSwgdW5zaWduZWQg
aW50IGZsYWdzKQogICAgIHJldHVybiB4ZW5fcHRfdXBkYXRlKHMsIElOVkFMSURfTUZOLCAoZSAt
IHMpID4+IFBBR0VfU0hJRlQsIGZsYWdzKTsKIH0KIAotZW51bSBtZyB7IG1nX2NsZWFyLCBtZ19y
bywgbWdfcncsIG1nX3J4IH07Ci1zdGF0aWMgdm9pZCBzZXRfcHRlX2ZsYWdzX29uX3JhbmdlKGNv
bnN0IGNoYXIgKnAsIHVuc2lnbmVkIGxvbmcgbCwgZW51bSBtZyBtZykKLXsKLSAgICBscGFlX3Qg
cHRlOwotICAgIGludCBpOwotCi0gICAgQVNTRVJUKGlzX2tlcm5lbChwKSAmJiBpc19rZXJuZWwo
cCArIGwpKTsKLQotICAgIC8qIENhbiBvbmx5IGd1YXJkIGluIHBhZ2UgZ3JhbnVsYXJpdHkgKi8K
LSAgICBBU1NFUlQoISgodW5zaWduZWQgbG9uZykgcCAmIH5QQUdFX01BU0spKTsKLSAgICBBU1NF
UlQoIShsICYgflBBR0VfTUFTSykpOwotCi0gICAgZm9yICggaSA9IChwIC0gX3N0YXJ0KSAvIFBB
R0VfU0laRTsgCi0gICAgICAgICAgaSA8IChwICsgbCAtIF9zdGFydCkgLyBQQUdFX1NJWkU7IAot
ICAgICAgICAgIGkrKyApCi0gICAgewotICAgICAgICBwdGUgPSB4ZW5feGVubWFwW2ldOwotICAg
ICAgICBzd2l0Y2ggKCBtZyApCi0gICAgICAgIHsKLSAgICAgICAgY2FzZSBtZ19jbGVhcjoKLSAg
ICAgICAgICAgIHB0ZS5wdC52YWxpZCA9IDA7Ci0gICAgICAgICAgICBicmVhazsKLSAgICAgICAg
Y2FzZSBtZ19ybzoKLSAgICAgICAgICAgIHB0ZS5wdC52YWxpZCA9IDE7Ci0gICAgICAgICAgICBw
dGUucHQucHhuID0gMTsKLSAgICAgICAgICAgIHB0ZS5wdC54biA9IDE7Ci0gICAgICAgICAgICBw
dGUucHQucm8gPSAxOwotICAgICAgICAgICAgYnJlYWs7Ci0gICAgICAgIGNhc2UgbWdfcnc6Ci0g
ICAgICAgICAgICBwdGUucHQudmFsaWQgPSAxOwotICAgICAgICAgICAgcHRlLnB0LnB4biA9IDE7
Ci0gICAgICAgICAgICBwdGUucHQueG4gPSAxOwotICAgICAgICAgICAgcHRlLnB0LnJvID0gMDsK
LSAgICAgICAgICAgIGJyZWFrOwotICAgICAgICBjYXNlIG1nX3J4OgotICAgICAgICAgICAgcHRl
LnB0LnZhbGlkID0gMTsKLSAgICAgICAgICAgIHB0ZS5wdC5weG4gPSAwOwotICAgICAgICAgICAg
cHRlLnB0LnhuID0gMDsKLSAgICAgICAgICAgIHB0ZS5wdC5ybyA9IDE7Ci0gICAgICAgICAgICBi
cmVhazsKLSAgICAgICAgfQotICAgICAgICB3cml0ZV9wdGUoeGVuX3hlbm1hcCArIGksIHB0ZSk7
Ci0gICAgfQotICAgIGZsdXNoX3hlbl90bGJfbG9jYWwoKTsKLX0KLQogLyogUmVsZWFzZSBhbGwg
X19pbml0IGFuZCBfX2luaXRkYXRhIHJhbmdlcyB0byBiZSByZXVzZWQgKi8KIHZvaWQgZnJlZV9p
bml0X21lbW9yeSh2b2lkKQogewpAQCAtMTMyNiw4ICsxMjgwLDEyIEBAIHZvaWQgZnJlZV9pbml0
X21lbW9yeSh2b2lkKQogICAgIHVpbnQzMl90IGluc247CiAgICAgdW5zaWduZWQgaW50IGksIG5y
ID0gbGVuIC8gc2l6ZW9mKGluc24pOwogICAgIHVpbnQzMl90ICpwOworICAgIGludCByYzsKIAot
ICAgIHNldF9wdGVfZmxhZ3Nfb25fcmFuZ2UoX19pbml0X2JlZ2luLCBsZW4sIG1nX3J3KTsKKyAg
ICByYyA9IG1vZGlmeV94ZW5fbWFwcGluZ3MoKHVuc2lnbmVkIGxvbmcpX19pbml0X2JlZ2luLAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodW5zaWduZWQgbG9uZylfX2luaXRfZW5kLCBQ
QUdFX0hZUEVSVklTT1JfUlcpOworICAgIGlmICggcmMgKQorICAgICAgICBwYW5pYygiVW5hYmxl
IHRvIG1hcCBSVyB0aGUgaW5pdCBzZWN0aW9uIChyYyA9ICVkKSIsIHJjKTsKIAogICAgIC8qCiAg
ICAgICogRnJvbSBub3cgb24sIGluaXQgd2lsbCBub3QgYmUgdXNlZCBmb3IgZXhlY3V0aW9uIGFu
eW1vcmUsCkBAIC0xMzQ1LDcgKzEzMDMsMTEgQEAgdm9pZCBmcmVlX2luaXRfbWVtb3J5KHZvaWQp
CiAgICAgZm9yICggaSA9IDA7IGkgPCBucjsgaSsrICkKICAgICAgICAgKihwICsgaSkgPSBpbnNu
OwogCi0gICAgc2V0X3B0ZV9mbGFnc19vbl9yYW5nZShfX2luaXRfYmVnaW4sIGxlbiwgbWdfY2xl
YXIpOworICAgIHJjID0gZGVzdHJveV94ZW5fbWFwcGluZ3MoKHVuc2lnbmVkIGxvbmcpX19pbml0
X2JlZ2luLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHVuc2lnbmVkIGxvbmcpX19p
bml0X2VuZCk7CisgICAgaWYgKCByYyApCisgICAgICAgIHBhbmljKCJVbmFibGUgdG8gcmVtb3Zl
IHRoZSBpbml0IHNlY3Rpb24gKHJjID0gJWQpIiwgcmMpOworCiAgICAgaW5pdF9kb21oZWFwX3Bh
Z2VzKHBhLCBwYSArIGxlbik7CiAgICAgcHJpbnRrKCJGcmVlZCAlbGRrQiBpbml0IG1lbW9yeS5c
biIsIChsb25nKShfX2luaXRfZW5kLV9faW5pdF9iZWdpbik+PjEwKTsKIH0KLS0gCjIuMTEuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
