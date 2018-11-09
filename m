From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v7 3/7] x86: add xen_iommu_op to query
 reserved ranges
Date: Fri, 09 Nov 2018 05:01:54 -0700
Message-ID: <5BE5773202000078001FA2B5@prv1-mh.provo.novell.com>
References: <20181015103559.22075-1-paul.durrant@citrix.com>
 <20181015103559.22075-4-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mulf=nu=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gL5U6-0007TU-DK
 for xen-devel@lists.xenproject.org; Fri, 09 Nov 2018 12:01:58 +0000
In-Reply-To: <20181015103559.22075-4-paul.durrant@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjEwLjE4IGF0IDEyOjM1LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+ICtzdGF0aWMgaW50IGdldF9yZXNlcnZlZCh1bnNpZ25lZCBsb25nIHMsIHVuc2lnbmVkIGxv
bmcgZSwgdm9pZCAqYXJnKQo+ICt7Cj4gKyAgICBzdHJ1Y3QgZ2V0X3Jlc2VydmVkX2N0eHQgKmN0
eHQgPSBhcmc7Cj4gKwo+ICsgICAgaWYgKCBjdHh0LT5ucl9lbnRyaWVzIDwgY3R4dC0+bWF4X2Vu
dHJpZXMgKQo+ICsgICAgewo+ICsgICAgICAgIHhlbl9pb21tdV9yZXNlcnZlZF9yYW5nZV90IHJh
bmdlID0gewo+ICsgICAgICAgICAgICAuc3RhcnRfZGZuID0gcywKPiArICAgICAgICAgICAgLm5y
X2ZyYW1lcyA9IGUgLSBzLAoKSWlyYyByYW5nZXNldCBlbmRzIGFyZSBpbmNsdXNpdmUsIHNvIEkg
dGhpbmsgeW91IG5lZWQgdG8gYWRkIDEgaGVyZS4KCj4gQEAgLTM4LDEyICs5NywyMCBAQCBpbnQg
ZG9fb25lX2lvbW11X29wKHhlbl9pb21tdV9vcF9idWZfdCAqYnVmKQo+ICAgICAgY29uc3QgWEVO
X0dVRVNUX0hBTkRMRSh4ZW5faW9tbXVfb3BfdCkgaCA9Cj4gICAgICAgICAgZ3Vlc3RfaGFuZGxl
X2Nhc3QoYnVmLT5oLCB4ZW5faW9tbXVfb3BfdCk7Cj4gICAgICB4ZW5faW9tbXVfb3BfdCBvcDsK
PiArICAgIHNpemVfdCBvZmZzZXQ7Cj4gKyAgICBzdGF0aWMgY29uc3Qgc2l6ZV90IG9wX3NpemVb
XSA9IHsKPiArICAgICAgICBbWEVOX0lPTU1VT1BfcXVlcnlfcmVzZXJ2ZWRdID0KPiArICAgICAg
ICAgICAgc2l6ZW9mKHN0cnVjdCB4ZW5faW9tbXVfb3BfcXVlcnlfcmVzZXJ2ZWQpLAoKUGVyaGFw
cyBiZXR0ZXIgKGFuZCBzaG9ydGVyKSBzaXplb2Yob3AudS5xdWVyeV9yZXNlcnZlZCk/Cgo+IC0t
LSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9pb21tdV9vcC5oCj4gKysrIGIveGVuL2luY2x1ZGUvcHVi
bGljL2lvbW11X29wLmgKPiBAQCAtMjUsMTEgKzI1LDUwIEBACj4gIAo+ICAjaW5jbHVkZSAieGVu
LmgiCj4gIAo+ICt0eXBlZGVmIHVpbnQ2NF90IHhlbl9kZm5fdDsKPiArCj4gKy8qIFN0cnVjdHVy
ZSBkZXNjcmliaW5nIGEgc2luZ2xlIHJhbmdlIHJlc2VydmVkIGluIHRoZSBJT01NVSAqLwo+ICtz
dHJ1Y3QgeGVuX2lvbW11X3Jlc2VydmVkX3JhbmdlIHsKPiArICAgIHhlbl9kZm5fdCBzdGFydF9k
Zm47Cj4gKyAgICB1aW50MzJfdCBucl9mcmFtZXM7Cj4gKyAgICB1aW50MzJfdCBwYWQ7Cj4gK307
Cj4gK3R5cGVkZWYgc3RydWN0IHhlbl9pb21tdV9yZXNlcnZlZF9yYW5nZSB4ZW5faW9tbXVfcmVz
ZXJ2ZWRfcmFuZ2VfdDsKPiArREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUoeGVuX2lvbW11X3Jlc2Vy
dmVkX3JhbmdlX3QpOwo+ICsKPiArLyoKPiArICogWEVOX0lPTU1VT1BfcXVlcnlfcmVzZXJ2ZWQ6
IFF1ZXJ5IHJhbmdlcyByZXNlcnZlZCBpbiB0aGUgSU9NTVUuCj4gKyAqLwoKU2luZ2xlIGxpbmUg
Y29tbWVudD8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
