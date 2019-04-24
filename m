Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CAD7C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 10:42:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 150F920811
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 10:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 150F920811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJFLu-0001no-5l; Wed, 24 Apr 2019 10:42:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8RIj=S2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJFLt-0001nj-2F
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 10:42:09 +0000
X-Inumbo-ID: 9b7df3db-667d-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 9b7df3db-667d-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 10:42:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BE8FA78;
 Wed, 24 Apr 2019 03:42:07 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 565873F5AF;
 Wed, 24 Apr 2019 03:42:06 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.10.1902261501020.20689@sstabellini-ThinkPad-X260>
 <1551222427-21749-1-git-send-email-sstabellini@kernel.org>
 <d3020727-f29c-5485-75a4-d96b3a9b0a92@arm.com>
 <alpine.DEB.2.10.1904191632380.1370@sstabellini-ThinkPad-X260>
 <c748bb73-03d8-bb00-6b72-3f5b04d89c48@arm.com>
 <alpine.DEB.2.10.1904221431580.1370@sstabellini-ThinkPad-X260>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <29efc3a4-7012-30e0-0688-4741eca49ed4@arm.com>
Date: Wed, 24 Apr 2019 11:42:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1904221431580.1370@sstabellini-ThinkPad-X260>
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
Message-ID: <20190424104204.GgZPbWJqJO8xTSzVAe8stRBMpXSsq6j_u-DCc316X4I@z>

