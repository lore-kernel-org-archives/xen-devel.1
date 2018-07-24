From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/pvh: change the order of the iommu
 initialization for Dom0
Date: Tue, 24 Jul 2018 06:36:53 -0600
Message-ID: <5B571D6502000078001D7374@prv1-mh.provo.novell.com>
References: <20180724112900.70208-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vgmm=ki=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fhwYj-0001rb-Re
 for xen-devel@lists.xenproject.org; Tue, 24 Jul 2018 12:36:57 +0000
In-Reply-To: <20180724112900.70208-1-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjA3LjE4IGF0IDEzOjI5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFRoZSBpb21tdSBpbml0aWFsaXphdGlvbiB3aWxsIGFsc28gY3JlYXRlIE1NSU8gbWFwcGluZ3Mg
aW4gdGhlIERvbTAKPiBwMm0sIHNvIHRoZSBwYWdpbmcgbWVtb3J5IHBvb2wgbmVlZHMgdG8gYmUg
YWxsb2NhdGVkIG9yIGVsc2UgaW9tbXUKPiBpbml0aWFsaXphdGlvbiB3aWxsIGZhaWwuCj4gCj4g
TW92ZSB0aGUgY2FsbCB0byBpbml0IHRoZSBpb21tdSBhZnRlciB0aGUgRG9tMCBwMm0gaGFzIGJl
ZW4gc2V0dXAgaW4KPiBvcmRlciB0byBzb2x2ZSB0aGlzLgo+IAo+IE5vdGUgdGhhdCBpc3N1ZXMg
Y2F1c2VkIGJ5IHRoaXMgd3Jvbmcgb3JkZXJpbmcgaGF2ZSBvbmx5IGJlZW4gc2Vlbgo+IHdoZW4g
dXNpbmcgc2hhZG93IHBhZ2luZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
