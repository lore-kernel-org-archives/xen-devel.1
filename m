From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 5/6] x86/iommu: switch the hwdom mapping
 function to use page_get_type
Date: Tue, 21 Aug 2018 07:20:48 -0600
Message-ID: <5B7C11B002000078001E082B@prv1-mh.provo.novell.com>
References: <20180821074944.38773-1-roger.pau@citrix.com>
 <20180821074944.38773-6-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ip0d=le=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fs6ac-0001fe-GB
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 13:20:54 +0000
In-Reply-To: <20180821074944.38773-6-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjA4LjE4IGF0IDA5OjQ5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFRoaXMgYXZvaWRzIHJlcGVhdGVkIGNhbGxzIHRvIHBhZ2VfaXNfcmFtX3R5cGUgd2hpY2ggaW1w
cm92ZXMKPiBwZXJmb3JtYW5jZSBhbmQgbWFrZXMgdGhlIGNvZGUgZWFzaWVyIHRvIHJlYWQuCj4g
Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpJIGNhbid0IHNlZW0gdG8gYmUgYWJsZSB0byBm
dWxseSBjb252aW5jZSBteXNlbGYgb2YgdGhlICJObyBmdW5jdGlvbmFsCmNoYW5nZSIgcGFydCwg
YnV0IHRoZSByZXN1bHRpbmcgY29kZSBsb29rcyBjb3JyZWN0LCBzbwpSZXZpZXdlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
