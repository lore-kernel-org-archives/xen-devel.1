From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/HVM: avoid memory_type_changed()
 invocations when possible
Date: Tue, 17 Jul 2018 13:07:15 +0200
Message-ID: <20180717110715.7gtu2huaogurnw3h@mac.bytemobile.com>
References: <5B4CCBB502000078001D4904@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jnja=kb=citrix.com=prvs=72919e7bd=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ffNpF-00029i-2y
 for xen-devel@lists.xenproject.org; Tue, 17 Jul 2018 11:07:25 +0000
Content-Disposition: inline
In-Reply-To: <5B4CCBB502000078001D4904@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdWwgMTYsIDIwMTggYXQgMTA6NDU6NDFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhleSdyZSBleHBlbnNpdmUsIGFuZCBub3RoaW5nIGNoYW5nZXMgaWYgTVRSUnMgYXJl
IGRpc2FibGVkIGFuZCBhbnkgb2YKPiB0aGUgcmFuZ2VzIGdldHMgY2hhbmdlZCwgb3IgaWYgZml4
ZWQgcmFuZ2UgTVRSUnMgYXJlIGRpc2FibGVkIGFuZCBhbnkgb2YKPiB0aGVtIGdldHMgY2hhbmdl
ZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpS
ZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUaGFu
a3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
