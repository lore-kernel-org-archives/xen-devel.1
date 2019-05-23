From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/4] x86/boot: Wire up dom0=shadow for PV
 dom0
Date: Thu, 23 May 2019 07:08:41 -0600
Message-ID: <5CE69B590200007800231B95@prv1-mh.provo.novell.com>
References: <1558347494-21640-1-git-send-email-andrew.cooper3@citrix.com>
 <1558347494-21640-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oIoO=TX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTnSg-0001Z1-9o
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 13:08:46 +0000
In-Reply-To: <1558347494-21640-4-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjA1LjE5IGF0IDEyOjE4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jCj4gKysrIGIvZG9j
cy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jCj4gQEAgLTY3NSwxMiArNjc1LDE2IEBAIENv
bnRyb2xzIGZvciBob3cgZG9tMCBpcyBjb25zdHJ1Y3RlZCBvbiB4ODYgc3lzdGVtcy4KPiAgICAg
ICAgICBzZWxlY3RlZCBtb2RlLgo+ICAgICAgKiAgIEZvciBhIFBWSCBkb20wLCB0aGUgaGFyZHdh
cmUgbXVzdCBoYXZlIFZULXgvU1ZNIGV4dGVuc2lvbnMgCj4gYXZhaWxhYmxlLgo+ICAKPiAtKiAg
IFRoZSBgc2hhZG93YCBib29sZWFuIGlzIG9ubHkgYXBwbGljYWJsZSB3aGVuIGRvbTAgaXMgY29u
c3RydWN0ZWQgYXMgYSBQVkgKPiAtICAgIGd1ZXN0LCBhbmQgY29udHJvbHMgd2hldGhlciBkb20w
IHVzZXMgaGFyZHdhcmUgYXNzaXN0ZWQgcGFnaW5nLCBvciBzaGFkb3cKPiAtICAgIHBhZ2luZy4g
IFRoZSBkZWZhdWx0IGlzIEhBUCB3aGVuIGF2YWlsYWJsZSwgYW5kIHNoYWRvdyBvdGhlcndpc2Uu
Cj4gKyogICBUaGUgYHNoYWRvd2AgYm9vbGVhbiBhbGxvd3MgZG9tMCB0byBiZSBleHBsaWNpdGx5
IGNvbnN0cnVjdGVkIHVzaW5nIHNoYWRvdwo+ICsgICAgcGFnaW5nLiAgVGhpcyBvcHRpb24gaXMg
dW5hdmFpbGFibGUgd2hlbiBgQ09ORklHX1NIQURPV19QQUdJTkdgIGlzCj4gKyAgICBkaXNhYmxl
ZC4KPiAgCj4gLSAgICBUaGlzIG9wdGlvbiBpcyB1bmF2YWlsYWJsZSB3aGVuIGBDT05GSUdfU0hB
RE9XX1BBR0lOR2AgaXMgZGlzYWJsZWQuICBTdWNoCj4gLSAgICBidWlsZHMgb2YgWGVuIHJlcXVp
cmUgSEFQLWNhcGFibGUgaGFyZHdhcmUgdG8gdXNlIGEgUFZIIGRvbTAuCj4gKyAgICBGb3IgUFZI
LCBkb20wIGRlZmF1bHRzIHRvIHVzaW5nIEhBUCBvbiBjYXBhYmxlIGhhcmR3YXJlLCBhbmQgZmFs
bHMgYmFjayB0bwo+ICsgICAgc2hhZG93IHBhZ2luZyBvdGhlcndpc2UuICBBIFBWSCBkb20wIGNh
bm5vdCBiZSB1c2VkIGlmIFhlbiBpcyBjb21waWxlZAo+ICsgICAgd2l0aG91dCBwYWdpbmcgc3Vw
cG9ydCwgYW5kIHRoZSBoYXJkd2FyZSBsYWNrcyBIQVAgc3VwcG9ydC4KCkkgdGhpbmsgeW91IHdh
bnQgdG8gYWRkIGFub3RoZXIgInNoYWRvdyIgYWhlYWQgb2YgInBhZ2luZyIgaGVyZS4KT3RoZXIg
dGhhbiB0aGlzClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
