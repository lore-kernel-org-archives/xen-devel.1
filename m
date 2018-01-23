From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [RFC v4 2/8] xen/bitops: Rename LOG_2 to ilog2
Date: Tue, 23 Jan 2018 11:44:30 +0000
Message-ID: <7038aee6-5ccf-c026-3e4e-c5af67679907@linaro.org>
References: <20171219031703.23420-1-sameer.goel@linaro.org>
 <20171219031703.23420-3-sameer.goel@linaro.org>
 <20180123113952.dh6khwrkwg5zcupe@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=jwx3=es=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1edx0F-0004ur-2A
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 11:44:35 +0000
Received: by mail-wm0-x22e.google.com with SMTP id x4so21643229wmc.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2018 03:44:32 -0800 (PST)
In-Reply-To: <20180123113952.dh6khwrkwg5zcupe@MacBook-Pro-de-Roger.local>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Sameer Goel <sameer.goel@linaro.org>
Cc: sstabellini@kernel.org, mjaggi@caviumnetworks.com, Andrew.Cooper3@citrix.com, andre.przywara@linaro.org, julien.grall@arm.com, jbeulich@suse.com, xen-devel@lists.xenproject.org, shankerd@codeaurora.org
List-Id: xen-devel@lists.xenproject.org

SGkgUm9nZXIsCgpPbiAyMy8wMS8xOCAxMTozOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBP
biBNb24sIERlYyAxOCwgMjAxNyBhdCAwODoxNjo1N1BNIC0wNzAwLCBTYW1lZXIgR29lbCB3cm90
ZToKPj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9iaXRvcHMuaCBiL3hlbi9pbmNsdWRl
L3hlbi9iaXRvcHMuaAo+PiBpbmRleCBlMjAxOWIwMmEzLi5hMTAzZTQ5MDg5IDEwMDY0NAo+PiAt
LS0gYS94ZW4vaW5jbHVkZS94ZW4vYml0b3BzLmgKPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2Jp
dG9wcy5oCj4+IEBAIC0yMjMsNyArMjIzLDcgQEAgc3RhdGljIGlubGluZSBfX3UzMiByb3IzMihf
X3UzMiB3b3JkLCB1bnNpZ25lZCBpbnQgc2hpZnQpCj4+ICAgI2RlZmluZSBfX0w0KF94KSAgKCgo
X3gpICYgMHgwMDAwMDAwYykgPyAoIDIgKyBfX0wyKCAoX3gpPj4gMikpIDogX19MMiggX3gpKQo+
PiAgICNkZWZpbmUgX19MOChfeCkgICgoKF94KSAmIDB4MDAwMDAwZjApID8gKCA0ICsgX19MNCgg
KF94KT4+IDQpKSA6IF9fTDQoIF94KSkKPj4gICAjZGVmaW5lIF9fTDE2KF94KSAoKChfeCkgJiAw
eDAwMDBmZjAwKSA/ICggOCArIF9fTDgoIChfeCk+PiA4KSkgOiBfX0w4KCBfeCkpCj4+IC0jZGVm
aW5lIExPR18yKF94KSAoKChfeCkgJiAweGZmZmYwMDAwKSA/ICgxNiArIF9fTDE2KChfeCk+PjE2
KSkgOiBfX0wxNihfeCkpCj4+ICsjZGVmaW5lIGlsb2cyKF94KSAoKChfeCkgJiAweGZmZmYwMDAw
KSA/ICgxNiArIF9fTDE2KChfeCk+PjE2KSkgOiBfX0wxNihfeCkpCj4gCj4gRXIsIHdoeSBub3Qg
YWRkIGE6Cj4gCj4gI2RlZmluZSBpbG9nMiBMT0dfMgo+IAo+IE9uIHRoZSBjb2RlIHRoYXQgeW91
IGhhdmUgdG8gaW1wb3J0PwoKVGhlcmUgaXMgZXhhY3RseSBvbiBjYWxsZXIgb2YgTE9HXzIuIFNv
IHdoYXQgaXMgdGhlIGJlbmVmaXRzIHRvIHByb3ZpZGUgCjIgbmFtZXM/IE1vcmUgdGhhdCBJIHdv
dWxkIGV4cGVjdCBpbG9nMiB0byBiZSB1c2VkIGluIGFueSBjb2RlIGNvbWluZyAKZnJvbSBMaW51
eC4KCkNoZWVycywKCj4gCj4gUm9nZXIuCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbAo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
