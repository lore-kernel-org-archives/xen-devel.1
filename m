Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5538C10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 09:17:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D62920675
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 09:17:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D62920675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGKDU-0002Nl-E4; Tue, 16 Apr 2019 09:17:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jU7w=SS=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hGKDT-0002Nb-2U
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 09:17:23 +0000
X-Inumbo-ID: 710898b3-6028-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 710898b3-6028-11e9-92d7-bc764e045a96;
 Tue, 16 Apr 2019 09:17:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12E16EBD;
 Tue, 16 Apr 2019 02:16:52 -0700 (PDT)
Received: from [10.37.12.51] (unknown [10.37.12.51])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 999113F68F;
 Tue, 16 Apr 2019 02:16:50 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1554718489-11318-1-git-send-email-olekstysh@gmail.com>
 <1554718489-11318-6-git-send-email-olekstysh@gmail.com>
 <6bf762cb-90b5-4bfe-33eb-6ab3f70c7b34@arm.com>
 <f3fc931c-6f0a-f8e7-f5a6-c8c915ac4841@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e741944b-6655-8543-82ac-d1ae5fa19a29@arm.com>
Date: Tue, 16 Apr 2019 10:16:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f3fc931c-6f0a-f8e7-f5a6-c8c915ac4841@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 5/5] xen/arm: Add early printk support
 for SCIFA compatible UARTs
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190416091649.dc6lPuca2qk9r-fIpNYXYn8DLhEUbpql2kaQyNorRdg@z>

