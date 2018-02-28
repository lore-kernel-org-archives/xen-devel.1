From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3] build: remove shim related targets
Date: Wed, 28 Feb 2018 05:29:06 -0700
Message-ID: <5A96AEA202000078001ACB31@prv-mh.provo.novell.com>
References: <20180221122218.37777-1-roger.pau@citrix.com>
 <5A969A6D02000078001ACA01@prv-mh.provo.novell.com>
 <20180228114722.pe3qegstcejubini@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ets7=fw=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1er0rA-0006RQ-49
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 12:29:12 +0000
In-Reply-To: <20180228114722.pe3qegstcejubini@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjAyLjE4IGF0IDEyOjQ3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgRmViIDI4LCAyMDE4IGF0IDA0OjAyOjUzQU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMjEuMDIuMTggYXQgMTM6MjIsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gLS0tIGEvdG9vbHMvZmlybXdhcmUvTWFrZWZpbGUKPj4gPiArKysgYi90b29s
cy9maXJtd2FyZS9NYWtlZmlsZQo+PiA+IEBAIC04LDYgKzgsNyBAQCBlbmRpZgo+PiA+ICAjIGh2
bWxvYWRlciBpcyBhIDMyLWJpdCBwcm90ZWN0ZWQgbW9kZSBiaW5hcnkuCj4+ID4gIFRBUkdFVCAg
ICAgIDo9IGh2bWxvYWRlci9odm1sb2FkZXIKPj4gPiAgSU5TVF9ESVIgOj0gJChERVNURElSKSQo
WEVORklSTVdBUkVESVIpCj4+ID4gK0RFQkdfRElSIDo9ICQoREVTVERJUikkKERFQlVHX0RJUikk
KFhFTkZJUk1XQVJFRElSKQo+PiAKPj4gVGhpcyBpcyBzY3Jld2luZyB1cCBteSBidWlsZCwgYW5k
IGxvb2tpbmcgYWdhaW4gSSBjYW4ndCBzZWUgaG93Cj4+IHRoaXMgY2FuIGJlIHJpZ2h0OiBCb3Ro
ICQoWEVORklSTVdBUkVESVIpIGFuZCAkKERFQlVHX0RJUikKPj4gYXJlIHN1cHBvc2VkIHRvIGJl
ICR7cHJlZml4fS1hYmxlLCB5ZXQgdGhlcmUgY2xlYXJseSBzaG91bGQgbm90Cj4+IGJlIGFuIGlu
Zml4IHJlc3VsdGluZyBmcm9tIHRoZSBjb25zdHJ1Y3Rpb24gb2YgdGhpcyBwYXRoLgo+IAo+IEJ5
IGJlaW5nIHByZWZpeGFibGUgeW91IG1lYW4gdGhhdCBib3RoIFhFTkZJUk1XQVJFRElSIGFuZCBE
RUJVR19ESVIKPiBjYW4gYmUgcmVsYXRpdmUgcGF0aHM/CgpCb3RoIHNob3VsZCBiZSBwb3NzaWJs
ZSB0byBsaXZlIGluIC91c3IvbGliIG9yIC91c3IvbG9jYWwvbGliLApmb3IgZXhhbXBsZS4KCj4+
IEluIHRoYXQgY29udGV4dCBJIHdvbmRlciB3aHkgREVCVUdfRElSIGlzIHNldCBpbgo+PiB7U3Rk
R05VLFN1bk9TfS5tayBpbnN0ZWFkIG9mIGhhdmluZyBhIHRlbXBsYXRlIGluCj4+IFBhdGhzLm1r
LmluLgo+IAo+IFRoZW4geW91IHdvdWxkIGhhdmUgdG8gcnVuIGNvbmZpZ3VyZSBiZWZvcmUgaW5z
dGFsbGluZyB0aGUgaHlwZXJ2aXNvciwKPiBiZWNhdXNlIHRoZSBpbnN0YWxsIGh5cGVydmlzb3Ig
dGFyZ2V0IHVzZXMgREVCVUdfRElSLgoKSSBkb24ndCB0aGluayBzbywgbm8uIFRoZSBoeXBlcnZp
c29yIHN1YnRyZWUgaXMgKGZvciBub3cpIGZpbmUgdG8KdXNlIHdoYXRldmVyIHtTdGRHTlUsU3Vu
T1N9Lm1rIHNheSwgYnV0IHRoZSB0b29scy8gc3VidHJlZQpzaG91bGRuJ3QgdXNlIGFueSBoYXJk
LWNvZGVkIHBhdGhzLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
