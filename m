From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH SpectreV1+L1TF v7 5/9] is_control_domain:
 block speculation
Date: Fri, 22 Feb 2019 06:19:33 -0700
Message-ID: <5C6FF6E502000078002192EC@prv1-mh.provo.novell.com>
References: <1550737003-25779-1-git-send-email-nmanthey@amazon.de>
 <1550737003-25779-6-git-send-email-nmanthey@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gxAmH-0007Xt-G1
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 13:22:09 +0000
In-Reply-To: <1550737003-25779-6-git-send-email-nmanthey@amazon.de>
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAyLjE5IGF0IDA5OjE2LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBD
aGVja3Mgb2YgZG9tYWluIHByb3BlcnRpZXMsIHN1Y2ggYXMgaXNfaGFyZHdhcmVfZG9tYWluIG9y
IGlzX2h2bV9kb21haW4sCj4gbWlnaHQgYmUgYnlwYXNzZWQgYnkgc3BlY3VsYXRpdmVseSBleGVj
dXRpbmcgdGhlc2UgaW5zdHJ1Y3Rpb25zLiBBIHJlYXNvbgo+IGZvciBieXBhc3NpbmcgdGhlc2Ug
Y2hlY2tzIGlzIHRoYXQgdGhlc2UgbWFjcm9zIGFjY2VzcyB0aGUgZG9tYWluCj4gc3RydWN0dXJl
IHZpYSBhIHBvaW50ZXIsIGFuZCBjaGVjayBhIGNlcnRhaW4gZmllbGQuIFNpbmNlIHRoaXMgbWVt
b3J5Cj4gYWNjZXNzIGlzIHNsb3csIHRoZSBDUFUgYXNzdW1lcyBhIHJldHVybmVkIHZhbHVlIGFu
ZCBjb250aW51ZXMgdGhlCj4gZXhlY3V0aW9uLgo+IAo+IEluIGNhc2UgYW4gaXNfY29udHJvbF9k
b21haW4gY2hlY2sgaXMgYnlwYXNzZWQsIGZvciBleGFtcGxlIGR1cmluZyBhCj4gaHlwZXJjYWxs
LCBkYXRhIHRoYXQgc2hvdWxkIG9ubHkgYmUgYWNjZXNzaWJsZSBieSB0aGUgY29udHJvbCBkb21h
aW4gY291bGQKPiBiZSBsb2FkZWQgaW50byB0aGUgY2FjaGUuCj4gCj4gVGhpcyBpcyBwYXJ0IG9m
IHRoZSBzcGVjdWxhdGl2ZSBoYXJkZW5pbmcgZWZmb3J0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IE5v
cmJlcnQgTWFudGhleSA8bm1hbnRoZXlAYW1hem9uLmRlPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
