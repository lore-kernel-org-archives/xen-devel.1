From: Juergen Gross <jgross@suse.com>
Subject: Re: How to deal with hypercalls returning -EFAULT
Date: Thu, 14 Jun 2018 08:39:02 +0200
Message-ID: <5519a55a-6d8c-1784-df9e-97ce206825a8@suse.com>
References: <ad5db530-fea5-7f28-2c7f-4244fc006583@suse.com>
 <23329.16617.604592.50651@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ltl4=ja=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fTLuS-000787-UV
 for xen-devel@lists.xenproject.org; Thu, 14 Jun 2018 06:39:04 +0000
In-Reply-To: <23329.16617.604592.50651@mariner.uk.xensource.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, "committers@xenproject.org" <committers@xenproject.org>, Lars Kurth <lars.kurth@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTMvMDYvMTggMTg6MDYsIElhbiBKYWNrc29uIHdyb3RlOgo+IEp1ZXJnZW4gR3Jvc3Mgd3Jp
dGVzICgiSG93IHRvIGRlYWwgd2l0aCBoeXBlcmNhbGxzIHJldHVybmluZyAtRUZBVUxUIik6Cj4+
IDMuIE1vZGlmeSB0aGUgaW50ZXJmYWNlIHRvIHRoZSBwcml2Y21kIGRyaXZlciB0byBwYXNzIGlu
Zm9ybWF0aW9uIGFib3V0Cj4+ICAgIHVzZWQgYnVmZmVycyB0byB0aGUga2VybmVsIGluIG9yZGVy
IHRvIGxvY2sgdGhlbSB0aGVyZS4gRWl0aGVyIGFkZCBhCj4+ICAgIG5ldyBpbnRlcmZhY2UgZm9y
IGh5cGVyY2FsbCBidWZmZXIgbWFuYWdlbWVudCBvciBhZGQgdGhlIGxpc3Qgb2YKPj4gICAgYnVm
ZmVycyB0byB0aGUgcHJpdmNtZCBpb2N0bCBkYXRhIHN0cnVjdHVyZS4KPj4gICAgUHJvczogLSBw
cm9ibGVtIGlzIHJlYWxseSBzb2x2ZWQKPj4gICAgQ29uczogLSBzcGxpdCBzb2x1dGlvbiBiZXR3
ZWVuIGtlcm5lbCBhbmQgWGVuLCBib3RoIG11c3QgYmUgY2hhbmdlZAo+IAo+IEkgdGhpbmsgdGhp
cyBpcyB0aGUgYmVzdCBhcHByb2FjaC4gIFRoZXJlIGFyZSBwcmVzdW1hYmx5IGFscmVhZHkKPiBp
bnRlcm5hbCBrZXJuZWwgaW50ZXJmYWNlcyB3aGljaCBjb3VsZCBiZSB1c2VkIGJ5IHByaXZjbWQg
dG8gaW1wbGVtZW50Cj4gdGhpcy4gIEFsbCB0aGF0J3MgbmVlZGVkIGlzIHRvIGRlY2lkZSB3aGF0
IHRoZSBrZXJuZWwgQVBJIHNob3VsZCBsb29rCj4gbGlrZSBhbmQgaW1wbGVtZW50IGl0LiAgbGli
eGMgZG9lc24ndCByZWFsbHkgY2FyZSB2ZXJ5IG11Y2ggd2hhdCB0aGF0Cj4gaW50ZXJmYWNlIGxv
b2tzIGxpa2UsIHNvIGl0IGNhbiBiZSB3aGF0ZXZlciBpcyBjb252ZW5pZW50IGZvciB0aGUKPiBr
ZXJuZWwuCj4gCj4+IDIuIEFkZCBhIGJhbmRhaWQgdG8gWGVuIHRvb2xzIGJ5IHJldHJ5aW5nIGh5
cGVyY2FsbHMgd2hpY2ggaGF2ZSBmYWlsZWQKPj4gICAgd2l0aCAtRUZBVUxUIChlaXRoZXIgZm9y
IGFsbCBvciBvbmx5IGZvciBzb21lIGh5cGVyY2FsbHMpCj4+ICAgIFByb3M6IC0gbm8gaW50ZXJm
YWNlIGNoYW5nZSBuZWNlc3NhcnkKPj4gICAgQ29uczogLSBub3QgYWxsIGh5cGVyY2FsbHMgbWln
aHQgYmUganVzdCByZXBlYXRhYmxlCj4+ICAgICAgICAgIC0gcHJvYmxlbSBpc24ndCBzb2x2ZWQg
YnV0IGp1c3Qgd29ya2VkIGFyb3VuZAo+IAo+IFRoaXMgbWF5IGFsbG93IHVzIHRvIG1ha2Ugc29t
ZSBraW5kIG9mIHByb2dyZXNzIGluIHN5c3RlbXMgd2hpY2ggYXJlCj4gZnVuZGFtZW50YWxseSBi
cm9rZW4sIGJ1dCBJIGRvbid0IHRoaW5rIGl0IGlzIGEgdG9sZXJhYmxlIGxvbmcgdGVybQo+IGFw
cHJvYWNoLgo+IAo+IElmIHdlIGRvIHRoaXMsIHdlIHNob3VsZCBhbHNvIGRvIHlvdXIgb3B0aW9u
ICgzKSwgYW5kIHRoZSB3b3JrYXJvdW5kCj4gc2hvdWxkIG9ubHkgYmUgZW5hYmxlZCBpZiB0aGUg
cHJvcGVyIGludGVyZmFjZSBpcyBub3QgYXZhaWxhYmxlLgoKT2YgY291cnNlLgoKCkp1ZXJnZW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
