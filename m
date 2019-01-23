From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.12 1/8] xen/arm: Only set necessary
 flags when initializing HCR_EL2
Date: Wed, 23 Jan 2019 15:50:58 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1901231546160.17936@sstabellini-ThinkPad-X260>
References: <20181128164939.8329-1-julien.grall@arm.com>
 <20181128164939.8329-2-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3kqX=P7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gmSIN-0001n1-UP
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 23:50:59 +0000
In-Reply-To: <20181128164939.8329-2-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, andre.przywara@arm.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyOCBOb3YgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9ubHkge0EsRixJfU1P
IGFyZSBuZWNlc3NhcnkgdG8gcmVjZWl2ZSBpbnRlcnJ1cHRzIHVudGlsIGEgZ3Vlc3QgdkNQVSBp
cwo+IGxvYWRlZC4KPiAKPiBUaGUgcmVzdCBoYXZlIG5vIGVmZmVjdCBvbiBYZW4gYW5kIGl0IGlz
IGJldHRlciB0byBhdm9pZCBzZXR0aW5nIHRoZW0uCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gvYXJtL3RyYXBz
LmMgfCA4ICsrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90cmFwcy5jIGIveGVuL2Fy
Y2gvYXJtL3RyYXBzLmMKPiBpbmRleCA4OGZmZWViNDgwLi4xZWVjOTY2Mjk5IDEwMDY0NAo+IC0t
LSBhL3hlbi9hcmNoL2FybS90cmFwcy5jCj4gKysrIGIveGVuL2FyY2gvYXJtL3RyYXBzLmMKPiBA
QCAtMTgxLDggKzE4MSwxMiBAQCB2b2lkIGluaXRfdHJhcHModm9pZCkKPiAgICAgIFdSSVRFX1NZ
U1JFRygoSENQVFJfQ1BfTUFTSyAmIH4oSENQVFJfQ1AoMTApIHwgSENQVFJfQ1AoMTEpKSkgfCBI
Q1BUUl9UVEEsCj4gICAgICAgICAgICAgICAgICAgQ1BUUl9FTDIpOwo+ICAKPiAtICAgIC8qIFNl
dHVwIGh5cGVydmlzb3IgdHJhcHMgKi8KPiAtICAgIFdSSVRFX1NZU1JFRyhnZXRfZGVmYXVsdF9o
Y3JfZmxhZ3MoKSwgSENSX0VMMik7Cj4gKyAgICAvKgo+ICsgICAgICogQ29uZmlndXJlIEhDUl9F
TDIgd2l0aCB0aGUgYmFyZW1pbmltdW0gdG8gcnVuIFhlbiB1bnRpbCBhIGd1ZXN0CiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeIGJhcmUgbWluaW11bQoKPiArICAgICAqIGlz
IHNjaGVkdWxlZC4ge0EsSSxGfU1PIGJpdHMgYXJlIHNldCB0byBhbGxvdyBFTDIgcmVjZWl2aW5n
Cj4gKyAgICAgKiBpbnRlcnJ1cHRzLgo+ICsgICAgICovCj4gKyAgICBXUklURV9TWVNSRUcoSENS
X0FNTyB8IEhDUl9GTU8gfCBIQ1JfSU1PLCBIQ1JfRUwyKTsKPiAgICAgIGlzYigpOwo+ICB9CgpS
ZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
