Return-Path: <SRS0=wySQ=WX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08984C3A5A3
	for <xen-devel@archiver.kernel.org>; Tue, 27 Aug 2019 14:49:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCD02206BF
	for <xen-devel@archiver.kernel.org>; Tue, 27 Aug 2019 14:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCD02206BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2cmQ-0002RM-Cv; Tue, 27 Aug 2019 14:49:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=72vU=WX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2cmP-0002Qc-CO
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 14:49:05 +0000
X-Inumbo-ID: cfffe558-c8d9-11e9-ae35-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cfffe558-c8d9-11e9-ae35-12813bfff9fa;
 Tue, 27 Aug 2019 14:49:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EFA29ACC1;
 Tue, 27 Aug 2019 14:49:02 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190819134213.1628-1-andrew.cooper3@citrix.com>
 <20190819134213.1628-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2bbc1144-bbb5-c0d7-481a-2ce61276a576@suse.com>
Date: Tue, 27 Aug 2019 16:49:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819134213.1628-2-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/boot: Further minor GDT corrections
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDguMjAxOSAxNTo0MiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBnZHRfYm9vdF9kZXNj
ciBhbmQgZ2R0XzQ4IGRpc2FncmVlIG9uIGhvdyBsb25nIHRyYW1wb2xpbmVfZ2R0IGlzLgo+IAo+
IEludHJvZHVjZSBhbiBlbmQgbGFiZWwgYW5kIGhhdmUgdGhlIGxpbmtlciBjYWxjdWxhdGUgdGhl
IHNpemUsIHJhdGhlciB0aGFuCj4gaGFyZCBjb2RpbmcgaXQuCj4gCj4gQWxzbywganVzdCBhcyB3
aXRoIGMvcyBhZjI5MmI0MWU5LCB0aGVyZSBpcyBubyBwb2ludCBmb3JjaW5nIHRoZSBDUFUgdG8g
c2V0Cj4gQWNjZXNzIGJpdHMuICBGaXggYWxsIHJlbWFpbmluZyBHRFRzIGluIFhlbi4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+
IC0tLQo+IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4gQ0M6IFdlaSBMaXUg
PHdsQHhlbi5vcmc+Cj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
Pgo+IAo+IFRoZSB0cmFtcG9saW5lIEdEVCBhY2Nlc3MgYml0cyB3ZXJlIGFjdHVhbGx5IG5vdGlj
ZWQgd2hlbiB0cnlpbmcgdG8gY2xlYW4gdXAKPiBvdXIgYm9vdCB0aW1lIHBhZ2V0YWJsZXMgYW5k
IG1hcCB0aGUgdHJhbXBvbGluZSByZWFkLW9ubHkuCj4gLS0tCj4gICB4ZW4vYXJjaC94ODYvYm9v
dC9oZWFkLlMgICAgICAgICAgfCAgMiArLQo+ICAgeGVuL2FyY2gveDg2L2Jvb3QvdHJhbXBvbGlu
ZS5TICAgIHwgMTUgKysrKysrKystLS0tLS0tCj4gICB4ZW4vYXJjaC94ODYveDg2XzY0L2tleGVj
X3JlbG9jLlMgfCAgNCArKy0tCj4gICAzIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyks
IDEwIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYm9vdC9oZWFk
LlMgYi94ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMKPiBpbmRleCAyNmI2ODA1MjFkLi45ZmRiOWIz
OTU0IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ib290L2hlYWQuUwo+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9ib290L2hlYWQuUwo+IEBAIC0xMjksNyArMTI5LDcgQEAgbXVsdGlib290Ml9oZWFk
ZXI6Cj4gICAKPiAgICAgICAgICAgLndvcmQgICAwCj4gICBnZHRfYm9vdF9kZXNjcjoKPiAtICAg
ICAgICAud29yZCAgIDcqOC0xCj4gKyAgICAgICAgLndvcmQgICAuTHRyYW1vcGxpbmVfZ2R0X2Vu
ZCAtIHRyYW1wb2xpbmVfZ2R0IC0gMQo+ICAgZ2R0X2Jvb3RfYmFzZToKPiAgICAgICAgICAgLmxv
bmcgICBzeW1fb2Zmcyh0cmFtcG9saW5lX2dkdCkKPiAgICAgICAgICAgLmxvbmcgICAwIC8qIE5l
ZWRlZCBmb3IgNjQtYml0IGxnZHQgKi8KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2Jvb3Qv
dHJhbXBvbGluZS5TIGIveGVuL2FyY2gveDg2L2Jvb3QvdHJhbXBvbGluZS5TCj4gaW5kZXggN2M2
YTIzMjhkMi4uMTc2MWZjMTIxMyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvYm9vdC90cmFt
cG9saW5lLlMKPiArKysgYi94ZW4vYXJjaC94ODYvYm9vdC90cmFtcG9saW5lLlMKPiBAQCAtNjMs
MjIgKzYzLDIzIEBAIHRyYW1wb2xpbmVfZ2R0Ogo+ICAgICAgICAgICAvKiAweDAwMDA6IHVudXNl
ZCAqLwo+ICAgICAgICAgICAucXVhZCAgIDB4MDAwMDAwMDAwMDAwMDAwMAo+ICAgICAgICAgICAv
KiAweDAwMDg6IHJpbmcgMCBjb2RlLCAzMi1iaXQgbW9kZSAqLwo+IC0gICAgICAgIC5xdWFkICAg
MHgwMGNmOWEwMDAwMDBmZmZmCj4gKyAgICAgICAgLnF1YWQgICAweDAwY2Y5YjAwMDAwMGZmZmYK
PiAgICAgICAgICAgLyogMHgwMDEwOiByaW5nIDAgY29kZSwgNjQtYml0IG1vZGUgKi8KPiAtICAg
ICAgICAucXVhZCAgIDB4MDBhZjlhMDAwMDAwZmZmZgo+ICsgICAgICAgIC5xdWFkICAgMHgwMGFm
OWIwMDAwMDBmZmZmCj4gICAgICAgICAgIC8qIDB4MDAxODogcmluZyAwIGRhdGEgKi8KPiAtICAg
ICAgICAucXVhZCAgIDB4MDBjZjkyMDAwMDAwZmZmZgo+ICsgICAgICAgIC5xdWFkICAgMHgwMGNm
OTMwMDAwMDBmZmZmCj4gICAgICAgICAgIC8qIDB4MDAyMDogcmVhbC1tb2RlIGNvZGUgQCBCT09U
X1RSQU1QT0xJTkUgKi8KPiAgICAgICAgICAgLmxvbmcgICAweDAwMDBmZmZmCj4gLSAgICAgICAg
LmxvbmcgICAweDAwMDA5YTAwCj4gKyAgICAgICAgLmxvbmcgICAweDAwMDA5YjAwCj4gICAgICAg
ICAgIC8qIDB4MDAyODogcmVhbC1tb2RlIGRhdGEgQCBCT09UX1RSQU1QT0xJTkUgKi8KPiAgICAg
ICAgICAgLmxvbmcgICAweDAwMDBmZmZmCj4gLSAgICAgICAgLmxvbmcgICAweDAwMDA5MjAwCj4g
KyAgICAgICAgLmxvbmcgICAweDAwMDA5MzAwCj4gICAgICAgICAgIC8qCj4gICAgICAgICAgICAq
IDB4MDAzMDogcmluZyAwIFhlbiBkYXRhLCAxNiBNaUIgc2l6ZSwgYmFzZQo+ICAgICAgICAgICAg
KiBhZGRyZXNzIGlzIGNvbXB1dGVkIGF0IHJ1bnRpbWUuCj4gICAgICAgICAgICAqLwo+IC0gICAg
ICAgIC5xdWFkICAgMHgwMGMwOTIwMDAwMDAwZmZmCj4gKyAgICAgICAgLnF1YWQgICAweDAwYzA5
MzAwMDAwMDBmZmYKPiArLkx0cmFtb3BsaW5lX2dkdF9lbmQ6CgpXaXRoIHRoZSB0eXBvIGhlcmUg
Zml4ZWQKClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpCdXQg
bWF5IEkgdGFsayB5b3UgaW50byAuLi4KCj4gLS0tIGEveGVuL2FyY2gveDg2L3g4Nl82NC9rZXhl
Y19yZWxvYy5TCj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl82NC9rZXhlY19yZWxvYy5TCj4gQEAg
LTE4Miw4ICsxODIsOCBAQCBjb21wYXRfbW9kZV9nZHRfZGVzYzoKPiAgICAgICAgICAgLmFsaWdu
IDgKPiAgIGNvbXBhdF9tb2RlX2dkdDoKPiAgICAgICAgICAgLnF1YWQgMHgwMDAwMDAwMDAwMDAw
MDAwICAgICAvKiBudWxsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KPiAtICAgICAg
ICAucXVhZCAweDAwY2Y5MjAwMDAwMGZmZmYgICAgIC8qIDB4MDAwOCByaW5nIDAgZGF0YSAgICAg
ICAgICAgICAgICAqLwo+IC0gICAgICAgIC5xdWFkIDB4MDBjZjlhMDAwMDAwZmZmZiAgICAgLyog
MHgwMDEwIHJpbmcgMCBjb2RlLCBjb21wYXRpYmlsaXR5ICovCj4gKyAgICAgICAgLnF1YWQgMHgw
MGNmOTMwMDAwMDBmZmZmICAgICAvKiAweDAwMDggcmluZyAwIGRhdGEgICAgICAgICAgICAgICAg
Ki8KPiArICAgICAgICAucXVhZCAweDAwY2Y5YjAwMDAwMGZmZmYgICAgIC8qIDB4MDAxMCByaW5n
IDAgY29kZSwgY29tcGF0aWJpbGl0eSAqLwoKLi4uIGludHJvZHVjaW5nIGEgc2ltaWxhciAiZW5k
IiBsYWJlbCBoZXJlIGFuZCB1c2luZyBpdCBhdApjb21wYXRfbW9kZV9nZHRfZGVzYyAodGhlIFIt
YiBhYm92ZSBzdGFuZHMgd2l0aCB0aGF0IGNoYW5nZSk/CgpKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
