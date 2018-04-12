From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: Weird altp2m behaviour when switching early to a
 new view
Date: Thu, 12 Apr 2018 10:19:58 +0300
Message-ID: <710ed78f-8073-1665-4cbe-d3e0ba6c2cc1@bitdefender.com>
References: <a592fcb3-c2c6-bd83-01a4-0ac7ba9f3fa5@bitdefender.com>
 <d0ae9d3e-31ee-a03b-dc9d-b86ceb92fe52@citrix.com>
 <b21c7573-7ca0-9ccc-eac7-5ff351fc54ce@bitdefender.com>
 <CABfawhnJZwPT5sBV2hcKHfnyrO_zTx0GHg2UJgb1oPO5BAp2sQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rowp=hb=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1f6WWu-0004PF-Un
 for xen-devel@lists.xenproject.org; Thu, 12 Apr 2018 07:20:24 +0000
Received: from mx-sr.buh.bitdefender.com (mx-sr.buh.bitdefender.biz
 [10.17.80.103])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id 71ECC31215AD
 for <xen-devel@lists.xenproject.org>; Thu, 12 Apr 2018 11:36:26 +0300 (EEST)
Received: from smtp02.buh.bitdefender.net (smtp.bitdefender.biz [10.17.80.76])
 by mx-sr.buh.bitdefender.com (Postfix) with ESMTP id F248B7FC2B
 for <xen-devel@lists.xenproject.org>; Thu, 12 Apr 2018 10:20:22 +0300 (EEST)
In-Reply-To: <CABfawhnJZwPT5sBV2hcKHfnyrO_zTx0GHg2UJgb1oPO5BAp2sQ@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMTEvMjAxOCAxMToxNyBQTSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFdlZCwg
QXByIDExLCAyMDE4IGF0IDEyOjM5IEFNLCBSYXp2YW4gQ29qb2NhcnUKPiA8cmNvam9jYXJ1QGJp
dGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+IEFsc28gcmVsYXRlZCB0byB0aGlzIHBhcnQgb2YgdGhl
IGFsdHAybSBkZXNpZ24sIEkndmUgYWxzbyBub3RpY2VkIHRoYXQKPj4gY3JlYXRpbmcgYSBuZXcg
RVBUIHZpZXcgd2l0aCBsaWJ4YyBpbnZvbHZlcyB0aGlzIGZ1bmN0aW9uOgo+Pgo+PiBpbnQgeGNf
YWx0cDJtX2NyZWF0ZV92aWV3KHhjX2ludGVyZmFjZSAqaGFuZGxlLCB1aW50MzJfdCBkb21pZCwK
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICB4ZW5tZW1fYWNjZXNzX3QgZGVmYXVsdF9hY2Nl
c3MsCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDE2X3QgKnZpZXdfaWQpOwo+Pgo+
PiBIb3dldmVyLCBkZWZhdWx0X2FjY2VzcyBpcyBjb21wbGV0ZWx5IGlnbm9yZWQuIElmIHRoaXMg
d2FzIG1lYW50IHRvCj4+IHJlc2V0IGFsbCBwYWdlcyB0byB0aGF0IGFjY2VzcyBpdCdzIHRyaXZp
YWwgdG8gd2lyZSBpdCBpbiBpbnRvIHRoZQo+PiBoeXBlcnZpc29yICh3ZSBjb3VsZCBqdXN0IGl0
ZXJhdGUgdGhyb3VnaCBhbGwgZ3Vlc3QgcGFnZXMgZnJvbSAwIHRvCj4+IG1heF9ncGZuIGFuZCBz
ZXQgdGhlIGFjY2VzcykgLSBidXQgaW4gbGlnaHQgb2YgdGhpcyBpc3N1ZSB0aGF0J3Mgbm90IGEK
Pj4gZ29vZCB0aGluZyB0byBkby4gT3IsIHJhdGhlciwgaXQgd2FzIG1lYW50IHRvIHNwZWNpZnkg
dGhlIGRlZmF1bHRfYWNjZXNzCj4+IGZvciBuZXcgcGFnZXMgd2hlcmUgaXQgaXMgbm90IGV4cGxp
Y2l0bHkgc3BlY2lmaWVkPwo+IAo+IEkgZG9uJ3QgdGhpbmsgdGhlIGZ1bmN0aW9uIG9mIGRlZmF1
bHRfYWNjZXNzIGZvciBhbiBhbHRwMm0gd2FzCj4gc2V0dGxlZCwgc28gYm90aCBvZiB0aGVzZSB3
b3VsZCBzb3VuZCB0byBtZSBsaWtlIGEgdmFsaWQgc2V0dXAuIEkKPiBwZXJzb25hbGx5IHdvdWxk
IHByZWZlciB0aGF0IGlmIHRoZSBkZWZhdWx0X2FjY2VzcyBpcyBzcGVjaWZpZWQgYW5kCj4gaXQn
cyBub3Qgcnd4IGl0IHdvdWxkIHJlc3VsdCBpbiB0aGUgZW50aXJlIGFsdHAybSB2aWV3IGdldHRp
bmcKPiBwb3B1bGF0ZWQgcmlnaHQgdGhlcmUgaW5zdGVhZCBvZiBpdCBiZWluZyBkb25lIGxhemls
eS4gVGhlIHdob2xlCj4gbGF6eS1wb3B1bGF0aW9uIG9mIHRoZSBhbHRwMm0gdmlld3MgaGFzIGJl
ZW4gbm90aGluZyBidXQgYSBoZWFkYWNoZS4KPiBBZGQgdG8gdGhhdCB0aGUgZmFjdCB0aGF0IHZp
ZXdzIGdldCBjb21wbGV0ZWx5IHJlc2V0IHVuZGVyIGNlcnRhaW4KPiBzaXR1YXRpb25zIHdpdGhv
dXQgYW55IGluZGljYXRpb24gYmVpbmcgZ2l2ZW4gdG8gdGhlIGFwcGxpY2F0aW9uIHVzaW5nCj4g
aXQuLiBtaWdodCBiZSB0aW1lIHdlIHJldGhpbmsgdGhlc2UgcGFydHMgb2YgYWx0cDJtIHRvIG1h
a2UgaXQgbW9yZQo+IHJvYnVzdC4KCkRvIHlvdSBtZWFuIHRoZSBwMm1fYWx0cDJtX2xhenlfY29w
eSgpIGxvZ2ljIGluCmh2bV9oYXBfbmVzdGVkX3BhZ2VfZmF1bHQoKT8gVGhhdCB0b29rIGEgd2hp
bGUgdG8gd3JhcCBteSBoZWFkIGFyb3VuZC4KCklkZWFsbHkgYSBuZXcgdmlldyB3b3VsZCBpbW1l
ZGlhdGVseSB1cG9uIGNyZWF0aW9uIGNvcHkgdGhlIGRlZmF1bHQKdmlldy4gTGF0ZXIgb24sIGl0
IHdvdWxkIGJlIHVwZGF0ZWQgKGtlcHQgaW4gc3luYykgYnkKcDJtX2FsdHAybV9wcm9wYWdhdGVf
Y2hhbmdlKCkuIFRoYXQncyB0aGUgdGhlb3J5IGFueXdheS4KCgpUaGFua3MsClJhenZhbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
