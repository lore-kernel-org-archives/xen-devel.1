From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 12/15] x86/IRQ: add explicit
 tracing-enabled check to trace_irq_mask()
Date: Mon, 20 May 2019 13:46:26 +0200
Message-ID: <20190520114626.i2u37ul3bizqwaap@Air-de-Roger>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CDE8F5B020000780023005F@prv1-mh.provo.novell.com>
 <5CDE924602000078002300B7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x+15=TU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hSgka-0000KN-5W
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 11:46:40 +0000
Content-Disposition: inline
In-Reply-To: <5CDE924602000078002300B7@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMDQ6NTE6NTBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlIHNldHVwIGZvciBjYWxsaW5nIHRyYWNlX3ZhcigpICh3aGljaCBpdHNlbGYgY2hl
Y2tzIHRiX2luaXRfZG9uZSkgaXMKPiBub24tbmVnbGlnaWJsZSwgYW5kIGhlbmNlIGEgc2VwYXJh
dGUgb3V0ZXItbW9zdCBjaGVjayBpcyB3YXJyYW50ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKSSB0aGluayBhIG1hY3JvIG9yIGhlbHBlciB3b3Vs
ZCBiZSBoZWxwZnVsOiBpZTogdHJhY2VfZW5hYmxlZCBvciBzb21lCnN1Y2guIENoZWNraW5nIHRi
X2luaXRfZG9uZSBpcyBhcyBvYnZpb3VzIGFzIGl0IGNvdWxkIGJlIElNTy4KClJvZ2VyLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
