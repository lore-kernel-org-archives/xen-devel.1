From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xentrace: handle sparse cpu ids correctly
 in xen trace buffer handling
Date: Mon, 10 Sep 2018 13:34:44 +0200
Message-ID: <f1aef429-e0a8-0066-3c61-25a26f51794f@suse.com>
References: <20180830075214.11807-1-jgross@suse.com>
 <5B87AA5202000078001E3677@suse.com>
 <222d0135-0c6f-2327-2539-3479e938ec6c@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mvod=ly=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fzKSu-0004l7-8C
 for xen-devel@lists.xenproject.org; Mon, 10 Sep 2018 11:34:48 +0000
In-Reply-To: <222d0135-0c6f-2327-2539-3479e938ec6c@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDgvMTggMTE6MjgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMzAvMDgvMTggMTA6
MjYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAzMC4wOC4xOCBhdCAwOTo1MiwgPGpncm9z
c0BzdXNlLmNvbT4gd3JvdGU6Cj4+PiBAQCAtMjAyLDcgKzIwMiw3IEBAIHN0YXRpYyBpbnQgYWxs
b2NfdHJhY2VfYnVmcyh1bnNpZ25lZCBpbnQgcGFnZXMpCj4+PiAgICAgICAqIEFsbG9jYXRlIGJ1
ZmZlcnMgZm9yIGFsbCBvZiB0aGUgY3B1cy4KPj4+ICAgICAgICogSWYgYW55IGZhaWxzLCBkZWFs
bG9jYXRlIHdoYXQgeW91IGhhdmUgc28gZmFyIGFuZCBleGl0Lgo+Pj4gICAgICAgKi8KPj4+IC0g
ICAgZm9yX2VhY2hfb25saW5lX2NwdShjcHUpCj4+PiArICAgIGZvcl9lYWNoX3ByZXNlbnRfY3B1
KGNwdSkKPj4+ICAgICAgewo+Pj4gICAgICAgICAgb2Zmc2V0ID0gdF9pbmZvX2ZpcnN0X29mZnNl
dCArIChjcHUgKiBwYWdlcyk7Cj4+PiAgICAgICAgICB0X2luZm8tPm1mbl9vZmZzZXRbY3B1XSA9
IG9mZnNldDsKPj4KPj4gRG9lc24ndCB0aGlzIGdvIGEgbGl0dGxlIHRvbyBmYXI/IFdoeSB3b3Vs
ZCB5b3UgYWxsb2NhdGUgYnVmZmVycyBmb3IgQ1BVcwo+PiB3aGljaCBjYW4gbmV2ZXIgYmUgYnJv
dWdodCBvbmxpbmU/IFRoZXJlIG91Z2h0IHRvIGJlIGEgbWlkZGxlIGdyb3VuZCwKPj4gd2hlcmUg
b25saW5lLWFibGUgQ1BVcyBoYXZlIGJ1ZmZlcnMgYWxsb2NhdGVkLCBidXQgbm9uLW9ubGluZS1h
YmxlIG9uZXMKPj4gd29uJ3QuIE9uIGxhcmdlciBzeXN0ZW1zIEkgZ3Vlc3MgdGhlIGRpZmZlcmVu
Y2UgbWF5IGJlIHF1aXRlIG5vdGljYWJsZS4KPiAKPiBBY2NvcmRpbmcgdG8gdGhlIGNvbW1lbnRz
IGluIGluY2x1ZGUveGVuL2NwdW1hc2suaCBjcHVfcHJlc2VudF9tYXAKPiByZXByZXNlbnRzIHRo
ZSBwb3B1bGF0ZWQgY3B1cy4KPiAKPiBJIGtub3cgdGhhdCBjdXJyZW50bHkgdGhlcmUgaXMgbm8g
c3VwcG9ydCBmb3Igb25saW5pbmcgYSBwYXJrZWQgY3B1Cj4gYWdhaW4sIGJ1dCBJIHRoaW5rIGhh
dmluZyB0byB0aGluayBhYm91dCBYZW50cmFjZSBidWZmZXIgYWxsb2NhdGlvbiBpbgo+IGNhc2Ug
b25saW5pbmcgb2YgcGFya2VkIGNwdXMgaXMgYWRkZWQgd291bGQgYmUgYSBuZWFybHkgMTAwJSBj
aGFuY2UgdG8KPiBpbnRyb2R1Y2UgYSBidWcuCj4gCj4gWGVudHJhY2UgaXMgdXNlZCBmb3IgdGVz
dGluZyBwdXJwb3NlcyBvbmx5LiBTbyBJTUhPIGFsbG9jYXRpbmcgc29tZSBtb3JlCj4gbWVtb3J5
IGlzIGFjY2VwdGFibGUuCgpBcmUgeW91IGZpbmUgd2l0aCBteSByZWFzb25pbmcgb3IgZG8geW91
IHN0aWxsIHdhbnQgbWUgdG8gYXZvaWQgYnVmZmVyCmFsbG9jYXRpb24gZm9yIG9mZmxpbmUgY3B1
cz8KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
