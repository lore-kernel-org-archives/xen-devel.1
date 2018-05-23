From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: Mysterious one-off libvirt build failure
Date: Wed, 23 May 2018 16:13:53 +0100
Message-ID: <23301.34097.339882.498275@mariner.uk.xensource.com>
References: <23301.17832.545738.194594@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gdxj=ik=citrix.com=prvs=674fbe803=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fLVSg-0002vh-Em
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 15:13:58 +0000
In-Reply-To: <23301.17832.545738.194594@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jim Fehlig <jfehlig@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SWFuIEphY2tzb24gd3JpdGVzICgiTXlzdGVyaW91cyBvbmUtb2ZmIGxpYnZpcnQgYnVpbGQgZmFp
bHVyZSIpOgo+IEkgYW0gdHJ5aW5nIHRvIGNvbW1pc3Npb24gc29tZSBuZXcgdGVzdCBib3hlcy4g
IE9uZSBvZiBteSB0ZXN0IGZsaWdodHMKPiBleHBlcmllbmNlZCBhIHdlaXJkIGJ1aWxkIGZhaWx1
cmU6Cj4gCj4gIGh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9n
cy8xMjMwNDYvYnVpbGQtaTM4Ni1saWJ2aXJ0LzYudHMtbGlidmlydC1idWlsZC5sb2cKPiAKPiBG
b3IgeW91ciBjb252ZW5pZW5jZSwgbG9nIHNuaXBwZXQgYmVsb3cuICBJIHRoaW5rIHRoaXMgaXMg
cHJvYmFibHkgYQo+IG1ha2UgLWogcmFjZSBpbiB0aGUgbGlidmlydCBidWlsZCBzeXN0ZW0uICBJ
IGRvbid0IHRoaW5rIGl0IGlzIGEKPiBwcm9ibGVtIHdpdGggdGhlIG5ldyB0ZXN0IGJveC4KPiAK
PiBTaG91bGQgSSB0cnkgdG8gcmVwb3J0IHRoaXMgdG8gdGhlIGxpYnZpcnQgbGlzdCA/ICBJJ20g
bm90IHJlYWxseQo+IGZhbWlsaWFyIHdpdGggbGlidmlydCdzIGJ1aWxkIHN5c3RlbSBzbyBJJ20g
bm90IHN1cmUgSSB3b3VsZCBrbm93Cj4gd2hlcmUgdDZvIHN0YXJ0IGRlYnVnZ2luZyBpdC4KCkkg
cmVyYW4gdGhpcyBiZWNhdXNlIEkgd2FudGVkIHRvIGNoZWNrIHRoYXQgdGhlIGJveCB3b3JrZWQg
cHJvcGVybHkKd2l0aCAzMi1iaXQgdXNlcmxhbmQuICBBbmQgaXQgZmFpbGVkIHRoZSBidWlsZCBh
Z2FpbiEKCiAgaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dz
LzEyMzA5Ni9idWlsZC1pMzg2LWxpYnZpcnQvNi50cy1saWJ2aXJ0LWJ1aWxkLmxvZwoKU28gSSB0
aGluayBJIGhhdmUgYSByZXByb2R1Y2VyIGZvciBhIGJ1aWxkIHJhY2UgaW4gbGlidmlydC4gIEkg
d2lsbAp3cml0ZSBhbm90aGVyIGVtYWlsIHRvIHRoZSBsaWJ2aXJ0IGxpc3QuCgpJYW4uCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
