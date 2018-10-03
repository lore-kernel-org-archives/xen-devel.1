From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 05/12] x86/genapic: remove indirection
 from genapic hook accesses
Date: Wed, 3 Oct 2018 20:04:57 +0100
Message-ID: <a4c297d8-5e0e-9306-c421-ce0a54abe875@citrix.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5BB343D802000078001ED9F6@prv1-mh.provo.novell.com>
 <5BB3450202000078001EDA14@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=twgs=mp=citrix.com=prvs=8071b990d=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g7mST-00016Z-KA
 for xen-devel@lists.xenproject.org; Wed, 03 Oct 2018 19:05:17 +0000
In-Reply-To: <5BB3450202000078001EDA14@prv1-mh.provo.novell.com>
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

T24gMDIvMTAvMTggMTE6MTQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEluc3RlYWQgb2YgbG9hZGlu
ZyBhIHBvaW50ZXIgYXQgZWFjaCB1c2Ugc2l0ZSwgaGF2ZSBhIHNpbmdsZSBydW50aW1lCj4gaW5z
dGFuY2Ugb2Ygc3RydWN0IGdlbmFwaWMsIGNvcHlpbmcgaW50byBpdCBmcm9tIHRoZSBpbmRpdmlk
dWFsCj4gaW5zdGFuY2VzLiBUaGUgaW5kaXZpZHVhbCBpbnN0YW5jZXMgY2FuIHRoaXMgd2F5IGFs
c28gYmUgbW92ZWQgdG8gLmluaXQKPiAoYWxzbyBhZGp1c3QgYXBpY19wcm9iZVtdIGF0IHRoaXMg
b2NjYXNpb24pLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgo+IFJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKQWNrZWQt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
