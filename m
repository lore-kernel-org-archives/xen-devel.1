From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/mmcfg: Remove redundant code in
 pci_mmcfg_reject_broken()
Date: Thu, 16 Aug 2018 01:13:37 -0600
Message-ID: <5B75242102000078001DEB76@prv1-mh.provo.novell.com>
References: <e6e0f512-58f4-42ac-8813-0320850a24b7@default>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <e6e0f512-58f4-42ac-8813-0320850a24b7@default>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Srinivas REDDY Eeda <srinivas.eeda@oracle.com>, Xen-Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjA4LjE4IGF0IDA3OjEwLCA8emhlbnpob25nLmR1YW5Ab3JhY2xlLmNvbT4gd3Jv
dGU6Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogWmhlbnpob25n
IER1YW4gPHpoZW56aG9uZy5kdWFuQG9yYWNsZS5jb20+CgpBY2tlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgoKQWxiZWl0IEkgd291bGQgaGF2ZSB3aXNoZWQgeW91IHdvdWxk
IGhhdmUgdGFrZW4gdGhlIG9wcG9ydHVuaXR5CnRvLCBhdCB0aGUgdmVyeSBsZWFzdCwgYWxzbyBt
b3ZlIGNmZydzIGRlY2xhcmF0aW9uIGludG8gdGhlIGZvcigpCnNjb3BlLiBUaGVyZSdzIG9idmlv
dXMgZnVydGhlciB0cml2aWFsIGNsZWFudXAgcG90ZW50aWFsIGluIHRoZQpmdW5jdGlvbi4KCkph
bgoKPiAtLS0gYS94ZW4vYXJjaC94ODYveDg2XzY0L21tY29uZmlnLXNoYXJlZC5jCj4gKysrIGIv
eGVuL2FyY2gveDg2L3g4Nl82NC9tbWNvbmZpZy1zaGFyZWQuYwo+IEBAIC0zNzEsOCArMzcxLDYg
QEAgc3RhdGljIGJvb2xfdCBfX2luaXQgcGNpX21tY2ZnX3JlamVjdF9icm9rZW4odm9pZCkKPiAg
ICAgICAgICAocGNpX21tY2ZnX2NvbmZpZ1swXS5hZGRyZXNzID09IDApKQo+ICAgICAgICAgIHJl
dHVybiAwOwo+ICAKPiAtICAgIGNmZyA9ICZwY2lfbW1jZmdfY29uZmlnWzBdOwo+IC0KPiAgICAg
IGZvciAoaSA9IDA7IGkgPCBwY2lfbW1jZmdfY29uZmlnX251bTsgaSsrKSB7Cj4gICAgICAgICAg
dTY0IGFkZHIsIHNpemU7Cj4gIAo+IC0tIAo+IDEuNy4zCgoKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
