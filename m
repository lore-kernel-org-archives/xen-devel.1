From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: put_page_from_l2e() should honor
 _PAGE_RW
Date: Tue, 9 Oct 2018 12:00:33 +0100
Message-ID: <68650461-8633-4efe-4c7f-ae2812997071@citrix.com>
References: <5BBC4DF902000078001EFD18@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ebgz=mv=citrix.com=prvs=8132bb835=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g9pl8-0005ql-00
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 11:01:02 +0000
In-Reply-To: <5BBC4DF902000078001EFD18@prv1-mh.provo.novell.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMTAvMTggMDc6NDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IDU2ZmZmM2U1ZTkgKCJ4ODY6
IG51a2UgUFYgc3VwZXJwYWdlIG9wdGlvbiBhbmQgY29kZSIpIGhhcyBpbnRyb2R1Y2VkIGEKPiAo
bHVja2lseSBsYXRlbnQgb25seSkgYnVnIGhlcmUsIGluIHRoYXQgaXQgZGlkbid0IG1ha2UgcmVm
ZXJlbmNlCj4gZHJvcHBpbmcgZGVwZW5kZW50IG9uIHdoZXRoZXIgdGhlIHBhZ2Ugd2FzIG1hcHBl
ZCB3cml0YWJsZS4gVGhlIG9ubHkKPiBjdXJyZW50IHNvdXJjZSBvZiBsYXJnZSBwYWdlIG1hcHBp
bmdzIGZvciBQViBkb21haW5zIGlzIHRoZSBEb20wCj4gYnVpbGRlciwgd2hpY2ggb25seSBwcm9k
dWNlcyB3cml0ZWFibGUgb25lcy4KPgo+IFRha2UgdGhlIG9wcG9ydHVuaXR5IGFuZCBhbHNvIGNv
bnZlcnQgdG8gYm9vbCBib3RoIHB1dF9kYXRhX3BhZ2UoKSdzCj4gcmVzcGVjdGl2ZSBwYXJhbWV0
ZXIgYW5kIHRoZSBhcmd1bWVudCBwdXRfcGFnZV9mcm9tX2wzZSgpIHBhc3Nlcy4KPgo+IFNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
