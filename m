From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 1/7] xen/arm: vpsci: Remove parameter 'ver'
 from do_common_cpu
Date: Thu, 8 Feb 2018 18:12:35 +0000
Message-ID: <8207b584-a833-3b95-e373-334d9bb52ed1@arm.com>
References: <20180205132011.27996-1-julien.grall@arm.com>
 <20180205132011.27996-2-julien.grall@arm.com>
 <CAOcqxo0JwQp5RbHPUc+sCUdCwyDmSzzgXa33b7f7zd=m1JVUMg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAOcqxo0JwQp5RbHPUc+sCUdCwyDmSzzgXa33b7f7zd=m1JVUMg@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Volodymyr Babchuk <vlad.babchuk@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, andre.przywara@linaro.org, Xen Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwNi8wMi8xOCAxNTo0MiwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4gSGkgSnVsaWVu
LAoKSGkgVm9sb2R5bXlyLAoKPiBPbiA1IEZlYnJ1YXJ5IDIwMTggYXQgMTU6MjAsIEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+PiBDdXJyZW50bHksIHRoZSBiZWhh
dmlvciBvZiBkb19jb21tb25fY3B1IHdpbGwgc2xpZ2h0bHkgY2hhbmdlIGRlcGVuZGluZwo+PiBv
biB0aGUgUFNDSSB2ZXJzaW9uIHBhc3NlZCBpbiBwYXJhbWV0ZXIuIExvb2tpbmcgYXQgdGhlIGNv
ZGUsIG1vcmUgdGhlCj4+IHNwZWNpZmljIDAuMiBiZWhhdmlvciBjb3VsZCBtb3ZlIG91dCBvZiB0
aGUgZnVuY3Rpb24gb3IgYWRhcHRlZCBmb3IgMC4xOgo+Pgo+PiAgICAgIC0geDAvcjAgY2FuIGJl
IHVwZGF0ZWQgb24gUFNDSSAwLjEgYmVjYXVzZSBnZW5lcmFsIHB1cnBvc2UgcmVnaXN0ZXJzCj4+
ICAgICAgYXJlIHVuZGVmaW5lZCB1cG9uIENQVSBvbi4KPj4gICAgICAtIFBTQ0kgMC4xIGRvZXMg
bm90IGRlZmluZWQgUFNDSV9BTFJFQURZX09OLiBIb3dldmVyLCBpdCB3b3VsZCBiZQo+PiAgICAg
IHNhZmVyIHRvIGJhaWwgb3V0IGlmIHRoZSBDUFUgaXMgYWxyZWFkeSBvbi4KPj4KPj4gQmFzZWQg
b24gdGhpcywgdGhlIHBhcmFtZXRlciAndmVyJyBpcyByZW1vdmVkIGFuZCBkb19wc2NpX2NwdV9v
bgo+PiAoaW1wbGVtZW50YXRpb24gZm9yIFBTQ0kgMC4xKSBpcyBhZGFwdGVkIHRvIGF2b2lkIHJl
dHVybmluZwo+PiBQU0NJX0FMUkVBRFlfT04uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gUmV2aWV3ZWQtYnk6IFZvbG9keW15ciBCYWJj
aHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4KClRoYW5rIHlvdSBmb3IgdGhlIHJldmll
d2VkLiBGSVksIEkgbW92ZWQgdGhhdCBwYXRjaCB0b3dhcmRzIHRoZSBlbmQgb2YgCnRoZSBzZXJp
ZXMgYXMgaXQgaXMgbm90IG5lY2Vzc2FyeSBmb3IgYmFja3BvcnRpbmcuIEkga2VwdCB5b3VyIApy
ZXZpZXdlZC1ieSBiZWNhdXNlIHRoZXJlIGFyZSBubyBjbGFzaC4KCkkgaG9wZSB0aGF0IGlzIGZp
bmUgZm9yIHlvdS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
