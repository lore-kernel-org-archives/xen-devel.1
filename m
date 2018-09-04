From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 3/3] xen/arm: vgic-v3-its: Make
 vgic_v3_its_free_domain idempotent
Date: Tue,  4 Sep 2018 20:21:53 +0100
Message-ID: <20180904192153.17210-4-julien.grall@arm.com>
References: <20180904192153.17210-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0yqp=ls=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fxGtp-0005Qf-8a
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 19:22:05 +0000
In-Reply-To: <20180904192153.17210-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: andre.przywara@arm.com, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org, shameerali.kolothum.thodi@huawei.com, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

dmdpY192M19pdHNfZnJlZV9kb21haW4gbWF5IGJlIGNhbGxlZCBiZWZvcmUgdmdpY192M19pdHNf
aW5pdF9kb21haW4gaWYKdGhlIHZHSUMgd2FzIGZhaWxpbmcgdG8gaW5pdGFsaXplIGl0c2VsZi4g
VGhpcyBtZWFucyB0aGUgbGlzdCB3b3VsZCBiZQp1bml0aWFsaXplZCBhbmQgcmVzdWx0IGluIGEg
Y3Jhc2guCgpUaGFua2Z1bGx5LCB3ZSBvbmx5IGFsbG93IElUUyBmb3IgdGhlIGhhcmR3YXJlIGRv
bWFpbi4gU28gdGhlIGNyYXNoIGlzCm5vdCBhIHNlY3VyaXR5IGlzc3VlLiBGaXggaXQgYnkgY2hl
Y2tpbmcgd2hldGhlciB0aGUgbGlzdCB0aGUgTlVMTC4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgotLS0KCkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL2FybS92Z2ljLXYzLWl0cy5jIHwg
NCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL3ZnaWMtdjMtaXRzLmMgYi94ZW4vYXJjaC9hcm0vdmdpYy12My1pdHMuYwppbmRl
eCAzMjA2MWM2YjAzLi45ZWRkOTdjNGU3IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vdmdpYy12
My1pdHMuYworKysgYi94ZW4vYXJjaC9hcm0vdmdpYy12My1pdHMuYwpAQCAtMTU0OCw2ICsxNTQ4
LDEwIEBAIHZvaWQgdmdpY192M19pdHNfZnJlZV9kb21haW4oc3RydWN0IGRvbWFpbiAqZCkKIHsK
ICAgICBzdHJ1Y3QgdmlydF9pdHMgKnBvcywgKnRlbXA7CiAKKyAgICAvKiBDb3BlIHdpdGggdW5p
dGlhbGl6ZWQgdklUUyAqLworICAgIGlmICggbGlzdF9oZWFkX2lzX251bGwoJmQtPmFyY2gudmdp
Yy52aXRzX2xpc3QpICkKKyAgICAgICAgcmV0dXJuOworCiAgICAgbGlzdF9mb3JfZWFjaF9lbnRy
eV9zYWZlKCBwb3MsIHRlbXAsICZkLT5hcmNoLnZnaWMudml0c19saXN0LCB2aXRzX2xpc3QgKQog
ICAgIHsKICAgICAgICAgbGlzdF9kZWwoJnBvcy0+dml0c19saXN0KTsKLS0gCjIuMTEuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
