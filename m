From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/3] replace vCPU's dirty CPU mask by
	numeric ID
Date: Tue, 23 Jan 2018 10:20:27 +0000
Message-ID: <701e0c2d-2b41-f5e1-d4d7-5d624d1229c1@citrix.com>
References: <5A67176A02000078001A1734@prv-mh.provo.novell.com>
 <5A6718BB02000078001A1746@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yddd=es=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1edvgz-0005Tx-Lp
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 10:20:37 +0000
In-Reply-To: <5A6718BB02000078001A1746@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDEvMjAxOCAxMDoxMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQEAgLTgwMyw2ICs4MDMs
MTEgQEAgc3RhdGljIGlubGluZSBpbnQgdmNwdV9ydW5uYWJsZShzdHJ1Y3Qgdgo+ICAgICAgICAg
ICAgICAgYXRvbWljX3JlYWQoJnYtPmRvbWFpbi0+cGF1c2VfY291bnQpKTsKPiAgfQo+ICAKPiAr
c3RhdGljIGlubGluZSBib29sIHZjcHVfY3B1X2RpcnR5KGNvbnN0IHN0cnVjdCB2Y3B1ICp2KQo+
ICt7CgpPaCAtIG9uZSBleHRyYSB0aHJvdWdoLsKgIEJVSUxEX0JVR19PTihOUl9DUFVTID49IFZD
UFVfQ1BVX0NMRUFOKSA/CgpSLWJ5IHN0YW5kcyBlaXRoZXIgd2F5LgoKfkFuZHJldwoKPiArICAg
IHJldHVybiB2LT5kaXJ0eV9jcHUgIT0gVkNQVV9DUFVfQ0xFQU47Cj4gK30KPiArCj4gIHZvaWQg
dmNwdV9ibG9jayh2b2lkKTsKPiAgdm9pZCB2Y3B1X3VuYmxvY2soc3RydWN0IHZjcHUgKnYpOwo+
ICB2b2lkIHZjcHVfcGF1c2Uoc3RydWN0IHZjcHUgKnYpOwo+Cj4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
