From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 08/11] vpci/header: allow multiple map
 operations
Date: Fri, 28 Sep 2018 09:38:13 -0600
Message-ID: <5BAE4AE502000078001ECF9B@prv1-mh.provo.novell.com>
References: <20180717094830.54806-1-roger.pau@citrix.com>
 <20180717094830.54806-9-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ucvl=mk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g5uqO-0002GC-Ba
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 15:38:16 +0000
In-Reply-To: <20180717094830.54806-9-roger.pau@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA3LjE4IGF0IDExOjQ4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMKPiArKysgYi94ZW4vZHJpdmVycy92cGNp
L2hlYWRlci5jCj4gQEAgLTE4NCw3ICsxODQsMTkgQEAgc3RhdGljIHZvaWQgZGVmZXJfbWFwKHN0
cnVjdCBkb21haW4gKmQsIHN0cnVjdCBwY2lfZGV2ICpwZGV2LAo+ICAgICAgICogc3RhcnRlZCBm
b3IgdGhlIHNhbWUgZGV2aWNlIGlmIHRoZSBkb21haW4gaXMgbm90IHdlbGwtYmVoYXZlZC4KPiAg
ICAgICAqLwo+ICAgICAgY3Vyci0+dnBjaS5wZGV2ID0gcGRldjsKPiAtICAgIGN1cnItPnZwY2ku
bWVtID0gbWVtOwo+ICsgICAgaWYgKCAhY3Vyci0+dnBjaS5tZW0gKQo+ICsgICAgICAgIGN1cnIt
PnZwY2kubWVtID0gbWVtOwo+ICsgICAgZWxzZQo+ICsgICAgewo+ICsgICAgICAgIGludCByYyA9
IHJhbmdlc2V0X21lcmdlKGN1cnItPnZwY2kubWVtLCBtZW0pOwo+ICsKPiArICAgICAgICBpZiAo
IHJjICkKPiArICAgICAgICAgICAgZ3ByaW50ayhYRU5MT0dfV0FSTklORywKPiArICAgICAgICAg
ICAgICAgICAgICAiJTA0eDolMDJ4OiUwMnguJXU6IHVuYWJsZSB0byAlc21hcCBtZW1vcnkgcmVn
aW9uOiAlZFxuIiwKPiArICAgICAgICAgICAgICAgICAgICBwZGV2LT5zZWcsIHBkZXYtPmJ1cywg
UENJX1NMT1QocGRldi0+ZGV2Zm4pLAo+ICsgICAgICAgICAgICAgICAgICAgIFBDSV9GVU5DKHBk
ZXYtPmRldmZuKSwgbWFwID8gIiIgOiAidW4iLCByYyk7Cj4gKyAgICAgICAgcmFuZ2VzZXRfZGVz
dHJveShtZW0pOwo+ICsgICAgfQo+ICAgICAgY3Vyci0+dnBjaS5tYXAgPSBtYXA7Cj4gICAgICBj
dXJyLT52cGNpLnJvbV9vbmx5ID0gcm9tX29ubHk7CgpJcyBpdCBjZXJ0YWluIHRoYXQgYWxsIG90
aGVyIGFyZ3VtZW50cyBtYXRjaCAocGRldiwgbWFwLCByb21fb25seSk/CklmIHNvLCBwbGVhc2Ug
YWRkIEFTU0VSVCgpcyB0byB0aGF0IGVmZmVjdCwgYW5kIHBlcmhhcHMgYWxzbyBoYWxmIGEKc2Vu
dGVuY2UgdG8gdGhlIGRlc2NyaXB0aW9uIGFzIHRvIHdoeSB0aGF0IGlzIGd1YXJhbnRlZWQuCgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
