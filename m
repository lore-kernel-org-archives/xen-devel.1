From: Juergen Gross <jgross@suse.com>
Subject: Re: Guest soft lockups with "xen: make xen_qlock_wait()
 nestable"
Date: Mon, 19 Nov 2018 10:46:53 +0100
Message-ID: <02cb09ff-c7a2-6c25-1f70-30a63db8f8bb@suse.com>
References: <3a55659d-4d7e-ea03-0c46-cd115ff1d8f9@eikelenboom.it>
 <c007d98d-1744-f40c-a801-8c1956605d29@suse.com>
 <9e2d3c8a-07b8-dcf8-fb52-0071b63b92d2@eikelenboom.it>
 <4a3e30f5-917e-ea54-0ff9-8135ee3bd4a4@suse.com>
 <5a0a87ee-c029-b503-fce0-54dc55793685@eikelenboom.it>
 <25d57755-d2db-3c7e-d72c-7f2ad612ae91@suse.com>
 <1a44de8669e05d8d895661464bd61cc635f49387.camel@infradead.org>
 <ecb78f93-2dbb-1e90-5be6-f71a1050ef31@suse.com>
 <9917dbe03ef14c4b33c88d7516c3a1c0cdb05d88.camel@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=rtps=n6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gOg8u-0002UO-NH
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 09:46:56 +0000
In-Reply-To: <9917dbe03ef14c4b33c88d7516c3a1c0cdb05d88.camel@infradead.org>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Woodhouse <dwmw2@infradead.org>, Sander Eikelenboom <linux@eikelenboom.it>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMTEvMjAxOCAxMDozOSwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IE9uIE1vbiwgMjAx
OC0xMS0xOSBhdCAwODowNSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMTUvMTEv
MjAxOCAwMDoyMiwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+Pj4gT24gVGh1LCAyMDE4LTExLTA4
IGF0IDExOjE4ICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+IE9oLCBzb3JyeS4gT2Yg
Y291cnNlIGl0IGRvZXMuIERlcmVmZXJlbmNpbmcgYSBwZXJjcHUgdmFyaWFibGUKPj4+PiBkaXJl
Y3RseSBjYW4ndCB3b3JrLiBIb3cgc2lsbHkgb2YgbWUuCj4+Pj4KPj4+PiBUaGUgYXR0YWNoZWQg
dmFyaWFudCBzaG91bGQgcmVwYWlyIHRoYXQuIFRlc3RlZCB0byBub3QgYnJlYWsKPj4+PiBib290
aW5nLgo+Pj4KPj4+IFN0cmljdGx5IHNwZWFraW5nLCBzaG91bGRuJ3QgeW91IGhhdmUgYW4gYXRv
bWljX2luaXQoKSBpbiB0aGVyZQo+Pj4gc29tZXdoZXJlPwo+Pgo+PiBhdG9taWNfdCB2YXJpYWJs
ZXMgaW5pdGlhbGl6ZWQgd2l0aCAwIChlLmcuIHN0YXRpYyBvbmVzKSBzZWVtIG5vdCB0bwo+PiBy
ZXF1aXJlIGF0b21pY19pbml0KCkgKG9yIEFUT01JQ19JTklUKS4gRG9jdW1lbnRhdGlvbi9hdG9t
aWNfdC50eHQKPj4gZG9lc24ndCBtZW50aW9uIHRoZSBuZWVkIHRvIHVzZSBpdCBpbiB0aGlzIGNh
c2UuIFNvIEkgZ3Vlc3MgaXQgaXMgYQo+PiBtYXR0ZXIgb2YgdGFzdGUuCj4gCj4gWWVhaCwgd2Ug
aGF2ZSAnI2RlZmluZSBBVE9NSUNfSU5JVChpKSB7IChpKSB9JyBmYWlybHkgbXVjaCBldmVyeXdo
ZXJlCj4gbm93LCBldmVuIG9uIFNQQVJDIChub3QgdGhhdCB0aGlzIGNvZGUgcnVucyBvbiBTUEFS
QykuCj4gCj4gU28gaXQgZG9lc24ndCByZWFsbHkgbWF0dGVyLCBhbmQgaXQncyBmYWlybHkgdW5s
aWtlbHkgdGhhdCB0aGUgYXRvbWljX3QKPiBpbXBsZW1lbnRhdGlvbiBpcyBnb2luZyB0byAqY2hh
bmdlKi4KPiAKPiBCdXQgc3RpbGwsIHRoZXJlJ3Mgbm8gaGFybSBpbiBkb2luZyB0aGUgJ3Rhc3Rl
ZnVsJyB2ZXJzaW9uOgo+IAo+IHN0YXRpYyBERUZJTkVfUEVSX0NQVShhdG9taWNfdCwgeGVuX3Fs
b2NrX3dhaXRfbmVzdCkgPSBBVE9NSUNfSU5JVCgwKTsKCkZlZWwgZnJlZSB0byBzZW5kIGEgcGF0
Y2ggKG15IHBhdGNoIGlzIGFscmVhZHkgaW4gcmMyKS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
