From: Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/xl: fix output of xl vcpu-pin dry run
 with smt=0
Date: Mon,  3 Sep 2018 13:26:30 +0200
Message-ID: <20180903112630.27345-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=9gce=lr=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fwn08-0005kL-R6
 for xen-devel@lists.xenproject.org; Mon, 03 Sep 2018 11:26:36 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, wei.liu2@citrix.com, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

Rml4IGFub3RoZXIgc210PTAgZmFsbG91dDogeGwgLU4gdmNwdS1waW4gcHJpbnRzIG9ubHkgcGFy
dHMgb2YgdGhlCmFmZmluaXRpZXMgYXMgaXQgaXMgdXNpbmcgdGhlIG51bWJlciBvZiBvbmxpbmUg
Y3B1cyBpbnN0ZWFkIG9mIHRoZQptYXhpbXVtIGNwdSBudW1iZXIuCgpTaWduZWQtb2ZmLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogdG9vbHMveGwveGxfdmNwdS5jIHwg
NCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3Rvb2xzL3hsL3hsX3ZjcHUuYyBiL3Rvb2xzL3hsL3hsX3ZjcHUuYwppbmRl
eCBjODc3ZjI1OTVmLi5hZWY0ODY4NjRjIDEwMDY0NAotLS0gYS90b29scy94bC94bF92Y3B1LmMK
KysrIGIvdG9vbHMveGwveGxfdmNwdS5jCkBAIC0yNTUsOSArMjU1LDkgQEAgaW50IG1haW5fdmNw
dXBpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAgICAgICAgIGdvdG8gb3V0OwogCiAgICAgaWYg
KGRyeXJ1bl9vbmx5KSB7Ci0gICAgICAgIG5iX2NwdSA9IGxpYnhsX2dldF9vbmxpbmVfY3B1cyhj
dHgpOworICAgICAgICBuYl9jcHUgPSBsaWJ4bF9nZXRfbWF4X2NwdXMoY3R4KTsKICAgICAgICAg
aWYgKG5iX2NwdSA8IDApIHsKLSAgICAgICAgICAgIGZwcmludGYoc3RkZXJyLCAibGlieGxfZ2V0
X29ubGluZV9jcHVzIGZhaWxlZC5cbiIpOworICAgICAgICAgICAgZnByaW50ZihzdGRlcnIsICJs
aWJ4bF9nZXRfbWF4X2NwdXMgZmFpbGVkLlxuIik7CiAgICAgICAgICAgICBnb3RvIG91dDsKICAg
ICAgICAgfQogCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
