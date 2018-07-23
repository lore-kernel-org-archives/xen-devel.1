From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 12/13] x86: add iommu_ops to modify and
 flush IOMMU mappings
Date: Mon, 23 Jul 2018 14:35:22 +0100
Message-ID: <20180723133522.sdndumgprdioc7aj@citrix.com>
References: <20180717133816.37958-1-paul.durrant@citrix.com>
 <20180717133816.37958-13-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=l8wo=kh=citrix.com=prvs=7352c57fe=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fhazn-0005kE-6A
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 13:35:27 +0000
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
b3RlOgo+ICAKWy4uLl0KPiArc3RhdGljIGludCBpb21tdW9wX21hcChzdHJ1Y3QgeGVuX2lvbW11
X29wX21hcCAqb3ApCj4gK3sKPiArICAgIHN0cnVjdCBkb21haW4gKmQsICpjdXJyZCA9IGN1cnJl
bnQtPmRvbWFpbjsKPiArICAgIHN0cnVjdCBkb21haW5faW9tbXUgKmlvbW11ID0gZG9tX2lvbW11
KGN1cnJkKTsKPiArICAgIGJvb2wgcmVhZG9ubHkgPSBvcC0+ZmxhZ3MgJiBYRU5fSU9NTVVPUF9t
YXBfcmVhZG9ubHk7Cj4gKyAgICBiZm5fdCBiZm4gPSBfYmZuKG9wLT5iZm4pOwo+ICsgICAgc3Ry
dWN0IHBhZ2VfaW5mbyAqcGFnZTsKPiArICAgIHVuc2lnbmVkIGludCBwcm90Owo+ICsgICAgaW50
IHJjLCBpZ25vcmU7Cj4gKwo+ICsgICAgaWYgKCBvcC0+cGFkIHx8IChvcC0+ZmxhZ3MgJiB+WEVO
X0lPTU1VT1BfbWFwX3JlYWRvbmx5KSApCj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gKwo+
ICsgICAgaWYgKCAhaW9tbXUtPmlvbW11X29wX3JhbmdlcyApCj4gKyAgICAgICAgcmV0dXJuIC1F
T1BOT1RTVVBQOwo+ICsKPiArICAgIC8qIENoZWNrIHdoZXRoZXIgdGhlIHNwZWNpZmllZCBCRk4g
ZmFsbHMgaW4gYSByZXNlcnZlZCByZWdpb24gKi8KPiArICAgIGlmICggcmFuZ2VzZXRfY29udGFp
bnNfc2luZ2xldG9uKGlvbW11LT5yZXNlcnZlZF9yYW5nZXMsIGJmbl94KGJmbikpICkKPiArICAg
ICAgICByZXR1cm4gLUVJTlZBTDsKPiArCj4gKyAgICBkID0gcmN1X2xvY2tfZG9tYWluX2J5X2Fu
eV9pZChvcC0+ZG9taWQpOwoKSSB0aGluayB0aGlzIG5lZWRzIHRvIGJlIG1vdmVkIGVhcmxpZXIg
YmVmb3JlIGRlcmVmZXJlbmNpbmcgYXNzaWduaW5nCmlvbW11IC0tIGl0IGRlcGVuZHMgb24gZCBi
ZWluZyB2YWxpZC4KClNhbWUgYXBwbGllcyB0byB0aGUgdW5tYXAgZnVuY3Rpb24uCgo+ICsKPiAr
c3RhdGljIGludCBpb21tdW9wX2ZsdXNoKHZvaWQpCj4gK3sKPiArICAgIHJldHVybiAhaW9tbXVf
aW90bGJfZmx1c2hfYWxsKGN1cnJlbnQtPmRvbWFpbikgPyAwIDogLUVJTzsKCkkgZG9uJ3QgZm9s
bG93OiB3aHkgZG9lcyB0aGlzIG9ubHkgZmx1c2ggY3VycmVudC0+ZG9tYWluPyBCdXQKbWFwL3Vu
bWFwIHVzZSBleHBsaWNpdCBhcmd1bWVudCB0byBzcGVjaWZ5IGEgZG9tYWluPwoKV2VpLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
