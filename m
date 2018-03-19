From: Andre Przywara <andre.przywara@linaro.org>
Subject: Re: [PATCH v2 06/45] xen/arm: gic: Split the field
 state in gic_lr in 2 fields active and pending
Date: Mon, 19 Mar 2018 09:10:23 +0000
Message-ID: <db867ec1-b2df-31ca-df12-6e6ff9246ec0@linaro.org>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
 <20180315203050.19791-7-andre.przywara@linaro.org>
 <alpine.DEB.2.10.1803161430460.15548@sstabellini-ThinkPad-X260>
 <1a63a8f2-2844-ee73-5e48-4323226c86c1@arm.com>
 <alpine.DEB.2.10.1803161551500.15548@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zik3=gj=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1exqoO-0006Fw-S6
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 09:10:36 +0000
Received: by mail-wm0-x242.google.com with SMTP id e194so13624329wmd.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Mar 2018 02:10:35 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.10.1803161551500.15548@sstabellini-ThinkPad-X260>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Andre Przywara <andre.przywara@arm.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAxNi8wMy8xOCAyMjo1MiwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IE9uIEZy
aSwgMTYgTWFyIDIwMTgsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gT24gMTYvMDMvMjAxOCAyMToz
NCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4gT24gVGh1LCAxNSBNYXIgMjAxOCwgQW5k
cmUgUHJ6eXdhcmEgd3JvdGU6Cj4+Pj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxA
YXJtLmNvbT4KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9naWMuaCBiL3hl
bi9pbmNsdWRlL2FzbS1hcm0vZ2ljLmgKPj4+PiBpbmRleCBkYWVjNTE0OTljLi5jMzI4NjFkNGZh
IDEwMDY0NAo+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ2ljLmgKPj4+PiArKysgYi94
ZW4vaW5jbHVkZS9hc20tYXJtL2dpYy5oCj4+Pj4gQEAgLTIwOSw3ICsyMDksOCBAQCBzdHJ1Y3Qg
Z2ljX2xyIHsKPj4+PiAgICAgIC8qIFZpcnR1YWwgSVJRICovCj4+Pj4gICAgICB1aW50MzJfdCB2
aXJxOwo+Pj4+ICAgICAgdWludDhfdCBwcmlvcml0eTsKPj4+PiAtICAgdWludDhfdCBzdGF0ZTsK
Pj4+PiArICAgYm9vbCBhY3RpdmU7Cj4+Pj4gKyAgIGJvb2wgcGVuZGluZzsKPj4+PiAgICAgIGJv
b2wgaHdfc3RhdHVzOwo+Pj4+ICAgfTsKPj4+Cj4+PiBJIGxpa2UgdGhlIHJlYWRhYmlsaXR5IGJ1
dCBkaXNsaWtlIHRoZSBpbmNyZWFzZSBtZW1vcnkgdXNhZ2UuIEkgd291bGQKPj4+IGhhdmUga2Vw
dCBhIHNpbmdsZSB1aW50OF90IGFuZCBJIHdvdWxkIGhhdmUgdXNlZCBzdGF0dXMgZmxhZ3MgYXMg
YW4KPj4+IGFwcHJvYWNoLCBtYXliZSBJIHdvdWxkIGhhdmUgaW1wcm92ZWQgb24gdGhvc2UgZmxh
Z3MuCj4+Cj4+IFdoeSBpcyB0aGF0IGltcG9ydGFudD8gZ2ljX2xyIHdpbGwgb25seSBiZSBhbGxv
Y2F0ZWQgb24gdGhlIHN0YWNrLi4uCj4gCj4gWW91IGFyZSByaWdodCwgc28gaXQgaXMgZXZlbiBs
ZXNzIGltcG9ydGFudCB0aGFuIEkgdGhvdWdodC4KCi4uLiBlc3BlY2lhbGx5IGdpdmVuIHRoYXQg
dGhpcyBwYXRjaCBpbmNyZWFzZXMgaXQgZnJvbSAxMSB0byAxMiBieXRlcywKanVzdCB0byBmaWxs
IHVwIHRoZSBwYWRkaW5nLiBBbmQgYWN0dWFsbHkgcGF0Y2ggMDQgZGVjcmVhc2VkIHRoZSBzaXpl
IG9mCnRoZSBzdHJ1Y3R1cmUgYnkgdGhhdCBvbmUgYnl0ZS4KU28gaXQgd2FzIDEyIGJ5dGVzIGJl
Zm9yZSB0aGlzIHNlcmllcywgaXMgMTIgYnl0ZXMgYWZ0ZXIgdGhpcyBwYXRjaCBhbmQKd2lsbCBi
ZSAxMiBieXRlcyBhZnRlciB0aGUgd2hvbGUgc2VyaWVzLgpTbyBhY3R1YWxseSBubyBjaGFuZ2Ug
YXQgYWxsLgoKPiBBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPgoKVGhhbmtzIQoKQW5kcmUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
