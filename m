From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 13/18] tools/xenstat: Fix shared library
 version
Date: Tue, 9 Oct 2018 14:59:05 +0100
Message-ID: <32d10d60-4a24-e766-4ffd-66a751e45a0b@citrix.com>
References: <20181005172917.11963-1-ian.jackson@citrix.com>
 <20181005172917.11963-14-ian.jackson@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ebgz=mv=citrix.com=prvs=8132bb835=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g9sXU-0008FT-9t
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 13:59:08 +0000
In-Reply-To: <20181005172917.11963-14-ian.jackson@citrix.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
Cc: Bastian Blank <waldi@debian.org>, Hans van Kranenburg <hans@knorrie.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMTAvMTggMTg6MjksIElhbiBKYWNrc29uIHdyb3RlOgo+IEZyb206IEJhc3RpYW4gQmxh
bmsgPHdhbGRpQGRlYmlhbi5vcmc+Cj4KPiBsaWJ4ZW5zdGF0IGRvZXMgbm90IGhhdmUgYSBzdGFi
bGUgQUJJLiAgU2V0IGl0cyB2ZXJzaW9uIHRvIHRoZSBjdXJyZW50Cj4gWGVuIHJlbGVhc2UgdmVy
c2lvbi4KPgo+IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXgu
Y29tPgo+IC0tLQo+ICB0b29scy94ZW5zdGF0L2xpYnhlbnN0YXQvTWFrZWZpbGUgfCAyICstCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAt
LWdpdCBhL3Rvb2xzL3hlbnN0YXQvbGlieGVuc3RhdC9NYWtlZmlsZSBiL3Rvb2xzL3hlbnN0YXQv
bGlieGVuc3RhdC9NYWtlZmlsZQo+IGluZGV4IDg5NzlmYTE1ODMuLjhjNmRkZjg2ZTggMTAwNjQ0
Cj4gLS0tIGEvdG9vbHMveGVuc3RhdC9saWJ4ZW5zdGF0L01ha2VmaWxlCj4gKysrIGIvdG9vbHMv
eGVuc3RhdC9saWJ4ZW5zdGF0L01ha2VmaWxlCj4gQEAgLTE4LDcgKzE4LDcgQEAgaW5jbHVkZSAk
KFhFTl9ST09UKS90b29scy9SdWxlcy5tawo+ICBMRENPTkZJRz1sZGNvbmZpZwo+ICBNQUtFX0xJ
Tks9bG4gLXNmCj4gIAo+IC1NQUpPUj0wCj4gK01BSk9SPTQuMTEKCkkgc2VlIHlvdSd2ZSBhbHJl
YWR5IGNvbW1pdHRlZCB0aGlzIHBhdGNoLCBidXQgeW91IGRvbid0IG1lYW4gNC4xMSBoZXJlLgoK
fkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
