From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 3/9] x86: enclose hypercall page initialisation
 code in CONFIG_{HVM, PV}
Date: Tue, 7 Aug 2018 11:00:46 +0100
Message-ID: <d801b0cb143980c7912f5188d0887321614bbd81.1533636027.git-series.wei.liu2@citrix.com>
References: <cover.3198a0d9ad2683b74afcc86654a244d17cd8795e.1533636027.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xdgf=kw=citrix.com=prvs=7503460ff=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fmynQ-00046B-Vm
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 10:00:57 +0000
In-Reply-To: <cover.3198a0d9ad2683b74afcc86654a244d17cd8795e.1533636027.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJj
aC94ODYveDg2XzY0L3RyYXBzLmMgfCAxNSArKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxMSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni94ODZfNjQvdHJhcHMuYyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQvdHJhcHMuYwppbmRleCBl
ZDAyYjc4Li44N2Q1ODE2IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYveDg2XzY0L3RyYXBzLmMK
KysrIGIveGVuL2FyY2gveDg2L3g4Nl82NC90cmFwcy5jCkBAIC0zNTIsMTIgKzM1MiwxOSBAQCB2
b2lkIHN1YmFyY2hfcGVyY3B1X3RyYXBzX2luaXQodm9pZCkKIHZvaWQgaHlwZXJjYWxsX3BhZ2Vf
aW5pdGlhbGlzZShzdHJ1Y3QgZG9tYWluICpkLCB2b2lkICpoeXBlcmNhbGxfcGFnZSkKIHsKICAg
ICBtZW1zZXQoaHlwZXJjYWxsX3BhZ2UsIDB4Q0MsIFBBR0VfU0laRSk7CisjaWYgQ09ORklHX0hW
TQogICAgIGlmICggaXNfaHZtX2RvbWFpbihkKSApCiAgICAgICAgIGh2bV9oeXBlcmNhbGxfcGFn
ZV9pbml0aWFsaXNlKGQsIGh5cGVyY2FsbF9wYWdlKTsKLSAgICBlbHNlIGlmICggIWlzX3B2XzMy
Yml0X2RvbWFpbihkKSApCi0gICAgICAgIGh5cGVyY2FsbF9wYWdlX2luaXRpYWxpc2VfcmluZzNf
a2VybmVsKGh5cGVyY2FsbF9wYWdlKTsKLSAgICBlbHNlCi0gICAgICAgIGh5cGVyY2FsbF9wYWdl
X2luaXRpYWxpc2VfcmluZzFfa2VybmVsKGh5cGVyY2FsbF9wYWdlKTsKKyNlbmRpZgorI2lmIENP
TkZJR19QVgorICAgIGlmICggaXNfcHZfZG9tYWluKGQpICkKKyAgICB7CisgICAgICAgIGlmICgg
IWlzX3B2XzMyYml0X2RvbWFpbihkKSApCisgICAgICAgICAgICBoeXBlcmNhbGxfcGFnZV9pbml0
aWFsaXNlX3JpbmczX2tlcm5lbChoeXBlcmNhbGxfcGFnZSk7CisgICAgICAgIGVsc2UKKyAgICAg
ICAgICAgIGh5cGVyY2FsbF9wYWdlX2luaXRpYWxpc2VfcmluZzFfa2VybmVsKGh5cGVyY2FsbF9w
YWdlKTsKKyAgICB9CisjZW5kaWYKIH0KIAogLyoKLS0gCmdpdC1zZXJpZXMgMC45LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
