From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 14/16] os-posix: cleanup: Replace fprintf with
 error_report in remaining call sites
Date: Thu, 19 Apr 2018 17:45:17 +0100
Message-ID: <1524156319-11465-15-git-send-email-ian.jackson@eu.citrix.com>
References: <1524156319-11465-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jxfj=hi=citrix.com=prvs=6403088e3=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1f9ClC-0006U1-9Y
 for xen-devel@lists.xenproject.org; Thu, 19 Apr 2018 16:50:14 +0000
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

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+CkND
OiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgpDQzogTWFya3VzIEFybWJydXN0
ZXIgPGFybWJydUByZWRoYXQuY29tPgpDQzogRGFuaWVsIFAuIEJlcnJhbmdlIDxiZXJyYW5nZUBy
ZWRoYXQuY29tPgpDQzogTWljaGFlbCBUb2thcmV2IDxtanRAdGxzLm1zay5ydT4KLS0tCnY3OiBO
ZXcgcGF0Y2gKLS0tCiBvcy1wb3NpeC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL29zLXBvc2l4LmMgYi9vcy1w
b3NpeC5jCmluZGV4IDBmNTk1NjYuLmQ0Y2Y0NjYgMTAwNjQ0Ci0tLSBhL29zLXBvc2l4LmMKKysr
IGIvb3MtcG9zaXguYwpAQCAtMTI5LDcgKzEyOSw3IEBAIHZvaWQgb3Nfc2V0X3Byb2NfbmFtZShj
b25zdCBjaGFyICpzKQogICAgICAgICBleGl0KDEpOwogICAgIH0KICNlbHNlCi0gICAgZnByaW50
ZihzdGRlcnIsICJDaGFuZ2Ugb2YgcHJvY2VzcyBuYW1lIG5vdCBzdXBwb3J0ZWQgYnkgeW91ciBP
U1xuIik7CisgICAgZXJyb3JfcmVwb3J0KCJDaGFuZ2Ugb2YgcHJvY2VzcyBuYW1lIG5vdCBzdXBw
b3J0ZWQgYnkgeW91ciBPU1xuIik7CiAgICAgZXhpdCgxKTsKICNlbmRpZgogfQpAQCAtMjQzLDcg
KzI0Myw3IEBAIHN0YXRpYyB2b2lkIGNoYW5nZV9yb290KHZvaWQpCiB7CiAgICAgaWYgKGNocm9v
dF9kaXIpIHsKICAgICAgICAgaWYgKGNocm9vdChjaHJvb3RfZGlyKSA8IDApIHsKLSAgICAgICAg
ICAgIGZwcmludGYoc3RkZXJyLCAiY2hyb290IGZhaWxlZFxuIik7CisgICAgICAgICAgICBlcnJv
cl9yZXBvcnQoImNocm9vdCBmYWlsZWQiKTsKICAgICAgICAgICAgIGV4aXQoMSk7CiAgICAgICAg
IH0KICAgICAgICAgaWYgKGNoZGlyKCIvIikpIHsKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
