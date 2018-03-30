From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH v19 01/11] x86/hvm/ioreq: maintain an array
 of ioreq servers rather than a list
Date: Fri, 30 Mar 2018 02:52:31 -0600
Message-ID: <5ABDFACF020000780012BFD3@prv1-mh.provo.novell.com>
References: <20180329153616.2929-1-paul.durrant@citrix.com>
 <20180329153616.2929-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=keyz=gu=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f1plz-0004Av-Mj
 for xen-devel@lists.xenproject.org; Fri, 30 Mar 2018 08:52:35 +0000
In-Reply-To: <20180329153616.2929-2-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: paul.durrant@citrix.com
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IDAzLzI5LzE4IDU6NDkg
UE0gPj4+Cj52MTk6Cj4tIEltcHJvdmUgY29tbWVudHMuCj4tIEFkZCBtaXNzaW5nIGNoZWNrcyBm
b3Igd2hldGhlciBhbiBpb3JlcSBzZXJ2ZXIgaXMgZW5hYmxlZCBiZWZvcmUKPnNlbmRpbmcgZW11
bGF0aW9uIHJlcXVlc3RzLgoKSXQgd291bGQgaGF2ZSBiZWVuIG5pY2UgaWYgdGhpcyAoZm9yIHRo
ZSBicm9hZGNhc3RpbmcgY2FzZSkgdW5yZWxhdGVkIChidXQKaW50ZW50aW9uYWwpIGNoYW5nZSB3
YXMgbWVudGlvbmVkIGluIHRoZSBkZXNjcmlwdGlvbi4gQW55d2F5OgpSZXZpZXdlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
