From: Juergen Gross <jgross@suse.com>
Subject: [PATCH RFC 20/49] xen/sched: add id to struct sched_item
Date: Fri, 29 Mar 2019 16:09:05 +0100
Message-ID: <20190329150934.17694-21-jgross@suse.com>
References: <20190329150934.17694-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=APY9=SA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h9t8f-0003dA-Mz
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 15:09:49 +0000
In-Reply-To: <20190329150934.17694-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

QWRkIGFuIGlkZW50aWZpZXIgdG8gc2NoZWRfaXRlbS4gRm9yIG5vdyBpdCB3aWxsIGJlIHRoZSBz
YW1lIGFzIHRoZQpyZWxhdGVkIHZjcHVfaWQuCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogeGVuL2NvbW1vbi9zY2hlZHVsZS5jICAgICAgfCAzICsr
LQogeGVuL2luY2x1ZGUveGVuL3NjaGVkLWlmLmggfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hl
ZHVsZS5jIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCmluZGV4IDYyNWQ2Mjg3YzIuLjdhN2VjNTY0
MDIgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYworKysgYi94ZW4vY29tbW9uL3Nj
aGVkdWxlLmMKQEAgLTI5MywxMiArMjkzLDEzIEBAIHN0YXRpYyBzdHJ1Y3Qgc2NoZWRfaXRlbSAq
c2NoZWRfYWxsb2NfaXRlbShzdHJ1Y3QgdmNwdSAqdikKIAogICAgIHYtPnNjaGVkX2l0ZW0gPSBp
dGVtOwogICAgIGl0ZW0tPnZjcHUgPSB2OworICAgIGl0ZW0tPml0ZW1faWQgPSB2LT52Y3B1X2lk
OwogICAgIGl0ZW0tPmRvbWFpbiA9IGQ7CiAKICAgICBmb3IgKCBwcmV2X2l0ZW0gPSAmZC0+c2No
ZWRfaXRlbV9saXN0OyAqcHJldl9pdGVtOwogICAgICAgICAgIHByZXZfaXRlbSA9ICYoKnByZXZf
aXRlbSktPm5leHRfaW5fbGlzdCApCiAgICAgICAgIGlmICggKCpwcmV2X2l0ZW0pLT5uZXh0X2lu
X2xpc3QgJiYKLSAgICAgICAgICAgICAoKnByZXZfaXRlbSktPm5leHRfaW5fbGlzdC0+dmNwdS0+
dmNwdV9pZCA+IHYtPnZjcHVfaWQgKQorICAgICAgICAgICAgICgqcHJldl9pdGVtKS0+bmV4dF9p
bl9saXN0LT5pdGVtX2lkID4gaXRlbS0+aXRlbV9pZCApCiAgICAgICAgICAgICBicmVhazsKIAog
ICAgIGl0ZW0tPm5leHRfaW5fbGlzdCA9ICpwcmV2X2l0ZW07CmRpZmYgLS1naXQgYS94ZW4vaW5j
bHVkZS94ZW4vc2NoZWQtaWYuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oCmluZGV4IDlh
NTI0MDE0ZDAuLjFlNGE3ZTFlNjQgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1p
Zi5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oCkBAIC01NSw2ICs1NSw3IEBAIHN0
cnVjdCBzY2hlZF9pdGVtIHsKICAgICB2b2lkICAgICAgICAgICAgICAgICAgKnByaXY7ICAgICAg
Lyogc2NoZWR1bGVyIHByaXZhdGUgZGF0YSAqLwogICAgIHN0cnVjdCBzY2hlZF9pdGVtICAgICAq
bmV4dF9pbl9saXN0OwogICAgIHN0cnVjdCBzY2hlZF9yZXNvdXJjZSAqcmVzOworICAgIGludCAg
ICAgICAgICAgICAgICAgICAgaXRlbV9pZDsKIAogICAgIC8qIExhc3QgdGltZSB3aGVuIGl0ZW0g
aGFzIGJlZW4gc2NoZWR1bGVkIG91dC4gKi8KICAgICB1aW50NjRfdCAgICAgICAgICAgICAgIGxh
c3RfcnVuX3RpbWU7Ci0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
