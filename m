From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v6 08/11] libxl: QEMU startup sync based on
 QMP
Date: Thu, 22 Nov 2018 15:48:59 +0000
Message-ID: <23542.53227.757606.508977@mariner.uk.xensource.com>
References: <20181112164930.25893-1-anthony.perard@citrix.com>
 <20181112164930.25893-9-anthony.perard@citrix.com>
 <23534.46259.473785.159824@mariner.uk.xensource.com>
 <20181121164906.GC2448@perard.uk.xensource.com>
 <20181122143755.GG2448@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hepf=ob=citrix.com=prvs=8575699e6=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gPrE9-0008KS-1Z
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 15:49:13 +0000
In-Reply-To: <20181122143755.GG2448@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSCB2NiAwOC8xMV0gbGlieGw6IFFFTVUg
c3RhcnR1cCBzeW5jIGJhc2VkIG9uIFFNUCIpOgo+IE9uIFdlZCwgTm92IDIxLCAyMDE4IGF0IDA0
OjQ5OjA2UE0gKzAwMDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gSSB3b3VuZGVyIHdoYXQg
dG8gZG8gZm9yIHRoaXMuCj4gPiBNYXliZSBpbnZlbnQgYSBKU09OIG1hY3JvIHdoaWNoIHdvdWxk
IGJlOgo+ID4gICAgIEpTT04obykgKGxpYnhsX19qc29uX29iamVjdF90b19qc29uKGdjLCAobykp
IDogPyAiXCJudWxsXCIiKQo+ID4gICAgICgibnVsbCIgd291bGQgYWN0dWFsbHkgYmUgdmFsaWQg
anNvbikKPiA+IE9yIGRvIGl0IHdpdGhvdXQgdGhlIG1hY3JvLCBidXQgdGhlcmUgYXJlIHBsZW50
eSBvZiBvdGhlciBjYWxsZXIncyBvZgo+ID4gbGlieGxfX2pzb25fb2JqZWN0X3RvX2pzb24gaW4g
bGlieGxfX2V2X3FtcCBpbXBsZW1lbnRhdGlvbi4KPiAKPiBPciBzaW1wbHkgY2hhbmdlIGxpYnhs
X19qc29uX29iamVjdF90b19qc29uIHRvIGFsd2F5cyByZXR1cm4gYSB2YWxpZAo+IGpzb24gc3Ry
aW5nLiBUaGVyZSBhcmUgbm8gdXNlciB5ZXQsIHNvIGl0IGlzIHByb2JhYmx5IGZpbmUgdG8gbWFr
ZSB0aGF0Cj4gY2hhbmdlLgoKSSB2ZXJ5IG11Y2ggbGlrZSB5b3VyIHN1Z2dlc3Rpb24gdGhhdCB0
aGVyZSBzaG91bGQgYmUgc29tZSBzaW1wbGUKdGhpbmcgdGhhdCBhbHdheXMgcmV0dXJucyBzb21l
dGhpbmcgc3VpdGFibGUgZm9yIHByaW50aW5nIGluIGFuIGVycm9yCm1lc3NhZ2UuCgpJJ20gbm90
IHN1cmUgd2hldGhlciB0aGF0IHRoaW5nIHNob3VsZCBiZSBsaWJ4bF9fanNvbl9vYmplY3RfdG9f
anNvbi4KSSBkb24ndCBsaWtlIHRoZSBpZGVhIHRoYXQgbGlieGxfX2pzb25fb2JqZWN0X3RvX2pz
b24gc2hvdWxkIGJlIGFibGUKdG8gZmFpbCB1bmRldGVjdGFibHkuCgpOb3IgZG8gSSBsaWtlIHRo
ZSBpZGVhIHRoYXQgZmFpbHVyZXMgc2hvdWxkIGJlIHJlcHJlc2VudGVkIGJ5IGEgdmFsaWQKcGFy
c2VhYmxlIGpzb24gc3RyaW5nLgoKU28gSSB0ZW50YXRpdmVseSBzdWdnZXN0IGVpdGhlcgoKICBj
b25zdCBjaGFyIGxpYnhsX19qc29uX29iamVjdF90b19qc29uX2Vycm9yW10gPSAiPGludmFsaWQt
anNvbi1vYmplY3Q+IjsKCnJldHVybmluZyBsaWJ4bF9fanNvbl9vYmplY3RfdG9fanNvbl9lcnJv
ciBvbiBlcnJvciwgb3IKCiAgI2RlZmluZSBKU09OKG8pIChsaWJ4bF9fanNvbl9vYmplY3RfdG9f
anNvbihnYywgKG8pKSBcCiAgICAgICAgICAgICAgICAgICA6ID8gIjxpbnZhbGlkLWpzb24tb2Jq
ZWN0PiIpCgpvciBzb21lIHN1Y2guICBJIGNhbid0IHJlbWVtYmVyIGVub3VnaCBKUyByaWdodCBu
b3cgdG8gYmUgc3VyZSB3aGV0aGVyCmA8aW52YWxpZC1qc29uLW9iamVjdD4nIGlzIGEgcGFyc2Ug
ZXJyb3IgYnV0IGJvdGgganNvbl9wcCBhbmQgbm9kZWpzCnNlZW0gdG8gaGF0ZSBpdCB3ZWxsIGVu
b3VnaC4uLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
