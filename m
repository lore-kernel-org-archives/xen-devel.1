From: Juergen Gross <jgross@suse.com>
Subject: [GIT PULL] xen: fixes for v4.16-rc4
Date: Fri,  2 Mar 2018 18:25:18 +0100
Message-ID: <20180302172518.16501-1-jgross__33555.2374752753$1520011452$gmane$org@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=wrb9=fy=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eroQy-0006aI-1e
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 17:25:28 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: torvalds@linux-foundation.org
Cc: xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

TGludXMsCgpQbGVhc2UgZ2l0IHB1bGwgdGhlIGZvbGxvd2luZyB0YWc6CgogZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3hlbi90aXAuZ2l0IGZvci1saW51cy00
LjE2YS1yYzQtdGFnCgp4ZW46IGZpeGVzIGZvciB2NC4xNi1yYzQKCkl0IGNvbnRhaW5zIDUgbWlu
b3IgZml4ZXMgZm9yIFhlbi1zcGVjaWZpYyBkcml2ZXJzLgoKClRoYW5rcy4KCkp1ZXJnZW4KCiBh
cmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMgICAgICB8ICA2ICsrKystLQogZHJpdmVycy9uZXQv
eGVuLW5ldGZyb250LmMgICAgICAgfCAgNyArKysrKystCiBkcml2ZXJzL3hlbi9ldmVudHMvZXZl
bnRzX2Jhc2UuYyB8ICA0ICsrLS0KIGRyaXZlcnMveGVuL3B2Y2FsbHMtYmFjay5jICAgICAgIHwg
IDIgKy0KIGRyaXZlcnMveGVuL3B2Y2FsbHMtZnJvbnQuYyAgICAgIHwgMTEgKysrKysrKystLS0K
IDUgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCkNvbGlu
IElhbiBLaW5nICgxKToKICAgICAgeGVuL3B2Y2FsbHM6IGZpeCBudWxsIHBvaW50ZXIgZGVyZWZl
cmVuY2Ugb24gbWFwLT5zb2NrCgpKYXNvbiBBbmRyeXVrICgxKToKICAgICAgeGVuLW5ldGZyb250
OiBGaXggaGFuZyBvbiBkZXZpY2UgcmVtb3ZhbAoKSnVlcmdlbiBHcm9zcyAoMik6CiAgICAgIHg4
Ni94ZW46IGFkZCB0dHkwIGFuZCBodmMwIGFzIHByZWZlcnJlZCBjb25zb2xlcyBmb3IgZG9tMAoK
Um9nZXIgUGF1IE1vbm5lICgxKToKICAgICAgeGVuL3BpcnE6IGZpeCBlcnJvciBwYXRoIGNsZWFu
dXAgd2hlbiBiaW5kaW5nIE1TSXMKClN0ZWZhbm8gU3RhYmVsbGluaSAoMSk6CiAgICAgIHB2Y2Fs
bHMtZnJvbnQ6IDY0LWJpdCBhbGlnbiBmbGFncwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
