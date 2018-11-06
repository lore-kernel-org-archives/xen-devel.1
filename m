From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v4 4/6] tools/dm_restrict: Unshare mount and
 IPC namespaces on Linux
Date: Tue, 6 Nov 2018 10:29:31 +0000
Message-ID: <97ad088b-c61b-ff67-d9aa-008e1678a8ca@citrix.com>
References: <20181105180711.20322-1-george.dunlap@citrix.com>
 <20181105180711.20322-4-george.dunlap@citrix.com>
 <48cdd789994e421faaf825a7d9b50aa0@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pbld=nr=citrix.com=prvs=8415d0394=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gJyc3-0004vl-7C
 for xen-devel@lists.xenproject.org; Tue, 06 Nov 2018 10:29:35 +0000
In-Reply-To: <48cdd789994e421faaf825a7d9b50aa0@AMSPEX02CL03.citrite.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony Perard <anthony.perard@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDYvMjAxOCAwOToxNiBBTSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiBkaWZmIC0tZ2l0
IGEvdG9vbHMvbGlieGwvbGlieGxfbmV0YnNkLmMgYi90b29scy9saWJ4bC9saWJ4bF9uZXRic2Qu
Ywo+PiBpbmRleCAyZWRmYjAwNjQxLi5kY2UzZjFmZGNlIDEwMDY0NAo+PiAtLS0gYS90b29scy9s
aWJ4bC9saWJ4bF9uZXRic2QuYwo+PiArKysgYi90b29scy9saWJ4bC9saWJ4bF9uZXRic2QuYwo+
PiBAQCAtMTI0LDMgKzEyNCw4IEBAIGludCBsaWJ4bF9fcGNpX3RvcG9sb2d5X2luaXQobGlieGxf
X2djICpnYywKPj4gIHsKPj4gICAgICByZXR1cm4gRVJST1JfTkk7Cj4+ICB9Cj4+ICsKPj4gK3Zv
aWQgbGlieGxfX2xvY2FsX2RtX3ByZWV4ZWNfcmVzdHJpY3QobGlieGxfX2djICpnYywgaW50IHN0
ZGVycmZkKQo+PiArewo+PiArICAgIHJldHVybjsKPj4gK30KPiAKPiBUaGlzIGlzIGEgdm9pZCBm
dW5jdGlvbiB3aGVyZWFzIHRoZSBjYWxsZXIgYWx3YXlzIGFwcGVhcnMgdG8gZXhwZWN0IGFuIGlu
dCByZXR1cm4gdmFsdWUsIHJlZ2FyZGxlc3Mgb2YgT1MuCgpJbmRlZWQsIHRoaXMgd291bGQgcHJv
YmFibHkgYnJlYWsgdGhlIGJ1aWxkIG9uIE5ldEJTRC4gIEdvb2QgY2F0Y2guCgogLUdlb3JnZQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
