From: Sameer Goel <sameer.goel@linaro.org>
Subject: [RFC v4 2/8] xen/bitops: Rename LOG_2 to ilog2
Date: Mon, 18 Dec 2017 20:16:57 -0700
Message-ID: <20171219031703.23420-3-sameer.goel@linaro.org>
References: <20171219031703.23420-1-sameer.goel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ximu=dp=linaro.org=sameer.goel@srs-us1.protection.inumbo.net>)
 id 1eR8P5-0006ad-6u
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2017 03:17:15 +0000
Received: by mail-pf0-x243.google.com with SMTP id m26so10580887pfj.11
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2017 19:17:13 -0800 (PST)
In-Reply-To: <20171219031703.23420-1-sameer.goel@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, julien.grall@arm.com, mjaggi@caviumnetworks.com
Cc: sstabellini@kernel.org, Andrew.Cooper3@citrix.com, andre.przywara@linaro.org, jbeulich@suse.com, Sameer Goel <sameer.goel@linaro.org>, shankerd@codeaurora.org
List-Id: xen-devel@lists.xenproject.org

Q2hhbmdpbmcgdGhlIG5hbWUgb2YgdGhlIG1hY3JvIGZyb20gTE9HXzIgdG8gaWxvZzIuVGhpcyBt
YWtlcyB0aGUgZnVuY3Rpb24gbmFtZQpzaW1pbGFyIHRvIGl0cyBMaW51eCBjb3VudGVycGFydC4g
U2luY2UsIHRoaXMgaXMgbm90IHVzZWQgaW4gbXV0aXBsZSBwbGFjZXMsIHNvIHRoZSBjb2RlIGNo
dXJuIGlzIG1pbmltYWwuClRoaXMgY2hhbmdlIGhlbHBzIGluIHBvcnRpbmcgdW5jaGFuZ2VkIGNv
ZGUgZnJvbSBMaW51eC4KClNpZ25lZC1vZmYtYnk6IFNhbWVlciBHb2VsIDxzYW1lZXIuZ29lbEBs
aW5hcm8ub3JnPgotLS0KIHhlbi9hcmNoL3g4Ni94ODZfNjQvYXNtLW9mZnNldHMuYyB8IDIgKy0K
IHhlbi9pbmNsdWRlL3hlbi9iaXRvcHMuaCAgICAgICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni94ODZfNjQvYXNtLW9mZnNldHMuYyBiL3hlbi9hcmNoL3g4Ni94ODZfNjQvYXNtLW9mZnNl
dHMuYwppbmRleCBlMTM2YWY2Yjk5Li40YmNjYmM5YmRmIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94
ODYveDg2XzY0L2FzbS1vZmZzZXRzLmMKKysrIGIveGVuL2FyY2gveDg2L3g4Nl82NC9hc20tb2Zm
c2V0cy5jCkBAIC0xNTcsNyArMTU3LDcgQEAgdm9pZCBfX2R1bW15X18odm9pZCkKICAgICBCTEFO
SygpOwogI2VuZGlmCiAKLSAgICBERUZJTkUoSVJRU1RBVF9zaGlmdCwgTE9HXzIoc2l6ZW9mKGly
cV9jcHVzdGF0X3QpKSk7CisgICAgREVGSU5FKElSUVNUQVRfc2hpZnQsIGlsb2cyKHNpemVvZihp
cnFfY3B1c3RhdF90KSkpOwogICAgIE9GRlNFVChJUlFTVEFUX3NvZnRpcnFfcGVuZGluZywgaXJx
X2NwdXN0YXRfdCwgX19zb2Z0aXJxX3BlbmRpbmcpOwogICAgIEJMQU5LKCk7CiAKZGlmZiAtLWdp
dCBhL3hlbi9pbmNsdWRlL3hlbi9iaXRvcHMuaCBiL3hlbi9pbmNsdWRlL3hlbi9iaXRvcHMuaApp
bmRleCBlMjAxOWIwMmEzLi5hMTAzZTQ5MDg5IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4v
Yml0b3BzLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL2JpdG9wcy5oCkBAIC0yMjMsNyArMjIzLDcg
QEAgc3RhdGljIGlubGluZSBfX3UzMiByb3IzMihfX3UzMiB3b3JkLCB1bnNpZ25lZCBpbnQgc2hp
ZnQpCiAjZGVmaW5lIF9fTDQoX3gpICAoKChfeCkgJiAweDAwMDAwMDBjKSA/ICggMiArIF9fTDIo
IChfeCk+PiAyKSkgOiBfX0wyKCBfeCkpCiAjZGVmaW5lIF9fTDgoX3gpICAoKChfeCkgJiAweDAw
MDAwMGYwKSA/ICggNCArIF9fTDQoIChfeCk+PiA0KSkgOiBfX0w0KCBfeCkpCiAjZGVmaW5lIF9f
TDE2KF94KSAoKChfeCkgJiAweDAwMDBmZjAwKSA/ICggOCArIF9fTDgoIChfeCk+PiA4KSkgOiBf
X0w4KCBfeCkpCi0jZGVmaW5lIExPR18yKF94KSAoKChfeCkgJiAweGZmZmYwMDAwKSA/ICgxNiAr
IF9fTDE2KChfeCk+PjE2KSkgOiBfX0wxNihfeCkpCisjZGVmaW5lIGlsb2cyKF94KSAoKChfeCkg
JiAweGZmZmYwMDAwKSA/ICgxNiArIF9fTDE2KChfeCk+PjE2KSkgOiBfX0wxNihfeCkpCiAKIC8q
KgogICogZm9yX2VhY2hfc2V0X2JpdCAtIGl0ZXJhdGUgb3ZlciBldmVyeSBzZXQgYml0IGluIGEg
bWVtb3J5IHJlZ2lvbgotLSAKMi4xNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
