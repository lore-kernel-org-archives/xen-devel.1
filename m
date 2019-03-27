From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH 01/12] xen: clang: Support correctly
 cross-compile
Date: Wed, 27 Mar 2019 18:45:20 +0000
Message-ID: <20190327184531.30986-2-julien.grall@arm.com>
References: <20190327184531.30986-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h58V=R6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h9DYX-0001hU-Dj
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 18:45:45 +0000
In-Reply-To: <20190327184531.30986-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Artem_Mygaiev@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Oleksandr_Tyshchenko@epam.com, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q2xhbmcgdXNlcyAiLXRhcmdldCIgb3B0aW9uIGZvciBjcm9zcy1jb21waWxhdGlvbi4KClNpZ25l
ZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogY29uZmln
L1N0ZEdOVS5tayB8IDkgKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2NvbmZpZy9TdGRHTlUubWsgYi9jb25maWcv
U3RkR05VLm1rCmluZGV4IDAzOTI3NGVhNjEuLjQ4YzUwYjVhZDcgMTAwNjQ0Ci0tLSBhL2NvbmZp
Zy9TdGRHTlUubWsKKysrIGIvY29uZmlnL1N0ZEdOVS5tawpAQCAtMSw4ICsxLDEzIEBACiBBUyAg
ICAgICAgID0gJChDUk9TU19DT01QSUxFKWFzCiBMRCAgICAgICAgID0gJChDUk9TU19DT01QSUxF
KWxkCiBpZmVxICgkKGNsYW5nKSx5KQotQ0MgICAgICAgICA9ICQoQ1JPU1NfQ09NUElMRSljbGFu
ZwotQ1hYICAgICAgICA9ICQoQ1JPU1NfQ09NUElMRSljbGFuZysrCitpZm5lcSAoJChDUk9TU19D
T01QSUxFKSwpCitDQyAgICAgICAgID0gY2xhbmcgLXRhcmdldCAkKENST1NTX0NPTVBJTEU6LT0p
CitDWFggICAgICAgID0gY2xhbmcrKyAtdGFyZ2V0ICQoQ1JPU1NfQ09NUElMRTotPSkKK2Vsc2UK
K0NDICAgICAgICAgPSBjbGFuZworQ1hYICAgICAgICA9IGNsYW5nKysKK2VuZGlmCiBMRF9MVE8g
ICAgID0gJChDUk9TU19DT01QSUxFKWxsdm0tbGQKIGVsc2UKIENDICAgICAgICAgPSAkKENST1NT
X0NPTVBJTEUpZ2NjCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
