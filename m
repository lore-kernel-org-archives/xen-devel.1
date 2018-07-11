From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v3 1/3] xen/x86: replace '||' usage in the
 linker script
Date: Wed, 11 Jul 2018 17:34:48 +0200
Message-ID: <20180711153450.83331-2-roger.pau@citrix.com>
References: <20180711153450.83331-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ebcd=j3=citrix.com=prvs=7236e92fb=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fdH9R-0007Qc-9I
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 15:35:33 +0000
In-Reply-To: <20180711153450.83331-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Daniel Kiper <daniel.kiper@oracle.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2l0aCAnfCcuIFRoZSByZXN1bHQgaXMgdGhlIHNhbWUsIGFuZCB0aGUgbGF0ZXIgd29ya3Mgd2l0
aCBsbGQuIEZpeGVzCnRoZSBmb2xsb3dpbmcgZXJyb3Igd2hlbiBidWlsZGluZyBYZW4gd2l0aCBs
bGQ6CgpsZCAgICAtbWVsZl94ODZfNjRfZmJzZCAgLVQgeGVuLmxkcyAtTiBwcmVsaW5rLm8gLS1i
dWlsZC1pZD1zaGExIFwKICAgIC9yb290L3NyYy94ZW4veGVuL2NvbW1vbi9zeW1ib2xzLWR1bW15
Lm8gLW8gL3Jvb3Qvc3JjL3hlbi94ZW4vLnhlbi1zeW1zLjAKbGQ6IGVycm9yOiB4ZW4ubGRzOjI2
MDogbWFsZm9ybWVkIG51bWJlcjogfAo+Pj4gQVNTRVJUKF9faW1hZ2VfYmFzZV9fID4gKCgoKCgo
KCgoMjYxID4+IDgpICogMHhmZmZmMDAwMDAwMDAwMDAwKSB8ICgyNjEgPDwgMzkpKSkgKyAoKDEg
PDwgMzkpIC8gMikpICsgKDY0IDw8IDMwKSkgKyAoMSA8PCAzMCkpICsgKDEgPDwgMzApKSkgfHwK
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNjOiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgpDYzogRGFuaWVsIEtpcGVyIDxkYW5pZWwua2lwZXJAb3JhY2xlLmNvbT4KLS0tCiB4ZW4v
YXJjaC94ODYveGVuLmxkcy5TIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUyBiL3hl
bi9hcmNoL3g4Ni94ZW4ubGRzLlMKaW5kZXggNzBhZmVkZDMxZC4uMzI2ZTg4NTQwMiAxMDA2NDQK
LS0tIGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUworKysgYi94ZW4vYXJjaC94ODYveGVuLmxkcy5T
CkBAIC0zMzEsNyArMzMxLDcgQEAgU0VDVElPTlMKICAgLmNvbW1lbnQgMCA6IHsgKiguY29tbWVu
dCkgfQogfQogCi1BU1NFUlQoX19pbWFnZV9iYXNlX18gPiBYRU5fVklSVF9TVEFSVCB8fAorQVNT
RVJUKF9faW1hZ2VfYmFzZV9fID4gWEVOX1ZJUlRfU1RBUlQgfAogICAgICAgIF9fMk1fcndkYXRh
X2VuZCA8PSBYRU5fVklSVF9FTkQgLSBOUl9DUFVTICogUEFHRV9TSVpFLAogICAgICAgICJYZW4g
aW1hZ2Ugb3ZlcmxhcHMgc3R1YnMgYXJlYSIpCiAKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
