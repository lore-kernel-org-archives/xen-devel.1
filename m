From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v2 0/2] xen-hvm: use new resource mapping API
Date: Mon, 14 May 2018 09:38:57 +0000
Message-ID: <d912b54af4c141b990782912cf237ed9@AMSPEX02CL03.citrite.net>
References: <20180510091518.28199-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=c+nq=ib=citrix.com=prvs=66545552d=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fI9x0-0006Lj-SM
 for xen-devel@lists.xenproject.org; Mon, 14 May 2018 09:39:26 +0000
In-Reply-To: <20180510091518.28199-1-paul.durrant@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Perard <anthony.perard@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: "Daniel P . Berrange" <berrange@redhat.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Paul Durrant <Paul.Durrant@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Eric Blake <eblake@redhat.com>
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSwgU3RlZmFubywKClBpbmc/CgpJJ2QgbGlrZSB0byBnZXQgeW91ciBmZWVkYmFjayBi
ZWZvcmUgc3Bpbm5pbmcgYSB2MyB0byBpbmNvcnBvcmF0ZSBFcmljJ3Mgc3VnZ2VzdGlvbiByZWdh
cmRpbmcgdGhlIGNvbW1pdCBjb21tZW50IGZvciAjMi4KCiAgUGF1bAoKPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+IEZyb206IFBhdWwgRHVycmFudCBbbWFpbHRvOnBhdWwuZHVycmFudEBj
aXRyaXguY29tXQo+IFNlbnQ6IDEwIE1heSAyMDE4IDEwOjE1Cj4gVG86IHFlbXUtZGV2ZWxAbm9u
Z251Lm9yZzsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gQ2M6IFBhdWwgRHVycmFu
dCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+OyBBbnRob255IFBlcmFyZAo+IDxhbnRob255LnBl
cmFyZEBjaXRyaXguY29tPjsgRGFuaWVsIFAgLiBCZXJyYW5nZSA8YmVycmFuZ2VAcmVkaGF0LmNv
bT47Cj4gRXJpYyBCbGFrZSA8ZWJsYWtlQHJlZGhhdC5jb20+OyBQYW9sbyBCb256aW5pIDxwYm9u
emluaUByZWRoYXQuY29tPjsKPiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+Cj4gU3ViamVjdDogW1BBVENIIHYyIDAvMl0geGVuLWh2bTogdXNlIG5ldyByZXNvdXJj
ZSBtYXBwaW5nIEFQSQo+IAo+IFRoaXMgc2VyaWVzIG1vZGlmaWVzIFFFTVUgdG8gdXNlIHRoZSBu
ZXcgZ3Vlc3QgcmVzb3VyY2UgbWFwcGluZyBBUEkKPiAoYXZhaWxhYmxlIGluIFhlbiA0LjExKykg
dG8gbWFwIGlvcmVxIHBhZ2VzLgo+IAo+IHYyOgo+ICAtIEFkZCBhIHBhdGNoIHRvIGNoZWNrcGF0
Y2ggdG8gYXZvaWQgbWlzcGFyc2luZyBvZiBYZW4gc3RhYmxlIEFQSSBoYW5kbGVzCj4gCj4gUGF1
bCBEdXJyYW50ICgzKToKPiAgIHhlbi1odm06IGNyZWF0ZSBzZXBhcmF0ZSBmdW5jdGlvbiBmb3Ig
aW9yZXEgc2VydmVyIGluaXRpYWxpemF0aW9uCj4gICBjaGVja3BhdGNoOiBnZW5lcmFsaXplIHhl
biBoYW5kbGUgbWF0Y2hpbmcgaW4gdGhlIGxpc3Qgb2YgdHlwZXMKPiAgIHhlbi1odm06IHRyeSB0
byB1c2UgeGVuZm9yZWlnbm1lbW9yeV9tYXBfcmVzb3VyY2UoKSB0byBtYXAgaW9yZXEKPiBwYWdl
cwo+IAo+ICBjb25maWd1cmUgICAgICAgICAgICAgICAgICAgfCAgIDUgKysKPiAgaHcvaTM4Ni94
ZW4vdHJhY2UtZXZlbnRzICAgIHwgICAxICsKPiAgaHcvaTM4Ni94ZW4veGVuLWh2bS5jICAgICAg
IHwgMTE0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+IC0tLS0tLS0tLS0tCj4g
IGluY2x1ZGUvaHcveGVuL3hlbl9jb21tb24uaCB8ICAxNCArKysrKysKPiAgc2NyaXB0cy9jaGVj
a3BhdGNoLnBsICAgICAgIHwgICAyICstCj4gIDUgZmlsZXMgY2hhbmdlZCwgMTA1IGluc2VydGlv
bnMoKyksIDMxIGRlbGV0aW9ucygtKQo+IC0tLQo+IENjOiBBbnRob255IFBlcmFyZCA8YW50aG9u
eS5wZXJhcmRAY2l0cml4LmNvbT4KPiBDYzogRGFuaWVsIFAuIEJlcnJhbmdlIDxiZXJyYW5nZUBy
ZWRoYXQuY29tPgo+IENjOiBFcmljIEJsYWtlIDxlYmxha2VAcmVkaGF0LmNvbT4KPiBDYzogUGFv
bG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5p
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IAo+IC0tCj4gMi4xMS4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
