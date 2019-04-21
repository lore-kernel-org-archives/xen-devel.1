Return-Path: <SRS0=WZDL=SX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70186C10F14
	for <xen-devel@archiver.kernel.org>; Sun, 21 Apr 2019 17:33:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BC4520821
	for <xen-devel@archiver.kernel.org>; Sun, 21 Apr 2019 17:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BC4520821
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIGKV-0004a4-Rn; Sun, 21 Apr 2019 17:32:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hCs2=SX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hIGKU-0004Zz-II
 for xen-devel@lists.xenproject.org; Sun, 21 Apr 2019 17:32:38 +0000
X-Inumbo-ID: 74f64842-645b-11e9-ab42-7f84dc75f78e
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 74f64842-645b-11e9-ab42-7f84dc75f78e;
 Sun, 21 Apr 2019 17:32:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1231A78;
 Sun, 21 Apr 2019 10:32:37 -0700 (PDT)
Received: from [10.37.12.14] (unknown [10.37.12.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BDF73F557;
 Sun, 21 Apr 2019 10:32:36 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260>
 <1551222427-21749-1-git-send-email-sstabellini@kernel.org>
 <d3020727-f29c-5485-75a4-d96b3a9b0a92@arm.com>
 <alpine.DEB.2.10.1904191632380.1370@sstabellini-ThinkPad-X260>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c748bb73-03d8-bb00-6b72-3f5b04d89c48@arm.com>
Date: Sun, 21 Apr 2019 18:32:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1904191632380.1370@sstabellini-ThinkPad-X260>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/6] xen: extend XEN_DOMCTL_memory_mapping
 to handle cacheability
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "JBeulich@suse.com" <JBeulich@suse.com>,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190421173234.RpIq7yIukAKX_BTETb8mKz7Og2BnTRrUTu97Hy493eM@z>

SGkgU3RlZmFubywKCk9uIDQvMjAvMTkgMTowMiBBTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IE9uIFR1ZSwgMjYgRmViIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGksCj4+Cj4+
IE9uIDI2LzAyLzIwMTkgMjM6MDcsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+IFJldXNl
IHRoZSBleGlzdGluZyBwYWRkaW5nIGZpZWxkIHRvIHBhc3MgY2FjaGVhYmlsaXR5IGluZm9ybWF0
aW9uIGFib3V0Cj4+PiB0aGUgbWVtb3J5IG1hcHBpbmcsIHNwZWNpZmljYWxseSwgd2hldGhlciB0
aGUgbWVtb3J5IHNob3VsZCBiZSBtYXBwZWQgYXMKPj4+IG5vcm1hbCBtZW1vcnkgb3IgYXMgZGV2
aWNlIG1lbW9yeSAodGhpcyBpcyB3aGF0IHdlIGhhdmUgdG9kYXkpLgo+Pj4KPj4+IEFkZCBhIGNh
Y2hlYWJpbGl0eSBwYXJhbWV0ZXIgdG8gbWFwX21taW9fcmVnaW9ucy4gMCBtZWFucyBkZXZpY2UK
Pj4+IG1lbW9yeSwgd2hpY2ggaXMgd2hhdCB3ZSBoYXZlIHRvZGF5Lgo+Pj4KPj4+IE9uIEFSTSwg
bWFwIGRldmljZSBtZW1vcnkgYXMgcDJtX21taW9fZGlyZWN0X2RldiAoYXMgaXQgaXMgYWxyZWFk
eSBkb25lCj4+PiB0b2RheSkgYW5kIG5vcm1hbCBtZW1vcnkgYXMgcDJtX3JhbV9ydy4KPj4+Cj4+
PiBPbiB4ODYsIHJldHVybiBlcnJvciBpZiB0aGUgY2FjaGVhYmlsaXR5IHJlcXVlc3RlZCBpcyBu
b3QgZGV2aWNlIG1lbW9yeS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxp
bmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Cj4+PiBDQzogSkJldWxpY2hAc3VzZS5jb20KPj4+IEND
OiBhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tCj4+PiAtLS0KPj4+ICAgIHhlbi9hcmNoL2FybS9n
aWMtdjIuYyAgICAgICAgICAgIHwgIDMgKystCj4+PiAgICB4ZW4vYXJjaC9hcm0vcDJtLmMgICAg
ICAgICAgICAgICB8IDE5ICsrKysrKysrKysrKysrKysrLS0KPj4+ICAgIHhlbi9hcmNoL2FybS9w
bGF0Zm9ybXMvZXh5bm9zNS5jIHwgIDQgKystLQo+Pj4gICAgeGVuL2FyY2gvYXJtL3BsYXRmb3Jt
cy9vbWFwNS5jICAgfCAgOCArKysrLS0tLQo+Pj4gICAgeGVuL2FyY2gvYXJtL3ZnaWMtdjIuYyAg
ICAgICAgICAgfCAgMiArLQo+Pj4gICAgeGVuL2FyY2gvYXJtL3ZnaWMvdmdpYy12Mi5jICAgICAg
fCAgMiArLQo+Pj4gICAgeGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMgICAgfCAgNyArKysr
Ky0tCj4+PiAgICB4ZW4vYXJjaC94ODYvbW0vcDJtLmMgICAgICAgICAgICB8ICA2ICsrKysrLQo+
Pj4gICAgeGVuL2NvbW1vbi9kb21jdGwuYyAgICAgICAgICAgICAgfCAgOCArKysrKy0tLQo+Pj4g
ICAgeGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYyAgICAgICAgfCAgMyArKy0KPj4+ICAgIHhlbi9p
bmNsdWRlL3B1YmxpYy9kb21jdGwuaCAgICAgIHwgIDQgKysrLQo+Pj4gICAgeGVuL2luY2x1ZGUv
eGVuL3AybS1jb21tb24uaCAgICAgfCAgMyArKy0KPj4+ICAgIDEyIGZpbGVzIGNoYW5nZWQsIDQ5
IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC9hcm0vZ2ljLXYyLmMgYi94ZW4vYXJjaC9hcm0vZ2ljLXYyLmMKPj4+IGluZGV4IGU3ZWIw
MWYuLjFlYTNkYTIgMTAwNjQ0Cj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZ2ljLXYyLmMKPj4+ICsr
KyBiL3hlbi9hcmNoL2FybS9naWMtdjIuYwo+Pj4gQEAgLTY5MCw3ICs2OTAsOCBAQCBzdGF0aWMg
aW50IGdpY3YyX21hcF9od2Rvd25fZXh0cmFfbWFwcGluZ3Moc3RydWN0IGRvbWFpbiAqZCkKPj4+
ICAgIAo+Pj4gICAgICAgICAgICByZXQgPSBtYXBfbW1pb19yZWdpb25zKGQsIGdhZGRyX3RvX2dm
bih2Mm1fZGF0YS0+YWRkciksCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
UEZOX1VQKHYybV9kYXRhLT5zaXplKSwKPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbWFkZHJfdG9fbWZuKHYybV9kYXRhLT5hZGRyKSk7Cj4+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG1hZGRyX3RvX21mbih2Mm1fZGF0YS0+YWRkciksCj4+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIENBQ0hFQUJJTElUWV9ERVZNRU0pOwo+Pj4gICAgICAgICAg
ICBpZiAoIHJldCApCj4+PiAgICAgICAgICAgIHsKPj4+ICAgICAgICAgICAgICAgIHByaW50ayhY
RU5MT0dfRVJSICJHSUN2MjogTWFwIHYybSBmcmFtZSB0byBkJWQgZmFpbGVkLlxuIiwKPj4+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcDJtLmMgYi94ZW4vYXJjaC9hcm0vcDJtLmMKPj4+IGlu
ZGV4IDMwY2ZiMDEuLjViOGZjYzUgMTAwNjQ0Cj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vcDJtLmMK
Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9wMm0uYwo+Pj4gQEAgLTEwNjgsOSArMTA2OCwyNCBAQCBp
bnQgdW5tYXBfcmVnaW9uc19wMm10KHN0cnVjdCBkb21haW4gKmQsCj4+PiAgICBpbnQgbWFwX21t
aW9fcmVnaW9ucyhzdHJ1Y3QgZG9tYWluICpkLAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAg
Z2ZuX3Qgc3RhcnRfZ2ZuLAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9u
ZyBuciwKPj4+IC0gICAgICAgICAgICAgICAgICAgICBtZm5fdCBtZm4pCj4+PiArICAgICAgICAg
ICAgICAgICAgICAgbWZuX3QgbWZuLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90
IGNhY2hlX3BvbGljeSkKPj4+ICAgIHsKPj4+IC0gICAgcmV0dXJuIHAybV9pbnNlcnRfbWFwcGlu
ZyhkLCBzdGFydF9nZm4sIG5yLCBtZm4sIHAybV9tbWlvX2RpcmVjdF9kZXYpOwo+Pj4gKyAgICBw
Mm1fdHlwZV90IHQ7Cj4+PiArCj4+PiArICAgIHN3aXRjaCAoIGNhY2hlX3BvbGljeSApCj4+PiAr
ICAgIHsKPj4+ICsgICAgY2FzZSBDQUNIRUFCSUxJVFlfTUVNT1JZOgo+Pj4gKyAgICAgICAgdCA9
IHAybV9yYW1fcnc7Cj4+Cj4+IFBvdGVudGlhbGx5LCB5b3Ugd2FudCB0byBjbGVhbiB0aGUgY2Fj
aGUgaGVyZS4KPiAKPiBXZSBoYXZlIGJlZW4gdGFsa2luZyBhYm91dCB0aGlzIGFuZCBJIGhhdmUg
YmVlbiBsb29raW5nIHRocm91Z2ggdGhlCj4gY29kZS4gSSBhbSBzdGlsbCBub3QgZXhhY3RseSBz
dXJlIGhvdyB0byBwcm9jZWVkLgo+IAo+IElzIHRoZXJlIGEgcmVhc29uIHdoeSBjYWNoZWFibGUg
cmVzZXJ2ZWRfbWVtb3J5IHBhZ2VzIHNob3VsZCBiZSB0cmVhdGVkCj4gZGlmZmVyZW50bHkgZnJv
bSBub3JtYWwgbWVtb3J5LCBpbiByZWdhcmRzIHRvIGNsZWFuaW5nIHRoZSBjYWNoZT8gSXQKPiBz
ZWVtcyB0byBtZSB0aGF0IHRoZXkgc2hvdWxkIGJlIHRoZSBzYW1lIGluIHRlcm1zIG9mIGNhY2hl
IGlzc3Vlcz8KCllvdXIgd29yZGluZyBpcyBhIGJpdCBjb25mdXNpbmcuIEkgZ3Vlc3Mgd2hhdCB5
b3UgY2FsbCAibm9ybWFsIG1lbW9yeSIgCmlzIGd1ZXN0IG1lbW9yeSwgYW0gSSByaWdodD8KCkFu
eSBtZW1vcnkgYXNzaWduZWQgdG8gdGhlIGd1ZXN0IGlzIGFuZCBjbGVhbiAmIGludmFsaWRhdGUg
KHRlY2huaWNhbGx5IApjbGVhbiBpcyBlbm91Z2gpIGJlZm9yZSBnZXR0aW5nIGFzc2lnbmVkIHRv
IHRoZSBndWVzdCAoc2VlIApmbHVzaF9wYWdlX3RvX3JhbSkuIFNvIHRoaXMgcGF0Y2ggaXMgaW50
cm9kdWNpbmcgYSBkaWZmZXJlbnQgYmVoYXZpb3IgCnRoYXQgd2hhdCB3ZSBjdXJyZW50bHkgaGF2
ZSBmb3Igb3RoZXIgbm9ybWFsIG1lbW9yeS4KCkJ1dCBteSBjb25jZXJuIGlzIHlvdSBtYXkgaW5j
b25zaXN0ZW50bHkgdXNlIHRoZSBtZW1vcnkgYXR0cmlidXRlcyAKYnJlYWtpbmcgY29oZXJlbmN5
LiBGb3IgaW5zdGFuY2UsIHlvdSBtYXAgaW4gR3Vlc3QgQSB3aXRoIGNhY2hlYWJsZSAKYXR0cmli
dXRlcyB0aGVuIGFmdGVyIHRoZSBndWVzdCBkaWVkLCB5b3UgcmVtYXAgdG8gZ3Vlc3QgQiB3aXRo
IGEgCm5vbi1jYWNoZWFibGUgYXR0cmlidXRlcy4gZ3Vlc3QgQiBtYXkgaGF2ZSBhbiBpbmNvbnNp
c3RlbnQgdmlldyBvZiB0aGUgCm1lbW9yeSBtYXBwZWQuCgpUaGlzIGlzIG9uZSBjYXNlIHdoZXJl
IGNsZWFuaW5nIHRoZSBjYWNoZSB3b3VsZCBiZSBuZWNlc3NhcnkuIE9uZSBjb3VsZCAKY29uc2lk
ZXIgdGhpcyBpcyBwYXJ0IG9mIHRoZSAiZGV2aWNlIHJlc2V0IiAodGhpcyBpcyBhIGJpdCBvZiB0
aGUgbmFtZSAKYWJ1c2UpLCBzbyBYZW4gc2hvdWxkIG5vdCB0YWtlIGNhcmUgb2YgaXQuCgpUaGUg
bW9zdCBpbXBvcnRhbnQgYml0IGlzIHRvIGhhdmUgZG9jdW1lbnRhdGlvbiB0aGF0IHJlZmxlY3Qg
dGhlIGlzc3VlcyAKd2l0aCBzdWNoIHBhcmFtZXRlcnMuIFNvIHRoZSB1c2VyIGlzIGF3YXJlIG9m
IHdoYXQgY291bGQgZ28gd3Jvbmcgd2hlbiAKdXNpbmcgImlvbWVtIi4KCj4gCj4gSXMgdGhlcmUg
YSBwbGFjZSB3aGVyZSB3ZSBjbGVhbiB0aGUgZGNhY2hlIGZvciBub3JtYWwgcGFnZXMsIG9uZSB0
aGF0IGlzCj4gbm90IHRpZWQgdG8gcDJtLT5jbGVhbl9wdGUsIHdoaWNoIGlzIGRpZmZlcmVudCAo
aXQgaXMgdGhlcmUgZm9yIGlvbW11Cj4gcmVhc29ucyk/CgpwMm0tPmNsZWFuX3B0ZSBpcyBvbmx5
IGhlcmUgdG8gZGVhbCB3aXRoIG5vbi1jb2hlcmVuY2UgSU9NTVUgcGFnZS10YWJsZSAKd2Fsa2Vy
LiBTZWUgYWJvdmUgZm9yIGZsdXNoaW5nIG5vcm1hbCBwYWdlcy4KCkNoZWVycywKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
