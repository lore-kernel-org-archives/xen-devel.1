From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] xen-pciback: Allow enabling/disabling
 expansion ROM
Date: Mon, 03 Dec 2018 08:04:32 -0700
Message-ID: <5C054600020000780020245F__5948.97150663218$1543849408$gmane$org@prv1-mh.provo.novell.com>
References: <cover.55c0e31b75e2fbdf4206cc39c2fd7581793ae7ae.1543772656.git-series.marmarek@invisiblethingslab.com>
 <cover.55c0e31b75e2fbdf4206cc39c2fd7581793ae7ae.1543772656.git-series.marmarek@invisiblethingslab.com>
 <a05e3cf451d692dc4b1c81c8b5d66fc75d1fa325.1543772656.git-series.marmarek@invisiblethingslab.com>
 <5C050CF3020000780020223F@prv1-mh.provo.novell.com>
 <20181203144738.GQ781@mail-itl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=czp0=om=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gTpm2-0005Vc-DF
 for xen-devel@lists.xenproject.org; Mon, 03 Dec 2018 15:04:38 +0000
In-Reply-To: <20181203144738.GQ781@mail-itl>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: Dwayne Litzenberger <dlitz@dlitz.net>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjEyLjE4IGF0IDE1OjQ3LCA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNv
bT4gd3JvdGU6Cj4gT24gTW9uLCBEZWMgMDMsIDIwMTggYXQgMDQ6MDE6MDdBTSAtMDcwMCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+ID4+PiBPbiAwMi4xMi4xOCBhdCAxODo0NywgPG1hcm1hcmVrQGlu
dmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgo+PiA+IEZyb206IER3YXluZSBMaXR6ZW5iZXJn
ZXIgPGRsaXR6QGRsaXR6Lm5ldD4KPj4gPiAKPj4gPiBOZXdlciBBTUQgR1BVcyBzdG9yZSB0aGVp
ciBpbml0aWFsaXphdGlvbiByb3V0aW5lcyBhcyBieXRlY29kZSBvbiB0aGUKPj4gPiBST00uICBU
aGlzIGZpeGVzIHRoZSBmb2xsb3dpbmcgaW5pdGlhbGl6YXRpb24gZXJyb3IgaW5zaWRlIHRoZSBW
TSB3aGVuCj4+ID4gZG9pbmcgUENJIHBhc3N0aHJvdWdoOgo+PiA+IAo+PiA+ICAgICByYWRlb24g
MDAwMDowMDowNS4wOiBJbnZhbGlkIFBDSSBST00gaGVhZGVyIHNpZ25hdHVyZTogZXhwZWN0aW5n
IDB4YWE1NSwgZ290IDB4ZmZmZgo+PiA+ICAgICByYWRlb24gMDAwMDowMDowNS4wOiBJbnZhbGlk
IFBDSSBST00gaGVhZGVyIHNpZ25hdHVyZTogZXhwZWN0aW5nIDB4YWE1NSwgZ290IDB4ZmZmZgo+
PiA+ICAgICBbZHJtOnJhZGVvbl9nZXRfYmlvcyBbcmFkZW9uXV0gKkVSUk9SKiBVbmFibGUgdG8g
bG9jYXRlIGEgQklPUyBST00KPj4gPiAgICAgcmFkZW9uIDAwMDA6MDA6MDUuMDogRmF0YWwgZXJy
b3IgZHVyaW5nIEdQVSBpbml0Cj4+IAo+PiBJc24ndCBpdCB0aGF0IHFlbXUgaXMgc3VwcG9zZWQg
dG8gc3VyZmFjZSB0aGUgUk9NIGltYWdlIHRvIGd1ZXN0cywKPj4gbWFraW5nIGl0IHVubmVjZXNz
YXJ5IHRvIGFsbG93IGd1ZXN0cyBjb250cm9sIG92ZXIgdGhlIHBoeXNpY2FsCj4+IGVuYWJsZSBi
aXQ/IAo+IAo+IFVubGVzcyB0aGF0IHFlbXUgaXMgaW4gc3R1YmRvbWFpbiwgd2hlcmUgaXQgdXNl
IHBjaWJhY2sgdG8gYWNjZXNzCj4gZXZlcnl0aGluZyBhYm91dCB0aGUgZGV2aWNlLi4uCgpXb3Vs
ZCBiZSBxdWl0ZSBoZWxwZnVsIHRvIGV4cGxhaW4gdGhpcyBpbiB0aGUgZGVzY3JpcHRpb24uCgo+
PiBBbHNvIHdoeSB3b3VsZCBhbGxvd2luZyB0byBhbHRlciB0aGUgYml0IGRlcGVuZCBvbgo+PiB3
aGV0aGVyIHRoZSBhZGRyZXNzIHBvcnRpb24gb2YgdGhlIHZhbHVlIGlzIG5vbi16ZXJvPwo+IAo+
IFRoYXQncyBhIGdvb2QgcXVlc3Rpb24uIEFjY29yZGluZyB0byBjb21taXQgbWVzc2FnZSBJIHRo
aW5rIGl0IHNob3VsZCBiZQo+IGEgUk9NIHByZXNlbmNlIGNoZWNrIGluc3RlYWQuIElmIG5lZWRl
ZCBhdCB0aGlzIHBvaW50IGF0IGFsbCAtIGlzIHRoaXMKPiBmdW5jdGlvbiBldmVuIGNhbGxlZCBp
ZiB0aGVyZSBpcyBubyBST00/CgpJIHN1cHBvc2UgdGhpcyB3YXMgYSBxdWVzdGlvbiB0byBEd2F5
bmUsIG5vdCBtZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
