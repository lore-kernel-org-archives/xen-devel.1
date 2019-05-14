From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] IOMMU: avoid NULL deref in iommu_lookup_page()
Date: Tue, 14 May 2019 06:03:42 -0600
Message-ID: <5CDAAE9E020000780022E944@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQW9v-00057m-GB
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:03:51 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

THVja2lseSB0aGUgZnVuY3Rpb24gY3VycmVudGx5IGhhcyBubyBjYWxsZXJzIC0gaXQgd291bGQg
aGF2ZSBjYWxsZWQKdGhyb3VnaCBOVUxMIGZvciBib3RoIEFybSBhbmQgeDg2L0FNRC4KClNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9t
bXUuYwpAQCAtNDA5LDcgKzQwOSw3IEBAIGludCBpb21tdV9sb29rdXBfcGFnZShzdHJ1Y3QgZG9t
YWluICpkLAogewogICAgIGNvbnN0IHN0cnVjdCBkb21haW5faW9tbXUgKmhkID0gZG9tX2lvbW11
KGQpOwogCi0gICAgaWYgKCAhaW9tbXVfZW5hYmxlZCB8fCAhaGQtPnBsYXRmb3JtX29wcyApCisg
ICAgaWYgKCAhaW9tbXVfZW5hYmxlZCB8fCAhaGQtPnBsYXRmb3JtX29wcyB8fCAhaGQtPnBsYXRm
b3JtX29wcy0+bG9va3VwX3BhZ2UgKQogICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7CiAKICAg
ICByZXR1cm4gaGQtPnBsYXRmb3JtX29wcy0+bG9va3VwX3BhZ2UoZCwgZGZuLCBtZm4sIGZsYWdz
KTsKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
