From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] pci: a workaround for nonstandard PCI
 devices whose PBA shares
Date: Wed, 4 Apr 2018 16:45:32 +0100
Message-ID: <20180404154532.nqdy4x3s2dvdsugn@MacBook-Pro-de-Roger.local>
References: <1522855779-91409-1-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1522855779-91409-1-git-send-email-chao.gao@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chao Gao <chao.gao@intel.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBcHIgMDQsIDIwMTggYXQgMTE6Mjk6MzlQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gLi4uIHRoZSBzYW1lIHBhZ2Ugd2l0aCBvdGhlciByZWdpc3RlcnMgd2hpY2ggYXJlIG5vdCBy
ZWxldmFudCB0byBNU0ktWC4gWGVuCj4gbWFya3MgcGFnZXMgd2hlcmUgUEJBIHJlc2lkZXMgYXMg
cmVhZC1vbmx5LiBXaGVuIGFzc2lnbmluZyBzdWNoIGRldmljZXMgdG8KPiBndWVzdCwgZGV2aWNl
IGRyaXZlciB3cml0ZXMgTVNJLVggaXJyZWxldmFudCByZWdpc3RlcnMgb24gdGhvc2UgcGFnZXMg
d291bGQKPiBsZWFkIHRvIGFuIEVQVCB2aW9sYXRpb24gYW5kIHRoZSBndWVzdCBpcyBkZXN0cm95
ZWQgYmVjYXVzZSBubyBoYW5kbGVyIGlzCj4gcmVnaXN0ZXJlZCBmb3IgdGhvc2UgYWRkcmVzcyBy
YW5nZS4gSW4gb3JkZXIgdG8gbWFrZSBndWVzdCBjYXBhYmxlIHRvIHVzZSBzdWNoCj4ga2luZCBv
ZiBkZXZpY2VzLCB0cmFwcGluZyB2ZXJ5IGZyZXF1ZW50IHdyaXRlIGFjY2Vzc2VzIGlzIG5vdCBh
IGdvb2QgaWRlYSBmb3IKPiBpdCB3b3VsZCBzaWduaWZpY2FudGx5IGltcGFjdCB0aGUgcGVyZm9y
bWFuY2UuCj4gCj4gVGhpcyBwYXRjaCBwcm92aWRlcyBhIHdvcmthcm91bmQgd2l0aCBjYXZlYXQu
IFNwZWNpZmljYWxseSwgYW4gb3B0aW9uIGlzCj4gaW50cm9kdWNlZCB0byBzcGVjaWZ5IGEgbGlz
dCBvZiBkZXZpY2VzLiBGb3IgdGhvc2UgZGV2aWNlcywgWGVuIGRvZXNuJ3QKPiBjb250cm9sIHRo
ZSBhY2Nlc3MgcmlnaHQgdG8gcGFnZXMgd2hlcmUgUEJBIHJlc2lkZXMuIEhlbmNlLCBndWVzdCBk
ZXZpY2UKPiBkcml2ZXIgaXMgYWJsZSB0byB3cml0ZSB0aG9zZSBwYWdlcyBhbmQgZnVuY3Rpb25z
IHdlbGwuIE5vdGUgdGhhdCBhZGRpbmcgYW4KPiB1bnRydXN0ZWQgZGV2aWNlIHRvIHRoaXMgb3B0
aW9uIG1heSBlbmRhbmdlciBzZWN1cml0eSBvZiB0aGUgZW50aXJlIHN5c3RlbS4KClRoaXMgaXMg
YSBjbGVhciB2aW9sYXRpb24gb2YgdGhlIE1TSS1YIHNwZWMuIE91dCBvZiBjdXJpb3NpdHksIHdo
aWNoCmRldmljZSBpcyBpdCB0aGF0IHBsYWNlcyByYW5kb20gcmVnaXN0ZXJzIGluIHRoZSBzYW1l
IHBhZ2UgYXMgdGhlIFBCQT8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
