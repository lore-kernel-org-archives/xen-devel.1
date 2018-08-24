From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 1/6] xen/arm: add THUNDERX kconfig
Date: Fri, 24 Aug 2018 09:33:54 +0100
Message-ID: <9bf11828-c85b-e750-3f4f-382cd8446a74@arm.com>
References: <alpine.DEB.2.10.1808231631270.14449@sstabellini-ThinkPad-X260>
 <1535067220-16825-1-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xwpf=lh=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ft7XZ-0004pf-6g
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 08:33:57 +0000
In-Reply-To: <1535067220-16825-1-git-send-email-sstabellini@kernel.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Cc: Zi.Lim@cavium.com, Stefano Stabellini <stefanos@xilinx.com>, andrii_anisov@epam.com, mjaggi@caviumnetworks.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyNC8wOC8xOCAwMDozMywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IEFkZCBh
IGtjb25maWcgb3B0aW9uIGZvciBDYXZpdW0gVGh1bmRlclggcGxhdGZvcm1zLiA+Cj4gU2lnbmVk
LW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgo+IENDOiBt
amFnZ2lAY2F2aXVtbmV0d29ya3MuY29tCj4gQ0M6IFppLkxpbUBjYXZpdW0uY29tCj4gLS0tCj4g
Q2hhbmdlcyBpbiB2MjoKPiAtIHJlbW92ZSBIQVNfU01NVQo+IC0tLQo+ICAgeGVuL2FyY2gvYXJt
L3BsYXRmb3Jtcy9LY29uZmlnICB8IDEzICsrKysrKysrKysrKysKPiAgIHhlbi9hcmNoL2FybS9w
bGF0Zm9ybXMvTWFrZWZpbGUgfCAgMSArCj4gICAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlv
bnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9LY29uZmlnIGIv
eGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy9LY29uZmlnCj4gaW5kZXggNDA5ZDNmOC4uYjljMGI3ZiAx
MDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL0tjb25maWcKPiArKysgYi94ZW4v
YXJjaC9hcm0vcGxhdGZvcm1zL0tjb25maWcKPiBAQCAtMzYsNiArMzYsMTYgQEAgY29uZmlnIE1Q
U09DCj4gICAJLS0taGVscC0tLQo+ICAgCUVuYWJsZSBhbGwgdGhlIHJlcXVpcmVkIGRyaXZlcnMg
Zm9yIFhpbGlueCBVbHRyYXNjYWxlKyBNUFNvQwo+ICAgCj4gK2NvbmZpZyBUSFVOREVSWAo+ICsJ
Ym9vbCAiQ2F2aXVtIFRodW5kZXJYIgo+ICsJZGVwZW5kcyBvbiBBUk1fNjQKPiArCXNlbGVjdCBH
SUNWMwo+ICsJc2VsZWN0IEhBU19JVFMKPiArCXNlbGVjdCBIQVNfUEwwMTEKPiArCXNlbGVjdCBB
Q1BJIGlmIEVYUEVSVCA9ICJ5IgoKUmVnYXJkbGVzcyB3aGF0IEkgc2FpZCBpbiB0aGUgY292ZXIg
bGV0dGVyLiBBQ1BJIHNob3VsZCByZWFsbHkgbm90IGJlIApzZWxlY3RlZCBoZXJlLiBJdCBpcyBu
b3QgbWFuZGF0b3J5IHRvIHVzZSBvbiBUaHVuZGVyLVggYW5kIHRoZSBkZWNpc2lvbiAKc2hvdWxk
IGJlIGxlZnQgdG8gdGhlIHVzZXIuCgpJbiBvdGhlciB3b3JkcywgdGhlIHBsYXRmb3JtIGNvbmZp
ZyBzaG91bGQgKm9ubHkqIHNlbGVjdCB3aGF0IGlzIAptYW5kYXRvcnkgdG8gcnVuIGEgZ2l2ZW4g
U29DLgoKVG8gYmUgaG9uZXN0LCBJIHdvdWxkIGV2ZW4gY29uc2lkZXIgdGhlIFVBUlQgYXMgb3B0
aW9uYWwgYmVjYXVzZSBhIHVzZXIgCm1heSBkZWNpZGUgaXQgZG9lcyBub3Qgd2FudCBhbnkgb3V0
cHV0IGZyb20gWGVuLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
