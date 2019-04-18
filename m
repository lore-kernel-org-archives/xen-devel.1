From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 12/21] starvation: Permit step_finish to
 set the state `starved'
Date: Thu, 18 Apr 2019 17:31:49 +0100
Message-ID: <20190418163158.11408-13-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xJ-0001zq-FS
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:09 +0000
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQogT3NzdGVzdC9Kb2JEQi9FeGVjdXRpdmUucG0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0L0pvYkRCL0V4
ZWN1dGl2ZS5wbSBiL09zc3Rlc3QvSm9iREIvRXhlY3V0aXZlLnBtCmluZGV4IDNhNjgwYzlkLi4y
ZTExYzhmMyAxMDA2NDQKLS0tIGEvT3NzdGVzdC9Kb2JEQi9FeGVjdXRpdmUucG0KKysrIGIvT3Nz
dGVzdC9Kb2JEQi9FeGVjdXRpdmUucG0KQEAgLTI4Nyw3ICsyODcsNyBAQCBFTkQKIHN1YiBzdGVw
X2ZpbmlzaCAoJCQpIHsgI21ldGhvZAogICAgIG15ICgkamQsJHRlc3RpZCwkc3RlcHN0YXR1cykg
PSBAXzsKICAgICBkaWUgIiRmbGlnaHQuJGpvYiAkdGVzdGlkICRzdGVwc3RhdHVzIiB1bmxlc3Mg
Z3JlcCB7ICRzdGVwc3RhdHVzIGVxICRfIH0KLQlxdyhwYXNzIGZhaWwgc2tpcCBibG9ja2VkIGJy
b2tlbik7CisJcXcocGFzcyBmYWlsIHNraXAgYmxvY2tlZCBicm9rZW4gc3RhcnZlZCk7CiAgICAg
bXkgJGNoZWNrcSA9ICRkYmhfdGVzdHMtPnByZXBhcmUoPDxFTkQpOwogICAgICAgICBTRUxFQ1Qg
c3RlcG5vLCBzdGF0dXMKICAgICAgICAgICBGUk9NIHN0ZXBzCi0tIAoyLjExLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
