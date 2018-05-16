From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v3 4/8] xen_backend: add an emulation of
 grant copy
Date: Wed, 16 May 2018 14:34:18 +0000
Message-ID: <e329750eb00e48b7882aeb8a30b78412@AMSPEX02CL03.citrite.net>
References: <1525461967-32174-1-git-send-email-paul.durrant@citrix.com>
 <1525461967-32174-5-git-send-email-paul.durrant@citrix.com>
 <20180516143032.GI2057@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=buvh=id=citrix.com=prvs=66789f4f5=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fIxWa-0007UO-3Z
 for xen-devel@lists.xenproject.org; Wed, 16 May 2018 14:35:28 +0000
In-Reply-To: <20180516143032.GI2057@perard.uk.xensource.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIFttYWls
dG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiBTZW50OiAxNiBNYXkgMjAxOCAxNTozMQo+
IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPgo+IENjOiB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IHFlbXUtYmxvY2tAbm9uZ251Lm9yZzsgcWVtdS0KPiBk
ZXZlbEBub25nbnUub3JnOyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyA0LzhdIHhlbl9iYWNrZW5kOiBhZGQgYW4gZW11
bGF0aW9uIG9mIGdyYW50IGNvcHkKPiAKPiBPbiBGcmksIE1heSAwNCwgMjAxOCBhdCAwODoyNjow
M1BNICswMTAwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPiBOb3QgYWxsIFhlbiBlbnZpcm9ubWVu
dHMgc3VwcG9ydCB0aGUgeGVuZ250dGFiX2dyYW50X2NvcHkoKSBvcGVyYXRpb24uCj4gPiBFLmcu
IHdoZXJlIHRoZSBPUyBpcyBGcmVlQlNEIG9yIFhlbiBpcyBvbGRlciB0aGFuIDQuOC4wLgo+ID4K
PiA+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhbiBlbXVsYXRpb24gb2YgdGhhdCBvcGVyYXRpb24g
dXNpbmcKPiA+IHhlbmdudHRhYl9tYXBfZG9tYWluX2dyYW50X3JlZnMoKSBhbmQgbWVtY3B5KCkg
Zm9yIHRob3NlCj4gZW52aXJvbm1lbnRzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVy
cmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gPiAtLS0KPiAKPiBUaGUgcGF0Y2ggbG9v
a3Mgb2ssIGJ1dCBzaW5jZSBwYXRjaCAxIGlzIGdvaW5nIHRvIGJlIGNoYW5nZSwgdGhpcyBvbmUg
aXMKPiBnb2luZyB0byBuZWVkIHRvIGJlIGNoYW5nZSBhcyB3ZWxsLgo+IAoKU3VyZS4gVGhhbmtz
IGZvciB0aGUgcmV2aWV3LgoKICBQYXVsCgo+IC0tCj4gQW50aG9ueSBQRVJBUkQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
