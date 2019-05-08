From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] trace: fix build with gcc9
Date: Wed, 8 May 2019 11:25:32 +0100
Message-ID: <f7aac7ba-5965-0eeb-eee8-fe306cb72548@citrix.com>
References: <5C80F39B020000780021C629@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DUHD=TI=citrix.com=prvs=024c7dee5=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hOJlc-0000LC-Im
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 10:25:40 +0000
In-Reply-To: <5C80F39B020000780021C629@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMy83LzE5IDEwOjM0IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPiBXaGlsZSBJJ3ZlIG5vdCBv
YnNlcnZlZCB0aGlzIG15c2VsZiwgZ2NjIDkgKGltbyB2YWxpZGx5KSByZXBvcnRlZGx5IG1heQo+
IGNvbXBsYWluCj4gCj4gdHJhY2UuYzogSW4gZnVuY3Rpb24gJ19fdHJhY2VfaHlwZXJjYWxsJzoK
PiB0cmFjZS5jOjgyNjoxOTogZXJyb3I6IHRha2luZyBhZGRyZXNzIG9mIHBhY2tlZCBtZW1iZXIg
b2YgJ3N0cnVjdCA8YW5vbnltb3VzPicgbWF5IHJlc3VsdCBpbiBhbiB1bmFsaWduZWQgcG9pbnRl
ciB2YWx1ZQo+IFstV2Vycm9yPWFkZHJlc3Mtb2YtcGFja2VkLW1lbWJlcl0KPiAgIDgyNiB8ICAg
ICB1aW50MzJfdCAqYSA9IGQuYXJnczsKPiAKPiBhbmQgdGhlIGZpeCBpcyByYXRoZXIgc2ltcGxl
IC0gcmVtb3ZlIHRoZSBfX3BhY2tlZCBhdHRyaWJ1dGUuIEludHJvZHVjZQo+IGEgQlVJTERfQlVH
X09OKCkgYXMgcmVwbGFjZW1lbnQsIGZvciB0aGUgdW5saWtlbHkgY2FzZSB0aGF0IFhlbiBtaWdo
dAo+IGdldCBwb3J0ZWQgdG8gYW4gYXJjaGl0ZWN0dXJlIHdoZXJlIGFycmF5IGFsaWdubWVudCBo
aWdoZXIgdGhhdCB0aGF0IG9mCj4gaXRzIGVsZW1lbnRzLgo+IAo+IFJlcG9ydGVkLWJ5OiBNYXJ0
aW4gTGnFoWthIDxtYXJ0aW4ubGlza2FAc3VzZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKT0ssIHlvdSBjb252aW5jZWQgbWUuCgpBY2tlZC1i
eTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKQXQgc29tZSBwb2lu
dCB3ZSdsbCBwcm9iYWJseSBuZWVkIGEgcHJldHRpZXIgd2F5IHRvIGRvIHRoaXMuCgogLUdlb3Jn
ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
