From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 1/3] string: avoid undefined behavior in
 strrchr()
Date: Mon, 07 Jan 2019 02:39:10 -0700
Message-ID: <5C331E3E020000780020AB50@prv1-mh.provo.novell.com>
References: <5C331C51020000780020AB3F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yoBP=PP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ggRNO-0007No-4R
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 09:39:18 +0000
In-Reply-To: <5C331C51020000780020AB3F@prv1-mh.provo.novell.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIHByZS1kZWNyZW1lbnQgd291bGQgbm90IG9ubHkgY2F1c2UgbWlzYmVoYXZpb3Igd2hlbiB3
cmFwcGluZyAoYmVuaWduCmJlY2F1c2UgdGhlcmUgc2hvdWxkbid0IGJlIGFueSBOVUxMIHBvaW50
ZXJzIHBhc3NlZCBpbiksIGJ1dCBtYXkgYWxzbwpjcmVhdGUgYSBwb2ludGVyIHBvaW50aW5nIG91
dHNpZGUgdGhlIG9iamVjdCB0aGF0IHRoZSBwYXNzZWQgaW4gcG9pbnRlcgpwb2ludHMgdG8gKGl0
IHdvbid0IGJlIGRlLXJlZmVyZW5jZWQgdGhvdWdoKS4gVXNlIHBvc3QtZGVjcmVtZW50IChhbmQg
PgppbnN0ZWFkIG9mID49ICkgaW5zdGVhZC4KClRha2UgdGhlIG9wcG9ydHVuaXR5IGFuZCBhbHNv
Ci0gY29udmVydCBib2d1cyBzcGFjZSAocGFydGx5IDcgb2YgdGhlbSkgaW5kZW50YXRpb24gdG8g
TGludXggc3R5bGUgdGFiCiAgb25lLAotIGFkZCB0d28gYmxhbmsgbGluZXMuCgpTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vY29tbW9uL3N0
cmluZy5jCisrKyBiL3hlbi9jb21tb24vc3RyaW5nLmMKQEAgLTE3NCwxMiArMTc0LDEzIEBAIGNo
YXIgKihzdHJjaHIpKGNvbnN0IGNoYXIgKnMsIGludCBjKQogICovCiBjaGFyICooc3RycmNociko
Y29uc3QgY2hhciAqcywgaW50IGMpCiB7Ci0gICAgICAgY29uc3QgY2hhciAqcCA9IHMgKyBzdHJs
ZW4ocyk7Ci0gICAgICAgZG8gewotICAgICAgICAgICBpZiAoKnAgPT0gKGNoYXIpYykKLSAgICAg
ICAgICAgICAgIHJldHVybiAoY2hhciAqKXA7Ci0gICAgICAgfSB3aGlsZSAoLS1wID49IHMpOwot
ICAgICAgIHJldHVybiBOVUxMOworCWNvbnN0IGNoYXIgKnAgPSBzICsgc3RybGVuKHMpOworCisJ
Zm9yICg7ICpwICE9IChjaGFyKWM7IC0tcCkKKwkJaWYgKHAgPT0gcykKKwkJCXJldHVybiBOVUxM
OworCisJcmV0dXJuIChjaGFyICopcDsKIH0KICNlbmRpZgogCgoKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
