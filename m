From: Pu Wen <puwen@hygon.cn>
Subject: Re: [PATCH v4 01/15] x86/cpu: Create Hygon Dhyana
 architecture support file
Date: Wed, 3 Apr 2019 23:27:56 +0800
Message-ID: <9d7a4f40-2f96-bf8b-b6e0-53c7e3e2efb8@hygon.cn>
References: <cover.1553935727.git.puwen@hygon.cn>
 <eb635da990e92443a91b2ae598ed354e35975efa.1553935727.git.puwen@hygon.cn>
 <5CA471EE020000780022424F@prv1-mh.provo.novell.com>
 <4c070676-2eab-54fa-5b8c-934f32938cbe@hygon.cn>
 <5CA489310200007800224373@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oXIm=SF=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1hBhtK-0001YP-5R
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2019 15:33:30 +0000
In-Reply-To: <5CA489310200007800224373@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOS80LzMgMTg6MjIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDAzLjA0LjE5IGF0IDEy
OjA1LCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+PiBJJ20gYSBsaXR0bGUgY29uZnVzZWQgYWJv
dXQgd2hpY2ggc3R5bGUgdG8gZm9sbG93PyBJbiB2MyBzZXJpZXMgSQo+PiBmb2xsb3dlZCB0aGUg
c3R5bGUgb2YgdGhlIGRlcml2ZWQgY29kZS4gQnV0IGluIG90aGVyIHBhdGNoIHlvdSB0b2xkIG1l
Cj4+IHRvIGZvbGxvdyB0aGUgWGVuIGNvZGluZyBzdHlsZSwgc28gaW4gdjQgc2VyaWVzIEkgY2hh
bmdlZCB0aGUgc3R5bGUgdG8KPj4gbWF0Y2ggdGhlIGJyYWNpbmcgc2VjdGlvbiBvZiBDT0RJTkdf
U1RZTEUuCj4gCj4gV2VsbCwgdGFraW5nIGp1c3QgdGhlIGJyYWNlIHBsYWNlbWVudCBwYXJ0IGRv
ZXNuJ3QgbWFrZSB0aGlzCj4gdGhlIGZpbGUgWGVuIHN0eWxlLiBJbiBteSBlYXJsaWVyIHJlc3Bv
bnNlIHRvIHRoYXQgc3R5bGUKPiBxdWVzdGlvbiBJIGRpZCBzdWdnZXN0IHlvdSBzd2l0Y2ggdG8g
WGVuIHN0eWxlIGZvciB0aGUgbmV3Cj4gZmlsZS4gSSdkIHN0aWxsIHZpZXcgdGhpcyBhcyB0aGUg
cHJlZmVycmVkIG9wdGlvbiwgYnV0IHRoZW4gYWxsCj4gYXNwZWN0cyBzaG91bGQgYmUgdGFrZW4g
Y2FyZSBvZi4gQnV0IEkgd29uJ3QgaW5zaXN0LCB5ZXQgaW4gdGhhdAo+IGNhc2UgY2xlYW4gTGlu
dXggc3R5bGUgaXMgdGhlIG9ubHkgb3RoZXIgYWx0ZXJuYXRpdmUuCgpXaWxsIGluaGVyaXQgdGhl
IHN0eWxlIGZyb20gYW1kLmMgaW4gaHlnb24uYy4KCj4+IEJ1dCBpZiB5b3UgdGhpbmsgdGhlIGNv
bmRpdGlvbmFsIHNob3VsZCBiZSByZXRhaW5lZCBoZXJlIGZvciBzb21lIHJlYXNvbgo+PiAoZXZl
biB0aG91Z2ggdGhlIGNvbmRpdGlvbmFsIG1heSBub3QgYmUgdG91Y2hlZCksIEknbGwgYWRkIGl0
Lgo+IAo+IFNlZSBhYm92ZSAtIHllcywgSSB0aGluayBpdCBzaG91bGQgYmUgcmV0YWluZWQuCgpP
a2F5LCB3aWxsIHJldGFpbiB0aGUgY29uZGl0aW9uYWxzLgoKLS0gClJlZ2FyZHMsClB1IFdlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
