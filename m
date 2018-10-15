From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] x86: restrict HVMOP_pagetable_dying to
 current
Date: Mon, 15 Oct 2018 12:51:07 +0100
Message-ID: <21d3a7fd-5356-4ee4-02b6-3ac1d6884460@citrix.com>
References: <5BB74B1A02000078001EECBE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rs9x=m3=citrix.com=prvs=819086c3e=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1gC1PS-0005lc-Tw
 for xen-devel@lists.xenproject.org; Mon, 15 Oct 2018 11:51:42 +0000
In-Reply-To: <5BB74B1A02000078001EECBE@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDUvMjAxOCAxMjoyOSBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhpcyBpcyBub3Qg
dXNlZCAoYW5kIHByb2JhYmx5IHdhcyBuZXZlciBtZWFudCB0byBiZSkgYnkgdGhlIHRvb2wgc3Rh
Y2suCj4gTGltaXRpbmcgaXQgdG8gdGhlIGN1cnJlbnQgZG9tYWluIGluIHBhcnRpY3VsYXIgYWxs
b3dzIHRvIGVsaW1pbmF0ZSBhCj4gYm9ndXMgdXNlIG9mIHZDUFUgMCBpbiBwYWdldGFibGVfZHlp
bmcoKS4KPiAKPiBSZW1vdmUgdGhlIG5vdyB1bm5lY2Vzc2FyeSBkb21haW4vdkNQVSBwYXJhbWV0
ZXJzIGZyb20gdGhlIHdyYXBwZXIvaG9vawo+IGZ1bmN0aW9ucyBhdCB0aGUgc2FtZSB0aW1lLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCk1NIGJp
dHMgQWNrZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
