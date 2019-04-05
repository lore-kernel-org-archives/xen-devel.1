From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] VT-d: posted interrupts require interrupt
 remapping
Date: Fri, 05 Apr 2019 01:01:49 -0600
Message-ID: <5CA6FD5D0200007800224C46@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hCIrM-00024k-Bo
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 07:01:56 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>
List-Id: xen-devel@lists.xenproject.org

SW5pdGlhbGx5IEkgaGFkIGp1c3Qgbm90aWNlZCB0aGUgdW5uZWNlc3NhcnkgaW5kaXJlY3Rpb24g
aW4gdGhlIGNhbGwKZnJvbSBwaV91cGRhdGVfaXJ0ZSgpLiBUaGUgZ2VuZXJpYyB3cmFwcGVyIGhh
dmluZyBhbiBpb21tdV9pbnRyZW1hcApjb25kaXRpb25hbCBtYWRlIG1lIGxvb2sgYXQgdGhlIHNl
dHVwIGNvZGUgdGhvdWdoLiBTbyBmaXJzdCBvZiBhbGwKZW5mb3JjZSB0aGUgbmVjZXNzYXJ5IGRl
cGVuZGVuY3kuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW50cmVtYXAuYworKysgYi94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW50cmVtYXAuYwpAQCAtOTkzLDcgKzk5Myw4IEBAIGlu
dCBwaV91cGRhdGVfaXJ0ZShjb25zdCBzdHJ1Y3QgcGlfZGVzYwogICAgIHNwaW5fdW5sb2NrX2ly
cSgmZGVzYy0+bG9jayk7CiAKICAgICBBU1NFUlQocGNpZGV2c19sb2NrZWQoKSk7Ci0gICAgcmV0
dXJuIGlvbW11X3VwZGF0ZV9pcmVfZnJvbV9tc2kobXNpX2Rlc2MsICZtc2lfZGVzYy0+bXNnKTsK
KworICAgIHJldHVybiBtc2lfbXNnX3dyaXRlX3JlbWFwX3J0ZShtc2lfZGVzYywgJm1zaV9kZXNj
LT5tc2cpOwogCiAgdW5sb2NrX291dDoKICAgICBzcGluX3VubG9ja19pcnEoJmRlc2MtPmxvY2sp
OwotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYworKysgYi94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwpAQCAtMjM0Miw3ICsyMzQyLDcgQEAgc3RhdGlj
IGludCBfX2luaXQgdnRkX3NldHVwKHZvaWQpCiAgICAgICAgICAqIG5vdCBzdXBwb3J0ZWQsIHNp
bmNlIHdlIGNvdW50IG9uIHRoaXMgZmVhdHVyZSB0bwogICAgICAgICAgKiBhdG9taWNhbGx5IHVw
ZGF0ZSAxNi1ieXRlIElSVEUgaW4gcG9zdGVkIGZvcm1hdC4KICAgICAgICAgICovCi0gICAgICAg
IGlmICggIWNhcF9pbnRyX3Bvc3QoaW9tbXUtPmNhcCkgfHwgIWNwdV9oYXNfY3gxNiApCisgICAg
ICAgIGlmICggIWNhcF9pbnRyX3Bvc3QoaW9tbXUtPmNhcCkgfHwgIWlvbW11X2ludHJlbWFwIHx8
ICFjcHVfaGFzX2N4MTYgKQogICAgICAgICAgICAgaW9tbXVfaW50cG9zdCA9IDA7CiAKICAgICAg
ICAgaWYgKCAhdnRkX2VwdF9wYWdlX2NvbXBhdGlibGUoaW9tbXUpICkKCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