SGksCgpPbiAyMi8wNC8yMDE5IDIyOjU5LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
U3VuLCAyMSBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+PiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL3AybS5jIGIveGVuL2FyY2gvYXJtL3AybS5jCj4+Pj4+IGluZGV4IDMwY2Zi
MDEuLjViOGZjYzUgMTAwNjQ0Cj4+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9wMm0uYwo+Pj4+PiAr
KysgYi94ZW4vYXJjaC9hcm0vcDJtLmMKPj4+Pj4gQEAgLTEwNjgsOSArMTA2OCwyNCBAQCBpbnQg
dW5tYXBfcmVnaW9uc19wMm10KHN0cnVjdCBkb21haW4gKmQsCj4+Pj4+ICAgICBpbnQgbWFwX21t
aW9fcmVnaW9ucyhzdHJ1Y3QgZG9tYWluICpkLAo+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgZ2ZuX3Qgc3RhcnRfZ2ZuLAo+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBuciwKPj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgIG1mbl90IG1mbikKPj4+Pj4g
KyAgICAgICAgICAgICAgICAgICAgIG1mbl90IG1mbiwKPj4+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgIHVpbnQzMl90IGNhY2hlX3BvbGljeSkKPj4+Pj4gICAgIHsKPj4+Pj4gLSAgICByZXR1cm4g
cDJtX2luc2VydF9tYXBwaW5nKGQsIHN0YXJ0X2dmbiwgbnIsIG1mbiwKPj4+Pj4gcDJtX21taW9f
ZGlyZWN0X2Rldik7Cj4+Pj4+ICsgICAgcDJtX3R5cGVfdCB0Owo+Pj4+PiArCj4+Pj4+ICsgICAg
c3dpdGNoICggY2FjaGVfcG9saWN5ICkKPj4+Pj4gKyAgICB7Cj4+Pj4+ICsgICAgY2FzZSBDQUNI
RUFCSUxJVFlfTUVNT1JZOgo+Pj4+PiArICAgICAgICB0ID0gcDJtX3JhbV9ydzsKPj4+Pgo+Pj4+
IFBvdGVudGlhbGx5LCB5b3Ugd2FudCB0byBjbGVhbiB0aGUgY2FjaGUgaGVyZS4KPj4+Cj4+PiBX
ZSBoYXZlIGJlZW4gdGFsa2luZyBhYm91dCB0aGlzIGFuZCBJIGhhdmUgYmVlbiBsb29raW5nIHRo
cm91Z2ggdGhlCj4+PiBjb2RlLiBJIGFtIHN0aWxsIG5vdCBleGFjdGx5IHN1cmUgaG93IHRvIHBy
b2NlZWQuCj4+Pgo+Pj4gSXMgdGhlcmUgYSByZWFzb24gd2h5IGNhY2hlYWJsZSByZXNlcnZlZF9t
ZW1vcnkgcGFnZXMgc2hvdWxkIGJlIHRyZWF0ZWQKPj4+IGRpZmZlcmVudGx5IGZyb20gbm9ybWFs
IG1lbW9yeSwgaW4gcmVnYXJkcyB0byBjbGVhbmluZyB0aGUgY2FjaGU/IEl0Cj4+PiBzZWVtcyB0
byBtZSB0aGF0IHRoZXkgc2hvdWxkIGJlIHRoZSBzYW1lIGluIHRlcm1zIG9mIGNhY2hlIGlzc3Vl
cz8KPj4KPj4gWW91ciB3b3JkaW5nIGlzIGEgYml0IGNvbmZ1c2luZy4gSSBndWVzcyB3aGF0IHlv
dSBjYWxsICJub3JtYWwgbWVtb3J5IiBpcwo+PiBndWVzdCBtZW1vcnksIGFtIEkgcmlnaHQ/Cj4g
Cj4gWWVzLCByaWdodC4gSSB3b25kZXIgaWYgd2UgbmVlZCB0byBjb21lIHVwIHdpdGggY2xlYXJl
ciB0ZXJtcy4gR2l2ZW4gdGhlCj4gbWFueSB0eXBlcyBvZiBtZW1vcnkgd2UgaGF2ZSB0byBkZWFs
IHdpdGgsIGl0IG1pZ2h0IGJlY29tZSBldmVuIG1vcmUKPiBjb25mdXNpbmcgZ29pbmcgZm9yd2Fy
ZC4gR3Vlc3Qgbm9ybWFsIG1lbW9yeSBtYXliZT8gT3IgZ3Vlc3QgUkFNPwoKVGhlIHRlcm0gIm5v
cm1hbCBtZW1vcnkiIGlzIHJlYWxseSBjb25mdXNpbmcgYmVjYXVzZSB0aGlzIGlzIGEgbWVtb3J5
IHR5cGUgb24gCkFybS4gcmVzZXJ2ZWQtcmVnaW9ucyBhcmUgYWxzbyBub3QgKk1NSU8qIGFzIHRo
ZXkgYXJlIHBhcnQgb2YgdGhlIFJBTSB0aGF0IHdhcyAKcmVzZXJ2ZWQgZm9yIHNwZWNpYWwgdXNh
Z2UuIFNvIHRoZSB0ZXJtICJndWVzdCBSQU0iIGlzIGFsc28gbm90IGFwcHJvcHJpYXRlLgoKSSB1
bmRlcnN0YW5kIHRoYXQgJ2lvbWVtJyBpcyBhIHF1aWNrIHdheSB0byBnZXQgcmVzZXJ2ZWQtbWVt
b3J5IHJlZ2lvbnMgbWFwcGVkIAppbiB0aGUgZ3Vlc3QuIEhvd2V2ZXIsIHRoaXMgZmVlbHMgbGlr
ZSBhbiBhYnVzZSBvZiB0aGUgaW50ZXJmYWNlIGJlY2F1c2UgCnJlc2VydmVkLW1lbW9yeSBhcmUg
dGVjaG5pY2FsbHkgbm90IGFuIE1NSU8uIFRoZXkgYWxzbyBjYW4gYmUgdXNlZCBieSB0aGUgT1Mg
Zm9yIApzdG9yaW5nIGRhdGEgd2hlbiBub3QgaW4gdXNlIChwcm92aWRpbmcgdGhlIERUIG5vZGUg
Y29udGFpbiB0aGUgcHJvcGVydHkKJ3JldXNhYmxlJykuCgpPdmVyYWxsLCB3ZSB3YW50IHRvIHJl
dGhpbmsgaG93ICdyZXNlcnZlZC1yZWdpb25zJyBhcmUgZ29pbmcgdG8gYmUgdHJlYXRlZC4gVGhl
IApzb2x1dGlvbiBzdWdnZXN0ZWQgaW4gdGhpcyBzZXJpZXMgaXMgbm90IGdvaW5nIHRvIGJlIHZp
YWJsZSB2ZXJ5IGxvbmcuCgo+IAo+IAo+PiBBbnkgbWVtb3J5IGFzc2lnbmVkIHRvIHRoZSBndWVz
dCBpcyBhbmQgY2xlYW4gJiBpbnZhbGlkYXRlICh0ZWNobmljYWxseSBjbGVhbgo+PiBpcyBlbm91
Z2gpIGJlZm9yZSBnZXR0aW5nIGFzc2lnbmVkIHRvIHRoZSBndWVzdCAoc2VlIGZsdXNoX3BhZ2Vf
dG9fcmFtKS4gU28KPj4gdGhpcyBwYXRjaCBpcyBpbnRyb2R1Y2luZyBhIGRpZmZlcmVudCBiZWhh
dmlvciB0aGF0IHdoYXQgd2UgY3VycmVudGx5IGhhdmUgZm9yCj4+IG90aGVyIG5vcm1hbCBtZW1v
cnkuCj4gCj4gVGhpcyBpcyB3aGF0IEkgd2FzIHRyeWluZyB0byB1bmRlcnN0YW5kLCB0aGFua3Mg
Zm9yIHRoZSBwb2ludGVyLiBJIGFtCj4gdW5zdXJlIHdoZXRoZXIgd2Ugd2FudCB0byBkbyB0aGlz
IGZvciByZXNlcnZlZC1tZW1vcnkgcmVnaW9ucyB0b286IG9uCj4gb25lIGhhbmQsIGl0IHdvdWxk
IG1ha2UgdGhpbmdzIG1vcmUgY29uc2lzdGVudCwgb24gdGhlIG90aGVyIGhhbmQgSSBhbQo+IG5v
dCBzdXJlIGl0IGlzIHRoZSByaWdodCBiZWhhdmlvciBmb3IgcmVzZXJ2ZWQtbWVtb3J5LiBMZXQn
cyB0aGluayBpdAo+IHRocm91Z2guCj4gCj4gVGhlIHVzZSBjYXNlIGlzIGNvbW11bmljYXRpb24g
d2l0aCBvdGhlciBoZXRlcm9nZW5lb3VzIENQVXMuIEluIHRoYXQKPiBjYXNlLCBpdCB3b3VsZCBt
YXR0ZXIgaWYgYSBkb21VIGNyYXNoZXMgd2l0aCB0aGUgcmluZyBtYXBwZWQgYW5kIGFuCj4gdW5m
bHVzaGVkIHdyaXRlIChwYXJ0aWFsPykgdG8gdGhlIHJpbmcuIFRoZSBkb21VIGdldHMgcmVzdGFy
dGVkIHdpdGggdGhlCj4gc2FtZSByaW5nIG1hcHBpbmcuIEluIHRoaXMgY2FzZSwgaXQgbG9va3Mg
bGlrZSB3ZSB3b3VsZCB3YW50IHRvIGNsZWFuCj4gdGhlIGNhY2hlLiBJdCB3b3VsZG4ndCBtYXR0
ZXIgaWYgaXQgaXMgZG9uZSBhdCBWTSBzaHV0ZG93biBvciBhdCBWTQo+IGNyZWF0aW9uIHRpbWUu
Cj4gCj4gU28gbWF5YmUgaXQgbWFrZXMgc2Vuc2UgdG8gZG8gc29tZXRoaW5nIGxpa2UgZmx1c2hf
cGFnZV90b19yYW0gZm9yCj4gcmVzZXJ2ZWQtbWVtb3J5IHBhZ2VzLiBJdCBzZWVtcyBzaW1wbGUg
dG8gZG8gaXQgYXQgVk0gY3JlYXRpb24gdGltZSwKPiBiZWNhdXNlIHdlIGNvdWxkIGludmFsaWRh
dGUgdGhlIGNhY2hlIHdoZW4gbWFwX21taW9fcmVnaW9ucyBpcyBjYWxsZWQsCj4gZWl0aGVyIHRo
ZXJlIG9yIGZyb20gdGhlIGRvbWN0bCBoYW5kbGVyLiBPbiB0aGUgb3RoZXIgaGFuZCwgSSBkb24n
dCBrbm93Cj4gd2hlcmUgdG8gZG8gaXQgYXQgZG9tYWluIGRlc3RydWN0aW9uIHRpbWUgYmVjYXVz
ZSBubyBkb21jdGwgaXMgY2FsbGVkIHRvCj4gdW5tYXAgdGhlIHJlc2VydmVkLW1lbW9yeSByZWdp
b24uIEFsc28sIGNsZWFuaW5nIHRoZSBjYWNoZSBhdCBkb21haW4KPiBkZXN0cnVjdGlvbiB0aW1l
IHdvdWxkIGludHJvZHVjZSBhIGRpZmZlcmVuY2UgY29tcGFyZWQgdG8gZ3Vlc3Qgbm9ybWFsCj4g
bWVtb3J5Lgo+IAo+IEkga25vdyBJIHNhaWQgdGhlIG9wcG9zaXRlIGluIG91ciBtZWV0aW5nLCBi
dXQgbWF5YmUgY2xlYW5pbmcgdGhlIGNhY2hlCj4gZm9yIHJlc2VydmVkLW1lbW9yeSByZWdpb25z
IGF0IGRvbWFpbiBjcmVhdGlvbiB0aW1lIGlzIHRoZSByaWdodCB3YXkKPiBmb3J3YXJkPwoKSSBk
b24ndCBoYXZlIGEgc3Ryb25nIG9waW5pb24gb24gaXQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdy
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
