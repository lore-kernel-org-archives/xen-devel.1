From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 1/4] build: filter out command line
 assembler arguments
Date: Mon, 19 Feb 2018 09:14:30 -0700
Message-ID: <5A8B05F602000078001A9378@prv-mh.provo.novell.com>
References: <20180219141620.20008-1-roger.pau@citrix.com>
 <20180219141620.20008-2-roger.pau@citrix.com>
 <5A8AFEC702000078001A92E3@prv-mh.provo.novell.com>
 <20180219160535.hig6co3wiqmiqa6w@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=udnn=fn=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eno5S-0003xJ-DH
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2018 16:14:42 +0000
In-Reply-To: <20180219160535.hig6co3wiqmiqa6w@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjAyLjE4IGF0IDE3OjA1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgRmViIDE5LCAyMDE4IGF0IDA4OjQzOjUxQU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTkuMDIuMTggYXQgMTU6MTYsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gLS0tCj4+ID4gIHhlbi9hcmNoL3g4Ni9NYWtlZmlsZSB8IDYgKysrLS0tCj4+
ID4gIHhlbi9hcmNoL3g4Ni9SdWxlcy5tayB8IDUgKy0tLS0KPj4gPiAgeGVuL2luY2x1ZGUvTWFr
ZWZpbGUgIHwgMiArLQo+PiA+ICAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgOCBk
ZWxldGlvbnMoLSkKPj4gCj4+IFdoYXQgYWJvdXQgdGhlICIlLmk6ICUuYyIsICIlLnM6ICUuYyIs
IGFuZCAiJS5zOiAlLlMiIHJ1bGVzCj4+IG5lYXIgdGhlIGVuZCBvZiB4ZW4vUnVsZXMubWs/Cj4g
Cj4gSG0sIHRob3NlIHJ1bGVzIGRvbid0IHNlZW0gdG8gYmUgdXNlZCBhdCBhbGwgaW4geDg2LCBh
cmUgdGhleSBub3QKPiBuZWVkZWQgYW55bW9yZSBiZWNhdXNlIHRoZXJlIGFyZSBtb3JlIHNwZWNp
ZmljIHJ1bGVzIGluc3RlYWQ/Cj4gCj4gSSBjYW4gYWRkIHRoZSBmaWx0ZXJpbmcgdGhlcmUsIGJ1
dCBtYXliZSBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gc2ltcGx5Cj4gcmVtb3ZlIHRob3NlPwoKTm8s
IGRvbid0LCBldmVyLiBUaGV5J3JlIG5vdCBuZWVkZWQgZm9yIGEgX25vcm1hbF8gYnVpbGQsIGJ1
dCBpbiBjYXNlCm9mIGJ1aWxkIHByb2JsZW1zIHRoZXkgbWF5IGJlIG5lZWRlZCBmb3IgYW5hbHl6
aW5nIHRoZSBpc3N1ZSwgaS5lLgp3aGVuIHlvdSBuZWVkIHRvIGxvb2sgYXQgb25lIG9mIHRoZSBp
bnRlcm1lZGlhdGUgZmlsZXMuIEkgaGFwcGVuIHRvCnVzZSB0aGlzIGV2ZXJ5IG9uY2UgaW4gYSB3
aGlsZSwgZXNwZWNpYWxseSB3aGVuIG1hY3JvIGludm9jYXRpb25zCm5lc3Qgc28gZGVlcGx5IHRo
YXQgdGhlIGNvbXBpbGVyIGRvZXNuJ3QgcHJvZHVjZSB1c2VmdWwgbG9jYXRpb24KaW5mb3JtYXRp
b24gYW55bW9yZS4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
