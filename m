From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH] AMD/IOMMU: don't open-code
 for_each_amd_iommu()
Date: Thu, 02 May 2019 08:51:30 -0600
Message-ID: <5CCB03F2020000780022B557@prv1-mh.provo.novell.com>
References: <5CA6FD300200007800224C43@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMD3i-00062l-EI
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 14:51:38 +0000
In-Reply-To: <5CA6FD300200007800224C43@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjA0LjE5IGF0IDA5OjAxLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiAtLS0gYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW50ci5jCj4gKysrIGIveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2ludHIuYwo+IEBAIC01MDMsNyArNTAzLDcgQEAgc3Rh
dGljIHN0cnVjdCBhbWRfaW9tbXUgKl9maW5kX2lvbW11X2Zvcgo+ICB7Cj4gICAgICBzdHJ1Y3Qg
YW1kX2lvbW11ICppb21tdTsKPiAgCj4gLSAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5ICggaW9tbXUs
ICZhbWRfaW9tbXVfaGVhZCwgbGlzdCApCj4gKyAgICBmb3JfZWFjaF9hbWRfaW9tbXUgKCBpb21t
dSApCj4gICAgICAgICAgaWYgKCBpb21tdS0+c2VnID09IHNlZyAmJiBpb21tdS0+YmRmID09IGJk
ZiApCj4gICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ICAKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
