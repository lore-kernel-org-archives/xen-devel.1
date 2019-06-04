Return-Path: <SRS0=m2Ej=UD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6706FC282CE
	for <xen-devel@archiver.kernel.org>; Tue,  4 Jun 2019 08:46:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42A0124B95
	for <xen-devel@archiver.kernel.org>; Tue,  4 Jun 2019 08:46:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42A0124B95
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY55G-00047o-03; Tue, 04 Jun 2019 08:46:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0KbE=UD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hY55E-00047j-So
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 08:46:16 +0000
X-Inumbo-ID: 367f6032-86a5-11e9-bb9b-7b4896736872
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 367f6032-86a5-11e9-bb9b-7b4896736872;
 Tue, 04 Jun 2019 08:46:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29406A78;
 Tue,  4 Jun 2019 01:46:15 -0700 (PDT)
Received: from [10.37.12.69] (unknown [10.37.12.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A75193F246;
 Tue,  4 Jun 2019 01:46:13 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190603161108.864-1-julien.grall@arm.com>
 <5CF61A9E0200007800234E81@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c254fcfc-ff24-6dd8-de3e-9b9bf59e7ff3@arm.com>
Date: Tue, 4 Jun 2019 09:46:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF61A9E0200007800234E81@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/public: arch-arm: Restrict the
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, WeiLiu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190604084611.JYxrQ2n5DUhVqIeKodvTg2yiR7Ap3ofCi2yr6u-ZguA@z>

SGkgSmFuLAoKT24gNi80LzE5IDg6MTUgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAz
LjA2LjE5IGF0IDE4OjExLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+PiAtLS0gYS94
ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaAo+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMv
YXJjaC1hcm0uaAo+PiBAQCAtMTk3LDYgKzE5Nyw3IEBACj4+ICAgICAgIH0gd2hpbGUgKCAwICkK
Pj4gICAjZGVmaW5lIHNldF94ZW5fZ3Vlc3RfaGFuZGxlKGhuZCwgdmFsKSBzZXRfeGVuX2d1ZXN0
X2hhbmRsZV9yYXcoaG5kLCB2YWwpCj4+ICAgCj4+ICsjaWYgZGVmaW5lZChfX1hFTl9fKSB8fCBk
ZWZpbmVkKF9fWEVOX1RPT0xTX18pCj4+ICAgI2lmIGRlZmluZWQoX19HTlVDX18pICYmICFkZWZp
bmVkKF9fU1RSSUNUX0FOU0lfXykKPj4gICAvKiBBbm9ueW1vdXMgdW5pb24gaW5jbHVkZXMgYm90
aCAzMi0gYW5kIDY0LWJpdCBuYW1lcyAoZS5nLiwgcjAveDApLiAqLwo+PiAgICMgZGVmaW5lIF9f
REVDTF9SRUcobjY0LCBuMzIpIHVuaW9uIHsgICAgICAgICAgXAo+PiBAQCAtMjcyLDYgKzI3Myw4
IEBAIERFRklORV9YRU5fR1VFU1RfSEFORExFKHZjcHVfZ3Vlc3RfY29yZV9yZWdzX3QpOwo+PiAg
IAo+PiAgICN1bmRlZiBfX0RFQ0xfUkVHCj4+ICAgCj4+ICsjZW5kaWYKPj4gKwo+PiAgIHR5cGVk
ZWYgdWludDY0X3QgeGVuX3Bmbl90Owo+PiAgICNkZWZpbmUgUFJJX3hlbl9wZm4gUFJJeDY0Cj4+
ICAgI2RlZmluZSBQUkl1X3hlbl9wZm4gUFJJdTY0Cj4gCj4gSSdtIHB1enpsZWQgYnkgeW91IHN0
aWxsIGFkZGluZyBhbm90aGVyICNpZiwgcmF0aGVyIHRoYW4gbW92aW5nIHRoZQo+IGJsb2NrIGRv
d24gaW50byB0aGUgZXhpc3Rpbmcgb25lLiBZb3Ugc2FpZCB5b3UnZCB3YWl0IGZvciBTdGVmYW5v
J3MKPiBvcGluaW9uLCBhbmQgaGUgYXNrZWQgdGhhdCB5b3UgZm9sbG93IG15IHN1Z2dlc3Rpb24u
IERpZCBJIG1pc3MKPiBzb21lIGZ1cnRoZXIgcGFydCBvZiB0aGUgZGlzY3Vzc2lvbj8KCk5vIEkg
aGF2ZSBzZW50IHRoZSB3cm9uZyB2ZXJzaW9uLiBOb3Qgc3VyZSBob3cgYmVjYXVzZSB0aGUgY2hh
bmdlcyBhcmUgCmNvcnJlY3QgaW4gdGhlIGJyYW5jaCBJIGFtIHVzaW5nLgoKU29ycnkgZm9yIHRo
ZSBpbmNvbnZlbmllbmNlLCBJIHdpbGwgcmVzZW5kIHRoZSBwYXRjaC4KCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
