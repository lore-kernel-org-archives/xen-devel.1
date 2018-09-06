From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 02/16] x86: introduce and use a set of
 internal emulation flags
Date: Thu, 06 Sep 2018 07:27:47 -0600
Message-ID: <5B912B5302000078001E5F6C@prv1-mh.provo.novell.com>
References: <20180904161533.11575-1-wei.liu2@citrix.com>
 <20180904161533.11575-3-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=pp8w=lu=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fxuK7-0000QB-Cw
 for xen-devel@lists.xenproject.org; Thu, 06 Sep 2018 13:27:51 +0000
In-Reply-To: <20180904161533.11575-3-wei.liu2@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA5LjE4IGF0IDE4OjE1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
VXNlIHRoZXNlIGZsYWdzIGluIGhhc18qIHRlc3RzIGFuZCBlbXVsYXRpb25fZmxhZ3Nfb2suCj4g
Cj4gTm90IHVzaW5nIHJhdyBmbGFncyBkaXJlY3RseSBlbmFibGluZyBEQ0UgdG8ga2ljayBpbiBm
b3IgaGFzXyogdGVzdHMKPiB3aGlsZSBhdCB0aGUgc2FtZSB0aW1lIG1ha2luZyBzdXJlIGVtdWxh
dGlvbl9mbGFnc19vayB3b24ndCBnbyBvdXQgb2YKPiBzeW5jLgoKVGhpcyBpcyByYXRoZXIgaGFy
ZCB0byByZWFkIChmb3IgbWUgYXQgbGVhc3QpLiBQZXJoYXBzIHMvZW5hYmxpbmcvZW5hYmxlcy8K
YW5kIHNwbGl0IHNlbnRlbmNlcyBhZnRlciB0aGUgZmlyc3QgbGluZSwgb3IgYXQgbGVhc3QgcHV0
IGEgY29tbWEKc29tZXdoZXJlPwoKPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBj
aXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
