From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] use consistent values when consuming
 runtime-changeable parameters
Date: Tue, 30 Oct 2018 10:28:21 -0600
Message-ID: <5BD886A502000078001F66EF@prv1-mh.provo.novell.com>
References: <5BD86E4402000078001F6571@prv1-mh.provo.novell.com>
 <20181030162301.j2wwajxtl36pw6uq@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=kgbc=nk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gHWsV-0003f4-K8
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 16:28:27 +0000
In-Reply-To: <20181030162301.j2wwajxtl36pw6uq@zion.uk.xensource.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjEwLjE4IGF0IDE3OjIzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBPY3QgMzAsIDIwMTggYXQgMDg6NDQ6MjBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+IFRoZXJlJ3Mgbm8gZ3VhcmFudGVlIHRoYXQgZS5nLiBhIHN3aXRjaCgpIGNvbnRyb2wg
ZXhwcmVzc2lvbidzIG1lbW9yeQo+PiBvcGVyYW5kKHMpIGdldChzKSByZWFkIGp1c3Qgb25jZS4g
R3VhcmQgYWdhaW5zdCB0aGUgY29tcGlsZXIgcHJvZHVjaW5nCj4+ICJ1bmV4cGVjdGVkIiBjb2Rl
IGJ5IHNwcmlua2xpbmcgYXJvdW5kIHNvbWUgQUNDRVNTX09OQ0UoKS4KPj4gCj4+IEknbSBsZWF2
aW5nIGFsb25lIG9wdF9jb25zd2l0Y2hbXTogSXQgZ2V0cyBhY2Nlc3NlZCBpbiBxdWl0ZSBhIGZl
dwo+PiBwbGFjZXMgYW55d2F5LCBhbmQgYW4gaW50ZXJtZWRpYXRlIGNoYW5nZSB3b24ndCBoYXZl
IGFueSBzZXZlcmUgZWZmZWN0Cj4+IGFmYWljdC4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBJJ20gY3VyaW91cyBob3cgeW91IGNhbWUg
dXAgd2l0aCB0aGUgbGlzdCBvZiBwYXJhbWV0ZXJzIHRoYXQgbmVlZAo+IGZpeGluZy4KCkkndmUg
anVzdCBnb25lIHRocm91Z2ggYWxsIHRoYXQgYXJlIGN1cnJlbnRseSBydW4tdGltZSBjaGFuZ2Fi
bGUuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
