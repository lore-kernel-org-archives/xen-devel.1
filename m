From: Andre Przywara <andre.przywara@linaro.org>
Subject: Re: [PATCH 31/57] ARM: new VGIC: Add IRQ sync/flush
	framework
Date: Wed, 7 Mar 2018 12:20:41 +0000
Message-ID: <3b36931b-8d76-6343-7a9a-1de8e7e84765@linaro.org>
References: <20180305160415.16760-1-andre.przywara@linaro.org>
 <20180305160415.16760-32-andre.przywara@linaro.org>
 <b93a06a5-6721-4de1-2bf4-d6ccae32b2c7@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ecuc=f5=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1etY3w-0007uu-BM
 for xen-devel@lists.xenproject.org; Wed, 07 Mar 2018 12:20:52 +0000
Received: by mail-wm0-x22f.google.com with SMTP id t3so4391061wmc.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Mar 2018 04:20:50 -0800 (PST)
In-Reply-To: <b93a06a5-6721-4de1-2bf4-d6ccae32b2c7@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwNy8wMy8xOCAxMTo0NywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEFuZHJlLAo+
IAo+IE9uIDAzLzA1LzIwMTggMDQ6MDMgUE0sIEFuZHJlIFByenl3YXJhIHdyb3RlOgo+PiBJbXBs
ZW1lbnQgdGhlIGZyYW1ld29yayBmb3Igc3luY2luZyBJUlFzIGJldHdlZW4gb3VyIGVtdWxhdGlv
biBhbmQgdGhlCj4+IGxpc3QgcmVnaXN0ZXJzLCB3aGljaCByZXByZXNlbnQgdGhlIGd1ZXN0J3Mg
dmlldyBvZiBJUlFzLgo+PiBUaGlzIGlzIGRvbmUgaW4ga3ZtX3ZnaWNfZmx1c2hfaHdzdGF0ZSBh
bmQga3ZtX3ZnaWNfc3luY19od3N0YXRlLCB3aGljaAo+IAo+IFlvdSBwcm9iYWJseSB3YW50IHRv
IHVwZGF0ZSB0aGUgbmFtZXMgaGVyZS4KPiAKPj4gZ2V0cyBjYWxsZWQgb24gZ3Vlc3QgZW50cnkg
YW5kIGV4aXQuCj4+IFRoZSBjb2RlIHRhbGtpbmcgdG8gdGhlIGFjdHVhbCBHSUN2Mi92MyBoYXJk
d2FyZSBpcyBhZGRlZCBpbiB0aGUKPj4gZm9sbG93aW5nIHBhdGNoZXMuCj4+Cj4+IFRoaXMgaXMg
YmFzZWQgb24gTGludXggY29tbWl0IDA5MTllODRjMGZjMSwgd3JpdHRlbiBieSBNYXJjIFp5bmdp
ZXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJlIFByenl3YXJhIDxhbmRyZS5wcnp5d2FyYUBs
aW5hcm8ub3JnPgo+IAo+IFsuLi5dCj4gCj4+ICsvKioKPj4gKyAqIHZnaWNfc3luY19mcm9tX2xy
cygpIC0gVXBkYXRlIFZHSUMgc3RhdGUgZnJvbSBoYXJkd2FyZSBhZnRlciBhCj4+IGd1ZXN0J3Mg
cnVuLgo+PiArICogQHZjcHU6IHRoZSBWQ1BVIGZvciB3aGljaCB0byB0cmFuc2ZlciBmcm9tIHRo
ZSBMUnMgdG8gdGhlIElSUSBsaXN0Lgo+PiArICoKPj4gKyAqIFN5bmMgYmFjayB0aGUgaGFyZHdh
cmUgVkdJQyBzdGF0ZSBhZnRlciB0aGUgZ3Vlc3QgaGFzIHJ1biwgaW50byBvdXIKPj4gKyAqIFZH
SUMgZW11bGF0aW9uIHN0cnVjdHVyZXMsIEl0IHJlYWRzIHRoZSBMUnMgYW5kIHVwZGF0ZXMgdGhl
Cj4+IHJlc3BlY3RpdmUKPj4gKyAqIHN0cnVjdCB2Z2ljX2lycSwgdGFraW5nIGxldmVsL2VkZ2Ug
aW50byBhY2NvdW50Lgo+PiArICogVGhpcyBpcyB0aGUgaGlnaCBsZXZlbCBmdW5jdGlvbiB3aGlj
aCB0YWtlcyBjYXJlIG9mIHRoZSBjb25kaXRpb25zLAo+PiArICogYWxzbyBiYWlscyBvdXQgZWFy
bHkgaWYgdGhlcmUgd2VyZSBubyBpbnRlcnJ1cHRzIHF1ZXVlZC4KPj4gKyAqIFdhczoga3ZtX3Zn
aWNfc3luY19od3N0YXRlKCkKPj4gKyAqLwo+PiArdm9pZCB2Z2ljX3N5bmNfZnJvbV9scnMoc3Ry
dWN0IHZjcHUgKnZjcHUpCj4+ICt7Cj4+ICvCoMKgwqAgLyogQW4gZW1wdHkgYXBfbGlzdF9oZWFk
IGltcGxpZXMgdXNlZF9scnMgPT0gMCAqLwo+PiArwqDCoMKgIGlmICggbGlzdF9lbXB0eSgmdmNw
dS0+YXJjaC52Z2ljLmFwX2xpc3RfaGVhZCkgKQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+
PiArCj4+ICvCoMKgwqAgdmdpY19mb2xkX2xyX3N0YXRlKHZjcHUpOwo+IAo+IE9PSSwgd2h5IGRp
ZCB5b3UgZHJvcCB0aGUgImlmICh2Z2ljX2NwdS0+dXNlZF9scnMpIiBoZXJlPyBJdCBsb29rcyBs
aWtlCj4gdG8gbWUgeW91IHdhbnQgdG8gYXZvaWQgY2FsbGluZyB0aGF0IGZ1bmN0aW9uIHdoZW4g
bm8gTFJzIGFyZSBiZWVuIHVzZWQuCgpUaGlzIGlzIG5vdyBkb25lIGluIHRoZSBmdW5jdGlvbiBp
dHNlbGYuIEkgZm91bmQgaXQgY2xlYW5lciB0aGlzIHdheS4gSQpiZWxpZXZlIHdlIHdpbGwgc2Vl
IHRoZSBhY3R1YWwgaW1wbGVtZW50YXRpb24gb2YgdmdpY19mb2xkX2xyX3N0YXRlKCkKbW92ZSBp
bnRvIHRoaXMgdmVyeSBmaWxlIGhlcmUsIHNvIGl0IHNob3VsZG4ndCBtYWtlIGEgZGlmZmVyZW5j
ZS4KCkNoZWVycywKQW5kcmUuCgo+PiArCj4+ICvCoMKgwqAgdmdpY19wcnVuZV9hcF9saXN0KHZj
cHUpOwo+PiArfQo+IAo+IENoZWVycywKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
