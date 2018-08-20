From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 05/34] xen: is_hvm_domain should evaluate to
 0 when !CONFIG_HVM
Date: Mon, 20 Aug 2018 05:51:28 -0600
Message-ID: <5B7AAB4002000078001DFFF7@prv1-mh.provo.novell.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <32dc160e20e574c7ec736fad43157928de86962e.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jmcq=ld=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1friid-000286-N6
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 11:51:35 +0000
In-Reply-To: <32dc160e20e574c7ec736fad43157928de86962e.1534518694.git-series.wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA4LjE4IGF0IDE3OjEyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
U2luY2UgaXQgaXMgZGVmaW5lZCBpbiBjb21tb24gaGVhZGVyIGZpbGUsIGludHJvZHVjZSBDT05G
SUdfSFZNIHRvCj4gQXJtIHRvIGF2b2lkIGJyZWFrYWdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdl
aSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gLS0tCj4gIHhlbi9hcmNoL2FybS9LY29uZmln
ICAgIHwgMyArKysKPiAgeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggfCA2ICsrKysrKwo+ICAyIGZp
bGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9h
cm0vS2NvbmZpZyBiL3hlbi9hcmNoL2FybS9LY29uZmlnCj4gaW5kZXggNTg2YmM2Mi4uYzBlOTY5
ZSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vS2NvbmZpZwo+ICsrKyBiL3hlbi9hcmNoL2Fy
bS9LY29uZmlnCj4gQEAgLTUyLDYgKzUyLDkgQEAgY29uZmlnIEhBU19JVFMKPiAgICAgICAgICBw
cm9tcHQgIkdJQ3YzIElUUyBNU0kgY29udHJvbGxlciBzdXBwb3J0IiBpZiBFWFBFUlQgPSAieSIK
PiAgICAgICAgICBkZXBlbmRzIG9uIEdJQ1YzICYmICFORVdfVkdJQwo+ICAKPiArY29uZmlnIEhW
TQo+ICsgICAgICAgIGRlZl9ib29sIHkKCkknbSBub3QgY29udmluY2VkIHRoaXMgaXMgYSBnb29k
IGlkZWEsIGJ1dCBJJ2xsIGxldCB0aGUgQVJNIG1haW50YWluZXJzCmp1ZGdlLgoKSmFuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
