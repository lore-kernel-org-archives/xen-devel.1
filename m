From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PULL 09/16] os-posix: cleanup: Replace fprintfs with
 error_report in change_process_uid
Date: Thu, 26 Apr 2018 16:56:20 +0100
Message-ID: <1524758187-9351-10-git-send-email-ian.jackson@eu.citrix.com>
References: <1524758187-9351-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pghr=hp=citrix.com=prvs=647a3a28a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fBjGO-0006jV-G5
 for xen-devel@lists.xenproject.org; Thu, 26 Apr 2018 15:56:52 +0000
In-Reply-To: <1524758187-9351-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: qemu-devel@nongnu.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel P. Berrange" <berrange@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Markus Armbruster <armbru@redhat.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SSdtIGdvaW5nIHRvIGJlIGVkaXRpbmcgdGhpcyBmdW5jdGlvbiBhbmQgaXQgbWFrZXMgc2Vuc2Ug
dG8gY2xlYW4gdXAKdGhpcyBzdHlsZSBwcm9ibGVtIGluIGFkdmFuY2UuCgpTaWduZWQtb2ZmLWJ5
OiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AZXUuY2l0cml4LmNvbT4KQ0M6IFBhb2xvIEJvbnpp
bmkgPHBib256aW5pQHJlZGhhdC5jb20+CkNDOiBNYXJrdXMgQXJtYnJ1c3RlciA8YXJtYnJ1QHJl
ZGhhdC5jb20+CkNDOiBEYW5pZWwgUC4gQmVycmFuZ2UgPGJlcnJhbmdlQHJlZGhhdC5jb20+CkND
OiBNaWNoYWVsIFRva2FyZXYgPG1qdEB0bHMubXNrLnJ1PgpSZXZpZXdlZC1ieTogUGV0ZXIgTWF5
ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPgpSZXZpZXdlZC1ieTogVGhvbWFzIEh1dGgg
PHRodXRoQHJlZGhhdC5jb20+Ci0tLQogb3MtcG9zaXguYyB8IDEwICsrKysrLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
b3MtcG9zaXguYyBiL29zLXBvc2l4LmMKaW5kZXggYjljMjM0My4uNTYwZGI5NSAxMDA2NDQKLS0t
IGEvb3MtcG9zaXguYworKysgYi9vcy1wb3NpeC5jCkBAIC0xNjcsMjAgKzE2NywyMCBAQCBzdGF0
aWMgdm9pZCBjaGFuZ2VfcHJvY2Vzc191aWQodm9pZCkKIHsKICAgICBpZiAodXNlcl9wd2QpIHsK
ICAgICAgICAgaWYgKHNldGdpZCh1c2VyX3B3ZC0+cHdfZ2lkKSA8IDApIHsKLSAgICAgICAgICAg
IGZwcmludGYoc3RkZXJyLCAiRmFpbGVkIHRvIHNldGdpZCglZClcbiIsIHVzZXJfcHdkLT5wd19n
aWQpOworICAgICAgICAgICAgZXJyb3JfcmVwb3J0KCJGYWlsZWQgdG8gc2V0Z2lkKCVkKSIsIHVz
ZXJfcHdkLT5wd19naWQpOwogICAgICAgICAgICAgZXhpdCgxKTsKICAgICAgICAgfQogICAgICAg
ICBpZiAoaW5pdGdyb3Vwcyh1c2VyX3B3ZC0+cHdfbmFtZSwgdXNlcl9wd2QtPnB3X2dpZCkgPCAw
KSB7Ci0gICAgICAgICAgICBmcHJpbnRmKHN0ZGVyciwgIkZhaWxlZCB0byBpbml0Z3JvdXBzKFwi
JXNcIiwgJWQpXG4iLAotICAgICAgICAgICAgICAgICAgICB1c2VyX3B3ZC0+cHdfbmFtZSwgdXNl
cl9wd2QtPnB3X2dpZCk7CisgICAgICAgICAgICBlcnJvcl9yZXBvcnQoIkZhaWxlZCB0byBpbml0
Z3JvdXBzKFwiJXNcIiwgJWQpIiwKKyAgICAgICAgICAgICAgICAgICAgICAgICB1c2VyX3B3ZC0+
cHdfbmFtZSwgdXNlcl9wd2QtPnB3X2dpZCk7CiAgICAgICAgICAgICBleGl0KDEpOwogICAgICAg
ICB9CiAgICAgICAgIGlmIChzZXR1aWQodXNlcl9wd2QtPnB3X3VpZCkgPCAwKSB7Ci0gICAgICAg
ICAgICBmcHJpbnRmKHN0ZGVyciwgIkZhaWxlZCB0byBzZXR1aWQoJWQpXG4iLCB1c2VyX3B3ZC0+
cHdfdWlkKTsKKyAgICAgICAgICAgIGVycm9yX3JlcG9ydCgiRmFpbGVkIHRvIHNldHVpZCglZCki
LCB1c2VyX3B3ZC0+cHdfdWlkKTsKICAgICAgICAgICAgIGV4aXQoMSk7CiAgICAgICAgIH0KICAg
ICAgICAgaWYgKHNldHVpZCgwKSAhPSAtMSkgewotICAgICAgICAgICAgZnByaW50ZihzdGRlcnIs
ICJEcm9wcGluZyBwcml2aWxlZ2VzIGZhaWxlZFxuIik7CisgICAgICAgICAgICBlcnJvcl9yZXBv
cnQoIkRyb3BwaW5nIHByaXZpbGVnZXMgZmFpbGVkIik7CiAgICAgICAgICAgICBleGl0KDEpOwog
ICAgICAgICB9CiAgICAgfQotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
