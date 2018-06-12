From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 10/11] TestSupport: substeps: work if
 steps in ad-hoc tests take >1s
Date: Tue, 12 Jun 2018 12:37:44 +0100
Message-ID: <1528803465-31661-11-git-send-email-ian.jackson@eu.citrix.com>
References: <1528803465-31661-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hfe/=i6=citrix.com=prvs=694d9f8cf=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fShd7-0001sR-2d
 for xen-devel@lists.xenproject.org; Tue, 12 Jun 2018 11:38:29 +0000
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

V2hlbiBydW5uaW5nIGJ5IGhhbmQsIE9TU1RFU1RfVEVTVElEIGlzIG5vdCBzZXQuICBXZSBwcm92
aWRlIGEgdmFsdWUKd2l0aCB0aGUgdGltZSBhbmQgdGhlIHBpZCBpbiBpdCwgc28gdGhhdCByZXJ1
bm5pbmcgdGhlIHNjcmlwdCBieSBoYW5kCndvcmtzLCBldmVuIHRob3VnaCBpbiBwcm9kdWN0aW9u
IHRoaXMgd291bGQgcmVzdWx0IGluIG11bHRpcGxlCmlkZW50aWNhbGx5LW5hbWVkIHN1YnN0ZXBz
LgoKQnV0IHdlIG5lZWQgdG8gZml4IHRoaXMgdmFsdWUgZm9yIHRoZSBkdXJhdGlvbiBvZiB0aGUg
c2NyaXB0LgpPdGhlcndpc2Ugd2hlbiBpdCBjYWxscyBzdWJzdGVwX2ZpbmlzaCwgaWYgdGhlIHRp
bWUgaGFzIG1vdmVkIG9uLCBpdApjb21wdXRlcyBhIGRpZmZlcmVudCBPU1NURVNUX1RFU1RJRCBh
bmQgdGhlcmVmb3JlIGEgZGlmZmVyZW50IHN1YnN0ZXAKbmFtZSwgYW5kIHRoZW4gdGhlIHN1YnN0
ZXAgbWFjaGluZXJ5IHNtZWxscyBhIHJhdCBhbmQgYm9tYnMgb3V0LgoKU2lnbmVkLW9mZi1ieTog
SWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogT3NzdGVzdC9UZXN0
U3VwcG9ydC5wbSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0gYi9Pc3N0ZXN0L1Rl
c3RTdXBwb3J0LnBtCmluZGV4IDZkZTU2NmMuLjdiYzQwZjMgMTAwNjQ0Ci0tLSBhL09zc3Rlc3Qv
VGVzdFN1cHBvcnQucG0KKysrIGIvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQpAQCAtMjQ1LDcgKzI0
NSw3IEBAIEVORAogc3ViIGNvbXBsZXRlX3Rlc3RpZCAoJCkgewogICAgIG15ICgkdGVzdGlkcikg
PSBAXzsKICAgICAkJHRlc3RpZHIgPX4gc3teKD89Lyl9ewotCSRFTlZ7T1NTVEVTVF9URVNUSUR9
IC8vIHNwcmludGYoJ1NVQlNURVAtJXMtJXMnLCB0aW1lLCAkJCkKKwkkRU5We09TU1RFU1RfVEVT
VElEfSAvLz0gc3ByaW50ZignU1VCU1RFUC0lcy0lcycsIHRpbWUsICQkKQogICAgIH1lOwogfQog
Ci0tIAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
