From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-next 7/9] xen: Convert is_xen_heap_mfn
 to use typesafe MFN
Date: Thu, 14 Mar 2019 10:14:36 +0000
Message-ID: <008b64d6-8ef2-be9c-ed4c-999d61fbfd61@citrix.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-8-julien.grall@arm.com>
 <5C891BFF020000780021E35F@prv1-mh.provo.novell.com>
 <e36aeed3-0d7f-f0e6-4e13-adf4d44db0be@arm.com>
 <5C8A0856020000780021E649@prv1-mh.provo.novell.com>
 <f78bf48b-9371-20bf-98cb-9daf3143c39b@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Rzje=RR=citrix.com=prvs=969ff7116=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h4NNr-0002V6-Fz
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 10:14:43 +0000
In-Reply-To: <f78bf48b-9371-20bf-98cb-9daf3143c39b@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTQvMDMvMjAxOSAxMDoxMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEphbiwKPgo+IE9u
IDMvMTQvMTkgNzo1MiBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDEzLjAzLjE5IGF0
IDE4OjI0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pj4gT24gMTMvMDMvMjAxOSAx
NTowNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4gT24gMTguMDIuMTkgYXQgMTI6MzUsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Pj4+IC0tLSBhL3hlbi9jb21tb24vcGFnZV9h
bGxvYy5jCj4+Pj4+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4+Pj4+IEBAIC0yMTIx
LDkgKzIxMjEsOSBAQCB2b2lkIGluaXRfeGVuaGVhcF9wYWdlcyhwYWRkcl90IHBzLCBwYWRkcl90
IHBlKQo+Pj4+PiDCoMKgwqDCoMKgwqDCoCAqIFl1ayEgRW5zdXJlIHRoZXJlIGlzIGEgb25lLXBh
Z2UgYnVmZmVyIGJldHdlZW4gWGVuIGFuZAo+Pj4+PiBEb20gem9uZXMsIHRvCj4+Pj4+IMKgwqDC
oMKgwqDCoMKgICogcHJldmVudCBtZXJnaW5nIG9mIHBvd2VyLW9mLXR3byBibG9ja3MgYWNyb3Nz
IHRoZSB6b25lCj4+Pj4+IGJvdW5kYXJ5Lgo+Pj4+PiDCoMKgwqDCoMKgwqDCoCAqLwo+Pj4+PiAt
wqDCoMKgIGlmICggcHMgJiYgIWlzX3hlbl9oZWFwX21mbihwYWRkcl90b19wZm4ocHMpLTEpICkK
Pj4+Pj4gK8KgwqDCoCBpZiAoIHBzICYmICFpc194ZW5faGVhcF9tZm4oX21mbihwYWRkcl90b19w
Zm4ocHMpLTEpKSApCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBzICs9IFBBR0VfU0laRTsK
Pj4+Pj4gLcKgwqDCoCBpZiAoICFpc194ZW5faGVhcF9tZm4ocGFkZHJfdG9fcGZuKHBlKSkgKQo+
Pj4+PiArwqDCoMKgIGlmICggIWlzX3hlbl9oZWFwX21mbihtYWRkcl90b19tZm4ocGUpKSApCj4+
Pj4KPj4+PiBXaHkgbWFkZHJfdG9fbWZuKCkgaGVyZSBidXQgc3RpbGwgcGFkZHJfdG9fcGZuKCkg
YWJvdmU/IE9oLAo+Pj4+IHdlIGRvbid0IGhhdmUgYW55IG1mbl9zdWIoKSwgSSBzZWUuCj4+Pgo+
Pj4gWWVzIHdlIGRvbid0IGhhdmUgbWZuX3N1YigpIChvciBldmVuIGdmbl9zdWIoKSkuIEkgb25s
eSBmb3VuZCBhCj4+PiBjb3VwbGUgb2YgcGxhY2VzCj4+PiB3aGVyZSBzdWNoIGhlbHBlcnMgbWln
aHQgYmUgdXNlZnVsLiBJIGNhbiBpbnRyb2R1Y2UgdGhlIDIgaGVscGVycyBpZgo+Pj4geW91IHRo
aW5rCj4+PiBpdCBpcyB3b3J0aCBpdC4KPj4KPj4gV2VsbCwgSSBndWVzcyBpbiB0aGUgZW5kIEkn
bSBmaW5lIGVpdGhlciB3YXkuIEl0IHNpbXBseSBzdHJ1Y2sgbWUKPj4gYXMgb2RkIGF0IHRoZSBm
aXJzdCBnbGFuY2UgdGhhdCB5b3UgdXNlIG1hZGRyX3RvX21mbigpIGluIG9uZQo+PiBjYXNlIGJ1
dCBub3QgdGhlIG90aGVyLgo+Cj4gSSB3YW50ZWQgdG8gYXZvaWQgYWRkaW5nIG1mbl94KC4uLikg
b24gdGhlIGxpbmU6Cj4KPiBfbWZuKG1mbl94KG1hZGRyX3RvX21mbihwcykpIC0gMSkKPgo+IEkg
d2lsbCBsb29rIHRvIGludHJvZHVjZSBtZm5fc3ViKCkvZ2ZuX3N1YigpLgoKWW91IGRvIGtub3cg
dGhhdCBtZm5fYWRkKG1mbiwgLTEpIHdpbGwgRFRSVD8KCn5BbmRyZXcKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
