From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 1/3] xen/pt: fix some pass-thru devices
 don't work across reboot
Date: Fri, 21 Dec 2018 03:32:47 -0700
Message-ID: <5C1CC14F0200007800208762@prv1-mh.provo.novell.com>
References: <1545319776-23459-1-git-send-email-chao.gao@intel.com>
 <5C1CBCDE0200007800208727@prv1-mh.provo.novell.com>
 <20181221102622.2csul4nq4bsuf62w@mac.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hr/k=O6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gaI6q-00022a-Sr
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 10:32:48 +0000
In-Reply-To: <20181221102622.2csul4nq4bsuf62w@mac.citrite.net>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Chao Gao <chao.gao@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjEyLjE4IGF0IDExOjI2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIEZyaSwgRGVjIDIxLCAyMDE4IGF0IDAzOjEzOjUwQU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBCdXQgdGhlbiBhZ2FpbiBJJ20gc3RpbGwgbm90IGZ1bGx5IGNvbnZpbmNlZCB0aGF0
IGEgaHlwZXJ2aXNvcgo+PiBjaGFuZ2UgaXMgdGhlIHJpZ2h0IGNvdXJzZSBvZiBhY3Rpb24gaGVy
ZSBpbiB0aGUgZmlyc3QgcGxhY2UuIEl0Cj4+IHdvdWxkIGJlIGJldHRlciBpZiB0aGUgaHlwZXJ2
aXNvciBoYWQgdG8ganVzdCB2ZXJpZnkgdGhhdCBhbGwKPj4gSVJRIG1hcHBpbmdzIGFyZSBnb25l
LCBvciBlbHNlIGZhaWwgdGhlIGRlLWFzc2lnbm1lbnQgb2YgdGhlCj4+IGRldmljZS4KPiAKPiBU
aGUgb25seSBjb21wb25lbnQgKGV4Y2VwdCB0aGUgaHlwZXJ2aXNvcikgdGhhdCBrbm93cyBhYm91
dCBzdWNoCj4gYXNzaWdubWVudHMgaXMgUUVNVSwgYW5kIGluIHRoZSBjYXNlIG9mIGEgUUVNVSBj
cmFzaCB0aGUgaG9zdCB3b3VsZCBiZQo+IGxlZnQgd2l0aCBhIGRldmljZSB0aGF0IGNhbm5vdCBi
ZSBkZS1hc3NpZ25lZCwgYmVjYXVzZSB0aGUgaW5mb3JtYXRpb24KPiBhYm91dCB0aGUgUElSUSBi
aW5kaW5ncyBpbiBsb3N0IGR1ZSB0byB0aGUgUUVNVSBjcmFzaC4KPiAKPiBJTU8gWGVuIG5lZWRz
IHRvIGJlIGNhcGFibGUgb2YgY2xlYW5pbmcgYW55IGJpbmRpbmdzIGFuZCBtYXBwaW5ncyBkb25l
Cj4gYnkgdGhlIHRvb2xzdGFjayBvciB0aGUgZGV2aWNlIG1vZGVsIGluIG9yZGVyIHRvIGJlIGFi
bGUgdG8gY29ycmVjdGx5Cj4gcmVjb3ZlciBmcm9tIGEgZGV2aWNlIG1vZGVsIG9yIHRvb2xzdGFj
ayBjcmFzaC4KCkJ1dCBwb3NzaWJseSB3aXRoIHRvb2wgc3RhY2sgYXNzaXN0YW5jZTogUmF0aGVy
IHRoYW4gZG9pbmcgaXQgKGluIGEKcG90ZW50aWFsbHkgZnJhZ2lsZSB3YXksIGFzIHBlciBteSBv
dGhlciBjb21tZW50cykgYXMgYW4gaW50ZWdyYWwKcGFydCBvZiBkZWFzc2lnbi1kZXZpY2UsIGl0
IGNvdWxkIGJlIGEgc2VwYXJhdGUgZG9tY3RsIHRvIGJlCmlzc3VlZCBmaXJzdC4gT3Igb3RoZXJ3
aXNlIGZhaWx1cmUgaGVyZSBvdWdodCB0byBsZWFkIHRvIGZhaWx1cmUgb2YKZGVhc3NpZ24tZGV2
aWNlLCByYXRoZXIgdGhhbiAoZS5nLikgYW4gaW5maW5pdGUgbG9vcC4KCkphbgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
