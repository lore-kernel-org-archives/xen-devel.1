From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 07/17] libxl: create vkb device only for
 guests with graphics output
Date: Thu, 21 Feb 2019 16:02:11 +0000
Message-ID: <20190221160211.nuylbbi4ile2k46v@zion.uk.xensource.com>
References: <cover.8f900c4839866ee551e8ebf221cfc7b9310cecd6.1548710973.git-series.marmarek@invisiblethingslab.com>
 <e7c58b14e234a5b24a0a4f62da2db26e34071e05.1548710973.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y0vM=Q4=citrix.com=prvs=948a3d738=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gwqoO-0000bD-DC
 for xen-devel@lists.xenproject.org; Thu, 21 Feb 2019 16:03:00 +0000
Content-Disposition: inline
In-Reply-To: <e7c58b14e234a5b24a0a4f62da2db26e34071e05.1548710973.git-series.marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMjgsIDIwMTkgYXQgMTA6MzA6MjRQTSArMDEwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IFRoZSBmb3JjZWQgdmtiIGRldmljZSBpcyBtZWFudCBmb3Ig
YmV0dGVyIHBlcmZvcm1hbmNlIG9mIHFlbXUgYWNjZXNzCj4gKGF0IGxlYXN0IGFjY29yZGluZyB0
byBlYmJkMjU2MWI0Y2VmYjI5OWYwZjY4YTg4YjI3ODg1MDQyMjNkZTE4ICJsaWJ4bDoKPiBBZGQg
YSB2a2JkIGZyb250ZW5kL2JhY2tlbmQgcGFpciBmb3IgSFZNIGd1ZXN0cyIpLCB3aGljaCBpc24n
dCB1c2VkIGlmCj4gdGhlcmUgaXMgbm8gY29uZmlndXJlZCBjaGFubmVsIHRvIGFjdHVhbGx5IGFj
Y2VzcyB0aGF0IGtleWJvYXJkLgo+IAo+IE9uZSBjYW4gc3RpbGwgYWRkIHZrYiBkZXZpY2UgbWFu
dWFsbHkgaWYgbmVlZGVkLgo+IAo+IFRoaXMgaXMgY29udGludWF0aW9uIG9mIGIwNTNmMGM0Yzll
NTMzZjNkOTc4MzdjZjg5N2ViOTIwYjgzNTVlZDMgImxpYnhsOiBkbwo+IG5vdCBzdGFydCBkb20w
IHFlbXUgZm9yIHN0dWJkb21haW4gd2hlbiBub3QgbmVlZGVkIi4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xh
Yi5jb20+Cj4gUmV2aWV3ZWQtYnk6IEphc29uIEFuZHJ5dWsgPGphbmRyeXVrQGdtYWlsLmNvbT4K
CkFja2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
