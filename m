From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] dmar: iommu mem leak fix
Date: Mon, 20 Aug 2018 02:24:47 -0600
Message-ID: <5B7A7ACF02000078001DFCD3@prv1-mh.provo.novell.com>
References: <b54e1bda-f2ec-46f1-b54a-06483282e0d6@default>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <b54e1bda-f2ec-46f1-b54a-06483282e0d6@default>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Srinivas REDDY Eeda <srinivas.eeda@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen-Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjA4LjE4IGF0IDA1OjMyLCA8emhlbnpob25nLmR1YW5Ab3JhY2xlLmNvbT4gd3Jv
dGU6Cj4gUmVsZWFzZSBtZW1vcnkgYWxsb2NhdGVkIGZvciBkcmhkIGlvbW11IGluIGVycm9yIHBh
dGguCj4gCj4gU2lnbmVkLW9mZi1ieTogWmhlbnpob25nIER1YW4gPHpoZW56aG9uZy5kdWFuQG9y
YWNsZS5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoK
QnV0IHRoaXMgbmVlZHMgYSBtYWludGFpbmVyIGFjaywgYW5kIHlvdSBkaWRuJ3QgQ2MgaGltIChu
b3cgZG9uZSkuCgpKYW4KCj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2RtYXIu
Ywo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9kbWFyLmMKPiBAQCAtMTAwLDYg
KzEwMCw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBkaXNhYmxlX2FsbF9kbWFyX3VuaXRzKHZvaWQp
Cj4gICAgICB7Cj4gICAgICAgICAgbGlzdF9kZWwoJmRyaGQtPmxpc3QpOwo+ICAgICAgICAgIHNj
b3BlX2RldmljZXNfZnJlZSgmZHJoZC0+c2NvcGUpOwo+ICsgICAgICAgIGlvbW11X2ZyZWUoZHJo
ZC0+aW9tbXUpOwo+ICAgICAgICAgIHhmcmVlKGRyaGQpOwo+ICAgICAgfQo+ICAgICAgbGlzdF9m
b3JfZWFjaF9lbnRyeV9zYWZlICggcm1yciwgX3JtcnIsICZhY3BpX3JtcnJfdW5pdHMsIGxpc3Qg
KQo+IC0tIAo+IDEuNy4zCgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
