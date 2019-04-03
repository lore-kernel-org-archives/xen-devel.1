From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/4] x86: relax a few get_gfn() invocations
Date: Wed, 3 Apr 2019 19:16:57 +0100
Message-ID: <e2acbc15-dbc9-6cd4-2a85-c279484be03c@citrix.com>
References: <5C88F524020000780021E12C@prv1-mh.provo.novell.com>
 <5C88F9C7020000780021E17A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/PYL=SF=citrix.com=prvs=98944cf01=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hBkRb-00070v-4X
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2019 18:17:03 +0000
In-Reply-To: <5C88F9C7020000780021E17A@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTMvMDMvMjAxOSAxMjozOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSW4gYSBmZXcgY2FzZXMg
b25seSBhIHF1ZXJ5IGlzIGludGVuZGVkLCBpLmUuIHdpdGhvdXQgcG9wdWxhdGluZyBhCj4gcG9z
c2libGUgUG9EIG9yIHBhZ2VkIG91dCBlbnRyeSwgd2hlbiB0aGUgaW50ZW50aW9uIGlzIHRvIHJl
cGxhY2UgdGhlCj4gY3VycmVudCBlbnRyeSBhbnl3YXkuIFVzZSBnZXRfZ2ZuX3F1ZXJ5KCkgdGhl
cmUgaW5zdGVhZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
