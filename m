From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/3] x86emul: raise #GP(0) in VME mode for
 POPF with TF set in new value
Date: Mon, 05 Nov 2018 02:47:21 -0700
Message-ID: <5BE011A902000078001F7D7B@prv1-mh.provo.novell.com>
References: <5BDC7E5802000078001F75BA@prv1-mh.provo.novell.com>
 <5BDC7F3002000078001F75CF@prv1-mh.provo.novell.com>
 <44156271-6b5a-fd35-bb9c-c30a0e158c36@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=5iqt=nq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gJbTl-0001gG-Fj
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 09:47:29 +0000
In-Reply-To: <44156271-6b5a-fd35-bb9c-c30a0e158c36@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAyLjExLjE4IGF0IDE5OjE0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDIvMTEvMTggMTY6NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBUaGlzIGlzIGEg
Y2hlY2sgZXhwbGljaXRseSBsaXN0ZWQgYnkgdGhlIGluc3RydWN0aW9uIHBhZ2UgaW4gdGhlIFNE
TS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+
IAo+IEhtbSAtIGxvb2tpbmcgYXQgdGhlIGxpc3RpbmcsIEkgdGhpbmsgd2UndmUgZ290IGFuIElP
UEwgbWlzbWF0Y2guICBUaGlzCj4gYmVoYXZpb3VyLCBhcyB3ZWxsIGFzIHRoZSBWSVAgYWRqdXN0
bWVudCBpbiBjb250ZXh0LCBvbmx5IGFwcGx5IGF0IElPUEwgPCAzLgoKQWgsIHllcywgYnV0IHRo
YXQnbGwgYmUgYW5vdGhlciAocHJlcmVxKSBwYXRjaC4KCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
