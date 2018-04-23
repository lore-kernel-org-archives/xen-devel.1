From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC 09/10] passthrough/intel: put some code
 under CONFIG_HVM
Date: Mon, 23 Apr 2018 09:47:05 -0600
Message-ID: <5ADDFFF902000078001BDA5C@prv1-mh.provo.novell.com>
References: <20180221214701.1646-1-wei.liu2@citrix.com>
 <20180221214701.1646-10-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jo30=hm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fAdgO-0004DK-4D
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 15:47:12 +0000
In-Reply-To: <20180221214701.1646-10-wei.liu2@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAyLjE4IGF0IDIyOjQ3LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
QEAgLTE4NzMsNiArMTg3Niw3IEBAIGludCBpb21tdV9wdGVfZmx1c2goc3RydWN0IGRvbWFpbiAq
ZCwgdTY0IGdmbiwgdTY0ICpwdGUsCj4gICAgICByZXR1cm4gcmM7Cj4gIH0KPiAgCj4gKyNpZmRl
ZiBDT05GSUdfSFZNCj4gIHN0YXRpYyBpbnQgX19pbml0IHZ0ZF9lcHRfcGFnZV9jb21wYXRpYmxl
KHN0cnVjdCBpb21tdSAqaW9tbXUpCj4gIHsKPiAgICAgIHU2NCBlcHRfY2FwLCB2dGRfY2FwID0g
aW9tbXUtPmNhcDsKPiBAQCAtMTg4NSw2ICsxODg5LDcgQEAgc3RhdGljIGludCBfX2luaXQgdnRk
X2VwdF9wYWdlX2NvbXBhdGlibGUoc3RydWN0IGlvbW11ICppb21tdSkKPiAgICAgIHJldHVybiAo
ZXB0X2hhc18ybWIoZXB0X2NhcCkgJiYgb3B0X2hhcF8ybWIpID09IGNhcF9zcHNfMm1iKHZ0ZF9j
YXApICYmCj4gICAgICAgICAgICAgKGVwdF9oYXNfMWdiKGVwdF9jYXApICYmIG9wdF9oYXBfMWdi
KSA9PSBjYXBfc3BzXzFnYih2dGRfY2FwKTsKPiAgfQo+ICsjZW5kaWYKCkkgdGhpbmsgdGhlICNp
ZmRlZiBoZXJlIHdvdWxkIGJldHRlciBtb3ZlIGludG8gdGhlIGZ1bmN0aW9uLCBzdWNoIHRoYXQg
Li4uCgo+IEBAIC0yMjgwLDcgKzIyODUsOSBAQCBpbnQgX19pbml0IGludGVsX3Z0ZF9zZXR1cCh2
b2lkKQo+ICAgICAgICAgIGlmICggIWNhcF9pbnRyX3Bvc3QoaW9tbXUtPmNhcCkgfHwgIWNwdV9o
YXNfY3gxNiApCj4gICAgICAgICAgICAgIGlvbW11X2ludHBvc3QgPSAwOwo+ICAKPiArI2lmZGVm
IENPTkZJR19IVk0KPiAgICAgICAgICBpZiAoICF2dGRfZXB0X3BhZ2VfY29tcGF0aWJsZShpb21t
dSkgKQo+ICsjZW5kaWYKPiAgICAgICAgICAgICAgaW9tbXVfaGFwX3B0X3NoYXJlID0gMDsKCi4u
LiB0aGlzIG9uZSBiZWNvbWVzIHVubmVjZXNzYXJ5LiBGdXJ0aGVybW9yZSBpb21tdV9oYXBfcHRf
c2hhcmUgaXMgYQp2YXJpYWJsZSB0aGF0J3MgbWVhbmluZ2Z1bCBmb3IgSFZNIG9ubHksIHNvIGFu
b3RoZXIgYWx0ZXJuYXRpdmUgd291bGQgYmUgdG8Kd2lkZW4gdGhlICNpZmRlZiBoZXJlLgoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
