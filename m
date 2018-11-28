From: Juergen Gross <jgross@suse.com>
Subject: [PATCH] xen/vmx: remove stale prototypes
Date: Wed, 28 Nov 2018 11:05:58 +0100
Message-ID: <20181128100558.19387-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+lGq=OH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gRwjN-0002OQ-3g
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 10:06:05 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U29tZSBwcm90b3R5cGVzIGluIGluY2x1ZGUvYXNtLXg4Ni9odm0vdm14L3ZteC5oIGhhdmUgbm8g
cmVsYXRlZAppbXBsZW1lbnRhdGlvbi4gUmVtb3ZlIHRoZW0uCgpTaWduZWQtb2ZmLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0v
dm14L3ZteC5oIHwgNCAtLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92bXgvdm14LmggYi94ZW4vaW5jbHVkZS9h
c20teDg2L2h2bS92bXgvdm14LmgKaW5kZXggYjExMGUxNjhjOS4uZWJhYTc0NDQ5YiAxMDA2NDQK
LS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdm14L3ZteC5oCisrKyBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvaHZtL3ZteC92bXguaApAQCAtNjA0LDEwICs2MDQsNiBAQCB1bnNpZ25lZCBpbnQg
cDJtX2ZpbmRfYWx0cDJtX2J5X2VwdHAoc3RydWN0IGRvbWFpbiAqZCwgdWludDY0X3QgZXB0cCk7
CiAKIHZvaWQgdXBkYXRlX2d1ZXN0X2VpcCh2b2lkKTsKIAotaW50IGFsbG9jX3AybV9oYXBfZGF0
YShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtKTsKLXZvaWQgZnJlZV9wMm1faGFwX2RhdGEoc3RydWN0
IHAybV9kb21haW4gKnAybSk7Ci12b2lkIHAybV9pbml0X2hhcF9kYXRhKHN0cnVjdCBwMm1fZG9t
YWluICpwMm0pOwotCiB2b2lkIHZteF9waV9wZXJfY3B1X2luaXQodW5zaWduZWQgaW50IGNwdSk7
CiB2b2lkIHZteF9waV9kZXNjX2ZpeHVwKHVuc2lnbmVkIGludCBjcHUpOwogCi0tIAoyLjE2LjQK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
