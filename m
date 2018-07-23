From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 12/13] x86: add iommu_ops to modify and
 flush IOMMU mappings
Date: Mon, 23 Jul 2018 15:26:29 +0100
Message-ID: <20180723142629.ytcph5yf34pi2vmg@citrix.com>
References: <20180717133816.37958-1-paul.durrant@citrix.com>
 <20180717133816.37958-13-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=l8wo=kh=citrix.com=prvs=7352c57fe=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fhbnF-0001ru-SL
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 14:26:33 +0000
Content-Disposition: inline
In-Reply-To: <20180717133816.37958-13-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMTcsIDIwMTggYXQgMDI6Mzg6MTVQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgpbLi4uXQo+ICtzdGF0aWMgaW50IGlvbW11b3BfdW5tYXAoc3RydWN0IHhlbl9pb21tdV9v
cF91bm1hcCAqb3ApCj4gK3sKWy4uLl0KPiArCj4gKyAgICBpZiAoICFpb21tdV91bm1hcF9wYWdl
KGN1cnJkLCBiZm4pICkKPiArICAgICAgICByYyA9IC1FSU87CgpTbyBpdCBpcyBhbiBlcnJvciB0
byB1bm1hcCB0aGUgcGFnZSBzdWNjZXNzZnVsbHk/IEluIGZhY3QgdGhpcyBzYW1lIGxpbmUKaXMg
Y2hhbmdlZCBpbiB0aGUgbmV4dCBwYXRjaC4gSSBzdXBwb3NlIHRoZSBjb2RlIGhlcmUgaXMgd3Jv
bmcuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
