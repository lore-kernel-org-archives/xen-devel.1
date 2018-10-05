From: Ian Jackson <ian.jackson@citrix.com>
Subject: [PATCH 05/18] Various: Fix typo `reseting'
Date: Fri,  5 Oct 2018 18:29:04 +0100
Message-ID: <20181005172917.11963-6-ian.jackson@citrix.com>
References: <20181005172917.11963-1-ian.jackson@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lvwj=mr=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1g8Tuu-0004AF-51
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 17:29:32 +0000
In-Reply-To: <20181005172917.11963-1-ian.jackson@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Hans van Kranenburg <hans@knorrie.org>, Ian Jackson <ian.jackson@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+Ci0tLQog
dG9vbHMvbWlzYy94ZW5sb2NrcHJvZi5jIHwgMiArLQogdG9vbHMvbWlzYy94ZW5wZXJmLmMgICAg
IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvdG9vbHMvbWlzYy94ZW5sb2NrcHJvZi5jIGIvdG9vbHMvbWlzYy94ZW5s
b2NrcHJvZi5jCmluZGV4IGRmMjNjODI5MTIuLjExZjQzYTM1ZTMgMTAwNjQ0Ci0tLSBhL3Rvb2xz
L21pc2MveGVubG9ja3Byb2YuYworKysgYi90b29scy9taXNjL3hlbmxvY2twcm9mLmMKQEAgLTQ2
LDcgKzQ2LDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKICAgICB7CiAgICAg
ICAgIGlmICggeGNfbG9ja3Byb2ZfcmVzZXQoeGNfaGFuZGxlKSAhPSAwICkKICAgICAgICAgewot
ICAgICAgICAgICAgZnByaW50ZihzdGRlcnIsICJFcnJvciByZXNldGluZyBwcm9maWxlIGRhdGE6
ICVkICglcylcbiIsCisgICAgICAgICAgICBmcHJpbnRmKHN0ZGVyciwgIkVycm9yIHJlc2V0dGlu
ZyBwcm9maWxlIGRhdGE6ICVkICglcylcbiIsCiAgICAgICAgICAgICAgICAgICAgIGVycm5vLCBz
dHJlcnJvcihlcnJubykpOwogICAgICAgICAgICAgcmV0dXJuIDE7CiAgICAgICAgIH0KZGlmZiAt
LWdpdCBhL3Rvb2xzL21pc2MveGVucGVyZi5jIGIvdG9vbHMvbWlzYy94ZW5wZXJmLmMKaW5kZXgg
MDdlNTg0YTVlYi4uYTVmYmRhYTQ1ZiAxMDA2NDQKLS0tIGEvdG9vbHMvbWlzYy94ZW5wZXJmLmMK
KysrIGIvdG9vbHMvbWlzYy94ZW5wZXJmLmMKQEAgLTEyMyw3ICsxMjMsNyBAQCBpbnQgbWFpbihp
bnQgYXJnYywgY2hhciAqYXJndltdKQogICAgIHsKICAgICAgICAgaWYgKCB4Y19wZXJmY19yZXNl
dCh4Y19oYW5kbGUpICE9IDAgKQogICAgICAgICB7Ci0gICAgICAgICAgICBmcHJpbnRmKHN0ZGVy
ciwgIkVycm9yIHJlc2V0aW5nIHBlcmZvcm1hbmNlIGNvdW50ZXJzOiAlZCAoJXMpXG4iLAorICAg
ICAgICAgICAgZnByaW50ZihzdGRlcnIsICJFcnJvciByZXNldHRpbmcgcGVyZm9ybWFuY2UgY291
bnRlcnM6ICVkICglcylcbiIsCiAgICAgICAgICAgICAgICAgICAgIGVycm5vLCBzdHJlcnJvcihl
cnJubykpOwogICAgICAgICAgICAgcmV0dXJuIDE7CiAgICAgICAgIH0KLS0gCjIuMTEuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
