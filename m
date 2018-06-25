From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] compat-ioctl/Xen: support at least some IOCTLs
 of evtchn and privcmd
Date: Mon, 25 Jun 2018 04:41:38 -0600
Message-ID: <5B30C6E202000078001CD724__19510.5679137216$1529923232$gmane$org@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wbrz=jl=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fXOwK-0002uL-FX
 for xen-devel@lists.xenproject.org; Mon, 25 Jun 2018 10:41:44 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: akpm@linux-foundation.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

V2hpbGUgdGhpcyBpcyBvbmx5IGEgc3RhcnQgKElPQ1RMX1BSSVZDTURfTU1BUCogYW5kIElPQ1RM
X1BSSVZDTURfRE1fT1AKcmVxdWlyZSBtb3JlIHdvcmspLCBpdCBhdCBsZWFzdCBhbGxvd3Mgc29t
ZSBzaW1wbGUgb3BlcmF0aW9ucyAobGlrZQoieGwgZG1lc2ciKSB3aGljaCBoYXZlIGFsd2F5cyBi
ZWVuIGF2YWlsYWJsZSBvbiBYZW5vTGludXggdG8gd29yayBhZ2Fpbgp3aXRoIGEgNjQtYml0IGtl
cm5lbCB1bmRlcm5lYXRoIGEgMzItYml0IGRpc3Ryby4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCiBmcy9jb21wYXRfaW9jdGwuYyB8ICAgMTcgKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCgotLS0gNC4x
OC1yYzIvZnMvY29tcGF0X2lvY3RsLmMKKysrIDQuMTgtcmMyLXhlbi1wcml2Y21kLWNvbXBhdC1p
b2N0bHMvZnMvY29tcGF0X2lvY3RsLmMKQEAgLTExNSw2ICsxMTUsMTIgQEAKICNpbmNsdWRlIDxh
c20vZmJpby5oPgogI2VuZGlmCiAKKyNpZmRlZiBDT05GSUdfWEVOCisjaW5jbHVkZSA8eGVuL2lu
dGVyZmFjZS94ZW4uaD4KKyNpbmNsdWRlIDx4ZW4vZXZ0Y2huLmg+CisjaW5jbHVkZSA8eGVuL3By
aXZjbWQuaD4KKyNlbmRpZgorCiAjZGVmaW5lIGNvbnZlcnRfaW5fdXNlcihzcmNwdHIsIGRzdHB0
cikJCQlcCiAoewkJCQkJCQlcCiAJdHlwZW9mKCpzcmNwdHIpIHZhbDsJCQkJXApAQCAtMTMwMCw2
ICsxMzA2LDE3IEBAIElHTk9SRV9JT0NUTChGQklPR0VUQ01BUDMyKQogSUdOT1JFX0lPQ1RMKEZC
SU9TQ1VSU09SMzIpCiBJR05PUkVfSU9DVEwoRkJJT0dDVVJTT1IzMikKICNlbmRpZgorCisjaWZk
ZWYgQ09ORklHX1hFTgorQ09NUEFUSUJMRV9JT0NUTChJT0NUTF9QUklWQ01EX0hZUEVSQ0FMTCkK
K0NPTVBBVElCTEVfSU9DVEwoSU9DVExfUFJJVkNNRF9SRVNUUklDVCkKK0NPTVBBVElCTEVfSU9D
VEwoSU9DVExfRVZUQ0hOX0JJTkRfVklSUSkKK0NPTVBBVElCTEVfSU9DVEwoSU9DVExfRVZUQ0hO
X0JJTkRfSU5URVJET01BSU4pCitDT01QQVRJQkxFX0lPQ1RMKElPQ1RMX0VWVENITl9CSU5EX1VO
Qk9VTkRfUE9SVCkKK0NPTVBBVElCTEVfSU9DVEwoSU9DVExfRVZUQ0hOX1VOQklORCkKK0NPTVBB
VElCTEVfSU9DVEwoSU9DVExfRVZUQ0hOX05PVElGWSkKK0NPTVBBVElCTEVfSU9DVEwoSU9DVExf
RVZUQ0hOX1JFU0VUKQorI2VuZGlmCiB9OwogCiAvKgoKCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
