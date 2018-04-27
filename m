From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [BUG] Xen failed to emulate lfence instruction
Date: Fri, 27 Apr 2018 10:23:22 +0100
Message-ID: <2688a370-4acd-692f-5682-f6c3e5cfbf6c@citrix.com>
References: <mb9t0QqQOQtZ-i1HqPoqBwpgw1N3xMZvazY8oZcBTuI4AM0VKkwF-dPUD9K7JPeMMLoFm7jzJu1XbzaSUYLDbK50vuco_-8XkuZlzIuZLLA=@protonmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=95ya=hq=citrix.com=prvs=64868680e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fBzbD-0005B0-74
 for xen-devel@lists.xenproject.org; Fri, 27 Apr 2018 09:23:27 +0000
In-Reply-To: <mb9t0QqQOQtZ-i1HqPoqBwpgw1N3xMZvazY8oZcBTuI4AM0VKkwF-dPUD9K7JPeMMLoFm7jzJu1XbzaSUYLDbK50vuco_-8XkuZlzIuZLLA=@protonmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mathieu Tarral <mathieu.tarral@protonmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMDQvMTggMTA6MTYsIE1hdGhpZXUgVGFycmFsIHdyb3RlOgo+IEhpICEKPgo+IFdoaWxl
IHdvcmtpbmcgb24gYSBWTUkgYXBwIHRoYXQgaXMgc3VwcG9zZWQgdG8gaW50ZXJjZXB0ZWQgYSBz
cGVjaWZpYyBwcm9jZXNzLAo+IGFuZCBzZXQgYSBicmVha3BvaW50IG9uIE50UmVzdW1lVGhyZWFk
IGluIFdpbmRvd3MsIGkgZ290IGEgQlNPRC4KPgo+IEFuYWx5emluZyB0aGlzIEJTT0Qgd2l0aCB3
aW5kYmcgcmV2ZWFscyB0aGF0IEkgd2FzIGluIHRoaXMgbG9jYXRpb246Cj4KPiAgICAgRkFVTFRJ
TkdfSVA6IAo+ICAgICBudCFQc0xvb2t1cFRocmVhZEJ5VGhyZWFkSWQrODIKPiAgICAgZmZmZmY4
MDBgMDJiY2M2NDIgMGZhZWU4ICAgICAgICAgIGxmZW5jZQo+Cj4KPiBBbmQgdGhlIGVycm9yIGNv
ZGUgaXMgYW4gaWxsZWdhbCBpbnN0cnVjdGlvbi4KPgo+IEFsc28sIGkgY2FuIGNvbmZpcm0gdGhh
dCBpIHdhcyB0cnlpbmcgdG8gZW11bGF0ZSB0aGlzIGluc3RydWN0aW9uLCBzaW5jZSBpIHdhcwo+
IGluc2lkZSBteSBsaWJ2bWkgZXZlbnQgY2FsbGJhY2sgd2hlcmUgaSBpbnN0cnVjdGVkIHRvCj4g
Vk1JX0VWRU5UX1JFU1BPTlNFX0VNVUxBVEUuCj4KPiBJIG9wZW5lZCBhbiBpc3N1ZSBvbiBteSBH
aXRodWIgcmVwbzoKPiBodHRwczovL2dpdGh1Yi5jb20vV2VuemVsL3Iydm1pL2lzc3Vlcy8xMQo+
Cj4gLT4gY291bGQgaXQgYmUgcG9zc2libGUgdGhhdCB0aGUgWGVuIGVtdWxhdG9yIGZhaWxlZCBv
biBsZmVuY2UsIGV2ZW4gdGhvdWdoCj4gaXQncyBhIHF1aXRlIGNvbW1vbiBpbnN0cnVjdGlvbiA/
CgpUaGUgWGVuIGVtdWxhdG9yIGlzIGZhciBmcm9tIGNvbXBsZXRlLCBidXQgd2UgYXJlIHdvcmtp
bmcgb24gdHJ5aW5nIHRvCmltcHJvdmUgaXQuwqAgT3JpZ2luYWxseSwgaXQgb25seSBpbXBsZW1l
bnRlZCBpbnN0cnVjdGlvbnMgd2l0aCBtZW1vcnkKb3BlcmFuZHMsIGJlY2F1c2UgdGhvc2Ugd2Vy
ZSB0aGUgb25seSBvbmVzIHdoaWNoIHRyYXBwZWQgZm9yIE1NSU8uCgpTdXBwb3J0IGZvciBsZmVu
Y2Ugd2FzIGFkZGVkIGluIEphbnVhcnksIGFuZCB3aWxsIGJlIHByZXNlbnQgaW4gWGVuIDQuMTEK
d2hlbiBpdCBnZXRzIHJlbGVhc2VkLgoKSWYgeW91J3JlIHBsYXlpbmcgd2l0aCBWTUksIEknZCBy
ZWNvbW1lbmQgdXNpbmcgYW4gdXBzdHJlYW0gYnVpbGQgb2YgWGVuLgoKfkFuZHJldwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
