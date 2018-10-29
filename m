From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/4] x86/vvmx: Unconditionally initialise
 vmxon_region_pa during vcpu construction
Date: Mon, 29 Oct 2018 09:20:16 -0600
Message-ID: <5BD7253002000078001F5E31@prv1-mh.provo.novell.com>
References: <1540481802-20037-1-git-send-email-andrew.cooper3@citrix.com>
 <1540481802-20037-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1540481802-20037-2-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjEwLjE4IGF0IDE3OjM2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhpcyBpcyBhIHN0b3BnYXAgc29sdXRpb24gdW50aWwgdGhlIHRvb2xzdGFjayBzaWRl
IG9mIGluaXRpYWxpc2F0aW9uIGNhbiBiZQo+IHNvcnRlZCBvdXQsIGJ1dCBpdCBkb2VzIHJlc3Vs
dCBpbiB0aGUgbnZteF92Y3B1X2luX3ZteCgpIHByZWRpY2F0ZSB3b3JraW5nCj4gY29ycmVjdGx5
IGV2ZW4gd2hlbiBuZXN0ZWQgdmlydCBoYXNuJ3QgYmVlbiBlbmFibGVkIGZvciB0aGUgZG9tYWlu
Lgo+IAo+IFVwZGF0ZSBudm14X2hhbmRsZV92bXhfaW5zbigpIHRvIGluY2x1ZGUgdGhlIGluLXZt
eCBtb2RlIGNoZWNrIChmb3IgYWxsCj4gaW5zdHJ1Y3Rpb25zIG90aGVyIHRoYW4gVk1YT04pIHRv
IGNvbXBsZXRlIHRoZSBzZXQgb2YgI1VEIGNoZWNrcy4KPiAKPiBJbiBhZGRpdGlvbiwgc2FuaXR5
IGNoZWNrIHRoYXQgdGhlIG5lc3RlZCB2bWV4aXQgaGFuZGxlciBoYXMgd29ya2VkIGNvcnJlY3Rs
eSwKPiBhbmQgdGhhdCB3ZSBhcmUgb25seSBwcm92aWRpbmcgZW11bGF0aW9uIG9mIHRoZSBWVC14
IGluc3RydWN0aW9ucyB0byBMMQo+IGd1ZXN0cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
