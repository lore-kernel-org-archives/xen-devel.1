Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086EDC4360F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 10:22:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5A0221850
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 10:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5A0221850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCLz0-0003dH-AM; Fri, 05 Apr 2019 10:22:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NmJK=SH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hCLyy-0003dC-HH
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 10:22:00 +0000
X-Inumbo-ID: a4c7ea3d-578c-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id a4c7ea3d-578c-11e9-92d7-bc764e045a96;
 Fri, 05 Apr 2019 10:21:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2760D168F;
 Fri,  5 Apr 2019 03:21:58 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FBC43F557;
 Fri,  5 Apr 2019 03:21:56 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190402164238.1815-1-julien.grall@arm.com>
 <20190402164238.1815-3-julien.grall@arm.com>
 <5CA7273C0200007800224D26@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <cebb63a0-ec60-9862-3723-9a8e514c7582@arm.com>
Date: Fri, 5 Apr 2019 11:21:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <5CA7273C0200007800224D26@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/4] xen/console: Don't treat NUL character
 as the end of the buffer
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405102154.ZsypKDYnEZLqEXCkacv24exQ4ZVDAOIS1pCDjHDpDEc@z>

SGksCgpPbiAwNS8wNC8yMDE5IDExOjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAwMi4w
NC4xOSBhdCAxODo0MiwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gQEAgLTM0NSwx
NSArMzQ1LDE1IEBAIHZvaWQgY29uc29sZV9naXZlYmFjayhpbnQgaWQpCj4+ICAgICAgICAgICBz
ZXJpYWxfc3RlYWxfZm4gPSBOVUxMOwo+PiAgIH0KPj4gICAKPj4gLXN0YXRpYyB2b2lkIHNlcmNv
bl9wdXRzKGNvbnN0IGNoYXIgKnMpCj4+ICtzdGF0aWMgdm9pZCBzZXJjb25fcHV0cyhjb25zdCBj
aGFyICpzLCB1bnNpZ25lZCBpbnQgbnIpCj4+ICAgewo+PiAgICAgICBpZiAoIHNlcmlhbF9zdGVh
bF9mbiAhPSBOVUxMICkKPj4gLSAgICAgICAgKCpzZXJpYWxfc3RlYWxfZm4pKHMpOwo+PiArICAg
ICAgICAoKnNlcmlhbF9zdGVhbF9mbikocywgbnIpOwo+IAo+IE1heSBJIGFzayB0aGF0IHlvdSB0
YWtlIHRoZSBvcHBvcnR1bml0eSBhbmQgZHJvcCB0aGUgdW5uZWNlc3NhcnkKPiBkZWNvcmF0aW9u
IGFzIHdlbGw/IEEgY2FsbCB0aHJvdWdoIGEgZnVuY3Rpb24gcG9pbnRlciBpcyBmaW5lIHRvIG1h
a2UKPiB3aXRob3V0ICogYW5kIHBhcmVudGhlc2VzLgoKU3VyZS4KCj4gCj4gQWxzbyBhIG1vcmUg
Z2VuZXJhbCBuYW1pbmcgcmVsYXRlZCByZW1hcms6IEkgdGhpbmsgdGhpcyBhbmQgaXRzCj4gdmFy
aW91cyBzaWJsaW5nIGZ1bmN0aW9ucyBhcmUgbmFtZWQgKl9wdXRzKCkgYmVjYXVzZSBvZiB0aGVp
cgo+IHNpbWlsYXJpdHkgdG8gdGhlIEMgbGlicmFyeSdzIHB1dHMoKS4gSSdtIG5vdCBjb252aW5j
ZWQgaXQgaXMgYSBnb29kCj4gbW92ZSB0byBhZGQgYSBsZW5ndGggcGFyYW1ldGVyIHdpdGhvdXQg
YWxzbyByZW5hbWluZyB0aGUgZnVuY3Rpb24KPiB0byBiZSBsZXNzIHNpbWlsYXIgdG8gcHV0cygp
LgoKSXQgaXMgbm90IGxpa2Ugb3VyIHB1dHMgaXMgc2ltaWxhciB0byB0aGUgQyB2ZXJzaW9uLiBB
cyBzdWdnZXN0ZWQgYnkgdGhlIG1hbiAKcGFnZSwgd2UgZG9uJ3QgYWRkIGEgbmV3bGluZSB3aGVu
IHByaW50aW5nLgoKU28gSSBkb24ndCBzZWUgYW55IGlzc3VlIGhlcmUgdG8gZXh0ZW5kIHRoZSBu
dW1iZXIgb2YgcGFyYW1ldGVycy4KCj4gCj4+IEBAIC01NzUsMTkgKzU3MiwyMCBAQCBzdGF0aWMg
bG9uZyBndWVzdF9jb25zb2xlX3dyaXRlKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oY2hhcikgYnVm
ZmVyLCBpbnQgY291bnQpCj4+ICAgICAgICAgICAgICAgY2hhciAqa2luID0ga2J1ZiwgKmtvdXQg
PSBrYnVmLCBjOwo+PiAgIAo+PiAgICAgICAgICAgICAgIC8qIFN0cmlwIG5vbi1wcmludGFibGUg
Y2hhcmFjdGVycyAqLwo+PiAtICAgICAgICAgICAgZm9yICggOyA7ICkKPj4gKyAgICAgICAgICAg
IGRvCj4+ICAgICAgICAgICAgICAgewo+PiAgICAgICAgICAgICAgICAgICBjID0gKmtpbisrOwo+
PiAtICAgICAgICAgICAgICAgIGlmICggYyA9PSAnXDAnIHx8IGMgPT0gJ1xuJyApCj4+ICsgICAg
ICAgICAgICAgICAgaWYgKCBjID09ICdcbicgKQo+PiAgICAgICAgICAgICAgICAgICAgICAgYnJl
YWs7Cj4+ICAgICAgICAgICAgICAgICAgIGlmICggaXNwcmludChjKSB8fCBjID09ICdcdCcgKQo+
PiAgICAgICAgICAgICAgICAgICAgICAgKmtvdXQrKyA9IGM7Cj4gCj4gSG93IGRvZXMgdGhpcyBm
aXQgd2l0aCB5b3VyIGdvYWwgb2YgaGFuZGluZyB0aHJvdWdoIG51bCBjaGFyYWN0ZXJzPwo+IGlz
cHJpbnQoJ1wwJykgcHJldHR5IGNlcnRhaW5seSBwcm9kdWNlcyBmYWxzZSwgSSB3b3VsZCB0aGlu
az8gSSByZWFsaXplCj4gdGhpcyBpcyB0aGUgRG9tVSBjYXNlLCBidXQgc2hvdWxkbid0IHdlIHRy
eSB0byB0cmVhdCB0aGlzIHNpbWlsYXJseT8KClRoZSBwb2ludCBvZiB0aGlzIGNvbW1pdCBpcyB0
byBhdm9pZCB0cmVhdGluZyBOVUwgYXMgZW5kIG9mIHRoZSBidWZmZXIuIEhvdyBOVSAKd2lsbCBi
ZSB0cmVhdGVkIGFmdGVyd2FyZHMgaXMgdXAgdG8gdGhlIHJlc3Qgb2YgdGhlIGNvZGUuCgpJbiBE
b21VLCB0aGlzIG1heSBiZSBhZGRlZCBpbiB0aGUgb3V0cHV0IGJ1ZmZlciAoc2VlIGJlbG93IG1v
cmUgZXhwbGFuYXRpb24pLgoKPiBJCj4gY2FuJ3QgcmVhbGx5IGRlY2lkZSB3aHkgdGhlIGlzcHJp
bnQoKSBsaW1pdGF0aW9uIGhlcmUgZXhpc3RzIGluIHRoZSBmaXJzdAo+IHBsYWNlLgoKUGVyIHRo
ZSBkaXNjdXNzaW9uIG9uIHRoZSBwcmV2aW91cyB2ZXJzaW9uLCBlc2NhcGUgY2hhcmFjdGVycyB3
b3VsZCBtZXNzIHVwIHdpdGggCnRoZSBjb25zb2xlIGlmIHRoZXkgYXJlIG5vdCBwcm9wZXJseSBt
YXRjaGVkLiBUaGlzIHdvdWxkIHJlc3VsdCB0byB1bnJlbGlhYmxlIApsb2cgYW5kIHRoZXJlZm9y
ZSBub3QgaWRlYWwuCgo+IAo+IEluIGFueSBldmVudCwgaWYgeW91IG1lYW4gdG8gdHJlYXQgaHdk
b20gYW5kIERvbVUgZGlmZmVyZW50bHksCj4gdGhlbiBJIHRoaW5rIHRpdGxlIGFuZC9vciBkZXNj
cmlwdGlvbiBzaG91bGQgYWN0dWFsbHkgc2F5IHNvLCBhbmQgd2h5LgoKSSBkb24ndCBzZWUgaG93
IHRoaXMgaXMgdHJlYXRlZCBkaWZmZXJlbnRseS4gVGhpcyBjb2RlIGRvZXMgZXhhY3RseSB3aGF0
IGNvbW1pdCAKdGl0bGUgc3RhdGUuIEkuZSB0aGUgTlVMIGRvZXMgbm90IGluZGljYXRlIHRoZSBl
bmQgb2YgdGhlIGJ1ZmZlciBhbnltb3JlLgoKU28gSSBkb24ndCBzZWUgd2hhdCBlbHNlIGNhbiBi
ZSBzYWlkIGluIHRoZSBjb21taXQgbWVzc2FnZS4gRmVlbCBmcmVlIHRvIHN1Z2dlc3QgaXQuCgo+
IAo+PiAtICAgICAgICAgICAgfQo+PiArICAgICAgICAgICAgfSB3aGlsZSAoIC0ta2NvdW50ID4g
MCApOwo+IAo+IFBlcnNvbmFsbHkgSSBmaW5kIGl0IG9kZCB0byB1c2UgIj4gMCIgb3IgIiAhPSAw
IiBvbiB2YXJpYWJsZXMgb2YKPiB1bnNpZ25lZCB0eXBlLiBBdCBsZWFzdCBmb3IgdGhlIGxhdHRl
ciB3ZSBpbmRlZWQgY29tbW9ubHkgb21pdCBpdCwKPiBzbyBJIHRoaW5rIGhlcmUgYW5kIGVsc2V3
aGVyZSB0aGUgIj4gMCIgd291bGQgYmV0dGVyIGJlIG9taXR0ZWQgaW4KPiBhIHNpbWlsYXIgZmFz
aGlvbi4KClRoaXMgbWFrZXMgdGhlIGNvZGUganVzdCBlYXNpZXIgdG8gcmVhZC4gWW91IGRvbid0
IGhhdmUgdG8gdGhpbmsgd2hldGhlciB0aGUgCnZhcmlhYmxlIGlzIHNpZ25lZCBvciBub3QuIEkg
YW0gbm90IHBsYW5uaW5nIHRvIGNoYW5nZSB0aGF0IHVubGVzcyBzb21lb25lIGVsc2UgCnRoaW5r
IGl0IGlzIGJldHRlciB0byBhdm9pZCAiPiAwIi4KCj4gCj4+IEBAIC0xMjU3LDE0ICsxMjU2LDE1
IEBAIHZvaWQgZGVidWd0cmFjZV9wcmludGsoY29uc3QgY2hhciAqZm10LCAuLi4pCj4+ICAgICAg
IEFTU0VSVChkZWJ1Z3RyYWNlX2J1ZltkZWJ1Z3RyYWNlX2J5dGVzIC0gMV0gPT0gMCk7Cj4+ICAg
Cj4+ICAgICAgIHZhX3N0YXJ0KGFyZ3MsIGZtdCk7Cj4+IC0gICAgdnNucHJpbnRmKGJ1Ziwgc2l6
ZW9mKGJ1ZiksIGZtdCwgYXJncyk7Cj4+ICsgICAgbnIgPSB2c2NucHJpbnRmKGJ1Ziwgc2l6ZW9m
KGJ1ZiksIGZtdCwgYXJncyk7Cj4+ICAgICAgIHZhX2VuZChhcmdzKTsKPj4gICAKPj4gICAgICAg
aWYgKCBkZWJ1Z3RyYWNlX3NlbmRfdG9fY29uc29sZSApCj4+ICAgICAgIHsKPj4gLSAgICAgICAg
c25wcmludGYoY250YnVmLCBzaXplb2YoY250YnVmKSwgIiV1ICIsICsrY291bnQpOwo+PiAtICAg
ICAgICBzZXJpYWxfcHV0cyhzZXJjb25faGFuZGxlLCBjbnRidWYpOwo+PiAtICAgICAgICBzZXJp
YWxfcHV0cyhzZXJjb25faGFuZGxlLCBidWYpOwo+PiArICAgICAgICB1bnNpZ25lZCBpbnQgbiA9
IHNucHJpbnRmKGNudGJ1Ziwgc2l6ZW9mKGNudGJ1ZiksICIldSAiLCArK2NvdW50KTsKPiAKPiBU
byBiZSBvbiB0aGUgc2FmZSBzaWRlLCBwZXJoYXBzIGJldHRlciB0byB1c2Ugc2NucHJpbnRmKCkg
aGVyZSwKPiBqdXN0IGxpa2UgdnNjbnByaW50ZigpIGdldHMgdXNlZCBhYm92ZT8KPiAKPj4gQEAg
LTEwMywxMyArMTA0LDE0IEBAIHZvaWQgbGZiX3JlZHJhd19wdXRzKGNvbnN0IGNoYXIgKnMpCj4+
ICAgfQo+PiAgIAo+PiAgIC8qIFNsb3dlciBsaW5lLWJhc2VkIHNjcm9sbCBtb2RlIHdoaWNoIGlu
dGVyYWN0cyBiZXR0ZXIgd2l0aCBkb20wLiAqLwo+PiAtdm9pZCBsZmJfc2Nyb2xsX3B1dHMoY29u
c3QgY2hhciAqcykKPj4gK3ZvaWQgbGZiX3Njcm9sbF9wdXRzKGNvbnN0IGNoYXIgKnMsIHVuc2ln
bmVkIGludCBucikKPj4gICB7Cj4+ICAgICAgIHVuc2lnbmVkIGludCBpOwo+PiAtICAgIGNoYXIg
YzsKPj4gICAKPj4gLSAgICB3aGlsZSAoIChjID0gKnMrKykgIT0gJ1wwJyApCj4+ICsgICAgZm9y
ICggaSA9IDA7IGkgPCBucjsgaSsrICkKPiAKPiBOb3RlIGhvdyBpIGlzIGFscmVhZHkgdXNlZCBp
biBhbiBpbm5lciBsb29wLgoKSSB3aWxsIGhhdmUgYSBsb29rLgoKPiAKPiBKYW4KPiAKPiAKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
