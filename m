From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v8 09/50] x86emul: support AVX512{F,
 BW} integer unpack insns
Date: Mon, 18 Mar 2019 03:55:17 -0600
Message-ID: <5C8F6B05020000780021FC05@prv1-mh.provo.novell.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B813F020000780021F164@prv1-mh.provo.novell.com>
 <4b177bfd-0aa0-5389-b8d4-91278d8a0fc0@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VMO2=RV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h5ozN-0004e3-3f
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2019 09:55:25 +0000
In-Reply-To: <4b177bfd-0aa0-5389-b8d4-91278d8a0fc0@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAzLjE5IGF0IDE5OjIxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTUvMDMvMjAxOSAxMDo0MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEBAIC02Njgx
LDYgKzY2ODEsMTIgQEAgeDg2X2VtdWxhdGUoCj4+ICAgICAgY2FzZSBYODZFTVVMX09QQ19FVkVY
XzY2KDB4MGYsIDB4ZjYpOiAvKiB2cHNhZGJ3IFt4eXpdbW0vbWVtLFt4eXpdbW0sW3h5el1tbSAq
Lwo+PiAgICAgICAgICBnZW5lcmF0ZV9leGNlcHRpb25faWYoZXZleC5vcG1zaywgRVhDX1VEKTsK
Pj4gICAgICAgICAgLyogZmFsbCB0aHJvdWdoICovCj4+ICsgICAgY2FzZSBYODZFTVVMX09QQ19F
VkVYXzY2KDB4MGYsIDB4NjApOiAvKiB2cHVucGNrbGJ3IFt4eXpdbW0vbWVtLFt4eXpdbW0sW3h5
el1tbXtrfSAqLwo+PiArICAgIGNhc2UgWDg2RU1VTF9PUENfRVZFWF82NigweDBmLCAweDYxKTog
LyogdnB1bnBja2x3ZCBbeHl6XW1tL21lbSxbeHl6XW1tLFt4eXpdbW17a30gKi8KPj4gKyAgICBj
YXNlIFg4NkVNVUxfT1BDX0VWRVhfNjYoMHgwZiwgMHg2OCk6IC8qIHZwdW5wY2toYncgW3h5el1t
bS9tZW0sW3h5el1tbSxbeHl6XW1te2t9ICovCj4+ICsgICAgY2FzZSBYODZFTVVMX09QQ19FVkVY
XzY2KDB4MGYsIDB4NjkpOiAvKiB2cHVucGNraHdkIFt4eXpdbW0vbWVtLFt4eXpdbW0sW3h5el1t
bXtrfSAqLwo+PiArICAgICAgICBvcF9ieXRlcyA9IDE2IDw8IGV2ZXgubHI7Cj4+ICsgICAgICAg
IC8qIGZhbGwgdGhyb3VnaCAqLwo+IAo+IElmIHRoaXMgc2V0dGluZyBvZiBvcF9ieXRlcyBpcyBz
YWZlIHRvIGRvIGZvciB2cHNhZGJ3LCBob3cgZG9lcyB0aGUKPiBlbXVsYXRpb24gY3VycmVudGx5
IHdvcms/CgpUaGUgc2V0dGluZyBpcyByZWR1bmRhbnQgZm9yIFZQU0FEQlcgKHRoZXJlIGl0IGdl
dHMgc2V0IGJ5IHZpcnR1ZQpvZiBpdHMgdGFibGUgZW50cnkgc2F5aW5nIHNpbWRfcGFja2VkX2lu
dCksIGJ1dCBpdCdzIG5lY2Vzc2FyeSBmb3IKVlVOUENLKiBhcyB0aGVpciB0YWJsZSBlbnRyaWVz
IHVzZSBzaW1kX290aGVyLCB3aGljaCBpcyBuZWNlc3NhcnkKYmVjYXVzZSBvZiB0aGUgbWVtb3J5
IGFjY2VzcyBwYXR0ZXJuIG9mIFBVTlBDS0wqLiBJbiBmYWN0IHRoZQpQVU5QQ0tIKiBlbnRyaWVz
IGNvdWxkIGVxdWFsbHkgd2VsbCB1c2Ugc2ltZF9wYWNrZWRfaW50LCBidXQKdGhhdCB3b3VsZCB0
aGVuIGNhbGwgZm9yIHRoZWlyIGNhc2UgbGFiZWxzIHRvIGdldCBtb3ZlZCBhd2F5IGZyb20KdGhl
IFBVTlBDS0wqIG9uZXMsIGFuZCBJIHNsaWdodGx5IHByZWZlciB0aGVtIHRvIGJlIGtlcHQgdG9n
ZXRoZXIuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
