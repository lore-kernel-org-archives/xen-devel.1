From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2] xen-block: handle resize callback
Date: Thu, 31 Jan 2019 15:25:02 +0000
Message-ID: <20190131152502.GG2306@perard.uk.xensource.com>
References: <20190130161948.15888-1-paul.durrant@citrix.com>
 <20190131152042.GF2306@perard.uk.xensource.com>
 <b94b7583a3e14fec9b86a9cec13a1385@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lOgI=QH=citrix.com=prvs=9271d7743=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gpEGM-0007iw-SS
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 15:28:22 +0000
Content-Disposition: inline
In-Reply-To: <b94b7583a3e14fec9b86a9cec13a1385@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMzEsIDIwMTkgYXQgMDM6MjI6MThQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IEFudGhvbnkgUEVS
QVJEIFttYWlsdG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiA+IFNlbnQ6IDMxIEphbnVh
cnkgMjAxOSAxNToyMQo+ID4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5j
b20+Cj4gPiBDYzogcWVtdS1kZXZlbEBub25nbnUub3JnOyBxZW11LWJsb2NrQG5vbmdudS5vcmc7
IHhlbi0KPiA+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBTdGVmYW4gSGFqbm9jemkgPHN0
ZWZhbmhhQHJlZGhhdC5jb20+OyBTdGVmYW5vCj4gPiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPjsgS2V2aW4gV29sZiA8a3dvbGZAcmVkaGF0LmNvbT47IE1heAo+ID4gUmVpdHog
PG1yZWl0ekByZWRoYXQuY29tPgo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0geGVuLWJsb2Nr
OiBoYW5kbGUgcmVzaXplIGNhbGxiYWNrCj4gPiAKPiA+IE9uIFdlZCwgSmFuIDMwLCAyMDE5IGF0
IDA0OjE5OjQ4UE0gKzAwMDAsIFBhdWwgRHVycmFudCB3cm90ZToKPiA+ID4gU29tZSBmcm9udGVu
ZCBkcml2ZXJzIHdpbGwgaGFuZGxlIGR5bmFtaWMgcmVzaXppbmcgb2YgUFYgZGlza3MsIHNvIHNl
dAo+ID4gdXAKPiA+ID4gdGhlIEJsb2NrRGV2T3BzIHJlc2l6ZV9jYigpIG1ldGhvZCBkdXJpbmcg
eGVuX2Jsb2NrX3JlYWxpemUoKSB0byBhbGxvdwo+ID4gPiB0aGlzIHRvIGJlIGRvbmUuCj4gPiA+
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5j
b20+Cj4gPiA+IC0tLQo+ID4gCj4gPiAKPiA+ID4gKyAgICAvKgo+ID4gPiArICAgICAqIE1pbWlj
IHRoZSBiZWhhdmlvdXIgb2YgTGludXggeGVuLWJsa2JhY2sgYW5kIHJlLXdyaXRlIHRoZSBzdGF0
ZQo+ID4gPiArICAgICAqIHRvIHRyaWdnZXIgdGhlIGZyb250ZW5kIHdhdGNoLgo+ID4gPiArICAg
ICAqLwo+ID4gPiArICAgIHhlbl9kZXZpY2VfYmFja2VuZF9zZXRfc3RhdGUoeGVuZGV2LCBiYWNr
ZW5kX3N0YXRlKTsKPiA+IAo+ID4gOigsIHRoYXQgZnVuY3Rpb24gZG9lc24ndCB3cml0ZSB0aGUg
c3RhdGUgYWdhaW4gaWYgaXQgaGFzbid0IGNoYW5nZWQuCj4gPiBTbyBpbiBteSB0ZXN0aW5nLCBM
aW51eCBuZXZlciBkaWQgYW55dGhpbmcuCj4gCj4gR2FoISBJIGZvcmdvdCBhYm91dCB0aGF0LiBB
bHJpZ2h0LCBpdCdzIGdvaW5nIHRvIGhhdmUgdG8gYmUgYSBiaXQgbW9yZSBjcnVkZS4KCm1vcmUg
Y3J1ZGUgPiBZZXMsIEkgdHJpZWQgdG8gaWdub3JlIHRoZSBjaGVjayBpbiBfc2V0X3N0YXRlIGFu
ZCBlbmQtdXAKd2l0aCBhbiBpbmZpbml0IGxvb3AuCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
