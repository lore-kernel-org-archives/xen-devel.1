From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V5 2/3] x86/mm: allocate logdirty_ranges for
 altp2ms
Date: Wed, 14 Nov 2018 01:11:40 -0700
Message-ID: <5BEBD8BC02000078001FBCDF@prv1-mh.provo.novell.com>
References: <1541945224-23075-1-git-send-email-rcojocaru@bitdefender.com>
 <1541945224-23075-3-git-send-email-rcojocaru@bitdefender.com>
 <2c1b78c1-e526-4481-f36d-791e11bdd06e@citrix.com>
 <7b71af9a-29ca-6f7e-13a3-27d02e0392f6@bitdefender.com>
 <6e45d58f-0fd6-7563-23af-cad4dcb890b1@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=etbn=nz=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gMqH5-0002Fl-Fh
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 08:11:47 +0000
In-Reply-To: <6e45d58f-0fd6-7563-23af-cad4dcb890b1@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, george.dunlap@citrix.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjExLjE4IGF0IDE5OjU3LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gT24gMTEvMTMvMTggODo0MyBQTSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+PiBPbiAx
MS8xMy8xOCA3OjU3IFBNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+Pj4gSXMgdGhlcmUgYW55IHBh
cnRpY3VsYXIgcmVhc29uIHdlIGFsbG9jYXRlIHRoZSBwMm0gc3RydWN0dXJlcyBvbiBkb21haW4K
Pj4+IGNyZWF0aW9uLCBidXQgbm90IGxvZ2RpcnR5IHJhbmdlIHN0cnVjdHVyZXM/ICBJdCBzZWVt
cyBsaWtlIGFsbG9jYXRpbmcKPj4+IGFsdHAybSBzdHJ1Y3R1cmVzIG9uLWRlbWFuZCwgcmF0aGVy
IHRoYW4gYXQgZG9tYWluIGNyZWF0aW9uIHRpbWUsIG1pZ2h0Cj4+PiBtYWtlIGEgbG90IG9mIHRo
ZSByZWFzb25pbmcgaGVyZSBzaW1wbGVyLgo+PiAKPj4gSSBhc3N1bWUgdGhhdCB0aGlzIHF1ZXN0
aW9uIGlzIG5vdCBhZGRyZXNzZWQgdG8gbWUsIHNpbmNlIEknbSBub3QgYWJsZQo+PiB0byBhbnN3
ZXIgaXQgLSBJIGNhbiBvbmx5IGFzc3VtZSB0aGF0IGhhdmluZyBsZXNzIGhlYXAgdXNlZCBoYXMg
YmVlbgo+PiBwcmVmZXJyZWQuCj4gCj4gQWN0dWFsbHkgSSBub3cgcmVhbGl6ZSB0aGF0IHlvdSdy
ZSBhc2tpbmcgd2h5IHRoZSBob3N0cDJtIHJhbmdlc2V0IGlzCj4gY3JlYXRlZCB2aWEgcGFnaW5n
X2RvbWFpbl9pbml0KCkgaW4gYXJjaF9kb21haW5fY3JlYXRlKCkgKHNvIGltbWVkaWF0ZWx5Cj4g
b24gZG9tYWluIGNyZWF0aW9uKSB3aGlsZSBJJ20gYWxsb2NhdGluZyB0aGUgYWx0cDJtIHJhbmdl
c2V0cyBvbiBhbHRwMm0KPiBpbml0Lgo+IAo+IEknbSBkb2luZyB0aGF0IHRvIHNhdmUgbWVtb3J5
LCBzaW5jZSB3ZSBjYW4gaGF2ZSBNQVhfQUxUUDJNIGFsdHAybXMKPiAod2hpY2ggaXMgY3VycmVu
dGx5IDEwKSwgYW5kIG9ubHkgdHdvIGFjdGl2ZSBhbHRwMm1zIC0gdGhhdCBtZWFucyB0aGF0IEkK
PiB3b3VsZCBhbGxvY2F0ZSAxMCByYW5nZXNldHMgYW5kIG9ubHkgdXNlIHR3by4gSW4gZmFjdCB3
ZSdyZSBjdXJyZW50bHkKPiBvbmx5IHVzaW5nIDIgYWx0cDJtcyBhbmQgdGhlIGhvc3RwMm0gZm9y
IG91ciAjVkUgd29yay4gVGhhdCBzYXZlcyB0aGUKPiBzcGFjZSByZXF1aXJlZCBmb3IgOCByYW5n
ZXNldHMuIElmIHRoYXQncyBub3QgbXVjaCwgb3IgaWYgeW91IHRoaW5rIHRoYXQKPiB0aGUgYmVu
ZWZpdHMgb2YgYWxsb2NhdGluZyB0aGVtIGVhcmx5IG91dHdlaWdoIHRoZSBjb3N0cyB3ZSBjYW4g
c3dpdGNoCj4gdG8gYWxsb2NhdGluZyB0aGVtIG9uIGRvbWFpbiBjcmVhdGlvbiwgbGlrZSB0aGUg
aG9zdHAybSwgYW5kIHBlcmhhcHMKPiBhbHdheXMga2VlcGluZyB0aGVtIGluIHN5bmMuCgpJIHRo
aW5rIEdlb3JnZSdzIHF1ZXN0aW9uIGhhZCB0aGUgb3Bwb3NpdGUgZ29hbDogUmF0aGVyIHRoYW4g
anVzdAphbGxvY2F0aW5nIHRoZSByYW5nZXNldHMgb24gZGVtYW5kLCB3aHkgZG9uJ3QgdGhlIGVu
dGlyZSBhbHRwMm0Kc3RydWN0dXJlcyBnZXQgYWxsb2NhdGVkIG9uIGRlbWFuZD8KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
