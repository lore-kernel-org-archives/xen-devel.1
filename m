From: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v5 2/2] mm/page_alloc: remove software
 prefetching in __free_pages_core
Date: Tue, 9 Oct 2018 11:30:37 +0200
Message-ID: <20181009093037.GI8528__14551.4954849661$1539077367$gmane$org@dhcp22.suse.cz>
References: <1538727006-5727-1-git-send-email-arunks@codeaurora.org>
 <1538727006-5727-2-git-send-email-arunks@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mbow=mv=kernel.org=mhocko@srs-us1.protection.inumbo.net>)
 id 1g9oLf-0004ef-Me
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 09:30:39 +0000
Content-Disposition: inline
In-Reply-To: <1538727006-5727-2-git-send-email-arunks@codeaurora.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Arun KS <arunks@codeaurora.org>
Cc: vatsa@codeaurora.org, linux-mm@kvack.org, getarunks@gmail.com, kys@microsoft.com, boris.ostrovsky@oracle.com, sthemmin@microsoft.com, xen-devel@lists.xenproject.org, haiyangz@microsoft.com, yasu.isimatu@gmail.com, dan.j.williams@intel.com, akpm@linux-foundation.org, vbabka@suse.cz, osalvador@suse.de, jgross@suse.com, aaron.lu@intel.com, malat@debian.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, vinmenon@codeaurora.org, jrdr.linux@gmail.com, devel@linuxdriverproject.org, iamjoonsoo.kim@lge.com, mgorman@techsingularity.net, kirill.shutemov@linux.intel.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpIDA1LTEwLTE4IDEzOjQwOjA2LCBBcnVuIEtTIHdyb3RlOgo+IFRoZXkgbm90IG9ubHkg
aW5jcmVhc2UgdGhlIGNvZGUgZm9vdHByaW50LCB0aGV5IGFjdHVhbGx5IG1ha2UgdGhpbmdzCj4g
c2xvd2VyIHJhdGhlciB0aGFuIGZhc3Rlci4gUmVtb3ZlIHRoZW0gYXMgY29udGVtcG9yYXJ5IGhh
cmR3YXJlIGRvZXNuJ3QKPiBuZWVkIGFueSBoaW50LgoKSSBhZ3JlZSB3aXRoIHRoZSBjaGFuZ2Ug
YnV0IGl0IGlzIG11Y2ggYmV0dGVyIHRvIGFkZCBzb21lIG51bWJlcnMKd2hlbmV2ZXIgYXJndWlu
ZyBhYm91dCBwZXJmb3JtYW5jZSBpbXBhY3QuCgo+IAo+IFN1Z2dlc3RlZC1ieTogRGFuIFdpbGxp
YW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQXJ1biBLUyA8
YXJ1bmtzQGNvZGVhdXJvcmEub3JnPgo+IC0tLQo+ICBtbS9wYWdlX2FsbG9jLmMgfCA2ICstLS0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL21tL3BhZ2VfYWxsb2MuYyBiL21tL3BhZ2VfYWxsb2MuYwo+IGluZGV4IDdh
YjUyNzQuLjkwZGI0MzEgMTAwNjQ0Cj4gLS0tIGEvbW0vcGFnZV9hbGxvYy5jCj4gKysrIGIvbW0v
cGFnZV9hbGxvYy5jCj4gQEAgLTEyNTgsMTQgKzEyNTgsMTAgQEAgdm9pZCBfX2ZyZWVfcGFnZXNf
Y29yZShzdHJ1Y3QgcGFnZSAqcGFnZSwgdW5zaWduZWQgaW50IG9yZGVyKQo+ICAJc3RydWN0IHBh
Z2UgKnAgPSBwYWdlOwo+ICAJdW5zaWduZWQgaW50IGxvb3A7Cj4gIAo+IC0JcHJlZmV0Y2h3KHAp
Owo+IC0JZm9yIChsb29wID0gMDsgbG9vcCA8IChucl9wYWdlcyAtIDEpOyBsb29wKyssIHArKykg
ewo+IC0JCXByZWZldGNodyhwICsgMSk7Cj4gKwlmb3IgKGxvb3AgPSAwOyBsb29wIDwgbnJfcGFn
ZXMgOyBsb29wKyssIHArKykgewo+ICAJCV9fQ2xlYXJQYWdlUmVzZXJ2ZWQocCk7Cj4gIAkJc2V0
X3BhZ2VfY291bnQocCwgMCk7Cj4gIAl9Cj4gLQlfX0NsZWFyUGFnZVJlc2VydmVkKHApOwo+IC0J
c2V0X3BhZ2VfY291bnQocCwgMCk7Cj4gIAo+ICAJcGFnZV96b25lKHBhZ2UpLT5tYW5hZ2VkX3Bh
Z2VzICs9IG5yX3BhZ2VzOwo+ICAJc2V0X3BhZ2VfcmVmY291bnRlZChwYWdlKTsKPiAtLSAKPiAx
LjkuMQo+IAoKLS0gCk1pY2hhbCBIb2NrbwpTVVNFIExhYnMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
