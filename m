Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E1D3C282DF
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 17:25:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33F302173C
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 17:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33F302173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGoId-0001GD-Qh; Wed, 17 Apr 2019 17:24:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Uj5y=ST=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hGoIc-0001G8-3h
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 17:24:42 +0000
X-Inumbo-ID: aeb7d286-6135-11e9-b78c-2b37b5c17038
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id aeb7d286-6135-11e9-b78c-2b37b5c17038;
 Wed, 17 Apr 2019 17:24:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0673915AB;
 Wed, 17 Apr 2019 10:24:40 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B4403F59C;
 Wed, 17 Apr 2019 10:24:39 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190128155909.14289-1-julien.grall@arm.com>
 <alpine.DEB.2.10.1904161444520.1370@sstabellini-ThinkPad-X260>
 <1ba05c55-5449-98a9-713b-d932a1f21b4c@arm.com>
 <alpine.DEB.2.10.1904171006020.1370@sstabellini-ThinkPad-X260>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d36567cd-7c3e-3921-0355-77c55559d61b@arm.com>
Date: Wed, 17 Apr 2019 18:24:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1904171006020.1370@sstabellini-ThinkPad-X260>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-next] xen/arm: irq: Don't use
 _IRQ_PENDING when handling host interrupt
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
Cc: xen-devel@lists.xenproject.org, andre.przywara@arm.com,
 andrii.anisov@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417172437.fsr-4xGH4bP4oL4Hsf0KT3Jlbly6fWK-uIkgNf2c-rA@z>

