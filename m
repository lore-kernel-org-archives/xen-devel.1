From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 02/11] cs-adjust-flight: Allow adjusting
 play flights after start
Date: Tue, 12 Jun 2018 12:37:36 +0100
Message-ID: <1528803465-31661-3-git-send-email-ian.jackson@eu.citrix.com>
References: <1528803465-31661-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hfe/=i6=citrix.com=prvs=694d9f8cf=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fShfh-0004QQ-Cy
 for xen-devel@lists.xenproject.org; Tue, 12 Jun 2018 11:41:09 +0000
In-Reply-To: <1528803465-31661-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

U3BlY2lmaWNhbGx5LCByYXRoZXIgdGhhbiBzaW1wbHkgYm9tYmluZyBvdXQsIGlmIHRoZSBmbGln
aHQgYWxyZWFkeQpoYXMgc3RlcHMsIHdlIGNhbGwgZGJmbF9jaGVjayBhZ2FpbiB3aXRoIGFuIGVt
cHR5IGxpc3Qgb2YgT0sKYmxlc3NpbmdzLiAgZGJmbF9jaGVjayB3aWxsIHRoZW4gYm9tYiBvdXQs
IHVubGVzcyB0aGUgZmxpZ2h0J3MKYmxlc3Npbmcgb3IgaW50ZW5kZWQgYmxlc3NpbmcgaXMgYHBs
YXknLiAgSWYgaXQgZG9lc24ndCBib21iIG91dCwgd2UKcHJpbnQgYSBtZXNzYWdlLgoKU2lnbmVk
LW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogY3Mt
YWRqdXN0LWZsaWdodCB8IDYgKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvY3MtYWRqdXN0LWZsaWdodCBiL2NzLWFkanVz
dC1mbGlnaHQKaW5kZXggYWZiODFjYi4uNGYwMzZmNCAxMDA3NTUKLS0tIGEvY3MtYWRqdXN0LWZs
aWdodAorKysgYi9jcy1hZGp1c3QtZmxpZ2h0CkBAIC00NjUsNyArNDY1LDExIEBAIHN1YiBjaGFu
Z2VzICgpIHsKIAkgICAgJGRiaF90ZXN0cy0+cHJlcGFyZSgiU0VMRUNUICogRlJPTSBzdGVwcyBX
SEVSRSBmbGlnaHQgPSA/Iik7CiAJJHN0ZXBzX3EtPmV4ZWN1dGUoJGRzdGZsaWdodCk7CiAJbXkg
JHN0ZXAgPSAkc3RlcHNfcS0+ZmV0Y2hyb3dfaGFzaHJlZigpOwotCWRpZSAiJGRzdGZsaWdodCBh
bHJlYWR5IGhhcyBzdGVwc1xuIi5EdW1wZXIoJHN0ZXApIGlmICRzdGVwOworCWlmICgkc3RlcCkg
eworCSAgICB3YXJuICIkZHN0ZmxpZ2h0IGFscmVhZHkgaGFzIHN0ZXBzXG4iLkR1bXBlcigkc3Rl
cCkgaWYgJHN0ZXA7CisJICAgICRtam9iZGItPmRiZmxfY2hlY2soJGRzdGZsaWdodCxbXSk7CisJ
ICAgIHByaW50IFNUREVSUiAiY2hhbmdpbmcgZmxpZ2h0ICRkc3RmbGlnaHQgYW55d2F5XG4iOwor
CX0KICAgICB9CiAKICAgICBAY2hhbmdlcyA9IEBvcmdfY2hhbmdlczsKLS0gCjIuMS40CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
