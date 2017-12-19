From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 2/2] x86/dom0: remove is_pv_domain leftovers
	from the PV domain builder
Date: Tue, 19 Dec 2017 14:20:03 +0000
Message-ID: <20171219142003.81138-3-roger.pau@citrix.com>
References: <20171219142003.81138-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=u91z=dp=citrix.com=prvs=519ad8697=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eRIl5-00068F-4D
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2017 14:20:39 +0000
In-Reply-To: <20171219142003.81138-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhvc2Ugd2hlcmUgYWRkZWQgd2hlbiBQVkh2MSB3YXMgc2hhcmluZyB0aGUgZG9tYWluIGJ1aWxk
ZXIgd2l0aCBQVi4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgotLS0KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2
L3B2L2RvbTBfYnVpbGQuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3B2L2RvbTBfYnVp
bGQuYyBiL3hlbi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMKaW5kZXggNmE1ZmMzMjZmNy4uMDlj
NzY1YTA2ZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYworKysgYi94
ZW4vYXJjaC94ODYvcHYvZG9tMF9idWlsZC5jCkBAIC02NzEsOCArNjcxLDcgQEAgaW50IF9faW5p
dCBkb20wX2NvbnN0cnVjdF9wdihzdHJ1Y3QgZG9tYWluICpkLAogICAgIH0KIAogICAgIC8qIFBh
Z2VzIHRoYXQgYXJlIHBhcnQgb2YgcGFnZSB0YWJsZXMgbXVzdCBiZSByZWFkIG9ubHkuICovCi0g
ICAgaWYgICggaXNfcHZfZG9tYWluKGQpICkKLSAgICAgICAgbWFya19wdl9wdF9wYWdlc19yZG9u
bHkoZCwgbDRzdGFydCwgdnB0X3N0YXJ0LCBucl9wdF9wYWdlcyk7CisgICAgbWFya19wdl9wdF9w
YWdlc19yZG9ubHkoZCwgbDRzdGFydCwgdnB0X3N0YXJ0LCBucl9wdF9wYWdlcyk7CiAKICAgICAv
KiBNYXNrIGFsbCB1cGNhbGxzLi4uICovCiAgICAgZm9yICggaSA9IDA7IGkgPCBYRU5fTEVHQUNZ
X01BWF9WQ1BVUzsgaSsrICkKQEAgLTc1MSw3ICs3NTAsNyBAQCBpbnQgX19pbml0IGRvbTBfY29u
c3RydWN0X3B2KHN0cnVjdCBkb21haW4gKmQsCiAgICAgY291bnQgPSBkLT50b3RfcGFnZXM7CiAK
ICAgICAvKiBTZXQgdXAgdGhlIHBoeXMtPm1hY2hpbmUgdGFibGUgaWYgbm90IHBhcnQgb2YgdGhl
IGluaXRpYWwgbWFwcGluZy4gKi8KLSAgICBpZiAoIGlzX3B2X2RvbWFpbihkKSAmJiBwYXJtcy5w
Mm1fYmFzZSAhPSBVTlNFVF9BRERSICkKKyAgICBpZiAoIHBhcm1zLnAybV9iYXNlICE9IFVOU0VU
X0FERFIgKQogICAgIHsKICAgICAgICAgcGZuID0gcGFnZXRhYmxlX2dldF9wZm4odi0+YXJjaC5n
dWVzdF90YWJsZSk7CiAgICAgICAgIHNldHVwX3B2X3BoeXNtYXAoZCwgcGZuLCB2X3N0YXJ0LCB2
X2VuZCwgdnBoeXNtYXBfc3RhcnQsIHZwaHlzbWFwX2VuZCwKLS0gCjIuMTQuMyAoQXBwbGUgR2l0
LTk4KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
