From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH 04/18] xen: create xenstore areas for
 XenDevice-s
Date: Wed, 5 Dec 2018 14:24:04 +0000
Message-ID: <f0d21d9e49ef496f9e7c1949bbc1d473__38178.3513854772$1544019806$gmane$org@AMSPEX02CL03.citrite.net>
References: <20181121151211.15997-1-paul.durrant@citrix.com>
 <20181121151211.15997-5-paul.durrant@citrix.com>
 <20181129184841.GJ14786@perard.uk.xensource.com>
 <589a4488f1ba4e4496775cc06bda291d@AMSPEX02CL03.citrite.net>
 <d5bf17f689a34e69b9e3b7b92bcfe4fd@AMSPEX02CL03.citrite.net>
 <20181205135839.GB1259@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=f1m+=oo=citrix.com=prvs=870045bc7=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gUY6C-00020r-Gt
 for xen-devel@lists.xenproject.org; Wed, 05 Dec 2018 14:24:24 +0000
In-Reply-To: <20181205135839.GB1259@perard.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Perard <anthony.perard@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIFttYWls
dG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiBTZW50OiAwNSBEZWNlbWJlciAyMDE4IDEz
OjU5Cj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IEtl
dmluIFdvbGYgPGt3b2xmQHJlZGhhdC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkKPiA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz47IHFlbXUtYmxvY2tAbm9uZ251Lm9yZzsgcWVtdS1kZXZlbEBub25n
bnUub3JnOwo+IE1heCBSZWl0eiA8bXJlaXR6QHJlZGhhdC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKPiBTdWJqZWN0OiBSZTogW1BBVENIIDA0LzE4XSB4ZW46IGNyZWF0ZSB4
ZW5zdG9yZSBhcmVhcyBmb3IgWGVuRGV2aWNlLXMKPiAKPiBPbiBXZWQsIERlYyAwNSwgMjAxOCBh
dCAxMjo0Mzo1N1BNICswMDAwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPiA+ID4gPiArICAgIHZh
bHVlID0gZ19zdHJkdXBfdnByaW50ZihmbXQsIGFwKTsKPiA+ID4gPgo+ID4gPiA+IExvb2tzIGxp
a2UgZ192YXNwcmludGYoKSB3b3VsZCBiZSBiZXR0ZXIsIHNpbmNlIGl0IHJldHVybnMgdGhlCj4g
bGVuZ2h0IGFzCj4gPiA+ID4gd2VsbC4KPiA+ID4gPgo+ID4gPgo+ID4gPiBZZXMuCj4gPgo+ID4g
SSB0cmllZCB0aGlzIGFuZCBpdCBhcHBlYXJzIG5vdCB0byBleGlzdCBpbiB0aGUgdmVyc2lvbiBv
ZiBnbGliIGluIG15Cj4gZW52aXJvbm1lbnQgc28gSSBndWVzcyBJJ2xsIHN0aWNrIHdpdGggZ19z
dHJkdXBfcHJpbnRmKCkuCj4gCj4gSXQncyBwcm9iYWJseSBiZWNhdXNlIHlvdSBuZWVkIHRvIGlu
Y2x1ZGUgImdsaWIvZ3ByaW50Zi5oIiwgSSd2ZQo+IHN1Z2dlc3RlZCBpdCBiZWNhdXNlIEkndmUg
c2VlbiB0aGUgZnVuY3Rpb24gdXNlIGVsc2V3aGVyZSBpbiBRRU1VLiBCdXQKPiBnX3N0cmR1cF9w
cmludGYgaXMgZmluZSB0b28uCj4gCj4gaHR0cHM6Ly9kZXZlbG9wZXIuZ25vbWUub3JnL2dsaWIv
c3RhYmxlL2dsaWItU3RyaW5nLVV0aWxpdHktCj4gRnVuY3Rpb25zLmh0bWwjZy12YXNwcmludGYK
CkFoLCB0aGF0J3Mgd2hhdCBJIG5lZWRlZC4gVGhhbmtzLAoKICBQYXVsCgo+IAo+IC0tCj4gQW50
aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
