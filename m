Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 752B4C10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 11:47:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CEA22087F
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 11:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CEA22087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDSkC-0004TN-SJ; Mon, 08 Apr 2019 11:47:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ng3J=SK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hDSkB-0004TI-Gd
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 11:47:19 +0000
X-Inumbo-ID: 0f8c09c2-59f4-11e9-b7d9-370c27d0763c
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0f8c09c2-59f4-11e9-b7d9-370c27d0763c;
 Mon, 08 Apr 2019 11:47:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6D0715BF;
 Mon,  8 Apr 2019 04:47:17 -0700 (PDT)
Received: from [10.37.12.9] (unknown [10.37.12.9])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FF2B3F718;
 Mon,  8 Apr 2019 04:47:14 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <5C7E77D1020000780021BB0B@prv1-mh.provo.novell.com>
 <5C7E798E020000780021BB43@prv1-mh.provo.novell.com>
 <942c2ec5-69dc-634b-0935-b8713506d32e@arm.com>
 <5CA3898C0200007800223F9D@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <eca8d08b-41da-5e88-3303-a0b14adfe0be@arm.com>
Date: Mon, 8 Apr 2019 12:47:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CA3898C0200007800223F9D@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/3] memory: restrict
 XENMEM_remove_from_physmap to translated guests
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408114712.v4fN_1KY_IjaS_KRbnFhXcT4QGbLeT1yrKq-5fr4Cuo@z>

