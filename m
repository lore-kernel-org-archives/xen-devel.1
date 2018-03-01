From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 3/7] x86: introduce altinstruction_nop
	assembler macro
Date: Thu, 1 Mar 2018 19:25:55 +0000
Message-ID: <16f0a78d-e4da-2e3a-0b00-978fa69f9df1@citrix.com>
References: <5A7B31DF02000078001A61F9@prv-mh.provo.novell.com>
 <5A7B33AD02000078001A6225@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=drue=fx=citrix.com=prvs=5913fcd06=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1erTq3-0007bb-Fx
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 19:25:59 +0000
In-Reply-To: <5A7B33AD02000078001A6225@prv-mh.provo.novell.com>
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

T24gMDcvMDIvMTggMTY6MTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoaXMgYWxsb3dzIHNob3J0
ZW5pbmcgKGFuZCBtYWtpbmcgbW9yZSBvYnZpb3VzIHdoYXQgdGhleSBkbykgc29tZQo+IGFsdGlu
c3RydWN0aW9uX2VudHJ5IHVzZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CgpJbiBwcmluY2lwbGUsIFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiwKYnV0IEknZCBwcmVmZXIgaWYgeW91IGhlbGQg
aXQgYmFjayB1bnRpbCBteSBub3AgY2FsY3VsYXRpb24gc2VyaWVzIGlzCmluLCB3aGljaCB3aWxs
IGRyb3AgdGhpcyBwYXRjaCBkb3duIHRvIHRoZSBzaW5nbGUgaHVuayBpbiBhbHRlcm5hdGl2ZS1h
c20uaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
