From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 2/2] xen: make opt_xen_console true before
 console initialisation
Date: Fri, 28 Sep 2018 16:12:07 +0100
Message-ID: <20180928151207.kinkppv7klym6zoe@zion.uk.xensource.com>
References: <20180928082437.15140-1-wei.liu2@citrix.com>
 <20180928082437.15140-3-wei.liu2@citrix.com>
 <5BAE43F202000078001ECF13@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rttn=mk=citrix.com=prvs=802525662=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g5uR9-0007vK-Kc
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 15:12:11 +0000
Content-Disposition: inline
In-Reply-To: <5BAE43F202000078001ECF13@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBTZXAgMjgsIDIwMTggYXQgMDk6MDg6MzRBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI4LjA5LjE4IGF0IDEwOjI0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiAtLS0gYS94ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYwo+ID4gKysrIGIveGVuL2Ry
aXZlcnMvY2hhci9jb25zb2xlLmMKPiA+IEBAIC05MSw3ICs5MSw4IEBAIHN0YXRpYyB1aW50MzJf
dCBjb25yaW5nYywgY29ucmluZ3A7Cj4gPiAgc3RhdGljIGludCBfX3JlYWRfbW9zdGx5IHNlcmNv
bl9oYW5kbGUgPSAtMTsKPiA+ICAKPiA+ICAjaWZkZWYgQ09ORklHX1g4Ngo+ID4gLXN0YXRpYyBi
b29sIF9fcmVhZF9tb3N0bHkgb3B0X2NvbnNvbGVfeGVuOyAvKiBjb25zb2xlPXhlbiAqLwo+ID4g
Ky8qIFNldCB0byB0cnVlIGF0IHN0YXJ0IG9mIGRheSB0byBjYXRjaCBlYXJseSBib290IGlzc3Vl
cyAqLwo+ID4gK3N0YXRpYyBib29sIF9fcmVhZF9tb3N0bHkgb3B0X2NvbnNvbGVfeGVuID0gdHJ1
ZTsgLyogY29uc29sZT14ZW4gKi8KPiAKPiBXaGVuIEFuZHJldyBzdWdnZXN0ZWQgdGhpcywgaWly
YyBoZSBzYWlkIHRvIG1ha2UgdGhlIHZhcmlhYmxlCj4gdHJpc3RhdGUuIE90aGVyd2lzZSAuLi4K
CkkgZmlndXJlIGl0IGRvZXNuJ3QgbmVlZCB0byBiZSB0cmlzdGF0ZS4KCj4gCj4gPiBAQCAtODIx
LDYgKzgyMiwxMCBAQCB2b2lkIF9faW5pdCBjb25zb2xlX2luaXRfcHJlaXJxKHZvaWQpCj4gPiAg
Cj4gPiAgICAgIHNlcmlhbF9pbml0X3ByZWlycSgpOwo+ID4gIAo+ID4gKyNpZmRlZiBDT05GSUdf
WDg2Cj4gPiArICAgIG9wdF9jb25zb2xlX3hlbiA9IGZhbHNlOwo+ID4gKyNlbmRpZgo+IAo+IC4u
LiB5b3UgcG9zc2libHkgb3ZlcnJpZGUgYSB1c2VyIHNwZWNpZmllZCAidHJ1ZSIgaGVyZS4KCkRv
IEk/IFRoaXMgaXMgcmlnaHQgYmVmb3JlIG9wdGlvbiBwYXJzaW5nLCBkdXJpbmcgd2hpY2ggb3B0
X2NvbnNvbGVfeGVuCmlzIHNldC4KCldlaS4KCj4gCj4gSmFuCj4gCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
