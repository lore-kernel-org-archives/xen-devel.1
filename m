From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 8/8] ARM: make nr_irqs a constant
Date: Thu, 1 Feb 2018 13:57:18 +0000
Message-ID: <20180201135718.cgbmsxiwa4og73wk@MacBook-Pro-de-Roger.local>
References: <20180124181058.6157-1-andre.przywara@linaro.org>
 <20180124181058.6157-9-andre.przywara@linaro.org>
 <20180130143603.2uzxacs2vq47oxev@MacBook-Pro-de-Roger.local>
 <ed2665f9-9c46-7df0-e372-085ece0ce766@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=tmgq=e3=citrix.com=prvs=563c9b0be=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ehFMr-0001Li-4y
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2018 13:57:33 +0000
Content-Disposition: inline
In-Reply-To: <ed2665f9-9c46-7df0-e372-085ece0ce766@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMDEsIDIwMTggYXQgMDE6NDM6MDlQTSArMDAwMCwgQW5kcmUgUHJ6eXdhcmEg
d3JvdGU6Cj4gSGksCj4gCj4gT24gMzAvMDEvMTggMTQ6MzYsIFJvZ2VyIFBhdSBNb25uw6kgd3Jv
dGU6Cj4gPiBPbiBXZWQsIEphbiAyNCwgMjAxOCBhdCAwNjoxMDo1OFBNICswMDAwLCBBbmRyZSBQ
cnp5d2FyYSB3cm90ZToKPiA+PiBPbiBBUk0gdGhlIG1heGltdW0gbnVtYmVyIG9mIElSUXMgaXMg
YSBjb25zdGFudCwgYnV0IHdlIHNoYXJlIGl0IGJlaW5nCj4gPj4gYSB2YXJpYWJsZSB0byBtYXRj
aCB4ODYuIFNpbmNlIHdlIGFyZSBub3Qgc3VwcG9zZWQgdG8gYWx0ZXIgaXQsIGxldCdzCj4gPj4g
bWFyayBpdCBhcyAiY29uc3QiIHRvIGF2b2lkIGFjY2lkZW50YWwgY2hhbmdlLgo+ID4+Cj4gPj4g
U3VnZ2VzdGVkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBsaW5hcm8ub3JnPgo+ID4+
IFNpZ25lZC1vZmYtYnk6IEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBsaW5hcm8ub3Jn
Pgo+ID4+IC0tLQo+ID4+ICB4ZW4vYXJjaC9hcm0vaXJxLmMgICAgICAgIHwgMiArLQo+ID4+ICB4
ZW4vaW5jbHVkZS9hc20tYXJtL2lycS5oIHwgMiArLQo+ID4+ICAyIGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC9hcm0vaXJxLmMgYi94ZW4vYXJjaC9hcm0vaXJxLmMKPiA+PiBpbmRleCA2MjEwM2EyMGUz
Li5kMjI5Y2I2ODcxIDEwMDY0NAo+ID4+IC0tLSBhL3hlbi9hcmNoL2FybS9pcnEuYwo+ID4+ICsr
KyBiL3hlbi9hcmNoL2FybS9pcnEuYwo+ID4+IEBAIC0yNyw3ICsyNyw3IEBACj4gPj4gICNpbmNs
dWRlIDxhc20vZ2ljLmg+Cj4gPj4gICNpbmNsdWRlIDxhc20vdmdpYy5oPgo+ID4+ICAKPiA+PiAt
dW5zaWduZWQgaW50IF9fcmVhZF9tb3N0bHkgbnJfaXJxcyA9IE5SX0lSUVM7Cj4gPj4gK2NvbnN0
IHVuc2lnbmVkIGludCBfX3JlYWRfbW9zdGx5IG5yX2lycXMgPSBOUl9JUlFTOwo+ID4gCj4gPiBT
aG91bGRuJ3QgeW91IHJlbW92ZSB0aGUgX19yZWFkX21vc3RseSBhdHRyaWJ1dGUsIHNvIHRoZSBz
eW1ib2wgaXQncwo+ID4gcGxhY2VkIGF0IHRoZSAucm9kYXRhIHNlY3Rpb24gYnkgdGhlIGNvbXBp
bGVyPwo+IAo+IFllcywgbWFrZXMgc2Vuc2UsIHRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBvdXQh
Cj4gY29uc3QgLi4uIF9fcmVhZF9tb3N0bHkgc291bmRzIHNvbWV3aGF0IHJlZHVuZGFudC4KPiAK
PiBJdCBsb29rcyBsaWtlIHRoZSBjb21waWxlciBkb2VzIHRoZSByaWdodCB0aGluZyBhbnl3YXks
IGFzIEkgY2FuJ3QgZmluZAo+IG5yX2lycXMgaW4gdGhlIEVMRiBpbiBhbnkgY2FzZS4gQm90aCB3
aXRoIGFuZCB3aXRob3V0IF9fcmVhZF9tb3N0bHkgaXQKPiByZXN1bHRzIGludG8gdGhlIHZlcnkg
c2FtZSBiaW5hcnksIGFjdHVhbGx5IGV2ZW4gd2l0aG91dCB0aGUgY29uc3QuCj4gQnV0IEkgd2ls
bCBpbmNsdWRlIHRoZSBjaGFuZ2UgYW55d2F5LgoKSG0sIHRoYXQncyBraW5kIG9mIHdlaXJkLiBu
cl9pcnFzIHNlZW1zIHRvIGJlIHVzZWQgaW4gQVJNIGNvZGUuIEhvdwpkaWQgeW91IGFzc2VydCB0
aGF0IHRoZSBzeW1ib2wgaXMgbm90IHRoZXJlPwoKVGhpcyBpcyB3aGF0IEkgZG8gb24geDg2OgoK
IyBubSB4ZW4veGVuLXN5bXMgfCBncmVwICcgbnJfaXJxcyQnCmZmZmY4MmQwODA0MzI0ZjAgRCBu
cl9pcnFzCgpXaGljaCBtYXRjaGVzIHdoYXQgSSB3b3VsZCBleHBlY3QgZnJvbSB0aGUgeDg2IGJ1
aWxkLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
