From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 3/5] pci: switch pci_conf_{read/write} to
 use pci_sbdf_t
Date: Tue, 28 May 2019 12:05:29 +0200
Message-ID: <20190528100529.apc7rlpdzvgr3vzf@Air-de-Roger>
References: <20190510161056.48648-1-roger.pau@citrix.com>
 <20190510161056.48648-4-roger.pau@citrix.com>
 <5CE7C0F30200007800231EEB@prv1-mh.provo.novell.com>
 <20190527164419.oc75p6kmegiv3m7v@Air-de-Roger>
 <5CECF68A0200007800232E9B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2UAK=T4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hVYzF-0001vD-C6
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 10:05:41 +0000
Content-Disposition: inline
In-Reply-To: <5CECF68A0200007800232E9B@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDI6NTE6MjJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI3LjA1LjE5IGF0IDE4OjQ0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMDQ6MDE6MjNBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDEwLjA1LjE5IGF0IDE4OjEwLCA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4+ID4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3BjaS5oCj4gPj4g
PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vcGNpLmgKPiA+PiA+IEBAIC01OCw2ICs1OCwxMSBAQCB0
eXBlZGVmIHVuaW9uIHsKPiA+PiA+ICAgICAgfTsKPiA+PiA+ICB9IHBjaV9zYmRmX3Q7Cj4gPj4g
PiAgCj4gPj4gPiArI2RlZmluZSBQQ0lfU0JERl9UKHMsIGIsIGQsIGYpIFwKPiA+PiA+ICsgICAg
KChwY2lfc2JkZl90KSB7IC5zZWcgPSAocyksIC5idXMgPSAoYiksIC5kZXYgPSAoZCksIC5mdW5j
ID0gKGYpIH0pCj4gPj4gCj4gPj4gSSdkIHByZWZlciBpZiB0aGUgX1Qgc3VmZml4IGNvdWxkIGJl
IG9taXR0ZWQuIEFmYWljcyB0aGVyZSdzIG5vIHVzZSBvZiB0aGUKPiA+PiBleGlzdGluZyBQQ0lf
U0JERigpIGFueXdoZXJlIGluIHRoZSB0cmVlLCBzbyB0aGlzIHNob3VsZCBiZSBmaW5lLiBGb3IK
PiA+PiB0aGUgMm5kIG1hY3JvIGJlbG93IEkgY2FuJ3QgZWFzaWx5IHRlbGwgd2hldGhlciB0aGUg
ZmV3IGV4aXN0aW5nIHVzZWQKPiA+PiBoYXZlIGFsbCBkaXNhcHBlYXJlZCBieSBub3csIGJ1dCBp
dCBzZWVtcyBsaWtlbHkuCj4gPiAKPiA+IEkgY2FuIHNlZSBhYm91dCBkcm9wcGluZyB0aGUgX1Qg
c3VmZml4LCBidXQgSSB0aGluayB0aGVyZSdzIGxpa2VseQo+ID4gc29tZSBvdmVybGFwIGJldHdl
ZW4gdGhlIGludHJvZHVjdGlvbiBvZiBQQ0lfU0JERl9UIGFuZCB0aGUgbGFzdCB1c2VyCj4gPiBv
ZiB0aGUgY3VycmVudCBQQ0lfU0JERiBoZWxwZXJzLCBzbyBtYXliZSBpdCdzIGZpbmUgdG8gdXNl
IHRoZSBfVAo+ID4gc3VmZml4IGF0IGZpcnN0IGFuZCBoYXZlIG9uZSBmaW5hbCBwYXRjaCB0aGF0
IHJlbW92ZXMgaXQ/Cj4gCj4gVGhhdCB3b3VsZCBiZSBhbiBvcHRpb24gaWYgaXQgY2FuJ3QgYmUg
ZG9uZSBpbiBvbmUgZ28sIHN1cmUuCj4gCj4gPj4gQWxzbyBJJ20gYWZyYWlkIGluaXRpYWxpemVy
cyBvZiB0aGlzIGtpbmQgd2lsbCBicmVhayB0aGUgYnVpbGQgd2l0aCBvbGQgZ2NjLgo+ID4gCj4g
PiBJIHRob3VnaHQgd2UgZHJvcHBlZCBzdXBwb3J0IGZvciBzdWNoIG9sZCB2ZXJzaW9ucyBvZiBn
Y2MsIGlzIHRoYXQgbm90Cj4gPiB0aGUgY2FzZT8KPiAKPiBObyB5ZXQsIGFzIHBlciAuL1JFQURN
RS4KClJpZ2h0LCBzbyB0aGVuIEkgZ3Vlc3MgdGhlIG9ubHkgc29sdXRpb24gd291bGQgYmUgdG8g
dXNlIHNvbWV0aGluZwpsaWtlOgoKI2RlZmluZSBQQ0lfU0JERl9UKHMsIGIsIGQsIGYpIFwKICAg
ICgocGNpX3NiZGZfdCkgeyAuc2JkZiA9IFBDSV9TQkRGKHMsYixkLGYpIH0pCgpBbmQgc2ltaWxh
cmx5IGZvciB0aGUgb3RoZXIgaW5pdGlhbGl6ZXJzLiBJIGd1ZXNzIHRoZW4geW91IHdvdWxkIGJl
CmZpbmUgd2l0aCB1c2luZyB0aGUgX1Qgc3VmZml4IGZvciB0aG9zZSBoZWxwZXJzIGFuZCBrZWVw
aW5nIHRoZQpjdXJyZW50IG9uZXMgYXMtaXM/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
