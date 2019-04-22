Return-Path: <SRS0=5Xtu=SY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD40C282CE
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66E46214AE
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 16:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66E46214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIc8v-00058o-O4; Mon, 22 Apr 2019 16:50:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tD/7=SY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIc8u-00054g-FK
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 16:50:08 +0000
X-Inumbo-ID: af2501c1-651e-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id af2501c1-651e-11e9-92d7-bc764e045a96;
 Mon, 22 Apr 2019 16:50:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A0B615AB;
 Mon, 22 Apr 2019 09:50:07 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A9B43F557;
 Mon, 22 Apr 2019 09:50:06 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Apr 2019 17:49:29 +0100
Message-Id: <20190422164937.21350-13-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190422164937.21350-1-julien.grall@arm.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 12/20] xen/arm32: head: Always zero r3 before
 update a page-table entry
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
Message-ID: <20190422164929.C_CSAqaiE8n2mE7yfBvzDYpjvDiN4ZU61v4TSBDQUz4@z>

VGhlIGJvb3QgY29kZSBpcyB1c2luZyByMiBhbmQgcjMgdG8gaG9sZCB0aGUgcGFnZS10YWJsZSBl
bnRyeSB2YWx1ZS4KV2hpbGUgcjIgaXMgYWx3YXlzIHVwZGF0ZWQgYmVmb3JlIHN0b3JpbmcgdGhl
IHZhbHVlLCB0aGlzIGlzIG5vdCBhbHdheXMKdGhlIGNhc2UgZm9yIHIzLgoKVGhhbmtmdWxseSB0
b2RheSwgcjMgd2lsbCBhbHdheXMgYmUgemVybyB3aGVuIHdlIGNhcmUuIEJ1dCB0aGlzIGlzCmRp
ZmZpY3VsdCB0byB0cmFjayBhbmQgZXJyb3ItcHJvbmUuCgpTbyBhbHdheXMgemVybyByMyB3aXRo
aW4gdGhlIGZldyBpbnN0cnVjdGlvbnMgYmVmb3JlIHRoZSB3cml0ZSB0aGUKcGFnZS10YWJsZSBl
bnRyeS4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+
Ci0tLQogeGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyBi
L3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKaW5kZXggMzQ0ODgxN2FhYi4uMDUzNmI2MmFlYyAx
MDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUworKysgYi94ZW4vYXJjaC9hcm0v
YXJtMzIvaGVhZC5TCkBAIC0yNzAsNiArMjcwLDcgQEAgY3B1X2luaXRfZG9uZToKICAgICAgICAg
b3JyICAgcjIsIHIyLCAjUFRfVVBQRVIoTUVNKSAvKiByMjpyMyA6PSBzZWN0aW9uIG1hcCAqLwog
ICAgICAgICBvcnIgICByMiwgcjIsICNQVF9MT1dFUihNRU0pCiAgICAgICAgIGxzbCAgIHIxLCBy
MSwgIzMgICAgICAgICAgICAgLyogcjEgOj0gU2xvdCBvZmZzZXQgKi8KKyAgICAgICAgbW92ICAg
cjMsICMweDAKICAgICAgICAgc3RyZCAgcjIsIHIzLCBbcjQsIHIxXSAgICAgICAvKiBNYXBwaW5n
IG9mIHBhZGRyKHN0YXJ0KSAqLwogICAgICAgICBtb3YgICByNiwgIzEgICAgICAgICAgICAgICAg
IC8qIHI2IDo9IGlkZW50aXR5IG1hcCBub3cgaW4gcGxhY2UgKi8KIApAQCAtMzc3LDYgKzM3OCw3
IEBAIHBhZ2luZzoKICAgICAgICAgbHNsICAgcjIsIHIyLCAjVEhJUkRfU0hJRlQgICAvKiA0SyBh
bGlnbmVkIHBhZGRyIG9mIFVBUlQgKi8KICAgICAgICAgb3JyICAgcjIsIHIyLCAjUFRfVVBQRVIo
REVWX0wzKQogICAgICAgICBvcnIgICByMiwgcjIsICNQVF9MT1dFUihERVZfTDMpIC8qIHIyOnIz
IDo9IDRLIGRldiBtYXAgaW5jbHVkaW5nIFVBUlQgKi8KKyAgICAgICAgbW92ICAgcjMsICMwCiAg
ICAgICAgIHN0cmQgIHIyLCByMywgW3IxLCAjKEZJWE1BUF9DT05TT0xFKjgpXSAvKiBNYXAgaXQg
aW4gdGhlIGZpcnN0IGZpeG1hcCdzIHNsb3QgKi8KIDE6CiAKQEAgLTM4OCw2ICszOTAsNyBAQCBw
YWdpbmc6CiAgICAgICAgIG9yciAgIHIyLCByMiwgI1BUX0xPV0VSKFBUKSAgLyogcjI6cjMgOj0g
dGFibGUgbWFwIG9mIHhlbl9maXhtYXAgKi8KICAgICAgICAgbGRyICAgcjQsID1GSVhNQVBfQURE
UigwKQogICAgICAgICBtb3YgICByNCwgcjQsIGxzciAjKFNFQ09ORF9TSElGVCAtIDMpICAgLyog
cjQgOj0gU2xvdCBmb3IgRklYTUFQKDApICovCisgICAgICAgIG1vdiAgIHIzLCAjMAogICAgICAg
ICBzdHJkICByMiwgcjMsIFtyMSwgcjRdICAgICAgIC8qIE1hcCBpdCBpbiB0aGUgZml4bWFwJ3Mg
c2xvdCAqLwogCiAgICAgICAgIC8qIFVzZSBhIHZpcnR1YWwgYWRkcmVzcyB0byBhY2Nlc3MgdGhl
IFVBUlQuICovCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
