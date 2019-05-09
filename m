From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 1/3] x86/mm: short-circuit HVM-only mode
 flags when !HVM
Date: Thu, 9 May 2019 18:00:10 +0100
Message-ID: <20190509170010.GM2798@zion.uk.xensource.com>
References: <5CD42DCB020000780022D317@prv1-mh.provo.novell.com>
 <5CD42E37020000780022D32F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=47gT=TJ=citrix.com=prvs=025ab97d4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hOmP1-00078Z-8L
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 17:00:15 +0000
Content-Disposition: inline
In-Reply-To: <5CD42E37020000780022D32F@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMDksIDIwMTkgYXQgMDc6NDI6MTVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gI2RlZmluZS1pbmcgdGhlbSB0byB6ZXJvIGFsbG93cyBiZXR0ZXIgY29kZSBnZW5lcmF0
aW9uIGluIHRoaXMgY2FzZSwKPiBhbmQgcGF2ZXMgdGhlIHdheSBmb3IgbW9yZSBEQ0UsIGFsbG93
aW5nIHRvIGxlYXZlIGNlcnRhaW4gZnVuY3Rpb25zIGp1c3QKPiBkZWNsYXJlZCwgYnV0IG5vdCBk
ZWZpbmVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
