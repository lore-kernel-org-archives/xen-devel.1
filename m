From: Andre Przywara <andre.przywara@linaro.org>
Subject: Re: [RFC PATCH 31/49] ARM: new VGIC: Add PENDING
	registers handlers
Date: Fri, 2 Mar 2018 16:36:22 +0000
Message-ID: <b694c040-63d1-7da8-b454-f7f5dcd9c9cb@linaro.org>
References: <20180209143937.28866-1-andre.przywara@linaro.org>
 <20180209143937.28866-32-andre.przywara@linaro.org>
 <41a0968b-d221-6447-6e04-940fd95d4d02@arm.com>
 <b1a4d914-cbf3-41b4-4fa3-5c7f1256c0da@linaro.org>
 <80bb4302-81c2-adef-b640-2c8b6596b70e@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=dyoi=fy=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1ernfd-00089b-1b
 for xen-devel@lists.xenproject.org; Fri, 02 Mar 2018 16:36:33 +0000
Received: by mail-wm0-x22a.google.com with SMTP id a20so3702449wmd.1
 for <xen-devel@lists.xenproject.org>; Fri, 02 Mar 2018 08:36:31 -0800 (PST)
In-Reply-To: <80bb4302-81c2-adef-b640-2c8b6596b70e@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxOS8wMi8xOCAxNTo0MywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IAo+IAo+IE9uIDE5
LzAyLzE4IDE1OjMyLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToKPj4gSGksCj4gCj4gSGkgQW5kcmUs
Cj4gCj4+IE9uIDE2LzAyLzE4IDE3OjE2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBPbiAwOS8w
Mi8xOCAxNDozOSwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgLyog
TG9vcCBvdmVyIGFsbCBJUlFzIGFmZmVjdGVkIGJ5IHRoaXMgcmVhZCAqLwo+Pj4+ICvCoMKgwqAg
Zm9yICggaSA9IDA7IGkgPCBsZW4gKiA4OyBpKysgKQo+Pj4+ICvCoMKgwqAgewo+Pj4+ICvCoMKg
wqDCoMKgwqDCoCBzdHJ1Y3QgdmdpY19pcnEgKmlycSA9IHZnaWNfZ2V0X2lycSh2Y3B1LT5kb21h
aW4sIHZjcHUsIGludGlkCj4+Pj4gKyBpKTsKPj4+PiArCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlm
ICggaXJxX2lzX3BlbmRpbmcoaXJxKSApCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmFs
dWUgfD0gKDFVIDw8IGkpOwo+Pj4KPj4+IERvbid0IHlvdSBuZWVkIHRvIHByb3BhZ2F0ZSB0aGUg
dmFsdWUgdG8gdGhlIGhhcmR3YXJlIGZvciB2aXJ0dWFsCj4+PiBpbnRlcnJ1cHQgbWFwcGVkIHRv
IHBoeXNpY2FsIGludGVycnVwdD8KPj4KPj4gRG8geW91IG1lYW4gaW4gdGhlIHdyaXRlIGZ1bmN0
aW9ucyBiZWxvdz8gKFRoaXMgaXMgdGhlIHJlYWQgZnVuY3Rpb24sIEkKPj4gZG9uJ3Qgc2VlIGhv
dyB0aGlzIHdvdWxkIGFwcGx5IGhlcmUuKQo+IAo+IEhtbW0geWVzLiBTb3JyeSBJIG1pc3BsYWNl
ZCB0aGUgY29tbWVudC4KPiAKPj4KPj4gSW4gY2FzZSB5b3UgbWVhbnQgdGhlIHdyaXRlX1tjc11w
ZW5kaW5nKCkgZnVuY3Rpb25zOgo+PiBJIGRvbid0IHRoaW5rIHRoaXMgbWFrZXMgdG9vIG11Y2gg
c2Vuc2UuIFdoeSB3b3VsZCB5b3Ugd2FudCB0byB0cmlnZ2VyCj4+IGFuIGhhcmR3YXJlIElSUT8g
QWxsIHlvdSB3YW50IGl0IGlzIHRvIGRlbGl2ZXIgaXQgdG8gdGhlIGd1ZXN0LCB3aGljaCBpcwo+
PiB3aGF0IHRob3NlIGZ1bmN0aW9ucyBiZWxvdyBkby4gU28gd2hhdCBkbyBJIG1pc3MgaGVyZT8K
PiAKPiBJbWFnaW5lIHlvdSBjbGVhciB0aGUgcGVuZGluZyBiaXQgb24gYW4gaGFyZHdhcmUgbWFw
cGVkIGludGVycnVwdC4gSWYKPiB5b3UgbmV2ZXIgY2xlYXIgdGhlIGFjdGl2ZSBiaXQgb24gdGhl
IHBoeXNpY2FsIG9uZSwgeW91IHdpbGwgbmV2ZXIKPiByZWNlaXZlIHRoYXQgaW50ZXJydXB0IGFn
YWluLgo+IAo+IEZvciBzZXR0aW5nIHBlbmRpbmcgYml0LCBJIGFtIG5vdCBlbnRpcmVseSBzdXJl
LiBCdXQgaXQgbG9va3MgbGlrZSBLVk0KPiBpcyBkb2luZyBpdCAoc2VlIGxhdGVzdCBtYXN0ZXIp
LiBTbyBJIGFtIHdvbmRlcmluZyB3aHkgWGVuIGlzIGRpdmVyZ2luZwo+IGhlcmUuCgpUaGUgc2lt
cGxlIHJlYXNvbiBpcyB0aGF0ICJsYXRlc3QgbWFzdGVyIiB3YXMgc29tZXRoaW5nIGRpZmZlcmVu
dCB3aGVuIEkKaW1wb3J0ZWQgdGhlIFZHSUMsIG9idmlvdXNseS4gU28gdGhpcyB3YXMgYSBsYXRl
ciBhZGRpdGlvbi4gSSBub3cgcG9ydGVkCnRoaXMgbmV3IHBhdGNoIG92ZXIsIHRob3VnaCBkdWUg
dG8gdGhlIGxvY2tpbmcgb3JkZXIgb2YgdGhlIGRlc2MgbG9jawp0aGlzIGlzbid0IHNvIHByZXR0
eSAoYnV0IHN0aWxsIG5vdCB0b28gYmFkKS4gQnV0IGFjdHVhbGx5IHRoaXMgZnVuY3Rpb24Kc2hv
dWxkIGJlIGV4dHJlbWVseSByYXJlLCB1cCB0byB0aGUgcG9pbnQgdGhhdCBJIGN1cnJlbnRseSBj
YW5ub3QgdGVzdAp0aGlzIGVhc2lseS4KCkNoZWVycywKQW5kcmUuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
