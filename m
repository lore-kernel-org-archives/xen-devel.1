Return-Path: <SRS0=CJRG=4P=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18485C3F2C0
	for <xen-devel@archiver.kernel.org>; Thu, 27 Feb 2020 21:16:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E149F246A1
	for <xen-devel@archiver.kernel.org>; Thu, 27 Feb 2020 21:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E149F246A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dornerworks.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7QWG-0001qx-RF; Thu, 27 Feb 2020 21:16:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t9sm=4P=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1j7QWF-0001qs-ET
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 21:16:31 +0000
X-Inumbo-ID: 6ba4a7ac-59a6-11ea-97b0-12813bfff9fa
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6ba4a7ac-59a6-11ea-97b0-12813bfff9fa;
 Thu, 27 Feb 2020 21:16:30 +0000 (UTC)
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [XEN PATCH v3 00/23] xen: Build system improvements
Thread-Index: AQHV7Jjgo0PMKLP4f0iwGhlwbM0mNKgvZiEQ
Date: Thu, 27 Feb 2020 21:17:51 +0000
Message-ID: <b97e6b2f9c5b4b019a6b1d5d774d21dc@dornerworks.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
In-Reply-To: <20200226113355.2532224-1-anthony.perard@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.13.196]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [XEN PATCH v3 00/23] xen: Build system improvements
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkbmVzZGF5LCBGZWJydWFyeSAyNiwgMjAyMCA2OjM0IEFNLCBBbnRob255IFBFUkFSRCB3
cm90ZToNCj5QYXRjaCBzZXJpZXMgYXZhaWxhYmxlIGluIHRoaXMgZ2l0IGJyYW5jaDoNCj5odHRw
czovL3hlbmJpdHMueGVuLm9yZy9naXQtaHR0cC9wZW9wbGUvYXBlcmFyZC94ZW4tdW5zdGFibGUu
Z2l0IGJyLmJ1aWxkLXN5c3RlbS14ZW4tdjMNCj4NCj52MzoNCj4tIG5ldyBwYXRjaGVzIHRoYXQg
ZG8gc29tZSBjbGVhbnVwIG9yIGZpeCBpc3N1ZXMNCj4tIGhhdmUgcmV3b3JrIG1vc3QgcGF0Y2hl
cywgdG8gaGF2ZSBiZXR0ZXIgY29tbWl0IG1lc3NhZ2Ugb3IgY2hhbmdlIHRoZSBjb2RpbmcNCj4g
IHN0eWxlLCBvciBmaXggaXNzdWVzIHRoYXQgSSd2ZSBzZWVuLiBUaGVyZSB3ZXJlIHNvbWUgY2Fz
ZXMgd2hlcmUgQ0ZMQUdTIHdlcmUNCj4gIG1pc3NpbmcuDQo+ICBTZWUgcGF0Y2ggbm90ZXMgZm9y
IGRldGFpbHMNCj4tIGludHJvZHVjZSBpZl9jaGFuZ2VkKi4gVGhhdCBwbGVudHkgb2YgbmV3IHBh
dGNoZXMgb24gdG9wIG9mIHdoYXQgd2UgaGFkIGluIHYyLg0KPiAgKHRob3NlIGNoYW5nZXMgaWdu
b3JlIENPTkZJR19MVE89eSwgSSdsbCBzZWUgYWJvdXQgZml4aW5nIHRoYXQgbGF0ZXIpDQo+DQo+
KFRoZXJlIGlzIG1vcmUgdG8gY29tZSBpbiBvcmRlciB0byB1c2UgZml4ZGVwIGZyb20gTGludXgs
IGJ1dCB0aGF0J3Mgbm90IHJlYWR5KQ0KPg0KPnYyLjE6DQo+LSBzb21lIGZpeGVzDQo+DQo+djI6
DQo+UmF0aGVyIHRoYW4gdGFraW5nIEtidWlsZCBhbmQgbWFraW5nIGl0IHdvcmsgd2l0aCBYZW4s
IHRoZSB2MiB0YWtlcyB0aGUgb3Bwb3NpdGUNCj5hcHByb2FjaCBvZiBzbG93bHkgdHJhbnNmb3Jt
aW5nIG91ciBjdXJyZW50IGJ1aWxkIHN5c3RlbSBpbnRvIEtidWlsZC4gVGhhdCBoYXZlDQo+dGhl
IGFkdmFudGFnZSBvZiBrZWVwaW5nIGFsbCB0aGUgZmVhdHVyZSB3ZSBoYXZlIGFuZCBtYWtpbmcg
dGhlIHBhdGNoZXMgbXVjaA0KPmVhc2llciB0byByZXZpZXcuIEtjb25maWcgdXBkYXRlIGlzIGRv
bmUgaW4gYW4gb3RoZXIgcGF0Y2ggc2VyaWVzLg0KPg0KPkhpLA0KPg0KPkkgaGF2ZSB3b3JrIHRv
d2FyZCBidWlsZGluZyBYZW4gKHRoZSBoeXBlcnZpc29yKSB3aXRoIExpbnV4J3MgYnVpbGQgc3lz
dGVtLA0KPktidWlsZC4NCj4NCj5UaGUgbWFpbiByZWFzb24gZm9yIHRoYXQgaXMgdG8gYmUgYWJs
ZSB0byBoYXZlIG91dC1vZi10cmVlIGJ1aWxkLiBJdCdzIGFubm95aW5nDQo+d2hlbiBhIGJ1aWxk
IGZhaWwgYmVjYXVzZSBvZiB0aGUgcHZzaGltLiBPdGhlciBiZW5lZml0IGlzIGEgbXVjaCBmYXN0
ZXINCj5yZWJ1aWxkLCBhbmQgYG1ha2UgY2xlYW5gIGRvZXNuJ3QgdGFrZSBhZ2VzLCBhbmQgYmV0
dGVyIGRlcGVuZGVuY2llcyB0byBmaWd1cmUNCj5vdXQgd2hhdCBuZWVkcyB0byBiZSByZWJ1aWxk
Lg0KPg0KPlNvLCB3ZSBhcmUgbm90IHRoZXJlIHlldCwgYnV0IHRoZSBzZXJpZXMgYWxyZWFkeSBj
b250YWluIHF1aXRlIGEgZmV3DQo+aW1wcm92ZW1lbnQgYW5kIGNsZWFudXAuIE1vcmUgcGF0Y2hl
cyBhcmUgZ29pbmcgdG8gYmUgYWRkZWQgdG8gdGhlIHNlcmllcy4NCg0KVGhhbmtzIGZvciB5b3Vy
IGVmZm9ydHMgd2l0aCB0aGlzLiBXaXRoIHlvdXIgYnIuYnVpbGQtc3lzdGVtLXhlbi12Mw0KYnJh
bmNoLCBJJ20gaGF2aW5nIHRyb3VibGUgZG9pbmcgYW4gYWFyY2g2NCBidWlsZCB3aXRoIGVhcmx5
IHByaW50aw0KZW5hYmxlZC4gSSBzdXNwZWN0IHRoZSBmb2xsb3dpbmcgdW5tZXJnZWQgcGF0Y2gg
dGhhdCBKdWxpZW4gYXV0aG9yZWQNCmxhc3QgU2VwdGVtYmVyIG1heSBoYXZlIHNvbWUgaGVscGZ1
bCBpbmZvcm1hdGlvbjoNCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRt
bC94ZW4tZGV2ZWwvMjAxOS0wOS9tc2cwMTIwNy5odG1sDQoNCkkgdHJpZWQgdGhlIGZvbGxvd2lu
Zy4uLg0KDQplY2hvICJDT05GSUdfREVCVUc9eSIgPiB4ZW4vYXJjaC9hcm0vY29uZmlncy9hcm02
NF9kZWZjb25maWcNCm1ha2UgLUMgeGVuIFhFTl9UQVJHRVRfQVJDSD1hcm02NCBDUk9TU19DT01Q
SUxFPWFhcmNoNjQtbGludXgtZ251LSBDT05GSUdfRUFSTFlfUFJJTlRLPXp5bnFtcCBkZWZjb25m
aWcNCm1ha2UgWEVOX1RBUkdFVF9BUkNIPWFybTY0IENST1NTX0NPTVBJTEU9YWFyY2g2NC1saW51
eC1nbnUtIENPTkZJR19FQVJMWV9QUklOVEs9enlucW1wIGRpc3QteGVuDQoNCi4uLiBidXQgSSB3
YXMgbWV0IHdpdGg6DQpwcmVsaW5rLm86KC5kYXRhKzB4NTc4KTogdW5kZWZpbmVkIHJlZmVyZW5j
ZSB0byBgZWFybHlfcHV0cycNCmFhcmNoNjQtbGludXgtZ251LWxkOiAvaG9tZS9zdGV3L3JwaS94
ZW4veGVuLy54ZW4tc3ltcy4wOiBoaWRkZW4gc3ltYm9sIGBlYXJseV9wdXRzJyBpc24ndCBkZWZp
bmVkDQoNClN0ZXcNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
