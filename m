From: Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 2/4] xen/arm: initialize access
Date: Tue,  6 Nov 2018 14:05:57 -0800
Message-ID: <1541541959-23140-2-git-send-email-sstabellini@kernel.org>
References: <alpine.DEB.2.10.1811061403440.21987@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0zrd=nr=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gK9U4-00011M-FM
 for xen-devel@lists.xenproject.org; Tue, 06 Nov 2018 22:06:04 +0000
In-Reply-To: <alpine.DEB.2.10.1811061403440.21987@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefanos@xilinx.com>, sstabellini@kernel.org, rcojocaru@bitdefender.com, andrew.cooper3@citrix.com, julien.grall@arm.com, Tamas K Lengyel <tamas@tklengyel.com>, JBeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

SW5pdGlhbGl6ZSB2YXJpYWJsZSAqYWNjZXNzIGJlZm9yZSByZXR1cm5pbmcgaXQgYmFjayB0byB0
aGUgY2FsbGVyLgpJdCBtYWtlcyB0aGUgY29kZSBhIGJpdCBuaWNlciBhbmQgaXQgaXMgYSBzYWZl
dHkgY2VydGlmaWNhdGlvbgpyZXF1aXJlbWVudC4KCk0zQ00gUnVsZS05LjE6IFRoZSB2YWx1ZSBv
ZiBhbiBvYmplY3Qgd2l0aCBhdXRvbWF0aWMgc3RvcmFnZSBkdXJhdGlvbgpzaGFsbCBub3QgYmUg
cmVhZCBiZWZvcmUgaXQgaGFzIGJlZW4gc2V0CgpRQVZlcmlmeTogMjk2MgpTaWduZWQtb2ZmLWJ5
OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+CkFja2VkLWJ5OiBSYXp2
YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+CkNDOiByY29qb2NhcnVAYml0
ZGVmZW5kZXIuY29tCkNDOiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Ci0t
LQpDaGFuZ2VzIGluIHYzOgotIGFkZCBtb3JlIGluZm8gdG8gY29tbWl0IG1lc3NhZ3RlCgpDaGFu
Z2VzIGluIHYyOgotIGltcHJvdmUgY29tbWVudAotIHVzZSBwMm0tPmRlZmF1bHRfYWNjZXNzCi0t
LQogeGVuL2FyY2gvYXJtL21lbV9hY2Nlc3MuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21lbV9hY2Nlc3MuYyBiL3hlbi9h
cmNoL2FybS9tZW1fYWNjZXNzLmMKaW5kZXggYmE0ZWM3OC4uODZmMDg4MiAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gvYXJtL21lbV9hY2Nlc3MuYworKysgYi94ZW4vYXJjaC9hcm0vbWVtX2FjY2Vzcy5j
CkBAIC00Nyw2ICs0Nyw3IEBAIHN0YXRpYyBpbnQgX19wMm1fZ2V0X21lbV9hY2Nlc3Moc3RydWN0
IGRvbWFpbiAqZCwgZ2ZuX3QgZ2ZuLAogICAgIH07CiAKICAgICBBU1NFUlQocDJtX2lzX2xvY2tl
ZChwMm0pKTsKKyAgICAqYWNjZXNzID0gcDJtLT5kZWZhdWx0X2FjY2VzczsKIAogICAgIC8qIElm
IG5vIHNldHRpbmcgd2FzIGV2ZXIgc2V0LCBqdXN0IHJldHVybiByd3guICovCiAgICAgaWYgKCAh
cDJtLT5tZW1fYWNjZXNzX2VuYWJsZWQgKQotLSAKMS45LjEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
