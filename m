Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76EF9C43219
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 18:15:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 522AE208CA
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 18:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 522AE208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK5NV-000062-4f; Fri, 26 Apr 2019 18:15:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qLje=S4=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hK5NT-00005x-A9
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 18:15:15 +0000
X-Inumbo-ID: 3c077cd2-684f-11e9-843c-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3c077cd2-684f-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 18:15:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D314A2FE55A;
 Fri, 26 Apr 2019 18:15:11 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-121-104.rdu2.redhat.com
 [10.10.121.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A54955DE82;
 Fri, 26 Apr 2019 18:15:08 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>, devel@edk2.groups.io
References: <1556223838-5176-1-git-send-email-igor.druzhinin@citrix.com>
 <1556223838-5176-4-git-send-email-igor.druzhinin@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <b999513b-b843-e440-d1f2-c49589506a65@redhat.com>
Date: Fri, 26 Apr 2019 20:15:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1556223838-5176-4-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Fri, 26 Apr 2019 18:15:12 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH v3 3/3] OvmfPkg/XenSupport: turn off address
 decoding before BAR sizing
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
Cc: anthony.perard@citrix.com, jordan.l.justen@intel.com, julien.grall@arm.com,
 xen-devel@lists.xenproject.org, ard.biesheuvel@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426181507._ZgjFqkBFg-5eNI0FBcH6mklO2MLK4fS0NrdIZ7y-8A@z>

