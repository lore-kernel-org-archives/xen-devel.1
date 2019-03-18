From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH 0/2] Follow-up viridian fixes
Date: Mon, 18 Mar 2019 09:06:58 +0000
Message-ID: <20190318090700.1538-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0sDq=RV=citrix.com=prvs=973115de2=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1h5oEg-0000Sf-7h
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2019 09:07:10 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RnVydGhlciB0ZXN0aW5nIGFuZCBjb2RlIGluc3BlY3Rpb24gcmV2ZWFsZWQgc29tZSBwcm9ibGVt
cyB3aXRoIG15IHJlY2VudApzZXJpZXMgWzFdLiBUaGlzIHNlcmllcyBmaXhlcyB0aG9zZSBpc3N1
ZXMuCgpbMV0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1k
ZXZlbC8yMDE5LTAzL21zZzAxMDc4Lmh0bWwKClBhdWwgRHVycmFudCAoMik6CiAgdmlyaWRpYW46
IHJlbW92ZSBzeW5pYyBwb2xsIGJsb2NraW5nCiAgdmlyaWRpYW46IGZpeCBtaXN0YWtlcyBpbiB0
aW1lciBleHBpcmF0aW9uIGFuZCByZS1zdGFydAoKIHhlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4v
c3luaWMuYyAgfCAxNCArLS0tLS0tLS0tLS0tLQogeGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi90
aW1lLmMgICB8IDEyICsrKysrKystLS0tLQogeGVuL2FyY2gveDg2L2h2bS92bGFwaWMuYyAgICAg
ICAgICB8IDEzICsrKystLS0tLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZpcmlkaWFu
LmggfCAgMyArLS0KIDQgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMjkgZGVsZXRp
b25zKC0pCgotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
