From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/5] xen/domain: Allocate d->vcpu[] earlier
 during domain_create()
Date: Mon, 08 Oct 2018 07:51:40 -0600
Message-ID: <5BBB60EC02000078001EF9D6@prv1-mh.provo.novell.com>
References: <1538751289-1109-1-git-send-email-andrew.cooper3@citrix.com>
 <1538751289-1109-5-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1538751289-1109-5-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjEwLjE4IGF0IDE2OjU0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQEAgLTQwNSwxOSArNDE5LDYgQEAgc3RydWN0IGRvbWFpbiAqZG9tYWluX2NyZWF0ZShk
b21pZF90IGRvbWlkLAo+ICAKPiAgICAgIGlmICggIWlzX2lkbGVfZG9tYWluKGQpICkKPiAgICAg
IHsKPiAtICAgICAgICAvKiBDaGVjayBkLT5tYXhfdmNwdXMgYW5kIGFsbG9jYXRlIGQtPnZjcHVb
XS4gKi8KPiAtICAgICAgICBlcnIgPSAtRUlOVkFMOwo+IC0gICAgICAgIGlmICggY29uZmlnLT5t
YXhfdmNwdXMgPCAxIHx8Cj4gLSAgICAgICAgICAgICBjb25maWctPm1heF92Y3B1cyA+IGRvbWFp
bl9tYXhfdmNwdXMoZCkgKQo+IC0gICAgICAgICAgICBnb3RvIGZhaWw7CgpBaCwgdGhlcmUgaXQg
Z29lcyBhd2F5LiBCdXQgSSB0aGluayBpdCB3b3VsZCBiZSBtb3JlIGxvZ2ljYWwgZm9yIHRoaXMg
dG8KaGFwcGVuIGluIHRoZSBwcmV2aW91cyBwYXRjaC4gQW55d2F5ClJldmlld2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CmZvciBib3RoLCBwcmVmZXJhYmx5IChidXQgbm90
IG5lY2Vzc2FyaWx5KSB3aXRoIHRoZSByZW1vdmFsIG1vdmVkCnRoZXJlLgoKSmFuCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
