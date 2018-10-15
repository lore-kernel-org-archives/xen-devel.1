From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 09/17] x86/amd: put setting
 pv_post_outb_hook under CONFIG_PV
Date: Mon, 15 Oct 2018 13:19:24 +0200
Message-ID: <20181015111924.lkjcwk7oodihz5z4@mac.bytemobile.com>
References: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
 <f1fafccc6ba352431e3ba72e834fd37e37b9eb9e.1538667753.git-series.wei.liu2@citrix.com>
 <5BC0AC4C02000078001F1097@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=06k+=m3=citrix.com=prvs=8197794ea=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gC0uL-0002GG-Ef
 for xen-devel@lists.xenproject.org; Mon, 15 Oct 2018 11:19:33 +0000
Content-Disposition: inline
In-Reply-To: <5BC0AC4C02000078001F1097@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBPY3QgMTIsIDIwMTggYXQgMDg6MTQ6MzZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA0LjEwLjE4IGF0IDE3OjQzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBJdCBpcyB1c2VkIGJ5IFBWIGNvZGUgb25seS4KPiAKPiBBbmQgd3JvbmdseSBzbyAt
IHRoZSBzYW1lIGlzIG5lZWRlZCBmb3IgYSBQVkggRG9tMCBhZmFpY3QuCgpZZXMsIGxvb2tpbmcg
YXQgdGhlIG1vZGVscyBhZmZlY3RlZCBieSB0aGlzIGlzc3VlIGFjY29yZGluZyB0bwppbml0X2Ft
ZCBpdCBzZWVtcyB0byBjb3ZlciB0aGUgZnVsbCBBTUQgbGluZSAoZnJvbSBmYW1pbHkgMHhmIHRv
CjB4MTcpLiBJIGRvbid0IHNlZW0gdG8gZmluZCBhIHJlZmVyZW5jZSBpbiB0aGUgY29kZSB0byB0
aGUgRXJyYXRhLCBkbwp5b3Uga25vdyBpZiB0aGVyZSdzIHNvbWUgZm9ybWFsIGRlc2NyaXB0aW9u
IG9mIGl0PwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
