From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen/balloon: add runtime control for
 scrubbing ballooned out pages
Date: Fri, 07 Sep 2018 00:51:26 -0600
Message-ID: <5B921FEE02000078001E6258__46219.5939188406$1536303015$gmane$org@prv1-mh.provo.novell.com>
References: <20180906153355.25363-1-marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=p3pn=lv=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fyAc5-0001zD-9u
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 06:51:29 +0000
In-Reply-To: <20180906153355.25363-1-marmarek@invisiblethingslab.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjA5LjE4IGF0IDE3OjMzLCA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNv
bT4gd3JvdGU6Cj4gLS0tIGEvaW5jbHVkZS94ZW4vbWVtLXJlc2VydmF0aW9uLmgKPiArKysgYi9p
bmNsdWRlL3hlbi9tZW0tcmVzZXJ2YXRpb24uaAo+IEBAIC0xNywxMiArMTcsMTcgQEAKPiAgCj4g
ICNpbmNsdWRlIDx4ZW4vcGFnZS5oPgo+ICAKPiArI2lmZGVmIENPTkZJR19YRU5fU0NSVUJfUEFH
RVMKPiArZXh0ZXJuIGJvb2wgeGVuX3NjcnViX3BhZ2VzOwo+ICsKPiAgc3RhdGljIGlubGluZSB2
b2lkIHhlbm1lbV9yZXNlcnZhdGlvbl9zY3J1Yl9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKQo+ICB7
Cj4gLSNpZmRlZiBDT05GSUdfWEVOX1NDUlVCX1BBR0VTCj4gLQljbGVhcl9oaWdocGFnZShwYWdl
KTsKPiAtI2VuZGlmCj4gKwlpZiAoeGVuX3NjcnViX3BhZ2VzKQo+ICsJCWNsZWFyX2hpZ2hwYWdl
KHBhZ2UpOwo+ICB9Cj4gKyNlbHNlCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCB4ZW5tZW1fcmVzZXJ2
YXRpb25fc2NydWJfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSkgeyB9Cj4gKyNlbmRpZgoKV291bGRu
J3QgQ09ORklHX1hFTl9TQ1JVQl9QQUdFUyB0aGVuIGJldHRlciBiZWNvbWUKQ09ORklHX1hFTl9T
Q1JVQl9QQUdFU19ERUZBVUxULCB3aXRoIHRoZSB2YWx1ZSB1c2VkIGFzCmluaXRpYWxpemVyIG9m
IHhlbl9zY3J1Yl9wYWdlcz8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
