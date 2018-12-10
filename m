From: Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 0/3] xen/x86: support setting dom0_mem
 depending on host size
Date: Mon, 10 Dec 2018 12:44:19 +0100
Message-ID: <20181210114422.27275-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=17VY=OT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gWJzB-0007i5-HB
 for xen-devel@lists.xenproject.org; Mon, 10 Dec 2018 11:44:29 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2V0dGluZyB0aGUgbWVtb3J5IHNpemUgb2YgZG9tMCBvbiBhIHNlcnZlciBmb3IgdGhlIG5vbiBh
dXRvYmFsbG9vbmluZwpjYXNlIHJlcXVpcmVzIGFsd2F5cyBzcGVjaWZpY2F0aW9uIG9mIGEgYm9v
dCBwYXJhbWV0ZXIgdG9kYXkuIFRoZSB2YWx1ZQp0byBzZXQgd2lsbCBkZXBlbmQgbW9zdGx5IG9u
IHRoZSBob3N0IG1lbW9yeSBzaXplLgoKSW4gb3JkZXIgdG8gc3VwcG9ydCB0aGF0IHNjZW5hcmlv
IGFkZCB0aGUgcG9zc2liaWxpdHkgdG8gc2V0IGRvbTBfbWVtCmRlcGVuZGluZyBvbiB0aGUgYW1v
dW50IG9mIHBoeXNpY2FsIG1lbW9yeSBieSBhbGxvd2luZyB0byBzcGVjaWZ5IGEKcGVyY2VudGFn
ZSBvZiBob3N0IG1lbW9yeSAoZS5nLiAxMCUpIHdpdGggYW4gb2Zmc2V0IChsaWtlIDFHKzEwJSku
CgpUbyBtYWtlIGl0IGVhc3kgZm9yIGEgZGlzdHJpYnV0b3IgdG8gdXNlIHN1Y2ggYSBzZXR0aW5n
IGFzIHRoZSBkZWZhdWx0Cm1ha2UgdGhlIHN0YW5kYXJkIHNldHRpbmcgZm9yIGRvbTBfbWVtIGNv
bmZpZ3VyYWJsZSB2aWEgS2NvbmZpZy4KCkNoYW5nZXMgc2luY2UgVjI6Ci0gcGF0Y2ggMTogbGV0
IHBhcnNlX3NpemVfYW5kX3VuaXQoKSBhY2NlcHQgJyUnIGluc3RlYWQgb2YgYWRkaW5nIGEKICBu
ZXcgcGFyc2luZyBmdW5jdGlvbiBmb3IgdGhhdCAoSmFuIEJldWxpY2gpCi0gcGF0Y2ggMjogbWFr
ZSBkb20wbWVtIHBhcnNpbmcgZnVuY3Rpb24gbW9yZSByb2J1c3QgYWdhaW5zdCBwYXJhbWV0ZXIK
ICBmb3JtYXQgZXJyb3JzIChKYW4gQmV1bGljaCkKCkNoYW5nZXMgc2luY2UgVjE6Ci0gcmVwbGFj
ZWQgb2xkIHBhdGNoIDEgYnkgbmV3IG9uZQotIHJld3JpdHRlbiBwYXRjaCAyIGFjY29yZGluZyB0
byByZW1hcmtzIGJ5IEphbiBCZXVsaWNoCi0gY2hhbmdlZCBwYXRjaCAzIHRvIGFsbG93IGNvbmZp
ZyBpdGVtIG9uIGFybSwgdG9vCgpKdWVyZ2VuIEdyb3NzICgzKToKICB4ZW46IG1vZGlmeSBwYXJz
ZV9zaXplX2FuZF91bml0KCkgdG8gc3VwcG9ydCBwZXJjZW50YWdlCiAgeGVuL3g4NjogYWRkIGRv
bTAgbWVtb3J5IHNpemluZyB2YXJpYW50cwogIHhlbjogYWRkIENPTkZJRyBpdGVtIGZvciBkZWZh
dWx0IGRvbTAgbWVtb3J5IHNpemUKCiBkb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5tYXJrZG93
biB8ICAxOSArKysrLS0KIHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyAgICAgICAgIHwgICA3
ICsrKwogeGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYyAgICAgICAgICAgfCAxMTggKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCiB4ZW4vY29tbW9uL0tjb25maWcgICAgICAgICAg
ICAgICAgICB8ICAxMyArKysrCiB4ZW4vY29tbW9uL2xpYi5jICAgICAgICAgICAgICAgICAgICB8
ICAgNCArKwogNSBmaWxlcyBjaGFuZ2VkLCAxMjkgaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25z
KC0pCgotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
