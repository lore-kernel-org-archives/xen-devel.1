From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v4 13/32] libxl_qmp: Connect to QMP socket
Date: Tue, 21 Aug 2018 09:22:25 +0100
Message-ID: <20180821082225.64eui7pryjfesrqv@citrix.com>
References: <20180727140614.13256-1-anthony.perard@citrix.com>
 <20180727140614.13256-14-anthony.perard@citrix.com>
 <20180802093010.xmeofkvaajd6dzpd@mac>
 <20180803135420.GE1327@perard.uk.xensource.com>
 <20180803140354.nsw6ofwb34lcaqvi@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7kme=le=citrix.com=prvs=7644f7420=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fs1vp-00049N-O1
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 08:22:29 +0000
Content-Disposition: inline
In-Reply-To: <20180803140354.nsw6ofwb34lcaqvi@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMDMsIDIwMTggYXQgMDQ6MDM6NTRQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBGcmksIEF1ZyAwMywgMjAxOCBhdCAwMjo1NDoyMFBNICswMTAwLCBBbnRo
b255IFBFUkFSRCB3cm90ZToKPiA+IE9uIFRodSwgQXVnIDAyLCAyMDE4IGF0IDExOjM1OjUzQU0g
KzAyMDAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiA+IE9uIEZyaSwgSnVsIDI3LCAyMDE4
IGF0IDAzOjA1OjU1UE0gKzAxMDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gPiA+ICt0eXBl
ZGVmIGVudW0gewo+ID4gPiA+ICsgICAgcW1wX3N0YXRlX2Rpc2Nvbm5lY3RlZCA9IDEsCj4gPiA+
ID4gKyAgICBxbXBfc3RhdGVfY29ubmVjdGluZywKPiA+ID4gPiArICAgIHFtcF9zdGF0ZV9ncmVl
dGluZywKPiA+ID4gPiArICAgIHFtcF9zdGF0ZV9jYXBhYmlsaXR5X25lZ29jaWF0aW9uLAo+ID4g
PiA+ICsgICAgcW1wX3N0YXRlX2Nvbm5lY3RlZCwKPiA+ID4gPiArfSBsaWJ4bF9fcW1wX3N0YXRl
Owo+ID4gPiA+ICsKPiA+ID4gCj4gPiA+IEkgdGhpbmsgdGhpcyBzaG91bGQgYmUgZGVjbGFyZWQg
aW4gbGlieGxfdHlwZXNfaW50ZXJuYWwuaWRsPwo+ID4gCj4gPiBJIGRvbid0IGtub3csIEkga2lu
ZCBvZiB3YW50ZWQgdGhlIGVudW0gdG8gYmUgY29udGFpbmVkIGluIGxpYnhsX3FtcC5jLAo+ID4g
YnV0IHRoZW4gSSBjb3VsZG4ndCB1c2UgdGhlIGVudW0gdHlwZSBpbiB0aGUgc3RydWN0IGhlcmUu
Cj4gPiAKPiA+IEFsc28gdGhlIGlkbCBwcm92aWRlcyBtb3JlIHRoYW4gbmVlZGVkIChjb252ZXJz
aW9uIHRvIHN0cmluZykgYW5kIG1ha2UKPiA+IHRoZSBuYW1lcyBtb3JlIHZlcmJvc2UsIGJ5IGFk
ZGluZyBsaWJ4bF9fIHByZWZpeC4KPiAKPiBIbSwgeWVzLiBsaWJ4bF90eXBlc19pbnRlcm5hbC5p
ZGwgZG9lc24ndCBzZWVtIHRvIGJlIHVzZWQgbXVjaC4gSSB3aWxsCj4gbGVhdmUgdGhpcyB0byB0
aGUgbWFpbnRhaW5lcnMgYmVjYXVzZSBpdCdzIG5vdCBjbGVhciB0byBtZSB3aGVuIGEKPiBkZWNs
YXJhdGlvbiBzaG91bGQgbGl2ZSBpbiB0aGUgSURMIG9yIHRoZSBwcml2YXRlIGhlYWRlciBkaXJl
Y3RseS4KCkkgdGhpbmsgaW4gdGhpcyBjYXNlIGl0IGlzIGJldHRlciB0byB1c2UgdGhlIGludGVy
bmFsIGhlYWRlci4gVGhlIHR5cGUKaW50cm9kdWNlZCBoZXJlIGRvZXNuJ3QgbmVlZCBhbGwgdGhl
IGZhbmN5IHN0dWZmIGdlbmVyYXRlZCBieSB0aGUgSURMCmluZnJhc3RydWN0dXJlLgoKV2VpLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
