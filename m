From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 06/45] xen/arm: gic: Split the field
 state in gic_lr in 2 fields active and pending
Date: Fri, 16 Mar 2018 22:14:23 +0000
Message-ID: <1a63a8f2-2844-ee73-5e48-4323226c86c1@arm.com>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
 <20180315203050.19791-7-andre.przywara@linaro.org>
 <alpine.DEB.2.10.1803161430460.15548@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=skm+=gg=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ewxcl-0000fc-0u
 for xen-devel@lists.xenproject.org; Fri, 16 Mar 2018 22:14:55 +0000
In-Reply-To: <alpine.DEB.2.10.1803161430460.15548@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Andre Przywara <andre.przywara@linaro.org>
Cc: xen-devel@lists.xenproject.org, nd@arm.com, Andre Przywara <andre.przywara@arm.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxNi8wMy8yMDE4IDIxOjM0LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24gVGh1
LCAxNSBNYXIgMjAxOCwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4+IEZyb206IEp1bGllbiBHcmFs
bCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20t
YXJtL2dpYy5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9naWMuaAo+PiBpbmRleCBkYWVjNTE0OTlj
Li5jMzI4NjFkNGZhIDEwMDY0NAo+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2dpYy5oCj4+
ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ2ljLmgKPj4gQEAgLTIwOSw3ICsyMDksOCBAQCBz
dHJ1Y3QgZ2ljX2xyIHsKPj4gICAgICAvKiBWaXJ0dWFsIElSUSAqLwo+PiAgICAgIHVpbnQzMl90
IHZpcnE7Cj4+ICAgICAgdWludDhfdCBwcmlvcml0eTsKPj4gLSAgIHVpbnQ4X3Qgc3RhdGU7Cj4+
ICsgICBib29sIGFjdGl2ZTsKPj4gKyAgIGJvb2wgcGVuZGluZzsKPj4gICAgICBib29sIGh3X3N0
YXR1czsKPj4gICB9Owo+IAo+IEkgbGlrZSB0aGUgcmVhZGFiaWxpdHkgYnV0IGRpc2xpa2UgdGhl
IGluY3JlYXNlIG1lbW9yeSB1c2FnZS4gSSB3b3VsZAo+IGhhdmUga2VwdCBhIHNpbmdsZSB1aW50
OF90IGFuZCBJIHdvdWxkIGhhdmUgdXNlZCBzdGF0dXMgZmxhZ3MgYXMgYW4KPiBhcHByb2FjaCwg
bWF5YmUgSSB3b3VsZCBoYXZlIGltcHJvdmVkIG9uIHRob3NlIGZsYWdzLgoKV2h5IGlzIHRoYXQg
aW1wb3J0YW50PyBnaWNfbHIgd2lsbCBvbmx5IGJlIGFsbG9jYXRlZCBvbiB0aGUgc3RhY2suLi4K
CkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
