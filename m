From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] xen/arm: Allow cleaning the directory even
 when CONFIG_EARLY_PRINTK is set
Date: Wed, 24 Apr 2019 11:47:04 +0100
Message-ID: <d664ac40-a4aa-9967-8534-ea722f8e0724@arm.com>
References: <20190422164106.20331-1-julien.grall@arm.com>
 <alpine.DEB.2.10.1904231709250.24598@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8RIj=S2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJFQi-0001zH-TG
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 10:47:08 +0000
In-Reply-To: <alpine.DEB.2.10.1904231709250.24598@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, ian.jackson@eu.citrix.com, jbeulich@suse.com, Andrew.Cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyNC8wNC8yMDE5IDAxOjIwLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
TW9uLCAyMiBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBDT05GSUdfRUFSTFlfUFJJ
TlRLIGNhbiBvbmx5IGJlIHNldCB3aGVuIENPTkZJR19ERUJVRyBpcyBlbmFibGVkLiBJdCBjYW4K
Pj4gYmUgcXVpdGUgY29udmVuaWVudCB0byBvbmx5IG1vZGlmeSB0aGUgdGFyZ2V0Lgo+Pgo+PiBI
b3dldmVyLCB0aGUgdGFyZ2V0IGNsZWFuIHdpbGwgbm90IGluY2x1ZGUgdGhlIC5jb25maWcuCj4+
Cj4+IFRoaXMgbWVhbnMgQ09ORklHX0RFQlVHIGlzIG5vdCBlbmFibGVkIGFuZCB0aGVyZWZvcmUg
bWFrZSB3aWxsIHRocm93Cj4+IGFuIGVycm9yIHByZXZlbnRpbmcgY2xlYW4gdG8gY29udGludWUu
Cj4+Cj4+IFRoZSBjaGVjayBpcyBub3QgbW92ZWQgYXQgbGlua2luZyB0aW1lLgo+ICAgICAgICAg
ICAgICAgICBeIG5vdyA/Cj4gCj4gCj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+Cj4+Cj4+IC0tLQo+Pgo+PiBUaGlzIGNvZGUgaXMgcHJldHR5IG5h
c3R5LCBidXQgSSBoYXZlbid0IGZvdW5kIGEgYmV0dGVyIHdheSBmb3IgYXZvaWRpbmcKPj4gdG8g
Y2hlY2sgaWYgQ09ORklHX0RFQlVHIGlzIGVuYWJsZWQgd2hlbiB0aGUgdGFyZ2V0IGNsZWFuIGlz
IGNhbGxlZC4KPj4KPj4gSWRlYWxseSB3ZSB3aWxsIHdhbnQgdG8gbW92ZSBDT05GSUdfRUFSTFlf
UFJJTlRLIGluIEtjb25maWcuIEkgaGF2ZW4ndAo+PiBoYWQgdGltZSB5ZXQgdG8gbG9vayBhdCBp
dCBwcm9wZXJseSBzbyBmYXIuCj4gCj4gQ2FuIHdlIGluY2x1ZGUgLmNvbmZpZyBpbiB0aGUgY2xl
YW4gdGFyZ2V0PwpJIGRpZCBvbmx5IG1lbnRpb24gdGhlIGNsZWFuIHRhcmdldCBpbiB0aGUgY29t
bWl0IG1lc3NhZ2UgYnV0IHRoZSBpc3N1ZSBpcyB0aGUgCnNhbWUgZm9yIGFueSB0YXJnZXQgbm90
IGluY2x1ZGUgLmNvbmZpZy4gRm9yIGluc3RhbmNlLCBhIGRpc3RjbGVhbiByZXN1bHRzIHRvIAp0
aGUgc2FtZSBlcnJvci4KCkl0IGFsc28gZmVlbHMgcXVpdGUgd3JvbmcgdG8gZXhwZWN0IHRoZSAu
Y29uZmlnIHRvIGJlIGluIHBsYWNlIGZvciBhbnkgdGFyZ2V0IApvdGhlciB0aGFuIGJ1aWxkLgoK
Q2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
