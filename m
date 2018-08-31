From: Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 0/2] fix smt=0 fallout
Date: Fri, 31 Aug 2018 17:22:03 +0200
Message-ID: <20180831152205.21872-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=/b/z=lo=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fvlFW-0001Fw-E3
 for xen-devel@lists.xenproject.org; Fri, 31 Aug 2018 15:22:14 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

V2l0aCBzbXQ9MCBzb21lIG91dHB1dCBvZiB4bCBpcyB3cm9uZy4gRml4IGl0LgoKSnVlcmdlbiBH
cm9zcyAoMik6CiAgdG9vbHMvbGlieGw6IGNvcnJlY3QgdmNwdSBhZmZpbml0eSBvdXRwdXQgd2l0
aCBzcGFyc2UgcGh5c2ljYWwgY3B1IG1hcAogIHhlbjogZmlsbCB0b3BvbG9neSBpbmZvIGZvciBv
bmxpbmUgY3B1cyBvbmx5CgpDaGFuZ2VzIGluIFYyOgotIHBhdGNoIDI6IHByaW50IGluZm8gZm9y
IG9mZmxpbmUgY3B1cywgdG9vIChKYW4gQmV1bGljaCkKCkp1ZXJnZW4gR3Jvc3MgKDIpOgogIHRv
b2xzL2xpYnhsOiBjb3JyZWN0IHZjcHUgYWZmaW5pdHkgb3V0cHV0IHdpdGggc3BhcnNlIHBoeXNp
Y2FsIGNwdSBtYXAKICB4ZW46IGZpbGwgdG9wb2xvZ3kgaW5mbyBmb3IgYWxsIHByZXNlbnQgY3B1
cwoKIHRvb2xzL3hsL3hsX3ZjcHUuYyAgfCA0ICsrLS0KIHhlbi9jb21tb24vc3lzY3RsLmMgfCAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCi0t
IAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
