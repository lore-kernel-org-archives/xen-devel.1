From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [RFC PATCH 09/17] libxl: use \x1b to separate qemu
 arguments for linux stubdomain
Date: Tue, 31 Jul 2018 05:56:50 +0200
Message-ID: <0c64341a4be3462d62b0bb5bf96b866aa18f477a.1533009377.git-series.marmarek@invisiblethingslab.com>
References: <cover.cff0dcda374a083d3fc638b205f631586751181e.1533009377.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=01/i=kp=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1fkLn4-00031s-NK
 for xen-devel@lists.xenproject.org; Tue, 31 Jul 2018 03:57:42 +0000
In-Reply-To: <cover.cff0dcda374a083d3fc638b205f631586751181e.1533009377.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <cover.cff0dcda374a083d3fc638b205f631586751181e.1533009377.git-series.marmarek@invisiblethingslab.com>
References: <cover.cff0dcda374a083d3fc638b205f631586751181e.1533009377.git-series.marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

VGhpcyBhbGxvd3MgdXNpbmcgYXJndW1lbnRzIHdpdGggc3BhY2VzLCBsaWtlIC1hcHBlbmQuClN0
dWJkb21haW4gc2lkZSBvZiB0aGlzIHJlcXVpcmUgInhlbnN0b3JlLWNsaWVudDogQWRkIG9wdGlv
biBmb3IgcmF3CmluLS9vdXRwdXQiIGNvbW1pdC4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9kbS5j
IHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfZG0uYyBiL3Rvb2xzL2xpYnhsL2xpYnhs
X2RtLmMKaW5kZXggZjZiZDZhMS4uMTFhY2JlYSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGli
eGxfZG0uYworKysgYi90b29scy9saWJ4bC9saWJ4bF9kbS5jCkBAIC0xODQ0LDYgKzE4NDQsNyBA
QCBzdGF0aWMgaW50IGxpYnhsX193cml0ZV9zdHViX2RtYXJncyhsaWJ4bF9fZ2MgKmdjLAogICAg
IGludCBpOwogICAgIGNoYXIgKnZtX3BhdGg7CiAgICAgY2hhciAqZG1hcmdzLCAqcGF0aDsKKyAg
ICBjb25zdCBjaGFyIGFyZ19zZXAgPSBsaW51eF9zdHViZG9tID8gJ1x4MWInIDogJyAnOwogICAg
IGludCBkbWFyZ3Nfc2l6ZTsKICAgICBzdHJ1Y3QgeHNfcGVybWlzc2lvbnMgcm9wZXJtWzJdOwog
ICAgIHhzX3RyYW5zYWN0aW9uX3QgdDsKQEAgLTE4NjksOCArMTg3MCw5IEBAIHN0YXRpYyBpbnQg
bGlieGxfX3dyaXRlX3N0dWJfZG1hcmdzKGxpYnhsX19nYyAqZ2MsCiAgICAgICAgIGlmIChsaW51
eF9zdHViZG9tIHx8CiAgICAgICAgICAgICAoc3RyY21wKGFyZ3NbaV0sICItc2RsIikgJiYKICAg
ICAgICAgICAgICBzdHJjbXAoYXJnc1tpXSwgIi1NIikgJiYgc3RyY21wKGFyZ3NbaV0sICJ4ZW5m
diIpKSkgewotICAgICAgICAgICAgc3RyY2F0KGRtYXJncywgIiAiKTsKICAgICAgICAgICAgIHN0
cmNhdChkbWFyZ3MsIGFyZ3NbaV0pOworICAgICAgICAgICAgaWYgKGFyZ3NbaSArIDFdICE9IE5V
TEwpCisgICAgICAgICAgICAgICAgc3RybmNhdChkbWFyZ3MsICZhcmdfc2VwLCAxKTsKICAgICAg
ICAgfQogICAgICAgICBpKys7CiAgICAgfQotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
