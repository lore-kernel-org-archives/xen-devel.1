From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 14/34] x86/pt: add HVM check to
 XEN_DOMCTL_unbind_pt_irq
Date: Mon, 20 Aug 2018 06:51:32 -0600
Message-ID: <5B7AB95402000078001E00C2@prv1-mh.provo.novell.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <8dbf18b054300318c8e74dac8c43fadb5895c16c.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=jmcq=ld=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1frjem-0008GA-Br
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 12:51:40 +0000
In-Reply-To: <8dbf18b054300318c8e74dac8c43fadb5895c16c.1534518694.git-series.wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA4LjE4IGF0IDE3OjEyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
SXRzIGNvdW50ZXJwYXJ0IGlzIEhWTSBvbmx5LiBBZGQgdGhlIGNoZWNrIHRvIGhlbHAgZGVhZCBj
b2RlCj4gZWxpbWluYXRpb24gdG8gZmlndXJlIG91dCB0aGUgY2FsbCB0byBwdF9pcnFfZGVzdHJv
eV9iaW5kIGlzIG5vdAo+IG5lZWRlZCB3aGVuIEhWTSBpcyBub3QgZW5hYmxlZC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKQWNrZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFuZCBzdHJpY3RseSBzcGVha2luZyB0aGlzIHdv
dWxkIG1ha2UgbW9yZSBzZW5zZSBpZiBwbGFjZWQgYWhlYWQKb2YgdGhlIHBhdGNoIG1ha2luZyBp
by5jIGNvbXBpbGF0aW9uIENPTkZJR19IVk0gb25seS4KCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
