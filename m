From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xtf: fix cdefs.h conflict with __section
Date: Thu, 22 Feb 2018 12:28:20 +0000
Message-ID: <c4fefd72-dc3f-b8fb-9d30-06684aecbaf9@citrix.com>
References: <20180222120348.46267-1-roger.pau@citrix.com>
 <5A8EC48502000078001AA5E0@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=i0y4=fq=citrix.com=prvs=5842a8f9a=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eopzN-0005wv-6R
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2018 12:28:41 +0000
In-Reply-To: <5A8EC48502000078001AA5E0@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDIvMTggMTI6MjQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIyLjAyLjE4IGF0
IDEzOjAzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+PiBPbiBGcmVlQlNEIHRoZSBi
dWlsZCBmYWlscyB3aXRoOgo+Pgo+PiAvcm9vdC9zcmMveHRmL2luY2x1ZGUveHRmL2NvbXBpbGVy
Lmg6MTM6OTogZXJyb3I6ICdfX3NlY3Rpb24nIG1hY3JvIAo+PiByZWRlZmluZWQKPj4gICAgICAg
Wy1XZXJyb3IsLVdtYWNyby1yZWRlZmluZWRdCj4+ICNkZWZpbmUgX19zZWN0aW9uKHMpICAgICAg
ICAgIF9fYXR0cmlidXRlX18oKF9fc2VjdGlvbl9fKHMpKSkKPj4gICAgICAgICBeCj4+IC91c3Iv
aW5jbHVkZS9zeXMvY2RlZnMuaDoyMjk6OTogbm90ZTogcHJldmlvdXMgZGVmaW5pdGlvbiBpcyBo
ZXJlCj4+ICNkZWZpbmUgX19zZWN0aW9uKHgpICAgIF9fYXR0cmlidXRlX18oKF9fc2VjdGlvbl9f
KHgpKSkKPj4gICAgICAgICBeCj4+IDEgZXJyb3IgZ2VuZXJhdGVkLgo+Pgo+PiBPbmx5IGRlZmlu
ZSBfX3NlY3Rpb24gaWYgaXQncyB1bmRlZmluZWQgaW4gb3JkZXIgdG8gcHJldmVudCBjb25mbGlj
dHMuCj4gQnV0IHRoZSBhY3R1YWwgYnVnIGlzIHRoYXQgL3Vzci9pbmNsdWRlL3N5cy9jZGVmcy5o
IGlzIChtYWdpY2FsbHk/KQo+IGJlaW5nIGluY2x1ZGVkLiBKdXN0IGxpa2UgdGhlIGh5cGVydmlz
b3IgYnVpbGQsIHRoZSB4dGYgb25lIHNob3VsZG4ndAo+IHB1bGwgaW4gX2FueV8gZXh0ZXJuYWwg
aGVhZGVycy4KClhURiB1c2VzIHRoZSBmb2xsb3dpbmcgZnJlZXN0YW5kaW5nIGhlYWRlcnMgb25s
eS4KCiNpbmNsdWRlIDxzdGRpbnQuaD4KI2luY2x1ZGUgPHN0ZGJvb2wuaD4KI2luY2x1ZGUgPHN0
ZGFyZy5oPgojaW5jbHVkZSA8c3RkZGVmLmg+CiNpbmNsdWRlIDxpbnR0eXBlcy5oPgojaW5jbHVk
ZSA8bGltaXRzLmg+Cgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
