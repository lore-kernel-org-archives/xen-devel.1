From: Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [admin] [Pkg-xen-devel] [BUG] task jbd2/xvda4-8:174
 blocked for more than 120 seconds.
Date: Tue, 12 Feb 2019 12:11:20 +0800
Message-ID: <fbb92dc2-6844-a31e-fa29-af703df31223@oracle.com>
References: <e1429228-bef6-afa1-a004-4fb0cf0bb52d@yaal.fr>
 <20190208171335.nzqrsfk75xjw4plq@function>
 <ace166ae-95b0-25c1-d3fa-3d7b2128521e@knorrie.org>
 <20190208231624.d3p5folfbnw7isp2@function>
 <79756d96-788b-b683-82b1-96a87d2353f1@knorrie.org>
 <20190209163534.boh7ljguxytrnb6o@function>
 <b385f45c-c140-550e-220f-bbc372a15cdd@oracle.com>
 <cac5093b-10c8-8476-f6c8-98999e588072@knorrie.org>
 <20190211221050.qnhw7ma2b5ancek3@function>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QceP=QT=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1gtPQG-0004Vs-2x
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 04:11:52 +0000
In-Reply-To: <20190211221050.qnhw7ma2b5ancek3@function>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>, admin@listes.aquilenet.fr, Hans van Kranenburg <hans@knorrie.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Debian Xen Team <pkg-xen-devel@lists.alioth.debian.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMi8xMi8yMDE5IDA2OjEwIEFNLCBTYW11ZWwgVGhpYmF1bHQgd3JvdGU6Cj4gSGFucyB2
YW4gS3JhbmVuYnVyZywgbGUgbHVuLiAxMSBmw6l2ci4gMjAxOSAyMjo1OToxMSArMDEwMCwgYSBl
Y3JpdDoKPj4gT24gMi8xMS8xOSAyOjM3IEFNLCBEb25nbGkgWmhhbmcgd3JvdGU6Cj4+Pgo+Pj4g
T24gMi8xMC8xOSAxMjozNSBBTSwgU2FtdWVsIFRoaWJhdWx0IHdyb3RlOgo+Pj4+Cj4+Pj4gSGFu
cyB2YW4gS3JhbmVuYnVyZywgbGUgc2FtLiAwOSBmw6l2ci4gMjAxOSAxNzowMTo1NSArMDEwMCwg
YSBlY3JpdDoKPj4+Pj4+IEkgaGF2ZSBmb3J3YXJkZWQgdGhlIG9yaWdpbmFsIG1haWw6IGFsbCBW
TSBJL08gZ2V0IHN0dWNrLCBhbmQgdGh1cyB0aGUKPj4+Pj4+IFZNIGJlY29tZXMgdW51c2FibGUu
Cj4+Pj4+Cj4+Pj4+IFRoZXNlIGFyZSBpbiBtYW55IGNhc2VzIHRoZSBzeW1wdG9tcyBvZiBydW5u
aW5nIG91dCBvZiAiZ3JhbnQgZnJhbWVzIi4KPj4+Pgo+Pj4+IE9oISAgVGhhdCBjb3VsZCBiZSBp
dCBpbmRlZWQuICBJJ20gd29uZGVyaW5nIHdoYXQgY291bGQgYmUgbW9ub3BvbGl6aW5nCj4+Pj4g
dGhlbSwgdGhvdWdoLCBhbmQgd2h5ICtkZWI5dTExIGlzIGFmZmVjdGVkIHdoaWxlICtkZWI5dTEw
IGlzIG5vdC4gIEknbQo+Pj4+IGFmcmFpZCBpbmNyZWFzaW5nIHRoZSBnbnR0YWIgbWF4IHNpemUg
dG8gMzIgbWlnaHQganVzdCBkZWZlciBmaWxsaW5nIGl0Cj4+Pj4gdXAuCj4+Pj4KPj4+Pj4gICAt
IyAuL3hlbi1kaWFnICBnbnR0YWJfcXVlcnlfc2l6ZSA1Cj4+Pj4+ICAgZG9taWQ9NTogbnJfZnJh
bWVzPTExLCBtYXhfbnJfZnJhbWVzPTMyCj4+Pj4KPj4+PiBUaGUgY3VycmVudCB2YWx1ZSBpcyAz
MSBvdmVyIG1heCAzMiBpbmRlZWQuCj4+Pgo+Pj4gQXNzdW1pbmcgdGhpcyBpcyBncmFudCB2MSwg
dGhlcmUgYXJlIHN0aWxsIDQwOTYvOD01MTIgZ3JhbnQgcmVmZXJlbmNlcyBhdmFpbGFibGUKPj4+
ICgzMi0zMT0xIGZyYW1lIGF2YWlsYWJsZSkuIEkgZG8gbm90IHRoaW5rIHRoZSBJL08gaGFuZyBj
YW4gYmUgYWZmZWN0ZWQgYnkgdGhlCj4+PiBsYWNrIG9mIGdyYW50IGVudHJ5Lgo+Pgo+PiBJIHN1
c3BlY3QgdGhhdCAzMSBtZWFzdXJlbWVudCB3YXMgdGFrZW4gd2hlbiB0aGUgZG9tVSB3YXMgbm90
IGhhbmdpbmcgeWV0Lgo+IAo+IEluZGVlZCwgSSBkaWRuJ3QgaGF2ZSB0aGUgaGFuZ2luZyBWTSBv
ZmZoYW5kLiAgSSBoYXZlIGxvb2tlZCBhZ2FpbiwgaXQncwo+IG5vdyBhdCAzMy4gV2UnbGwgaGF2
ZSB0byBtb25pdG9yIHRvIGNoZWNrIHRoYXQgaXQgZG9lc24ndCBjb250aW51ZSBqdXN0Cj4gaW5j
cmVhc2luZy4KCklmIHRoZSBtYXggdXNlZCB0byBiZSAzMiBhbmQgdGhlIGN1cnJlbnQgaXMgYWxy
ZWFkeSAzMywgdGhpcyBpbmRpY2F0ZXMgdGhlIGdyYW50CmVudHJpZXMgbWlnaHQgYmUgdXNlZCB1
cCBpbiB0aGUgcGFzdCBiZWZvcmUgdGhlIG1heF9ucl9mcmFtZXMgaXMgdHVuZWQuCgpEb25nbGkg
WkhhbmcKCj4gCj4gU2FtdWVsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
