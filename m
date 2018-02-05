From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] [v2] xen: hypercall: fix out-of-bounds
 memcpy
Date: Mon, 05 Feb 2018 08:14:34 -0700
Message-ID: <5A7882EA02000078001A552D__6326.06094372949$1517843654$gmane$org@prv-mh.provo.novell.com>
References: <20180205150340.328921-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=do0y=e7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eiiTl-0001h7-8w
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2018 15:14:45 +0000
In-Reply-To: <20180205150340.328921-1-arnd@arndb.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, David Laight <David.Laight@aculab.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjAyLjE4IGF0IDE2OjAzLCA8YXJuZEBhcm5kYi5kZT4gd3JvdGU6Cj4gIGludCB4
ZW5fZXZlbnRfY2hhbm5lbF9vcF9jb21wYXQoaW50IGNtZCwgdm9pZCAqYXJnKQo+ICB7Cj4gLQlz
dHJ1Y3QgZXZ0Y2huX29wIG9wOwo+ICsJc3RydWN0IGV2dGNobl9vcCBvcCA9IHsgLmNtZCA9IGNt
ZCwgfTsKPiArCXNpemVfdCBsZW47Cj4gIAlpbnQgcmM7Cj4gIAo+IC0Jb3AuY21kID0gY21kOwo+
IC0JbWVtY3B5KCZvcC51LCBhcmcsIHNpemVvZihvcC51KSk7Cj4gLQlyYyA9IF9oeXBlcmNhbGwx
KGludCwgZXZlbnRfY2hhbm5lbF9vcF9jb21wYXQsICZvcCk7Cj4gLQo+IC0Jc3dpdGNoIChjbWQp
IHsKPiAtCWNhc2UgRVZUQ0hOT1BfY2xvc2U6Cj4gLQljYXNlIEVWVENITk9QX3NlbmQ6Cj4gLQlj
YXNlIEVWVENITk9QX2JpbmRfdmNwdToKPiAtCWNhc2UgRVZUQ0hOT1BfdW5tYXNrOgo+IC0JCS8q
IG5vIG91dHB1dCAqLwo+IC0JCWJyZWFrOwo+ICsJaWYgKGNtZCA+IEFSUkFZX1NJWkUoZXZ0Y2hu
b3BfbGVuKSkKPiArCQlyZXR1cm4gLUVOT1NZUzsKCj49IHBlcmhhcHM/CgpKYW4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
