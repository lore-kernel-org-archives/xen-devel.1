From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v1 56/74] xen/pvshim: add grant table
 operations
Date: Wed, 10 Jan 2018 00:28:27 -0700
Message-ID: <5A55CEAB020000780019D12A@prv-mh.provo.novell.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-57-wei.liu2@citrix.com>
 <5A53B63B020000780019C5EC@prv-mh.provo.novell.com>
 <20180109183403.jfehrfhvkd7a2ya5@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=2bb6=ef=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eZAoH-0002oK-M8
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2018 07:28:29 +0000
In-Reply-To: <20180109183403.jfehrfhvkd7a2ya5@MacBook-Pro-de-Roger.local>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, wei.liu2@citrix.com, Anthony Liguori <aliguori@amazon.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjAxLjE4IGF0IDE5OjM0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgSmFuIDA4LCAyMDE4IGF0IDEwOjE5OjM5QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMDQuMDEuMTggYXQgMTQ6MDYsIDx3ZWkubGl1MkBjaXRyaXguY29tPiB3
cm90ZToKPj4gPiArICAgIHsKPj4gPiArICAgICAgICBzdHJ1Y3QgZ250dGFiX3F1ZXJ5X3NpemUg
b3A7Cj4+ID4gKyAgICAgICAgaW50IHJjOwo+PiA+ICsKPj4gPiArICAgICAgICBpZiAoIHVubGlr
ZWx5KGNvcHlfZnJvbV9ndWVzdCgmb3AsIHVvcCwgMSkpICkKPj4gPiArICAgICAgICB7Cj4+ID4g
KyAgICAgICAgICAgIHJjID0gLUVGQVVMVDsKPj4gPiArICAgICAgICAgICAgYnJlYWs7Cj4+ID4g
KyAgICAgICAgfQo+PiA+ICsKPj4gPiArICAgICAgICByYyA9IHhlbl9oeXBlcmNhbGxfZ3JhbnRf
dGFibGVfb3AoR05UVEFCT1BfcXVlcnlfc2l6ZSwgJm9wLCBjb3VudCk7Cj4+ID4gKyAgICAgICAg
aWYgKCByYyApCj4+ID4gKyAgICAgICAgICAgIGJyZWFrOwo+PiA+ICsKPj4gPiArICAgICAgICBp
ZiAoIGNvcHlfdG9fZ3Vlc3QodW9wLCAmb3AsIDEpICkKPj4gCj4+IF9fY29weV90b19ndWVzdCgp
IChhc3N1bWluZyB0aGlzIGNvcGluZyBpbiBhbmQgb3V0IGlzIG5lY2Vzc2FyeQo+PiBpbiB0aGUg
Zmlyc3QgcGxhY2UpLgo+IAo+IEkgZ3Vlc3MgdGhpcyBjb3VsZCBiZSBieXBhc3NlZCBieSBqdXN0
IHVzaW5nIHVvcCBpbnN0ZWFkIG9mIG9wIGluIHRoZQo+IGh5cGVyY2FsbD8KClRoYXQncyBteSBp
bXByZXNzaW9uLCBidXQgeW91IGRvaW5nIHRoZSBjb3B5aW5nIG1hZGUgbWUgYXNzdW1lCnlvdSBt
aWdodCBoYXZlIGZvdW5kIGEgY2FzZSB3aGVyZSB0aGluZ3MgZG9uJ3Qgd29yayB3aXRob3V0CmNv
cHlpbmcuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
