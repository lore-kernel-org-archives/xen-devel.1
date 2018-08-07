From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [RFC PATCH v2 09/17] libxl: use \x1b to separate qemu
 arguments for linux stubdomain
Date: Tue,  7 Aug 2018 04:16:14 +0200
Message-ID: <c718e187dd79cd03d9b220ecb6b948354f3e588d.1533608042.git-series.marmarek@invisiblethingslab.com>
References: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+atq=kw=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1fmrbz-0000su-WE
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 02:20:40 +0000
In-Reply-To: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
References: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBhbGxvd3MgdXNpbmcgYXJndW1lbnRzIHdpdGggc3BhY2VzLCBsaWtlIC1hcHBlbmQuClN0
dWJkb21haW4gc2lkZSBvZiB0aGlzIHJlcXVpcmUgInhlbnN0b3JlLWNsaWVudDogQWRkIG9wdGlv
biBmb3IgcmF3CmluLS9vdXRwdXQiIGNvbW1pdC4KClNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6
eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KUmV2aWV3
ZWQtYnk6IEphc29uIEFuZHJ5dWsgPGphbmRyeXVrQGdtYWlsLmNvbT4KLS0tCiB0b29scy9saWJ4
bC9saWJ4bF9kbS5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfZG0uYyBiL3Rvb2xz
L2xpYnhsL2xpYnhsX2RtLmMKaW5kZXggMzMwZDU1Mi4uNmVlYTM3NyAxMDA2NDQKLS0tIGEvdG9v
bHMvbGlieGwvbGlieGxfZG0uYworKysgYi90b29scy9saWJ4bC9saWJ4bF9kbS5jCkBAIC0xODU1
LDYgKzE4NTUsNyBAQCBzdGF0aWMgaW50IGxpYnhsX193cml0ZV9zdHViX2RtYXJncyhsaWJ4bF9f
Z2MgKmdjLAogICAgIGludCBpOwogICAgIGNoYXIgKnZtX3BhdGg7CiAgICAgY2hhciAqZG1hcmdz
LCAqcGF0aDsKKyAgICBjb25zdCBjaGFyIGFyZ19zZXAgPSBsaW51eF9zdHViZG9tID8gJ1x4MWIn
IDogJyAnOwogICAgIGludCBkbWFyZ3Nfc2l6ZTsKICAgICBzdHJ1Y3QgeHNfcGVybWlzc2lvbnMg
cm9wZXJtWzJdOwogICAgIHhzX3RyYW5zYWN0aW9uX3QgdDsKQEAgLTE4ODAsOCArMTg4MSw5IEBA
IHN0YXRpYyBpbnQgbGlieGxfX3dyaXRlX3N0dWJfZG1hcmdzKGxpYnhsX19nYyAqZ2MsCiAgICAg
ICAgIGlmIChsaW51eF9zdHViZG9tIHx8CiAgICAgICAgICAgICAoc3RyY21wKGFyZ3NbaV0sICIt
c2RsIikgJiYKICAgICAgICAgICAgICBzdHJjbXAoYXJnc1tpXSwgIi1NIikgJiYgc3RyY21wKGFy
Z3NbaV0sICJ4ZW5mdiIpKSkgewotICAgICAgICAgICAgc3RyY2F0KGRtYXJncywgIiAiKTsKICAg
ICAgICAgICAgIHN0cmNhdChkbWFyZ3MsIGFyZ3NbaV0pOworICAgICAgICAgICAgaWYgKGFyZ3Nb
aSArIDFdICE9IE5VTEwpCisgICAgICAgICAgICAgICAgc3RybmNhdChkbWFyZ3MsICZhcmdfc2Vw
LCAxKTsKICAgICAgICAgfQogICAgICAgICBpKys7CiAgICAgfQotLSAKZ2l0LXNlcmllcyAwLjku
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
