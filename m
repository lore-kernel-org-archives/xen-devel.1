From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86: fix paging_log_dirty_op to work with
 paging guests
Date: Thu, 13 Dec 2018 07:52:16 -0700
Message-ID: <5C1272200200007800205E78@prv1-mh.provo.novell.com>
References: <20181212145438.47175-1-roger.pau@citrix.com>
 <5C11323202000078002058EF@prv1-mh.provo.novell.com>
 <20181213113944.7wvomlbry7toziia@mac>
 <5C1255E70200007800205D20@prv1-mh.provo.novell.com>
 <20181213141406.ue2epvsgd25wmtlg@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gXSLf-0007gS-6u
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 14:52:23 +0000
In-Reply-To: <20181213141406.ue2epvsgd25wmtlg@mac>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjEyLjE4IGF0IDE1OjE0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFRodSwgRGVjIDEzLCAyMDE4IGF0IDA1OjUxOjUxQU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTMuMTIuMTggYXQgMTI6MzksIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gV2VsbCwgSnVzdCBrZWVwaW5nIGNvcnJlY3Qgb3JkZXIgYmV0d2VlbiBlYWNo
IGRvbWFpbiBsb2NrcyBzaG91bGQgYmUKPj4gPiBlbm91Z2g/Cj4+ID4gCj4+ID4gSWU6IGV4YWN0
bHkgdGhlIHNhbWUgdGhhdCBYZW4gY3VycmVudGx5IGRvZXMgYnV0IG9uIGEgcGVyLWRvbWFpbgo+
PiA+IGJhc2lzLiBUaGlzIGlzIGZlYXNpYmxlLCBidXQgZWFjaCBDUFUgd291bGQgbmVlZCB0byBz
dG9yZSB0aGUgbG9jawo+PiA+IG9yZGVyIG9mIGVhY2ggcG9zc2libGUgZG9tYWluOgo+PiA+IAo+
PiA+IERFQ0xBUkVfUEVSX0NQVSh1aW50OF90LCBtbV9sb2NrX2xldmVsW0RPTUlEX0ZJUlNUX1JF
U0VSVkVEXSk7Cj4+ID4gCj4+ID4gVGhpcyB3b3VsZCBjb25zdW1lIH4zMktCIHBlciBDUFUsIHdo
aWNoIGlzIG5vdCB0aGF0IG11Y2ggYnV0IHNlZW1zIGEKPj4gPiB3YXN0ZSB3aGVuIG1vc3Qgb2Yg
dGhlIHRpbWUgYSBzaW5nbGUgZW50cnkgd2lsbCBiZSB1c2VkLgo+PiAKPj4gV2VsbCwgdHJhY2tp
bmcgYnkgZG9tYWluIElEIHdvdWxkbid0IGhlbHAgeW91IC0gdGhlIGNvbnRyb2xsaW5nCj4+IGRv
bWFpbiBtYXkgd2VsbCBoYXZlIGEgaGlnaGVyIElEIHRoYW4gdGhlIGJlaW5nIGNvbnRyb2xsZWQg
b25lLAo+PiBpLmUuIHRoZSBuZXN0aW5nIHlvdSB3YW50IG5lZWRzIHRvIGJlIGluZGVwZW5kZW50
IG9mIGRvbWFpbiBJRC4KPiAKPiBJdCdzIG5vdCB0cmFja2luZyB0aGUgZG9tYWluIElELCBidXQg
cmF0aGVyIHRyYWNraW5nIHRoZSBsb2NrIGxldmVsIG9mCj4gZWFjaCBkaWZmZXJlbnQgZG9tYWlu
LCBoZW5jZSB0aGUgbmVlZCBmb3IgdGhlIGFycmF5IGluIHRoZSBwY3B1Cj4gc3RydWN0dXJlLiBU
aGUgbG9jayBjaGVja2VyIHdvdWxkIHRha2UgYSBkb21haW4gaWQgYW5kIGEgbGV2ZWwsIGFuZAo+
IHBlcmZvcm0gdGhlIGNoZWNrIGFzOgo+IAo+IGlmICggbW1fbG9ja19sZXZlbFtkb21pZF0gPiBs
ZXZlbCApCj4gICAgIHBhbmljCgpCdXQgdGhpcyB3b3VsZCBvcGVuIHRoaW5ncyB1cCBmb3IgZGVh
ZGxvY2tzIGJlY2F1c2Ugb2YgaW50ZXJtaXhlZApsb2NrIHVzYWdlIGJldHdlZW4gdGhlIGNhbGxp
bmcgZG9tYWluJ3MgYW5kIHRoZSBzdWJqZWN0IG9uZSdzLgpUaGVyZSBuZWVkcyB0byBiZSBhIGxp
bmVhciBzZXF1ZW5jZSBvZiBsb2NrcyAob2YgYWxsIGludm9sdmVkCmRvbWFpbnMpIGRlc2NyaWJp
bmcgdGhlIG9uZSBhbmQgb25seSBvcmRlciBpbiB3aGljaCB0aGV5IG1heSBiZQphY3F1aXJlZC4K
CkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
