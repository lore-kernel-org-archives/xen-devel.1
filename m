From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/mm: Clean up p2m_finish_type_change
 return value
Date: Thu, 17 Jan 2019 05:15:12 -0700
Message-ID: <5C4071D0020000780020EA87@prv1-mh.provo.novell.com>
References: <20190117090635.23731-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SW9P=PZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gk6bh-0003kz-HX
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 12:17:13 +0000
In-Reply-To: <20190117090635.23731-1-aisaila@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjAxLjE5IGF0IDEwOjA2LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IENoYW5nZWQgdGhlIHJldHVybiB2YWx1ZSBvZiAxIHRvIDAgc28gbm93IHAybV9maW5pc2hf
dHlwZV9jaGFuZ2UgcmV0dXJucwo+IDAgZm9yIHN1Y2Nlc3Mgb3IgPDAgZm9yIGVycm9yLgo+IFRo
ZSDigJxyb2904oCdIGNhbGxlciBvZiBwMm1fZmluaXNoX3R5cGVfY2hhbmdlKCkgaXMKPiBYRU5f
RE1PUF9tYXBfbWVtX3R5cGVfdG9faW9yZXFfc2VydmVyIGFuZCB0aGlzIGRvZXMgbm90aGluZyB1
c2VmdWwgd2l0aAo+IHBvc2l0aXZlIHZhbHVlcy4KCkJ5ICJyb290IiBJIHN1cHBvc2VkIHlvdSBt
ZWFuICJvbmx5IGN1cnJlbnQiPyBJIGhhdmUgdG8gYWRtaXQgdGhhdApJJ20gb25seSBoYWxmIHdh
eSBoYXBweSB3aXRoIHRoaXMgYXMgdGhlIHVuZGVybHlpbmcgcmVhc29uLiBJIHdvdWxkCmV4cGVj
dCBmb3IgdGhlcmUgdG8gaGF2ZSBiZWVuIGEgcmVhc29uIGZvciB0aGUgcmV0dXJuIHZhbHVlIGJl
aW5nCnRoaXMgd2F5LCBhbmQgdGhhdCdzIHdoYXQgd291bGQgbmVlZCB0byBiZSByZWFzb25lZCBh
Z2FpbnN0LgpGdXJ0aGVybW9yZSB0aGUgcXVlc3Rpb24gdGhlbiBpcyB3aGV0aGVyIGRvd24gdGhl
IGNhbGwgdHJlZSB0aGUKc2FtZSBhZGp1c3RtZW50IHNob3VsZG4ndCBiZSBtYWRlLiBBZnRlciBh
bGwgKGFuZCBwb3NzaWJseSBqdXN0IGFzCmEgZmlyc3Qgc3RlcCkgd2h5IHdvdWxkIGZpbmlzaF90
eXBlX2NoYW5nZSgpIHJldHVybiBhIHBvc2l0aXZlCnZhbHVlIGlmIGl0cyBvbmx5IGNhbGxlciBk
b2Vzbid0IGNhcmU/CgpCdXQgYW55d2F5LCBJJ20gbm90IHRoZSBtYWludGFpbmVyIGhlcmUsIHNv
IHdoYXQgSSBzYXkgbWF5IHdlbGwKYmUgY29tcGxldGVseSBpZ25vcmVkLgoKSmFuCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
