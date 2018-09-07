From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/balloon: add runtime control for
 scrubbing ballooned out pages
Date: Fri, 7 Sep 2018 15:16:11 +0200
Message-ID: <44dc40d7-0403-c559-fc8e-a5cea1048433__43663.4658174173$1536326103$gmane$org@suse.com>
References: <20180906153355.25363-1-marmarek@invisiblethingslab.com>
 <5B921FEE02000078001E6258@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=cynw=lv=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fyGcR-0001f9-WE
 for xen-devel@lists.xenproject.org; Fri, 07 Sep 2018 13:16:16 +0000
In-Reply-To: <5B921FEE02000078001E6258@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Marek Marczykowski <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, lkml <linux-kernel@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDkvMTggMDg6NTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA2LjA5LjE4IGF0
IDE3OjMzLCA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4gd3JvdGU6Cj4+IC0tLSBh
L2luY2x1ZGUveGVuL21lbS1yZXNlcnZhdGlvbi5oCj4+ICsrKyBiL2luY2x1ZGUveGVuL21lbS1y
ZXNlcnZhdGlvbi5oCj4+IEBAIC0xNywxMiArMTcsMTcgQEAKPj4gIAo+PiAgI2luY2x1ZGUgPHhl
bi9wYWdlLmg+Cj4+ICAKPj4gKyNpZmRlZiBDT05GSUdfWEVOX1NDUlVCX1BBR0VTCj4+ICtleHRl
cm4gYm9vbCB4ZW5fc2NydWJfcGFnZXM7Cj4+ICsKPj4gIHN0YXRpYyBpbmxpbmUgdm9pZCB4ZW5t
ZW1fcmVzZXJ2YXRpb25fc2NydWJfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSkKPj4gIHsKPj4gLSNp
ZmRlZiBDT05GSUdfWEVOX1NDUlVCX1BBR0VTCj4+IC0JY2xlYXJfaGlnaHBhZ2UocGFnZSk7Cj4+
IC0jZW5kaWYKPj4gKwlpZiAoeGVuX3NjcnViX3BhZ2VzKQo+PiArCQljbGVhcl9oaWdocGFnZShw
YWdlKTsKPj4gIH0KPj4gKyNlbHNlCj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgeGVubWVtX3Jlc2Vy
dmF0aW9uX3NjcnViX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpIHsgfQo+PiArI2VuZGlmCj4gCj4g
V291bGRuJ3QgQ09ORklHX1hFTl9TQ1JVQl9QQUdFUyB0aGVuIGJldHRlciBiZWNvbWUKPiBDT05G
SUdfWEVOX1NDUlVCX1BBR0VTX0RFRkFVTFQsIHdpdGggdGhlIHZhbHVlIHVzZWQgYXMKPiBpbml0
aWFsaXplciBvZiB4ZW5fc2NydWJfcGFnZXM/CgpZZXMsIEknZCBsaWtlIHRoYXQgYmV0dGVyLgoK
Ckp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
