From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH] libxl: CODING_STYLE: Clarify line length limit
 to 75
Date: Mon, 15 Oct 2018 14:53:27 +0100
Message-ID: <20181015135327.22106-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=w2gt=m3=citrix.com=prvs=81941a82a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gC3JW-0000Pz-5i
 for xen-devel@lists.xenproject.org; Mon, 15 Oct 2018 13:53:42 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW5kIGdpdmUgYSByZWFzb24uCgpUaGUgcHJldmlvdXMgYGxpbWl0JyBvZiA3NS04MCB3YXMgYW1i
aWd1b3VzLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJp
eC5jb20+CkNDOiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KLS0t
CiB0b29scy9saWJ4bC9DT0RJTkdfU1RZTEUgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9DT0RJ
TkdfU1RZTEUgYi90b29scy9saWJ4bC9DT0RJTkdfU1RZTEUKaW5kZXggMzIxNzBlZmI5ZS4uM2Q1
NzJmNjkyNSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvQ09ESU5HX1NUWUxFCisrKyBiL3Rvb2xz
L2xpYnhsL0NPRElOR19TVFlMRQpAQCAtMjIwLDEyICsyMjAsMTQgQEAgRG8gbm90IGxlYXZlIHdo
aXRlc3BhY2UgZGFuZ2xpbmcgb2ZmIHRoZSBlbmRzIG9mIGxpbmVzLgogCiAyLiBMaW5lIHdpZHRo
CiAKLUxpbmVzIGFyZSBsaW1pdGVkIHRvIDc1LTgwIGNoYXJhY3RlcnMuCitMaW5lcyBhcmUgbGlt
aXRlZCB0byA3NSBjaGFyYWN0ZXJzLgogCiBSYXRpb25hbGU6CiAgLSBTb21lIHBlb3BsZSBsaWtl
IHRvIHRpbGUgdGhlaXIgMjQiIHNjcmVlbnMgd2l0aCBhIDZ4NCBtYXRyaXggb2YgODB4MjQKICAg
IHh0ZXJtcyBhbmQgdXNlIHZpIGluIGFsbCBvZiB0aGVtLiAgVGhlIGJlc3Qgd2F5IHRvIHB1bmlz
aCB0aGVtIGlzIHRvCiAgICBsZXQgdGhlbSBrZWVwIGRvaW5nIGl0LgorIC0gSW4gYW4gODAgY29s
dW1uIHRlcm1pbmFsLCBzb21lIHJvb20gbmVlZHMgdG8gYmUgbGVmdCBmb3IgPiBxdW90aW5nCisg
ICBjaGFyYWN0ZXJzLCArLy0gZGlmZiBjaGFyYWN0ZXJzLCBhbmQgc28gb24sIGluIGVtYWlscy4K
ICAtIENvZGUgYW5kIGVzcGVjaWFsbHkgcGF0Y2hlcyBpcyBtdWNoIG1vcmUgcmVhZGFibGUgaWYg
bGltaXRlZCB0byBhIHNhbmUKICAgIGxpbmUgbGVuZ3RoLiAgRWlnaHR5IGlzIHRyYWRpdGlvbmFs
LgogIC0gSXQgaXMgdGhlIGxpYnhlbmxpZ2h0IGNvZGluZyBzdHlsZS4KLS0gCjIuMTEuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
