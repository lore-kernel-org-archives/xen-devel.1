From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 2/3] x86/mm: make
 guest_physmap_add_entry() HVM-only
Date: Thu, 9 May 2019 18:00:12 +0100
Message-ID: <20190509170012.GN2798@zion.uk.xensource.com>
References: <5CD42DCB020000780022D317@prv1-mh.provo.novell.com>
 <5CD42EB9020000780022D332@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=47gT=TJ=citrix.com=prvs=025ab97d4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hOmP1-00078e-Es
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 17:00:15 +0000
Content-Disposition: inline
In-Reply-To: <5CD42EB9020000780022D332@prv1-mh.provo.novell.com>
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

T24gVGh1LCBNYXkgMDksIDIwMTkgYXQgMDc6NDQ6MjVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gTGlmdCBpdHMgIXBhZ2luZ19tb2RlX3RyYW5zbGF0ZSgpIHBhcnQgaW50byBndWVzdF9w
aHlzbWFwX2FkZF9wYWdlKCkKPiAod2hpY2ggaXMgd2hhdCBjb21tb24gY29kZSBjYWxscyksIGVs
aW1pbmF0aW5nIHRoZSBkdW1teSB1c2Ugb2YgYQo+IChIVk0tb25seSByZWFsbHkpIFAyTSB0eXBl
IGluIHRoZSBQViBjYXNlLgo+IAo+IFN1Z2dlc3RlZC1ieTogR2VvcmdlIER1bmxhcCA8R2Vvcmdl
LkR1bmxhcEBldS5jaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
