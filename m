From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 08/10] vpci/header: allow multiple map operations
Date: Wed, 20 Jun 2018 16:42:32 +0200
Message-ID: <20180620144234.51783-9-roger.pau@citrix.com>
References: <20180620144234.51783-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=e0j0=jg=citrix.com=prvs=702a74dfb=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fVeKS-00005x-BB
 for xen-devel@lists.xenproject.org; Wed, 20 Jun 2018 14:43:24 +0000
In-Reply-To: <20180620144234.51783-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VG8gYmUgcXVldWVkIGluIHZwY2lfdmNwdS4gVGhpcyB3aWxsIGJlIHJlcXVpcmVkIGZvciBTUi1J
T1Ygc3VwcG9ydCwKd2hpY2ggdXNlcyBhIHNpbmdsZSBjb250cm9sIHJlZ2lzdGVyIGJpdCB0byB0
b2dnbGUgbWVtb3J5IGRlY29kaW5nIGZvcgphbGwgdGhlIHZpcnR1YWwgZnVuY3Rpb25zLgoKTm8g
ZnVuY3Rpb25hbCBjaGFuZ2UgZXhwZWN0ZWQuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgpDYzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5j
aXRyaXguY29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNj
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPgpDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0Bv
cmFjbGUuY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PgpDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRy
aXguY29tPgotLS0KIHhlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMgfCAxNCArKysrKysrKysrKysr
LQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFk
ZXIuYwppbmRleCA2ODZlMDRlMzVhLi5kMjE4OGRhN2YwIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVy
cy92cGNpL2hlYWRlci5jCisrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMKQEAgLTE4NCw3
ICsxODQsMTkgQEAgc3RhdGljIHZvaWQgZGVmZXJfbWFwKHN0cnVjdCBkb21haW4gKmQsIHN0cnVj
dCBwY2lfZGV2ICpwZGV2LAogICAgICAqIHN0YXJ0ZWQgZm9yIHRoZSBzYW1lIGRldmljZSBpZiB0
aGUgZG9tYWluIGlzIG5vdCB3ZWxsLWJlaGF2ZWQuCiAgICAgICovCiAgICAgY3Vyci0+dnBjaS5w
ZGV2ID0gcGRldjsKLSAgICBjdXJyLT52cGNpLm1lbSA9IG1lbTsKKyAgICBpZiAoICFjdXJyLT52
cGNpLm1lbSApCisgICAgICAgIGN1cnItPnZwY2kubWVtID0gbWVtOworICAgIGVsc2UKKyAgICB7
CisgICAgICAgIGludCByYyA9IHJhbmdlc2V0X21lcmdlKGN1cnItPnZwY2kubWVtLCBtZW0pOwor
CisgICAgICAgIGlmICggcmMgKQorICAgICAgICAgICAgZ3ByaW50ayhYRU5MT0dfV0FSTklORywK
KyAgICAgICAgICAgICAgICAgICAgIiUwNHg6JTAyeDolMDJ4LiV1OiB1bmFibGUgdG8gJXNtYXAg
bWVtb3J5IHJlZ2lvbjogJWRcbiIsCisgICAgICAgICAgICAgICAgICAgIHBkZXYtPnNlZywgcGRl
di0+YnVzLCBQQ0lfU0xPVChwZGV2LT5kZXZmbiksCisgICAgICAgICAgICAgICAgICAgIFBDSV9G
VU5DKHBkZXYtPmRldmZuKSwgbWFwID8gIiIgOiAidW4iLCByYyk7CisgICAgICAgIHJhbmdlc2V0
X2Rlc3Ryb3kobWVtKTsKKyAgICB9CiAgICAgY3Vyci0+dnBjaS5tYXAgPSBtYXA7CiAgICAgY3Vy
ci0+dnBjaS5yb21fb25seSA9IHJvbV9vbmx5OwogfQotLSAKMi4xNy4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
