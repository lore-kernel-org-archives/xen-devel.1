From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3] build: remove shim related targets
Date: Wed, 28 Feb 2018 11:47:22 +0000
Message-ID: <20180228114722.pe3qegstcejubini@MacBook-Pro-de-Roger.local>
References: <20180221122218.37777-1-roger.pau@citrix.com>
 <5A969A6D02000078001ACA01@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=j/eq=fw=citrix.com=prvs=5902857c7=roger.pau@srs-us1.protection.inumbo.net>)
 id 1er0D8-0002rw-Er
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 11:47:50 +0000
Content-Disposition: inline
In-Reply-To: <5A969A6D02000078001ACA01@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMjgsIDIwMTggYXQgMDQ6MDI6NTNBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIxLjAyLjE4IGF0IDEzOjIyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gLS0tIGEvdG9vbHMvZmlybXdhcmUvTWFrZWZpbGUKPiA+ICsrKyBiL3Rvb2xzL2Zp
cm13YXJlL01ha2VmaWxlCj4gPiBAQCAtOCw2ICs4LDcgQEAgZW5kaWYKPiA+ICAjIGh2bWxvYWRl
ciBpcyBhIDMyLWJpdCBwcm90ZWN0ZWQgbW9kZSBiaW5hcnkuCj4gPiAgVEFSR0VUICAgICAgOj0g
aHZtbG9hZGVyL2h2bWxvYWRlcgo+ID4gIElOU1RfRElSIDo9ICQoREVTVERJUikkKFhFTkZJUk1X
QVJFRElSKQo+ID4gK0RFQkdfRElSIDo9ICQoREVTVERJUikkKERFQlVHX0RJUikkKFhFTkZJUk1X
QVJFRElSKQo+IAo+IFRoaXMgaXMgc2NyZXdpbmcgdXAgbXkgYnVpbGQsIGFuZCBsb29raW5nIGFn
YWluIEkgY2FuJ3Qgc2VlIGhvdwo+IHRoaXMgY2FuIGJlIHJpZ2h0OiBCb3RoICQoWEVORklSTVdB
UkVESVIpIGFuZCAkKERFQlVHX0RJUikKPiBhcmUgc3VwcG9zZWQgdG8gYmUgJHtwcmVmaXh9LWFi
bGUsIHlldCB0aGVyZSBjbGVhcmx5IHNob3VsZCBub3QKPiBiZSBhbiBpbmZpeCByZXN1bHRpbmcg
ZnJvbSB0aGUgY29uc3RydWN0aW9uIG9mIHRoaXMgcGF0aC4KCkJ5IGJlaW5nIHByZWZpeGFibGUg
eW91IG1lYW4gdGhhdCBib3RoIFhFTkZJUk1XQVJFRElSIGFuZCBERUJVR19ESVIKY2FuIGJlIHJl
bGF0aXZlIHBhdGhzPwoKPiBJbiB0aGF0IGNvbnRleHQgSSB3b25kZXIgd2h5IERFQlVHX0RJUiBp
cyBzZXQgaW4KPiB7U3RkR05VLFN1bk9TfS5tayBpbnN0ZWFkIG9mIGhhdmluZyBhIHRlbXBsYXRl
IGluCj4gUGF0aHMubWsuaW4uCgpUaGVuIHlvdSB3b3VsZCBoYXZlIHRvIHJ1biBjb25maWd1cmUg
YmVmb3JlIGluc3RhbGxpbmcgdGhlIGh5cGVydmlzb3IsCmJlY2F1c2UgdGhlIGluc3RhbGwgaHlw
ZXJ2aXNvciB0YXJnZXQgdXNlcyBERUJVR19ESVIuCgpSb2dlci4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
