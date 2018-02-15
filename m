From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH RFC 3/4] x86: add invpcid.h
Date: Thu, 15 Feb 2018 12:35:46 +0000
Message-ID: <20180215123546.mqnwfyl7sdtnbkwe@citrix.com>
References: <20180215121040.20585-1-wei.liu2@citrix.com>
 <20180215121040.20585-4-wei.liu2@citrix.com>
 <5A858C6202000078001A80D4@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zbre=fj=citrix.com=prvs=57767c78e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1emIlX-0005GD-LS
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2018 12:35:55 +0000
Content-Disposition: inline
In-Reply-To: <5A858C6202000078001A80D4@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMTUsIDIwMTggYXQgMDU6MzQ6MjZBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE1LjAyLjE4IGF0IDEzOjEwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBQcm92aWRlIHRoZSBmdW5jdGlvbnMgbmVlZGVkIGZvciBkaWZmZXJlbnQgbW9kZXMu
Cj4gCj4gRG8gd2UgcmVhbGx5IG5lZWQgYWxsIG9mIHRoZXNlPyBMZXQncyBub3QgaGF2ZSBkZWFk
IGNvZGUgc2l0IGFyb3VuZAo+IGFuZCByaXNrIGl0IGJlY29taW5nIHN0YWxlLgo+IAoKVGhleSB3
aWxsIGJlIG5lZWRlZCB3aGVuIHdlIHdhbnQgdG8gdXNlIFBDSUQgYW5kIElOVlBDSUQgYXQgdGhl
IHNhbWUKdGltZSwgd2hpY2ggc2VlbXMgdG8gYmUgdGhlIHBsYW4/CgpXZWkuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