SGkgT2xla3NhbmRyLAoKT24gNC8xNS8xOSAxMjo0MyBQTSwgT2xla3NhbmRyIHdyb3RlOgo+IAo+
IE9uIDE0LjA0LjE5IDIwOjU2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IE9uIDQvOC8xOSAxMTox
NCBBTSwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4+PiBGcm9tOiBPbGVrc2FuZHIgVHlz
aGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+Cj4+Pgo+Pj4gVGhpcyBwYXRj
aCBtYWtlcyBwb3NzaWJsZSB0byB1c2UgZXhpc3RpbmcgZWFybHkgcHJpbmsgY29kZQo+Pj4gZm9y
IFJlbmVzYXMgIlN0b3V0IiBib2FyZCBiYXNlZCBvbiBSLUNhciBIMiBTb0MgKFNDSUZBKS4KPj4+
Cj4+PiBUaGUgIkVBUkxZX1BSSU5US19WRVJTSU9OIiBmb3IgdGhhdCBib2FyZCBzaG91bGQgYmUg
J0EnOgo+Pj4gQ09ORklHX0VBUkxZX1BSSU5USz1zY2lmLDB4ZTZjNDAwMDAsQQo+Pj4KPj4+IFNp
Z25lZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0Bl
cGFtLmNvbT4KPj4+IENDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+Pj4K
Pj4+IC0tLQo+Pj4gwqDCoMKgwqAgQ2hhbmdlcyBpbiB2MzoKPj4+IMKgwqDCoMKgwqDCoMKgwqAg
LSBJdCB3YXMgZGVjaWRlZCBub3QgdG8gaW50cm9kdWNlIG5ldyBkZWJ1Zy1zY2lmYS5pbmMKPj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZvciBoYW5kbGluZyBTQ0lGQSBpbnRlcmZhY2UsIGJ1dCB0
byBleHRlbmQgZXhpc3RpbmcKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRlYnVnLXNjaWYuaW5j
IGZvciBoYW5kbGluZyBib3RoIGludGVyZmFjZXMuCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBU
aGlzIHBhdGNoIGlzIGEgcmVzdWx0IG9mIHNwbGl0dGluZyBhbiBpbml0aWFsIHBhdGNoCj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAieGVuL2FybTogQWRkIFNDSUZBIFVBUlQgc3VwcG9ydCBmb3Ig
ZWFybHkgcHJpbnRrIgo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgYW5kIG9ubHkgYWRkcyBhIHN1
cHBvcnQuCj4+PiAtLS0KPj4+IMKgIHhlbi9hcmNoL2FybS9hcm0zMi9kZWJ1Zy1zY2lmLmluYyB8
IDkgKysrKysrLS0tCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtMzIvZGVidWct
c2NpZi5pbmMgCj4+PiBiL3hlbi9hcmNoL2FybS9hcm0zMi9kZWJ1Zy1zY2lmLmluYwo+Pj4gaW5k
ZXggYThkMmVhZS4uOTRhMThlYSAxMDA2NDQKPj4+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9k
ZWJ1Zy1zY2lmLmluYwo+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTMyL2RlYnVnLXNjaWYuaW5j
Cj4+PiBAQCAtMSw3ICsxLDcgQEAKPj4+IMKgIC8qCj4+PiDCoMKgICogeGVuL2FyY2gvYXJtL2Fy
bTMyL2RlYnVnLXNjaWYuaW5jCj4+PiDCoMKgICoKPj4+IC0gKiBTQ0lGIHNwZWNpZmljIGRlYnVn
IGNvZGUKPj4+ICsgKiBTQ0lGKEEpIHNwZWNpZmljIGRlYnVnIGNvZGUKPj4+IMKgwqAgKgo+Pj4g
wqDCoCAqIE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHIudHlzaGNoZW5rb0BnbG9iYWxs
b2dpYy5jb20+Cj4+PiDCoMKgICogQ29weXJpZ2h0IChDKSAyMDE0LCBHbG9iYWxsb2dpYy4KPj4+
IEBAIC0yMiwxMCArMjIsMTMgQEAKPj4+IMKgICNpZmRlZiBFQVJMWV9QUklOVEtfVkVSU0lPTl9O
T05FCj4+PiDCoCAjZGVmaW5lIFNUQVRVU19SRUfCoMKgwqAgU0NJRl9TQ0ZTUgo+Pj4gwqAgI2Rl
ZmluZSBUWF9GSUZPX1JFR8KgwqAgU0NJRl9TQ0ZURFIKPj4+ICsjZWxpZiBFQVJMWV9QUklOVEtf
VkVSU0lPTl9BCj4+PiArI2RlZmluZSBTVEFUVVNfUkVHwqDCoMKgIFNDSUZBX1NDQVNTUgo+Pj4g
KyNkZWZpbmUgVFhfRklGT19SRUfCoMKgIFNDSUZBX1NDQUZURFIKPj4+IMKgICNlbmRpZgo+Pj4g
wqAgwqAgLyoKPj4+IC0gKiBTQ0lGIFVBUlQgd2FpdCBVQVJUIHRvIGJlIHJlYWR5IHRvIHRyYW5z
bWl0Cj4+PiArICogU0NJRihBKSBVQVJUIHdhaXQgVUFSVCB0byBiZSByZWFkeSB0byB0cmFuc21p
dAo+Pgo+PiBXaGVuIFNDSUZCIHdpbGwgYmUgaW50cm9kdWNlZCwgd2Ugd2lsbCBoYXZlIHRvIG1v
ZGlmeSB0aGlzIGNvbW1lbnQgCj4+IGFnYWluLiBBcyB3ZSBhcmUgb25seSBkZWFsaW5nIHdpdGgg
YW55IHZlcnNpb24gb2YgU0NJQyBpbiB0aGlzIGZpbGUsIAo+PiBjb3VsZCB3ZSBqdXN0IHJld29y
ayB0aGUgY29tbWVudCB0byBhdm9pZCBtZW50aW9uaW5nIHRoZSBVQVJUIG5hbWU/Cj4gCj4gSSB0
aGluaywgeWVzLiBXaGF0IGFib3V0IHVzaW5nIFNDSUYoWCk/IFNoYWxsIEkgdXBkYXRlIAo+IHNj
aWYtdWFydC5jL3NjaWYtdWFydC5oIHdoaWNoIGhhcyBTQ0lGKEEpIHN0cmluZz8KCkluIGNvbW1l
bnRzLCBJIHdvdWxkIGp1c3QgZHJvcCBjb21wbGV0ZWx5ICJTQ0lGKEEpIi4KCkZvciBjb3B5cmln
aHQgaGVhZGVyLCB3ZSBjYW4gZWl0aGVyIGtlZXAgU0NJRihBKSBvciB1c2UgU0NJRihYKS4gV2hp
Y2ggCmV2ZXIgeW91IHByZWZlci4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
