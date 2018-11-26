From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86emul: fix test harness 32-bit "clean" target
 handling
Date: Mon, 26 Nov 2018 07:13:33 -0700
Message-ID: <5BFBFF8D020000780020006B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gRHfN-0003dx-3p
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 14:15:13 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2hlbiBwcmVwYXJpbmcgd2hhdCBpcyBub3cgNTJjMzdmN2FiOSAoIng4NmVtdWw6IGFsc28gYWxs
b3cgcnVubmluZyB0aGUKMzItYml0IGhhcm5lc3Mgb24gYSA2NC1iaXQgZGlzdHJvIikgSSBmaXJz
dCB3cm9uZ2x5IHVzZWQgWEVOX1RBUkdFVF9BUkNICmluc3RlYWQgb2YgWEVOX0NPTVBJTEVfQVJD
SC4gV2hlbiByZWFsaXppbmcgdGhlIG1pc3Rha2UgSSBmb3Jnb3QgdG8gYWxzbwpzd2l0Y2ggYXJv
dW5kIHRoZSB1c2UgaW4gdGhlIGV4cHJlc3Npb24gY29udHJvbGxpbmcgdGhlIHJ1bGUKZGVwZW5k
ZW5jaWVzLCBjYXVzaW5nICJtYWtlIGRpc3RjbGVhbiIgdG8gZmFpbCBvbiA2NC1iaXQgZGlzdHJv
cy4KClJlcG9ydGVkLWJ5OiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPgpT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClRlc3RlZC1ieTog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KCi0tLSBhL3Rvb2xzL3Rlc3Rz
L3g4Nl9lbXVsYXRvci9NYWtlZmlsZQorKysgYi90b29scy90ZXN0cy94ODZfZW11bGF0b3IvTWFr
ZWZpbGUKQEAgLTE4NSw3ICsxODUsNyBAQCBkaXN0Y2xlYW46IGNsZWFuCiBpbnN0YWxsIHVuaW5z
dGFsbDoKIAogLlBIT05ZOiBydW4zMiBjbGVhbjMyCi1pZmVxICgkKFhFTl9UQVJHRVRfQVJDSCks
eDg2XzY0KQoraWZlcSAoJChYRU5fQ09NUElMRV9BUkNIKSx4ODZfNjQpCiBydW4zMjogJChhZGRz
dWZmaXggLmgsJChURVNUQ0FTRVMpKSAkKGFkZHN1ZmZpeCAtb3BtYXNrLmgsJChPUE1BU0spKQog
cnVuMzIgY2xlYW4zMjogJTMyOgogCSQoTUFLRSkgLUMgMzIgJCoKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
