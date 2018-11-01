From: Julien Grall <julien.grall@arm.com>
Subject: Re: Does XEN ARM support RTC in domu?
Date: Thu, 1 Nov 2018 21:13:11 +0000
Message-ID: <009ad6b6-f2f3-9e53-6ab4-bb712feb7dfd@arm.com>
References: <AM0PR04MB44819354E4855B72C4C7F82388CD0@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <0c0ce589-d65f-429d-9a2f-dd267b949c29@arm.com>
 <AM0PR04MB44814D7E3A6A14BA18C9A93788CE0@AM0PR04MB4481.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8xl/=nm=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gIKHD-0005eT-SI
 for xen-devel@lists.xenproject.org; Thu, 01 Nov 2018 21:13:15 +0000
In-Reply-To: <AM0PR04MB44814D7E3A6A14BA18C9A93788CE0@AM0PR04MB4481.eurprd04.prod.outlook.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Peng Fan <peng.fan@nxp.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMS8xLzE4IDM6MzcgQU0sIFBlbmcgRmFuIHdyb3RlOgo+IEhpIEp1bGllbiwKCkhpIFBl
bmcsCgoKPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSnVsaWVuIEdyYWxs
IFttYWlsdG86anVsaWVuLmdyYWxsQGFybS5jb21dCj4+IFNlbnQ6IDIwMTjlubQxMeaciDHml6Ug
Mjo1Mgo+PiBUbzogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmc7IFN0ZWZhbm8KPj4gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz4KPj4gU3ViamVjdDogUmU6IERvZXMgWEVOIEFSTSBzdXBwb3J0IFJUQyBpbiBkb211Pwo+
Pgo+Pgo+Pgo+PiBPbiAxMC8zMS8xOCAxOjU3IFBNLCBQZW5nIEZhbiB3cm90ZToKPj4+IEhpIEFs
bCwKPj4KPj4gSGksCj4+Cj4+Pgo+Pj4gSnVzdCBoYXZlIGEgcXVlc3Rpb24sIGRvZXMgWEVOIEFS
TSBzdXBwb3J0IFJUQyBpbiBkb211PyBUbyBzdXBwb3J0IEFuZHJvaWQKPj4gaW4gRG9tVSwgUlRD
IGlzIG5lZWRlZCBmb3IgYWxhcm0sIGJ1dCBJIGRpZCBub3QgZmluZCBpbmZvcm1hdGlvbiBhYm91
dCBSVEMgb24KPj4geGVuIGZvciBkb211LiBTbyB0aGlzIG5lZWQgYSBuZXcgUlRDIHBhcmF2aXJ0
dWFsaXphdGlvbiBkcml2ZXI/IEFueSBzdWdnZXN0aW9ucz8KPj4KPj4gQnkgUlRDLCBkbyB5b3Ug
bWVhbiBSZWFsLVRpbWUgQ2xvY2s/IFNvbWV0aGluZyBsaWtlIFBMMDMxPyBPciBkbyB5b3UgaGF2
ZQo+PiBzb21ldGhpbmcgZWxzZSBpbiBtaW5kPwo+IAo+IFllcywgUmVhbCBUaW1lIENsb2NrIGxp
a2UgUEwwMzEgaW4gRG9tVS4gSSBkbyBub3QgaGF2ZSBhIGdvb2QgaWRlYSBzdXBwb3J0IFJUQyBp
biBBUk0gRG9tVSwKPiBLVk0gYW5kIFhFTiB4ODYgc2VlbXMgdXNlIGVtdWxhdGVkIFJUQyBpbiBx
ZW11LiBUaGlua2luZyBvZiBwYXJhdmlydHVhbCBSVEMsIGFuZCBkb20wCj4gY29udHJvbCB0aGUg
ZXhwaXJlIHRpbWUgZm9yIGFsYXJtLgoKVGhlIFBMMDMxIGlzIHF1aXRlIHNtYWxsIChiYXNlZCBv
biB0aGUgUUVNVSB2ZXJzaW9uKS4gU28gSSB0aGluayBpdCAKd291bGQgYmUgZmluZSB0byBwcm92
aWRlIGFuIGVtdWxhdGlvbiBpbiB0aGUgaHlwZXJ2aXNvci4KCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
