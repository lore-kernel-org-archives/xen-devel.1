From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 12/12] x86/IRQ: simplify and rename
 pirq_acktype()
Date: Mon, 13 May 2019 16:14:15 +0200
Message-ID: <20190513141415.3tkt6x5pio6lcf4h@Air-de-Roger>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CD2D2C8020000780022CCF2@prv1-mh.provo.novell.com>
 <5CD2D61E020000780022CD88@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KEM8=TN=citrix.com=prvs=029c3005f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hQBin-000824-Kc
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 14:14:29 +0000
Content-Disposition: inline
In-Reply-To: <5CD2D61E020000780022CD88@prv1-mh.provo.novell.com>
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

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDc6MTQ6MDZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gSXRzIG9ubHkgY2FsbGVyIGFscmVhZHkgaGFzIHRoZSBJUlEgZGVzY3JpcHRvciBpbiBp
dHMgaGFuZHMsIHNvIHRoZXJlJ3MKPiBubyBuZWVkIGZvciB0aGUgZnVuY3Rpb24gdG8gcmUtb2J0
YWluIGl0LiBBcyBhIHJlc3VsdCB0aGUgbGVhZGluZyBwIG9mCj4gaXRzIG5hbWUgaXMgbm8gbG9u
Z2VyIGFwcHJvcHJpYXRlIGFuZCBoZW5jZSBnZXRzIGRyb3BwZWQuCj4gCj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhhbmtzLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
