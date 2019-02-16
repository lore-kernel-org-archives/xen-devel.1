From: Julien Grall <julien.grall@gmail.com>
Subject: Re: [PATCH] xen/arm: setup_xenheap_mappings: BUG when
 alloc_boot_pages
Date: Sat, 16 Feb 2019 17:38:54 +0100
Message-ID: <CAF3u54C-PBqDy25CFEZ4WQbTrK--6Vs3L-QdN34yJ-zSU4c9TA@mail.gmail.com>
References: <20190216134456.10681-1-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UhvR=QX=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gv301-00042f-FN
 for xen-devel@lists.xenproject.org; Sat, 16 Feb 2019 16:39:33 +0000
Received: by mail-vs1-xe43.google.com with SMTP id s16so7345086vsk.4
 for <xen-devel@lists.xenproject.org>; Sat, 16 Feb 2019 08:39:31 -0800 (PST)
In-Reply-To: <20190216134456.10681-1-peng.fan@nxp.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: "van.freenix@gmail.com" <van.freenix@gmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "julien.grall@arm.com" <julien.grall@arm.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpPbiBTYXQsIEZlYiAxNiwgMjAxOSBhdCAyOjM2IFBNIFBlbmcgRmFuIDxwZW5nLmZh
bkBueHAuY29tPiB3cm90ZToKPgo+IE9uIEFSTTY0LCBib290bWVtIGlzIGluaXRpYWxpemVkIGFm
dGVyIHNldHVwX3hlbmhlYXBfbWFwcGluZ3MsCj4gc28gd2Ugc2hvdWxkIG5vdCBjYWxsIGFsbG9j
X2Jvb3RfcGFnZXMgaW4gc2V0dXBfeGVuaGVhcF9tYXBwaW5ncy4KPgo+IFdlIGNvdWxkIG5vdCBz
aW1wbHkgbW92ZSBzZXR1cF94ZW5oZWFwX21hcHBpbmdzIGFmdGVyIGluaXRfYm9vdF9wYWdlcywK
PiBiZWNhdXNlIGluIGJvb3RtZW1fcmVnaW9uX2FkZCwgd2hlbiBib290bWVtX3JlZ2lvbl9saXN0
IGlzIE5VTEwsCj4gaXQgd2lsbCBhc3NpZ24gdGhlIGZpcnN0IHZpcnR1YWwgYWRkcmVzcyBvZiB0
aGUgZmlyc3QgYm9vdG1lbSByZWdpb24KPiB0byBib290bWVtX3JlZ2lvbl9saXN0LiBJZiB0aGUg
Ym9vdG1lbSBpcyBub3QgbWFwcGVkLCBpdCB3aWxsIHRyaWdnZXIKPiBkYXRhIGFib3J0IHdoZW4g
d3JpdHRpbmcgdG8gdGhlIGJvb3RtZW1fcmVnaW9uX2xpc3RbXSBhcmVhLgo+Cj4gQ3VycmVudGx5
IHdlIGRpZCBub3QgbWV0IGlzc3VlLCBiZWNhdXNlIEZJUlNUX1NJWkUgaXMgMUdCIG9uIEFSTTY0
LAo+IGFuZCB4ZW5oZWFwX2ZpcnN0X2ZpcnN0IHRhYmxlIGNvdWxkIGhvbGQgdXAgdG8gNTEyR0Ig
dmlydHVhbCBtZW1vcnkKPiByZWdpb24uIHdlIGRvIG5vdCBoYXZlIFNvQyBzdXBwb3J0IHN1Y2gg
bGFyZ2UgRFJBTSBub3csIGJ1dCB3ZSBtaWdodAo+IGhhdmUgaW4gZnV0dXJlLgoKIldlIiBpcyBh
IGJpdCB2YWd1ZS4gRG8geW91IG1lYW4gTlhQIG9yIEFybSBlY29zeXN0ZW0/IElmIHRoZSBsYXR0
ZXIsCnRoZXJlIGFyZSBkZWZpbml0ZWx5IHBsYXRmb3JtIHRoYXQgY2FuIHN1cHBvcnQgbW9yZSB0
aGFuIDUxMkdCLgpYZW4gc3VwcG9ydHMgc29tZSBvZiB0aGVtLCBidXQgSSBkb24ndCB0aGluayBz
b21lb25lIGV2ZXIgdHJpZWQgdG8KYm9vdCBYZW4gd2l0aCB0aGF0IG11Y2ggbWVtb3J5LgoKPgo+
IEFkZCBCVUcoKSB0byBsZXQgcGVvcGxlIGJlIGF3YXJlIG9mIHRoaXMgaXNzdWUuCgpXaGlsZSBJ
IHVuZGVyc3RhbmQgdGhlIHByb2JsZW0sIEkgZG9uJ3QgdGhpbmsgdGhlIEJVRygpIGlzIHRoZSBj
b3JyZWN0IGFwcHJvYWNoLgoKRmlyc3RseSwgYWxsb2NfYm9vdF9wYWdlcyBjYW4gb25seSByZXR1
cm4gaWYgYSBwYWdlIHdhcyBhbGxvY2F0ZWQuCk90aGVyd2lzZSwgWGVuIHdpbGwgY3Jhc2ggKHNl
ZSB2YXJpb3VzIEJVRygpKS4gU28gYWRkaW5nIGEgQlVHKCkgaXMgYQpiaXQgcG9pbnRsZXNzLgpT
ZWNvbmRseSwgd2UgYXJlIG1lYW50IHRvIHN1cHBvcnQgdXAgdG8gNVRCIG9mIFJBTSAoc2VlIFsx
XSkgYW5kIHRoZXJlCmFyZSBwbGF0Zm9ybSBvdXQgdGhlcmUgc3VwcG9ydGluZyBtb3JlIHRoYW4g
NTEyR0IuCgpUaGlzIG1lYW5zIHRoaXMgaXMgYSBidWcgaW4gdGhlIGNvZGUgdGhhdCBzaG91bGQg
YmUgZml4ZWQuIE9uZQpzb2x1dGlvbiBJIGNhbiBzZWUgaXMgdG8gcmV3b3JrIHNldHVwX3hlbmhl
YXBfbWFwcGluZ3MgdG8gY2FsbAppbml0X2Jvb3RfcGFnZXMuCgpDaGVlcnMsCgpbMV0gaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE4LTEyL21z
ZzAwODgxLmh0bWwKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
