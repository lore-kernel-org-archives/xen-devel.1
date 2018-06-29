From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] schedulers: validate / correct global data
 just once
Date: Fri, 29 Jun 2018 08:20:29 -0600
Message-ID: <5B36402D02000078001CF36E@prv1-mh.provo.novell.com>
References: <5B362FD402000078001CF26F@prv1-mh.provo.novell.com>
 <32548b9e-3c8a-42bc-af8f-63cd4fc990d5@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gccx=jp=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fYuGF-0007lg-Bl
 for xen-devel@lists.xenproject.org; Fri, 29 Jun 2018 14:20:31 +0000
In-Reply-To: <32548b9e-3c8a-42bc-af8f-63cd4fc990d5@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjA2LjE4IGF0IDE1OjUyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjkvMDYvMTggMTQ6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBBbHNvIG1hcmsg
Y29tbWFuZCBsaW5lIHBhcnNpbmcgcm91dGluZSBfX2luaXQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gLS0tCj4+IEZvciBjcmVkaXQyIEkn
bSBub3Qgc3VyZSB0aGUgcmVsYXRpdmVseSB2ZXJib3NlIGxvZ2dpbmcgb2YgYWxsCj4+IHBhcmFt
ZXRlcnMgc2hvdWxkIHJlYWxseSBoYXBwZW4gdXBvbiBldmVyeSBpbml0aWFsaXphdGlvbi4gT3Rv
aCBlbWl0dGluZwo+PiBpdCBhdCBib290IHRpbWUgd2hlbiB0aGUgc2NoZWR1bGVyIGlzbid0IGFj
dHVhbGx5IHVzZWQgbWF5IGFsc28gYmUKPj4gY29uZnVzaW5nLgo+Pgo+PiAtLS0gYS94ZW4vY29t
bW9uL3NjaGVkX2NyZWRpdC5jCj4+ICsrKyBiL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0LmMKPj4g
QEAgLTIxNTYsNiArMjE1NiwzNiBAQCBjc2NoZWRfZHVtcChjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVy
ICpvcHMpCj4+ICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmcHJ2LT5sb2NrLCBmbGFncyk7
Cj4+ICB9Cj4+ICAKPj4gK3N0YXRpYyBpbnQgX19pbml0Cj4+ICtjc2NoZWRfZ2xvYmFsX2luaXQo
dm9pZCkKPj4gK3sKPj4gKyAgICBpZiAoIHNjaGVkX2NyZWRpdF90c2xpY2VfbXMgPiBYRU5fU1lT
Q1RMX0NTQ0hFRF9UU0xJQ0VfTUFYCj4+ICsgICAgICAgICB8fCBzY2hlZF9jcmVkaXRfdHNsaWNl
X21zIDwgWEVOX1NZU0NUTF9DU0NIRURfVFNMSUNFX01JTiApCj4gCj4gTWluZCBmaXhpbmcgdGhl
IHN0eWxlIHRvCj4gCj4gaWYgKCBzY2hlZF9jcmVkaXRfdHNsaWNlX21zID4gWEVOX1NZU0NUTF9D
U0NIRURfVFNMSUNFX01BWCB8fAo+ICAgICBzY2hlZF9jcmVkaXRfdHNsaWNlX21zIDwgWEVOX1NZ
U0NUTF9DU0NIRURfVFNMSUNFX01JTiApCj4gCj4gYXMgeW91J3JlIG1vdmluZyBpdD8KCk9oLCBz
dXJlIC0gSSBzaG91bGQgaGF2ZSBub3RpY2VkIHRoaXMgbXlzZWxmLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
