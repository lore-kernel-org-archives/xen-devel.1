From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 23/23] xen: decouple HVM and IOMMU
 capabilities
Date: Tue, 28 Aug 2018 05:56:00 -0600
Message-ID: <5B85385002000078001E291C@prv1-mh.provo.novell.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <0d120cf1e9585a6b1adbf1d4f1c85e6b6039f61f.1535285866.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=k/hy=ll=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fucbN-0008I8-2R
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 11:56:05 +0000
In-Reply-To: <0d120cf1e9585a6b1adbf1d4f1c85e6b6039f61f.1535285866.git-series.wei.liu2@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjA4LjE4IGF0IDE0OjE5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
SFZNIGFuZCBJT01NVSBhcmUgdHdvIGRpc3RpbmN0IGhhcmR3YXJlIGZlYXR1cmVzLCB5ZXQgdGhl
eSB3ZXJlCj4gYnVuZGxlZCB0b2dldGhlciBpbiBzeXNjdGwgYW5kIHhsJ3Mgb3V0cHV0Lgo+IAo+
IERlY291cGxlIHRoZW0gb24gc3lzY3RsIGxldmVsLiBPbiB0b29sc3RhY2sgbGV2ZWwgd2Ugc3Rp
bGwgbmVlZCB0bwo+IG1haW50YWluIGEgc2Vuc2libGUgc2VtYW50aWNzIGZvciBgeGwgaW5mb2Au
IE1hc3NhZ2UgdGhlIGluZm9ybWF0aW9uCj4gYWNjb3JkaW5nIHRvIHRoZSBmb2xsb3dpbmcgdGFi
bGU6Cj4gCj4gcHYgICAgICBodm0gICAgIGlvbW11ICAgICAgICAgICBmbGFncyBpbiB4bCBpbmZv
Cj4gMCAgICAgICAwICAgICAgIDAgICAgICAgICAgICAgICBuL2EKPiAwICAgICAgIDAgICAgICAg
MSAgICAgICAgICAgICAgIG4vYQo+IDAgICAgICAgMSAgICAgICAwICAgICAgICAgICAgICAgaHZt
Cj4gMCAgICAgICAxICAgICAgIDEgICAgICAgICAgICAgICBodm0gaHZtX2RpcmVjdGlvCj4gMSAg
ICAgICAwICAgICAgIDAgICAgICAgICAgICAgICBOSUwKPiAxICAgICAgIDAgICAgICAgMSAgICAg
ICAgICAgICAgIGRpcmVjdGlvCj4gMSAgICAgICAxICAgICAgIDAgICAgICAgICAgICAgICBodm0K
PiAxICAgICAgIDEgICAgICAgMSAgICAgICAgICAgICAgIGh2bSBodm1fZGlyZWN0aW8gZGlyZWN0
aW8KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKSHlw
ZXJ2aXNvciBzaWRlCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpU
b29scyBzaWRlIGxvb2tzIHNlbnNpYmxlIHRvIG1lIHRvbywgYnV0IEknbSBub3QgZ29pbmcgdG8g
Y2xhaW0gSSd2ZQpwcm9wZXJseSByZXZpZXdlZCBpdC4KCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
