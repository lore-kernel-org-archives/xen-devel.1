From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: use alternatives for FS/GS base
 accesses
Date: Tue, 25 Sep 2018 17:52:46 +0100
Message-ID: <75451888-e35c-8758-7a51-ea7e80d2c6e2@citrix.com>
References: <5B86C3B502000078001E32EC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gmpq=mh=citrix.com=prvs=79922396b=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g4qzG-0003Xk-F3
 for xen-devel@lists.xenproject.org; Tue, 25 Sep 2018 17:19:02 +0000
In-Reply-To: <5B86C3B502000078001E32EC@prv1-mh.provo.novell.com>
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

T24gMjkvMDgvMTggMTc6MDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEVsaW1pbmF0ZXMgYSBjb3Vw
bGUgb2YgYnJhbmNoZXMgaW4gcGFydGljdWxhciBmcm9tIHRoZSBjb250ZXh0IHN3aXRjaAo+IHBh
dGguCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpJ
J3ZlIGFscmVhZHkgZXhwcmVzc2VkIGEgZGlzLWluY2xpbmF0aW9uIHRvIHRoaXMgcGF0Y2gsIGJl
Y2F1c2UgaXQgbG9va3MKbGlrZSBhIG1pY3JvLW9wdGltaXNhdGlvbiB3aGljaCB3b24ndCBhY3R1
YWxseSBhZmZlY3QgbWVhc3VyZWFibGUKcGVyZm9ybWFuY2UuwqAgKEFuZCBhcyBzYWlkIGJlZm9y
ZSwgSSBjb3VsZCBiZSB3cm9uZywgYnV0IEkgZG9uJ3QgdGhpbmsgSQphbS4uLikKCkhhdmUgeW91
IGRvbmUgc29tZSBwZXJmIGFuYWx5c2lzIHNpbmNlIHlvdSBsYXN0IHBvc3RlZCBpdD8KCn5BbmRy
ZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
