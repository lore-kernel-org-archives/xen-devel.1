From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 6/6] amd/iommu: skip bridge devices when
 updating IOMMU page tables
Date: Tue, 20 Nov 2018 09:45:13 -0700
Message-ID: <5BF43A1902000078001FE31E@prv1-mh.provo.novell.com>
References: <20181120160153.45259-1-roger.pau@citrix.com>
 <20181120160153.45259-7-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zydc=n7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gP99K-0003Sa-KO
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 16:45:18 +0000
In-Reply-To: <20181120160153.45259-7-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjExLjE4IGF0IDE3OjAxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEJyaWRnZXMgYXJlIG5vdCBiZWhpbmQgYW4gSU9NTVUsIGFuZCBhcmUgYWxyZWFkeSBzcGVjaWFs
IGNhc2VkIGFuZAo+IHNraXBwZWQgaW4gYW1kX2lvbW11X2FkZF9kZXZpY2UuIEFwcGx5IHRoZSBz
YW1lIHNwZWNpYWwgY2FzaW5nIHdoZW4KPiB1cGRhdGluZyBwYWdlIHRhYmxlcy4KPiAKPiBUaGlz
IGlzIHJlcXVpcmVkIG9yIGVsc2UgdXBkYXRlX3BhZ2luZ19tb2RlIHdpbGwgZmFpbCBhbmQgcmV0
dXJuIGFuCj4gZXJyb3IgdG8gdGhlIGNhbGxlciAoYW1kX2lvbW11X3t1bn1tYXBfcGFnZSkgd2hp
Y2ggd2lsbCBkZXN0cm95IHRoZQo+IGRvbWFpbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAtLS0KPiBDYzogU3VyYXZlZSBTdXRo
aWt1bHBhbml0IDxzdXJhdmVlLnN1dGhpa3VscGFuaXRAYW1kLmNvbT4KPiBDYzogQnJpYW4gV29v
ZHMgPGJyaWFuLndvb2RzQGFtZC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBzaW5jZSB2NDoKPiAgLSBJ
bnZlcnQgY29uZGl0aW9uIG9yZGVyIHNvIHRoZXkgbWF0Y2ggdGhlIG9yZGVyIGluCj4gICAgYW1k
X2lvbW11X2FkZF9kZXZpY2UuCj4gIC0gRXhwYW5kIGNvbW1pdCBtZXNzYWdlIHRvIHNwZWxsIG91
dCB3aHkgdGhpcyBpcyByZXF1aXJlZC4KClRoYW5rcy4gTmV2ZXJ0aGVsZXNzIC4uLgoKPiAtLS0g
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfbWFwLmMKPiArKysgYi94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfbWFwLmMKPiBAQCAtNjEyLDYgKzYxMiwxMCBAQCBz
dGF0aWMgaW50IHVwZGF0ZV9wYWdpbmdfbW9kZShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBs
b25nIGRmbikKPiAgICAgICAgICAvKiBVcGRhdGUgZGV2aWNlIHRhYmxlIGVudHJpZXMgdXNpbmcg
bmV3IHJvb3QgdGFibGUgYW5kIHBhZ2luZyBtb2RlICovCj4gICAgICAgICAgZm9yX2VhY2hfcGRl
diggZCwgcGRldiApCj4gICAgICAgICAgewo+ICsgICAgICAgICAgICBpZiAoIHBkZXYtPnR5cGUg
PT0gREVWX1RZUEVfUENJX0hPU1RfQlJJREdFICYmCj4gKyAgICAgICAgICAgICAgICAgaXNfaGFy
ZHdhcmVfZG9tYWluKGQpICkKPiArICAgICAgICAgICAgICAgIGNvbnRpbnVlOwoKLi4uIGJlZm9y
ZSBzcHJlYWRpbmcgdGhlIGlzc3VlIEknZCBzdGlsbCBsaWtlIHRvIHNlZSBjbGFyaWZpY2F0aW9u
IG9mIC8KanVzdGlmaWNhdGlvbiBmb3IgdGhlIGlzX2hhcmR3YXJlX2RvbWFpbigpIHBhcnQgb2Yg
dGhlIGNvbmRpdGlvbgp5b3UgY2xvbmUuIFN1cmF2ZWUsIEJyaWFuPwoKSmFuCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
