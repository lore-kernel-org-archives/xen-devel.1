From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] use consistent values when consuming
 runtime-changeable parameters
Date: Tue, 30 Oct 2018 16:29:07 +0000
Message-ID: <20181030162907.y3mbjww3rbrzrdez@zion.uk.xensource.com>
References: <5BD86E4402000078001F6571@prv1-mh.provo.novell.com>
 <20181030162301.j2wwajxtl36pw6uq@zion.uk.xensource.com>
 <5BD886A502000078001F66EF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mwh5=nk=citrix.com=prvs=834ba7b9c=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gHWtD-0003tc-F8
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 16:29:11 +0000
Content-Disposition: inline
In-Reply-To: <5BD886A502000078001F66EF@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBPY3QgMzAsIDIwMTggYXQgMTA6Mjg6MjFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDMwLjEwLjE4IGF0IDE3OjIzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBUdWUsIE9jdCAzMCwgMjAxOCBhdCAwODo0NDoyMEFNIC0wNjAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiBUaGVyZSdzIG5vIGd1YXJhbnRlZSB0aGF0IGUuZy4gYSBzd2l0Y2go
KSBjb250cm9sIGV4cHJlc3Npb24ncyBtZW1vcnkKPiA+PiBvcGVyYW5kKHMpIGdldChzKSByZWFk
IGp1c3Qgb25jZS4gR3VhcmQgYWdhaW5zdCB0aGUgY29tcGlsZXIgcHJvZHVjaW5nCj4gPj4gInVu
ZXhwZWN0ZWQiIGNvZGUgYnkgc3ByaW5rbGluZyBhcm91bmQgc29tZSBBQ0NFU1NfT05DRSgpLgo+
ID4+IAo+ID4+IEknbSBsZWF2aW5nIGFsb25lIG9wdF9jb25zd2l0Y2hbXTogSXQgZ2V0cyBhY2Nl
c3NlZCBpbiBxdWl0ZSBhIGZldwo+ID4+IHBsYWNlcyBhbnl3YXksIGFuZCBhbiBpbnRlcm1lZGlh
dGUgY2hhbmdlIHdvbid0IGhhdmUgYW55IHNldmVyZSBlZmZlY3QKPiA+PiBhZmFpY3QuCj4gPj4g
Cj4gPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4g
Cj4gPiBJJ20gY3VyaW91cyBob3cgeW91IGNhbWUgdXAgd2l0aCB0aGUgbGlzdCBvZiBwYXJhbWV0
ZXJzIHRoYXQgbmVlZAo+ID4gZml4aW5nLgo+IAo+IEkndmUganVzdCBnb25lIHRocm91Z2ggYWxs
IHRoYXQgYXJlIGN1cnJlbnRseSBydW4tdGltZSBjaGFuZ2FibGUuCgpGYWlyIGVub3VnaC4KClJl
dmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
