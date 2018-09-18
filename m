From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v9 7/7] vtd: add lookup_page method to
 iommu_ops
Date: Tue, 18 Sep 2018 08:50:33 -0600
Message-ID: <5BA110B902000078001E97F8@prv1-mh.provo.novell.com>
References: <20180913152128.6114-1-paul.durrant@citrix.com>
 <20180913152128.6114-9-paul.durrant@citrix.com>
 <5BA0FB8F02000078001E9785@prv1-mh.provo.novell.com>
 <c248c490e4184888a312eeff70b3c1ed@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xuki=ma=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g2HKp-00017b-6R
 for xen-devel@lists.xenproject.org; Tue, 18 Sep 2018 14:50:39 +0000
In-Reply-To: <c248c490e4184888a312eeff70b3c1ed@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, george.dunlap@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjA5LjE4IGF0IDE2OjAwLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiBTZW50
OiAxOCBTZXB0ZW1iZXIgMjAxOCAxNDoyMAo+PiAKPj4gPj4+IE9uIDEzLjA5LjE4IGF0IDE3OjIx
LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOgo+PiA+IEBAIC0xNzksOSArMTgxLDE3
IEBAIHN0cnVjdCBpb21tdV9vcHMgewo+PiA+ICAjZW5kaWYgLyogSEFTX1BDSSAqLwo+PiA+Cj4+
ID4gICAgICB2b2lkICgqdGVhcmRvd24pKHN0cnVjdCBkb21haW4gKmQpOwo+PiA+ICsKPj4gPiAr
ICAgIC8qCj4+ID4gKyAgICAgKiBUaGlzIGJsb2NrIG9mIG9wZXJhdGlvbnMgbXVzdCBiZSBhcHBy
b3ByaWF0ZWx5IGxvY2tlZCBhZ2FpbnN0Cj4+IGVhY2gKPj4gPiArICAgICAqIG90aGVyIHRvIGhh
dmUgbWVhbmluZ2Z1bCByZXN1bHRzLgo+PiA+ICsgICAgICovCj4+ID4gICAgICBpbnQgX19tdXN0
X2NoZWNrICgqbWFwX3BhZ2UpKHN0cnVjdCBkb21haW4gKmQsIGRmbl90IGRmbiwgbWZuX3QKPj4g
bWZuLAo+PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQg
ZmxhZ3MpOwo+PiA+ICAgICAgaW50IF9fbXVzdF9jaGVjayAoKnVubWFwX3BhZ2UpKHN0cnVjdCBk
b21haW4gKmQsIGRmbl90IGRmbik7Cj4+ID4gKyAgICBpbnQgX19tdXN0X2NoZWNrICgqbG9va3Vw
X3BhZ2UpKHN0cnVjdCBkb21haW4gKmQsIGRmbl90IGRmbiwgbWZuX3QKPj4gKm1mbiwKPj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50ICpmbGFncyk7
Cj4+IAo+PiBJJ20gYWZyYWlkIHRoZSBjb21tZW50IGlzIGFtYmlndW91czogSXQgbWF5IG1lYW4g
dGhlIGltcGxlbWVudGF0aW9ucwo+PiBvZiB0aGUgaG9va3MgaGF2ZSB0byBoYXZlIHN1aXRhYmxl
IGxvY2tpbmcgaW4gcGxhY2UsIG9yIGNhbGxlcnMgaGF2ZSB0bwo+PiB0YWtlIGNhcmUgb2YgbG9j
a2luZy4gSSB0aGluayB0aGUgbGF0dGVyIGlzIG1lYW50LCB3aGljaCBJIHRoaW5rIG5lZWRzIHRv
Cj4+IGJlIG1hZGUgZXhwbGljaXQuIFdpdGggdGhhdAo+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiAKPiAKPiBUaGFua3MuIFllcywgdGhlIGxhdHRlciBp
cyB3aGF0IEkgbWVhbnQuIENhbiB5b3UgZml4IHRoZSB3b3JkaW5nIGFzIHlvdSBzZWUgCj4gZml0
IGR1cmluZyBjb21taXQ/CgpXZWxsLCBJIGRpZG4ndCBvZmZlciBkb2luZyBzbyBiZWNhdXNlIGl0
IHNlZW1lZCB0byBtZSB0aGF0IHNtYWxsIGFkanVzdG1lbnRzCnRvIGF0IGxlYXN0IG9uZSBvZiBl
YXJsaWVyIHBhdGNoZXMgd291bGQgc3RpbGwgYmUgbmVlZGVkLiBXYXMgdGhhdCB3cm9uZz8KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
