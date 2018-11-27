From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] xl: free bitmaps on exit
Date: Tue, 27 Nov 2018 17:19:06 +0000
Message-ID: <20181127171906.2okpiqidqp3alvsr@zion.uk.xensource.com>
References: <20181127100608.4197-1-olaf@aepfle.de>
 <20181127165538.7xglqre6psla42kq@zion.uk.xensource.com>
 <20181127180933.5fe93cec.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=q9xt=og=citrix.com=prvs=862b52565=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gRh0w-0001CK-2s
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 17:19:10 +0000
Content-Disposition: inline
In-Reply-To: <20181127180933.5fe93cec.olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBOb3YgMjcsIDIwMTggYXQgMDY6MDk6MzNQTSArMDEwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gVHVlLCAyNyBOb3YgMjAxOCAxNjo1NTozOCArMDAwMAo+IHNjaHJpZWIgV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT46Cj4gCj4gPiBMb29raW5nIG1vcmUgY2xvc2VseSBpbnRv
IHRoaXMsIHRoZXNlIGxpbmVzIHNob3VsZCBiZSBtb3ZlZCBldmVuCj4gPiBlYXJsaWVyIGJlZm9y
ZSB0aGUgY2FsbCB0byBsaWJ4bF9jdHhfYWxsb2MgLS0gdGhlcmUgaXMgYW4gZXhpdCB0aGVyZS4K
PiAKPiBJcyBpdCByZXF1aXJlZCB0byBpbnN0YWxsIHRoZSBhdGV4aXQgaGFuZGxlciBiZWZvcmUg
YWxsb2MoKT8KPiBUbyBtZSBpdCBsb29rcyBsaWtlIGF0ZXhpdCh4bF9jdHhfZnJlZSkgc2hvdWxk
IGJlIGRvbmUgcmlnaHQgYWZ0ZXIsIG9yIGluc2lkZSwgeGxfY3R4X2FsbG9jKCkuCgpOb3RlIHRo
YXQgbXVsdGlwbGUgY2FsbHMgdG8gYXRleGl0IGNyZWF0ZXMgYSBjaGFpbiBvZiBmdW5jdGlvbnMg
dG8KY2FsbCwgbm90IG92ZXJyaWRpbmcgd2hhdCBpcyBwcmV2aW91c2x5IHJlZ2lzdGVyZWQuCgpU
aGUgeGxfY3R4X2FsbG9jIGZ1bmN0aW9uIGlzIGFsc28gY2FsbGVkIGluIHBvc3Rmb3JrLiBJIHRo
aW5rIGlmIHlvdQptb3ZlIGF0ZXhpdCBjYWxsIGludG8geGxfY3R4X2FsbG9jIHlvdSB3aWxsIGVu
ZCB1cCByZWdpc3RlcmluZwp4bF9jdHhfZnJlZSBtb3JlIHRoYW4gb25jZSwgd2hpY2ggaXMgd3Jv
bmcuCgpUaGUgb3RoZXIgb3B0aW9uIC0tIHRvIGNhbGwgYXRleGl0IHJpZ2h0IGFmdGVyIC0tIGxv
b2tzIHBsYXVzaWJsZSB0byBtZS4KCldlaS4KCj4gCj4gT2xhZgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
