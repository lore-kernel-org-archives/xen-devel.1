From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH 7/7] docs/Makefile: Format SUPPORT.md into the
 toplevel
Date: Tue, 10 Apr 2018 18:22:53 +0100
Message-ID: <1523380973-15979-8-git-send-email-ian.jackson@eu.citrix.com>
References: <1523380973-15979-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=93ll=g7=citrix.com=prvs=6314176a9=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1f5wzK-0004L6-0M
 for xen-devel@lists.xenproject.org; Tue, 10 Apr 2018 17:23:22 +0000
In-Reply-To: <1523380973-15979-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQogZG9jcy9NYWtlZmlsZSB8IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kb2NzL01ha2VmaWxlIGIvZG9jcy9NYWtl
ZmlsZQppbmRleCBkODI0NjNmLi5iMzAwYmI2IDEwMDY0NAotLS0gYS9kb2NzL01ha2VmaWxlCisr
KyBiL2RvY3MvTWFrZWZpbGUKQEAgLTI4LDcgKzI4LDggQEAgRE9DX01BTjcgOj0gJChwYXRzdWJz
dCBtYW4vJS5wb2QuNyxtYW43LyUuNywkKE1BTjdTUkMteSkpIFwKIAkgICAgICAgICQocGF0c3Vi
c3QgbWFuLyUubWFya2Rvd24uNyxtYW43LyUuNywkKE1BTjdTUkMteSkpCiBET0NfTUFOOCA6PSAk
KHBhdHN1YnN0IG1hbi8lLnBvZC44LG1hbjgvJS44LCQoTUFOOFNSQy15KSkgXAogCSAgICAgICAg
JChwYXRzdWJzdCBtYW4vJS5tYXJrZG93bi44LG1hbjgvJS44LCQoTUFOOFNSQy15KSkKLURPQ19I
VE1MIDo9ICQocGF0c3Vic3QgJS5tYXJrZG93bixodG1sLyUuaHRtbCwkKE1BUktET1dOU1JDLXkp
KSBcCitET0NfSFRNTCA6PSBodG1sL1NVUFBPUlQuaHRtbCBcCisgICAgICAgICAgICAkKHBhdHN1
YnN0ICUubWFya2Rvd24saHRtbC8lLmh0bWwsJChNQVJLRE9XTlNSQy15KSkgXAogICAgICAgICAg
ICAgJChwYXRzdWJzdCAlLnBhbmRvYyxodG1sLyUuaHRtbCwkKFBBTkRPQ1NSQy15KSkgXAogICAg
ICAgICAgICAgJChwYXRzdWJzdCBtYW4vJS5tYXJrZG93bi4xLGh0bWwvbWFuLyUuMS5odG1sLCQo
TUFOMVNSQy15KSkgXAogICAgICAgICAgICAgJChwYXRzdWJzdCBtYW4vJS5tYXJrZG93bi41LGh0
bWwvbWFuLyUuNS5odG1sLCQoTUFONVNSQy15KSkgXApAQCAtMjU1LDYgKzI1Niw4IEBAICQoZXZh
bCAkKGNhbGwgR0VORVJBVEVfUEFORE9DX1JVTEUsdHh0LHBhbmRvYykpICAgIyB0eHQvJS50eHQ6
ICUucGFuZG9jCiAkKGV2YWwgJChjYWxsIEdFTkVSQVRFX1BBTkRPQ19SVUxFLGh0bWwscGFuZG9j
KSkgICMgaHRtbC8lLmh0bWw6ICUucGFuZG9jCiAkKGV2YWwgJChjYWxsIEdFTkVSQVRFX1BBTkRP
Q19SVUxFLHBkZixtYXJrZG93bikpICMgcGRmLyUucGRmOiAlLm1hcmtkb3duCiAKKyQoZXZhbCAk
KGNhbGwgR0VORVJBVEVfUEFORE9DX1JVTEVfUkFXLGh0bWwvU1VQUE9SVC5odG1sLCQoWEVOX1JP
T1QpL1NVUFBPUlQubWQpKSAjIHBkZi8lLnBkZjogJS5tYXJrZG93bgorCiBpZmVxICgsJChmaW5k
c3RyaW5nIGNsZWFuLCQoTUFLRUNNREdPQUxTKSkpCiAkKFhFTl9ST09UKS9jb25maWcvRG9jcy5t
azoKIAkkKGVycm9yIFlvdSBoYXZlIHRvIHJ1biAuL2NvbmZpZ3VyZSBiZWZvcmUgYnVpbGRpbmcg
ZG9jcykKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
