From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86: report use of PCID together with
 reporting XPTI status
Date: Tue, 17 Jul 2018 13:05:34 +0200
Message-ID: <20180717110534.qbiflgg3ikv2oasq@mac.bytemobile.com>
References: <5B4CCB9B02000078001D4901@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jnja=kb=citrix.com=prvs=72919e7bd=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ffNnc-00021a-Cp
 for xen-devel@lists.xenproject.org; Tue, 17 Jul 2018 11:05:44 +0000
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
aXQgUFYgb25seSk6IERvbTAgJXMsIERvbVUgJXMgKHdpdGglcyBQQ0lEKVxuIiwKPiAgICAgICAg
ICAgICBvcHRfeHB0aSAmIE9QVF9YUFRJX0RPTTAgPyAiZW5hYmxlZCIgOiAiZGlzYWJsZWQiLAo+
IC0gICAgICAgICAgIG9wdF94cHRpICYgT1BUX1hQVElfRE9NVSA/ICJlbmFibGVkIiA6ICJkaXNh
YmxlZCIpOwo+ICsgICAgICAgICAgIG9wdF94cHRpICYgT1BUX1hQVElfRE9NVSA/ICJlbmFibGVk
IiA6ICJkaXNhYmxlZCIsCj4gKyAgICAgICAgICAgeHB0aV9wY2lkX2VuYWJsZWQoKSA/ICIiIDog
Im91dCIpOwo+ICB9CgpNYXliZSB5b3UgY291bGQgcGxhY2UgeHB0aV9wY2lkX2VuYWJsZWQgaW4g
c3BlY19jdHJsLmMsIG9yIGp1c3Qgb3Blbgpjb2RlIGl0IChwb3NzaWJseSB3aXRoIGEgYm9vbCkg
aW4gcHJpbnRfZGV0YWlscz8KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
