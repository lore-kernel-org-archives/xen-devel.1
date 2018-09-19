From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: PXE boot with e1000 using OVMF
Date: Wed, 19 Sep 2018 17:36:32 +0100
Message-ID: <20180919163632.d7a3xtpwzl2gy6vu@zion.uk.xensource.com>
References: <CABfawhnFZ+vhVKexKp9Os5Zo0nJQLp1kbgBA9C_qgEkVuqkHGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wwm0=mb=citrix.com=prvs=79313d28f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g2fSt-0006r2-EA
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 16:36:35 +0000
Content-Disposition: inline
In-Reply-To: <CABfawhnFZ+vhVKexKp9Os5Zo0nJQLp1kbgBA9C_qgEkVuqkHGA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBTZXAgMTIsIDIwMTggYXQgMTE6NTQ6MDJBTSAtMDYwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+IEhJIGFsbCwKPiBJJ20gZXhwZXJpbWVudGluZyB3aXRoIE9WTUYgYW5kIEkgY2hl
Y2tlZCB0byBzZWUgaWYgT1ZNRiBjYW4gZG8gUFhFCj4gYm9vdCBvdXQtb2YtdGhlIGJveCB3aXRo
IGEgZTEwMDAgZW11bGF0ZWQgbmV0d29yayBpbnRlcmZhY2UgYW5kIHdhcwo+IHN1cnByaXNlZCB0
byBmaW5kIHRoYXQgaXQgZG9lcyBub3QuIEFmdGVyIHJlYWRpbmcgc29tZSBvZiB0aGUgcHJpb3IK
PiBkaXNjdXNzaW9ucyBvbiB0aGUgdG9waWMgKGh0dHBzOi8vbGlzdHMuZ3QubmV0L3hlbi9kZXZl
bC8zODI0MzIgYW5kCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1s
L3hlbi11c2Vycy8yMDE1LTA5L21zZzAwMDU5Lmh0bWwpCj4gSSB3YXMgYWJsZSB0byBnZXQgdGhl
IG1lbnUgb3B0aW9ucyB0byBzaG93IHVwIGJ5IGNvcHlpbmcgZWZpLWUxMDAwLnJvbQo+IHRoYXQg
Z2V0cyBpbnN0YWxsZWQgYnkgWGVuJ3MgUUVNVSBidWlsZCBpbnRvIHRoZSBkaXNrIG9mIHRoZSBW
TSBhbmQKPiB0aGVuIGxvYWRpbmcgd2l0aCBsb2FkcGNpcm9tIG1hbnVhbGx5IGluIHRoZSBFRkkg
c2hlbGwuIEZyb20gdGhlIHByaW9yCj4gZGlzY3Vzc2lvbnMgaXQgc291bmRzIHRvIG1lIGxpa2Ug
dGhpcyBvcHRpb24gcm9tIHNob3VsZCBoYXZlIGJlZW4KPiBhdXRvbWF0aWNhbGx5IHNlcnZlZCBi
eSBRRU1VIHRvIE9WTUYgd2hlbiB0aGUgVk0gc3RhcnRlZCBhcyBhbgo+IE9wdGlvblJPTS4gU28g
aXMgdGhpcyBhIGJ1ZyBvciB3aGF0J3MgbWlzc2luZz8KCkRvZXNuJ3QgUUVNVSBsb2FkIHRoZSBv
cHRpb24gUk9NIGF1dG9tYXRpY2FsbHkgd2hlbiB5b3Ugc3BlY2lmeSBlMTAwMD8KCkkgX3RoaW5r
XyBpdCBsb2FkcyBvcHRpb24gUk9NIGF1dG9tYXRpY2FsbHkgYmVjYXVzZSBJIGhhdmUgc2VlbiBj
b21wbGFpbgp0aGF0IGlmIHlvdSBjb25maWd1cmUgdG9vIG1hbnkgZW11bGF0ZWQgTklDcyB0aGUg
Z3Vlc3QgcnVucyBvdXQgb2YKbWVtb3J5LgoKV2VpLgoKPiAKPiBUaGFua3MsCj4gVGFtYXMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
