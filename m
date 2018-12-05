From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH v2 2/2] make domain_adjust_tot_pages()
 __must_check
Date: Wed, 05 Dec 2018 09:17:24 -0700
Message-ID: <5C07FA14020000780020336D@prv1-mh.provo.novell.com>
References: <5BF4328902000078001FE240@prv1-mh.provo.novell.com>
 <5C07F95A0200007800203354@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gUZrf-0004Qp-P4
 for xen-devel@lists.xenproject.org; Wed, 05 Dec 2018 16:17:31 +0000
In-Reply-To: <5C07F95A0200007800203354@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

RXZlbiBpZiB1bmxpa2VseSwgZG9uYXRlX3BhZ2UoKSBzaG91bGQgbm90IGlnbm9yZSB0aGUgcG9z
c2libGUgbmVlZCB0bwpvYnRhaW4gYSBkb21haW4gcmVmZXJlbmNlLiBUbyBtYWtlIHBlb3BsZSBs
b29rIG1vcmUgY2xvc2VseSB3aGVuIHRoZXkKYWRkIG5ldyB1c2VzIG9mIGRvbWFpbl9hZGp1c3Rf
dG90X3BhZ2VzKCksIGZvcmNlIGl0cyByZXR1cm4gdmFsdWUgdG8gYmUKY2hlY2tlZC4gVGhpcyBp
biB0dXJuIHJlcXVpcmVzIGEgYmVuaWduIGNoYW5nZSB0byBhc3NpZ25fcGFnZXMoKS4KClNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9hcmNo
L3g4Ni9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCkBAIC00MDA5LDcgKzQwMDksOCBAQCBp
bnQgZG9uYXRlX3BhZ2UoCiAgICAgewogICAgICAgICBpZiAoIGQtPnRvdF9wYWdlcyA+PSBkLT5t
YXhfcGFnZXMgKQogICAgICAgICAgICAgZ290byBmYWlsOwotICAgICAgICBkb21haW5fYWRqdXN0
X3RvdF9wYWdlcyhkLCAxKTsKKyAgICAgICAgaWYgKCB1bmxpa2VseShkb21haW5fYWRqdXN0X3Rv
dF9wYWdlcyhkLCAxKSA9PSAxKSApCisgICAgICAgICAgICBnZXRfa25vd25hbGl2ZV9kb21haW4o
ZCk7CiAgICAgfQogCiAgICAgcGFnZS0+Y291bnRfaW5mbyA9IFBHQ19hbGxvY2F0ZWQgfCAxOwot
LS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYworKysgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2Mu
YwpAQCAtMjI3MywxMCArMjI3Myw4IEBAIGludCBhc3NpZ25fcGFnZXMoCiAgICAgICAgICAgICBn
b3RvIG91dDsKICAgICAgICAgfQogCi0gICAgICAgIGlmICggdW5saWtlbHkoZC0+dG90X3BhZ2Vz
ID09IDApICkKKyAgICAgICAgaWYgKCB1bmxpa2VseShkb21haW5fYWRqdXN0X3RvdF9wYWdlcyhk
LCAxIDw8IG9yZGVyKSA9PSAoMSA8PCBvcmRlcikpICkKICAgICAgICAgICAgIGdldF9rbm93bmFs
aXZlX2RvbWFpbihkKTsKLQotICAgICAgICBkb21haW5fYWRqdXN0X3RvdF9wYWdlcyhkLCAxIDw8
IG9yZGVyKTsKICAgICB9CiAKICAgICBmb3IgKCBpID0gMDsgaSA8ICgxIDw8IG9yZGVyKTsgaSsr
ICkKLS0tIGEveGVuL2luY2x1ZGUveGVuL21tLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL21tLmgK
QEAgLTE5MCw3ICsxOTAsOCBAQCBpbnQgZGVzdHJveV94ZW5fbWFwcGluZ3ModW5zaWduZWQgbG9u
ZyB2CiAgKi8KIGludCBwb3B1bGF0ZV9wdF9yYW5nZSh1bnNpZ25lZCBsb25nIHZpcnQsIHVuc2ln
bmVkIGxvbmcgbnJfbWZucyk7CiAvKiBDbGFpbSBoYW5kbGluZyAqLwotdW5zaWduZWQgbG9uZyBk
b21haW5fYWRqdXN0X3RvdF9wYWdlcyhzdHJ1Y3QgZG9tYWluICpkLCBsb25nIHBhZ2VzKTsKK3Vu
c2lnbmVkIGxvbmcgX19tdXN0X2NoZWNrIGRvbWFpbl9hZGp1c3RfdG90X3BhZ2VzKHN0cnVjdCBk
b21haW4gKmQsCisgICAgbG9uZyBwYWdlcyk7CiBpbnQgZG9tYWluX3NldF9vdXRzdGFuZGluZ19w
YWdlcyhzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBsb25nIHBhZ2VzKTsKIHZvaWQgZ2V0X291
dHN0YW5kaW5nX2NsYWltcyh1aW50NjRfdCAqZnJlZV9wYWdlcywgdWludDY0X3QgKm91dHN0YW5k
aW5nX3BhZ2VzKTsKIAoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
