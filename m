From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 3/4] x86/IRQ: relax locking in
 irq_guest_eoi_timer_fn()
Date: Thu, 16 May 2019 15:48:14 +0200
Message-ID: <20190516134814.7z33bfew47xsoq3v@Air-de-Roger>
References: <5CD2CDEC020000780022CC95@prv1-mh.provo.novell.com>
 <5CD2CFE6020000780022CCC9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wixq=TQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hRGkP-0000fa-Ta
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 13:48:37 +0000
Content-Disposition: inline
In-Reply-To: <5CD2CFE6020000780022CCC9@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDY6NDc6MzRBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhpcyBpcyBhIHRpbWVyIGhhbmRsZXIsIHNvIGl0IGdldHMgZW50ZXJlZCB3aXRoIElS
UXMgZW5hYmxlZC4gVGhlcmVmb3JlCj4gdGhlcmUncyBubyBuZWVkIHRvIHNhdmUvcmVzdG9yZSB0
aGUgSVJRIG1hc2tpbmcgZmxhZy4KPiAKPiBBZGRpdGlvbmFsbHkgdGhlIGZpbmFsIHN3aXRjaCgp
J2VzIEFDS1RZUEVfRU9JIGNhc2UgcmUtYWNxdWlyZXMgdGhlIGxvY2sKPiBqdXN0IGZvciBpdCB0
byBiZSBkcm9wcGVkIGFnYWluIHJpZ2h0IGF3YXkuIERvIGF3YXkgd2l0aCB0aGlzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRoYW5rcy4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
