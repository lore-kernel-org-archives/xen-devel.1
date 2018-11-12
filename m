From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86: fix hvm_migrate_irq assertion
Date: Mon, 12 Nov 2018 07:35:57 -0700
Message-ID: <5BE98FCD02000078001FB077@prv1-mh.provo.novell.com>
References: <20181112140459.23480-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=18fz=nx=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gMDJq-0002Wc-Ca
 for xen-devel@lists.xenproject.org; Mon, 12 Nov 2018 14:36:02 +0000
In-Reply-To: <20181112140459.23480-1-wei.liu2@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjExLjE4IGF0IDE1OjA0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
NzgyY2Y4YmE0NiAoInBhc3MtdGhyb3VnaDogYWRqdXN0IHBJUlEgbWlncmF0aW9uIikgYWRkZWQg
YW4gYXNzZXJ0aW9uCj4gdG8gaHZtX21pZ3JhdGVfaXJxLgo+IAo+IFBWSCBEb20wIGlzIGJyb2tl
biBiZWNhdXNlIGl0IGRvZXNuJ3QgaGF2ZSBkcGNpIGFsbG9jYXRlZC4gQWRkIGFuCj4gaXNfaGFy
ZHdhcmVfZG9tYWluIGNoZWNrIHRvIHRoZSBhc3NlcnRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTog
V2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+CgpJJ20gc29ycnkgZm9yIHRoZSBicmVha2FnZS4KCkphbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
