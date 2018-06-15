From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC] xen: Don't use
 memory_region_init_ram_nomigrate() in pci_assign_dev_load_option_rom()
Date: Fri, 15 Jun 2018 08:38:09 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1806150837580.14695@sstabellini-ThinkPad-X260>
References: <20180601175910.28146-1-peter.maydell@linaro.org>
 <20180605165507.GB2165@perard.uk.xensource.com>
 <CAFEAcA_X2V-YkM1ZeCHMPW3cQBk2=ZQ4BAgtcg67Eb+OuADbgQ@mail.gmail.com>
 <20180615144221.GD2165@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yj1f=jb=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fTqnk-0007vZ-Ql
 for xen-devel@lists.xenproject.org; Fri, 15 Jun 2018 15:38:12 +0000
In-Reply-To: <20180615144221.GD2165@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, "open list:X86" <xen-devel@lists.xenproject.org>, QEMU Developers <qemu-devel@nongnu.org>, "patches@linaro.org" <patches@linaro.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAxNSBKdW4gMjAxOCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gT24gRnJpLCBKdW4g
MTUsIDIwMTggYXQgMTE6MDY6NDdBTSArMDEwMCwgUGV0ZXIgTWF5ZGVsbCB3cm90ZToKPiA+IE9u
IDUgSnVuZSAyMDE4IGF0IDE3OjU1LCBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0
cml4LmNvbT4gd3JvdGU6Cj4gPiA+IE9uIEZyaSwgSnVuIDAxLCAyMDE4IGF0IDA2OjU5OjEwUE0g
KzAxMDAsIFBldGVyIE1heWRlbGwgd3JvdGU6Cj4gPiA+PiBUaGUgeGVuIHBjaV9hc3NpZ25fZGV2
X2xvYWRfb3B0aW9uX3JvbSgpIGN1cnJlbnRseSBjcmVhdGVzIGEgUkFNCj4gPiA+PiBtZW1vcnkg
cmVnaW9uIHdpdGggbWVtb3J5X3JlZ2lvbl9pbml0X3JhbV9ub21pZ3JhdGUoKSwgYW5kIHRoZW4K
PiA+ID4+IG1hbnVhbGx5IHJlZ2lzdGVycyBpdCB3aXRoIHZtc3RhdGVfcmVnaXN0ZXJfcmFtKCku
IEluIGZhY3QgZm9yCj4gPiA+PiBpdHMgb25seSBjYWxsc2l0ZSwgdGhlICdvd25lcicgcG9pbnRl
ciB3ZSB1c2UgZm9yIHRoZSBpbml0IGNhbGwKPiA+ID4+IGFuZCB0aGUgJyZkZXYtPnFkZXYnIHBv
aW50ZXIgd2UgdXNlIGZvciB0aGUgdm1zdGF0ZV9yZWdpc3Rlcl9yYW0oKQo+ID4gPj4gY2FsbCBy
ZWZlciB0byB0aGUgc2FtZSBvYmplY3QuIFNpbXBsaWZ5IHRoZSBmdW5jdGlvbiB0byBvbmx5Cj4g
PiA+PiB0YWtlIGEgcG9pbnRlciB0byB0aGUgZGV2aWNlIG9uY2UgaW5zdGVhZCBvZiB0d2ljZSwg
YW5kIHVzZQo+ID4gPj4gbWVtb3J5X3JlZ2lvbl9pbml0X3JhbSgpIHdoaWNoIGF1dG9tYXRpY2Fs
bHkgZG9lcyB0aGUgdm1zdGF0ZQo+ID4gPj4gcmVnaXN0ZXIgZm9yIHVzLgo+ID4gPj4KPiA+ID4+
IFNpZ25lZC1vZmYtYnk6IFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4K
PiA+ID4+IC0tLQo+ID4gPj4gVGhpcyBpcyBhIGZhaXJseSB0cml2aWFsIG5vLWJlaGF2aW91ci1j
aGFuZ2UgY29kZSBjbGVhbnVwLCBidXQKPiA+ID4+IEkndmUgbWFya2VkIGl0IGFzIFJGQyBiZWNh
dXNlIEkgZG9uJ3QgaGF2ZSBhIHNldHVwIGZvciBkb2luZwo+ID4gPj4gbW9yZSB0aGFuIGp1c3Qg
Y29tcGlsZS10ZXN0aW5nIFhlbiByZWxhdGVkIHBhdGNoZXMuCj4gPiA+PiBUaGlzIHdhcyBmb3Vu
ZCBhcyBwYXJ0IG9mIGEgc3dlZXAgdGhyb3VnaCBmb3IgY29kZSB1c2luZwo+ID4gPj4gdGhlIF9u
b21pZ3JhdGUgdmVyc2lvbnMgb2YgZnVuY3Rpb25zLgo+ID4gPgo+ID4gPiBUaGF0IHBhdGNoIGxv
b2tzIGZpbmUsIGFuZCBzZWFtcyBmaW5lIGFmdGVyIGhhY2tpbmcgbXkgd2F5IGludG8gdGVzdGlu
Zwo+ID4gPiB0aGUgY2hhbmdlLgo+ID4gPgo+ID4gPiBBY2tlZC1ieTogQW50aG9ueSBQRVJBUkQg
PGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gPiAKPiA+IFRoYW5rcyBmb3IgdGhlIHJldmll
dy4gU3RlZmFubywgZG8geW91IHdhbnQgdG8gdGFrZSBpdCB2aWEgdGhlCj4gPiB4ZW4gc3VidHJl
ZT8KPiAKPiBIaSBQZXRlciwKPiAKPiBXZSBkb24ndCBoYXZlIGFueSBvdGhlciBwYXRjaCBmb3Ig
eGVuLCBzbyBmZWVsIGZyZWUgdG8gY29tbWl0IHRoaXMKPiBvbmUuCgpZZXAsIGdvIGFoZWFkCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
