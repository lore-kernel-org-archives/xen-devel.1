From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 06/16] x86/amd: call post outb hook for
 both PV and HVM
Date: Mon, 29 Oct 2018 08:00:37 -0600
Message-ID: <5BD7128502000078001F5D49@prv1-mh.provo.novell.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <a1bbfcc3bf759669a53c5ef739ab67d01187f892.1539959287.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=m5uw=nj=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gH85z-0003T8-EA
 for xen-devel@lists.xenproject.org; Mon, 29 Oct 2018 14:00:43 +0000
In-Reply-To: <a1bbfcc3bf759669a53c5ef739ab67d01187f892.1539959287.git-series.wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjEwLjE4IGF0IDE2OjI4LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2FyY2gveDg2L2h2bS9pby5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9pby5j
Cj4gQEAgLTIzNCw2ICsyMzQsOCBAQCBzdGF0aWMgaW50IGcybV9wb3J0aW9fd3JpdGUoY29uc3Qg
c3RydWN0IGh2bV9pb19oYW5kbGVyICpoYW5kbGVyLAo+ICAgICAgewo+ICAgICAgY2FzZSAxOgo+
ICAgICAgICAgIG91dGIoZGF0YSwgbXBvcnQpOwo+ICsgICAgICAgIGlmICggcG9zdF9vdXRiX2hv
b2sgKQo+ICsgICAgICAgICAgICBwb3N0X291dGJfaG9vayhtcG9ydCwgKHVpbnQ4X3QpZGF0YSk7
CgpQb2ludGxlc3MgY2FzdC4gSSBub3RpY2UgLi4uCgo+IEBAIC0zNTIsOCArMzUwLDggQEAgc3Rh
dGljIHZvaWQgZ3Vlc3RfaW9fd3JpdGUodW5zaWduZWQgaW50IHBvcnQsIHVuc2lnbmVkIGludCBi
eXRlcywKPiAgICAgICAgICB7Cj4gICAgICAgICAgY2FzZSAxOgo+ICAgICAgICAgICAgICBvdXRi
KCh1aW50OF90KWRhdGEsIHBvcnQpOwo+IC0gICAgICAgICAgICBpZiAoIHB2X3Bvc3Rfb3V0Yl9o
b29rICkKPiAtICAgICAgICAgICAgICAgIHB2X3Bvc3Rfb3V0Yl9ob29rKHBvcnQsICh1aW50OF90
KWRhdGEpOwo+ICsgICAgICAgICAgICBpZiAoIHBvc3Rfb3V0Yl9ob29rICkKPiArICAgICAgICAg
ICAgICAgIHBvc3Rfb3V0Yl9ob29rKHBvcnQsICh1aW50OF90KWRhdGEpOwoKLi4uIG9uZSBoYXMg
YmVlbiBwcmVzZW50IGhlcmUgKHdoaWNoIHNob3VsZCBiZSBkcm9wcGVkIGluc3RlYWQpCmFuZCAu
Li4KCj4gQEAgLTQzMyw4ICs0MzEsOCBAQCBzdGF0aWMgaW50IHdyaXRlX2lvKHVuc2lnbmVkIGlu
dCBwb3J0LCB1bnNpZ25lZCBpbnQgYnl0ZXMsCj4gICAgICAgICAgICAgIGlvX2VtdWxfc3R1Yl9z
ZXR1cChwb2MsIGN0eHQtPm9wY29kZSwgcG9ydCwgYnl0ZXMpOwo+ICAKPiAgICAgICAgICBpb19l
bXVsKGN0eHQtPnJlZ3MpOwo+IC0gICAgICAgIGlmICggKGJ5dGVzID09IDEpICYmIHB2X3Bvc3Rf
b3V0Yl9ob29rICkKPiAtICAgICAgICAgICAgcHZfcG9zdF9vdXRiX2hvb2socG9ydCwgdmFsKTsK
PiArICAgICAgICBpZiAoIChieXRlcyA9PSAxKSAmJiBwb3N0X291dGJfaG9vayApCj4gKyAgICAg
ICAgICAgIHBvc3Rfb3V0Yl9ob29rKHBvcnQsIHZhbCk7CgouLi4gbm9uZSBoYXMgYmVlbiBwcmVz
ZW50IGhlcmUuCgpIb3dldmVyLCBsb29raW5nIGF0IFJvZ2VyJ3MgYXBwcm9hY2ggaW4gImFtZC9w
dmg6IGVuYWJsZSBBQ1BJIEMxRQpkaXNhYmxlIHF1aXJrIG9uIFBWSCBEb20wIiBJIHdvbmRlciBp
ZiBleGVjdXRpb24gd291bGQgZXZlciBtYWtlIGl0CnRvIGcybV9wb3J0aW9fd3JpdGUoKSBmb3Ig
RG9tMCAtIGcybV9pb3BvcnRfbGlzdCBnZXRzIGFkZGVkIHRvIGZyb20KYSBkb21jdGwgb25seSBh
ZmFpY3MuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
