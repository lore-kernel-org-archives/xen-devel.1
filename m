From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] xen: make opt_xen_console true before
 console initialisation
Date: Fri, 28 Sep 2018 09:19:56 -0600
Message-ID: <5BAE469C02000078001ECF54@prv1-mh.provo.novell.com>
References: <20180928082437.15140-1-wei.liu2@citrix.com>
 <20180928082437.15140-3-wei.liu2@citrix.com>
 <5BAE43F202000078001ECF13@prv1-mh.provo.novell.com>
 <20180928151207.kinkppv7klym6zoe@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ucvl=mk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g5uYh-0000DC-8U
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 15:19:59 +0000
In-Reply-To: <20180928151207.kinkppv7klym6zoe@zion.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjA5LjE4IGF0IDE3OjEyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBTZXAgMjgsIDIwMTggYXQgMDk6MDg6MzRBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAyOC4wOS4xOCBhdCAxMDoyNCwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IC0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jCj4+ID4gKysrIGIveGVu
L2RyaXZlcnMvY2hhci9jb25zb2xlLmMKPj4gPiBAQCAtOTEsNyArOTEsOCBAQCBzdGF0aWMgdWlu
dDMyX3QgY29ucmluZ2MsIGNvbnJpbmdwOwo+PiA+ICBzdGF0aWMgaW50IF9fcmVhZF9tb3N0bHkg
c2VyY29uX2hhbmRsZSA9IC0xOwo+PiA+ICAKPj4gPiAgI2lmZGVmIENPTkZJR19YODYKPj4gPiAt
c3RhdGljIGJvb2wgX19yZWFkX21vc3RseSBvcHRfY29uc29sZV94ZW47IC8qIGNvbnNvbGU9eGVu
ICovCj4+ID4gKy8qIFNldCB0byB0cnVlIGF0IHN0YXJ0IG9mIGRheSB0byBjYXRjaCBlYXJseSBi
b290IGlzc3VlcyAqLwo+PiA+ICtzdGF0aWMgYm9vbCBfX3JlYWRfbW9zdGx5IG9wdF9jb25zb2xl
X3hlbiA9IHRydWU7IC8qIGNvbnNvbGU9eGVuICovCj4+IAo+PiBXaGVuIEFuZHJldyBzdWdnZXN0
ZWQgdGhpcywgaWlyYyBoZSBzYWlkIHRvIG1ha2UgdGhlIHZhcmlhYmxlCj4+IHRyaXN0YXRlLiBP
dGhlcndpc2UgLi4uCj4gCj4gSSBmaWd1cmUgaXQgZG9lc24ndCBuZWVkIHRvIGJlIHRyaXN0YXRl
Lgo+IAo+PiAKPj4gPiBAQCAtODIxLDYgKzgyMiwxMCBAQCB2b2lkIF9faW5pdCBjb25zb2xlX2lu
aXRfcHJlaXJxKHZvaWQpCj4+ID4gIAo+PiA+ICAgICAgc2VyaWFsX2luaXRfcHJlaXJxKCk7Cj4+
ID4gIAo+PiA+ICsjaWZkZWYgQ09ORklHX1g4Ngo+PiA+ICsgICAgb3B0X2NvbnNvbGVfeGVuID0g
ZmFsc2U7Cj4+ID4gKyNlbmRpZgo+PiAKPj4gLi4uIHlvdSBwb3NzaWJseSBvdmVycmlkZSBhIHVz
ZXIgc3BlY2lmaWVkICJ0cnVlIiBoZXJlLgo+IAo+IERvIEk/IFRoaXMgaXMgcmlnaHQgYmVmb3Jl
IG9wdGlvbiBwYXJzaW5nLCBkdXJpbmcgd2hpY2ggb3B0X2NvbnNvbGVfeGVuCj4gaXMgc2V0LgoK
SG1tLCBJIHNlZSAtIEkgZGlkbid0IHJlY2FsbCB3ZSBzdGlsbCBoYXZlIHRoaXMgYWQgaG9jIHBh
cnNpbmcgaW4KcGxhY2UsIGluc3RlYWQgb2YgdXNpbmcgY3VzdG9tX3BhcmFtKCkuIEJ1dCBpc24n
dCB0aGlzIHRvbyBlYXJseSB0aGVuLAphcyBtZXNzYWdlcyBpc3N1ZWQgZnJvbSB0aGUgcGFyc2lu
ZyBjb2RlIHRoZW4gd291bGQgbm90IGJlIHZpc2libGU/CgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
