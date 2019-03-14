From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH L1TF v10 8/8] common/domain: block
 speculative out-of-bound accesses
Date: Thu, 14 Mar 2019 07:20:57 -0600
Message-ID: <5C8A5539020000780021E9E0@prv1-mh.provo.novell.com>
References: <1552567811-5301-1-git-send-email-nmanthey@amazon.de>
 <1552567811-5301-9-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=U6t1=RR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h4QI7-0004Ly-S9
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 13:20:59 +0000
In-Reply-To: <1552567811-5301-9-git-send-email-nmanthey@amazon.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: nmanthey@amazon.de
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAzLjE5IGF0IDEzOjUwLCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBX
aGVuIGlzc3VpbmcgYSB2Y3B1X29wIGh5cGVyY2FsbCwgZ3Vlc3RzIGhhdmUgY29udHJvbCBvdmVy
IHRoZQo+IHZjcHVpZCB2YXJpYWJsZS4gSW4gdGhlIG9sZCBjb2RlLCB0aGlzIGFsbG93ZWQgdG8g
cGVyZm9ybQo+IHNwZWN1bGF0aXZlIG91dC1vZi1ib3VuZCBhY2Nlc3Nlcy4gVG8gYmxvY2sgdGhp
cywgd2UgbWFrZSB1c2UKPiBvZiB0aGUgZG9tYWluX3ZjcHUgZnVuY3Rpb24uCj4gCj4gVGhpcyBp
cyBwYXJ0IG9mIHRoZSBzcGVjdWxhdGl2ZSBoYXJkZW5pbmcgZWZmb3J0Lgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IE5vcmJlcnQgTWFudGhleSA8bm1hbnRoZXlAYW1hem9uLmRlPgoKUmV2aWV3ZWQtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
