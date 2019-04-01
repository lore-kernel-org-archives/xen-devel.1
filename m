From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 3/4] pygrub: decode string in Python 3
Date: Mon, 1 Apr 2019 11:32:37 +0100
Message-ID: <20190401103238.15649-4-wei.liu2@citrix.com>
References: <20190401103238.15649-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZqZs=SD=citrix.com=prvs=987e11b64=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hAuFL-0008JR-2N
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 10:32:55 +0000
In-Reply-To: <20190401103238.15649-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, m.a.young@durham.ac.uk
List-Id: xen-devel@lists.xenproject.org

U3RyaW5nIGlzIHVuaWNvZGUgaW4gMyBidXQgYnl0ZXMgaW4gMi4gV2UgbmVlZCB0byBjYWxsIGRl
Y29kZSBmdW5jdGlvbgp3aGVuIHVzaW5nIFB5dGhvbiAzLgoKUmVwb3J0ZWQtYnk6IE0gQSBZb3Vu
ZyA8bS5hLnlvdW5nQGR1cmhhbS5hYy51az4KU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxp
dTJAY2l0cml4LmNvbT4KLS0tCiB0b29scy9weWdydWIvc3JjL3B5Z3J1YiB8IDUgKysrKy0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS90b29scy9weWdydWIvc3JjL3B5Z3J1YiBiL3Rvb2xzL3B5Z3J1Yi9zcmMvcHlncnViCmluZGV4
IGRiZGNlMzE1YzYuLjIzMzEyZWFlNzYgMTAwNzU1Ci0tLSBhL3Rvb2xzL3B5Z3J1Yi9zcmMvcHln
cnViCisrKyBiL3Rvb2xzL3B5Z3J1Yi9zcmMvcHlncnViCkBAIC00NTcsNyArNDU3LDEwIEBAIGNs
YXNzIEdydWI6CiAgICAgICAgICMgbGltaXQgcmVhZCBzaXplIHRvIGF2b2lkIHBhdGhvbG9naWNh
bCBjYXNlcwogICAgICAgICBidWYgPSBmLnJlYWQoRlNfUkVBRF9NQVgpCiAgICAgICAgIGRlbCBm
Ci0gICAgICAgIHNlbGYuY2YucGFyc2UoYnVmKQorICAgICAgICBpZiBzeXMudmVyc2lvbl9pbmZv
WzBdIDwgMzoKKyAgICAgICAgICAgIHNlbGYuY2YucGFyc2UoYnVmKQorICAgICAgICBlbHNlOgor
ICAgICAgICAgICAgc2VsZi5jZi5wYXJzZShidWYuZGVjb2RlKCkpCiAKICAgICBkZWYgaW1hZ2Vf
aW5kZXgoc2VsZik6CiAgICAgICAgIGlmIGlzaW5zdGFuY2Uoc2VsZi5jZi5kZWZhdWx0LCBpbnQp
OgotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
