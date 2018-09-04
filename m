From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86emul: fix test harness dependencies
Date: Tue, 04 Sep 2018 03:58:51 -0600
Message-ID: <5B8E575B02000078001E50B7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qfrq=ls=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fx86r-0004u0-TC
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 09:58:57 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGdlbmVyYXRlZCBoZWFkZXIgZmlsZXMgYXJlIHdoYXQgbmVlZHMgdG8gc3BlbGwgb3V0IGRl
cGVuZGVuY2llcyBvbgpvdGhlciAocmVhbCkgaGVhZGVycyBpbiB0aGUgbWFpbiBNYWtlZmlsZSBo
ZXJlLCBub3QgdGhlIGludGVybWVkaWF0ZQooaGVscGVyKSAubyBmaWxlcyBwcm9kdWNlZCB0aHJv
dWdoIHRlc3RjYXNlLm1rLgoKU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgoKLS0tIGEvdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yL01ha2VmaWxlCisrKyBiL3Rv
b2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci9NYWtlZmlsZQpAQCAtMTA5LDkgKzEwOSw5IEBAICQoYWRk
c3VmZml4IC5jLCQoRk1BKSk6CiAkKGFkZHN1ZmZpeCAuYywkKFNHKSk6CiAJbG4gLXNmIHNpbWQt
c2cuYyAkQAogCi0kKGFkZHN1ZmZpeCAubywkKFNJTUQpICQoRk1BKSAkKFNHKSk6IHNpbWQuaAor
JChhZGRzdWZmaXggLmgsJChTSU1EKSAkKEZNQSkgJChTRykpOiBzaW1kLmgKIAoteG9wLm86IHNp
bWQtZm1hLmMKK3hvcC5oOiBzaW1kLWZtYS5jCiAKICQoVEFSR0VUKTogeDg2LWVtdWxhdGUubyB0
ZXN0X3g4Nl9lbXVsYXRvci5vIHdyYXBwZXJzLm8KIAkkKEhPU1RDQykgJChIT1NUQ0ZMQUdTKSAt
byAkQCAkXgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
