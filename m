From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 01/12] VMX: reduce number of
 posted-interrupt hooks
Date: Wed, 29 Aug 2018 15:56:27 +0100
Message-ID: <fa37f401-8c48-38e4-ef71-f4d3852b4863@citrix.com>
References: <5B46030502000078001D322E@prv1-mh.provo.novell.com>
 <5B86A5DF02000078001E310B@prv1-mh.provo.novell.com>
 <5B86A6BC02000078001E311D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xzde=lm=citrix.com=prvs=772b5abf7=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fv1u2-0002gu-1g
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 14:57:02 +0000
In-Reply-To: <5B86A6BC02000078001E311D@prv1-mh.provo.novell.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDgvMTggMTQ6NTksIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRocmVlIG9mIHRoZSBmb3Vy
IGhvb2tzIGFyZSBub3QgZXhwb3NlZCBvdXRzaWRlIG9mIHZteC5jLCBhbmQgYWxsIG9mCj4gdGhl
bSBoYXZlIG9ubHkgYSBzaW5nbGUgcG9zc2libGUgbm9uLU5VTEwgdmFsdWUuIFNvIHRoZXJlJ3Mg
bm8gcmVhc29uIHRvCj4gdXNlIGhvb2tzIGhlcmUgLSBhIHNpbXBsZSBzZXQgb2YgZmxhZyBpbmRp
Y2F0b3JzIGlzIHN1ZmZpY2llbnQgKGFuZCB3ZQo+IGRvbid0IGV2ZW4gbmVlZCBhIGZsYWcgZm9y
IHRoZSBWTSBlbnRyeSBvbmUsIGFzIGl0J3MgYWx3YXlzCj4gKGRlLSlhY3RpdmF0ZWQgdG9nZXRo
ZXIgdGhlIHRoZSB2Q1BVIGJsb2NraW5nIGhvb2ssIHdoaWNoIG5lZWRzIHRvCj4gcmVtYWluIGFu
IGFjdHVhbCBmdW5jdGlvbiBwb2ludGVyKS4gVGhpcyBpcyB0aGUgbW9yZSB0aGF0IHdpdGggdGhl
Cj4gU3BlY3RyZSB2MiB3b3JrYXJvdW5kcyBpbmRpcmVjdCBjYWxscyBoYXZlIGJlY29tZSBtb3Jl
IGV4cGVuc2l2ZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
