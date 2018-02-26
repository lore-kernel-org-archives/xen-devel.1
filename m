From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2] tools/xenstore: try to get minimum
 thread stack size for watch thread
Date: Mon, 26 Feb 2018 10:38:38 +0000
Message-ID: <20180226103838.ub7dg4a6e35bqpxf@citrix.com>
References: <20180226084612.2844-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=6hhj=fu=citrix.com=prvs=588a5efd2=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eqGBY-0005aa-Jx
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 10:39:08 +0000
Content-Disposition: inline
In-Reply-To: <20180226084612.2844-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, jfehlig@suse.com, ian.jackson@eu.citrix.com, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBGZWIgMjYsIDIwMTggYXQgMDk6NDY6MTJBTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBXaGVuIGNyZWF0aW5nIGEgcHRocmVhZCBpbiB4c193YXRjaCgpIHRyeSB0byBnZXQg
dGhlIG1pbmltYWwgbmVlZGVkCj4gc2l6ZSBvZiB0aGUgdGhyZWFkIGZyb20gZ2xpYmMgaW5zdGVh
ZCBvZiB1c2luZyBhIGNvbnN0YW50LiBUaGlzIGF2b2lkcwo+IHByb2JsZW1zIHdoZW4gdGhlIGxp
YnJhcnkgaXMgdXNlZCBpbiBwcm9ncmFtcyB3aXRoIGxhcmdlIHBlci10aHJlYWQKPiBtZW1vcnku
Cj4gCj4gVXNlIGRsc3ltKCkgdG8gZ2V0IHRoZSBwb2ludGVyIHRvIF9fcHRocmVhZF9nZXRfbWlu
c3RhY2soKSBpbiBvcmRlciB0bwo+IGF2b2lkIGxpbmthZ2UgcHJvYmxlbXMgYW5kIGZhbGwgYmFj
ayB0byB0aGUgY3VycmVudCBjb25zdGFudCBzaXplIGlmCj4gbm90IGZvdW5kLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBX
ZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKSSB3b3VsZCBsaWtlIHRvIGdpdmUgSmltIGEg
Y2hhbmNlIHRvIHRlc3QgaXQgYmVmb3JlIGFwcGx5aW5nLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