SGkgSmFuLAoKT24gNC8yLzE5IDU6MTAgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAy
LjA0LjE5IGF0IDEyOjI2LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+PiBPbiAwNS8w
My8yMDE5IDEzOjI4LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IFRoZSBjb21taXQgcmUtaW50cm9k
dWNpbmcgaXQgKDE0ZWIzYjQxZDAgWyJ4ZW46IHJlaW5zdGF0ZSBwcmV2aW91c2x5Cj4+PiB1bnVz
ZWQgWEVOTUVNX3JlbW92ZV9mcm9tX3BoeXNtYXAgaHlwZXJjYWxsIl0pIGFzIHdlbGwgYXMgdGhl
IG9uZSBoYXZpbmcKPj4+IG9yaWdpbmFsbHkgaW50cm9kdWNlZCBpdCAoZDgxOGYzY2I3YyBbImh2
bTogVXNlIG1haW4gbWVtb3J5IGZvciB2aWRlbwo+Pj4gbWVtb3J5Il0pIGFuZCB0aGUgb25lIHRo
ZW4gcHVyZ2luZyBpdCBhZ2FpbiAoNzhjMzA5N2U0ZiBbIlJlbW92ZSB1bnVzZWQKPj4+IFhFTk1F
TV9yZW1vdmVfZnJvbV9waHlzbWFwIl0pIG1ha2UgY2xlYXIgdGhhdCB0aGlzIG9wZXJhdGlvbiBp
cyBpbnRlbmRlZAo+Pj4gZm9yIHVzZSBvbiBIVk0gKGkuZS4gdHJhbnNsYXRlZCkgZ3Vlc3RzIG9u
bHkuIFJlc3RyaWN0IGl0IGF0IGxlYXN0IGFzCj4+PiBtdWNoLCBiZWNhdXNlIGZvciBQViBndWVz
dHMgZG9jdW1lbnRhdGlvbiAoaW4gdGhlIHB1YmxpYyBoZWFkZXIpIGRvZXMKPj4+IG5vdCBldmVu
IG1hdGNoIHRoZSBpbXBsZW1lbnRhdGlvbjogSXQgdGFsa3MgYWJvdXQgR1BGTiBhcyBpbnB1dCwg
YnV0Cj4+PiBnZXRfcGFnZV9mcm9tX2dmbigpIGFzc3VtZXMgYSBHTUZOIGluIHRoZSBub24tdHJh
bnNsYXRlZCBjYXNlIChhbmQgaGFuZHMKPj4+IGJhY2sgdGhlIHZhbHVlIHBhc3NlZCBpbikuCj4+
Pgo+Pj4gQWxzbyBsaWZ0IHRoZSBjaGVjayBpbiBYRU5NRU1fYWRkX3RvX3BoeXNtYXB7LF9iYXRj
aH0gaGFuZGxpbmcgdXAKPj4+IGRpcmVjdGx5IGludG8gdG9wIGxldmVsIGh5cGVyY2FsbCBoYW5k
bGluZywgYW5kIGNsYXJpZnkgdGhpbmdzIGluIHRoZQo+Pj4gcHVibGljIGhlYWRlciBhY2NvcmRp
bmdseS4KPj4+Cj4+PiBUYWtlIHRoZSBsaWJlcnR5IGFuZCBhbHNvIHJlcGxhY2UgYSBwb2ludGxl
c3MgdXNlIG9mICJjdXJyZW50IiB3aXRoIGEKPj4+IG1vcmUgZWZmaWNpZW50IHVzZSBvZiBhbiBl
eGlzdGluZyBsb2NhbCB2YXJpYWJsZSAob3IgZnVuY3Rpb24gcGFyYW1ldGVyCj4+PiB0byBiZSBw
cmVjaXNlKS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Cj4+PiAtLS0KPj4+IFRCRDogSXQgY291bGQgYmUgZnVydGhlciByZXN0cmljdGVkLCBk
aXNhbGxvd2luZyBpdHMgdXNlIGJ5IGEgSFZNIGd1ZXN0Cj4+PiAgICAgICAgb24gaXRzZWxmLgo+
Pgo+PiBCeSBIVk0gZ3Vlc3QsIGRvIHlvdSByZWZlciB0byBhbnkgYXV0by10cmFuc2xhdGVkIGd1
ZXN0Pwo+IAo+IFllcyAtIHNvcnJ5IGZvciB1c2luZyBhbiB4ODYgdGVybS4KPiAKPj4gVGhlIGlu
dGVyZmFjZSBYRU5NRV9yZW1vdmVfZnJvbV9waHlzbWFwIGlzIHVzZWQgYnkgQXJtIHRvIHJlbW92
ZSBmb3JlaWduCj4+IG1hcHBpbmdzIGZyb20gaXRzIHAybS4gVGhlcmUgYXJlIHBvdGVudGlhbGx5
IG90aGVyIHNwYWNlIHdpdGggc2ltaWxhciBjYXNlCj4+IChlLmcgZ3JhbnQtdGFibGUuLi4pLgo+
IAo+IE9oLCBJIHNlZSAtIHRoaXMgb3B0aW9uIGdvZXMgYXdheSB0aGVuLgo+IAo+Pj4gVEJEOiBJ
cyB1c2luZyBQMk1fQUxMT0MgaGVyZSByZWFsbHkgYXBwcm9wcmlhdGU/IEl0IG1lYW5zIGUuZy4K
Pj4+ICAgICAgICBwb2ludGxlc3NseSBwb3B1bGF0aW5nIGEgUG9EIHNsb3QganVzdCB0byB1bnBv
cHVsYXRlIGl0IGFnYWluIHJpZ2h0Cj4+PiAgICAgICAgYXdheSwgd2l0aCB0aGUgcGFnZSB0aGVu
IGZyZWUgZmxvYXRpbmcsIGkuZS4gbm8gbG9uZ2VyIGF2YWlsYWJsZQo+Pj4gICAgICAgIGZvciB1
c2UgdG8gcmVwbGFjZSBhbm90aGVyIFBvRCBzbG90LCBhbmQgKGFmYWljdCkgbm8gbG9uZ2VyCj4+
PiAgICAgICAgYWNjZXNzaWJsZSBieSB0aGUgZ3Vlc3QgaW4gYW55IHdheS4KPj4+IFRCRDogSXMg
dXNpbmcgZ3Vlc3RfcGh5c21hcF9yZW1vdmVfcGFnZSgpIGhlcmUgcmVhbGx5IGFwcHJvcHJpYXRl
PyBJdAo+Pj4gICAgICAgIG1lYW5zIHRoYXQgZS5nLiBNTUlPIHBhZ2VzIHdvdWxkbid0IGJlIHJl
bW92ZWQuIEdvaW5nIHRocm91Z2gKPj4+ICAgICAgICBndWVzdF9yZW1vdmVfcGFnZSgpICh3aGls
ZSBza2lwcGluZyB0aGUgZGUtYWxsb2NhdGlvbiBzdGVwKSB3b3VsZAo+Pj4gICAgICAgIHNlZW0g
bW9yZSBhcHByb3ByaWF0ZSB0byBtZSwgd2hpY2ggd291bGQgYWRkcmVzcyB0aGUgUDJNX0FMTE9D
Cj4+PiAgICAgICAgYXNwZWN0IGFib3ZlIGFzIHdlbGwuCj4+Cj4+IEhvdyBpcyB0aGF0IGFuIGlz
c3VlPyBEb2VzIFhFTk1FTV9hZGRfdG9fcGh5c21hcCBhbGxvd3MgeW91IHRvIG1hcCBNTUlPCj4+
IHBhZ2VzPwo+IAo+IFdlbGwsIHRoZXJlJ3MgWEVOTUFQU1BBQ0VfZGV2X21taW8gd2hpY2ggeGF0
cCBoYW5kbGVzLiBCdXQKPiBwZXJoYXBzIHRoZSBNTUlPIGV4YW1wbGUgaXMgbW9yZSBjb25mdXNp
bmcgdGhhbiBoZWxwZnVsLiBUaGUKPiBxdWVzdGlvbiByZWFsbHkganVzdCBpcyB3aGV0aGVyIGd1
ZXN0X3JlbW92ZV9wYWdlKCkgc2hvdWxkbid0Cj4gYmUgdXNlZCBoZXJlIGluc3RlYWQgb2YgZ3Vl
c3RfcGh5c21hcF9yZW1vdmVfcGFnZSgpCmRlLWFsbG9jYXRpb24gc3RlcCBhc2lkZSwgSSBhbSBu
b3QgcmVhbGx5IGNvbnZpbmNlZCB5b3UgY2FuIHJldXNlIApndWVzdF9yZW1vdmVfcGFnZSgpIGhl
cmUuIE9uIHg4NiwgdGhlIGZ1bmN0aW9uIHdpbGwgbm90IHdvcmsgb24gY2VydGFpbiAKcDJtIHR5
cGVzLiBJcyBpdCB3aGF0IHdlIHJlYWxseSB3YW50PwoKPiAKPiBCdXQgb2YgY291cnNlIC0gZmly
c3Qgb2YgYWxsIEknZCBsaWtlIHRvIGdldCBhY2tzIChvciBmZWVkYmFjayB3aGF0IHRvCj4gY2hh
bmdlKSBvbiB0aGUgYWN0dWFsIHBhdGNoIGhlcmUuIFRoZSBmdXJ0aGVyIHBvaW50cyB3b3VsZCBh
bGwsIGlmCj4gYW55dGhpbmcsIHJlc3VsdCBpbiBpbmRlcGVuZGVudCBwYXRjaGVzLgoKTWFrZSBz
ZW5zZS4gSSB3aWxsIGhhdmUgYSBsb29rIGF0IHRoZSBwYXRjaC4KCkNoZWVycywKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
