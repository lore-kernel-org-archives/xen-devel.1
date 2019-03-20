From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] xen,
 fbfront: mark expected switch fall-through
Date: Wed, 20 Mar 2019 15:08:06 -0500
Message-ID: <6675f2ed-6916-2be5-fb60-39c9436f53f7__3512.5730604463$1553112549$gmane$org@embeddedor.com>
References: <20190227205303.GA1231@embeddedor>
 <f8ff03de-9d7c-233a-cd86-37269667db0c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=m5Fq=RX=embeddedor.com=gustavo@srs-us1.protection.inumbo.net>)
 id 1h6hVT-0000ky-Ur
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2019 20:08:11 +0000
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
 by gateway23.websitewelcome.com (Postfix) with ESMTP id 5BD9911B04
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2019 15:08:08 -0500 (CDT)
In-Reply-To: <f8ff03de-9d7c-233a-cd86-37269667db0c@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, linux-fbdev@vger.kernel.org, Kees Cook <keescook@chromium.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

SGkgYWxsLAoKRnJpZW5kbHkgcGluZzoKCldobyBjYW4gdGFrZSB0aGlzPwoKVGhhbmtzCi0tCkd1
c3Rhdm8KCk9uIDIvMjgvMTkgNTo1MSBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6
Cj4gK1hlbi1kZXZlbCBsaXN0Cj4gCj4gT24gMi8yNy8xOSAxMDo1MyBQTSwgR3VzdGF2byBBLiBS
LiBTaWx2YSB3cm90ZToKPj4gSW4gcHJlcGFyYXRpb24gdG8gZW5hYmxpbmcgLVdpbXBsaWNpdC1m
YWxsdGhyb3VnaCwgbWFyayBzd2l0Y2gKPj4gY2FzZXMgd2hlcmUgd2UgYXJlIGV4cGVjdGluZyB0
byBmYWxsIHRocm91Z2guCj4+Cj4+IFRoaXMgcGF0Y2ggZml4ZXMgdGhlIGZvbGxvd2luZyB3YXJu
aW5nOgo+Pgo+PiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3hlbi1mYmZyb250LmM6IEluIGZ1bmN0aW9u
IOKAmHhlbmZiX2JhY2tlbmRfY2hhbmdlZOKAmToKPj4gZHJpdmVycy92aWRlby9mYmRldi94ZW4t
ZmJmcm9udC5jOjY3ODo2OiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbCB0aHJvdWdo
IFstV2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KPj4gwqDCoMKgIGlmIChkZXYtPnN0YXRlID09IFhl
bmJ1c1N0YXRlQ2xvc2VkKQo+PiDCoMKgwqDCoMKgwqAgXgo+PiBkcml2ZXJzL3ZpZGVvL2ZiZGV2
L3hlbi1mYmZyb250LmM6NjgxOjI6IG5vdGU6IGhlcmUKPj4gwqDCoCBjYXNlIFhlbmJ1c1N0YXRl
Q2xvc2luZzoKPj4gwqDCoCBefn5+Cj4+Cj4+IFdhcm5pbmcgbGV2ZWwgMyB3YXMgdXNlZDogLVdp
bXBsaWNpdC1mYWxsdGhyb3VnaD0zCj4+Cj4+IE5vdGljZSB0aGF0LCBpbiB0aGlzIHBhcnRpY3Vs
YXIgY2FzZSwgdGhlIGNvZGUgY29tbWVudCBpcyBtb2RpZmllZAo+PiBpbiBhY2NvcmRhbmNlIHdp
dGggd2hhdCBHQ0MgaXMgZXhwZWN0aW5nIHRvIGZpbmQuCj4+Cj4+IFRoaXMgcGF0Y2ggaXMgcGFy
dCBvZiB0aGUgb25nb2luZyBlZmZvcnRzIHRvIGVuYWJsZQo+PiAtV2ltcGxpY2l0LWZhbGx0aHJv
dWdoLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVt
YmVkZGVkb3IuY29tPgo+PiAtLS0KPj4gwqAgZHJpdmVycy92aWRlby9mYmRldi94ZW4tZmJmcm9u
dC5jIHwgMiArLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYveGVuLWZiZnJvbnQu
YyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYveGVuLWZiZnJvbnQuYwo+PiBpbmRleCA2YTRiYmM5ZTFm
YjAuLmEzZDZiNmRiMjIxYiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi94ZW4t
ZmJmcm9udC5jCj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYveGVuLWZiZnJvbnQuYwo+PiBA
QCAtNjc3LDcgKzY3Nyw3IEBAIHN0YXRpYyB2b2lkIHhlbmZiX2JhY2tlbmRfY2hhbmdlZChzdHJ1
Y3QgeGVuYnVzX2RldmljZSAqZGV2LAo+PiDCoMKgwqDCoMKgIGNhc2UgWGVuYnVzU3RhdGVDbG9z
ZWQ6Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoZGV2LT5zdGF0ZSA9PSBYZW5idXNTdGF0ZUNs
b3NlZCkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+IC3CoMKgwqDCoMKg
wqDCoCAvKiBNaXNzZWQgdGhlIGJhY2tlbmQncyBDTE9TSU5HIHN0YXRlIC0tIGZhbGx0aHJvdWdo
ICovCj4+ICvCoMKgwqDCoMKgwqDCoCAvKiBmYWxsIHRocm91Z2ggLSBNaXNzZWQgdGhlIGJhY2tl
bmQncyBDTE9TSU5HIHN0YXRlLiAqLwo+PiDCoMKgwqDCoMKgIGNhc2UgWGVuYnVzU3RhdGVDbG9z
aW5nOgo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgeGVuYnVzX2Zyb250ZW5kX2Nsb3NlZChkZXYpOwo+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
