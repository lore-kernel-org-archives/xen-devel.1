From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH] shim: Fix generation of compat/callback.i:
 allow redef of OBJECT vars
Date: Thu, 19 Jul 2018 13:06:38 -0600
Message-ID: <5B50E13E020000780013763E@prv1-mh.provo.novell.com>
References: <1531956796-7465-1-git-send-email-christopher.w.clark@gmail.com>
 <5B5036A802000078001D5AE3@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1807190955250.19154@sstabellini-ThinkPad-X260>
 <5B50D9420200007800137603@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1807191139460.19154@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hpq6=kd=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fgEGA-0003XR-UZ
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 19:06:42 +0000
In-Reply-To: <alpine.DEB.2.10.1807191139460.19154@sstabellini-ThinkPad-X260>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: sstabellini@kernel.org
Cc: wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, Ian.Jackson@eu.citrix.com, christopher.w.clark@gmail.com, tim@xen.org, julien.grall@arm.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gMDcvMTkvMTgg
ODo0OSBQTSA+Pj4KPk9uIFRodSwgMTkgSnVsIDIwMTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiA+
Pj4gU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiAwNy8xOS8xOCA3
OjAwIFBNID4+Pgo+PiA+T24gVGh1LCAxOSBKdWwgMjAxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
ID4+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZXIgQ2xhcmsgPGNocmlzdG9waGVyLmNsYXJr
NkBiYWVzeXN0ZW1zLmNvbT4KPj4gPj4gPiAtLS0KPj4gPj4gPiBQbGVhc2UgdXNlIG15IGdtYWls
IGFkZHJlc3MgZm9yIGFueSBjb3JyZXNwb25kZW5jZSB0byBtZS4KPj4gPj4gCj4+ID4+IEkgdGhp
bmsgaXQgaXMgZ2VuZXJhbGx5IGNvbnNpZGVyZWQgYmFkIHByYWN0aWNlIHRvIGhhdmUgRnJvbTog
YW5kIFMtby1iCj4+ID4+IGRpZmZlci4KPj4gPgo+PiA+V2h5PyBUaGF0IGlzIHBlcmZlY3RseSBm
aW5lLiBTaWduZWQtb2ZmLWJ5IGlzIGFib3V0IGNvcHlyaWdodCBvZiB0aGUKPj4gPmNvZGUgd2hp
bGUgRnJvbTogaXMgYWJvdXQgYXV0aG9yc2hpcC4gCj4+IAo+PiBXZWxsLCBpbiB0aGlzIHBhcnRp
Y3VsYXIgY2FzZSBDaHJpc3RvcGhlciBoYWQgZXZlbiBhc2tlZCB0aGF0IGNvbW11bmljYXRpb24K
Pj4gdG8gZ28gdG8gdGhlIG1haWwgYWRkcmVzcyBoZSBzZW50IGZyb20uIEhvdyBpcyBhbnlvbmUg
Z29pbmcgdG8ga25vdyB0aGF0IGlmCj4+IGp1ZGdpbmcganVzdCBmcm9tIHRoZSBldmVudHVhbCBj
b21taXQgaW4gZ2l0Pwo+Cj5ZZWFoLCB0aGF0IGJpdCBvZiBpbmZvcm1hdGlvbiBpcyBsb3N0IGlu
IHRoZSBjb21taXQgbWVzc2FnZSwKPnVuZm9ydHVuYXRlbHkuIEF0IHRoYXQgcG9pbnQsIHRoZSBw
YXRjaCBpcyBhbHJlYWR5IGNvbW1pdHRlZCwgc28gaXQgaXMKPnVzdWFsbHkgbm90IGEgYmlnIGRl
YWwuCgpXaGF0IGlmIHRoZXJlIGlzIGFuIGlzc3VlIHdpdGggdGhlIGNoYW5nZSwgb3Igc2ltcGx5
IGEgcXVlc3Rpb24gYWJvdXQgaXQ/CkknZCBleHBlY3QgdG8gYmUgYWJsZSB0byBnZXQgaW4gdG91
Y2ggd2l0aCB0aGUgYXV0aG9yIGJ5IHVzaW5nIHRoZSBwcm92aWRlZAplbWFpbCBhZGRyZXNzLCBh
dCBsZWFzdCBpZiB0aGUgY29tbWl0IGlzbid0IG92ZXJseSBvbGQgeWV0LgoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
