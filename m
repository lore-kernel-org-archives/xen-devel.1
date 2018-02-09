From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/7] Port WARN_ON_ONCE() from Linux
Date: Fri, 9 Feb 2018 10:29:47 +0000
Message-ID: <20180209102947.6dwuchlgkibx4okr@MacBook-Pro-de-Roger.local>
References: <20180209031055.21926-1-sameer.goel@linaro.org>
 <20180209031055.21926-2-sameer.goel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=qs32=fd=citrix.com=prvs=5717decf0=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ek5wM-0001pH-11
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2018 10:29:58 +0000
Content-Disposition: inline
In-Reply-To: <20180209031055.21926-2-sameer.goel@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sameer Goel <sameer.goel@linaro.org>
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, mjaggi@caviumnetworks.com, george.dunlap@eu.citrix.com, Andrew.Cooper3@citrix.com, julien.grall@arm.com, jbeulich@suse.com, Ian.Jackson@citrix.com, xen-devel@lists.xenproject.org, nd@arm.com, shankerd@codeaurora.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMDgsIDIwMTggYXQgMDg6MTA6NDlQTSAtMDcwMCwgU2FtZWVyIEdvZWwgd3Jv
dGU6Cj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9saWIuaCBiL3hlbi9pbmNsdWRlL3hl
bi9saWIuaAo+IGluZGV4IDFkOTc3MTM0MGMuLjY5NzIxMmEwNjEgMTAwNjQ0Cj4gLS0tIGEveGVu
L2luY2x1ZGUveGVuL2xpYi5oCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2xpYi5oCj4gQEAgLTEx
LDYgKzExLDE5IEBACj4gICNkZWZpbmUgQlVHX09OKHApICBkbyB7IGlmICh1bmxpa2VseShwKSkg
QlVHKCk7ICB9IHdoaWxlICgwKQo+ICAjZGVmaW5lIFdBUk5fT04ocCkgZG8geyBpZiAodW5saWtl
bHkocCkpIFdBUk4oKTsgfSB3aGlsZSAoMCkKPiAgCj4gKyNkZWZpbmUgV0FSTl9PTl9PTkNFKHAp
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyh7ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICBzdGF0aWMgYm9vbCBfX3NlY3Rp
b24oIi5kYXRhLnVubGlrZWx5IikgX193YXJuZWQ7IFwKPiArICAgIGludCBfX3JldF93YXJuX29u
Y2UgPSAhIShwKTsgICAgICAgICAgICAgICAgICAgIFwKICAgICAgIF4gYm9vbAoKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgIGlm
ICggdW5saWtlbHkoX19yZXRfd2Fybl9vbmNlICYmICFfX3dhcm5lZCkgKSAgICAgXAo+ICsgICAg
eyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAg
ICAgIF9fd2FybmVkID0gdHJ1ZTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAg
ICAgIFdBUk4oKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAg
fSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAg
dW5saWtlbHkoX19yZXRfd2Fybl9vbmNlKTsgICAgICAgICAgICAgICAgICAgICAgXAoKRG9lcyB0
aGlzIG1hY3JvIHJlYWxseSBuZWVkIHRvIHJldHVybiBzb21ldGhpbmc/IEl0IHNlZW1zIHdlaXJk
IHRvIG1lCnRvIGFsbG93IHVzYWdlcyBsaWtlOiBpZiAoIFdBUk5fT05fT05DRS4uLgoKTml0OiBj
b3VsZCB5b3UgcGxlYXNlIGFsaWduIHRoZSAnXCc/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
