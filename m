From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: mark expected switch fall-through
Date: Wed, 13 Feb 2019 06:50:58 +0100
Message-ID: <1c86461d-71b4-7759-2255-19983b888fb5__6463.43185087375$1550037118$gmane$org@suse.com>
References: <20190212203720.GA24175@embeddedor>
 <20190212235041.GA4463@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=A+hS=QU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gtnRr-0008M4-9h
 for xen-devel@lists.xenproject.org; Wed, 13 Feb 2019 05:51:07 +0000
In-Reply-To: <20190212235041.GA4463@localhost.localdomain>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTMvMDIvMjAxOSAwMDo1MCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIFR1ZSwgRmVi
IDEyLCAyMDE5IGF0IDAyOjM3OjIwUE0gLTA2MDAsIEd1c3Rhdm8gQS4gUi4gU2lsdmEgd3JvdGU6
Cj4+IEluIHByZXBhcmF0aW9uIHRvIGVuYWJsaW5nIC1XaW1wbGljaXQtZmFsbHRocm91Z2gsIG1h
cmsgc3dpdGNoCj4+IGNhc2VzIHdoZXJlIHdlIGFyZSBleHBlY3RpbmcgdG8gZmFsbCB0aHJvdWdo
Lgo+Pgo+PiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZzoKPj4KPj4gZHJp
dmVycy94ZW4veGVuLXBjaWJhY2sveGVuYnVzLmM6IEluIGZ1bmN0aW9uIOKAmHhlbl9wY2lia19m
cm9udGVuZF9jaGFuZ2Vk4oCZOgo+PiBkcml2ZXJzL3hlbi94ZW4tcGNpYmFjay94ZW5idXMuYzo1
NDU6Njogd2FybmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwgdGhyb3VnaCBbLVdpbXBsaWNp
dC1mYWxsdGhyb3VnaD1dCj4+ICAgIGlmICh4ZW5idXNfZGV2X2lzX29ubGluZSh4ZGV2KSkKPj4g
ICAgICAgXgo+PiBkcml2ZXJzL3hlbi94ZW4tcGNpYmFjay94ZW5idXMuYzo1NDg6Mjogbm90ZTog
aGVyZQo+PiAgIGNhc2UgWGVuYnVzU3RhdGVVbmtub3duOgo+PiAgIF5+fn4KPj4KPj4gV2Fybmlu
ZyBsZXZlbCAzIHdhcyB1c2VkOiAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoPTMKPj4KPj4gTm90aWNl
IHRoYXQsIGluIHRoaXMgcGFydGljdWxhciBjYXNlLCB0aGUgY29kZSBjb21tZW50IGlzIG1vZGlm
aWVkCj4+IGluIGFjY29yZGFuY2Ugd2l0aCB3aGF0IEdDQyBpcyBleHBlY3RpbmcgdG8gZmluZC4K
Pj4KPj4gVGhpcyBwYXRjaCBpcyBwYXJ0IG9mIHRoZSBvbmdvaW5nIGVmZm9ydHMgdG8gZW5hYmxl
Cj4+IC1XaW1wbGljaXQtZmFsbHRocm91Z2guCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEd1c3Rhdm8g
QS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+Cj4gCj4gQXBwbGllZCB0byBmb3It
bGludXMtNS4wCj4gCj4gKHhlbi1zY3NpYmFjayBwYXRjaCB0b28pCgpJJ20gdGVuZGluZyB0byBk
ZWxheSB0aG9zZSBwYXRjaGVzIHVudGlsIDUuMSwgYXMgd2UgYXJlIHByZXR0eSBsYXRlIGluCnRo
ZSA1LjAgY3ljbGUuIFdlIHNob3VsZCBhZGQgb25seSByZWFsbHkgY3JpdGljYWwgZml4ZXMgdG8g
NS4wIG5vdy4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
