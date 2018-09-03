From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 3/6] x86emul: support AVX512 opmask insns
Date: Mon, 3 Sep 2018 18:57:27 +0100
Message-ID: <15822fa5-ed58-2621-35e5-0a2e1b3473af@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5B86AB9002000078001E31E3@prv1-mh.provo.novell.com>
 <5B86AC8D02000078001E31F3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wisl=lr=citrix.com=prvs=7772440c6=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fwt6S-0006s3-BY
 for xen-devel@lists.xenproject.org; Mon, 03 Sep 2018 17:57:32 +0000
In-Reply-To: <5B86AC8D02000078001E31F3@prv1-mh.provo.novell.com>
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
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDgvMTggMTU6MjQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoZXNlIGFyZSBhbGwgVkVY
IGVuY29kZWQsIHNvIHRoZSBFVkVYIGRlY29kaW5nIGxvZ2ljIGNvbnRpbnVlcyB0bwo+IHJlbWFp
biB1bnVzZWQgYXQgdGhpcyBwb2ludC4KPgo+IFRoZSBuZXcgdGVzdGNhc2UgaXMgZGVsaWJlcmF0
ZWx5IGNvZGVkIGluIGFzc2VtYmx5LCBhcyBhIEMgb25lIHdvdWxkCj4gaGF2ZSBiZWNvbWUgYWxt
b3N0IHVucmVhZGFibGUgZHVlIHRvIHRoZSBvdmVyd2hlbG1pbmcgYW1vdW50IG9mCj4gX19idWls
dGluXy4uLigpIHRoYXQgd291bGQgbmVlZCB0byBiZSB1c2VkLiBBZnRlciBhbGwgdGhlIGNvbXBp
bGVyIGhhcwo+IG5vIHVuZGVybHlpbmcgdHlwZSAoeWV0KSB0aGF0IGNvdWxkIGJlIG9wZXJhdGVk
IG9uIHdpdGhvdXQgYnVpbHRpbnMsCj4gb3RoZXIgdGhhbiB0aGUgdmVjdG9yIHR5cGVzIHVzZWQg
Zm9yICJub3JtYWwiIFNJTUQgaW5zbnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4KPiAtLS0gYS94ZW4vYXJjaC94ODYveDg2X2VtdWxhdGUveDg2
X2VtdWxhdGUuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5j
Cj4gQEAgLTYwMDIsNiArNjAyMyw2MCBAQCB4ODZfZW11bGF0ZSgKPiAgICAgICAgICAgICAgZHN0
LnZhbCA9IHNyYy52YWw7Cj4gICAgICAgICAgYnJlYWs7Cj4gIAo+ICsgICAgY2FzZSBYODZFTVVM
X09QQ19WRVgoMHgwZiwgMHg0YSk6ICAgIC8qIGthZGR7dyxxfSBrLGssayAqLwo+ICsgICAgICAg
IGlmICggIXZleC53ICkKPiArICAgICAgICAgICAgaG9zdF9hbmRfdmNwdV9tdXN0X2hhdmUoYXZ4
NTEyZHEpOwoKV2h5IGlzIHRoaXMga2FkZCBoYW5kbGVkIGRpZmZlcmVudGx5P8KgIEFzIGZhciBh
cyBJIGNhbiB0ZWxsIGZyb20gdGhlCm1hbnVhbCwgaXRzIGVuY29kaW5nIGxvb2tzIHRvIGJlIGNv
bnNpc3RlbnQuCgpJJ20gYWZyYWlkIHRoYXQgSSdtIGdvaW5nIHRvIGhhdmUgdG8gc3RhcmUgYXQg
dGhlIG1hbnVhbCBhIGJpdCBtb3JlCmJlZm9yZSBJIGNhbiByZXZpZXcgdGhlIHJlc3Qgb2YgdGhp
cyBwYXRjaC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
