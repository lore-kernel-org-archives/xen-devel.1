From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v4 09/12] cpufreq: patch target() indirect call
 to direct one
Date: Tue, 02 Oct 2018 04:16:41 -0600
Message-ID: <5BB3458902000078001EDA57@prv1-mh.provo.novell.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5BB343D802000078001ED9F6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=0jmz=mo=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g7HjS-0000Sg-Fe
 for xen-devel@lists.xenproject.org; Tue, 02 Oct 2018 10:16:46 +0000
In-Reply-To: <5BB343D802000078001ED9F6@prv1-mh.provo.novell.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBsb29rcyB0byBiZSB0aGUgb25seSBmcmVxdWVudGx5IGV4ZWN1dGVkIGhvb2s7IGRvbid0
IGJvdGhlcgpwYXRjaGluZyBhbnkgb3RoZXIgb25lcy4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+Ci0tLQp2MjogTmV3LgoKLS0tIGEveGVuL2RyaXZlcnMvY3B1ZnJlcS91dGlsaXR5
LmMKKysrIGIveGVuL2RyaXZlcnMvY3B1ZnJlcS91dGlsaXR5LmMKQEAgLTM2NCw3ICszNjQsOCBA
QCBpbnQgX19jcHVmcmVxX2RyaXZlcl90YXJnZXQoc3RydWN0IGNwdWZyCiAgICAgewogICAgICAg
ICB1bnNpZ25lZCBpbnQgcHJldl9mcmVxID0gcG9saWN5LT5jdXI7CiAKLSAgICAgICAgcmV0dmFs
ID0gY3B1ZnJlcV9kcml2ZXIudGFyZ2V0KHBvbGljeSwgdGFyZ2V0X2ZyZXEsIHJlbGF0aW9uKTsK
KyAgICAgICAgcmV0dmFsID0gYWx0ZXJuYXRpdmVfY2FsbChjcHVmcmVxX2RyaXZlci50YXJnZXQs
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcG9saWN5LCB0YXJnZXRfZnJlcSwg
cmVsYXRpb24pOwogICAgICAgICBpZiAoIHJldHZhbCA9PSAwICkKICAgICAgICAgICAgIFRSQUNF
XzJEKFRSQ19QTV9GUkVRX0NIQU5HRSwgcHJldl9mcmVxLzEwMDAsIHBvbGljeS0+Y3VyLzEwMDAp
OwogICAgIH0KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
