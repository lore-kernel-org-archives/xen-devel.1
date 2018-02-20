From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v5 5/5] build/clang: add a check whether the
	assembler supports .skip with labels
Date: Tue, 20 Feb 2018 14:10:15 +0000
Message-ID: <20180220141015.30714-6-roger.pau@citrix.com>
References: <20180220141015.30714-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=6c15=fo=citrix.com=prvs=582a52a2f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eo8d9-0006Ke-4T
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2018 14:10:51 +0000
In-Reply-To: <20180220141015.30714-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T3IgZWxzZSBkaXNhYmxlIHRoZSBpbnRlZ3JhdGVkIGFzc2VtYmxlciBmb3IgYXNzZW1ibHkgZmls
ZXMuIFRoaXMgaXMKcmVsZXZhbnQgZm9yIG9sZGVyIGNsYW5nIHZlcnNpb25zIHdoaWNoIGludGVn
cmF0ZWQgYXNzZW1ibGVyIGRvbid0CnN1cHBvcnQgLnNraXAgd2l0aCBsYWJlbHMuCgpTaWduZWQt
b2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNjOiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogR2VvcmdlIER1bmxh
cCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNj
OiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNjOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBUaW0gRGVlZ2FuIDx0
aW1AeGVuLm9yZz4KQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL1J1
bGVzLm1rIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9SdWxlcy5tayBiL3hlbi9SdWxlcy5tawppbmRleCA3
YWRmNzU3ZmI2Li45MjEwMmUzNmQ5IDEwMDY0NAotLS0gYS94ZW4vUnVsZXMubWsKKysrIGIveGVu
L1J1bGVzLm1rCkBAIC03Miw3ICs3MiwxMCBAQCBBRkxBR1MteSAgICAgICAgICAgICAgICArPSAt
RF9fQVNTRU1CTFlfXwogCiAjIE9sZGVyIGNsYW5nJ3MgYnVpbHQtaW4gYXNzZW1ibGVyIGRvZXNu
J3QgdW5kZXJzdGFuZCAuc2tpcCB3aXRoIGxhYmVsczoKICMgaHR0cHM6Ly9idWdzLmxsdm0ub3Jn
L3Nob3dfYnVnLmNnaT9pZD0yNzM2OQotQUZMQUdTLSQoY2xhbmcpICAgICAgICAgKz0gLW5vLWlu
dGVncmF0ZWQtYXMKK2lmZXEgKCQoY2xhbmcpLHkpCiskKGNhbGwgYXMtaW5zbi1jaGVjayxBRkxB
R1MsQ0MsIi5MMDpcbi5MMTpcbi5za2lwICguTDEgLSAuTDApIiwsIFwKKyAgICAgICAgICAgICAg
ICAgICAgIC1uby1pbnRlZ3JhdGVkLWFzKQorZW5kaWYKIAogQUxMX09CSlMgOj0gJChBTExfT0JK
Uy15KQogCi0tIAoyLjE2LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
