From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] xen: mark expected switch fall-through
Date: Tue, 12 Feb 2019 18:54:36 -0600
Message-ID: <4d9a1575-3301-b349-465e-a3a1cd9a4a77__44184.6747345821$1550019357$gmane$org@embeddedor.com>
References: <20190212203720.GA24175@embeddedor>
 <20190212235041.GA4463@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jbjn=QU=embeddedor.com=gustavo@srs-us1.protection.inumbo.net>)
 id 1gtioy-0000wP-CH
 for xen-devel@lists.xenproject.org; Wed, 13 Feb 2019 00:54:40 +0000
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
 by gateway31.websitewelcome.com (Postfix) with ESMTP id AF65262248
 for <xen-devel@lists.xenproject.org>; Tue, 12 Feb 2019 18:54:38 -0600 (CST)
In-Reply-To: <20190212235041.GA4463@localhost.localdomain>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyLzEyLzE5IDU6NTAgUE0sIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiBUdWUsIEZl
YiAxMiwgMjAxOSBhdCAwMjozNzoyMFBNIC0wNjAwLCBHdXN0YXZvIEEuIFIuIFNpbHZhIHdyb3Rl
Ogo+PiBJbiBwcmVwYXJhdGlvbiB0byBlbmFibGluZyAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoLCBt
YXJrIHN3aXRjaAo+PiBjYXNlcyB3aGVyZSB3ZSBhcmUgZXhwZWN0aW5nIHRvIGZhbGwgdGhyb3Vn
aC4KPj4KPj4gVGhpcyBwYXRjaCBmaXhlcyB0aGUgZm9sbG93aW5nIHdhcm5pbmc6Cj4+Cj4+IGRy
aXZlcnMveGVuL3hlbi1wY2liYWNrL3hlbmJ1cy5jOiBJbiBmdW5jdGlvbiDigJh4ZW5fcGNpYmtf
ZnJvbnRlbmRfY2hhbmdlZOKAmToKPj4gZHJpdmVycy94ZW4veGVuLXBjaWJhY2sveGVuYnVzLmM6
NTQ1OjY6IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1heSBmYWxsIHRocm91Z2ggWy1XaW1wbGlj
aXQtZmFsbHRocm91Z2g9XQo+PiAgICBpZiAoeGVuYnVzX2Rldl9pc19vbmxpbmUoeGRldikpCj4+
ICAgICAgIF4KPj4gZHJpdmVycy94ZW4veGVuLXBjaWJhY2sveGVuYnVzLmM6NTQ4OjI6IG5vdGU6
IGhlcmUKPj4gICBjYXNlIFhlbmJ1c1N0YXRlVW5rbm93bjoKPj4gICBefn5+Cj4+Cj4+IFdhcm5p
bmcgbGV2ZWwgMyB3YXMgdXNlZDogLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD0zCj4+Cj4+IE5vdGlj
ZSB0aGF0LCBpbiB0aGlzIHBhcnRpY3VsYXIgY2FzZSwgdGhlIGNvZGUgY29tbWVudCBpcyBtb2Rp
ZmllZAo+PiBpbiBhY2NvcmRhbmNlIHdpdGggd2hhdCBHQ0MgaXMgZXhwZWN0aW5nIHRvIGZpbmQu
Cj4+Cj4+IFRoaXMgcGF0Y2ggaXMgcGFydCBvZiB0aGUgb25nb2luZyBlZmZvcnRzIHRvIGVuYWJs
ZQo+PiAtV2ltcGxpY2l0LWZhbGx0aHJvdWdoLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBHdXN0YXZv
IEEuIFIuIFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgo+IAo+IEFwcGxpZWQgdG8gZm9y
LWxpbnVzLTUuMAo+IAo+ICh4ZW4tc2NzaWJhY2sgcGF0Y2ggdG9vKQo+IAoKVGhhbmsgeW91LCBC
b3Jpcy4KCi0tCkd1c3Rhdm8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
