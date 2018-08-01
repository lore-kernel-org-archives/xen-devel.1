From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 01/15] re-work commit 3e06b989 "IOMMU:
 make page table population preemptible"...
Date: Wed, 1 Aug 2018 18:15:17 +0200
Message-ID: <20180801161517.kg3diasbulao6jei@mac>
References: <20180801134028.1654-1-paul.durrant@citrix.com>
 <20180801134028.1654-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jtvh=kq=citrix.com=prvs=7445e0bd4=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fktma-0002DE-CD
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 16:15:28 +0000
Content-Disposition: inline
In-Reply-To: <20180801134028.1654-2-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBdWcgMDEsIDIwMTggYXQgMDI6NDA6MTRQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IC4uLnRvIHNpbXBsaWZ5IHRoZSBpbXBsZW1lbnRhdGlvbiBhbmQgdHVybiBuZWVkX2lv
bW11IGJhY2sgaW50byBhIGJvb2xlYW4uCj4gCj4gQXMgbm90ZWQgaW4gWzFdIHRoZSB0cmktc3Rh
dGUgbmF0dXJlIG9mIG5lZWRfaW9tbXUgYWZ0ZXIgY29tbWl0IDNlMDZiOTg5IGlzCj4gY29uZnVz
aW5nLCBhcyBpcyB0aGUgaW1wbGVtZW50YXRpb24gb2YgcHJlLWVtcHRpb24gdXNpbmcgcmVsbWVt
X2xpc3QuCj4gCj4gVGhpcyBwYXRjaCBpbnN0ZWFkIHVzZXMgYSBzaW1wbGUgY291bnQgb2YgcGFn
ZXMgYWxyZWFkeSBwb3B1bGF0ZWQgc3RvcmVkIGluCj4gdGhlIHg4NiB2YXJpYW50IG9mIHN0cnVj
dCBhcmNoX2lvbW11IGFuZCBza2lwcyBvdmVyIHRoYXQgbnVtYmVyIG9mIHBhZ2VzCj4gaWYgYXJj
aF9pb21tdV9wb3B1bGF0ZV9wYWdlX3RhYmxlKCkgaXMgcmUtaW52b2tlZCBhZnRlciBwcmUtZW1w
dGlvbi4KClVyZywgYWxsIHRoaXMgaXMgcXVpdGUgdWdseS4gSXQgd291bGQgYmUgcXVpdGUgYmV0
dGVyIGlmIHRoZSBuZWVkIGZvcgphbiBJT01NVSB3YXMgZGVjaWRlZCBiZWZvcmUgcG9wdWxhdGlu
ZyB0aGUgcDJtIChpZTogYXQgZG9tYWluX2NyZWF0ZQp0aW1lIGJ5IHBhc3NpbmcgYW4gZXh0cmEg
WEVOX0RPTUNUTF9DREZfaW9tbXUgb3Igc29tZSBzdWNoKSwgc28gdGhhdAp0aGUgbm9ybWFsIGFk
ZGl0aW9uIG9mIFJBTSB3b3VsZCBhbHNvIHBvcHVsYXRlIHRoZSBJT01NVSBwYWdlIHRhYmxlcwpp
ZiBub3Qgc2hhcmVkLgoKPiBbMV0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZl
cy9odG1sL3hlbi1kZXZlbC8yMDE4LTA3L21zZzAxODcwLmh0bWwKPiAKPiBTaWduZWQtb2ZmLWJ5
OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKVGhhbmtzLCBSb2dlci4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
