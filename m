From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 4/4] build: fix include paths in FreeBSD
Date: Mon, 2 Jul 2018 10:28:26 +0200
Message-ID: <20180702082826.90272-5-roger.pau@citrix.com>
References: <20180702082826.90272-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n1b/=js=citrix.com=prvs=714d6e1f6=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fZuCS-0005HW-TW
 for xen-devel@lists.xenproject.org; Mon, 02 Jul 2018 08:28:44 +0000
In-Reply-To: <20180702082826.90272-1-roger.pau@citrix.com>
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

RnJlZUJTRCBwYWNrYWdlIG1hbmFnZXIgdXNlcyAvdXNyL2xvY2FsLyBhcyB0aGUgZGVmYXVsdCBp
bnN0YWxsIHBhdGgsCmJ1dCB0aGF0J3Mgbm90IHBhcnQgb2YgdGhlIGNvbXBpbGVyIHNlYXJjaCBw
YXRoLCBzbyBhZGQgaXQgdXNpbmcgdGhlCkFQUEVORF97TElCL0lOQ0xVREVTfSB2YXJpYWJsZXMu
CgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
LS0tCkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogR2Vv
cmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgpDYzogSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CkNjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpDYzogS29ucmFk
IFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDYzogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogVGltIERlZWdhbiA8dGltQHhlbi5v
cmc+CkNjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIGNvbmZpZy9GcmVlQlNE
Lm1rIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvY29uZmlnL0ZyZWVCU0QubWsgYi9jb25maWcvRnJlZUJTRC5tawppbmRleCBhZmVhZWZiZGUy
Li45OGE1MTE3ZTYwIDEwMDY0NAotLS0gYS9jb25maWcvRnJlZUJTRC5taworKysgYi9jb25maWcv
RnJlZUJTRC5tawpAQCAtMywzICszLDcgQEAgaW5jbHVkZSAkKFhFTl9ST09UKS9jb25maWcvU3Rk
R05VLm1rCiAjIE5vIHdnZXQgb24gRnJlZUJTRCBiYXNlIHN5c3RlbQogV0dFVCA9IGZ0cAogUEtH
X0lOU1RBTExESVIgPSAke3ByZWZpeH0vbGliZGF0YS9wa2djb25maWcKKworIyBBZGQgdGhlIGRl
ZmF1bHQgcGtnIGluc3RhbGwgcGF0aAorQVBQRU5EX0xJQiArPSAvdXNyL2xvY2FsL2xpYgorQVBQ
RU5EX0lOQ0xVREVTICs9IC91c3IvbG9jYWwvaW5jbHVkZQotLSAKMi4xNy4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
