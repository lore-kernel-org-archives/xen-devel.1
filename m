From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/5] hvm/mtrr: use the hardware number of
 variable ranges for Dom0
Date: Mon, 14 May 2018 08:14:31 -0600
Message-ID: <5AF999C702000078001C2828@prv1-mh.provo.novell.com>
References: <20180510171505.37309-1-roger.pau@citrix.com>
 <20180510171505.37309-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=r2k+=ib=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fIEFH-0002pz-MO
 for xen-devel@lists.xenproject.org; Mon, 14 May 2018 14:14:35 +0000
In-Reply-To: <20180510171505.37309-3-roger.pau@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA1LjE4IGF0IDE5OjE1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLQo+ICB4ZW4vYXJjaC94ODYvaHZtL210cnIuYyB8IDEzICsrKysrKysrKysrLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpXaGF0IGFib3V0
IGh2bV9tc3Jfe3JlYWQsd3JpdGV9X2ludGVyY2VwdCgpJ3MgdXNlcyBvZiBNVFJSX1ZDTlQ/Cgo+
IEBAIC02ODMsNiArNjg2LDkgQEAgc3RhdGljIGludCBodm1fc2F2ZV9tdHJyX21zcihzdHJ1Y3Qg
ZG9tYWluICpkLCBodm1fZG9tYWluX2NvbnRleHRfdCAqaCkKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IChtdHJyX3N0YXRlLT5lbmFibGVkIDw8IDEwKTsKPiAgICAgICAgICBo
d19tdHJyLm1zcl9tdHJyX2NhcCA9IG10cnJfc3RhdGUtPm10cnJfY2FwOwo+ICAKPiArICAgICAg
ICBpZiAoIChtdHJyX3N0YXRlLT5tdHJyX2NhcCAmIDB4ZmYpICE9IE1UUlJfVkNOVCApCj4gKyAg
ICAgICAgICAgIHJldHVybiAtRUlOVkFMOwoKSSBjZXJ0YWlubHkgYWdyZWUgd2l0aCB0aGlzIG9u
ZSwgYnV0IC4uLgoKPiBAQCAtNzI3LDYgKzczMyw5IEBAIHN0YXRpYyBpbnQgaHZtX2xvYWRfbXRy
cl9tc3Ioc3RydWN0IGRvbWFpbiAqZCwgaHZtX2RvbWFpbl9jb250ZXh0X3QgKmgpCj4gIAo+ICAg
ICAgbXRycl9zdGF0ZS0+bXRycl9jYXAgPSBod19tdHJyLm1zcl9tdHJyX2NhcDsKPiAgCj4gKyAg
ICBpZiAoIChtdHJyX3N0YXRlLT5tdHJyX2NhcCAmIDB4ZmYpICE9IE1UUlJfVkNOVCApCj4gKyAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7CgouLi4gaXNuJ3QgdGhpcyBtb3JlIHN0cmljdCB0aGFuIGl0
IG5lZWRzIHRvIGJlPyBBIHNtYWxsZXIgaW5jb21pbmcgY291bnQKb3VnaHQgdG8gYmUgb2theSBJ
IHdvdWxkIHRoaW5rLiBSZWxheGluZyB0aGluZ3MgaGVyZSB3b3VsZCB0aGVuIG9mCmNvdXJzZSBh
bHNvIHJlcXVpcmUgcmVsYXhpbmcgdGhpbmdzIG9uIHRoZSBzYXZlIHNpZGUuCgpKYW4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
