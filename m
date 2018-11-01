From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [RFC PATCH v2 06/17] libxl: create vkb device only
 for guests with graphics output
Date: Thu, 1 Nov 2018 17:05:34 +0000
Message-ID: <23515.12894.797150.731485@mariner.uk.xensource.com>
References: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
 <ba6c6d2d241f3a41c65951180a5842dde29bd9ce.1533608042.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rvhc=nm=citrix.com=prvs=836b135c8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gIGPg-00083B-5Y
 for xen-devel@lists.xenproject.org; Thu, 01 Nov 2018 17:05:44 +0000
In-Reply-To: <ba6c6d2d241f3a41c65951180a5842dde29bd9ce.1533608042.git-series.marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

KENDaW5nIFN0ZWZhbm8ncyBuZXcgYWRkcmVzcy4pCgpNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kgd3JpdGVzICgiW1JGQyBQQVRDSCB2MiAwNi8xN10gbGlieGw6IGNyZWF0ZSB2a2IgZGV2aWNl
IG9ubHkgZm9yIGd1ZXN0cyB3aXRoIGdyYXBoaWNzIG91dHB1dCIpOgo+IFRoZSBmb3JjZWQgdmti
IGRldmljZSBpcyBtZWFudCBmb3IgYmV0dGVyIHBlcmZvcm1hbmNlIG9mIHFlbXUgYWNjZXNzCj4g
KGF0IGxlYXN0IGFjY29yZGluZyB0byBlYmJkMjU2MWI0Y2VmYjI5OWYwZjY4YTg4YjI3ODg1MDQy
MjNkZTE4ICJsaWJ4bDoKPiBBZGQgYSB2a2JkIGZyb250ZW5kL2JhY2tlbmQgcGFpciBmb3IgSFZN
IGd1ZXN0cyIpLCB3aGljaCBpc24ndCB1c2VkIGlmCj4gdGhlcmUgaXMgbm8gY29uZmlndXJlZCBj
aGFubmVsIHRvIGFjdHVhbGx5IGFjY2VzcyB0aGF0IGtleWJvYXJkLgoKSSB0aGluayB0aGUgYmFj
a2dyb3VuZCBoZXJlIGlzIHRoYXQgdGhlICJ1c2Iga2V5Ym9hcmQvbW91c2UiIHJlZmVycmVkCnRv
IGluIGViYmQyNTYxIGlzIHN1cHBvc2VkbHkgdXNlZCBvbmx5IGZvciB2bmMgPwoKSSB0aGluayB3
ZSBzdGlsbCBzdXBwb3J0IFNETCB0aG91Z2gsIHNvIG1heWJlIHRoYXQgbmVlZHMgdG8gYmUgY2hl
Y2tlZAp0b28uICBJIGRpZCBgZ2l0LWdyZXAgLWkgc2RsIHRvb2xzL2xpYnhsJyBhbmQgdGhlcmUn
cyBhIGZldwpvY2N1cnJlbmNlcyBvZiBzb21ldGhpbmcgbGlrZSB0aGlzCiAgdG9vbHMvbGlieGwv
bGlieGxfZG0uYzogICAgICAgIGlmICghc2RsICYmICF2bmMpCmluIHBhcnRpY3VsYXIsIGluIG9u
ZSBvZiB0aGVzZSBjYXNlcyBpdCBwYXNzZXMgLW5vZ3JhcGhpYyB0byBxZW11LgoKUHJvYmFibHkg
dGhlIHNpdHVhdGlvbnMgd2hlcmUgd2Ugc2hvdWxkbid0IHVuY29uZGl0aW9uYWxseSBwcm92aWRl
IGEKdmtiIGFyZSB0aG9zZSB3aGVyZSAtbm9ncmFwaGljIGlzIHBhc3NlZCB0byBxZW11ID8KCk1h
eWJlIHdlIG5lZWQgYSBoZWxwZXIgaW5saW5lIGZ1bmN0aW9uIGZvciBzZGwgfHwgdm5jLiAgSWYg
eW91IGRlY2lkZQp0byBpbnRyb2R1Y2Ugb25lLCBwbGVhc2UgZG8gdGhhdCBpbiBhIHBhdGNoIGJl
Zm9yZSB0aGlzIG9uZS4KClRoYW5rcywKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
