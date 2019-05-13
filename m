From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/5] iommu / x86: move call to
 scan_pci_devices() out of vendor code
Date: Mon, 13 May 2019 09:35:32 -0600
Message-ID: <5CD98EC4020000780022E421@prv1-mh.provo.novell.com>
References: <20190508132403.1454-1-paul.durrant@citrix.com>
 <20190508132403.1454-3-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQCzM-0000zV-A8
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 15:35:40 +0000
In-Reply-To: <20190508132403.1454-3-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjA1LjE5IGF0IDE1OjI0LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IEl0J3Mgbm90IHZlbmRvciBzcGVjaWZpYyBzbyBpdCBzaG91bGRuJ3QgcmVhbGx5IGJlIHRo
ZXJlLgoKUGVyaGFwcywgYnV0IHRoaXMgbmVlZHMgYmV0dGVyIGp1c3RpZmljYXRpb246Cgo+IC0t
LSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCj4gKysrIGIveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKPiBAQCAtMjM3MiwxMCArMjM3Miw2IEBAIHN0YXRp
YyBpbnQgX19pbml0IHZ0ZF9zZXR1cCh2b2lkKQo+ICAgICAgUChpb21tdV9oYXBfcHRfc2hhcmUs
ICJTaGFyZWQgRVBUIHRhYmxlcyIpOwo+ICAjdW5kZWYgUAo+ICAKPiAtICAgIHJldCA9IHNjYW5f
cGNpX2RldmljZXMoKTsKPiAtICAgIGlmICggcmV0ICkKPiAtICAgICAgICBnb3RvIGVycm9yOwo+
IC0KPiAgICAgIHJldCA9IGluaXRfdnRkX2h3KCk7CgpFdmVuIGFmdGVyIHNvbWUgbG9va2luZyBh
cm91bmQsIGl0J3Mgbm90IG9idmlvdXMgdG8gbWUgdGhhdCB0aGUgbGF0dGVyCmNhbGwgZG9lc24n
dCBkZXBlbmQgb24gUENJIGRldmljZXMgYmVpbmcga25vd24sIG1vcmUgc3BlY2lmaWNhbGx5CnNl
Z21lbnQgMCdzIGJ1czJicmlkZ2VbXSBoYXZpbmcgYmVlbiBmaWxsZWQuIE5vciBjYW4gSSB0ZWxs
IHdoZXRoZXIKdGhlcmUgd291bGQgYmUgc29tZSBub3RpY2VhYmxlIG1pc2JlaGF2aW9yIChwcmlv
ciB0byBhbnkgZ3Vlc3RzCnN0YXJ0aW5nKSBpZiB0aGVyZSB3YXMgYSBkZXBlbmRlbmN5IGFuZCBp
dCBnb3QgYnJva2VuIGJ5IHRoZSByZS0Kb3JkZXJpbmcuCgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
