From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 09/16] os-posix: cleanup: Replace fprintfs with
 error_report in change_process_uid
Date: Thu, 19 Apr 2018 17:45:12 +0100
Message-ID: <1524156319-11465-10-git-send-email-ian.jackson@eu.citrix.com>
References: <1524156319-11465-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jxfj=hi=citrix.com=prvs=6403088e3=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1f9Cgz-0004GU-Qf
 for xen-devel@lists.xenproject.org; Thu, 19 Apr 2018 16:45:53 +0000
In-Reply-To: <1524156319-11465-1-git-send-email-ian.jackson@eu.citrix.com>
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
OiBNaWNoYWVsIFRva2FyZXYgPG1qdEB0bHMubXNrLnJ1PgotLS0KIG9zLXBvc2l4LmMgfCAxMCAr
KysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL29zLXBvc2l4LmMgYi9vcy1wb3NpeC5jCmluZGV4IGI5YzIzNDMuLjU2
MGRiOTUgMTAwNjQ0Ci0tLSBhL29zLXBvc2l4LmMKKysrIGIvb3MtcG9zaXguYwpAQCAtMTY3LDIw
ICsxNjcsMjAgQEAgc3RhdGljIHZvaWQgY2hhbmdlX3Byb2Nlc3NfdWlkKHZvaWQpCiB7CiAgICAg
aWYgKHVzZXJfcHdkKSB7CiAgICAgICAgIGlmIChzZXRnaWQodXNlcl9wd2QtPnB3X2dpZCkgPCAw
KSB7Ci0gICAgICAgICAgICBmcHJpbnRmKHN0ZGVyciwgIkZhaWxlZCB0byBzZXRnaWQoJWQpXG4i
LCB1c2VyX3B3ZC0+cHdfZ2lkKTsKKyAgICAgICAgICAgIGVycm9yX3JlcG9ydCgiRmFpbGVkIHRv
IHNldGdpZCglZCkiLCB1c2VyX3B3ZC0+cHdfZ2lkKTsKICAgICAgICAgICAgIGV4aXQoMSk7CiAg
ICAgICAgIH0KICAgICAgICAgaWYgKGluaXRncm91cHModXNlcl9wd2QtPnB3X25hbWUsIHVzZXJf
cHdkLT5wd19naWQpIDwgMCkgewotICAgICAgICAgICAgZnByaW50ZihzdGRlcnIsICJGYWlsZWQg
dG8gaW5pdGdyb3VwcyhcIiVzXCIsICVkKVxuIiwKLSAgICAgICAgICAgICAgICAgICAgdXNlcl9w
d2QtPnB3X25hbWUsIHVzZXJfcHdkLT5wd19naWQpOworICAgICAgICAgICAgZXJyb3JfcmVwb3J0
KCJGYWlsZWQgdG8gaW5pdGdyb3VwcyhcIiVzXCIsICVkKSIsCisgICAgICAgICAgICAgICAgICAg
ICAgICAgdXNlcl9wd2QtPnB3X25hbWUsIHVzZXJfcHdkLT5wd19naWQpOwogICAgICAgICAgICAg
ZXhpdCgxKTsKICAgICAgICAgfQogICAgICAgICBpZiAoc2V0dWlkKHVzZXJfcHdkLT5wd191aWQp
IDwgMCkgewotICAgICAgICAgICAgZnByaW50ZihzdGRlcnIsICJGYWlsZWQgdG8gc2V0dWlkKCVk
KVxuIiwgdXNlcl9wd2QtPnB3X3VpZCk7CisgICAgICAgICAgICBlcnJvcl9yZXBvcnQoIkZhaWxl
ZCB0byBzZXR1aWQoJWQpIiwgdXNlcl9wd2QtPnB3X3VpZCk7CiAgICAgICAgICAgICBleGl0KDEp
OwogICAgICAgICB9CiAgICAgICAgIGlmIChzZXR1aWQoMCkgIT0gLTEpIHsKLSAgICAgICAgICAg
IGZwcmludGYoc3RkZXJyLCAiRHJvcHBpbmcgcHJpdmlsZWdlcyBmYWlsZWRcbiIpOworICAgICAg
ICAgICAgZXJyb3JfcmVwb3J0KCJEcm9wcGluZyBwcml2aWxlZ2VzIGZhaWxlZCIpOwogICAgICAg
ICAgICAgZXhpdCgxKTsKICAgICAgICAgfQogICAgIH0KLS0gCjIuMS40CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
