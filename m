From: Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [admin] [Pkg-xen-devel] [BUG] task jbd2/xvda4-8:174
 blocked for more than 120 seconds.
Date: Mon, 18 Feb 2019 08:09:56 +0800
Message-ID: <29cb64d5-1d7f-30d5-d294-c3556b3e02e1@oracle.com>
References: <e1429228-bef6-afa1-a004-4fb0cf0bb52d@yaal.fr>
 <20190208171335.nzqrsfk75xjw4plq@function>
 <ace166ae-95b0-25c1-d3fa-3d7b2128521e@knorrie.org>
 <20190208231624.d3p5folfbnw7isp2@function>
 <79756d96-788b-b683-82b1-96a87d2353f1@knorrie.org>
 <20190209163534.boh7ljguxytrnb6o@function>
 <b385f45c-c140-550e-220f-bbc372a15cdd@oracle.com>
 <cac5093b-10c8-8476-f6c8-98999e588072@knorrie.org>
 <20190211221050.qnhw7ma2b5ancek3@function>
 <fbb92dc2-6844-a31e-fa29-af703df31223@oracle.com>
 <20190217212914.cczgjr4fp5k4attg@function>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6WPg=QZ=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1gvWSX-00041Z-CY
 for xen-devel@lists.xenproject.org; Mon, 18 Feb 2019 00:06:57 +0000
