From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v4 7/8] x86: also NOP out xen_cr3 restores
 of XPTI
Date: Thu, 22 Mar 2018 12:23:44 +0000
Message-ID: <20180322122344.tfqggxctre74dtpf@citrix.com>
References: <5AAFC9E202000078001B36F7@prv-mh.provo.novell.com>
 <5AAFCC0702000078001B3732@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=f68c=gm=citrix.com=prvs=6120e2e14=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eyzGE-0000yY-Td
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 12:24:02 +0000
Content-Disposition: inline
In-Reply-To: <5AAFCC0702000078001B3732@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgMTksIDIwMTggYXQgMDc6NDE6MTFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gLi4uIGRlc3BpdGUgcXVpdGUgbGlrZWx5IHRoZSBnYWluIGJlaW5nIHJhdGhlciBsaW1p
dGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
ClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
