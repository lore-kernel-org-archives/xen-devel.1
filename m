From: George Dunlap <George.Dunlap@eu.citrix.com>
Subject: Re: [PATCH v2 3/3] x86: use paging_mark_pfn_dirty()
Date: Thu, 8 Feb 2018 12:32:51 +0000
Message-ID: <CAFLBxZbHGkeSiBR1LbE_vo3mfgytxo1mVZ=vviA9M1QzRbndbw@mail.gmail.com>
References: <5A2FFB8D0200007800196DDF@prv-mh.provo.novell.com>
 <5A3A3D7F0200007800198CC0@prv-mh.provo.novell.com>
 <5A3A3E940200007800198CD9@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ilwf=fc=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1ejlNl-0000Cf-2c
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2018 12:32:53 +0000
Received: by mail-qk0-x22e.google.com with SMTP id x127so5343604qkb.12
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2018 04:32:51 -0800 (PST)
In-Reply-To: <5A3A3E940200007800198CD9@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBEZWMgMjAsIDIwMTcgYXQgOTo0MiBBTSwgSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPiAuLi4gaW4gcHJlZmVyZW5jZSBvdmVyIHBhZ2luZ19tYXJrX2RpcnR5
KCksIHdoZW4gdGhlIFBGTiBpcyBrbm93bgo+IGFueXdheS4KPgo+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBBY2tlZC1ieTogVGltIERlZWdhbiA8dGlt
QHhlbi5vcmc+CgpBY2tlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXgu
Y29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
