From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 06/12] tools/debugger/kdd: Install as `xen-kdd',
 not just `kdd'
Date: Fri, 12 Oct 2018 16:12:09 +0100
Message-ID: <20181012151215.32455-7-ian.jackson@eu.citrix.com>
References: <20181012151215.32455-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pszq=my=citrix.com=prvs=81651eb4b=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gAz74-0001Cj-P2
 for xen-devel@lists.xenproject.org; Fri, 12 Oct 2018 15:12:26 +0000
In-Reply-To: <20181012151215.32455-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+Cgpga2RkJyBpcyBhbiB1
bmZvcnR1bmF0ZSBuYW1lc3BhY2UgbGFuZGdyYWIuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3Nv
biA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4KQWNrZWQtYnk6IFRpbSBEZWVnYW4gPHRpbUB4ZW4u
b3JnPgotLS0KIHRvb2xzL2RlYnVnZ2VyL2tkZC9NYWtlZmlsZSB8IDQgKystLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29s
cy9kZWJ1Z2dlci9rZGQvTWFrZWZpbGUgYi90b29scy9kZWJ1Z2dlci9rZGQvTWFrZWZpbGUKaW5k
ZXggNTUwOWVlZTY4Yy4uMjYxMTY5NDlkNCAxMDA2NDQKLS0tIGEvdG9vbHMvZGVidWdnZXIva2Rk
L01ha2VmaWxlCisrKyBiL3Rvb2xzL2RlYnVnZ2VyL2tkZC9NYWtlZmlsZQpAQCAtMjQsOCArMjQs
OCBAQCBkaXN0Y2xlYW46IGNsZWFuCiAuUEhPTlk6IGluc3RhbGwKIGluc3RhbGw6IGFsbAogCVsg
LWQgJChERVNURElSKSQoc2JpbmRpcikgXSB8fCAkKElOU1RBTExfRElSKSAkKERFU1RESVIpJChz
YmluZGlyKQotCSQoSU5TVEFMTF9QUk9HKSBrZGQgJChERVNURElSKSQoc2JpbmRpcikva2RkCisJ
JChJTlNUQUxMX1BST0cpIGtkZCAkKERFU1RESVIpJChzYmluZGlyKS94ZW4ta2RkCiAKIC5QSE9O
WTogdW5pbnN0YWxsCiB1bmluc3RhbGw6Ci0Jcm0gLWYgJChERVNURElSKSQoc2JpbmRpcikva2Rk
CisJcm0gLWYgJChERVNURElSKSQoc2JpbmRpcikveGVuLWtkZAotLSAKMi4xMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
