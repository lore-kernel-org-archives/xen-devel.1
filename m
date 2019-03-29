From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul/fuzz: adjust canonicalization in
 sanitize_input()
Date: Fri, 29 Mar 2019 15:03:37 +0000
Message-ID: <dc2e7790-3839-4b27-512e-7fc90c8543af@citrix.com>
References: <5C9E30F40200007800222DDC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/vMr=SA=citrix.com=prvs=9848b938e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h9t3s-0003IO-Jr
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 15:04:52 +0000
In-Reply-To: <5C9E30F40200007800222DDC@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDMvMjAxOSAxNDo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gRHJvcCBpdCBlbnRpcmVs
eSBmb3IgJXJicCAtIHRoaXMgcmVnaXN0ZXIgaXMgbm90IHNwZWNpYWwgcHVycG9zZSBlbm91Z2gK
PiB0byB3YXJyYW50IHN1Y2ggc3BlY2lhbCB0cmVhdG1lbnQuIEFkZCBhIGNvbW1lbnQgdG8gY2xh
cmlmeSB0aGUgcHVycG9zZQo+IG9mIHRoZSBjYW5vbmljYWxpemF0aW9uIG9mICVyaXAgYW5kICVy
c3AuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpB
Y2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
