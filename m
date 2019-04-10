From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] AMD/IOMMU: adjust IOMMU list head initialization
Date: Wed, 10 Apr 2019 03:37:30 -0600
Message-ID: <5CADB95A0200007800226174@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=B5aJ=SM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hE9fj-0004I3-Bs
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 09:37:35 +0000
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
Cc: Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

RG8gdGhpcyBzdGF0aWNhbGx5LCB3aGljaCB3aWxsIGFsbG93IGFjY2Vzc2luZyB0aGUgKGVtcHR5
KSBsaXN0IGV2ZW4Kd2l0aG91dCBoYXZpbmcgY29tZSB0aHJvdWdoIGFjcGlfaXZyc19pbml0KCku
CgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jCisrKyBiL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMKQEAgLTM2LDcgKzM2LDcgQEAgc3RhdGljIHN0
cnVjdCB0YXNrbGV0IGFtZF9pb21tdV9pcnFfdGFzawogdW5zaWduZWQgaW50IF9fcmVhZF9tb3N0
bHkgaXZyc19iZGZfZW50cmllczsKIHU4IF9fcmVhZF9tb3N0bHkgaXZoZF90eXBlOwogc3RhdGlj
IHN0cnVjdCByYWRpeF90cmVlX3Jvb3QgaXZyc19tYXBzOwotc3RydWN0IGxpc3RfaGVhZCBhbWRf
aW9tbXVfaGVhZDsKK0xJU1RfSEVBRF9SRUFEX01PU1RMWShhbWRfaW9tbXVfaGVhZCk7CiBzdHJ1
Y3QgdGFibGVfc3RydWN0IGRldmljZV90YWJsZTsKIGJvb2xfdCBpb21tdXYyX2VuYWJsZWQ7CiAK
LS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYworKysgYi94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9pb21tdS5jCkBAIC0xNTAsOCArMTUw
LDYgQEAgc3RhdGljIHZvaWQgYW1kX2lvbW11X3NldHVwX2RvbWFpbl9kZXZpYwogCiBpbnQgX19p
bml0IGFjcGlfaXZyc19pbml0KHZvaWQpCiB7Ci0gICAgSU5JVF9MSVNUX0hFQUQoJmFtZF9pb21t
dV9oZWFkKTsKLQogICAgIGlmICggIWlvbW11X2VuYWJsZSAmJiAhaW9tbXVfaW50cmVtYXAgKQog
ICAgICAgICByZXR1cm4gMDsKIAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
