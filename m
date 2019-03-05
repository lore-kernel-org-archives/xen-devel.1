From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/xenstore: Do not abort xenstore-ls if
 a node disappears while iterating
Date: Tue, 5 Mar 2019 18:09:27 +0100
Message-ID: <b80ccc60-1d16-b10a-5d77-05e12b7b0484@suse.com>
References: <936c39728ca0c96d0666551046cf08ebc8774dd8.camel@infradead.org>
 <20190304141848.rohcxuemytrbsyl2@zion.uk.xensource.com>
 <905c9d11bfc33b03e81ef18dbf7a97448038e15f.camel@infradead.org>
 <0bd589fc-dda5-3a9f-4809-29848e9182a0@suse.com>
 <5e63926d91feee534c15b33dd164c46252f31664.camel@infradead.org>
 <20190304154617.gtytkql6e3d4dv33@zion.uk.xensource.com>
 <ffbb62562dbe403f233494da48994f44e6fb9016.camel@infradead.org>
 <20190305170210.wvdjyzsfk7hdowwr@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rV4c=RI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h1DZK-0002mF-QZ
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 17:09:30 +0000
In-Reply-To: <20190305170210.wvdjyzsfk7hdowwr@zion.uk.xensource.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, David Woodhouse <dwmw2@infradead.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDMvMjAxOSAxODowMiwgV2VpIExpdSB3cm90ZToKPiBPbiBNb24sIE1hciAwNCwgMjAx
OSBhdCAwNDo1OTo0MlBNICswMDAwLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6Cj4+IE9uIE1vbiwg
MjAxOS0wMy0wNCBhdCAxNTo0NiArMDAwMCwgV2VpIExpdSB3cm90ZToKPiBbLi4uXQo+Pj4gQWxz
byB5b3UgbWVudGlvbmVkICJhIG5vZGUgZGlzYXBwZWFycyIsIEkgdGhvdWdodCB0aGF0IHdhcyB0
aGUgY2FzZSB5b3UKPj4+IGNhcmVkIGFib3V0LCBoZW5jZSBteSBzdWdnZXN0aW9uLgo+Pgo+PiBU
aGF0J3MgbXkgcHJpbWFyeSB1c2UgY2FzZSwgeWVzLiBPYnZpb3VzbHkgd2Ugc2hvdWxkIG1ha2Ug
aXQgZG8gdGhlCj4+IHJpZ2h0IHRoaW5nIGluIHRoZSBnZW5lcmFsIGNhc2Ugd2hpbGUgd2UncmUg
dGhpbmtpbmcgYWJvdXQgaXQuIEknbQo+PiBpbmNsaW5lZCB0byBnbyB3aXRoIEp1ZXJnZW4ncyBz
dWdnZXN0aW9uIG9mIGlnbm9yaW5nIEVOT0VOVCBhbmQgRUFDQ0VTCj4+IChvciBzaG91bGQgdGhh
dCBoYXZlIGJlZW4gRVBFUk0/KSwgeWV0IHN0aWxsIGFib3J0aW5nIGZvciBldmVyeXRoaW5nCj4+
IGVsc2UuCj4+Cj4gCj4gSSBjYW4ndCBzZWVtIHRvIGZpbmQgRUFDQ0VTUyBpbiB4ZW5zdG9yZWQg
Y29kZSwgYnV0IEkgZG8gZmluZCBFUEVSTS4KPiBBZGRpbmcgRVBFUk0gd291bGQgYmUgZmluZSBi
eSBtZS4KCkRyb3Agb25lICJTIiBmcm9tIEVBQ0NFU1MgYW5kIHlvdSdsbCBzZWUgaXQuCgoKSnVl
cmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
