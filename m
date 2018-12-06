From: Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 0/3] xen/x86: support setting dom0_mem
 depending on host size
Date: Thu,  6 Dec 2018 09:06:36 +0100
Message-ID: <20181206080639.32603-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=nlhd=op=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gUogJ-0001Sp-Mi
 for xen-devel@lists.xenproject.org; Thu, 06 Dec 2018 08:06:47 +0000
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
bmZpZ3VyYWJsZSB2aWEgS2NvbmZpZy4KCkNoYW5nZXMgc2luY2UgVjE6Ci0gcmVwbGFjZWQgb2xk
IHBhdGNoIDEgYnkgbmV3IG9uZQotIHJld3JpdHRlbiBwYXRjaCAyIGFjY29yZGluZyB0byByZW1h
cmtzIGJ5IEphbiBCZXVsaWNoCi0gY2hhbmdlZCBwYXRjaCAzIHRvIGFsbG93IGNvbmZpZyBpdGVt
IG9uIGFybSwgdG9vCgpKdWVyZ2VuIEdyb3NzICgzKToKICB4ZW46IGludHJvZHVjZSBwYXJzZV9z
aXplX2FuZF91bml0X29yX2ludAogIHhlbi94ODY6IGFkZCBkb20wIG1lbW9yeSBzaXppbmcgdmFy
aWFudHMKICB4ZW46IGFkZCBDT05GSUcgaXRlbSBmb3IgZGVmYXVsdCBkb20wIG1lbW9yeSBzaXpl
CgogZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUubWFya2Rvd24gfCAgMTkgKysrKy0tCiB4ZW4v
YXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgICAgICAgICB8ICAgNyArKysKIHhlbi9hcmNoL3g4Ni9k
b20wX2J1aWxkLmMgICAgICAgICAgIHwgMTEyICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLQogeGVuL2NvbW1vbi9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAgMTMgKysrKysK
IHhlbi9jb21tb24vbGliLmMgICAgICAgICAgICAgICAgICAgIHwgIDExICsrKy0KIHhlbi9pbmNs
dWRlL3hlbi9saWIuaCAgICAgICAgICAgICAgIHwgICAyICsKIDYgZmlsZXMgY2hhbmdlZCwgMTMw
IGluc2VydGlvbnMoKyksIDM0IGRlbGV0aW9ucygtKQoKLS0gCjIuMTYuNAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
