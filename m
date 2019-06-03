Return-Path: <SRS0=kLId=UC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED0E2C04AB5
	for <xen-devel@archiver.kernel.org>; Mon,  3 Jun 2019 16:11:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C684D2772F
	for <xen-devel@archiver.kernel.org>; Mon,  3 Jun 2019 16:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C684D2772F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXpYL-0004Bi-RY; Mon, 03 Jun 2019 16:11:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXpYK-0004BU-3v
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 16:11:16 +0000
X-Inumbo-ID: 3619cde8-861a-11e9-a38d-d38d57da0bfd
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3619cde8-861a-11e9-a38d-d38d57da0bfd;
 Mon, 03 Jun 2019 16:11:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69C8780D;
 Mon,  3 Jun 2019 09:11:14 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 127C63F5AF;
 Mon,  3 Jun 2019 09:11:12 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  3 Jun 2019 17:11:08 +0100
Message-Id: <20190603161108.864-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH v2] xen/public: arch-arm: Restrict the
 visibility of struct vcpu_guest_core_regs
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, wl@xen.org,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com,
 Julien Grall <julien.grall@arm.com>, jbeulich@suse.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190603161108.1vZGr2sAMXzqWGwLld23UJnMZUB9LAHREP1EpKdT53A@z>

Q3VycmVudGx5LCB0aGUgc3RydWN0dXJlIHZjcHVfZ3Vlc3RfY29yZV9yZWdzIGlzIHBhcnQgb2Yg
dGhlIHB1YmxpYyBBUEkuClRoaXMgaW1wbGllcyB0aGF0IGFueSBjaGFuZ2UgaW4gdGhlIHN0cnVj
dHVyZSBzaG91bGQgYmUgYmFja3dhcmQKY29tcGF0aWJsZS4KCkhvd2V2ZXIsIHRoZSBzdHJ1Y3R1
cmUgaXMgb25seSBuZWVkZWQgYnkgdGhlIHRvb2xzIGFuZCBYZW4uIEl0IGlzIGFsc28Kbm90IGV4
cGVjdGVkIHRvIGJlIGV2ZXIgdXNlZCBvdXRzaWRlIG9mIHRoYXQgY29udGV4dC4gU28gd2UgY291
bGQgc2F2ZSB1cwpzb21lIGhlYWRhY2hlIGJ5IG9ubHkgZGVjbGFyaW5nIHRoZSBzdHJ1Y3R1cmUg
Zm9yIFhlbiBhbmQgdG9vbHMuCgpTdWdnZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+ClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+CgotLS0KICAgIFRoaXMgaXMgYSBmb2xsb3ctdXAgb2YgdGhlIGRpc2N1c3Np
b24gWzFdLgoKICAgIEFzIHRoaXMgaXMgbm93IFhlbiBhbmQgdG9vbHMgb25seSwgSSBhbSB3b25k
ZXJpbmcgd2hldGhlciB0aGUgY2hlY2sgb24KICAgIEdOVV9DIGlzIHN0aWxsIG5lY2Vzc2FyeS4g
SSBhbSBoYXBweSB0byBzZW5kIGEgZm9sbG93LXVwIHBhdGNoIChvciBmb2xkCiAgICBpbiB0aGlz
IG9uZSkgaWYgaXQgY2FuIGJlIHJlbW92ZWQuCgogICAgWzFdIDwzYzI0NWM1Yi01MWM2LTFkMGUt
YWQ2Yy00MjQxNDU3MzE2NmZAYXJtLmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1h
cm0uaCB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEveGVuL2luY2x1ZGUvcHVibGljL2FyY2gtYXJtLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJj
aC1hcm0uaAppbmRleCBlYjQyNGU4Mjg2Li5lOWE4NmQ4ZWI4IDEwMDY0NAotLS0gYS94ZW4vaW5j
bHVkZS9wdWJsaWMvYXJjaC1hcm0uaAorKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0u
aApAQCAtMTk3LDYgKzE5Nyw3IEBACiAgICAgfSB3aGlsZSAoIDAgKQogI2RlZmluZSBzZXRfeGVu
X2d1ZXN0X2hhbmRsZShobmQsIHZhbCkgc2V0X3hlbl9ndWVzdF9oYW5kbGVfcmF3KGhuZCwgdmFs
KQogCisjaWYgZGVmaW5lZChfX1hFTl9fKSB8fCBkZWZpbmVkKF9fWEVOX1RPT0xTX18pCiAjaWYg
ZGVmaW5lZChfX0dOVUNfXykgJiYgIWRlZmluZWQoX19TVFJJQ1RfQU5TSV9fKQogLyogQW5vbnlt
b3VzIHVuaW9uIGluY2x1ZGVzIGJvdGggMzItIGFuZCA2NC1iaXQgbmFtZXMgKGUuZy4sIHIwL3gw
KS4gKi8KICMgZGVmaW5lIF9fREVDTF9SRUcobjY0LCBuMzIpIHVuaW9uIHsgICAgICAgICAgXApA
QCAtMjcyLDYgKzI3Myw4IEBAIERFRklORV9YRU5fR1VFU1RfSEFORExFKHZjcHVfZ3Vlc3RfY29y
ZV9yZWdzX3QpOwogCiAjdW5kZWYgX19ERUNMX1JFRwogCisjZW5kaWYKKwogdHlwZWRlZiB1aW50
NjRfdCB4ZW5fcGZuX3Q7CiAjZGVmaW5lIFBSSV94ZW5fcGZuIFBSSXg2NAogI2RlZmluZSBQUkl1
X3hlbl9wZm4gUFJJdTY0Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
