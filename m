From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 14/16] os-posix: cleanup: Replace fprintf with
 error_report in remaining call sites
Date: Tue, 24 Apr 2018 18:58:27 +0100
Message-ID: <1524592709-6553-15-git-send-email-ian.jackson@eu.citrix.com>
References: <1524592709-6553-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rvks=hn=citrix.com=prvs=6454bde7c=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fB2DM-00041n-C5
 for xen-devel@lists.xenproject.org; Tue, 24 Apr 2018 17:58:52 +0000
In-Reply-To: <1524592709-6553-1-git-send-email-ian.jackson@eu.citrix.com>
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

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+CkND
OiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgpDQzogTWFya3VzIEFybWJydXN0
ZXIgPGFybWJydUByZWRoYXQuY29tPgpDQzogRGFuaWVsIFAuIEJlcnJhbmdlIDxiZXJyYW5nZUBy
ZWRoYXQuY29tPgpDQzogTWljaGFlbCBUb2thcmV2IDxtanRAdGxzLm1zay5ydT4KUmV2aWV3ZWQt
Ynk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmc+Ci0tLQp2ODogUmVt
b3ZlIG9uZSByZW1haW5pbmcgc3B1cmlvdXMgIlxuIgp2NzogTmV3IHBhdGNoCi0tLQogb3MtcG9z
aXguYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9vcy1wb3NpeC5jIGIvb3MtcG9zaXguYwppbmRleCAwZjU5NTY2
Li5hMmJhNTBkIDEwMDY0NAotLS0gYS9vcy1wb3NpeC5jCisrKyBiL29zLXBvc2l4LmMKQEAgLTEy
OSw3ICsxMjksNyBAQCB2b2lkIG9zX3NldF9wcm9jX25hbWUoY29uc3QgY2hhciAqcykKICAgICAg
ICAgZXhpdCgxKTsKICAgICB9CiAjZWxzZQotICAgIGZwcmludGYoc3RkZXJyLCAiQ2hhbmdlIG9m
IHByb2Nlc3MgbmFtZSBub3Qgc3VwcG9ydGVkIGJ5IHlvdXIgT1NcbiIpOworICAgIGVycm9yX3Jl
cG9ydCgiQ2hhbmdlIG9mIHByb2Nlc3MgbmFtZSBub3Qgc3VwcG9ydGVkIGJ5IHlvdXIgT1MiKTsK
ICAgICBleGl0KDEpOwogI2VuZGlmCiB9CkBAIC0yNDMsNyArMjQzLDcgQEAgc3RhdGljIHZvaWQg
Y2hhbmdlX3Jvb3Qodm9pZCkKIHsKICAgICBpZiAoY2hyb290X2RpcikgewogICAgICAgICBpZiAo
Y2hyb290KGNocm9vdF9kaXIpIDwgMCkgewotICAgICAgICAgICAgZnByaW50ZihzdGRlcnIsICJj
aHJvb3QgZmFpbGVkXG4iKTsKKyAgICAgICAgICAgIGVycm9yX3JlcG9ydCgiY2hyb290IGZhaWxl
ZCIpOwogICAgICAgICAgICAgZXhpdCgxKTsKICAgICAgICAgfQogICAgICAgICBpZiAoY2hkaXIo
Ii8iKSkgewotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
