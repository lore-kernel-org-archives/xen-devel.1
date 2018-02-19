From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 1/4] build: filter out command line
	assembler arguments
Date: Mon, 19 Feb 2018 16:17:54 +0000
Message-ID: <20180219161754.kxjvbhkjiqvm4x2y@MacBook-Pro-de-Roger.local>
References: <20180219141620.20008-1-roger.pau@citrix.com>
 <20180219141620.20008-2-roger.pau@citrix.com>
 <5A8AFEC702000078001A92E3@prv-mh.provo.novell.com>
 <20180219160535.hig6co3wiqmiqa6w@MacBook-Pro-de-Roger.local>
 <5A8B05F602000078001A9378@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fu7w=fn=citrix.com=prvs=5814e79b2=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eno8l-0004De-Sl
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2018 16:18:07 +0000
Content-Disposition: inline
In-Reply-To: <5A8B05F602000078001A9378@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBGZWIgMTksIDIwMTggYXQgMDk6MTQ6MzBBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE5LjAyLjE4IGF0IDE3OjA1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gTW9uLCBGZWIgMTksIDIwMTggYXQgMDg6NDM6NTFBTSAtMDcwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDE5LjAyLjE4IGF0IDE1OjE2LCA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4+ID4gLS0tCj4gPj4gPiAgeGVuL2FyY2gveDg2L01ha2VmaWxl
IHwgNiArKystLS0KPiA+PiA+ICB4ZW4vYXJjaC94ODYvUnVsZXMubWsgfCA1ICstLS0tCj4gPj4g
PiAgeGVuL2luY2x1ZGUvTWFrZWZpbGUgIHwgMiArLQo+ID4+ID4gIDMgZmlsZXMgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+ID4+IAo+ID4+IFdoYXQgYWJvdXQgdGhl
ICIlLmk6ICUuYyIsICIlLnM6ICUuYyIsIGFuZCAiJS5zOiAlLlMiIHJ1bGVzCj4gPj4gbmVhciB0
aGUgZW5kIG9mIHhlbi9SdWxlcy5taz8KPiA+IAo+ID4gSG0sIHRob3NlIHJ1bGVzIGRvbid0IHNl
ZW0gdG8gYmUgdXNlZCBhdCBhbGwgaW4geDg2LCBhcmUgdGhleSBub3QKPiA+IG5lZWRlZCBhbnlt
b3JlIGJlY2F1c2UgdGhlcmUgYXJlIG1vcmUgc3BlY2lmaWMgcnVsZXMgaW5zdGVhZD8KPiA+IAo+
ID4gSSBjYW4gYWRkIHRoZSBmaWx0ZXJpbmcgdGhlcmUsIGJ1dCBtYXliZSBpdCB3b3VsZCBiZSBi
ZXR0ZXIgdG8gc2ltcGx5Cj4gPiByZW1vdmUgdGhvc2U/Cj4gCj4gTm8sIGRvbid0LCBldmVyLiBU
aGV5J3JlIG5vdCBuZWVkZWQgZm9yIGEgX25vcm1hbF8gYnVpbGQsIGJ1dCBpbiBjYXNlCj4gb2Yg
YnVpbGQgcHJvYmxlbXMgdGhleSBtYXkgYmUgbmVlZGVkIGZvciBhbmFseXppbmcgdGhlIGlzc3Vl
LCBpLmUuCj4gd2hlbiB5b3UgbmVlZCB0byBsb29rIGF0IG9uZSBvZiB0aGUgaW50ZXJtZWRpYXRl
IGZpbGVzLiBJIGhhcHBlbiB0bwo+IHVzZSB0aGlzIGV2ZXJ5IG9uY2UgaW4gYSB3aGlsZSwgZXNw
ZWNpYWxseSB3aGVuIG1hY3JvIGludm9jYXRpb25zCj4gbmVzdCBzbyBkZWVwbHkgdGhhdCB0aGUg
Y29tcGlsZXIgZG9lc24ndCBwcm9kdWNlIHVzZWZ1bCBsb2NhdGlvbgo+IGluZm9ybWF0aW9uIGFu
eW1vcmUuCgpPaCwgT0ssIHRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24uIEknbSBhZGRpbmcg
dGhlIGZpbHRlcmluZyB0aGVyZQp0aGVuLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
