From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12] x86/dom0: propagate PVH vlapic
 EOIs to hardware
Date: Thu, 28 Feb 2019 04:21:53 -0700
Message-ID: <5C77C451020000780021B07A@prv1-mh.provo.novell.com>
References: <20190227115156.54031-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mBo3=RD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gzJlG-0007eq-QP
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 11:21:58 +0000
In-Reply-To: <20190227115156.54031-1-roger.pau@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjAyLjE5IGF0IDEyOjUxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEN1cnJlbnQgY2hlY2sgZm9yIE1TSSBFSU8gaXMgbWlzc2luZyBhIHNwZWNpYWwgY2FzZSBmb3Ig
UFZIIERvbTAsCj4gd2hpY2ggZG9lc24ndCBoYXZlIGEgaHZtX2lycV9kcGNpIHN0cnVjdCBidXQg
cmVxdWlyZXMgRUlPcyB0byBiZQo+IGZvcndhcmRlZCB0byB0aGUgcGh5c2ljYWwgbGFwaWMgZm9y
IHBhc3NlZC10aHJvdWdoIGRldmljZXMuCj4gCj4gQWRkIGEgc2hvcnQtY2lyY3VpdCB0byBhbGxv
dyBFT0lzIGZyb20gUFZIIERvbTAgdG8gYmUgcHJvcGFnYXRlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
