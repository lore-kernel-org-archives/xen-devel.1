From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 17/49] xen/sched: move some per-vcpu
 items to struct sched_item
Date: Mon, 1 Apr 2019 10:47:31 +0200
Message-ID: <6db74ead-82c4-6e36-1d47-fac24ac7f590@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7l/E=SD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hAsbR-0004wu-GE
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 08:47:37 +0000
References: =?UTF-8?B?PDIwMTkwMzI5MTUwOTM0LjE3Njk077+9Me+/vWpncm9zc0BzdXNl?=
 =?UTF-8?B?LmNvbT4gPDIwMTkwMzI5MTUwOTM0LjE3Njk077+9MTjvv71qZ3Jvc3NAc3VzZS5j?=
 =?UTF-8?B?b20+IDxhZDlmNTE0Yu+/vTczMjXvv70wNzU577+9MGE4MO+/vWM4MTk1ZThjMGI2?=
 =?UTF-8?B?NEBjaXRyaXguY29tPiA8Y2QyYjg1Zmbvv71jY2M377+9ZTI2Me+/vWE0YjXvv702?=
 =?UTF-8?Q?a5f56e98e2a=40suse=2ecom=3e_=3c05874d79-0470-2895-d231-c56ddd834d?=
 =?UTF-8?Q?de=40suse=2ecom=3e_=3c5CA1C63402000078002236F5=40suse=2ecom=3e?=
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDQvMjAxOSAxMDowNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDEuMDQuMTkg
YXQgMDc6NTksIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBPbiAzMC8wMy8yMDE5IDEwOjU5
LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4gT24gMjkvMDMvMjAxOSAyMjozMywgQW5kcmV3IENv
b3BlciB3cm90ZToKPj4+PiBJZiBhdCBhbGwgcG9zc2libGUsIEknZCBwcmVmZXIgdG8gc2VlIGFi
b3V0IGRpc2VudGFuZ2xpbmcgdGhlIGJpdHMgd2hpY2gKPj4+PiBhY3R1YWxseSBuZWVkIGV4dGVy
bmFsIHVzZSwgYW5kIHB1dHRpbmcgdGhlbSBpbiBzY2hlZC5oLCBhbmQgbWFraW5nCj4+Pj4gc2No
ZWQtaWYuaCBwcm9wZXJseSBwcml2YXRlIHRvIHRoZSBzY2hlZHVsZXJzLiAgSSBhY3R1YWxseSBl
dmVuIHN0YXJ0ZWQKPj4+PiBhIGNsZWFudXAgc2VyaWVzIHdoaWNoIG1vdmVkIGFsbCBvZiB0aGUg
c2NoZWR1bGVyIGluZnJhc3RydWN0dXJlIGludG8KPj4+PiBjb21tb24vc2NoZWQvLCBidXQgZm91
bmQgYSBkaXNhcHBvaW50aW5nIHF1YW50aXR5IG9mIHNjaGVkLWlmLmggYmVpbmcKPj4+PiByZWZl
cmVuY2VkIGV4dGVybmFsbHkuCj4+Pgo+Pj4gSSBjYW4gYWRkIHNvbWV0aGluZyBsaWtlIHRoYXQg
dG8gbXkgc2VyaWVzIGlmIHlvdSB3YW50LiBTbzoKPj4+Cj4+PiAtIG1vdmluZyBzY2hlZHVsZS5j
LCBzY2hlZF8qLmMgYW5kIGNwdXBvb2wuYyB0byBjb21tb24vc2NoZWQvCj4+PiAtIG1vdmUgc3R1
ZmYgZnJvbSBzY2hlZC1pZi5oIHRvIHNjaGVkLmggaWYgbmVlZGVkIG91dHNpZGUgb2YKPj4+ICAg
Y29tbW9uL3NjaGVkLwo+Pj4gLSBtb3ZlIHNjaGVkLWlmLmggdG8gY29tbW9uL3NjaGVkLwo+Pgo+
PiBRdWVzdGlvbnMgdG8gZXNwZWNpYWxseSB0aGUgc2NoZWR1bGVyIG1haW50YWluZXJzIGFuZCAi
dGhlIFJFU1QiOiBzaG91bGQKPj4gd2UgbW92ZSB0aGUgc2NoZWR1bGVyIHN0dWZmIHRvIHhlbi9j
b21tb24vc2NoZWQvIG9yIHdvdWxkIC94ZW4vc2NoZWQvIGJlCj4+IG1vcmUgYXBwcm9wcmlhdGU/
Cj4+Cj4+IE1heWJlIGl0IHdvdWxkIGJlIHdvcnRod2hpbGUgdG8gbW92ZSBlLmcuIHRoZSBjb250
ZXh0IHN3aXRjaGluZyBmcm9tCj4+IHhlbi9hcmNoLyovZG9tYWluLmMgdG8geGVuL3NjaGVkL2Nv
bnRleHRfPGFyY2g+LmM/IEkgdGhpbmsgdGhpcyBjb2RlIGlzCj4+IHJhdGhlciBzY2hlZHVsZXIg
cmVsYXRlZCBhbmQgbW92aW5nIGl0IHRvIHRoZSBzY2hlZCBkaXJlY3RvcnkgbWlnaHQgaGVscAo+
PiBoaWRpbmcgc29tZSBzY2hlZHVsZXIgaW50ZXJuYWxzIGZyb20gb3RoZXIgc291cmNlcywgZXNw
ZWNpYWxseSB3aXRoIG15Cj4+IGNvcmUgc2NoZWR1bGluZyBzZXJpZXMuIElNTyB0aGlzIHdvdWxk
IG1ha2UgdGhlIHhlbi9zY2hlZC8gZGlyZWN0b3J5IHRoZQo+PiBwcmVmZXJyZWQgb25lLgo+IAo+
IEZXSVcsIEkgZG9uJ3QgcmVhbGx5IG1pbmQgc3VjaCBhIG1vdmUgYXMgbG9uZyBhcyBpdCB3b24n
dCByZXN1bHQgaW4KPiB0aGVuIGhhdmluZyB0byBleHBvc2UgdmFyaW91cyBhcmNoLWludGVybmFs
cyBqdXN0IHRvIG1ha2UgdGhlbQo+IHVzYWJsZSBmcm9tIHhlbi9zY2hlZC9jb250ZXh0XzxhcmNo
Pi5jIChvciB3aGF0ZXZlciBpdCdzIGdvaW5nCj4gdG8gYmUgbmFtZWQgLSB0aGUgbmFtZSBpcyBh
IGxpdHRsZSBsb25naXNoIGZvciBteSB0YXN0ZSkuCj4gCj4gQnV0IG1heSBJIHJlY29tbWVuZCBu
b3QgdG8gZG8gdG9vIG1hbnkgdGhpbmdzIGFsbCBpbiBvbmUgZ28/CgpZZXMuIEFuZCB0aGUgbmFt
aW5nIGNhbiBiZSBkaXNjdXNzZWQgbGF0ZXIgdGhlbi4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
