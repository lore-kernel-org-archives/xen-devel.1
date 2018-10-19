From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v2 4/7] vpci: fix updating the command register
Date: Fri, 19 Oct 2018 16:20:18 +0100
Message-ID: <20181019152021.64607-5-roger.pau@citrix.com>
References: <20181019152021.64607-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=g1uh=m7=citrix.com=prvs=8231605b5=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gDWZw-0001Os-28
 for xen-devel@lists.xenproject.org; Fri, 19 Oct 2018 15:20:44 +0000
In-Reply-To: <20181019152021.64607-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2hlbiBzd2l0Y2hpbmcgdGhlIG1lbW9yeSBkZWNvZGluZyBiaXQgaW4gdGhlIGNvbW1hbmQgcmVn
aXN0ZXIgdGhlCnJlc3Qgb2YgdGhlIGNoYW5nZXMgd2hlcmUgZHJvcHBlZCwgbGVhZGluZyB0byBv
bmx5IHRoZSBtZW1vcnkgZGVjb2RpbmcKYml0IGJlaW5nIHVwZGF0ZWQuCgpGaXggdGhpcyBieSB1
bmNvbmRpdGlvbmFsbHkgd3JpdGluZyB0aGUgZ3Vlc3QtcmVxdWVzdGVkIGNvbW1hbmQgZXhjZXB0
CmZvciB0aGUgbWVtb3J5IGRlY29kaW5nIGJpdCwgd2hpY2ggd2lsbCBiZSB1cGRhdGVkIG9uY2Ug
dGhlIHAybQpjaGFuZ2VzIGFyZSBwZXJmb3JtZWQuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBl
dS5jaXRyaXguY29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+
CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBKdWxpZW4gR3JhbGwgPGp1
bGllbi5ncmFsbEBhcm0uY29tPgpDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2ls
a0BvcmFjbGUuY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPgpDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNjOiBXZWkgTGl1IDx3ZWkubGl1MkBj
aXRyaXguY29tPgotLS0KIHhlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMgfCA2ICsrKystLQogMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYwpp
bmRleCAwZWM0YzA4MmE2Li45MjM0ZGU5YjI2IDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy92cGNp
L2hlYWRlci5jCisrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMKQEAgLTMzMyw4ICszMzMs
MTAgQEAgc3RhdGljIHZvaWQgY21kX3dyaXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1
bnNpZ25lZCBpbnQgcmVnLAogICAgICAgICAgKiBob3BpbmcgdGhlIGd1ZXN0IHdpbGwgcmVhbGl6
ZSBhbmQgdHJ5IGFnYWluLgogICAgICAgICAgKi8KICAgICAgICAgbW9kaWZ5X2JhcnMocGRldiwg
Y21kICYgUENJX0NPTU1BTkRfTUVNT1JZLCBmYWxzZSk7Ci0gICAgZWxzZQotICAgICAgICBwY2lf
Y29uZl93cml0ZTE2KHBkZXYtPnNlZywgcGRldi0+YnVzLCBzbG90LCBmdW5jLCByZWcsIGNtZCk7
CisKKyAgICAvKiBXcml0ZSB0aGUgbmV3IGNvbW1hbmQgd2l0aG91dCB1cGRhdGluZyB0aGUgbWVt
b3J5IGRlY29kaW5nIGJpdC4gKi8KKyAgICBjbWQgPSAoY21kICYgflBDSV9DT01NQU5EX01FTU9S
WSkgfCAoY3VycmVudF9jbWQgJiBQQ0lfQ09NTUFORF9NRU1PUlkpOworICAgIHBjaV9jb25mX3dy
aXRlMTYocGRldi0+c2VnLCBwZGV2LT5idXMsIHNsb3QsIGZ1bmMsIHJlZywgY21kKTsKIH0KIAog
c3RhdGljIHZvaWQgYmFyX3dyaXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25l
ZCBpbnQgcmVnLAotLSAKMi4xOS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
