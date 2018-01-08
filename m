From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 11/22] vixen: early initialization of Vixen
 including shared_info mapping
Date: Mon, 8 Jan 2018 09:55:53 +0000
Message-ID: <20180108095553.wowijihbu6hyvha4@MacBook-Pro-de-Roger.local>
References: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
 <1515279277-16301-12-git-send-email-aliguori@amzn.com>
 <20180107082311.xuadwwfooaf2xyku@MacBook-Pro-de-Roger.local>
 <CA+aC4ksxAzsLY4_v_X85pt7SGo7dqMQqWa3rYVZxs4nG=O9r8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=q3al=ed=citrix.com=prvs=539ca8c7b=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eYU9z-0004B1-6y
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 09:56:03 +0000
Content-Disposition: inline
In-Reply-To: <CA+aC4ksxAzsLY4_v_X85pt7SGo7dqMQqWa3rYVZxs4nG=O9r8A@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Liguori <anthony@codemonkey.ws>
Cc: Anthony Liguori <aliguori@amzn.com>, Wei Liu <wei.liu2@citrix.com>, Matt Wilson <msw@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan =?iso-8859-1?Q?H=2E_Sch=F6nherr?= <jschoenh@amazon.de>, Anthony Liguori <aliguori@amazon.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBKYW4gMDcsIDIwMTggYXQgMDc6MzM6MDZBTSAtMDgwMCwgQW50aG9ueSBMaWd1b3Jp
IHdyb3RlOgo+IE9uIFN1biwgSmFuIDcsIDIwMTggYXQgMTI6MjMgQU0sIFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToKPiA+IE9uIFNhdCwgSmFuIDA2LCAyMDE4
IGF0IDAyOjU0OjI2UE0gLTA4MDAsIEFudGhvbnkgTGlndW9yaSB3cm90ZToKPiA+PiBGcm9tOiBB
bnRob255IExpZ3VvcmkgPGFsaWd1b3JpQGFtYXpvbi5jb20+Cj4gPj4gKyAgICByYyA9IEhZUEVS
VklTT1JfbWVtb3J5X29wKFhFTk1FTV9hZGRfdG9fcGh5c21hcCwgJnhhdHApOwo+ID4+ICsgICAg
aWYgKCByYyA8IDAgKQo+ID4+ICsgICAgICAgIHByaW50aygiU2V0dGluZyBzaGFyZWQgaW5mbyBw
YWdlIGZhaWxlZDogJWxkXG4iLCByYyk7Cj4gPj4gKwo+ID4+ICsgICAgbWVtc2V0KCZnbG9iYWxf
c2ktPm5hdGl2ZS5ldnRjaG5fbWFza1swXSwgMHgwMCwKPiA+PiArICAgICAgICAgICBzaXplb2Yo
Z2xvYmFsX3NpLT5uYXRpdmUuZXZ0Y2huX21hc2spKTsKPiA+Cj4gPiBIbSwgSSdtIG5vdCBzdXJl
IEkgbGlrZSB0byBhcHByb2FjaCBvZiB1bm1hc2tpbmcgZXZlcnl0aGluZy4gSU1ITyBJCj4gPiB3
b3VsZCByYXRoZXIgbWFzayBldmVyeXRoaW5nIGFuZCB1bm1hc2sgdGhlbSB3aGVuIHRoZSBndWVz
dCBhY3R1YWxseQo+ID4gYmluZHMgdGhlIGV2ZW50IGNoYW5uZWwuIFRoYXQgbWFrZXMgc3VyZSB0
aGF0IGFuIGludGVycnVwdCB3aWxsIGdldAo+ID4gaW5qZWN0ZWQgd2hlbiB0aGUgZXZlbnQgY2hh
bm5lbCBpcyB1bm1hc2tlZCAoaWYgdGhlcmUncyBhbiBldmVudAo+ID4gcGVuZGluZykuCj4gCj4g
VGhpcyBpcyBkb25lIGluIGh2bWxvYWRlciBhbmQgd2UgZGlzY292ZXJlZCB0aGF0IGd1ZXN0cyBy
ZWx5IG9uIGl0Lgo+IFNlZSBodm1sb2FkZXIveGVuYnVzLmM6eGVuYnVzX3NodXRkb3duKCkuCgpC
dXQgdGhhdCdzIHNvbWV0aGluZyBjb21wbGV0ZWx5IGRpZmZlcmVudC4gVGhlcmUgaHZtbG9hZGVy
IGlzCnJlc2V0dGluZyBldmVyeXRoaW5nIHNvIHRoZSBndWVzdCBmaW5kcyBpdCBpbiBhIHByb3Bl
ciBzdGF0ZQooaHZtbG9hZGVyIGlzIGhhbmRsaW5nIHRoZSBzaGFyZWRfaW5mbyBwYWdlIHRvIHRo
ZSBndWVzdCBrZXJuZWwpLiBIZXJlCnZpeGVuIGlzIG5vdCBzaGFyaW5nIHRoZSBzaGFyZWRfaW5m
byBwYWdlIHdpdGggdGhlIGd1ZXN0ICh0aGlzIGlzCmp1c3QgdXNlZCBieSB2aXhlbiksIGFuZCBo
ZW5jZSBJIHdvdWxkIGRvIHRoZSBvcHBvc2l0ZTogbWFzawpldmVyeXRoaW5nIGFuZCB1bm1hc2sg
dGhlIGV2ZW50IGNoYW5uZWxzIHRoYXQgdGhlIGd1ZXN0IGlzIGFjdHVhbGx5CnVzaW5nLgoKUm9n
ZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
