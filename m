From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 4/4] x86/hvm: add stricter permissions
 checks to ioreq server control plane
Date: Tue, 20 Mar 2018 10:43:04 -0600
Message-ID: <5AB1482802000078001B417B@prv-mh.provo.novell.com>
References: <20180316165857.7112-1-paul.durrant@citrix.com>
 <20180316165857.7112-5-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=3grj=gk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eyKLr-0002Sp-Hf
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 16:43:07 +0000
In-Reply-To: <20180316165857.7112-5-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjAzLjE4IGF0IDE3OjU4LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IFRoZXJlIGhhcyBhbHdheXMgYmVlbiBhbiBpbnRlbnRpb24gaW4gdGhlIGlvcmVxIHNlcnZl
ciBBUEkgdGhhdCBvbmx5IHRoZQo+IGRvbWFpbiB0aGF0IGNyZWF0ZXMgYW4gaW9yZXEgc2VydmVy
IHNob3VsZCBiZSBhYmxlIHRvIG1hbmlwdWxhdGUgaXQuCj4gSG93ZXZlciwgc28gZmFyLCBub3Ro
aW5nIGhhcyBlbmZvcmNlZCB0aGlzLiBUaGlzIG1lYW5zIHRoYXQgdHdvIGRvbWFpbnMKPiB3aXRo
IERNX1BSSVYgb3ZlciBhIHRhcmdldCBkb21haW4gY2FuIGN1cnJlbnRseSBtYW5pcHVsYXRlIGVh
Y2ggb3RoZXJzCj4gaW9yZXEgc2VydmVycy4KPiAKPiBBIHByZXZpb3VzIHBhdGNoIGFkZGVkIGNv
ZGUgdG8gdGFrZSBhIHJlZmVyZW5jZSBhbmQgc3RvcmUgYSBwb2ludGVyIHRvIHRoZQo+IGRvbWFp
biB0aGF0IGNyZWF0ZXMgYW4gaW9yZXEgc2VydmVyLiBUaGlzIHBhdGNoIG5vdyBhZGRzIGNoZWNr
cyB0byB0aGUKPiBmdW5jdGlvbnMgdGhhdCBtYW5pcHVsYXRlIHRoZSBpb3JlcSBzZXJ2ZXIgdG8g
bWFrZSBzdXJlIHRoZXkgYXJlIGJlaW5nCj4gY2FsbGVkIGJ5IHRoZSBzYW1lIGRvbWFpbi4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoK
UmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
