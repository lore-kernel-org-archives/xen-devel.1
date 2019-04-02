From: Pu Wen <puwen@hygon.cn>
Subject: Re: [PATCH v4 04/15] x86/cpu/vpmu: Add Hygon Dhyana and
 AMD Zen support for vPMU
Date: Tue, 2 Apr 2019 14:46:04 +0800
Message-ID: <d6a0d0a4-4da2-fb62-3231-3c7da379f5a8@hygon.cn>
References: <cover.1553935727.git.puwen@hygon.cn>
 <e82e93b090e004d2b9a679d656de96ca915e92da.1553935727.git.puwen@hygon.cn>
 <5CA1CD49020000780022376C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tiqP=SE=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1hBDGr-0005NP-7q
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2019 06:51:45 +0000
In-Reply-To: <5CA1CD49020000780022376C@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOS80LzEgMTY6MzYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDMwLjAzLjE5IGF0IDEx
OjQyLCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+PiBAQCAtODc2LDYgKzg3NywxMCBAQCBzdGF0
aWMgaW50IF9faW5pdCB2cG11X2luaXQodm9pZCkKPj4gICAgICAgICAgIGlmICggYW1kX3ZwbXVf
aW5pdCgpICkKPj4gICAgICAgICAgICAgIHZwbXVfbW9kZSA9IFhFTlBNVV9NT0RFX09GRjsKPj4g
ICAgICAgICAgIGJyZWFrOwo+PiArICAgIGNhc2UgWDg2X1ZFTkRPUl9IWUdPTjoKPj4gKyAgICAg
ICAgaWYgKCBoeWdvbl92cG11X2luaXQoKSApCj4+ICsgICAgICAgICAgIHZwbXVfbW9kZSA9IFhF
TlBNVV9NT0RFX09GRjsKPj4gKyAgICAgICAgYnJlYWs7Cj4+ICAgICAgIGNhc2UgWDg2X1ZFTkRP
Ul9JTlRFTDoKPj4gICAgICAgICAgIGlmICggY29yZTJfdnBtdV9pbml0KCkgKQo+PiAgICAgICAg
ICAgICAgdnBtdV9tb2RlID0gWEVOUE1VX01PREVfT0ZGOwo+IAo+IFdoaWxlIEkgcmVhbGl6ZSB0
aGV5J3JlIG1pc3NpbmcgcmlnaHQgbm93LCBJIHdvdWxkIGhhdmUgYXBwcmVjaWF0ZWQKPiBpZiB5
b3UgaGFkIHRha2VuIHRoZSBvcHBvcnR1bml0eSB0byBhZGQgdGhlIG1pc3NpbmcgYmxhbmsgbGlu
ZXMKPiBiZXR3ZWVuIGNhc2UgYmxvY2tzIGhlcmUuCgpPa2F5LCB3aWxsIGFkZCB0aGUgbWlzc2lu
ZyBibGFuayBsaW5lcyBpbiBuZXh0IHZlcnNpb24gcGF0Y2ggc2VyaWVzLgoKPj4gLS0tIGEveGVu
L2FyY2gveDg2L2NwdS92cG11X2FtZC5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvdnBtdV9h
bWQuYwo+PiBAQCAtNTM4LDI4ICs1MzgsMTIgQEAgaW50IHN2bV92cG11X2luaXRpYWxpc2Uoc3Ry
dWN0IHZjcHUgKnYpCj4+ICAgICAgIHJldHVybiAwOwo+PiAgIH0KPj4gICAKPj4gLWludCBfX2lu
aXQgYW1kX3ZwbXVfaW5pdCh2b2lkKQo+PiArc3RhdGljIGludCBjb21tb25faW5pdCh2b2lkKQo+
IAo+IF9faW5pdAoKT2theSwgd2lsbCBhZGQgaXQgaW4gZnJvbnQgb2YgaW50LgoKPj4gICB7Cj4+
ICAgICAgIHVuc2lnbmVkIGludCBpOwo+PiAgIAo+PiAtICAgIHN3aXRjaCAoIGN1cnJlbnRfY3B1
X2RhdGEueDg2ICkKPj4gKyAgICBpZiAoIW51bV9jb3VudGVycykKPiAKPiBTdHlsZSAobWlzc2lu
ZyBibGFua3MpLgoKV2lsbCBhZGQgdGhlIG1pc3NpbmcgYmxhbmtzLgoKPj4gKyAgICBjYXNlIDB4
MTc6Cj4+ICsgICAgICAgIG51bV9jb3VudGVycyA9IEYxNUhfTlVNX0NPVU5URVJTOwo+PiArICAg
ICAgICBjb3VudGVycyA9IEFNRF9GMTVIX0NPVU5URVJTOwo+PiArICAgICAgICBjdHJscyA9IEFN
RF9GMTVIX0NUUkxTOwo+PiArICAgICAgICBrN19jb3VudGVyc19taXJyb3JlZCA9IDE7Cj4+ICsg
ICAgICAgIGJyZWFrOwo+PiArICAgIGNhc2UgMHgxMDoKPiAKPiBTYW1lIGFzIGFib3ZlLgoKV2ls
bCBhZGQgYSBibGFuayBsaW5lIG9uIHRvcCBvZiAiY2FzZSAweDEwIi4KCj4gSSB3b24ndCBpbnNp
c3Qgb24gdGhlIGZpcnN0IGl0ZW0gZ2V0dGluZyBhZGRyZXNzZWQsIGJ1dCB0aGUgb3RoZXIKPiB0
aHJlZSBzaG91bGQgYmUuIFRoZXkncmUgYWxsIG1lY2hhbmljYWwsIHNvIGNvdWxkIGJlIGRvbmUg
d2hpbGUKPiBjb21taXR0aW5nLCBhbmQgd2l0aCB0aGVtIGluIHBsYWNlCj4gQWNrZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClRoYW5rcy4KCi0tIApSZWdhcmRzLApQdSBX
ZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
