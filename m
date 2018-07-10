From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen/x86: fix linker script to work with lld
Date: Tue, 10 Jul 2018 08:09:06 -0600
Message-ID: <5B44BE0202000078001D2B93@prv1-mh.provo.novell.com>
References: <20180628153809.50172-1-roger.pau@citrix.com>
 <5B35C51C02000078001350BF@prv1-mh.provo.novell.com>
 <20180703160227.GF4670@olila.local.net-space.pl>
 <5B3C7E0602000078001D0DDC@prv1-mh.provo.novell.com>
 <20180704104900.GI4670@olila.local.net-space.pl>
 <20180705074757.s4ztvfm56crljopt@mac.bytemobile.com>
 <20180706134839.GJ26572@olila.local.net-space.pl>
 <20180709164516.3n5ht4qq5kjhp3mh@mac.bytemobile.com>
 <20180710110052.GY26572@olila.local.net-space.pl>
 <5B449CC702000078001D2A03@prv1-mh.provo.novell.com>
 <20180710134954.twd2cs6hhdfqumkq@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xfjl=j2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fctKJ-0001DT-31
 for xen-devel@lists.xenproject.org; Tue, 10 Jul 2018 14:09:11 +0000
In-Reply-To: <20180710134954.twd2cs6hhdfqumkq@mac.bytemobile.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Daniel Kiper <daniel.kiper@oracle.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA3LjE4IGF0IDE1OjQ5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgSnVsIDEwLCAyMDE4IGF0IDA1OjQ3OjE5QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTAuMDcuMTggYXQgMTM6MDAsIDxkYW5pZWwua2lwZXJAb3JhY2xlLmNv
bT4gd3JvdGU6Cj4+ID4gT24gTW9uLCBKdWwgMDksIDIwMTggYXQgMDY6NDU6MTZQTSArMDIwMCwg
Um9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4gPj4gU29ycnkgZm9yIGFza2luZyBzbyBtYW55IHF1
ZXN0aW9ucywgYnV0IEkgd291bGQgbGlrZSB0byB0cnkgdG8gYXZvaWQKPj4gPj4gdGhlIERFRklO
RUQgY29uZGl0aW9uYWwgaW4gdGhlIGxpbmtlciBzY3JpcHQgaWYgcG9zc2libGUuCj4+ID4gCj4+
ID4gSWYgeW91IHdpc2ggdG8gZG8gdGhhdCB0aGVuIHB1dCBkdW1teSBlZmkgc3ltYm9sIGludG8g
Cj4+ID4geGVuL2FyY2gveDg2L2VmaS9zdHViLmMuCj4+IAo+PiBJIHRoaW5rIEkndmUgY2xlYXJs
eSBvYmplY3RlZCB0byB0aGF0IGJlZm9yZSAtIEkgc2ltcGx5IHNlZSBubyBuZWVkIGZvcgo+PiB3
YXN0aW5nIHRoZSBzcGFjZSBpbiBhbiBFRkktaW5jYXBhYmxlIGJpbmFyeS4KPiAKPiBCdXQgc3Vj
aCB3YXN0ZSBpcyBhbHNvIGFkZGVkIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciB5b3UgZGVmaW5lIHRo
ZQo+IHN5bWJvbCBpdCBpbiB0aGUgbGlua2VyIHNjcmlwdCBvciBpbiBhIEMgZmlsZT8KCkhvdyB0
aGF0PyBUaGVyZSdzIG5vIHNwYWNlIGFzc29jaWF0ZWQgd2l0aCB0aGUgc3ltYm9sIHdoZW4gZGVm
aW5lZAp0aGlzIHdheS4gRnJvbSB0aGUgcGVyc3BlY3RpdmUgb2YgdGhlIGJpbmFyeSwgdGhlIHNw
YWNlIGxpdmVzIHBhc3QgdGhlCmVuZCBvZiB0aGUgaW1hZ2UsIGJ1dCBzaW5jZSB0aGUgc3ltYm9s
IGlzIG5ldmVyIGFjY2Vzc2VkIChvciBlbHNlIGNvZGUKaXMgYnJva2VuIHNvbWV3aGVyZSkgaW4g
dGhlIG5vbi1FRkkgY2FzZSwgdGhpcyBpcyBva2F5LgoKSmFuCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
