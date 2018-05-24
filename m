From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [v2 1/6] Port WARN_ON_ONCE() from Linux
Date: Thu, 24 May 2018 01:53:23 -0600
Message-ID: <5B066F7302000078001C56BB@prv1-mh.provo.novell.com>
References: <20180524004620.23828-1-sameer.goel@linaro.org>
 <20180524004620.23828-2-sameer.goel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=y5hq=il=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fLlNa-0003Lv-EG
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 08:13:46 +0000
In-Reply-To: <20180524004620.23828-2-sameer.goel@linaro.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Manish Jaggi <mjaggi@caviumnetworks.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, sameer.goel@linaro.org, Ian.Jackson@citrix.com, nd@arm.com, shankerd@codeaurora.org, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjA1LjE4IGF0IDAyOjQ2LCA8c2FtZWVyLmdvZWxAbGluYXJvLm9yZz4gd3JvdGU6
Cj4gUG9ydCBXQVJOX09OX09OQ0UgbWFjcm8gZnJvbSBMaW51eC4KCkluIHN1Y2ggYSBjYXNlIHlv
dSBzaG91bGQganVzdGlmeSBhZGp1c3RtZW50cyB5b3UndmUgbWFkZToKCj4gLS0tIGEveGVuL2lu
Y2x1ZGUveGVuL2xpYi5oCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2xpYi5oCj4gQEAgLTExLDYg
KzExLDE5IEBACj4gICNkZWZpbmUgQlVHX09OKHApICBkbyB7IGlmICh1bmxpa2VseShwKSkgQlVH
KCk7ICB9IHdoaWxlICgwKQo+ICAjZGVmaW5lIFdBUk5fT04ocCkgZG8geyBpZiAodW5saWtlbHko
cCkpIFdBUk4oKTsgfSB3aGlsZSAoMCkKPiAgCj4gKyNkZWZpbmUgV0FSTl9PTl9PTkNFKHApICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArKHsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgc3RhdGljIGJvb2wgX19zZWN0
aW9uKCIuZGF0YS51bmxpa2VseSIpIHdhcm5lZDsgICBcCgpMaW51eCB1c2VzIC5kYXRhLm9uY2Uu
IFRoYXQgb3IgLmRhdGEuY29sZCB3b3VsZCBzZWVtIGJldHRlciB0byBtZSB0aGFuCi5kYXRhLnVu
bGlrZWx5LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
