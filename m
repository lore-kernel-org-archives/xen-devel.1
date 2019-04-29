From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v3 1/4] x86/mem_sharing: reorder when pages
 are unlocked and released
Date: Mon, 29 Apr 2019 16:52:06 +0100
Message-ID: <4b3607ed-5596-496b-f6a6-19548703b773@citrix.com>
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <5CC711DC020000780022A111@prv1-mh.provo.novell.com>
 <CABfawhnxZA5+FXj5uRb59sJ9RGm71uC0MHv4=J5PGfejXiX2qg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uN3R=S7=citrix.com=prvs=015486667=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hL8Zm-0001lM-JU
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 15:52:18 +0000
In-Reply-To: <CABfawhnxZA5+FXj5uRb59sJ9RGm71uC0MHv4=J5PGfejXiX2qg@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gNC8yOS8xOSA0OjQxIFBNLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gT24gTW9uLCBBcHIg
MjksIDIwMTkgYXQgOTowMSBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3Rl
Ogo+Pgo+Pj4+PiBPbiAyNi4wNC4xOSBhdCAxOToyMSwgPHRhbWFzQHRrbGVuZ3llbC5jb20+IHdy
b3RlOgo+Pj4gQEAgLTk5OSw2ICs5OTYsMTAgQEAgc3RhdGljIGludCBzaGFyZV9wYWdlcyhzdHJ1
Y3QgZG9tYWluICpzZCwgZ2ZuX3Qgc2dmbiwgc2hyX2hhbmRsZV90IHNoLAo+Pj4gICAgICBtZW1f
c2hhcmluZ19wYWdlX3VubG9jayhzZWNvbmRwZyk7Cj4+PiAgICAgIG1lbV9zaGFyaW5nX3BhZ2Vf
dW5sb2NrKGZpcnN0cGcpOwo+Pj4KPj4+ICsgICAgQlVHX09OKCFwdXRfY291bnQpOwo+Pj4gKyAg
ICB3aGlsZSAoIHB1dF9jb3VudC0tICkKPj4+ICsgICAgICAgIHB1dF9wYWdlX2FuZF90eXBlKGNw
YWdlKTsKPj4+ICsKPj4+ICAgICAgLyogRnJlZSB0aGUgY2xpZW50IHBhZ2UgKi8KPj4+ICAgICAg
aWYodGVzdF9hbmRfY2xlYXJfYml0KF9QR0NfYWxsb2NhdGVkLCAmY3BhZ2UtPmNvdW50X2luZm8p
KQo+Pj4gICAgICAgICAgcHV0X3BhZ2UoY3BhZ2UpOwo+Pgo+PiBJZiB0aGlzIHdhcyB0byBoYXBw
ZW4gYmVmb3JlIGFsbCB0aGUgcHV0X3BhZ2VfYW5kX3R5cGUoKSBjYWxscywKPj4gd291bGRuJ3Qg
aXQgcmVuZGVyIHVubmVjZXNzYXJ5IHRoZSBleHRyYSBnZXRfcGFnZSgpL3B1dF9wYWdlKCkKPj4g
YXJvdW5kIHRoaXMgY29kZSByZWdpb24/Cj4gCj4gSXQgd291bGQgLSBJIGFscmVhZHkgc2VudCBh
IHZlcnNpb24gb2YgdGhlIHBhdGNoIGluIHRoYXQgZm9ybSBidXQKPiB0aGVyZSB3YXMgdW5lYXNl
IGV4cHJlc3NlZCBieSBHZW9yZ2UgZ29pbmcgdGhhdCByb3V0ZSBiZWNhdXNlIG9mIHRoZQo+IGNv
bXBsZXhpdHkgb2YgdGhlIGNvZGUgYW5kIGluIGhpcyB2aWV3IGl0J3MgdGhlIHNhZmUgYmV0IHRv
IGtlZXAgdGhlCj4gZXh0cmEgcmVmZXJlbmNlcy4gSSB0aGluayB0aGUgb3ZlcmhlYWQgb2YgZ3Jh
YmJpbmcgdGhlIGV4dHJhCj4gcmVmZXJlbmNlcyBpcyBuZWdsaWdpYmxlIGVub3VnaCB0aGF0IEkn
bSBub3QgZ29pbmcgdG8gYXJndWUgb3ZlciBpdC4KCkVyLCB0aGF0J3Mgbm90IHdoYXQgSSBzYWlk
LiA6LSkKCkkgZ2F2ZSBmb3VyIHBvc3NpYmxlIG9wdGlvbnMsICpvbmUqIG9mIHdoaWNoIHdhcyB0
byBjaGFuZ2UgdGhlIEFTU0VSVCgpCnRvIGEgQlVHX09OKCksIGFuZCAqb25lKiBvZiB3aGljaCB3
YXMgdG8ga2VlcCB0aGUgKHByb2JhYmx5IHJlZHVuZGFudCkKZ2V0X3BhZ2UoKSBhbmQgcHV0X3Bh
Z2UoKSBjYWxscy4gIFlvdSBhcHBlYXIgdG8gaGF2ZSBkb25lIGJvdGguIDotKQoKSSBoYXZlbid0
IHJlLWdyb2trZWQgdGhlIGNvZGUgaGVyZSwgYnV0IGFzc3VtaW5nIEkgd2FzIGNvcnJlY3QgMiB3
ZWVrcwphZ28sIGlmIHlvdSBoYXZlIHRoZSBCVUdfT04oKSB0aGVyZSwgeW91IGNhbiBnZXQgcmlk
IG9mIHRoZSBleHRyYQpyZWZlcmVuY2VzLgoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
