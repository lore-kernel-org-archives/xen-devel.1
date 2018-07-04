From: Roger Pau =?utf-8?B?TW9ubsOp?= <royger@FreeBSD.org>
Subject: Re: [PATCH v2 1/8] xen: calculate XEN_BUILD_TIME using
 XEN_BUILD_DATE value
Date: Wed, 4 Jul 2018 17:51:58 +0200
Message-ID: <20180704155158.zeyryrr4lbuul4ih@mac.bytemobile.com>
References: <1529418946-30114-1-git-send-email-daniel.kiper@oracle.com>
 <1529418946-30114-2-git-send-email-daniel.kiper@oracle.com>
 <5B30F2B202000078001CD8E4@prv1-mh.provo.novell.com>
 <20180704120629.GJ4670@olila.local.net-space.pl>
 <23356.53881.85485.72287@mariner.uk.xensource.com>
 <20180704143957.GC26572@olila.local.net-space.pl>
 <23356.60074.281809.940061@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=b+ad=ju=freebsd.org=royger@srs-us1.protection.inumbo.net>)
 id 1fak4i-0003W2-Ib
 for xen-devel@lists.xenproject.org; Wed, 04 Jul 2018 15:52:12 +0000
Content-Disposition: inline
In-Reply-To: <23356.60074.281809.940061@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Daniel Kiper <daniel.kiper@oracle.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMDQsIDIwMTggYXQgMDQ6NDE6MzBQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gRGFuaWVsIEtpcGVyIHdyaXRlcyAoIlJlOiBbUEFUQ0ggdjIgMS84XSB4ZW46IGNhbGN1
bGF0ZSBYRU5fQlVJTERfVElNRSB1c2luZyBYRU5fQlVJTERfREFURSB2YWx1ZSIpOgo+ID4gT24g
V2VkLCBKdWwgMDQsIDIwMTggYXQgMDI6NTg6MTdQTSArMDEwMCwgSWFuIEphY2tzb24gd3JvdGU6
Cj4gPiA+IGV4cG9ydCBYRU5fQlVJTERfUE9TSVhfVElNRQk/PSAkKHNoZWxsIGVjaG8gJCR7U09V
UkNFX0RBVEVfRVBPQ0gtZGF0ZSArJXN9KQo+ID4gCj4gPiBPSywgYnV0IHdoYXQgaWYgU09VUkNF
X0RBVEVfRVBPQ0ggaXMgbm90IGRlZmluZWQ/Cj4gPiAiZGF0ZSIgY29tbWFuZCBpcyBub3QgYSBn
b29kIHNvbHV0aW9uIGhlcmUuCj4gCj4gSSBkb24ndCB1bmRlcnN0YW5kIHdoeSB5b3UgdGhpbmsg
bm90LiAgSSB0aGluayBhbGwgdGhlIHZlcnNpb25zIG9mCj4gZGF0ZSB3ZSBjYXJlIGFib3V0IHdp
bGwgZG8gc29tZXRoaW5nIHNlbnNpYmxlIHdpdGgKPiAgICAgZGF0ZSArJXMKPiAKPiBJIGRvbid0
IGhhdmUgYSBGcmVlQlNEIGhvc3QgdG8gaGFuZCB0byB0ZXN0LCBDQydpbmcgUm9nZXIuCgpkYXRl
ICslcyBkb2VzIGluZGVlZCB3b3JrIGZpbmUgb24gRnJlZUJTRDoKCiQgZGF0ZSArJXMKMTUzMDcx
OTY1NAoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
