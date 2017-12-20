From: Tim Deegan <tim@xen.org>
Subject: Re: [PATCH 5/6] x86/mm: clean up SHARED_M2P{,
	_ENTRY} uses
Date: Wed, 20 Dec 2017 08:09:23 +0000
Message-ID: <20171220080923.GF76516@deinos.phlegethon.org>
References: <5A2FFB8D0200007800196DDF@prv-mh.provo.novell.com>
 <5A2FFEF40200007800196E31@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=t+nq=dq=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1eRZRS-00039c-FO
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2017 08:09:30 +0000
Content-Disposition: inline
In-Reply-To: <5A2FFEF40200007800196E31@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, tamas@tklengyel.com, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QXQgMDg6MDggLTA3MDAgb24gMTIgRGVjICgxNTEzMDY2MTAwKSwgSmFuIEJldWxpY2ggd3JvdGU6
Cj4gU3RvcCBvcGVuLWNvZGluZyBTSEFSRURfTTJQKCkgYW5kIGRyb3AgYSBwb2ludGxlc3MgdXNl
IG9mIGl0IGZyb20KPiBwYWdpbmdfbWZuX2lzX2RpcnR5KCkgKCFWQUxJRF9NMlAoKSBpcyBhIHN1
cGVyc2V0IG9mIFNIQVJFRF9NMlAoKSkgYW5kCj4gYW5vdGhlciBvbmUgZnJvbSBmcmVlX3BhZ2Vf
dHlwZSgpIChwcmlvciBhc3NlcnRpb25zIHJlbmRlciB0aGlzCj4gcmVkdW5kYW50KS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpBY2tlZC1ieTog
VGltIERlZWdhbiA8dGltQHhlbi5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
