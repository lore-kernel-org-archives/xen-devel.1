From: Paul Semel <semelpaul@gmail.com>
Subject: Re: [PATCH v4 7/7] add sleep,
 msleep and NOW() macros to time manager
Date: Mon, 16 Apr 2018 12:45:17 +0200
Message-ID: <e096546f-f299-0a28-41ea-07c91dc25706@gmail.com>
References: <20180410191701.17203-1-semelpaul@gmail.com>
 <20180410191701.17203-7-semelpaul@gmail.com>
 <20180413135544.a5ravjw6khgvm4i3@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=84a7=hf=gmail.com=semelpaul@srs-us1.protection.inumbo.net>)
 id 1f81GP-0003Uz-Fu
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 10:21:33 +0000
Received: by mail-wr0-x242.google.com with SMTP id y7so24389720wrh.10
 for <xen-devel@lists.xenproject.org>; Mon, 16 Apr 2018 03:21:32 -0700 (PDT)
In-Reply-To: <20180413135544.a5ravjw6khgvm4i3@MacBook-Pro-de-Roger.local>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, wipawel@amazon.de
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMTMvMjAxOCAwMzo1NSBQTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4gdGhvc2Ug
YXJlIGhlbHBmdWwgbWFjcm8gdG8gdXNlIHRoZSB0aW1lIG1hbmFnZXIgY29ycmVjdGx5Cj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IFBhdWwgU2VtZWwgPHBoZW50ZXhAYW1hem9uLmRlPgo+PiAtLS0KPj4K
Pj4gTm90ZXM6Cj4+ICAgICAgdjQ6Cj4+ICAgICAgLSBuZXcgcGF0Y2ggdmVyc2lvbgo+Pgo+PiAg
IGNvbW1vbi90aW1lLmMgICAgICB8IDEwICsrKysrKysrKysKPj4gICBpbmNsdWRlL3h0Zi90aW1l
LmggfCAxMiArKysrKysrKysrKysKPj4gICAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMo
KykKPj4KPj4gZGlmZiAtLWdpdCBhL2NvbW1vbi90aW1lLmMgYi9jb21tb24vdGltZS5jCj4+IGlu
ZGV4IDc1MTVlYjAuLmUyNzc5YjkgMTAwNjQ0Cj4+IC0tLSBhL2NvbW1vbi90aW1lLmMKPj4gKysr
IGIvY29tbW9uL3RpbWUuYwo+PiBAQCAtMTYzLDYgKzE2MywxNiBAQCBzdGF0aWMgaW5saW5lIHZv
aWQgbXNwaW5fc2xlZXAodWludDY0X3QgdCkKPj4gICAgICAgbnNwaW5fc2xlZXAobnNlYyk7Cj4+
ICAgfQo+PiAgIAo+PiArdm9pZCBzbGVlcCh1aW50NjRfdCB0KQo+PiArewo+PiArICAgIHNwaW5f
c2xlZXAodCk7Cj4+ICt9Cj4+ICsKPj4gK3ZvaWQgbXNsZWVwKHVpbnQ2NF90IHQpCj4+ICt7Cj4+
ICsgICAgbXNwaW5fc2xlZXAodCk7Cj4gCj4gV2h5IGNhbiB5b3UganVzdCBjYWxsIG1zcGluX3Ns
ZWVwIG1zbGVlcCBkaXJlY3RseT8KPiAKPiBUaGUgc2FtZSBhcHBsaWVzIHRvIHNwaW5fc2xlZXAu
Cj4gCj4gQWxzbyBJIHdhcyBleHBlY3RpbmcgdG8gc2VlIHNvbWUga2luZCBvZiB0ZXN0IGFwcGVh
ciBhdCB0aGUgZW5kIG9mIHRoZQo+IHNlcmllcy4gWW91IGFyZSBiYXNpY2FsbHkgYWRkaW5nIGEg
YnVuY2ggb2YgZGVhZCBjb2RlLCBzaW5jZSB0aGVyZSdzCj4gbm8gdXNlciBvZiBhbnkgb2YgdGhl
IG5ld2x5IGludHJvZHVjZWQgZnVuY3Rpb25zLgoKQWN0dWFsbHksIEkgd29uJ3QgYmUgYWJsZSB0
byBhZGQgYSByZWFsIFhTQSB0ZXN0IHVzaW5nIHRoaXMgZmVhdHVyZS4gQW55d2F5LCBJIApkbyB0
aGluayB0aGF0IGhhdmluZyB0aGUgc2xlZXAgZnVuY3Rpb25zIHdpbGwgYmUgcmVhbGx5IHVzZWZ1
bCBpbiB0aGUgZnV0dXJlLgpBbnl3YXksIEkgd2FzIHRoaW5raW5nIGFib3V0IGFkZGluZyBhIHRl
c3QgdGhhdCBpcyBjYWxsaW5nIHRoZSBnZXR0aW1lb2ZkYXkgCmZ1bmN0aW9uIG9yIHNvbWV0aGlu
ZyBzaW1pbGFyLgoKV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgaXQgPwoKLS0gClBhdWwgU2VtZWwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
