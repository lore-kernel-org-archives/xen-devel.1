From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/4] iommu: generalize
 iommu_inclusive_mapping
Date: Wed, 01 Aug 2018 03:11:55 -0600
Message-ID: <5B61795B02000078001D9C92@prv1-mh.provo.novell.com>
References: <20180727153149.25094-1-roger.pau@citrix.com>
 <20180727153149.25094-3-roger.pau@citrix.com>
 <5B60749A02000078001D9886@prv1-mh.provo.novell.com>
 <20180731153317.kryord4hezdukfgy@mac>
 <5B616D5402000078001D9BFE@prv1-mh.provo.novell.com>
 <49a6843f08e44a738684c954b8318fa2@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qz6i=kq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fknAm-0001Lg-6I
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 09:12:00 +0000
In-Reply-To: <49a6843f08e44a738684c954b8318fa2@AMSPEX02CL03.citrite.net>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, IanJackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjA4LjE4IGF0IDEwOjMzLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBYZW4tZGV2ZWwgW21haWx0bzp4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5w
cm9qZWN0Lm9yZ10gT24gQmVoYWxmCj4+IE9mIEphbiBCZXVsaWNoCj4+IFNlbnQ6IDAxIEF1Z3Vz
dCAyMDE4IDA5OjIxCj4+ID4+PiBPbiAzMS4wNy4xOCBhdCAxNzozMywgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPiB3cm90ZToKPj4gPiBPbiBUdWUsIEp1bCAzMSwgMjAxOCBhdCAwODozOToyMkFNIC0w
NjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gPj4gPj4+IE9uIDI3LjA3LjE4IGF0IDE3OjMxLCA8
cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+PiA+PiA+IEludHJvZHVjZSBhIG5ldyBpb21t
dT1pbmNsdXNpdmUgZ2VuZXJpYyBvcHRpb24gdGhhdCBzdXBlcnNlZGVzCj4+ID4+ID4gaW9tbXVf
aW5jbHVzaXZlX21hcHBpbmcuIFRoaXMgc2hvdWxkIGJlIGEgbm9uLWZ1bmN0aW9uYWwgY2hhbmdl
IG9uCj4+ID4+ID4gSW50ZWwgaGFyZHdhcmUsIHdoaWxlIEFNRCBoYXJkd2FyZSB3aWxsIGdhaW4g
dGhlIHNhbWUgZnVuY3Rpb25hbGl0eSBvZgo+PiA+PiA+IG1hcHBpbmcgYWxtb3N0IGV2ZXJ5dGhp
bmcgYmVsb3cgdGhlIDRHQiBib3VuZGFyeS4KPj4gPj4KPj4gPj4gU28gZmlyc3Qgb2YgYWxsIC0g
d2hhdCdzIHRoZSBtb3RpdmF0aW9uIGJlaGluZCB0aGlzIGNoYW5nZT8gU28gZmFyIHdlCj4+ID4+
IGhhZCBubyBuZWVkIGZvciBoYWNrcyBsaW5lIHRoZSBWVC1kIHNpZGUgb25lIG9uIEFNRC4gSSBk
b24ndCB0aGluawo+PiA+PiB0aGlzIHNob3VsZCBiZSB3aWRlbmVkIHdpdGhvdXQgdGhlcmUgYmVp
bmcgaW5kaWNhdGlvbiBvZiBhIHByb2JsZW0KPj4gPj4gd2l0aCBub24tbmljaGUgQU1EIHN5c3Rl
bXMuCj4+ID4KPj4gPiBPSywgSSBjYW4gbGVhdmUgdGhlIGRlZmF1bHQgb24gZm9yIEludGVsIGFu
ZCBvZmYgZm9yIGV2ZXJ5dGhpbmcgZWxzZSwKPj4gPiBidXQgSSB3aWxsIGludHJvZHVjZSB0aGUg
Z2VuZXJpYyBkb20wLWlvbW11PSBvcHRpb24gYW55d2F5Lgo+PiAKPj4gSG1tLCBJJ3ZlIGFsd2F5
cyBiZWVuIHdpc2hpbmcgd2UnZCBjaGFuZ2UgdG8gYSBkZWZhdWx0IG9mIG9mZiBmb3IKPj4gVlQt
ZCBhcyB3ZWxsIC0gaW1vIHdlIHNob3VsZG4ndCBieSBkZWZhdWx0IGFzc3VtZSBicm9rZW4gZmly
bXdhcmUuCj4+IEtldmluPwo+IAo+IEkgc3VzcGVjdCB0aGF0IGEgc2VyaW91c2x5IGxhcmdlIG51
bWJlciBvZiBYZW4gdXNlcnMgd2lsbCBmaW5kIHRoZWlyIHN5c3RlbXMgCj4gZmFpbCB0byBib290
IGlmIHRoZSBkZWZhdWx0IGlzIGNoYW5nZWQuIEknbSB0ZXN0aW5nIG9uIGEgRGVsbCBSNzMwIHdp
dGggKHRvIAo+IG15IGtub3dsZWRnZSkgdXAtdG8tZGF0ZSBmaXJtd2FyZS4gTm90IGV4YWN0bHkg
YSByYXJlIHN5c3RlbSBhbmQgdHVybmluZyBvZmYgCj4gaW5jbHVzaXZlIG1hcHBpbmcgd2lsbCBj
YXVzZSBpdCB0byB3ZWRnZSBkdXJpbmcgYm9vdC4KCkhtbSwgdGhhdCdzIHJhdGhlciBzYWQgaW5k
ZWVkLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
