From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [RFC v2 0/9] libxl: Enable save/restore/migration of a
 restricted QEMU
Date: Mon, 16 Apr 2018 18:32:18 +0100
Message-ID: <20180416173227.22671-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vmis=hf=citrix.com=prvs=6372a2554=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1f87zU-0006iA-Md
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 17:32:32 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

UGF0Y2hlcyAxIGFuZCAzIGZpeCBkZWJ1ZyBidWlsZC4KUGF0Y2ggMiBhZGQgc29tZSBkb2N1bWVu
dGF0aW9uIHRvIGxpYnhsX3FtcC5jLgpQYXRjaCA0IGZpeCBhbiBpc3N1ZSB3aXRoIHFtcF9uZXh0
KCkuCgpQYXRjaGVzIDUgYW5kIDYgZml4IHNhdmUgb2YgYSBWTSB3aXRoIGEgcmVzdHJpY3RlZCBR
RU1VLgpBbmQgdGhlIGxhc3QgdHdvIHBhdGNocyB0cnkgdG8gZml4IHRoZSByZXN0b3JlIHBhdGgs
IGJ1dCBpdCBpcyBzdGlsbCBXSVAuCgpDaGVja291dCB0aGUgbGFzdCBwYXRjaCBjb21tZW50cyBm
b3IgbW9yZSBpbmZvcm1hdGlvbi4KCkFudGhvbnkgUEVSQVJEICg5KToKICBsaWJ4bF9ldmVudDog
Rml4IERFQlVHIHByaW50cwogIGxpYnhsX3FtcDogRG9jdW1lbnRhdGlvbiBvZiB0aGUgbG9naWMg
b2YgdGhlIFFNUCBjbGllbnQKICBsaWJ4bF9xbXA6IEZpeCB1c2Ugb2YgREVCVUdfUkVDRUlWRUQK
ICBsaWJ4bF9xbXA6IE1vdmUgdGhlIGJ1ZmZlciByZWFsbG9jIHRvIHRoZSBzYW1lIHNjb3BlIGxl
dmVsIGFzIHJlYWQKICBsaWJ4bDogTGVhcm5lZCB0byBzZW5kIEZEIHRocm91Z2ggUU1QIHRvIFFF
TVUKICBsaWJ4bDogSGF2ZSBRRU1VIHNhdmUgaXRzIHN0YXRlIHRvIGEgZmlsZSBkZXNjcmlwdG9y
CiAgbGlieGxfcW1wOiBJbXBsZW1lbnQgcXVlcnktc3RhdHVzIGNvbW1hbmQKICBIQUNLIGxpYnhs
X2V4ZWM6IENoZWNrIFFFTVUgc3RhdHVzIHZpYSBRTVAgaW5zdGVhZCBvZiB4ZW5zdG9yZQogIGxp
YnhsX3FtcDogQWRkIGEgd2FybmluZyB0byBub3QgdHJ1c3QgUUVNVQoKIHRvb2xzL2xpYnhsL2xp
YnhsX2FvdXRpbHMuYyAgfCAxNTYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHRv
b2xzL2xpYnhsL2xpYnhsX2RtLmMgICAgICAgfCAgNDQgKysrKysrKy0tCiB0b29scy9saWJ4bC9s
aWJ4bF9ldmVudC5jICAgIHwgICA4ICstCiB0b29scy9saWJ4bC9saWJ4bF9leGVjLmMgICAgIHwg
IDI4ICsrKystLQogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCB8ICAzMyArKysrKysrCiB0
b29scy9saWJ4bC9saWJ4bF9xbXAuYyAgICAgIHwgMTY3ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tCiA2IGZpbGVzIGNoYW5nZWQsIDQwMyBpbnNlcnRpb25zKCspLCAzMyBkZWxl
dGlvbnMoLSkKCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
