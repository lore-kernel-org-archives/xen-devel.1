From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v1] Fix p2m_set_suppress_ve
Date: Thu, 04 Apr 2019 08:32:22 -0600
Message-ID: <5CA615760200007800224A08@prv1-mh.provo.novell.com>
References: <20190403142620.1224-1-aisaila@bitdefender.com>
 <5CA4C9F9020000780022450F@prv1-mh.provo.novell.com>
 <aa35ec83-77d2-ffc3-c82a-96c666f97227@bitdefender.com>
 <5CA4D1880200007800224564@prv1-mh.provo.novell.com>
 <0c0c0933-bf70-ac3d-57c8-68c14827bcae@bitdefender.com>
 <7f9d8083-f115-dbb3-676d-547af38eda1c@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/YTX=SG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hC3Pm-0005Qn-CP
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2019 14:32:26 +0000
In-Reply-To: <7f9d8083-f115-dbb3-676d-547af38eda1c@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, aisaila@bitdefender.com, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA0LjE5IGF0IDE0OjUwLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gT24gNC80LzE5IDM6NDYgUE0sIFJhenZhbiBDb2pvY2FydSB3cm90ZToKPj4gQmVmb3Jl
IGdvaW5nIGludG8gdGhhdCwgYXJlIHdlIG5vdyBjZXJ0YWluIHRoYXQgQUxMT0MgaXMgc3VmZmlj
aWVudD8gSSAKPj4gYmVsaWV2ZSBpdCBzaG91bGQgYmUgZm9yIF9vdXJfIHVzZS1jYXNlcywgYnV0
IHdlIGRvbid0IHdhbnQgdG8gYnJlYWsgCj4+IGFueW9uZSdzIGNvZGUuIE1heWJlIFRhbWFzIGtu
b3dzIG1vcmUgYWJvdXQgdGhpcy4KPiAKPiBTb3JyeSwgSSBmb3Jnb3QgdG8gbWVudGlvbiB0aGF0
IHAybV9jaGFuZ2VfYWx0cDJtX2dmbigpIG9ubHkgdXNlcyBBTExPQzoKCkkgdGhpbmsgdGhpcyB0
b2dldGhlciB3aXRoIEFuZHJldydzIHJlcGx5IGFuZCB3aGF0IEkgaGF2ZSBzYWlkCmVhcmxpZXIg
b24gc2hvdWxkIGJlIHN1ZmZpY2llbnQgdG8gYW5zd2VyIHRoZSBxdWVzdGlvbiB3aXRoICJ5ZXMi
LgpCdXQgSSBzZWUgVGFtYXMgaXMgdGVsbGluZyB5b3UgdGhlIG9wcG9zaXRlLCBzbyBJIGd1ZXNz
IEknbGwgcmVwbHkKdGhlcmUgYXMgd2VsbC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
