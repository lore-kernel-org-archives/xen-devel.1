From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 17/23] x86/mm: put
 paging_update_nestedmode under CONFIG_HVM
Date: Tue, 28 Aug 2018 04:50:21 -0600
Message-ID: <5B8528ED02000078001E2870@prv1-mh.provo.novell.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <4f2a5de72552edce4bafe5d049ee89a18531ed1f.1535285866.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=k/hy=ll=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fubZo-0002EN-UK
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 10:50:24 +0000
In-Reply-To: <4f2a5de72552edce4bafe5d049ee89a18531ed1f.1535285866.git-series.wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjA4LjE4IGF0IDE0OjE5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2FyY2gveDg2L21tL3BhZ2luZy5jCj4gKysrIGIveGVuL2FyY2gveDg2L21tL3Bh
Z2luZy5jCj4gQEAgLTkxOSw2ICs5MTksNyBAQCBjb25zdCBzdHJ1Y3QgcGFnaW5nX21vZGUgKnBh
Z2luZ19nZXRfbW9kZShzdHJ1Y3QgdmNwdSAqdikKPiAgICAgIHJldHVybiBwYWdpbmdfZ2V0X25l
c3RlZG1vZGUodik7Cj4gIH0KPiAgCj4gKyNpZmRlZiBDT05GSUdfSFZNCj4gIHZvaWQgcGFnaW5n
X3VwZGF0ZV9uZXN0ZWRtb2RlKHN0cnVjdCB2Y3B1ICp2KQo+ICB7Cj4gICAgICBBU1NFUlQobmVz
dGVkaHZtX2VuYWJsZWQodi0+ZG9tYWluKSk7Cj4gQEAgLTkzMCw2ICs5MzEsNyBAQCB2b2lkIHBh
Z2luZ191cGRhdGVfbmVzdGVkbW9kZShzdHJ1Y3QgdmNwdSAqdikKPiAgICAgICAgICB2LT5hcmNo
LnBhZ2luZy5uZXN0ZWRtb2RlID0gTlVMTDsKPiAgICAgIGh2bV9hc2lkX2ZsdXNoX3ZjcHUodik7
Cj4gIH0KPiArI2VuZGlmCgpKdXN0IGEgY29uc2lkZXJhdGlvbiAobm8gb2JqZWN0aW9uKTogV291
bGQgaXQgYmUgd29ydGh3aGlsZSB0bwppbnRyb2R1Y2UgQ09ORklHX05FU1RFRF9IVk0gYXQgdGhl
IHNhbWUgdGltZSAoZm9yIG5vdyBoYXJkCmNvZGVkIHRvIFksIGFuZCBvZiBjb3Vyc2UgZGVwZW5k
aW5nIG9uIEhWTSkgdG8gYXZvaWQgaGF2aW5nIHRvCnRvdWNoIGFsbCBzdWNoIHBsYWNlcyBhIHNl
Y29uZCB0aW1lIGxhdGVyIG9uPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
