From: Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/3] xen/x86: support setting dom0_mem depending
 on host size
Date: Thu, 22 Nov 2018 17:40:25 +0100
Message-ID: <20181122164028.8451-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VC/5=OB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gPs1q-00068t-Ej
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 16:40:34 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, jbeulich@suse.com
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
bmZpZ3VyYWJsZSB2aWEgS2NvbmZpZy4KCkp1ZXJnZW4gR3Jvc3MgKDMpOgogIHhlbi94ODY6IGRl
bGF5IHBhcnNpbmcgb2YgZG9tMF9tZW0gcGFyYW1ldGVyIHVudGlsIG5lZWRlZAogIHhlbi94ODY6
IGFkZCBkb20wIG1lbW9yeSBzaXppbmcgdmFyaWFudHMKICB4ZW4veDg2OiBhZGQgQ09ORklHIGl0
ZW0gZm9yIGRlZmF1bHQgZG9tMCBtZW1vcnkgc2l6ZQoKIGRvY3MvbWlzYy94ZW4tY29tbWFuZC1s
aW5lLm1hcmtkb3duIHwgMjEgKysrKysrKystLS0tCiB4ZW4vYXJjaC94ODYvS2NvbmZpZyAgICAg
ICAgICAgICAgICB8ICA5ICsrKysrCiB4ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jICAgICAgICAg
ICB8IDY3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KIDMgZmlsZXMgY2hh
bmdlZCwgNzMgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pCgotLSAKMi4xNi40CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
