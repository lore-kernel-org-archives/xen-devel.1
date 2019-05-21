From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v8 20/50] x86emul: support AVX512F
 legacy-equivalent packed int/FP conversion insns
Date: Tue, 21 May 2019 12:37:58 +0100
Message-ID: <318b9d9e-6656-9a37-8454-7e5d48ebba79@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B82D6020000780021F1CA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6u0k=TV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hT35p-00033t-ND
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 11:38:05 +0000
In-Reply-To: <5C8B82D6020000780021F1CA@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDMvMjAxOSAxMDo0NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gLi4uIGluY2x1ZGluZyB0
aGUgdHdvIEFWWDUxMkRRIGZvcm1zIHdoaWNoIHNoYXJlZCBlbmNvZGluZ3MsIGp1c3Qgd2l0aAo+
IEVWRVguVyBzZXQgdGhlcmUuCj4KPiBWQ1ZURFEyUEQsIHNoYXJpbmcgaXRzIG1haW4gb3Bjb2Rl
IHdpdGggb3RoZXJzLCBuZWVkcyBhICJtYW51YWwiCj4gb3ZlcnJpZGUgb2YgZGlzcDhzY2FsZS4K
Pgo+IFRoZSBzaW1kX3NpemUgY2hhbmdlcyBmb3IgdGhlIHR3b2J5dGVfdGFibGVbXSBlbnRyaWVz
IGFyZSBiZW5pZ24gdG8KPiBwcmUtZXhpc3RpbmcgY29kZSwgYnV0IGFsbG93IGRlY29kZV9kaXNw
OHNjYWxlKCkgdG8gd29yayBhcyBpcyBoZXJlLgo+Cj4gVGhlIGF0IHRoaXMgcG9pbnQgd3Jvbmcg
cGxhY2VtZW50IG9mIHRoZSAweGU2IGNhc2UgYmxvY2sgaXMgb25jZSBhZ2Fpbgo+IGluIGFudGlj
aXBhdGlvbiBvZiBmdXJ0aGVyIGFkZGl0aW9ucyBvZiBjYXNlIGxhYmVscy4KPgo+IFNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkFja2VkLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
