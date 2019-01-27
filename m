From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: [PATCH] tools/libxl: Fix leaking ssid_label in
 libxl_name_to_domid
Date: Sat, 26 Jan 2019 22:45:07 -0700
Message-ID: <20190127054507.30838-1-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IW4K=QD=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1gndFp-0006gy-9M
 for xen-devel@lists.xenproject.org; Sun, 27 Jan 2019 05:45:13 +0000
Received: by mail-it1-f194.google.com with SMTP id m8so8278248itk.0
 for <xen-devel@lists.xenproject.org>; Sat, 26 Jan 2019 21:45:12 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gc3lzdGVtcyB3aXRoIFhTTSBlbmFibGVkIGxpYnhsX25hbWVfdG9fZG9taWQgbGVha3MgbWVt
b3J5CmFsbG9jYXRlZCBmb3Igc3NpZF9sYWJlbDoKCj09MjY5Mz09IDUzIGJ5dGVzIGluIDIgYmxv
Y2tzIGFyZSBkZWZpbml0ZWx5IGxvc3QgaW4gbG9zcyByZWNvcmQgNCBvZiA4Cj09MjY5Mz09ICAg
IGF0IDB4NEMyQkU2RDogbWFsbG9jICh2Z19yZXBsYWNlX21hbGxvYy5jOjMwOSkKPT0yNjkzPT0g
ICAgYnkgMHg2QzBBM0I5OiBzdHJkdXAgKHN0cmR1cC5jOjQyKQo9PTI2OTM9PSAgICBieSAweDUx
MDgyOTQ6IGxpYnhsX2ZsYXNrX3NpZF90b19jb250ZXh0IChsaWJ4bF9mbGFzay5jOjM5KQo9PTI2
OTM9PSAgICBieSAweDUwQzJCNjQ6IGxpYnhsX194Y2luZm8yeGxpbmZvIChsaWJ4bF9kb21haW4u
YzoyNjcpCj09MjY5Mz09ICAgIGJ5IDB4NTBDMkUwMjogbGlieGxfbGlzdF9kb21haW4gKGxpYnhs
X2RvbWFpbi5jOjMwOCkKPT0yNjkzPT0gICAgYnkgMHg1MDhBM0M1OiBsaWJ4bF9uYW1lX3RvX2Rv
bWlkIChsaWJ4bF91dGlscy5jOjc3KQoKU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0
YW1hc0B0a2xlbmd5ZWwuY29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJp
eC5jb20+CkNjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnhs
L2xpYnhsX3V0aWxzLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfdXRpbHMuYyBiL3Rvb2xzL2xpYnhsL2xpYnhs
X3V0aWxzLmMKaW5kZXggZTUwZTA5NGM0OC4uOTlhYmZhNTQ5NyAxMDA2NDQKLS0tIGEvdG9vbHMv
bGlieGwvbGlieGxfdXRpbHMuYworKysgYi90b29scy9saWJ4bC9saWJ4bF91dGlscy5jCkBAIC03
OSw2ICs3OSw4IEBAIGludCBsaWJ4bF9uYW1lX3RvX2RvbWlkKGxpYnhsX2N0eCAqY3R4LCBjb25z
dCBjaGFyICpuYW1lLAogICAgICAgICByZXR1cm4gRVJST1JfTk9NRU07CiAKICAgICBmb3IgKGkg
PSAwOyBpIDwgbmJfZG9tYWluczsgaSsrKSB7CisgICAgICAgIGlmIChkb21pbmZvW2ldLnNzaWRf
bGFiZWwpCisgICAgICAgICAgICBmcmVlKGRvbWluZm9baV0uc3NpZF9sYWJlbCk7CiAgICAgICAg
IGRvbW5hbWUgPSBsaWJ4bF9kb21pZF90b19uYW1lKGN0eCwgZG9taW5mb1tpXS5kb21pZCk7CiAg
ICAgICAgIGlmICghZG9tbmFtZSkKICAgICAgICAgICAgIGNvbnRpbnVlOwotLSAKMi4yMC4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
