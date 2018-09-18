From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 00/12] add per-domain and per-cpupool
 generic parameters
Date: Tue, 18 Sep 2018 12:18:08 +0100
Message-ID: <984047f6-4785-27e6-2ff8-63d990a9238a@citrix.com>
References: <20180918060309.7186-1-jgross@suse.com>
 <5BA0D44602000078001E93EA@prv1-mh.provo.novell.com>
 <7cb2a460-095c-27c8-a4cf-47ef8e7850d5@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cr/b=ma=citrix.com=prvs=792583d5e=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1g2E1G-0000kM-En
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 11:18:14 +0000
In-Reply-To: <7cb2a460-095c-27c8-a4cf-47ef8e7850d5@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMTgvMjAxOCAxMjoxMCBQTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAxOC8wOS8x
OCAxMjozMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDE4LjA5LjE4IGF0IDA4OjAyLCA8
amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+IEluc3RlYWQgb2YgdXNpbmcgYmluYXJ5IGh5cGVy
dmlzb3IgaW50ZXJmYWNlcyBmb3IgbmV3IHBhcmFtZXRlcnMgb2YKPj4+IGRvbWFpbnMgb3IgY3B1
cG9vbHMgdGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBnZW5lcmljIHRleHQKPj4+
IGJhc2VkIHBhcmFtZXRlciBwYXJzaW5nLgo+Pj4KPj4+IFBhcmFtZXRlcnMgYXJlIGRlZmluZWQg
dmlhIG5ldyBtYWNyb3Mgc2ltaWxhciB0byB0aG9zZSBvZiBib290Cj4+PiBwYXJhbWV0ZXJzLiBQ
YXJzaW5nIG9mIHBhcmFtZXRlciBzdHJpbmdzIGlzIGRvbmUgdmlhIHRoZSBhbHJlYWR5Cj4+PiBl
eGlzdGluZyBib290IHBhcmFtZXRlciBwYXJzaW5nIGZ1bmN0aW9uIHdoaWNoIGlzIGV4dGVuZGVk
IGEgbGl0dGxlCj4+PiBiaXQuCj4+Pgo+Pj4gUGFyYW1ldGVyIHNldHRpbmdzIGNhbiBlaXRoZXIg
YmUgc3BlY2lmaWVkIGluIGNvbmZpZ3VyYXRpb24gZmlsZXMgb2YKPj4+IGRvbWFpbnMgb3IgY3B1
cG9vbHMsIG9yIHRoZXkgY2FuIGJlIHNldCB2aWEgbmV3IHhsIHN1Yi1jb21tYW5kcy4KPj4KPj4g
V2l0aG91dCBoYXZpbmcgbG9va2VkIGF0IGFueSBvZiB0aGUgcGF0Y2hlcyB5ZXQgKG5vdCBldmVu
IHRoZWlyCj4+IGRlc2NyaXB0aW9ucykgSSdtIHN0aWxsIHdvbmRlcmluZyB3aGF0IHRoZSBiZW5l
Zml0IG9mIHRleHR1YWwgcGFyYW1ldGVycwo+PiByZWFsbHkgaXM6IEp1c3QgbGlrZSAiYmluYXJ5
IiBvbmVzLCB0aGV5IGJlY29tZSBwYXJ0IG9mIHRoZSBwdWJsaWMKPj4gaW50ZXJmYWNlLCBhbmQg
aGVuY2Ugc3Vic2VxdWVudGx5IGNhbid0IGJlIGNoYW5nZWQgYW55IG1vcmUgb3IKPj4gbGVzcyB0
aGFuIHRoZSBvbmVzIHdlIGN1cnJlbnRseSBoYXZlIChpbiBwYXJ0aWN1bGFyLCBhbnl0aGluZyB2
YWxpZCBpbgo+PiBhIGd1ZXN0IGNvbmZpZyBmaWxlIHdpbGwgaW1vIG5lZWQgdG8gcmVtYWluIHRv
IGJlIHZhbGlkIGFuZCBtZWFuaW5nZnVsCj4+IGRvd24gdGhlIHJvYWQpLgo+IAo+IFNvIGxldHMg
bG9vayB3aGF0IHdvdWxkIGJlIG5lZWRlZCBmb3IgYWRkaW5nIHNvbWV0aGluZyBsaWtlIHRoZQo+
IHBlci1kb21haW4geHB0aSBwYXJhbWV0ZXIgdXNpbmcgYmluYXJ5IGludGVyZmFjZXM6Cj4gCj4g
MSBhbiBleHRlbnNpb24gb2Ygc29tZSBkb21jdGwgaW50ZXJmYWNlLCBtYXliZSBidW1waW5nIG9m
IHRoZSBkb21jdGwKPiAgIGludGVyZmFjZSB2ZXJzaW9uCj4gMiBhZGRpbmcgdGhlIGxvZ2ljIHRv
IGRvbWN0bCBoYW5kbGluZwo+IDMgYWRkaW5nIGxpYnhjIHN1cHBvcnQKPiA0IGFkZGluZyBsaWJ4
bCBzdXBwb3J0Cj4gNSBhZGRpbmcgYSBuZXcgeGwgc3ViLWNvbW1hbmQKPiA2IGFkZGluZyBkb21h
aW4gY29uZmlnIHN1cHBvcnQKPiA3IGFkZGluZyBkb2N1bWVudGF0aW9uCj4gCj4gV2l0aCBteSBh
cHByb2FjaCBvbmx5IDIgKGluIGEgbW9kaWZpZWQgZm9ybSwgcGFyYW1ldGVyIGhhbmRsaW5nIGlu
c3RlYWQKPiBvZiBkb21jdGwsIGJ1dCBjb21wYXJhYmxlIGluIHRoZSBuZWVkZWQgZWZmb3J0KSBh
bmQgNyBhcmUgbmVlZGVkLgo+IAo+IFNvIG9uY2UgdGhlIGZyYW1ld29yayBpcyBpbiBwbGFjZSBp
dCBpcyBfbXVjaF8gZWFzaWVyIHRvIGFkZCBuZXcKPiBmZWF0dXJlcy4KClNvIHRoZSBpZGVhIGhl
cmUgaXMgdGhhdCB5b3UgcGFzcyBhIGZ1bGwgaHlwZXJ2aXNvciBjb21tYW5kLWxpbmUgc3R5bGUK
c3RyaW5nIGludG8gYSBoeXBlcmNhbGwgLS0gc2F5LCAiY3JlZGl0Ml9jYXBfcGVyaW9kX21zPTUi
PwoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
