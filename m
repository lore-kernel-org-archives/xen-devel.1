From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 1/2] x86/e820: fix build with gcc9
Date: Thu, 7 Mar 2019 11:46:08 +0100
Message-ID: <20190307104608.dsexwz7dn6qceel7@Air-de-Roger>
References: <5C80F130020000780021C602@prv1-mh.provo.novell.com>
 <5C80F30F020000780021C623@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZO0X=RK=citrix.com=prvs=96265d518=roger.pau@srs-us1.protection.inumbo.net>)
 id 1h1qXb-0001dI-A2
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2019 10:46:19 +0000
Content-Disposition: inline
In-Reply-To: <5C80F30F020000780021C623@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Charles Arnold <CARNOLD@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXIgMDcsIDIwMTkgYXQgMDM6MzE6NDNBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gZTgyMC5jOiBJbiBmdW5jdGlvbiDigJhjbGlwX3RvX2xpbWl04oCZOgo+IC4uLi94ZW4v
aW5jbHVkZS9hc20vc3RyaW5nLmg6MTA6MjY6IGVycm9yOiDigJhfX2J1aWx0aW5fbWVtbW92ZeKA
mSBvZmZzZXQgWy0xNiwgLTM2XSBpcyBvdXQgb2YgdGhlIGJvdW5kcyBbMCwgMjA0ODRdIG9mCj4g
b2JqZWN0IOKAmGU4MjDigJkgd2l0aCB0eXBlIOKAmHN0cnVjdCBlODIwbWFw4oCZIFstV2Vycm9y
PWFycmF5LWJvdW5kc10KPiAgICAxMCB8ICNkZWZpbmUgbWVtbW92ZShkLCBzLCBuKSBfX2J1aWx0
aW5fbWVtbW92ZShkLCBzLCBuKQo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgIF5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gZTgyMC5jOjQwNDoxMzogbm90ZTogaW4gZXhwYW5z
aW9uIG9mIG1hY3JvIOKAmG1lbW1vdmXigJkKPiAgIDQwNCB8ICAgICAgICAgICAgIG1lbW1vdmUo
JmU4MjAubWFwW2ldLCAmZTgyMC5tYXBbaSsxXSwKPiAgICAgICB8ICAgICAgICAgICAgIF5+fn5+
fn4KPiBlODIwLmM6MzY6MTY6IG5vdGU6IOKAmGU4MjDigJkgZGVjbGFyZWQgaGVyZQo+ICAgIDM2
IHwgc3RydWN0IGU4MjBtYXAgZTgyMDsKPiAgICAgICB8ICAgICAgICAgICAgICAgIF5+fn4KPiAK
PiBXaGlsZSBJIGNhbid0IHNlZSB3aGVyZSB0aGUgbmVnYXRpdmUgb2Zmc2V0cyB3b3VsZCBjb21l
IGZyb20sIGNvbnZlcnRpbmcKPiB0aGUgbG9vcCBpbmRleCB0byB1bnNpZ25lZCB0eXBlIGhlbHBz
LiBUYWtlIHRoZSBvcHBvcnR1bml0eSBhbmQgYWxzbwo+IGNvbnZlcnQgc2V2ZXJhbCBvdGhlciBs
b2NhbCB2YXJpYWJsZXMgYW5kIGNvcHlfZTgyMF9tYXAoKSdzIHNlY29uZAo+IHBhcmFtZXRlciB0
byB1bnNpZ25lZCBpbnQgKGFuZCBib29sIGluIG9uZSBjYXNlKS4KCkkgYWxzbyBjYW5ub3Qgc2Vl
IGhvdyB5b3UgY2FuIGVuZCB1cCB3aXRoIG5lZ2F0aXZlIG9mZnNldHMsIGJ1dApjaGFuZ2luZyB0
byB1bnNpZ25lZCBpbnQgaXMgZGVmaW5pdGVseSBhbmQgaW1wcm92ZW1lbnQgSU1PLgoKPiBSZXBv
cnRlZC1ieTogQ2hhcmxlcyBBcm5vbGQgPGNhcm5vbGRAc3VzZS5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhhbmtzLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