In-Reply-To: <20190217212914.cczgjr4fp5k4attg@function>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Samuel Thibault <admin@listes.aquilenet.fr>
Cc: Hans van Kranenburg <hans@knorrie.org>, xen-devel <xen-devel@lists.xenproject.org>, Debian Xen Team <pkg-xen-devel@lists.alioth.debian.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyLzE4LzE5IDU6MjkgQU0sIFNhbXVlbCBUaGliYXVsdCB3cm90ZToKPiBIZWxsbywKPiAK
PiBEb25nbGkgWmhhbmcsIGxlIG1hci4gMTIgZsOpdnIuIDIwMTkgMTI6MTE6MjAgKzA4MDAsIGEg
ZWNyaXQ6Cj4+IE9uIDAyLzEyLzIwMTkgMDY6MTAgQU0sIFNhbXVlbCBUaGliYXVsdCB3cm90ZToK
Pj4+IEhhbnMgdmFuIEtyYW5lbmJ1cmcsIGxlIGx1bi4gMTEgZsOpdnIuIDIwMTkgMjI6NTk6MTEg
KzAxMDAsIGEgZWNyaXQ6Cj4+Pj4gT24gMi8xMS8xOSAyOjM3IEFNLCBEb25nbGkgWmhhbmcgd3Jv
dGU6Cj4+Pj4+Cj4+Pj4+IE9uIDIvMTAvMTkgMTI6MzUgQU0sIFNhbXVlbCBUaGliYXVsdCB3cm90
ZToKPj4+Pj4+Cj4+Pj4+PiBIYW5zIHZhbiBLcmFuZW5idXJnLCBsZSBzYW0uIDA5IGbDqXZyLiAy
MDE5IDE3OjAxOjU1ICswMTAwLCBhIGVjcml0Ogo+Pj4+Pj4+PiBJIGhhdmUgZm9yd2FyZGVkIHRo
ZSBvcmlnaW5hbCBtYWlsOiBhbGwgVk0gSS9PIGdldCBzdHVjaywgYW5kIHRodXMgdGhlCj4+Pj4+
Pj4+IFZNIGJlY29tZXMgdW51c2FibGUuCj4+Pj4+Pj4KPj4+Pj4+PiBUaGVzZSBhcmUgaW4gbWFu
eSBjYXNlcyB0aGUgc3ltcHRvbXMgb2YgcnVubmluZyBvdXQgb2YgImdyYW50IGZyYW1lcyIuCj4+
Pj4+Pgo+Pj4+Pj4gT2ghICBUaGF0IGNvdWxkIGJlIGl0IGluZGVlZC4gIEknbSB3b25kZXJpbmcg
d2hhdCBjb3VsZCBiZSBtb25vcG9saXppbmcKPj4+Pj4+IHRoZW0sIHRob3VnaCwgYW5kIHdoeSAr
ZGViOXUxMSBpcyBhZmZlY3RlZCB3aGlsZSArZGViOXUxMCBpcyBub3QuICBJJ20KPj4+Pj4+IGFm
cmFpZCBpbmNyZWFzaW5nIHRoZSBnbnR0YWIgbWF4IHNpemUgdG8gMzIgbWlnaHQganVzdCBkZWZl
ciBmaWxsaW5nIGl0Cj4+Pj4+PiB1cC4KPj4+Pj4+Cj4+Pj4+Pj4gICAtIyAuL3hlbi1kaWFnICBn
bnR0YWJfcXVlcnlfc2l6ZSA1Cj4+Pj4+Pj4gICBkb21pZD01OiBucl9mcmFtZXM9MTEsIG1heF9u
cl9mcmFtZXM9MzIKPj4+Pj4+Cj4+Pj4+PiBUaGUgY3VycmVudCB2YWx1ZSBpcyAzMSBvdmVyIG1h
eCAzMiBpbmRlZWQuCj4+Pj4+Cj4+Pj4+IEFzc3VtaW5nIHRoaXMgaXMgZ3JhbnQgdjEsIHRoZXJl
IGFyZSBzdGlsbCA0MDk2Lzg9NTEyIGdyYW50IHJlZmVyZW5jZXMgYXZhaWxhYmxlCj4+Pj4+ICgz
Mi0zMT0xIGZyYW1lIGF2YWlsYWJsZSkuIEkgZG8gbm90IHRoaW5rIHRoZSBJL08gaGFuZyBjYW4g
YmUgYWZmZWN0ZWQgYnkgdGhlCj4+Pj4+IGxhY2sgb2YgZ3JhbnQgZW50cnkuCj4+Pj4KPj4+PiBJ
IHN1c3BlY3QgdGhhdCAzMSBtZWFzdXJlbWVudCB3YXMgdGFrZW4gd2hlbiB0aGUgZG9tVSB3YXMg
bm90IGhhbmdpbmcgeWV0Lgo+Pj4KPj4+IEluZGVlZCwgSSBkaWRuJ3QgaGF2ZSB0aGUgaGFuZ2lu
ZyBWTSBvZmZoYW5kLiAgSSBoYXZlIGxvb2tlZCBhZ2FpbiwgaXQncwo+Pj4gbm93IGF0IDMzLiBX
ZSdsbCBoYXZlIHRvIG1vbml0b3IgdG8gY2hlY2sgdGhhdCBpdCBkb2Vzbid0IGNvbnRpbnVlIGp1
c3QKPj4+IGluY3JlYXNpbmcuCj4+Cj4+IElmIHRoZSBtYXggdXNlZCB0byBiZSAzMiBhbmQgdGhl
IGN1cnJlbnQgaXMgYWxyZWFkeSAzMywgdGhpcyBpbmRpY2F0ZXMgdGhlIGdyYW50Cj4+IGVudHJp
ZXMgbWlnaHQgYmUgdXNlZCB1cCBpbiB0aGUgcGFzdCBiZWZvcmUgdGhlIG1heF9ucl9mcmFtZXMg
aXMgdHVuZWQuCj4gCj4gVGhlIG51bWJlciBzZWVtcyB0byBiZSBnb2luZyB1cCBieSBhYm91dCBv
bmUgZXZlcnkgZGF5LiBTbyBwcm9iYWJseSBhCj4gZ3JhbnQgZW50cnkgbGVhayBzb21ld2hlcmUg
Oi8KClRoaXMgbWlnaHQgbm90IGJlIGEgZ3JhbnQgbGVhay4gVGhlIGJsb2NrIHB2IGRyaXZlciB3
b3VsZCBob2xkIHRoZSBwZXJzaXN0ZW50CmdyYW50IGZvciBhIGxvbmcgdGltZS4KCkp1ZXJnZW4g
aGFzIGludHJvZHVjZWQgdGhlIGZlYXR1cmUgdG8gcmVjbGFpbSB0aGUgc3RhbGUgZ3JhbnRzLgoK
CmJsa2Zyb250IHNpbmNlIGE0NmI1MzY3MmIyYzJlMzc3MGIzOGE0YWJmOTBkMTYzNjRkMjU4NGIK
CmJsa2JhY2sgc2luY2UgOTczZTU0MDVmMmY2N2RkYmIyYmYwN2IzZmZjNzE5MDhhMzdmZWE4ZQoK
RG9uZ2xpIFpoYW5nCgo+IAo+IFNhbXVlbAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
