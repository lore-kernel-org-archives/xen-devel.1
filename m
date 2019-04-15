From: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH] xen/arm: Blacklist PMU with "arm,
 cortex-a53-pmu"
Date: Mon, 15 Apr 2019 09:41:39 +0100
Message-ID: <20190415094139.25256f06@donnerap.cambridge.arm.com>
References: <1555252419-17121-1-git-send-email-amittomer25@gmail.com>
 <58cbfc08-720c-0d55-75ac-f14dc3799036@arm.com>
 <e60a9e5a-6492-4232-2400-128fce246cc8@arm.com>
 <CABHD4K98oAZURhvraK5F1RHkv0j2YzaCkV8bsBX-=Cc3xc0irA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xdBD=SR=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1hFxBS-0002Lf-AM
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 08:41:46 +0000
In-Reply-To: <CABHD4K98oAZURhvraK5F1RHkv0j2YzaCkV8bsBX-=Cc3xc0irA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Amit Tomer <amittomer25@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAxNSBBcHIgMjAxOSAxMzo0MTo0MSArMDUzMApBbWl0IFRvbWVyIDxhbWl0dG9tZXIy
NUBnbWFpbC5jb20+IHdyb3RlOgoKPiBIZWxsbywKPiAKPiA+IEFmdGVyIHRhbGtpbmcgdmlhIElS
QywgdGhlIHByb2JsZW0gaXMgUFBJcywgdGhhdCB0aGlzIHBsYXRmb3JtIHVzZXMgZm9yCj4gPiBQ
TVUgaW50ZXJydXB0cy4gV2hlbiBYZW4gdHJpZXMgdG8gc2V0dXAgdGhlIElSUSBmb3J3YXJkaW5n
IGZvciBEb20wIGZvcgo+ID4gdGhpcyBkZXZpY2UsIGl0IGZhaWxzIGJlY2F1c2UgaXQgb25seSBz
dXBwb3J0cyBmb3J3YXJkaW5nIFNQSXMuCj4gPiBTbyBpbnRlcmVzdGluZ2x5IHdlIGVycm9uZW91
c2x5IGZvcndhcmRlZCBBNTMgUE1VcyAodGhvc2UgdGhhdCBhcmUKPiA+IGRlc2NyaWJlZCBieSB0
aGF0IHBhcnRpY3VsYXIgY29tcGF0aWJsZSBzdHJpbmcgb25seSkgdG8gRG9tMCBmb3IgcXVpdGUg
YQo+ID4gd2hpbGUsIGJ1dCBub2JvZHkgbm90aWNlZCAob3IgY2FyZWQpLgo+ID4KPiA+IEFtaXQs
IHBsZWFzZSBhZGp1c3QgdGhlIGNvbW1pdCBtZXNzYWdlIGFjY29yZGluZ2x5Lgo+ID4gIAo+IE9r
IGJ1dCBvcmlnaW5hbCBjb21taXQgImQ0NWU5YjdjNTM0MjhhMmFhNGQwNjc5MjdlN2VmNWUzMDc4
M2ZiOGIiIHRoYXQgYmxhY2tsaXN0Cj4gUE1VJ3MgY2xlYXJseSBzdGF0ZXMgdGhhdCBpc3N1ZSBp
cyBkdWUgdG8gUFBJIGFuZCB0aGF0IGNhbiBub3QgYmUKPiByb3V0ZWQgdG8gZ3Vlc3QuCj4gCj4g
SSB0aG91Z2h0LCBUaGlzIHBhdGNoIGlzIGp1c3QgY29udGludWF0aW9uIG9mIHNhbWUuCgpTdXJl
LCBidXQgSnVsaWVuIHdhcyBhc2tpbmcgZm9yIGEgcmVhc29uIGZvciB0aGlzIHBhdGNoIGluIHRo
ZSBjb21taXQKbWVzc2FnZS4gVGhlcmUgYXJlIHF1aXRlIHNvbWUgcGxhdGZvcm1zIHdoaWNoIHVz
ZSB0aGlzIGNvbXBhdGlibGUgc3RyaW5nCmFscmVhZHksIGFuZCBub25lIG9mIHRoZW0gZmFpbGVk
IHNvIGZhci4gVGhpcyBpcyBiZWNhdXNlIHRoZXkgdXNlIFNQSXMsCmJ1dCBhcyB0aGUgb3JpZ2lu
YWwgY29tbWl0IG1lc3NhZ2UgbWVudGlvbnMgdGhlcmUgYXJlIG1vcmUgaXNzdWVzIHRoYW4ganVz
dAp0aGUgSVJRcy4KCkFsbCB0aGlzIHNob3VsZCBiZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuIEFz
IHlvdSBoYXZlIHNlZW4geW91cnNlbGYgaW4gSWFuJ3MKY29tbWl0LCBpdCdzIHF1aXRlIGhlbHBm
dWwgbGF0ZXIgb24uCgpTbyB5b3Ugc2hvdWxkIG1lbnRpb246CmEpIHRoZSBwcm9ibGVtIHlvdSBl
bmNvdW50ZXJlZDogUFBJIGZvcndhcmRpbmcgZGVuaWVkIG9uIGlNWDgKYikgdGhlIHJlYXNvbiBm
b3IgdGhlIHByb2JsZW06IEE1MyBQTVUgbm90IGJsYWNrbGlzdGVkCmMpIHRoZSBmaXg6IGFkZGlu
ZyB0aGUgQTUzIGNvbXBhdGlibGUgc3RyaW5nIHRvIHRoZSBibGFja2xpc3QKCkNoZWVycywKQW5k
cmUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
