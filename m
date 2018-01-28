From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: [PATCH] flask: Remove reference to DOMCTL_getmemlist
Date: Sun, 28 Jan 2018 11:26:22 -0500
Message-ID: <1517156782-8831-1-git-send-email-boris.ostrovsky@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xen.org
Cc: dgdegra@tycho.nsa.gov, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Q29tbWl0IDk0NDUwZTM2YmZiYiAoInhlbjogRHJvcCBET01DVExfZ2V0bWVtbGlzdCBhbmQgeGNf
Z2V0X3Bmbl9saXN0KCkiKQptaXNzZWQgcmVmZXJlbmNlIHRvIERPTUNUTF9nZXRtZW1saXN0IGlu
IGhvb2tzLnMKClNpZ25lZC1vZmYtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5
QG9yYWNsZS5jb20+Ci0tLQogeGVuL3hzbS9mbGFzay9ob29rcy5jIHwgMyAtLS0KIDEgZmlsZSBj
aGFuZ2VkLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi94c20vZmxhc2svaG9va3Mu
YyBiL3hlbi94c20vZmxhc2svaG9va3MuYwppbmRleCAzNTMzMjU5Li4xODAyZDhkIDEwMDY0NAot
LS0gYS94ZW4veHNtL2ZsYXNrL2hvb2tzLmMKKysrIGIveGVuL3hzbS9mbGFzay9ob29rcy5jCkBA
IC02NjksOSArNjY5LDYgQEAgc3RhdGljIGludCBmbGFza19kb21jdGwoc3RydWN0IGRvbWFpbiAq
ZCwgaW50IGNtZCkKICAgICBjYXNlIFhFTl9ET01DVExfZ2V0cGFnZWZyYW1laW5mbzM6CiAgICAg
ICAgIHJldHVybiBjdXJyZW50X2hhc19wZXJtKGQsIFNFQ0NMQVNTX01NVSwgTU1VX19QQUdFSU5G
Tyk7CiAKLSAgICBjYXNlIFhFTl9ET01DVExfZ2V0bWVtbGlzdDoKLSAgICAgICAgcmV0dXJuIGN1
cnJlbnRfaGFzX3Blcm0oZCwgU0VDQ0xBU1NfTU1VLCBNTVVfX1BBR0VMSVNUKTsKLQogICAgIGNh
c2UgWEVOX0RPTUNUTF9oeXBlcmNhbGxfaW5pdDoKICAgICAgICAgcmV0dXJuIGN1cnJlbnRfaGFz
X3Blcm0oZCwgU0VDQ0xBU1NfRE9NQUlOLCBET01BSU5fX0hZUEVSQ0FMTCk7CiAKLS0gCjIuOS4z
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
