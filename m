From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] compat-ioctl/Xen: support at least some
 IOCTLs of evtchn and privcmd
Date: Mon, 2 Jul 2018 15:56:58 +0200
Message-ID: <861fcd9e-b90c-b34b-5b88-f0a7f1c6bd31__39822.595663327$1530539758$gmane$org@suse.com>
References: <5B30C6E202000078001CD724@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=37lk=js=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fZzK9-0008RE-Ti
 for xen-devel@lists.xenproject.org; Mon, 02 Jul 2018 13:57:01 +0000
In-Reply-To: <5B30C6E202000078001CD724@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, akpm@linux-foundation.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDYvMTggMTI6NDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFdoaWxlIHRoaXMgaXMgb25s
eSBhIHN0YXJ0IChJT0NUTF9QUklWQ01EX01NQVAqIGFuZCBJT0NUTF9QUklWQ01EX0RNX09QCj4g
cmVxdWlyZSBtb3JlIHdvcmspLCBpdCBhdCBsZWFzdCBhbGxvd3Mgc29tZSBzaW1wbGUgb3BlcmF0
aW9ucyAobGlrZQo+ICJ4bCBkbWVzZyIpIHdoaWNoIGhhdmUgYWx3YXlzIGJlZW4gYXZhaWxhYmxl
IG9uIFhlbm9MaW51eCB0byB3b3JrIGFnYWluCj4gd2l0aCBhIDY0LWJpdCBrZXJuZWwgdW5kZXJu
ZWF0aCBhIDMyLWJpdCBkaXN0cm8uCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgoKQWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
