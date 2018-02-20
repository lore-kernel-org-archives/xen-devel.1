From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 3/4] x86: fix indirect thunk usage of
 CONFIG_INDIRECT_THUNK
Date: Tue, 20 Feb 2018 12:42:26 +0000
Message-ID: <20180220124226.iqamqhek3lgkxlad@MacBook-Pro-de-Roger.local>
References: <20180219141620.20008-1-roger.pau@citrix.com>
 <20180219141620.20008-4-roger.pau@citrix.com>
 <5A8BF53C02000078001A97CE@prv-mh.provo.novell.com>
 <20180220101916.ve5gcjq6c53tkiey@MacBook-Pro-de-Roger.local>
 <20180220110108.tsekpststokuw5mo@MacBook-Pro-de-Roger.local>
 <5A8C10F602000078001A9895@prv-mh.provo.novell.com>
 <20180220112231.o56tu5issvljuxxn@MacBook-Pro-de-Roger.local>
 <5A8C236102000078001A994B@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=6c15=fo=citrix.com=prvs=582a52a2f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eo7Fo-0008VF-14
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2018 12:42:40 +0000
Content-Disposition: inline
In-Reply-To: <5A8C236102000078001A994B@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMjAsIDIwMTggYXQgMDU6MzI6MTdBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIwLjAyLjE4IGF0IDEyOjIyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gVHVlLCBGZWIgMjAsIDIwMTggYXQgMDQ6MTM6NDJBTSAtMDcwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDIwLjAyLjE4IGF0IDEyOjAxLCA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4+ID4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9hc21fZGVm
bnMuaAo+ID4+ID4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9hc21fZGVmbnMuaAo+ID4+ID4g
QEAgLTE1LDYgKzE1LDkgQEAKPiA+PiA+ICAjaW5jbHVkZSA8YXNtL2FsdGVybmF0aXZlLmg+Cj4g
Pj4gPiAKPiA+PiA+ICAjaWZkZWYgX19BU1NFTUJMWV9fCj4gPj4gPiArI2lmbmRlZiBDT05GSUdf
SU5ESVJFQ1RfVEhVTksKPiA+PiA+ICsuZXF1IENPTkZJR19JTkRJUkVDVF9USFVOSywgMAo+ID4+
ID4gKyNlbmRpZgo+ID4+ID4gICMgaW5jbHVkZSA8YXNtL2luZGlyZWN0X3RodW5rX2FzbS5oPgo+
ID4+ID4gICNlbHNlCj4gPj4gPiAgYXNtICggIlx0LmVxdSBDT05GSUdfSU5ESVJFQ1RfVEhVTkss
ICIKPiA+PiA+IAo+ID4+ID4gSXQncyBmYWlybHkgc2ltaWxhciB0byBteSBmaXJzdCBhcHByb2Fj
aCwgYnV0IGF0IGxlYXN0ICIjaWZkZWYKPiA+PiA+IENPTkZJR19JTkRJUkVDVF9USFVOSyIgd2ls
bCBzdGlsbCB3b3JrIGFzIGV4cGVjdGVkIGFmdGVyIHRoaXMgZml4Lgo+ID4+IAo+ID4+IEkndmUg
dXNlZCBzb21ldGhpbmcgc2ltaWxhciBpbiBiYWNrcG9ydHMgdG8gb2xkIHZlcnNpb25zLCBzbyBJ
Cj4gPj4gd29uZGVyIHdoZXRoZXIgd2hhdCB5b3UgcXVvdGUgYWJvdmUgaXMgcmlnaHQ6IEFzc2Vt
Ymx5IGZpbGVzCj4gPj4gZG9uJ3QgZ2V0IGhhbmRlZCB0byBjbGFuZyBhbnl3YXkgaWlyYywgc28g
dGhlIGNoYW5nZSB3b3VsZAo+ID4+IHNlZW0gdG8gYmUgbmVlZGVkIGluIHRoZSAjZWxzZSBwYXJ0
IG9mIHRoZSBjb25kaXRpb25hbC4KPiA+IAo+ID4gQXNzZW1ibHkgZmlsZXMgZG8gZ2V0IGhhbmRl
ZCB0byBjbGFuZywgZnJvbSB4ZW4vUnVsZXMubWs6Cj4gPiAKPiA+ICUubzogJS5TIE1ha2VmaWxl
Cj4gPiAJJChDQykgJChBRkxBR1MpIC1jICQ8IC1vICRACj4gPiAKPiA+IFhlbiBkb2Vzbid0IGNh
bGwgYXMgZGlyZWN0bHkgdG8gY29tcGlsZSB0aG9zZSwgb3IgYW0gSSBtaXNzaW5nCj4gPiBzb21l
dGhpbmc/Cj4gCj4gT2gsIEkgd2FzIHJlZmVycmluZyB0byB0aGUgLW1uby1pbnRlZ3JhdGVkLWFz
IChvciB3aGF0ZXZlciBpdCdzCj4gY2FsbGVkKSBvcHRpb24uICJIYW5kZWQgdG8gY2xhbmciIHdh
c24ndCB0aGUgYmVzdCB3YXkgdG8gcHV0IGl0LAo+IEkgYWdyZWUuIEJ1dCBpdCdzIGNsYW5nJ3Mg
aW50ZWdyYXRlZCBhc3NlbWJsZXIgd2hpY2ggdGhlIHByb2JsZW0KPiBpcyB3aXRoLgoKT2gsIEkg
c2VlLiBZb3UgYXJlIHJpZ2h0LCB0aGlzIGlzIGp1c3QgYSBwcmVwYXJhdG9yeSBjaGFuZ2UgZm9y
IHBhdGNoCjQsIHdoaWNoIGRvZXMgZW5hYmxlIGNsYW5nJ3MgaW50ZWdyYXRlZCBhc3NlbWJsZXIg
aWYgdGhlIHJpZ2h0CmZlYXR1cmVzIGFyZSBwcmVzZW50LgoKTGV0IG1lIGtub3cgaWYgeW91IHRo
aW5rIHRoZSBhYm92ZSBjaHVuayBpcyBhY2NlcHRhYmxlLgoKVGhhbmtzLCBSb2dlci4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
