From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [Qemu-devel] [Qemu-block] [PATCH] xen-block:
 Replace qdict_put_obj() by qdict_put() where appropriate
Date: Fri, 15 Mar 2019 10:53:09 +0000
Message-ID: <20190315105309.GE11621@perard.uk.xensource.com>
References: <20190313174433.12966-1-armbru@redhat.com>
 <20190314143808.GB17866@linux.fritz.box> <87ef795lcv.fsf@dusky.pond.sub.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bsd1=RS=citrix.com=prvs=970908fcc=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1h4kSg-0006ff-6a
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 10:53:14 +0000
Content-Disposition: inline
In-Reply-To: <87ef795lcv.fsf@dusky.pond.sub.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, sstabellini@kernel.org, qemu-block@nongnu.org, qemu-devel@nongnu.org, paul.durrant@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXIgMTQsIDIwMTkgYXQgMDg6MDQ6MDBQTSArMDEwMCwgTWFya3VzIEFybWJydXN0
ZXIgd3JvdGU6Cj4gS2V2aW4gV29sZiA8a3dvbGZAcmVkaGF0LmNvbT4gd3JpdGVzOgo+IAo+ID4g
QW0gMTMuMDMuMjAxOSB1bSAxODo0NCBoYXQgTWFya3VzIEFybWJydXN0ZXIgZ2VzY2hyaWViZW46
Cj4gPj4gUGF0Y2ggY3JlYXRlZCBtZWNoYW5pY2FsbHkgYnkgcmVydW5uaW5nOgo+ID4+IAo+ID4+
ICAgICAkIHNwYXRjaCAtLXNwLWZpbGUgc2NyaXB0cy9jb2NjaW5lbGxlL3FvYmplY3QuY29jY2kg
XAo+ID4+ICAgICAgICAgICAgICAtLW1hY3JvLWZpbGUgc2NyaXB0cy9jb2NjaS1tYWNyby1maWxl
LmggXAo+ID4+ICAgICAgICAgICAgICAtLWRpciBody9ibG9jayAtLWluLXBsYWNlCj4gPj4gCj4g
Pj4gU2lnbmVkLW9mZi1ieTogTWFya3VzIEFybWJydXN0ZXIgPGFybWJydUByZWRoYXQuY29tPgo+
ID4KPiA+IFJldmlld2VkLWJ5OiBLZXZpbiBXb2xmIDxrd29sZkByZWRoYXQuY29tPgo+IAo+IFRo
YW5rcyEKPiAKPiA+IFdoaWNoIHRyZWUgc2hvdWxkIHRoaXMgZ28gdGhyb3VnaD8gVGhlIFhlbiBv
bmU/Cj4gCj4gRmluZSB3aXRoIG1lLiAgSSBjb3VsZCBhbHNvIGluY2x1ZGUgaXQgaW4gYSAibWlz
Y2VsbGFuZW91cyBjbGVhbnVwIiBwdWxsCj4gcmVxdWVzdCBhbG9uZyB3aXRoIG90aGVyIGNsZWFu
dXAgcGF0Y2hlcyBJIGdvdCBpbiBmbGlnaHQuCgpNYXJrdXMsIEkgZG9uJ3QgaGF2ZSBhbnkgb3Ro
ZXIgWGVuIHBhdGNoZXMsIHNvIGNvdWxkIHlvdSBpbmNsdWRlIHRoaXMKb25lIGluIHlvdXIgcHVs
bCByZXF1ZXN0PwoKVGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
