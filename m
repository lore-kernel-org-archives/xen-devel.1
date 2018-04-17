From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: [PATCH] x86/p2m: fixed p2m_change_type_range() start /
 end check
Date: Tue, 17 Apr 2018 20:16:31 +0300
Message-ID: <1523985391-4557-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, Razvan Cojocaru <rcojocaru@bitdefender.com>, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

cDJtX2NoYW5nZV90eXBlX3JhbmdlKCkgaGFuZGxlcyBlbmQgPiBtYXhfbWFwcGVkX3BmbiwgYnV0
IG5vdApzdGFydCA+IG1heF9tYXBwZWRfcGZuLiBDaGVjayB0aGUgbGF0dGVyIGp1c3QgYWZ0ZXIg
Z3JhYmJpbmcgdGhlCmxvY2sgYW5kIGJhaWwgaWYgdHJ1ZS4KClNpZ25lZC1vZmYtYnk6IFJhenZh
biBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KU3VnZ2VzdGVkLWJ5OiBHZW9y
Z2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L21t
L3AybS5jIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL3AybS5jIGIveGVuL2FyY2gveDg2L21tL3AybS5jCmlu
ZGV4IGM1M2NhYjQuLmFmNDZjZDkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwor
KysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKQEAgLTk3Niw2ICs5NzYsMTMgQEAgdm9pZCBwMm1f
Y2hhbmdlX3R5cGVfcmFuZ2Uoc3RydWN0IGRvbWFpbiAqZCwKICAgICBBU1NFUlQocDJtX2lzX2No
YW5nZWFibGUob3QpICYmIHAybV9pc19jaGFuZ2VhYmxlKG50KSk7CiAKICAgICBwMm1fbG9jayhw
Mm0pOworCisgICAgaWYgKCBzdGFydCA+IHAybS0+bWF4X21hcHBlZF9wZm4gKQorICAgIHsKKyAg
ICAgICAgcDJtX3VubG9jayhwMm0pOworICAgICAgICByZXR1cm47CisgICAgfQorCiAgICAgcDJt
LT5kZWZlcl9uZXN0ZWRfZmx1c2ggPSAxOwogCiAgICAgaWYgKCB1bmxpa2VseShlbmQgPiBwMm0t
Pm1heF9tYXBwZWRfcGZuKSApCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
