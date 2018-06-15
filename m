From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [RFC] xen: Don't use
 memory_region_init_ram_nomigrate() in pci_assign_dev_load_option_rom()
Date: Fri, 15 Jun 2018 15:42:21 +0100
Message-ID: <20180615144221.GD2165@perard.uk.xensource.com>
References: <20180601175910.28146-1-peter.maydell@linaro.org>
 <20180605165507.GB2165@perard.uk.xensource.com>
 <CAFEAcA_X2V-YkM1ZeCHMPW3cQBk2=ZQ4BAgtcg67Eb+OuADbgQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rb1j=jb=citrix.com=prvs=697eeffb9=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fTpvm-0000ej-19
 for xen-devel@lists.xenproject.org; Fri, 15 Jun 2018 14:42:26 +0000
Content-Disposition: inline
In-Reply-To: <CAFEAcA_X2V-YkM1ZeCHMPW3cQBk2=ZQ4BAgtcg67Eb+OuADbgQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>, "patches@linaro.org" <patches@linaro.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKdW4gMTUsIDIwMTggYXQgMTE6MDY6NDdBTSArMDEwMCwgUGV0ZXIgTWF5ZGVsbCB3
cm90ZToKPiBPbiA1IEp1bmUgMjAxOCBhdCAxNzo1NSwgQW50aG9ueSBQRVJBUkQgPGFudGhvbnku
cGVyYXJkQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gT24gRnJpLCBKdW4gMDEsIDIwMTggYXQgMDY6
NTk6MTBQTSArMDEwMCwgUGV0ZXIgTWF5ZGVsbCB3cm90ZToKPiA+PiBUaGUgeGVuIHBjaV9hc3Np
Z25fZGV2X2xvYWRfb3B0aW9uX3JvbSgpIGN1cnJlbnRseSBjcmVhdGVzIGEgUkFNCj4gPj4gbWVt
b3J5IHJlZ2lvbiB3aXRoIG1lbW9yeV9yZWdpb25faW5pdF9yYW1fbm9taWdyYXRlKCksIGFuZCB0
aGVuCj4gPj4gbWFudWFsbHkgcmVnaXN0ZXJzIGl0IHdpdGggdm1zdGF0ZV9yZWdpc3Rlcl9yYW0o
KS4gSW4gZmFjdCBmb3IKPiA+PiBpdHMgb25seSBjYWxsc2l0ZSwgdGhlICdvd25lcicgcG9pbnRl
ciB3ZSB1c2UgZm9yIHRoZSBpbml0IGNhbGwKPiA+PiBhbmQgdGhlICcmZGV2LT5xZGV2JyBwb2lu
dGVyIHdlIHVzZSBmb3IgdGhlIHZtc3RhdGVfcmVnaXN0ZXJfcmFtKCkKPiA+PiBjYWxsIHJlZmVy
IHRvIHRoZSBzYW1lIG9iamVjdC4gU2ltcGxpZnkgdGhlIGZ1bmN0aW9uIHRvIG9ubHkKPiA+PiB0
YWtlIGEgcG9pbnRlciB0byB0aGUgZGV2aWNlIG9uY2UgaW5zdGVhZCBvZiB0d2ljZSwgYW5kIHVz
ZQo+ID4+IG1lbW9yeV9yZWdpb25faW5pdF9yYW0oKSB3aGljaCBhdXRvbWF0aWNhbGx5IGRvZXMg
dGhlIHZtc3RhdGUKPiA+PiByZWdpc3RlciBmb3IgdXMuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5
OiBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+Cj4gPj4gLS0tCj4gPj4g
VGhpcyBpcyBhIGZhaXJseSB0cml2aWFsIG5vLWJlaGF2aW91ci1jaGFuZ2UgY29kZSBjbGVhbnVw
LCBidXQKPiA+PiBJJ3ZlIG1hcmtlZCBpdCBhcyBSRkMgYmVjYXVzZSBJIGRvbid0IGhhdmUgYSBz
ZXR1cCBmb3IgZG9pbmcKPiA+PiBtb3JlIHRoYW4ganVzdCBjb21waWxlLXRlc3RpbmcgWGVuIHJl
bGF0ZWQgcGF0Y2hlcy4KPiA+PiBUaGlzIHdhcyBmb3VuZCBhcyBwYXJ0IG9mIGEgc3dlZXAgdGhy
b3VnaCBmb3IgY29kZSB1c2luZwo+ID4+IHRoZSBfbm9taWdyYXRlIHZlcnNpb25zIG9mIGZ1bmN0
aW9ucy4KPiA+Cj4gPiBUaGF0IHBhdGNoIGxvb2tzIGZpbmUsIGFuZCBzZWFtcyBmaW5lIGFmdGVy
IGhhY2tpbmcgbXkgd2F5IGludG8gdGVzdGluZwo+ID4gdGhlIGNoYW5nZS4KPiA+Cj4gPiBBY2tl
ZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gCj4gVGhh
bmtzIGZvciB0aGUgcmV2aWV3LiBTdGVmYW5vLCBkbyB5b3Ugd2FudCB0byB0YWtlIGl0IHZpYSB0
aGUKPiB4ZW4gc3VidHJlZT8KCkhpIFBldGVyLAoKV2UgZG9uJ3QgaGF2ZSBhbnkgb3RoZXIgcGF0
Y2ggZm9yIHhlbiwgc28gZmVlbCBmcmVlIHRvIGNvbW1pdCB0aGlzCm9uZS4KCi0tIApBbnRob255
IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
