From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] tools/xenstore: Do not abort xenstore-ls if
 a node disappears while iterating
Date: Tue, 5 Mar 2019 17:23:52 +0000
Message-ID: <20190305172352.rep4nyfk4fvl77qg@zion.uk.xensource.com>
References: <936c39728ca0c96d0666551046cf08ebc8774dd8.camel@infradead.org>
 <20190304141848.rohcxuemytrbsyl2@zion.uk.xensource.com>
 <905c9d11bfc33b03e81ef18dbf7a97448038e15f.camel@infradead.org>
 <0bd589fc-dda5-3a9f-4809-29848e9182a0@suse.com>
 <5e63926d91feee534c15b33dd164c46252f31664.camel@infradead.org>
 <20190304154617.gtytkql6e3d4dv33@zion.uk.xensource.com>
 <ffbb62562dbe403f233494da48994f44e6fb9016.camel@infradead.org>
 <20190305170210.wvdjyzsfk7hdowwr@zion.uk.xensource.com>
 <b80ccc60-1d16-b10a-5d77-05e12b7b0484@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Y1m=RI=citrix.com=prvs=960e31256=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h1DnN-0004Fl-GI
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 17:24:01 +0000
Content-Disposition: inline
In-Reply-To: <b80ccc60-1d16-b10a-5d77-05e12b7b0484@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMDUsIDIwMTkgYXQgMDY6MDk6MjdQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAwNS8wMy8yMDE5IDE4OjAyLCBXZWkgTGl1IHdyb3RlOgo+ID4gT24gTW9uLCBN
YXIgMDQsIDIwMTkgYXQgMDQ6NTk6NDJQTSArMDAwMCwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+
ID4+IE9uIE1vbiwgMjAxOS0wMy0wNCBhdCAxNTo0NiArMDAwMCwgV2VpIExpdSB3cm90ZToKPiA+
IFsuLi5dCj4gPj4+IEFsc28geW91IG1lbnRpb25lZCAiYSBub2RlIGRpc2FwcGVhcnMiLCBJIHRo
b3VnaHQgdGhhdCB3YXMgdGhlIGNhc2UgeW91Cj4gPj4+IGNhcmVkIGFib3V0LCBoZW5jZSBteSBz
dWdnZXN0aW9uLgo+ID4+Cj4gPj4gVGhhdCdzIG15IHByaW1hcnkgdXNlIGNhc2UsIHllcy4gT2J2
aW91c2x5IHdlIHNob3VsZCBtYWtlIGl0IGRvIHRoZQo+ID4+IHJpZ2h0IHRoaW5nIGluIHRoZSBn
ZW5lcmFsIGNhc2Ugd2hpbGUgd2UncmUgdGhpbmtpbmcgYWJvdXQgaXQuIEknbQo+ID4+IGluY2xp
bmVkIHRvIGdvIHdpdGggSnVlcmdlbidzIHN1Z2dlc3Rpb24gb2YgaWdub3JpbmcgRU5PRU5UIGFu
ZCBFQUNDRVMKPiA+PiAob3Igc2hvdWxkIHRoYXQgaGF2ZSBiZWVuIEVQRVJNPyksIHlldCBzdGls
bCBhYm9ydGluZyBmb3IgZXZlcnl0aGluZwo+ID4+IGVsc2UuCj4gPj4KPiA+IAo+ID4gSSBjYW4n
dCBzZWVtIHRvIGZpbmQgRUFDQ0VTUyBpbiB4ZW5zdG9yZWQgY29kZSwgYnV0IEkgZG8gZmluZCBF
UEVSTS4KPiA+IEFkZGluZyBFUEVSTSB3b3VsZCBiZSBmaW5lIGJ5IG1lLgo+IAo+IERyb3Agb25l
ICJTIiBmcm9tIEVBQ0NFU1MgYW5kIHlvdSdsbCBzZWUgaXQuCgpPaCB5ZXMuIE15IGJhZC4KCldl
aS4KCj4gCj4gCj4gSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
