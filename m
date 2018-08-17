From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 0/5] xen/blk: persistent grant rework
Date: Fri, 17 Aug 2018 17:59:09 +0200
Message-ID: <20180817155909.4cwiy6bhhgiala5m__20832.2135768414$1534521481$gmane$org@mac>
References: <20180813140114.20126-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qfmz=la=citrix.com=prvs=760927a5f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fqh9l-0006uD-Mv
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 15:59:21 +0000
Content-Disposition: inline
In-Reply-To: <20180813140114.20126-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: axboe@kernel.dk, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBdWcgMTMsIDIwMTggYXQgMDQ6MDE6MDlQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBQZXJzaXN0ZW50IGdyYW50cyBhcmUgdXNlZCBpbiB0aGUgWGVuJ3MgYmxrZnJvbnQv
YmxrYmFjayBkcml2ZXJzIHRvCj4gYXZvaWQgbWFwcGluZy91bm1hcHBpbmcgb2YgSS9PIGJ1ZmZl
cnMgaW4gdGhlIGJhY2tlbmQgZm9yIGVhY2ggSS9PLgo+IAo+IFdoaWxlIHRoaXMgc3BlZWRzIHVw
IHByb2Nlc3NpbmcgcXVpdGUgYSBiaXQgdGhlcmUgYXJlIHByb2JsZW1zIHJlbGF0ZWQKPiB0byBw
ZXJzaXN0ZW50IGdyYW50cyBpbiBzb21lIGNvbmZpZ3VyYXRpb25zOiBkb21haW5zIHdpdGggbXVs
dGlwbGUKPiBibG9jayBkZXZpY2VzIG1ha2luZyB1c2Ugb2YgcGVyc2lzdGVudCBncmFudHMgbWln
aHQgc3VmZmVyIGZyb20gYSBsYWNrCj4gb2YgZ3JhbnRzIGlmIGVhY2ggb2YgdGhlIGJsb2NrIGRl
dmljZXMgZXhwZXJpZW5jZWQgYSBoaWdoIEkvTyBsb2FkIGF0Cj4gc29tZSB0aW1lLiBUaGlzIGlz
IGR1ZSB0byB0aGUgbnVtYmVyIG9mIHBlcnNpc3RlbnQgZ3JhbnRzIHBlciBkZXZpY2UKPiBvbmx5
IHRvIGJlIGxpbWl0ZWQgYnkgYSByYXRoZXIgaGlnaCBtYXhpbXVtIHZhbHVlLCBidXQgbmV2ZXIg
YmVpbmcKPiByZWxlYXNlZCBldmVuIGluIGNhc2Ugb2YgbG9uZ2VyIHRpbWVzIHdpdGhvdXQgYW55
IEkvTy4KPiAKPiBUaGlzIHNlcmllcyBtb2RpZmllcyB4ZW4tYmxrYmFjayB0byB1bm1hcCBhbnkg
ZG9tVSBwYWdlIG1hcHBlZCB2aWEgYQo+IHBlcnNpc3RlbnQgZ3JhbnQgYWZ0ZXIgYSB0aW1lb3V0
IChkZWZhdWx0OiA2MCBzZWNvbmRzKS4gVGhlIHRpbWVvdXQKPiBpcyBzZXQgdG8gaXRzIGRlZmF1
bHQgdmFsdWUgYWdhaW4gd2hlbiBhIHBlcnNpc3RlbnQgZ3JhbnQgaGFzIGJlZW4KPiB1c2VkIGZv
ciBhbiBJL08uCj4gCj4geGVuLWJsa2Zyb250IGlzIG1vZGlmaWVkIHRvIHNjYW4gZXZlcnkgMTAg
c2Vjb25kcyBmb3IgcGVyc2lzdGVudCBncmFudHMKPiBub3QgaW4gdXNlIGJ5IGJsa2JhY2sgYW55
IG1vcmUgYW5kIHRvIHJlbW92ZSBzdWNoIGdyYW50cy4KPiAKPiBUaGUgbGFzdCAzIHBhdGNoZXMg
YXJlIHNtYWxsIGNsZWFudXBzIG9mIGJsa2Zyb250IGFuZCBibGtiYWNrIGRyaXZlcnMuCj4gCj4g
VjM6Cj4gLSBwYXRjaCAxOiBtYWtlIHRpbWVvdXQgcGFyYW1ldGVyIHN0YXRpYwoKS29ucmFkIGlm
IHlvdSBhcmUgT0sgd2l0aCB0aGlzIHNlcmllcywgY291bGQgeW91IHBsZWFzZSBzZW5kIGEgcHVs
bApyZXF1ZXN0IHRvIEplbnM/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
