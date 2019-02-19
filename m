From: Samuel Thibault <admin@listes.aquilenet.fr>
Subject: Re: [admin] [Pkg-xen-devel] [BUG] task jbd2/xvda4-8:174
 blocked for more than 120 seconds.
Date: Wed, 20 Feb 2019 00:49:46 +0100
Message-ID: <20190219234946.wsjvht2fdbfnfdf7@function>
References: <ace166ae-95b0-25c1-d3fa-3d7b2128521e@knorrie.org>
 <20190208231624.d3p5folfbnw7isp2@function>
 <79756d96-788b-b683-82b1-96a87d2353f1@knorrie.org>
 <20190209163534.boh7ljguxytrnb6o@function>
 <b385f45c-c140-550e-220f-bbc372a15cdd@oracle.com>
 <cac5093b-10c8-8476-f6c8-98999e588072@knorrie.org>
 <20190211221050.qnhw7ma2b5ancek3@function>
 <fbb92dc2-6844-a31e-fa29-af703df31223@oracle.com>
 <20190217212914.cczgjr4fp5k4attg@function>
 <29cb64d5-1d7f-30d5-d294-c3556b3e02e1@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L0uo=Q2=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1gwF95-0002YM-Th
 for xen-devel@lists.xenproject.org; Tue, 19 Feb 2019 23:49:51 +0000
Content-Disposition: inline
In-Reply-To: <29cb64d5-1d7f-30d5-d294-c3556b3e02e1@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: admin@listes.aquilenet.fr, Dongli Zhang <dongli.zhang@oracle.com>
Cc: Hans van Kranenburg <hans@knorrie.org>, xen-devel <xen-devel@lists.xenproject.org>, Debian Xen Team <pkg-xen-devel@lists.alioth.debian.org>
List-Id: xen-devel@lists.xenproject.org

