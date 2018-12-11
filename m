From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 2/2] xen: simplify {check,poison}_one_page
Date: Tue, 11 Dec 2018 11:56:31 +0000
Message-ID: <20181211115631.5133-3-wei.liu2@citrix.com>
References: <20181211115631.5133-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DjN1=OU=citrix.com=prvs=8762858e5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gWgeg-0005Qt-OO
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 11:56:50 +0000
In-Reply-To: <20181211115631.5133-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VXNlIF9fbWFwX2RvbWFpbl9wYWdlIG1hY3JvIHRvIGRlYWwgd2l0aCBwYWdlX2luZm8gZGlyZWN0
bHkuCgpObyBmdW5jdGlvbmFsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5s
aXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMgfCA2ICsrLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCmlu
ZGV4IDY3N2E4ZTE4Y2UuLjJjNjUwOWUzYTAgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vcGFnZV9h
bGxvYy5jCisrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCkBAIC03NzEsMTMgKzc3MSwxMiBA
QCBzdGF0aWMgdm9pZCBwYWdlX2xpc3RfYWRkX3NjcnViKHN0cnVjdCBwYWdlX2luZm8gKnBnLCB1
bnNpZ25lZCBpbnQgbm9kZSwKIHN0YXRpYyB2b2lkIHBvaXNvbl9vbmVfcGFnZShzdHJ1Y3QgcGFn
ZV9pbmZvICpwZykKIHsKICNpZmRlZiBDT05GSUdfU0NSVUJfREVCVUcKLSAgICBtZm5fdCBtZm4g
PSBwYWdlX3RvX21mbihwZyk7CiAgICAgdWludDY0X3QgKnB0cjsKIAogICAgIGlmICggIXNjcnVi
X2RlYnVnICkKICAgICAgICAgcmV0dXJuOwogCi0gICAgcHRyID0gbWFwX2RvbWFpbl9wYWdlKG1m
bik7CisgICAgcHRyID0gX19tYXBfZG9tYWluX3BhZ2UocGcpOwogICAgICpwdHIgPSB+U0NSVUJf
UEFUVEVSTjsKICAgICB1bm1hcF9kb21haW5fcGFnZShwdHIpOwogI2VuZGlmCkBAIC03ODYsMTQg
Kzc4NSwxMyBAQCBzdGF0aWMgdm9pZCBwb2lzb25fb25lX3BhZ2Uoc3RydWN0IHBhZ2VfaW5mbyAq
cGcpCiBzdGF0aWMgdm9pZCBjaGVja19vbmVfcGFnZShzdHJ1Y3QgcGFnZV9pbmZvICpwZykKIHsK
ICNpZmRlZiBDT05GSUdfU0NSVUJfREVCVUcKLSAgICBtZm5fdCBtZm4gPSBwYWdlX3RvX21mbihw
Zyk7CiAgICAgY29uc3QgdWludDY0X3QgKnB0cjsKICAgICB1bnNpZ25lZCBpbnQgaTsKIAogICAg
IGlmICggIXNjcnViX2RlYnVnICkKICAgICAgICAgcmV0dXJuOwogCi0gICAgcHRyID0gbWFwX2Rv
bWFpbl9wYWdlKG1mbik7CisgICAgcHRyID0gX19tYXBfZG9tYWluX3BhZ2UocGcpOwogICAgIGZv
ciAoIGkgPSAwOyBpIDwgUEFHRV9TSVpFIC8gc2l6ZW9mICgqcHRyKTsgaSsrICkKICAgICAgICAg
QlVHX09OKHB0cltpXSAhPSBTQ1JVQl9QQVRURVJOKTsKICAgICB1bm1hcF9kb21haW5fcGFnZShw
dHIpOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
