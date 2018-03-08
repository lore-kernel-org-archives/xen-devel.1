From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 1/9] x86/mm: add pv prefix to {alloc,
 free}_page_type
Date: Thu, 08 Mar 2018 10:03:11 -0700
Message-ID: <5AA17ADF02000078001AFF0D@prv-mh.provo.novell.com>
References: <20180213200408.5463-1-wei.liu2@citrix.com>
 <20180213200408.5463-2-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=bbjo=f6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1etywl-0002xa-Mt
 for xen-devel@lists.xenproject.org; Thu, 08 Mar 2018 17:03:15 +0000
In-Reply-To: <20180213200408.5463-2-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjAyLjE4IGF0IDIxOjA0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
VGhlIHR3byBmdW5jdGlvbnMgYXJlIG9ubHkgdXNlZCBieSBQViBjb2RlIHBhdGhzIGJlY2F1c2U6
Cj4gCj4gMS4gVG8gYWxsb2NhdGUgYSBQR1RfbCpfcGFnZV90YWJsZSB0eXBlIHBhZ2UsIGEgRG9t
VSBtdXN0IGV4cGxpY2l0bHkKPiAgICByZXF1ZXN0IHN1Y2ggdHlwZXMgdmlhIFBWIE1NVSBoeXBl
cmNhbGwuCj4gMi4gUFYgRG9tMCBidWlsZGVyIGV4cGxpY2l0bHkgYXNrcyBmb3IgUEdUX2wqX3Bh
Z2VfdGFibGUgdHlwZSBwYWdlcywKPiAgICBidXQgaXQgaXMgb2J2aW91c2x5IFBWIG9ubHkuCj4g
My4gcDJtX2FsbG9jX3B0cCBleHBsaWNpdGx5IHNldHMgUEdUX2wxX3BhZ2VfdGFibGUsIGJ1dCB0
aGUgYWxsb2NhdGlvbgo+ICAgIGFuZCBkZWFsbG9jYXRpb24gb2Ygc3VjaCBwYWdlcyBkb24ndCBn
byB0aHJvdWdoIHRoZSB0d28gZnVuY3Rpb25zCj4gICAgdG91Y2hlZCBpbiB0aGlzIHBhdGNoLgo+
IDQuIHNoYWRvd19lbmFibGUgZXhwbGljaXRseSBzZXRzIFBHVF9sMl9wYWdlX3RhYmxlLCBidXQg
dGhlIGFsbG9jYXRpb24KPiAgICBhbmQgZGVhbGxvY2F0aW9uIG9mIHN1Y2ggcGFnZXMgZG9uJ3Qg
Z28gdGhyb3VnaCB0aGUgdHdvIGZ1bmN0aW9ucwo+ICAgIHRvdWNoZWQgaW4gdGhpcyBwYXRjaC4K
PiAKPiBBbHNvIG1vdmUgdGhlIGRlY2xhcmF0aW9ucyB0byBwdi9tbS5oLiBUaGUgY29kZSB3aWxs
IGJlIG1vdmVkIGxhdGVyLgo+IFRha2UgdGhlIGNoYW5jZSB0byBjaGFuZ2UgcHJlZW1wdGlibGUg
dG8gYm9vbC4KCkknbSBmaW5lIHdpdGggdGhlIG1vdmVtZW50LCBidXQgSSdtIG5vdCBjb252aW5j
ZWQgZWFjaCBhbmQgZXZlcnkKZnVuY3Rpb24gdXNlZCBieSBQViBvbmx5IG5lZWRzIHRvIG9idGFp
biBhIHB2XyBwcmVmaXguIFRoZXNlIGlzIGEKZ2VuZXJpYyBtZW1vcnkgbWFuYWdlbWVudCBoZWxw
ZXJzOyBpdCBqdXN0IHNvIGhhcHBlbnMgdGhhdCB0aGV5J3JlCm5lZWRlZCBmb3IgUFYgb25seSAo
dGhlIGFidXNlIG9mIHRoZSBQR1RfbHsxLDJ9X3BhZ2VfdGFibGUgdHlwZXMKeW91IG1lbnRpb24g
YWJvdmUgd291bGQgb3RoZXJ3aXNlIG5lZWQgdG8gZ28gYXdheSBhcyB3ZWxsLCBhcwp0aG9zZSBw
YWdlIHR5cGVzIHRoZW4gYWxzbyB3b3VsZCBuZWVkIHRvIGJlY29tZSBQVi1vbmx5LCBpbmNsdWRp
bmcKdGhlaXIgbmFtZXMpLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
