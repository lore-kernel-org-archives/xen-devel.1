From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [RFC v4 2/8] xen/bitops: Rename LOG_2 to ilog2
Date: Tue, 23 Jan 2018 12:10:52 +0000
Message-ID: <20180123121052.pnfoypksdbjds3hf@MacBook-Pro-de-Roger.local>
References: <20171219031703.23420-1-sameer.goel@linaro.org>
 <20171219031703.23420-3-sameer.goel@linaro.org>
 <20180123113952.dh6khwrkwg5zcupe@MacBook-Pro-de-Roger.local>
 <7038aee6-5ccf-c026-3e4e-c5af67679907@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=mf4d=es=citrix.com=prvs=55426a86e=roger.pau@srs-us1.protection.inumbo.net>)
 id 1edxPw-0007ZT-6I
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 12:11:08 +0000
Content-Disposition: inline
In-Reply-To: <7038aee6-5ccf-c026-3e4e-c5af67679907@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@linaro.org>
Cc: sstabellini@kernel.org, mjaggi@caviumnetworks.com, Andrew.Cooper3@citrix.com, andre.przywara@linaro.org, julien.grall@arm.com, jbeulich@suse.com, Sameer Goel <sameer.goel@linaro.org>, xen-devel@lists.xenproject.org, shankerd@codeaurora.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMjMsIDIwMTggYXQgMTE6NDQ6MzBBTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIFJvZ2VyLAo+IAo+IE9uIDIzLzAxLzE4IDExOjM5LCBSb2dlciBQYXUgTW9ubsOp
IHdyb3RlOgo+ID4gT24gTW9uLCBEZWMgMTgsIDIwMTcgYXQgMDg6MTY6NTdQTSAtMDcwMCwgU2Ft
ZWVyIEdvZWwgd3JvdGU6Cj4gPiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vYml0b3Bz
LmggYi94ZW4vaW5jbHVkZS94ZW4vYml0b3BzLmgKPiA+ID4gaW5kZXggZTIwMTliMDJhMy4uYTEw
M2U0OTA4OSAxMDA2NDQKPiA+ID4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2JpdG9wcy5oCj4gPiA+
ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9iaXRvcHMuaAo+ID4gPiBAQCAtMjIzLDcgKzIyMyw3IEBA
IHN0YXRpYyBpbmxpbmUgX191MzIgcm9yMzIoX191MzIgd29yZCwgdW5zaWduZWQgaW50IHNoaWZ0
KQo+ID4gPiAgICNkZWZpbmUgX19MNChfeCkgICgoKF94KSAmIDB4MDAwMDAwMGMpID8gKCAyICsg
X19MMiggKF94KT4+IDIpKSA6IF9fTDIoIF94KSkKPiA+ID4gICAjZGVmaW5lIF9fTDgoX3gpICAo
KChfeCkgJiAweDAwMDAwMGYwKSA/ICggNCArIF9fTDQoIChfeCk+PiA0KSkgOiBfX0w0KCBfeCkp
Cj4gPiA+ICAgI2RlZmluZSBfX0wxNihfeCkgKCgoX3gpICYgMHgwMDAwZmYwMCkgPyAoIDggKyBf
X0w4KCAoX3gpPj4gOCkpIDogX19MOCggX3gpKQo+ID4gPiAtI2RlZmluZSBMT0dfMihfeCkgKCgo
X3gpICYgMHhmZmZmMDAwMCkgPyAoMTYgKyBfX0wxNigoX3gpPj4xNikpIDogX19MMTYoX3gpKQo+
ID4gPiArI2RlZmluZSBpbG9nMihfeCkgKCgoX3gpICYgMHhmZmZmMDAwMCkgPyAoMTYgKyBfX0wx
NigoX3gpPj4xNikpIDogX19MMTYoX3gpKQo+ID4gCj4gPiBFciwgd2h5IG5vdCBhZGQgYToKPiA+
IAo+ID4gI2RlZmluZSBpbG9nMiBMT0dfMgo+ID4gCj4gPiBPbiB0aGUgY29kZSB0aGF0IHlvdSBo
YXZlIHRvIGltcG9ydD8KPiAKPiBUaGVyZSBpcyBleGFjdGx5IG9uIGNhbGxlciBvZiBMT0dfMi4g
U28gd2hhdCBpcyB0aGUgYmVuZWZpdHMgdG8gcHJvdmlkZSAyCj4gbmFtZXM/IE1vcmUgdGhhdCBJ
IHdvdWxkIGV4cGVjdCBpbG9nMiB0byBiZSB1c2VkIGluIGFueSBjb2RlIGNvbWluZyBmcm9tCj4g
TGludXguCgpJIGRvbid0IHRoaW5rIHdlIHNob3VsZCBiZSByZW5hbWluZyBtYWNyb3MganVzdCBi
ZWNhdXNlIHdlIHdhbnQgdG8KaW1wb3J0IHZlcmJhdGltIGNvZGUgZnJvbSBMaW51eCBvciBhbnl3
aGVyZSBlbHNlLCBJIHdvdWxkIHJhdGhlciBhZGQgYQpsaW51eGtwaS5oIG9yIHNpbWlsYXIgaW4g
b3JkZXIgdG8gZG8gdGhlIHRyYW5zbGF0aW9uLCBidXQgdGhhdCdzIGp1c3QKbXkgb3Bpbmlvbi4K
ClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
