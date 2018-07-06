From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: fix dependency tracking for
 asm/indirect_thunk_asm.h
Date: Fri, 6 Jul 2018 13:38:40 +0100
Message-ID: <4bfd8740-287a-7c3b-c0f9-f534b90a0a13@citrix.com>
References: <5B31ED1E02000078001CDD5F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=khol=jw=citrix.com=prvs=7188636b3=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fbQ0Z-0006al-UP
 for xen-devel@lists.xenproject.org; Fri, 06 Jul 2018 12:38:43 +0000
In-Reply-To: <5B31ED1E02000078001CDD5F@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDYvMTggMDg6MzcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEluY2x1ZGluZyB0aGUgaGVh
ZGVyIHNvbGVseSBhdCB0aGUgYXNzZW1ibGVyIGxldmVsIG1lYW5zIHRoZSBjb21waWxlcgo+IGNh
bid0IHJlY29yZCB0aGUgaGVhZGVyIGFzIGEgZGVwZW5kZW5jeSBpbiAuKi5vLmQgZmlsZXMuIEFy
cmFuZ2UgZm9yIHRoZQo+IGhlYWRlciB0byBiZSBpbmNsdWRlLWFibGUgYXQgdGhlIEMgbGV2ZWwg
aW5zdGVhZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
