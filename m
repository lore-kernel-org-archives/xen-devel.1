From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul: fix 3-operand IMUL
Date: Tue, 18 Dec 2018 11:59:08 +0000
Message-ID: <9410d438-2346-ed94-824e-382c2047ecaf@citrix.com>
References: <5C18DA1C020000780020716C@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=snIL=O3=citrix.com=prvs=883e14dc5=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gZE1o-00074N-W6
 for xen-devel@lists.xenproject.org; Tue, 18 Dec 2018 11:59:13 +0000
In-Reply-To: <5C18DA1C020000780020716C@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrei LUTAS <vlutas@bitdefender.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTgvMTIvMjAxOCAxMToyOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gV2hpbGUgY29tbWl0IDc1
MDY2Y2Q0ZWEgKCJ4ODZlbXVsOiBmaXggeyxpfW11bCBhbmQgeyxpfWRpdiIpIGluZGVlZCBkaWQK
PiBhcyBpdHMgdGl0bGUgc2F5cywgaXQgYnJva2UgdGhlIDMtb3BlcmFuZCBmb3JtIGJ5IHVuaWZv
cm1seSB1c2luZyBBTC9BWC8KPiBFQVgvUkFYIGFzIHNlY29uZCBzb3VyY2Ugb3BlcmFuZC4gRml4
IHRoaXMgYW5kIGFkZCB0ZXN0cyBjb3ZlcmluZyBib3RoCj4gY2FzZXMuCj4KPiBSZXBvcnRlZC1i
eTogQW5kcmVpIEx1dGFzIDx2bHV0YXNAYml0ZGVmZW5kZXIuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