SGksCgpPbiAxNy8wNC8yMDE5IDE4OjEyLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
VHVlLCAxNiBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSBTdGVmYW5vLAo+Pgo+
PiBPbiA0LzE2LzE5IDEwOjUxIFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+PiBPbiBN
b24sIDI4IEphbiAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gV2hpbGUgU1BJcyBhcmUg
c2hhcmVkIGJldHdlZW4gQ1BVLCBpdCBpcyBub3QgcG9zc2libGUgdG8gcmVjZWl2ZSB0aGUKPj4+
PiBzYW1lIGludGVycnVwdHMgb24gYSBkaWZmZXJlbnQgQ1BVIHdoaWxlIHRoZSBpbnRlcnJ1cHQg
aXMgaW4gYWN0aXZlCj4+Pj4gc3RhdGUuIFRoZSBkZWFjdGl2YXRpb24gb2YgdGhlIGludGVycnVw
dCBpcyBkb25lIGF0IHRoZSBlbmQgb2YgdGhlCj4+Pj4gaGFuZGxpbmcuCj4+Pj4KPj4+PiBUaGlz
IG1lYW5zIHRoZSBfSVJRX1BFTkRJTkcgbG9naWMgaXMgdW5lY2Vzc2FyeSBvbiBBcm0gYXMgYSBz
YW1lCj4+Pj4gaW50ZXJydXB0IGNhbiBuZXZlciBjb21lIHVwIHdoaWxlIGluIHRoZSBsb29wLiBT
byByZW1vdmUgaXQgdG8KPj4+PiBzaW1wbGlmeSB0aGUgaW50ZXJydXB0IGhhbmRsZSBjb2RlLgo+
Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNv
bT4KPj4+PiAtLS0KPj4+PiAgICB4ZW4vYXJjaC9hcm0vaXJxLmMgfCAzMiArKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspLCAyMiBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
aXJxLmMgYi94ZW4vYXJjaC9hcm0vaXJxLmMKPj4+PiBpbmRleCBjNTFjZjMzM2NlLi4zODc3NjU3
YTUyIDEwMDY0NAo+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9pcnEuYwo+Pj4+ICsrKyBiL3hlbi9h
cmNoL2FybS9pcnEuYwo+Pj4+IEBAIC0xOTksNiArMTk5LDcgQEAgaW50IHJlcXVlc3RfaXJxKHVu
c2lnbmVkIGludCBpcnEsIHVuc2lnbmVkIGludAo+Pj4+IGlycWZsYWdzLAo+Pj4+ICAgIHZvaWQg
ZG9fSVJRKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLCB1bnNpZ25lZCBpbnQgaXJxLCBpbnQg
aXNfZmlxKQo+Pj4+ICAgIHsKPj4+PiAgICAgICAgc3RydWN0IGlycV9kZXNjICpkZXNjID0gaXJx
X3RvX2Rlc2MoaXJxKTsKPj4+PiArICAgIHN0cnVjdCBpcnFhY3Rpb24gKmFjdGlvbjsKPj4+PiAg
ICAgICAgICBwZXJmY19pbmNyKGlycXMpOwo+Pj4+ICAgIEBAIC0yNDIsMzUgKzI0MywyMiBAQCB2
b2lkIGRvX0lSUShzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywgdW5zaWduZWQKPj4+PiBpbnQg
aXJxLCBpbnQgaXNfZmlxKQo+Pj4+ICAgICAgICAgICAgZ290byBvdXRfbm9fZW5kOwo+Pj4+ICAg
ICAgICB9Cj4+Pj4gICAgLSAgICBzZXRfYml0KF9JUlFfUEVORElORywgJmRlc2MtPnN0YXR1cyk7
Cj4+Pj4gLQo+Pj4+IC0gICAgLyoKPj4+PiAtICAgICAqIFNpbmNlIHdlIHNldCBQRU5ESU5HLCBp
ZiBhbm90aGVyIHByb2Nlc3NvciBpcyBoYW5kbGluZyBhIGRpZmZlcmVudAo+Pj4+IC0gICAgICog
aW5zdGFuY2Ugb2YgdGhpcyBzYW1lIGlycSwgdGhlIG90aGVyIHByb2Nlc3NvciB3aWxsIHRha2Ug
Y2FyZSBvZgo+Pj4+IGl0Lgo+Pj4+IC0gICAgICovCj4+Pj4gLSAgICBpZiAoIHRlc3RfYml0KF9J
UlFfRElTQUJMRUQsICZkZXNjLT5zdGF0dXMpIHx8Cj4+Pj4gLSAgICAgICAgIHRlc3RfYml0KF9J
UlFfSU5QUk9HUkVTUywgJmRlc2MtPnN0YXR1cykgKQo+Pj4+ICsgICAgaWYgKCB0ZXN0X2JpdChf
SVJRX0RJU0FCTEVELCAmZGVzYy0+c3RhdHVzKSApCj4+Pj4gICAgICAgICAgICBnb3RvIG91dDsK
Pj4+Cj4+PiBJdCBpcyBhIGdvb2QgaWRlYSB0byByZW1vdmUgdGhlIElSUV9QRU5ESU5HIGxvZ2lj
LCB0aGF0IGlzIE9LLgo+Pj4KPj4+Cj4+PiBIb3dldmVyLCBhcmUgd2Ugc3VyZSB0aGF0IHdlIHdh
bnQgdG8gcmVtb3ZlIHRoZSBfSVJRX0lOUFJPR1JFU1MgY2hlY2sKPj4+IHRvbz8gSVJRIGhhbmRs
ZXJzIHNob3VsZG4ndCBiZSBjYWxsZWQgdHdpY2UgaW4gYSByb3cuIEdpdmVuIHRoYXQKPj4+IF9J
UlFfSU5QUk9HUkVTUyBjYW4gYmUgc2V0IG1hbnVhbGx5IChnaWN2Ml9zZXRfYWN0aXZlX3N0YXRl
KSBpdCBzZWVtcyBpdAo+Pj4gd291bGQgYmUgYSBnb29kIGlkZWEgdG8ga2VlcCB0aGUgY2hlY2sg
YW55d2F5Pwo+Pgo+PiBzZXRfYWN0aXZlX3N0YXRlIGlzIG9ubHkgdXNlZCBieSB0aGUgdkdJQyB0
byByZXBsaWNhdGUgc3RhdGUgZnJvbSBvZiB0aGUKPj4gdmlydHVhbCBpbnRlcnJ1cHQgdG8gdGhl
IHBoeXNpY2FsIGludGVycnVwdC4gV2UgZG9uJ3QgaGF2ZSB0aGUgdmlydHVhbAo+PiBpbnRlcnJ1
cHQgaW4gdGhpcyBwYXRoIChzZWUgYWJvdmUpLgo+Pgo+PiBBbnkgb3RoZXIgdXNlciAoZS5nIGlu
dGVycnVwdHMgcm91dGVkIHRvIFhlbikgd291bGQgYmUgcHJldHR5IGJyb2tlbi4gQXQgYmVzdAo+
PiB5b3Ugd291bGQgYnJlYWsgdGhlIGludGVycnVwdCBmbG93LiBBdCB3b3JzdCwgeW91IG1heSBu
ZXZlciByZWNlaXZlIHRoZQo+PiBpbnRlcnJ1cHQgYWdhaW4uCj4+Cj4+IFNvIEkgdGhpbmsgd2Ug
Y2FuIGRyb3AgX0lSUV9QUk9HUkVTUyBoZXJlLgo+IAo+IEkgZ2F2ZSBpdCBhIGNsb3NlIGxvb2su
IFlvdSBhcmUgcmlnaHQsIGl0IGlzIHNhZmUgdG8gcmVtb3ZlIHRoZQo+IF9JUlFfUFJPR1JFU1Mg
Y2hlY2sgaGVyZS4KPiAKPiBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPgo+IAo+IAo+IFRoZSB0aGluZyB0aGF0IHdvcnJpZXMgbWUgYSBiaXQg
aXMgdGhhdCB0ZWNobmljYWxseSBzZXRfYWN0aXZlX3N0YXRlIGlzCj4gcGFydCBvZiB0aGUgZ2lj
X2h3X29wZXJhdGlvbnMgZnVuY3Rpb25zIHdoaWNoIGFyZSBub3QgbmVjZXNzYXJpbHkgZ3Vlc3QK
PiBzcGVjaWZpYzogd2UgaGF2ZW4ndCB3cml0dGVuIGRvd24gYW55d2hlcmUgdGhhdCBzZXRfYWN0
aXZlX3N0YXRlIGNhbm5vdAo+IGJlIGNhbGxlZCBwYXNzaW5nIG9uZSBvZiB0aGUgeGVuIGlycXMg
YXMgcGFyYW1ldGVyLiBJIGFncmVlIGl0IHdvdWxkIGJlCj4gYnJva2VuIHRvIGRvIHNvLCBidXQg
c3RpbGwuLi4gTWF5YmUgd2Ugc2hvdWxkIGFkZCBhIGNvbW1lbnQ/CgpIb3cgYWJvdXQgYWRkaW5n
IGFuIEFTU0VSVCh0ZXN0X2JpdChfSVJRX0dVRVNULCAmZGVzYy0+c3RhdHVzKSkgPwoKQ2hlZXJz
LAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
