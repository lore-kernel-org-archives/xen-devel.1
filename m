From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 1/3] ts-depriv-audit-qemu: Create
 complete /run/user in appropriate root
Date: Mon, 19 Nov 2018 16:27:39 +0000
Message-ID: <20181119162741.17663-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2CAT=N6=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1gOmOr-0005o7-Gj
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 16:27:49 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

KiBVc2UgbWtkaXIgLXAsIHJhdGhlciB0aGFuIHRyeWluZyB0byBvbmx5IGNyZWF0ZSAvcnVuL3Vz
ZXIvJHVpZC4KICBUaGF0IGhlbHBzIGlmIC9ydW4gYW5kL29yIC9ydW4vdXNlciBkbyBub3QgZXhp
c3QsIGFzIHRoZXkgZG8gaW4KICBsaWJ4bC1tYWRlIGNocm9vdHMgd2l0aCByZWNlbnQgbGlieGwg
KHdoaWNoIGdldHMgcWVtdSB0byBjaHJvb3QpLgoKKiBEbyBhbGwgb2YgdGhpcyBpbiB0aGUgcm9v
dCBkaXJlY3Rvcnkgb2YgdGhlIHFlbXUgcHJvY2Vzcywgbm90IG91cgogIG93biByb290IGRpcmVj
dG9yeS4gIFNvIGl0IHdvcmtzIGlmIHFlbXUgaXMgY2hyb290ZWQuCgpDQzogR2VvcmdlIER1bmxh
cCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8
aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0cy1kZXByaXYtYXVkaXQtcWVtdSB8IDcg
KysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS90cy1kZXByaXYtYXVkaXQtcWVtdSBiL3RzLWRlcHJpdi1hdWRpdC1xZW11
CmluZGV4IDVkMDkzNTAuLjRlMDdkNzYgMTAwNzU1Ci0tLSBhL3RzLWRlcHJpdi1hdWRpdC1xZW11
CisrKyBiL3RzLWRlcHJpdi1hdWRpdC1xZW11CkBAIC00OCw5ICs0OCwxMCBAQCBFTkQKICAgICAg
ICAgcXBpZD0kKHhlbnN0b3JlLXJlYWQgL2xvY2FsL2RvbWFpbi8kZG9taWQvaW1hZ2UvZGV2aWNl
LW1vZGVsLXBpZCkKICAgICAgICAgdWlkPSQoaWQgLXUgeGVuLXFlbXV1c2VyLXJhbmdlLWJhc2Up
CiAgICAgICAgIHVpZD0kKCggJHVpZCArICRkb21pZCApKQotICAgICAgICB0ZXN0IC1kIC9ydW4v
dXNlciB8fCBta2RpciAtbSAyNzU1IC9ydW4vdXNlcgotICAgICAgICBpZiBta2RpciAtbSAyNzAw
IC9ydW4vdXNlci8kdWlkOyB0aGVuCi0gICAgICAgICAgICBjaG93biAkdWlkOnJvb3QgL3J1bi91
c2VyLyR1aWQKKyAgICAgICAgcXJvb3Q9JChyZWFkbGluayAvcHJvYy84MTIzL3Jvb3QpCisgICAg
ICAgIG1rZGlyIC1wbSAyNzU1ICRxcm9vdC9ydW4vdXNlcgorICAgICAgICBpZiBta2RpciAtbSAy
NzAwICRxcm9vdC9ydW4vdXNlci8kdWlkOyB0aGVuCisgICAgICAgICAgICBjaG93biAkdWlkOnJv
b3QgJHFyb290L3J1bi91c2VyLyR1aWQKICAgICAgICAgZmkKICAgICAgICAgb3NzdGVzdC1kZXBy
aXYtZmQtY29sbGVjdG9yICRxcGlkIFwKICAgICAgICAgL3Vzci9sb2NhbC9saWIveGVuL2Jpbi9k
ZXByaXYtZmQtY2hlY2tlcgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
