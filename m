From: Julien Grall <julien.grall@arm.com>
Subject: Re: [OSSTEST PATCH 21/62] ts-kernel-build: disable
 host1x, which doesn't build
Date: Thu, 11 Apr 2019 11:56:21 +0100
Message-ID: <30339f8e-70c0-792b-7f05-8567d4e99f85@arm.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
 <20190410142408.22848-22-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SOEG=SN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hEXO3-0006Xe-PE
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 10:56:55 +0000
In-Reply-To: <20190410142408.22848-22-ian.jackson@eu.citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Cc: Thierry Reding <thierry.reding@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, dri-devel@lists.freedesktop.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiA0LzEwLzE5IDM6MjMgUE0sIElhbiBKYWNrc29uIHdyb3RlOgo+IEZyb206IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gCj4gRW1waXJpY2FsbHksIG9uIHN0cmV0Y2ggYXJt
aGY6Cj4gCj4gICAgZHJpdmVycy9ncHUvaG9zdDF4L2NkbWEuYzogSW4gZnVuY3Rpb24gYGhvc3Qx
eF9wdXNoYnVmZmVyX2luaXQnOgo+ICAgIGRyaXZlcnMvZ3B1L2hvc3QxeC9jZG1hLmM6OTQ6NDg6
IGVycm9yOiBwYXNzaW5nIGFyZ3VtZW50IDMgb2YgYGRtYV9hbGxvY193YycgZnJvbSBpbmNvbXBh
dGlibGUgcG9pbnRlciB0eXBlIFstV2Vycm9yPWluY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzXQo+
ICAgICAgIHBiLT5tYXBwZWQgPSBkbWFfYWxsb2Nfd2MoaG9zdDF4LT5kZXYsIHNpemUsICZwYi0+
cGh5cywKPiAJCQkJCQkgIF4KPiBldGMuCj4gCj4gVGhpcyBpcyBibG9ja2luZyB0aGUgdXBncmFk
ZSBvZiB0aGUgWGVuIFByb2plY3QgQ0kgdG8gRGViaWFuIHN0cmV0Y2gKPiBzbyBkaXNhYmxlIGl0
IGZvciBub3cuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4KPiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBDQzogU3RlZmFu
byBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IENDOiBUaGllcnJ5IFJlZGlu
ZyA8dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tPgo+IENDOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
CkNoZWVycywKCj4gLS0tCj4gICB0cy1rZXJuZWwtYnVpbGQgfCAzICsrKwo+ICAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS90cy1rZXJuZWwtYnVpbGQg
Yi90cy1rZXJuZWwtYnVpbGQKPiBpbmRleCAyMWI4Zjc4YS4uMGJjNDQzZGUgMTAwNzU1Cj4gLS0t
IGEvdHMta2VybmVsLWJ1aWxkCj4gKysrIGIvdHMta2VybmVsLWJ1aWxkCj4gQEAgLTU5NCw2ICs1
OTQsOSBAQCBjYXNlICR7WEVOX1RBUkdFVF9BUkNIfSBpbgo+ICAgICAgICopIDs7Cj4gICBlc2Fj
Cj4gICAKPiArIyBEaXNhYmxlIGNvbXBvbmVudHMgdGhhdCBkb24ndCBidWlsZAo+ICtzZXRvcHQg
Q09ORklHX1RFR1JBX0hPU1QxWCBuCj4gKwo+ICAgZXhpdCAwCj4gICBFTkQKPiAgIH0KPiAKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
