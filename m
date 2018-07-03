From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 10/10] vpci/sriov: add support for SR-IOV
 capability
Date: Tue, 03 Jul 2018 04:48:19 -0600
Message-ID: <5B3B547302000078001D030D@prv1-mh.provo.novell.com>
References: <20180620144234.51783-1-roger.pau@citrix.com>
 <20180620144234.51783-11-roger.pau@citrix.com>
 <20180703092759.etip2qie5gsibruy@citrix.com>
 <20180703102108.36bkr3glktzmc4pp@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=uib8=jt=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1faIr8-0007Jz-Jr
 for xen-devel@lists.xenproject.org; Tue, 03 Jul 2018 10:48:22 +0000
In-Reply-To: <20180703102108.36bkr3glktzmc4pp@mac.bytemobile.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA3LjE4IGF0IDEyOjIxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgSnVsIDAzLCAyMDE4IGF0IDEwOjI3OjU5QU0gKzAxMDAsIFdlaSBMaXUgd3JvdGU6
Cj4+IE9uIFdlZCwgSnVuIDIwLCAyMDE4IGF0IDA0OjQyOjM0UE0gKzAyMDAsIFJvZ2VyIFBhdSBN
b25uZSB3cm90ZToKPj4gPiArICAgICAgICAgICAgc3Jpb3YtPm51bV92ZnMgPSBwY2lfY29uZl9y
ZWFkMTYocGRldi0+c2VnLCBwZGV2LT5idXMsCj4+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFBDSV9TTE9UKHBkZXYtPmRldmZuKSwKPj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJX0ZVTkMocGRldi0+ZGV2
Zm4pLAo+PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
b3MgKyBQQ0lfU1JJT1ZfTlVNX1ZGKTsKPj4gPiArCj4+ID4gKyAgICAgICAgICAgIC8qCj4+ID4g
KyAgICAgICAgICAgICAqIE5COiBWRkUgbmVlZHMgdG8gYmUgZW5hYmxlZCBiZWZvcmUgY2FsbGlu
ZyBwY2lfYWRkX2RldmljZSBzbyBYZW4KPj4gPiArICAgICAgICAgICAgICogY2FuIGFjY2VzcyB0
aGUgY29uZmlnIHNwYWNlIG9mIFZGcy4KPj4gPiArICAgICAgICAgICAgICovCj4+ID4gKyAgICAg
ICAgICAgIHBjaV9jb25mX3dyaXRlMTYocGRldi0+c2VnLCBwZGV2LT5idXMsIFBDSV9TTE9UKHBk
ZXYtPmRldmZuKSwKPj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lfRlVOQyhw
ZGV2LT5kZXZmbiksIHJlZywKPj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250
cm9sIHwgUENJX1NSSU9WX0NUUkxfVkZFKTsKPj4gPiArCj4+ID4gKyAgICAgICAgICAgIC8qCj4+
ID4gKyAgICAgICAgICAgICAqIFRoZSBzcGVjIHN0YXRlcyB0aGF0IHRoZSBzb2Z0d2FyZSBtdXN0
IHdhaXQgYXQgbGVhc3QgMTAwbXMKPj4gPiArICAgICAgICAgICAgICogYmVmb3JlIGF0dGVtcHRp
bmcgdG8gYWNjZXNzIFZGIHJlZ2lzdGVycyB3aGVuIGVuYWJsaW5nIHZpcnR1YWwKPj4gPiArICAg
ICAgICAgICAgICogZnVuY3Rpb25zIG9uIHRoZSBQRi4KPj4gPiArICAgICAgICAgICAgICovCj4+
ID4gKyAgICAgICAgICAgIG1kZWxheSgxMDApOwo+PiAKPj4gSU1ITyBkZWxheWluZyAxMDBtcyBs
aWtlIHRoaXMgaW4gYW4gYWN0aXZlIHN5c3RlbSBpcyBmYXIgdG9vIGxvbmcuIEl0Cj4+IHdvdWxk
IGJlIGJldHRlciB0byBwdXQgdGhpcyBpbnRvIGEgbG9vcCBhbmQgcHJvY2VzcyBzb2Z0aXJxcyBp
biBiZXR3ZWVuCj4+IGRlbGF5cy4KPiAKPiBBY2ssIGRvIHlvdSB0aGluayAxMG1zIGRlbGF5cyB3
b3VsZCBiZSBPSz8KCkkgaGF2ZW4ndCBjaGVja2VkIHlldCB3aGVyZSB3ZSBhcmUgaGVyZSAtIGdl
bmVyYWxseSBzdWNoIGRlbGF5cyB3b3VsZApiZXR0ZXIgYmUgaW1wbGVtZW50ZWQgYnkgcGF1c2lu
ZyB0aGUgY2FsbGVyIGFuZCByZXN1bWluZyBpdCBvbmNlIHRoZQpuZWNlc3NhcnkgdGltZSBoYXMg
cGFzc2VkLiBXaGlsZSBpbiBEb20wIGNvbnRleHQgaXQgbWlnaHQgYmUgYWNjZXB0YWJsZQp0byBk
byB3aGF0IFdlaSBhbmQgeW91IHN1Z2dlc3QsIHRoYXQnbGwgYmUgeWV0IG9uZSBtb3JlIHRoaW5n
IHRvIGRlYWwKd2l0aCBvbmNlIHdlIHdhbnQgdG8gcmUtdXNlIHRoZSBjb2RlIGZvciBEb21VLXMu
CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
