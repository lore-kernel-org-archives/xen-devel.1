From: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] x86: report use of PCID together with
 reporting XPTI status
Date: Tue, 17 Jul 2018 15:52:35 -0500
Message-ID: <20180717205235.de6kk2bnnqng426t@MacBook-Pro.localdomain>
References: <5B4CCB9B02000078001D4901@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=l0ah=kb=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1ffWxa-0001K9-0M
 for xen-devel@lists.xenproject.org; Tue, 17 Jul 2018 20:52:38 +0000
Received: by mail-yw0-x244.google.com with SMTP id v197-v6so910119ywg.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jul 2018 13:52:37 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <5B4CCB9B02000078001D4901@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdWwgMTYsIDIwMTggYXQgMTA6NDU6MTVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9wdi9kb21haW4uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9wdi9k
b21haW4uYwo+IEBAIC0yODgsNiArMjg4LDEyIEBAIGludCBwdl9kb21haW5faW5pdGlhbGlzZShz
dHJ1Y3QgZG9tYWluICoKPiAgICAgIHJldHVybiByYzsKPiAgfQo+ICAKPiArYm9vbCBfX2luaXQg
eHB0aV9wY2lkX2VuYWJsZWQodm9pZCkKPiArewo+ICsgICAgcmV0dXJuIHVzZV9pbnZwY2lkICYm
IGNwdV9oYXNfcGNpZCAmJgo+ICsgICAgICAgICAgIChvcHRfcGNpZCA9PSBQQ0lEX0FMTCB8fCBv
cHRfcGNpZCA9PSBQQ0lEX1hQVEkpOwo+ICt9Cj4gKwo+ICBzdGF0aWMgdm9pZCBfdG9nZ2xlX2d1
ZXN0X3B0KHN0cnVjdCB2Y3B1ICp2KQo+ICB7Cj4gICAgICBjb25zdCBzdHJ1Y3QgZG9tYWluICpk
ID0gdi0+ZG9tYWluOwo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9zcGVjX2N0cmwuYwo+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9zcGVjX2N0cmwuYwo+IEBAIC0yNTYsOSArMjU2LDEwIEBAIHN0YXRpYyB2b2lk
IF9faW5pdCBwcmludF9kZXRhaWxzKGVudW0gaW4KPiAgICAgICAgICAgICBib290X2NwdV9oYXMo
WDg2X0ZFQVRVUkVfU0NfUlNCX0hWTSkgICAgICA/ICIgUlNCIiAgICAgICAgICAgOiAiIiwKPiAg
ICAgICAgICAgICBvcHRfZWFnZXJfZnB1ICAgICAgICAgICAgICAgICAgICAgICAgICAgICA/ICIg
RUFHRVJfRlBVIiAgICAgOiAiIik7Cj4gIAo+IC0gICAgcHJpbnRrKCIgIFhQVEkgKDY0LWJpdCBQ
ViBvbmx5KTogRG9tMCAlcywgRG9tVSAlc1xuIiwKPiArICAgIHByaW50aygiICBYUFRJICg2NC1i
aXQgUFYgb25seSk6IERvbTAgJXMsIERvbVUgJXMgKHdpdGglcyBQQ0lEKVxuIiwKCkRvIHlvdSBl
dmVyIGZvcmVzZWUgd2FudGluZyB0byBhZGQgYW5vdGhlciBmbGFnIGluIGhlcmU/IEl0IG1pZ2h0
IGJlCmJldHRlciB0byBqdXN0IGhhdmUgIndpdGg6ICVzIiBhbmQgZG8geHB0aV9wY2lkX2VuYWJs
ZWQgPyAiUENJRCIgOiAiIiBpZgp5b3UgZG8uIElmIG5vdCB0aGVuIHRoaXMgc2VlbXMgbGlrZSBh
IGdvb2QgYWRkaXRpb24gdG8gbWUgYW5kIGlzCmRlZmluaXRlbHkgd2VsY29tZSB0byBmb2xrcyB3
YW50aW5nIHRvIGtub3cgaWYgdGhleSdyZSB1c2luZyBQQ0lELgoKUmV2aWV3ZWQtYnk6IERvdWcg
R29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