RG9uZ2xpIFpoYW5nLCBsZSBsdW4uIDE4IGbDqXZyLiAyMDE5IDA4OjA5OjU2ICswODAwLCBhIGVj
cml0Ogo+IAo+IAo+IE9uIDIvMTgvMTkgNToyOSBBTSwgU2FtdWVsIFRoaWJhdWx0IHdyb3RlOgo+
ID4gSGVsbG8sCj4gPiAKPiA+IERvbmdsaSBaaGFuZywgbGUgbWFyLiAxMiBmw6l2ci4gMjAxOSAx
MjoxMToyMCArMDgwMCwgYSBlY3JpdDoKPiA+PiBPbiAwMi8xMi8yMDE5IDA2OjEwIEFNLCBTYW11
ZWwgVGhpYmF1bHQgd3JvdGU6Cj4gPj4+IEhhbnMgdmFuIEtyYW5lbmJ1cmcsIGxlIGx1bi4gMTEg
ZsOpdnIuIDIwMTkgMjI6NTk6MTEgKzAxMDAsIGEgZWNyaXQ6Cj4gPj4+PiBPbiAyLzExLzE5IDI6
MzcgQU0sIERvbmdsaSBaaGFuZyB3cm90ZToKPiA+Pj4+Pgo+ID4+Pj4+IE9uIDIvMTAvMTkgMTI6
MzUgQU0sIFNhbXVlbCBUaGliYXVsdCB3cm90ZToKPiA+Pj4+Pj4KPiA+Pj4+Pj4gSGFucyB2YW4g
S3JhbmVuYnVyZywgbGUgc2FtLiAwOSBmw6l2ci4gMjAxOSAxNzowMTo1NSArMDEwMCwgYSBlY3Jp
dDoKPiA+Pj4+Pj4+PiBJIGhhdmUgZm9yd2FyZGVkIHRoZSBvcmlnaW5hbCBtYWlsOiBhbGwgVk0g
SS9PIGdldCBzdHVjaywgYW5kIHRodXMgdGhlCj4gPj4+Pj4+Pj4gVk0gYmVjb21lcyB1bnVzYWJs
ZS4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBUaGVzZSBhcmUgaW4gbWFueSBjYXNlcyB0aGUgc3ltcHRv
bXMgb2YgcnVubmluZyBvdXQgb2YgImdyYW50IGZyYW1lcyIuCj4gPj4+Pj4+Cj4gPj4+Pj4+IE9o
ISAgVGhhdCBjb3VsZCBiZSBpdCBpbmRlZWQuICBJJ20gd29uZGVyaW5nIHdoYXQgY291bGQgYmUg
bW9ub3BvbGl6aW5nCj4gPj4+Pj4+IHRoZW0sIHRob3VnaCwgYW5kIHdoeSArZGViOXUxMSBpcyBh
ZmZlY3RlZCB3aGlsZSArZGViOXUxMCBpcyBub3QuICBJJ20KPiA+Pj4+Pj4gYWZyYWlkIGluY3Jl
YXNpbmcgdGhlIGdudHRhYiBtYXggc2l6ZSB0byAzMiBtaWdodCBqdXN0IGRlZmVyIGZpbGxpbmcg
aXQKPiA+Pj4+Pj4gdXAuCj4gPj4+Pj4+Cj4gPj4+Pj4+PiAgIC0jIC4veGVuLWRpYWcgIGdudHRh
Yl9xdWVyeV9zaXplIDUKPiA+Pj4+Pj4+ICAgZG9taWQ9NTogbnJfZnJhbWVzPTExLCBtYXhfbnJf
ZnJhbWVzPTMyCj4gPj4+Pj4+Cj4gPj4+Pj4+IFRoZSBjdXJyZW50IHZhbHVlIGlzIDMxIG92ZXIg
bWF4IDMyIGluZGVlZC4KPiA+Pj4+Pgo+ID4+Pj4+IEFzc3VtaW5nIHRoaXMgaXMgZ3JhbnQgdjEs
IHRoZXJlIGFyZSBzdGlsbCA0MDk2Lzg9NTEyIGdyYW50IHJlZmVyZW5jZXMgYXZhaWxhYmxlCj4g
Pj4+Pj4gKDMyLTMxPTEgZnJhbWUgYXZhaWxhYmxlKS4gSSBkbyBub3QgdGhpbmsgdGhlIEkvTyBo
YW5nIGNhbiBiZSBhZmZlY3RlZCBieSB0aGUKPiA+Pj4+PiBsYWNrIG9mIGdyYW50IGVudHJ5Lgo+
ID4+Pj4KPiA+Pj4+IEkgc3VzcGVjdCB0aGF0IDMxIG1lYXN1cmVtZW50IHdhcyB0YWtlbiB3aGVu
IHRoZSBkb21VIHdhcyBub3QgaGFuZ2luZyB5ZXQuCj4gPj4+Cj4gPj4+IEluZGVlZCwgSSBkaWRu
J3QgaGF2ZSB0aGUgaGFuZ2luZyBWTSBvZmZoYW5kLiAgSSBoYXZlIGxvb2tlZCBhZ2FpbiwgaXQn
cwo+ID4+PiBub3cgYXQgMzMuIFdlJ2xsIGhhdmUgdG8gbW9uaXRvciB0byBjaGVjayB0aGF0IGl0
IGRvZXNuJ3QgY29udGludWUganVzdAo+ID4+PiBpbmNyZWFzaW5nLgo+ID4+Cj4gPj4gSWYgdGhl
IG1heCB1c2VkIHRvIGJlIDMyIGFuZCB0aGUgY3VycmVudCBpcyBhbHJlYWR5IDMzLCB0aGlzIGlu
ZGljYXRlcyB0aGUgZ3JhbnQKPiA+PiBlbnRyaWVzIG1pZ2h0IGJlIHVzZWQgdXAgaW4gdGhlIHBh
c3QgYmVmb3JlIHRoZSBtYXhfbnJfZnJhbWVzIGlzIHR1bmVkLgo+ID4gCj4gPiBUaGUgbnVtYmVy
IHNlZW1zIHRvIGJlIGdvaW5nIHVwIGJ5IGFib3V0IG9uZSBldmVyeSBkYXkuIFNvIHByb2JhYmx5
IGEKPiA+IGdyYW50IGVudHJ5IGxlYWsgc29tZXdoZXJlIDovCj4gCj4gVGhpcyBtaWdodCBub3Qg
YmUgYSBncmFudCBsZWFrLiBUaGUgYmxvY2sgcHYgZHJpdmVyIHdvdWxkIGhvbGQgdGhlIHBlcnNp
c3RlbnQKPiBncmFudCBmb3IgYSBsb25nIHRpbWUuCj4gCj4gSnVlcmdlbiBoYXMgaW50cm9kdWNl
ZCB0aGUgZmVhdHVyZSB0byByZWNsYWltIHRoZSBzdGFsZSBncmFudHMuCj4gCj4gYmxrZnJvbnQg
c2luY2UgYTQ2YjUzNjcyYjJjMmUzNzcwYjM4YTRhYmY5MGQxNjM2NGQyNTg0Ygo+IAo+IGJsa2Jh
Y2sgc2luY2UgOTczZTU0MDVmMmY2N2RkYmIyYmYwN2IzZmZjNzE5MDhhMzdmZWE4ZQoKT2ssIHRo
YXQgaGFzbid0IHJlYWNoZWQgRGViaWFuIFN0cmV0Y2ggeWV0IDovCgpMZXQncyBrZWVwIG1vbml0
b3JpbmcgZm9yIG5vdy4KClNhbXVlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
