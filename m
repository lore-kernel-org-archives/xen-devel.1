From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/physdev: Remove redundant assignment in
 allocate_and_map_msi_pirq()
Date: Fri, 20 Jul 2018 11:13:43 +0100
Message-ID: <df6a3995-140f-215c-faa5-56b5df62a9e1@citrix.com>
References: <6be2c543-bca6-4e52-870a-9ed63fd6c67f@default>
 <20180720101301.h66ypbccenhfwwev@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180720101301.h66ypbccenhfwwev@mac.bytemobile.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Zhenzhong Duan <zhenzhong.duan@oracle.com>
Cc: jbeulich@suse.com, Xen-Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDcvMTggMTE6MTMsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gRnJpLCBKdWwg
MjAsIDIwMTggYXQgMDI6Mjk6MzRBTSAtMDcwMCwgWmhlbnpob25nIER1YW4gd3JvdGU6Cj4+IE5v
IGZ1bmN0aW9uYWwgY2hhbmdlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBaaGVuemhvbmcgRHVhbiA8
emhlbnpob25nLmR1YW5Ab3JhY2xlLmNvbT4KPj4gLS0tCj4+ICB4ZW4vYXJjaC94ODYvaXJxLmMg
fCAgICAyIC0tCj4+ICAxIGZpbGVzIGNoYW5nZWQsIDAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9pcnEuYyBiL3hlbi9hcmNoL3g4
Ni9pcnEuYwo+PiBpbmRleCA4N2VmMmU4Li41MjUzZmQxIDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJj
aC94ODYvaXJxLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2lycS5jCj4+IEBAIC0yNzAxLDggKzI3
MDEsNiBAQCBpbnQgYWxsb2NhdGVfYW5kX21hcF9tc2lfcGlycShzdHJ1Y3QgZG9tYWluICpkLCBp
bnQgaW5kZXgsIGludCAqcGlycV9wLAo+PiAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4gICAg
ICB9Cj4+ICAKPj4gLSAgICBtc2ktPmlycSA9IGlycTsKPiBJIHdvdWxkIHByZWZlciB0byByZW1v
dmUgdGhlIGFzc2lnbm1lbnQgaW4gdGhlIE1BUF9QSVJRX1RZUEVfTVVMVElfTVNJCj4gY2FzZSBy
YXRoZXIgdGhhbiBoZXJlLiBJTU8gdGhpcyBvbmUgbWFrZXMgaXQgY2xlYXJlciB0aGF0IG1zaS0+
aXJxIGlzCj4gYWx3YXlzIHNldC4KCk1lIHRvby7CoCBJIGNhbiBmaXggdGhpcyB1cCBvbiBjb21t
aXQuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
