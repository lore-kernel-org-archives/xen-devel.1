From: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-devel] [PATCH] configure: Don't add Xen's
 libs to LDFLAGS
Date: Thu, 24 Jan 2019 18:29:21 +0000
Message-ID: <CAFEAcA-qKrCSc0U2hWDzsHyrEaMtPVQ1A6o6FFvtucg0tnaM2A@mail.gmail.com>
References: <20190121144841.24467-1-anthony.perard@citrix.com>
 <CAFEAcA_ytAb-K-HB3wL5baMBDkY71ksBK8hsUSFxuUeqVDFyHQ@mail.gmail.com>
 <804f8429-d3f6-dc1a-4980-fc5a44a6b3c5@msgid.tls.msk.ru>
 <87fttijvfm.fsf@dusky.pond.sub.org>
 <9a1725c3-1119-886d-2d9d-11369ea5f207@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FFTK=QA=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1gmjku-0001eo-3X
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 18:29:36 +0000
Received: by mail-oi1-x241.google.com with SMTP id a77so5666305oii.5
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jan 2019 10:29:34 -0800 (PST)
In-Reply-To: <9a1725c3-1119-886d-2d9d-11369ea5f207@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Eric Blake <eblake@redhat.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Michael Tokarev <mjt@tls.msk.ru>, Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, Paul Durrant <paul.durrant@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, "open list:X86" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAyNCBKYW4gMjAxOSBhdCAxNzo0MCwgRXJpYyBCbGFrZSA8ZWJsYWtlQHJlZGhhdC5j
b20+IHdyb3RlOgo+Cj4gT24gMS8yNC8xOSAyOjQ1IEFNLCBNYXJrdXMgQXJtYnJ1c3RlciB3cm90
ZToKPgo+ID4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgVG9rYXJldiA8bWp0QHRscy5tc2sucnU+
Cj4gPj4gUmV2aWV2ZWQtYnk6IE1pY2hhZWwgVG9rYXJldiA8bWp0QHRscy5tc2sucnU+Cj4gPgo+
ID4gVHlwbyBpbiBSZXZpZXdlZC1ieS4KPgo+IFNob3VsZCB3ZSB0aWdodGVuIGNoZWNrcGF0Y2gu
cGwgdG8gZmxhZyBzdXNwaWNpb3VzLWxvb2tpbmcgJ3h4eC1ieTonCj4gdGFncywgdG8gY2F0Y2gg
aW5zdGFuY2VzIG9mIHR5cG9zPwoKWWVzLCBJIHdvdWxkIHZvdGUgZm9yIGhhdmluZyBpdCB3aGl0
ZWxpc3QgdGhlIGhhbGYgYSBkb3plbgpleHBlY3RlZCBvbmVzIGFuZCBjb21wbGFpbiBhYm91dCB0
aGUgcmVzdC4gSSB0aGluayB3ZQpraW5kIG9mIGRpc2N1c3NlZCB0aGlzIGluIHRoZSBwYXN0Li4u
Cgp0aGFua3MKLS0gUE1NCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
