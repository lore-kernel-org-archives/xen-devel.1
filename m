From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Subject: Re: [PATCH] x86/physdev: Remove redundant assignment in
 allocate_and_map_msi_pirq()
Date: Mon, 23 Jul 2018 11:39:00 +0800
Message-ID: <50709b27-e5c0-ca53-54dc-ea2f0afa1f51@oracle.com>
References: <6be2c543-bca6-4e52-870a-9ed63fd6c67f@default>
 <20180720101301.h66ypbccenhfwwev@mac.bytemobile.com>
 <df6a3995-140f-215c-faa5-56b5df62a9e1@citrix.com>
Reply-To: zhenzhong.duan@oracle.com
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <df6a3995-140f-215c-faa5-56b5df62a9e1@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Srinivas Eeda <srinivas.eeda@oracle.com>, jbeulich@suse.com, Xen-Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

5ZyoIDIwMTgvNy8yMCAxODoxMywgQW5kcmV3IENvb3BlciDlhpnpgZM6Cj4gT24gMjAvMDcvMTgg
MTE6MTMsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+IE9uIEZyaSwgSnVsIDIwLCAyMDE4IGF0
IDAyOjI5OjM0QU0gLTA3MDAsIFpoZW56aG9uZyBEdWFuIHdyb3RlOgo+Pj4gTm8gZnVuY3Rpb25h
bCBjaGFuZ2UuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogWmhlbnpob25nIER1YW4gPHpoZW56aG9u
Zy5kdWFuQG9yYWNsZS5jb20+Cj4+PiAtLS0KPj4+ICAgeGVuL2FyY2gveDg2L2lycS5jIHwgICAg
MiAtLQo+Pj4gICAxIGZpbGVzIGNoYW5nZWQsIDAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2lycS5jIGIveGVuL2FyY2gveDg2
L2lycS5jCj4+PiBpbmRleCA4N2VmMmU4Li41MjUzZmQxIDEwMDY0NAo+Pj4gLS0tIGEveGVuL2Fy
Y2gveDg2L2lycS5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvaXJxLmMKPj4+IEBAIC0yNzAxLDgg
KzI3MDEsNiBAQCBpbnQgYWxsb2NhdGVfYW5kX21hcF9tc2lfcGlycShzdHJ1Y3QgZG9tYWluICpk
LCBpbnQgaW5kZXgsIGludCAqcGlycV9wLAo+Pj4gICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+
Pj4gICAgICAgfQo+Pj4gICAKPj4+IC0gICAgbXNpLT5pcnEgPSBpcnE7Cj4+IEkgd291bGQgcHJl
ZmVyIHRvIHJlbW92ZSB0aGUgYXNzaWdubWVudCBpbiB0aGUgTUFQX1BJUlFfVFlQRV9NVUxUSV9N
U0kKPj4gY2FzZSByYXRoZXIgdGhhbiBoZXJlLiBJTU8gdGhpcyBvbmUgbWFrZXMgaXQgY2xlYXJl
ciB0aGF0IG1zaS0+aXJxIGlzCj4+IGFsd2F5cyBzZXQuCj4gCj4gTWUgdG9vLsKgIEkgY2FuIGZp
eCB0aGlzIHVwIG9uIGNvbW1pdC4KU3VyZSwgZ28gYWhlYWQsIHRoYW5rcyBSb2dlciwgQW5kcmV3
IGZvciByZXZpZXcuCgpSZWdhcmRzClpoZW56aG9uZwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
