From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 0/6] Load ipxe from a standalone file
Date: Mon, 25 Jun 2018 12:35:27 +0100
Message-ID: <20180625113533.12746-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=w+qx=jl=citrix.com=prvs=7078eb122=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fXPmU-0006yP-8A
 for xen-devel@lists.xenproject.org; Mon, 25 Jun 2018 11:35:38 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Jan Beulich <jbeulich@suse.com>, Anoob Soman <anoob.soman@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

QWRkcmVzc2VkIHNvbWUgY29tbWVudHMgaW4gdGhpcyBuZXcgdmVyc2lvbi4KCkNjOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+
CkNjOiBBbm9vYiBTb21hbiA8YW5vb2Iuc29tYW5AY2l0cml4LmNvbT4KQ2M6IERvdWcgR29sZHN0
ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4KCldlaSBMaXUgKDYpOgogIFRvb2xzLm1rLmluOiBkcm9w
IHVudXNlZCB2YXJpYWJsZXMKICBpcHhlOiBwcm9kdWNlIGEgc2luZ2xlIGJpbmFyeSBmcm9tIGl0
cyBidWlsZAogIGxpYnhjOiBhbGxvdyBIVk0gZ3Vlc3QgdG8gaGF2ZSBtb2R1bGVzCiAgdG9vbHM6
IGxvYWQgSVBYRSBmcm9tIHN0YW5kYWxvbmUgZmlsZQogIHRvb2xzOiBwcm92aWRlIC0td2l0aC1z
eXN0ZW0taXB4ZQogIHRvb2xzOiAtLXdpdGgtc3lzdGVtLXtvdm1mLHNlYWJpb3MsaXB4ZX0gc2hv
dWxkIHByb3ZpZGUgYWJzb2x1dGUgcGF0aHMKCiBjb25maWcvVG9vbHMubWsuaW4gICAgICAgICAg
ICAgICAgICAgfCAgMyArLQogdG9vbHMvY29uZmlnLmguaW4gICAgICAgICAgICAgICAgICAgIHwg
IDMgKysKIHRvb2xzL2NvbmZpZ3VyZSAgICAgICAgICAgICAgICAgICAgICB8IDU2ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwogdG9vbHMvY29uZmlndXJlLmFjICAgICAgICAg
ICAgICAgICAgIHwgMjEgKysrKysrKysrKysrKysKIHRvb2xzL2Zpcm13YXJlL01ha2VmaWxlICAg
ICAgICAgICAgICB8ICA2ICsrKysKIHRvb2xzL2Zpcm13YXJlL2V0aGVyYm9vdC9NYWtlZmlsZSAg
ICB8ICA3ICsrKystCiB0b29scy9maXJtd2FyZS9odm1sb2FkZXIvTWFrZWZpbGUgICAgfCAgOSAr
LS0tLS0KIHRvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci9jb25maWcuaCAgICB8ICAzICstCiB0b29s
cy9maXJtd2FyZS9odm1sb2FkZXIvaHZtbG9hZGVyLmMgfCAxMCArKysrKy0tCiB0b29scy9maXJt
d2FyZS9odm1sb2FkZXIvb3ZtZi5jICAgICAgfCAgMyArLQogdG9vbHMvZmlybXdhcmUvaHZtbG9h
ZGVyL3JvbWJpb3MuYyAgIHwgMjQgKysrKysrKysrKystLS0tLQogdG9vbHMvZmlybXdhcmUvaHZt
bG9hZGVyL3NlYWJpb3MuYyAgIHwgIDMgKy0KIHRvb2xzL2xpYnhjL3hjX2RvbV94ODYuYyAgICAg
ICAgICAgICB8IDMyICsrKysrKysrKysrKy0tLS0tLS0tLQogdG9vbHMvbGlieGwvbGlieGxfZG9t
LmMgICAgICAgICAgICAgIHwgMTAgKysrKysrKwogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwu
aCAgICAgICAgIHwgIDEgKwogdG9vbHMvbGlieGwvbGlieGxfcGF0aHMuYyAgICAgICAgICAgIHwg
IDkgKysrKysrCiAxNiBmaWxlcyBjaGFuZ2VkLCAxNjMgaW5zZXJ0aW9ucygrKSwgMzcgZGVsZXRp
b25zKC0pCgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
