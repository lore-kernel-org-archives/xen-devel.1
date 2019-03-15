From: Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-devel] [Qemu-block] [PATCH] xen-block:
 Replace qdict_put_obj() by qdict_put() where appropriate
Date: Fri, 15 Mar 2019 15:46:19 +0100
Message-ID: <87o96cjiv8.fsf@dusky.pond.sub.org>
References: <20190313174433.12966-1-armbru@redhat.com>
 <20190314143808.GB17866@linux.fritz.box>
 <87ef795lcv.fsf@dusky.pond.sub.org>
 <20190315105309.GE11621@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ln85=RS=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1h4o6K-0006ts-2W
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 14:46:24 +0000
In-Reply-To: <20190315105309.GE11621@perard.uk.xensource.com> (Anthony
 PERARD's message of "Fri, 15 Mar 2019 10:53:09 +0000")
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, sstabellini@kernel.org, qemu-block@nongnu.org, qemu-devel@nongnu.org, paul.durrant@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+IHdyaXRlczoKCj4gT24g
VGh1LCBNYXIgMTQsIDIwMTkgYXQgMDg6MDQ6MDBQTSArMDEwMCwgTWFya3VzIEFybWJydXN0ZXIg
d3JvdGU6Cj4+IEtldmluIFdvbGYgPGt3b2xmQHJlZGhhdC5jb20+IHdyaXRlczoKPj4gCj4+ID4g
QW0gMTMuMDMuMjAxOSB1bSAxODo0NCBoYXQgTWFya3VzIEFybWJydXN0ZXIgZ2VzY2hyaWViZW46
Cj4+ID4+IFBhdGNoIGNyZWF0ZWQgbWVjaGFuaWNhbGx5IGJ5IHJlcnVubmluZzoKPj4gPj4gCj4+
ID4+ICAgICAkIHNwYXRjaCAtLXNwLWZpbGUgc2NyaXB0cy9jb2NjaW5lbGxlL3FvYmplY3QuY29j
Y2kgXAo+PiA+PiAgICAgICAgICAgICAgLS1tYWNyby1maWxlIHNjcmlwdHMvY29jY2ktbWFjcm8t
ZmlsZS5oIFwKPj4gPj4gICAgICAgICAgICAgIC0tZGlyIGh3L2Jsb2NrIC0taW4tcGxhY2UKPj4g
Pj4gCj4+ID4+IFNpZ25lZC1vZmYtYnk6IE1hcmt1cyBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0
LmNvbT4KPj4gPgo+PiA+IFJldmlld2VkLWJ5OiBLZXZpbiBXb2xmIDxrd29sZkByZWRoYXQuY29t
Pgo+PiAKPj4gVGhhbmtzIQo+PiAKPj4gPiBXaGljaCB0cmVlIHNob3VsZCB0aGlzIGdvIHRocm91
Z2g/IFRoZSBYZW4gb25lPwo+PiAKPj4gRmluZSB3aXRoIG1lLiAgSSBjb3VsZCBhbHNvIGluY2x1
ZGUgaXQgaW4gYSAibWlzY2VsbGFuZW91cyBjbGVhbnVwIiBwdWxsCj4+IHJlcXVlc3QgYWxvbmcg
d2l0aCBvdGhlciBjbGVhbnVwIHBhdGNoZXMgSSBnb3QgaW4gZmxpZ2h0Lgo+Cj4gTWFya3VzLCBJ
IGRvbid0IGhhdmUgYW55IG90aGVyIFhlbiBwYXRjaGVzLCBzbyBjb3VsZCB5b3UgaW5jbHVkZSB0
aGlzCj4gb25lIGluIHlvdXIgcHVsbCByZXF1ZXN0PwoKU3VyZSEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
