From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 4/8] xen/arm: Add support for read-only
 foreign mappings
Date: Thu, 15 Nov 2018 15:05:18 +0000
Message-ID: <0ce5b01c-eb4b-348d-6311-271ba1ca7947@arm.com>
References: <20181106191454.22143-1-julien.grall@arm.com>
 <20181106191454.22143-5-julien.grall@arm.com>
 <CAC1WxdhvbNCfnaj=1pFJmqu-kwMuvvrW77FjOK22xAvaUAPqTA@mail.gmail.com>
 <27feb9a3-ad1b-aed9-7821-6367a3157ce9@arm.com>
 <CAC1Wxdhy1Dnh3_rLFSX0Uj8e4+BLsfWqCQc__U8+bSwd+pCSHg@mail.gmail.com>
 <f9d4248e-485d-e3a8-88bd-6fab6cabe313@arm.com>
 <CAC1Wxdib6qQk=iH9ODr9XuJo39bvY+4RJUXFHsurW77AqekHDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zbOG=N2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gNJCs-0005UY-Ox
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 15:05:22 +0000
In-Reply-To: <CAC1Wxdib6qQk=iH9ODr9XuJo39bvY+4RJUXFHsurW77AqekHDg@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxMS8xNS8xOCAxOjE5IFBNLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+PiBTbyBJIHdv
dWxkIHByZWZlciB0byBzdGljayB3aXRoIF90IHdoaWNoIGlzIHF1aXRlIGNvbW1vbiB3aXRoaW4g
dGhlIHAybQo+PiBjb2RlIGJhc2Ugc28gZmFyLgo+IAo+IEkndmUgZm91bmQgYSBzaW1pbGFyIGNv
ZGUgb25seSBpbiBvbmUgcGxhY2UgLSBwMm1fZ2V0X2VudHJ5KCkKPiBmdW5jdGlvbi4gQW5kIGl0
IGlzLCBhdCBsZWFzdCwgc29tZWhvdyBjb21tZW50ZWQgdGhlcmU6Cj4gLi4uCj4gICAgICAvKiBB
bGxvdyB0IHRvIGJlIE5VTEwgKi8KPiAgICAgIHQgPSB0ID86ICZfdDsKPiAKPiAgICAgICp0ID0g
cDJtX2ludmFsaWQ7Cj4gLi4uCgpBbmQgaW4geDg2IGNvZGUuLi4KCj4gCj4gQnV0IElNTywgaXQg
aXMgcmVhbGx5IGNvbmZ1c2luZyB0byB3cml0ZSBhIGNvZGUgdG8gY2FsY3VsYXRlIGFuZCBzdG9y
ZQo+IGEgdmFsdWUgd2hpY2ggY2xlYXJseSBpcyBub3QgbmVlZGVkIGJ5IGEgY2FsbGVyLgoKSSBk
aXNhZ3JlZSwgeW91IGRpcmVjdGx5IGtub3cgdGhhdCB0IGNhbiBiZSBOVUxMLiBBbHRob3VnaCwg
SSBhZ3JlZSB0aGF0IAphIGNvbW1lbnQgd291bGQgaGVscCB0byB1bmRlcnN0YW5kLgoKPiAgRnJv
bSBhbm90aGVyIGhhbmQsIEknbSBub3Qgc3VyZSBpZiBhIGNvbXBpbGVyIHdvdWxkIGJlIGludGVs
bGlnZW50Cj4gZW5vdWdoIHRvIGZhY3RvciBvdXQgdGhlIG9kZCBjb2RlIGZyb20gZXhlY3V0aW9u
IHBhc3Mgb24gdGhlIGluY29taW5nCj4gbnVsbCBwb2ludGVyLgoKWW91IGNhbid0IGFzc3VtZSB0
aGUgY29tcGlsZXIgd2lsbCBpbmxpbmUgZXZlbiB3aXRoIHRoZSBpbmxpbmUga2V5d29yZC4KCj4g
Cj4gSSdtIHNvcnJ5LCBidXQgSSBjYW4ndCBwYXNzIG15IFJCIGZvciBgX3RgLgoKSSB0aGluayB0
aGlzIHJlcXVlc3QgaXMgdW5yZWFzb25hYmxlIGJlY2F1c2UgdGhpcyBpcyBhIG1hdHRlciBvZiB0
YXN0ZS4KCldoaWxlIHRoaXMgaXMgYSBuaWNlIGZlYXR1cmUgdG8gaGF2ZSBpbiBYZW4gNC4xMiBh
bmQgYWRkcmVzcyBhIGxvbmcgCnN0YW5kaW5nIG9wZW4gaXNzdWUgb24gQXJtLiBJIGRvbid0IHJl
cXVpcmUgaXQgYW5kIEkgYW0gbm90IGluY2xpbmVkIHRvIAphZGRyZXNzIGJpa2VzaGVkZGluZy4K
ClNvIEkgd2lsbCBrZWVwIGFzaWRlIGZvciBub3cgdW50aWwgc29tZW9uZSBjYXJlcyBhYm91dCBp
dC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
