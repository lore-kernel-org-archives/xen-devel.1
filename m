From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 01/12] x86: infrastructure to allow
 converting certain indirect calls to direct ones
Date: Tue, 2 Oct 2018 15:23:56 +0100
Message-ID: <9ad04c68-74d5-88ad-a36f-b61dc32c9e38@citrix.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5BB343D802000078001ED9F6@prv1-mh.provo.novell.com>
 <5BB3447802000078001EDA08@prv1-mh.provo.novell.com>
 <f04b3731-481c-b7a0-f5b5-e0e611b391b1@citrix.com>
 <5BB37B6202000078001EDC5C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=okrt=mo=citrix.com=prvs=806f63693=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g7Lhs-0005aw-TX
 for xen-devel@lists.xenproject.org; Tue, 02 Oct 2018 14:31:24 +0000
In-Reply-To: <5BB37B6202000078001EDC5C@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMTAvMTggMTU6MDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAyLjEwLjE4IGF0
IDE1OjIxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDAyLzEwLzE4
IDExOjEyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9saWIu
aAo+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2xpYi5oCj4+PiBAQCAtNjYsNiArNjYsMTAgQEAK
Pj4+ICAKPj4+ICAjZGVmaW5lIFJPVU5EVVAoeCwgYSkgKCgoeCkgKyAoYSkgLSAxKSAmIH4oKGEp
IC0gMSkpCj4+PiAgCj4+PiArI2RlZmluZSBjb3VudF92YV9hcmdfKGRvdCwgYTEsIGEyLCBhMywg
YTQsIGE1LCBhNiwgYTcsIGE4LCB4LCAuLi4pIHgKPj4+ICsjZGVmaW5lIGNvdW50X3ZhX2FyZyhh
cmdzLi4uKSBcCj4+PiArICAgIGNvdW50X3ZhX2FyZ18oLiwgIyMgYXJncywgOCwgNywgNiwgNSwg
NCwgMywgMiwgMSwgMCkKPj4gVGhpcyBwYXJ0aWN1bGFyIGJpdCBvZiByZXZpZXcgc3BsaXQgb3V0
IGZvciBvYnZpb3VzIHJlYXNvbnMuCj4+Cj4+IFdlIGFscmVhZHkgaGF2ZSBfX2NvdW50X2FyZ3Mo
KSBpbiB0aGUgQVJNIFNNQ0NDIGluZnJhc3RydWN0dXJlLiAgUGxlYXNlCj4+IGNhbiB3ZSBkZWR1
cCB0aGF0IChicm9rZW4gb3V0IGludG8gYSBzZXBhcmF0ZSBwYXRjaCkgcmF0aGVyIHRoYW4KPj4g
aW50cm9kdWNpbmcgYSBjb21wZXRpbmcgdmVyc2lvbi4KPj4KPj4gVGhlIEFSTSB2ZXJzaW9uIGlz
IGJ1Z2d5LiAgSXQgaXMgb2ZmLWJ5LXR3byBpbiB0aGUgYmFzZSBjYXNlLCBhbmQKPj4gZG9lc24n
dCBjb21waWxlIGlmIGZld2VyIHRoYW4gdHdvIHBhcmFtZXRlcnMgYXJlIHBhc3NlZC4KPiBJZiB5
b3UgaGFkIGZvbGxvd2VkIGVhcmxpZXIgZGlzY3Vzc2lvbiwgeW91J2QgaGF2ZSBrbm93biB1cCBm
cm9udAo+IEp1bGllbidzIHJlYWN0aW9uLiBJdCBpcyBmb3IgdGhhdCByZWFzb24gdGhhdCBJJ20g
bm90IHRyeWluZyB0byBmaWRkbGUKPiB3aXRoIHRoZSBBUk0gY29kZSBpbiB0aGlzIHJlZ2FyZCwg
ZGVzcGl0ZSBhZ3JlZWluZyB3aXRoIHlvdSB0aGF0Cj4gYXQgdGhlIHZlcnkgbGVhc3QgaXQgX2xv
b2tzXyBidWdneS4KPgo+PiBUaGlzIHZlcnNpb24gZnVuY3Rpb25zIGNvcnJlY3RseSwgYnV0IHNo
b3VsZCBiZSBuYW1lZCB3aXRoIGEgcGx1cmFsLgo+IFdoeSBwbHVyYWw/IE5vdGhpbmcgaW4gc3Rk
YXJnLmggdXNlcyBwbHVyYWwgKGluY2x1ZGluZyB0aGUgaGVhZGVyCj4gZmlsZSBuYW1lIGl0c2Vs
ZikuCgpXaGF0IGhhcyBzdGRhcmcuaCBnb3QgdG8gZG8gd2l0aCBhbnl0aGluZyBoZXJlP8KgIChJ
cnJlc3BlY3RpdmUsIHRoZSBuYW1lCm9mIHRoZSBoZWFkZXIgZmlsZSBhbG9uZSBpcyB0aGUgb25s
eSB0aGluZyB3aGljaCBpcyBncmFtbWF0aWNhbGx5CnF1ZXN0aW9uYWJsZS4pCgpjb3VudF92YV9h
cmdzKCkgc2hvdWxkIGJlIHBsdXJhbCBmb3IgZXhhY3RseSB0aGUgc2FtZSByZWFzb24gdGhhdCB5
b3UKbmFtZWQgaXRzIHBhcmFtZXRlciBhcyAnYXJncycuCgp+QW5kcmV3CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
