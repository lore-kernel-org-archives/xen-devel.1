From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PULL 14/16] os-posix: cleanup: Replace fprintf with
 error_report in remaining call sites
Date: Thu, 26 Apr 2018 16:56:25 +0100
Message-ID: <1524758187-9351-15-git-send-email-ian.jackson@eu.citrix.com>
References: <1524758187-9351-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pghr=hp=citrix.com=prvs=647a3a28a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fBjGP-0006lc-Lm
 for xen-devel@lists.xenproject.org; Thu, 26 Apr 2018 15:56:53 +0000
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

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+CkND
OiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgpDQzogTWFya3VzIEFybWJydXN0
ZXIgPGFybWJydUByZWRoYXQuY29tPgpDQzogRGFuaWVsIFAuIEJlcnJhbmdlIDxiZXJyYW5nZUBy
ZWRoYXQuY29tPgpDQzogTWljaGFlbCBUb2thcmV2IDxtanRAdGxzLm1zay5ydT4KUmV2aWV3ZWQt
Ynk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxmNGJ1Z0BhbXNhdC5vcmc+ClJldmlld2VkLWJ5
OiBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0LmNvbT4KLS0tCiBvcy1wb3NpeC5jIHwgNCArKy0t
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL29zLXBvc2l4LmMgYi9vcy1wb3NpeC5jCmluZGV4IDBmNTk1NjYuLmEyYmE1MGQgMTAw
NjQ0Ci0tLSBhL29zLXBvc2l4LmMKKysrIGIvb3MtcG9zaXguYwpAQCAtMTI5LDcgKzEyOSw3IEBA
IHZvaWQgb3Nfc2V0X3Byb2NfbmFtZShjb25zdCBjaGFyICpzKQogICAgICAgICBleGl0KDEpOwog
ICAgIH0KICNlbHNlCi0gICAgZnByaW50ZihzdGRlcnIsICJDaGFuZ2Ugb2YgcHJvY2VzcyBuYW1l
IG5vdCBzdXBwb3J0ZWQgYnkgeW91ciBPU1xuIik7CisgICAgZXJyb3JfcmVwb3J0KCJDaGFuZ2Ug
b2YgcHJvY2VzcyBuYW1lIG5vdCBzdXBwb3J0ZWQgYnkgeW91ciBPUyIpOwogICAgIGV4aXQoMSk7
CiAjZW5kaWYKIH0KQEAgLTI0Myw3ICsyNDMsNyBAQCBzdGF0aWMgdm9pZCBjaGFuZ2Vfcm9vdCh2
b2lkKQogewogICAgIGlmIChjaHJvb3RfZGlyKSB7CiAgICAgICAgIGlmIChjaHJvb3QoY2hyb290
X2RpcikgPCAwKSB7Ci0gICAgICAgICAgICBmcHJpbnRmKHN0ZGVyciwgImNocm9vdCBmYWlsZWRc
biIpOworICAgICAgICAgICAgZXJyb3JfcmVwb3J0KCJjaHJvb3QgZmFpbGVkIik7CiAgICAgICAg
ICAgICBleGl0KDEpOwogICAgICAgICB9CiAgICAgICAgIGlmIChjaGRpcigiLyIpKSB7Ci0tIAoy
LjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
