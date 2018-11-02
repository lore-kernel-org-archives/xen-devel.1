From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/3] x86emul: VME and PVI modes require a
 #GP(0) check first thing
Date: Fri, 2 Nov 2018 18:04:09 +0000
Message-ID: <fd4b3f90-4b1e-598a-8fef-abb0611d8bfd@citrix.com>
References: <5BDC7E5802000078001F75BA@prv1-mh.provo.novell.com>
 <5BDC7F0D02000078001F75CC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=a587=nn=citrix.com=prvs=837a34217=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gIdoN-0002Z8-A6
 for xen-devel@lists.xenproject.org; Fri, 02 Nov 2018 18:04:47 +0000
In-Reply-To: <5BDC7F0D02000078001F75CC@prv1-mh.provo.novell.com>
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

T24gMDIvMTEvMTggMTY6NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEFzIGV4cGxpY2l0bHkgc3Bl
bGxlZCBvdXQgYnkgdGhlIFNETSwgRUZMQUdTLlZJRiBhbmQgRUZMQUdTLlZJUCBib3RoIHNldAo+
IGF0IHRoZSBzdGFydCBvZiBhbiBpbnN0cnVjdGlvbiB0cmlnZ2VyICNHUCgwKSBpbmRlcGVuZGVu
dCBvZiBhY3R1YWwKPiBpbnN0cnVjdGlvbi4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
