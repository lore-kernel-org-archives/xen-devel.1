From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/4] x86/mm: drop redundant local variable
 from _get_page_type()
Date: Wed, 3 Apr 2019 19:17:44 +0100
Message-ID: <9c7e257e-eac8-fc43-0735-69dcb2076585@citrix.com>
References: <5C88F524020000780021E12C@prv1-mh.provo.novell.com>
 <5C88F9DE020000780021E17D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/PYL=SF=citrix.com=prvs=98944cf01=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hBkSJ-00073w-Lr
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2019 18:17:47 +0000
In-Reply-To: <5C88F9DE020000780021E17D@prv1-mh.provo.novell.com>
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

T24gMTMvMDMvMjAxOSAxMjozOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSW5zdGVhZCBvZiB0aGUg
c2VwYXJhdGUgaW9tbXVfcmV0LCB0aGUgZ2VuZXJhbCByYyBjYW4gYmUgdXNlZCBldmVuIGZvcgo+
IHRoZSBJT01NVSBvcGVyYXRpb25zLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
