From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net 0/3 RESEND] xen-netback: hash mapping
 handling adjustments
Date: Tue, 25 Sep 2018 10:40:48 -0700 (PDT)
Message-ID: <20180925.104048.2238329745735217190.davem__32030.4194036455$1537897171$gmane$org@davemloft.net>
References: <5B85622302000078001E2A35@prv1-mh.provo.novell.com>
 <5BA9EDB502000078001EB724@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cjew=mh=davemloft.net=davem@srs-us1.protection.inumbo.net>)
 id 1g4rKO-0006OO-67
 for xen-devel@lists.xenproject.org; Tue, 25 Sep 2018 17:40:52 +0000
In-Reply-To: <5BA9EDB502000078001EB724@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: JBeulich@suse.com
Cc: xen-devel@lists.xenproject.org, paul.durrant@citrix.com, wei.liu2@citrix.com, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

RnJvbTogIkphbiBCZXVsaWNoIiA8SkJldWxpY2hAc3VzZS5jb20+CkRhdGU6IFR1ZSwgMjUgU2Vw
IDIwMTggMDI6MTE6MzMgLTA2MDAKCj4gRmlyc3QgYW5kIGZvcmVtb3N0IHRoZSBmaXggZm9yIFhT
QS0yNzAuIE9uIHRvcCBvZiB0aGF0IGZ1cnRoZXIgY2hhbmdlcwo+IHdoaWNoIGxvb2tlZCBkZXNp
cmFibGUgdG8gbWUgd2hpbGUgaW52ZXN0aWdhdGluZyB0aGF0IFhTQS4KPiAKPiAxOiBmaXggaW5w
dXQgdmFsaWRhdGlvbiBpbiB4ZW52aWZfc2V0X2hhc2hfbWFwcGluZygpCj4gMjogdmFsaWRhdGUg
cXVldWUgbnVtYmVycyBpbiB4ZW52aWZfc2V0X2hhc2hfbWFwcGluZygpCj4gMzogaGFuZGxlIHBh
Z2Ugc3RyYWRkbGluZyBpbiB4ZW52aWZfc2V0X2hhc2hfbWFwcGluZygpCj4gCj4gU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKU2VyaWVzIGFwcGxpZWQgYW5k
IHF1ZXVlZCB1cCBmb3IgLXN0YWJsZS4KClRoYW5rcy4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