T24gMDQvMjUvMTkgMjI6MjMsIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+IE9uIFhlbiwgaHZtbG9h
ZGVyIGZpcm13YXJlIGxlYXZlcyBhZGRyZXNzIGRlY29kaW5nIGVuYWJsZWQgZm9yCj4gZW51bWVy
YXRlZCBQQ0kgZGV2aWNlIGJlZm9yZSBqdW1waW5nIGludG8gT1ZNRi4gT1ZNRiBzZWVtcyB0bwo+
IGV4cGVjdCBpdCB0byBiZSBkaXNhYmxlZCBhbmQgdHJpZXMgdG8gc2l6ZSBQQ0kgQkFScyBpbiBz
ZXZlcmFsIHBsYWNlcwo+IHdpdGhvdXQgZGlzYWJsaW5nIGl0IHdoaWNoIGNhdXNlcyBCQVI2NCwg
Zm9yIGV4YW1wbGUsIGJlaW5nCj4gaW5jb3JyZWN0bHkgcGxhY2VkIGJ5IFFFTVUuCj4gCj4gRml4
IGl0IGJ5IGRpc2FibGluZyBQQ0kgYWRkcmVzcyBkZWNvZGluZyBleHBsaWNpdGx5IGJlZm9yZSB0
aGUKPiBmaXJzdCBhdHRlbXB0IHRvIHNpemUgQkFScyBvbiBYZW4uCj4gCj4gU2lnbmVkLW9mZi1i
eTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4gLS0tCj4gQ2hh
bmdlcyBpbiB2MzoKPiAtIGRyb3BwZWQgdW51c2VkIGFyZ3VtZW50cyBhbmQgcmVuYW1lIFBjYXRQ
Y2lSb290QnJpZGdlRGVjb2RpbmcgZnVuY3Rpb24KPiAtIG1ha2UgbWFzayBhcHBsaWNhdGlvbiBt
b3JlIGNsZWFyIGFzIHN1Z2dlc3RlZAo+IC0tLQo+ICBPdm1mUGtnL0xpYnJhcnkvUGNpSG9zdEJy
aWRnZUxpYi9YZW5TdXBwb3J0LmMgfCAyMSArKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxl
IGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9MaWJy
YXJ5L1BjaUhvc3RCcmlkZ2VMaWIvWGVuU3VwcG9ydC5jIGIvT3ZtZlBrZy9MaWJyYXJ5L1BjaUhv
c3RCcmlkZ2VMaWIvWGVuU3VwcG9ydC5jCj4gaW5kZXggNzZmY2E1My4uYjQxYmQ2YiAxMDA2NDQK
PiAtLS0gYS9Pdm1mUGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBwb3J0LmMKPiAr
KysgYi9Pdm1mUGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBwb3J0LmMKPiBAQCAt
NDksNiArNDksMjIgQEAgUGNhdFBjaVJvb3RCcmlkZ2VCYXJFeGlzdGVkICgKPiAgICBFbmFibGVJ
bnRlcnJ1cHRzICgpOwo+ICB9Cj4gIAo+ICsjZGVmaW5lIFBDSV9DT01NQU5EX0RFQ09ERSAoKFVJ
TlQxNikoRUZJX1BDSV9DT01NQU5EX0lPX1NQQUNFIHwgXAo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgRUZJX1BDSV9DT01NQU5EX01FTU9SWV9TUEFDRSkpCj4gK1NUQVRJ
Qwo+ICtWT0lECj4gK1BjYXRQY2lSb290QnJpZGdlRGVjb2RpbmdEaXNhYmxlICgKPiArICBJTiAg
VUlOVE4gICAgICAgICAgICAgICAgICAgICAgICAgIEFkZHJlc3MKPiArICApCj4gK3sKPiArICBV
SU5UMTYgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFZhbHVlOwo+ICsKPiArICBWYWx1ZSA9
IFBjaVJlYWQxNiAoQWRkcmVzcyk7Cj4gKyAgaWYgKFZhbHVlICYgUENJX0NPTU1BTkRfREVDT0RF
KSB7Cj4gKyAgICBQY2lXcml0ZTE2IChBZGRyZXNzLCBWYWx1ZSAmIH4oVUlOVDMyKVBDSV9DT01N
QU5EX0RFQ09ERSk7Cj4gKyAgfQo+ICt9Cj4gKwo+ICBTVEFUSUMKPiAgVk9JRAo+ICBQY2F0UGNp
Um9vdEJyaWRnZVBhcnNlQmFycyAoCj4gQEAgLTc1LDYgKzkxLDExIEBAIFBjYXRQY2lSb290QnJp
ZGdlUGFyc2VCYXJzICgKPiAgICBVSU5UNjQgICAgICAgICAgICAgICAgICAgICAgICAgICAgTGlt
aXQ7Cj4gICAgUENJX1JPT1RfQlJJREdFX0FQRVJUVVJFICAgICAgICAgICpNZW1BcGVydHVyZTsK
PiAgCj4gKyAgLy8gRGlzYWJsZSBhZGRyZXNzIGRlY29kaW5nIGZvciBldmVyeSBkZXZpY2UgYmVm
b3JlIE9WTUYgc3RhcnRzIHNpemluZyBpdAo+ICsgIFBjYXRQY2lSb290QnJpZGdlRGVjb2RpbmdE
aXNhYmxlICgKPiArICAgIFBDSV9MSUJfQUREUkVTUyAoQnVzLCBEZXZpY2UsIEZ1bmN0aW9uLCBQ
Q0lfQ09NTUFORF9PRkZTRVQpCj4gKyAgKTsKPiArCj4gICAgZm9yIChPZmZzZXQgPSBCYXJPZmZz
ZXRCYXNlOyBPZmZzZXQgPCBCYXJPZmZzZXRFbmQ7IE9mZnNldCArPSBzaXplb2YgKFVJTlQzMikp
IHsKPiAgICAgIFBjYXRQY2lSb290QnJpZGdlQmFyRXhpc3RlZCAoCj4gICAgICAgIFBDSV9MSUJf
QUREUkVTUyAoQnVzLCBEZXZpY2UsIEZ1bmN0aW9uLCBPZmZzZXQpLAo+IAoKQWNrZWQtYnk6IExh
c3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+CgpTb21lb25lIGZyb20gdGhlIFhlbiBjb21t
dW5pdHkgcGxlYXNlIEFDSyB0aGlzIHRvbywgYW5kIHRoZW4gd2UgY2FuIHB1c2gKdGhlIHNlcmll
cy4KClRoYW5rcywKTGFzemxvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
