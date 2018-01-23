From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [RFC v4 2/8] xen/bitops: Rename LOG_2 to ilog2
Date: Tue, 23 Jan 2018 11:39:52 +0000
Message-ID: <20180123113952.dh6khwrkwg5zcupe@MacBook-Pro-de-Roger.local>
References: <20171219031703.23420-1-sameer.goel@linaro.org>
 <20171219031703.23420-3-sameer.goel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=mf4d=es=citrix.com=prvs=55426a86e=roger.pau@srs-us1.protection.inumbo.net>)
 id 1edwvq-0004As-OP
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 11:40:02 +0000
Content-Disposition: inline
In-Reply-To: <20171219031703.23420-3-sameer.goel@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sameer Goel <sameer.goel@linaro.org>
Cc: sstabellini@kernel.org, mjaggi@caviumnetworks.com, Andrew.Cooper3@citrix.com, andre.przywara@linaro.org, julien.grall@arm.com, jbeulich@suse.com, xen-devel@lists.xenproject.org, shankerd@codeaurora.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBEZWMgMTgsIDIwMTcgYXQgMDg6MTY6NTdQTSAtMDcwMCwgU2FtZWVyIEdvZWwgd3Jv
dGU6Cj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9iaXRvcHMuaCBiL3hlbi9pbmNsdWRl
L3hlbi9iaXRvcHMuaAo+IGluZGV4IGUyMDE5YjAyYTMuLmExMDNlNDkwODkgMTAwNjQ0Cj4gLS0t
IGEveGVuL2luY2x1ZGUveGVuL2JpdG9wcy5oCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2JpdG9w
cy5oCj4gQEAgLTIyMyw3ICsyMjMsNyBAQCBzdGF0aWMgaW5saW5lIF9fdTMyIHJvcjMyKF9fdTMy
IHdvcmQsIHVuc2lnbmVkIGludCBzaGlmdCkKPiAgI2RlZmluZSBfX0w0KF94KSAgKCgoX3gpICYg
MHgwMDAwMDAwYykgPyAoIDIgKyBfX0wyKCAoX3gpPj4gMikpIDogX19MMiggX3gpKQo+ICAjZGVm
aW5lIF9fTDgoX3gpICAoKChfeCkgJiAweDAwMDAwMGYwKSA/ICggNCArIF9fTDQoIChfeCk+PiA0
KSkgOiBfX0w0KCBfeCkpCj4gICNkZWZpbmUgX19MMTYoX3gpICgoKF94KSAmIDB4MDAwMGZmMDAp
ID8gKCA4ICsgX19MOCggKF94KT4+IDgpKSA6IF9fTDgoIF94KSkKPiAtI2RlZmluZSBMT0dfMihf
eCkgKCgoX3gpICYgMHhmZmZmMDAwMCkgPyAoMTYgKyBfX0wxNigoX3gpPj4xNikpIDogX19MMTYo
X3gpKQo+ICsjZGVmaW5lIGlsb2cyKF94KSAoKChfeCkgJiAweGZmZmYwMDAwKSA/ICgxNiArIF9f
TDE2KChfeCk+PjE2KSkgOiBfX0wxNihfeCkpCgpFciwgd2h5IG5vdCBhZGQgYToKCiNkZWZpbmUg
aWxvZzIgTE9HXzIKCk9uIHRoZSBjb2RlIHRoYXQgeW91IGhhdmUgdG8gaW1wb3J0PwoKUm9nZXIu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
