From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC 02/55] x86: move some xen mm function
 declarations
Date: Fri, 15 Mar 2019 08:42:17 -0600
Message-ID: <5C8BB9C9020000780021F59F@prv1-mh.provo.novell.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-3-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=64UD=RS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h4o2M-0006Z9-FR
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2019 14:42:18 +0000
In-Reply-To: <20190207164456.9260-3-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAyLjE5IGF0IDE3OjQ0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
VGhleSB3ZXJlIHB1dCBpbnRvIHBhZ2UuaCBidXQgbW0uaCBpcyBtb3JlIGFwcHJvcHJpYXRlLgoK
SSdtIG5vdCBmdWxseSBjb252aW5jZWQgb2YgdGhpcywgYnV0IC4uLgoKPiBUaGUgcmVhbCByZWFz
b24gaXMgdGhhdCBJIHdpbGwgYmUgYWRkaW5nIHNvbWUgbmV3IGZ1bmN0aW9ucyB3aGljaAo+IHRh
a2VzIG1mbl90LiBJdCB0dXJucyBvdXQgaXQgaXMgYSBiaXQgZGlmZmljdWx0IHRvIGRvIGluIHBh
Z2UuaC4KCi4uLiB0aGlzIGlzIGdvb2QgZW5vdWdoIGEgcmVhc29uLgoKPiBObyBmdW5jdGlvbmFs
IGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29t
PgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
