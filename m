From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH v2 1/8] xen: calculate XEN_BUILD_TIME using
 XEN_BUILD_DATE value
Date: Wed, 4 Jul 2018 18:55:06 +0200
Message-ID: <20180704165506.GI26572@olila.local.net-space.pl>
References: <1529418946-30114-1-git-send-email-daniel.kiper@oracle.com>
 <1529418946-30114-2-git-send-email-daniel.kiper@oracle.com>
 <5B30F2B202000078001CD8E4@prv1-mh.provo.novell.com>
 <20180704120629.GJ4670@olila.local.net-space.pl>
 <23356.53881.85485.72287@mariner.uk.xensource.com>
 <20180704143957.GC26572@olila.local.net-space.pl>
 <23356.60074.281809.940061@mariner.uk.xensource.com>
 <20180704160743.GF26572@olila.local.net-space.pl>
 <23356.63038.529901.339878@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=z+bn=ju=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1fal3z-0003DM-S5
 for xen-devel@lists.xenproject.org; Wed, 04 Jul 2018 16:55:31 +0000
Content-Disposition: inline
In-Reply-To: <23356.63038.529901.339878@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <royger@FreeBSD.org>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMDQsIDIwMTggYXQgMDU6MzA6NTRQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gRGFuaWVsIEtpcGVyIHdyaXRlcyAoIlJlOiBbUEFUQ0ggdjIgMS84XSB4ZW46IGNhbGN1
bGF0ZSBYRU5fQlVJTERfVElNRSB1c2luZyBYRU5fQlVJTERfREFURSB2YWx1ZSIpOgo+ID4gT24g
V2VkLCBKdWwgMDQsIDIwMTggYXQgMDQ6NDE6MzBQTSArMDEwMCwgSWFuIEphY2tzb24gd3JvdGU6
Cj4gPiA+IEkgZG9uJ3QgaGF2ZSBhIEZyZWVCU0QgaG9zdCB0byBoYW5kIHRvIHRlc3QsIENDJ2lu
ZyBSb2dlci4KPiA+Cj4gPiBUaGlzIGlzIG5vdCB0aGUgZGF0ZSBjb21tYW5kIHByb2JsZW0uIFRo
aXMgaXMgbW9yZSByZWxhdGVkIHRvIFNPVVJDRV9EQVRFX0VQT0NICj4gPiBzcGVjIChodHRwczov
L3JlcHJvZHVjaWJsZS1idWlsZHMub3JnL3NwZWNzL3NvdXJjZS1kYXRlLWVwb2NoLyNpZG01NSkK
PiA+IHdoaWNoIGNsZWFybHkgc2F5czoKPiA+Cj4gPiAgIFRoZSB2YWx1ZSBNVVNUIGJlIHJlcHJv
ZHVjaWJsZSAoZGV0ZXJtaW5pc3RpYykgYWNyb3NzIGRpZmZlcmVudAo+ID4gICBleGVjdXRpb25z
IG9mIHRoZSBidWlsZCwgZGVwZW5kaW5nIG9ubHkgb24gdGhlIHNvdXJjZSBjb2RlLiBJdCBTSE9V
TEQKPiA+ICAgYmUgc2V0IHRvIHRoZSBsYXN0IG1vZGlmaWNhdGlvbiB0aW1lIG9mIHRoZSBzb3Vy
Y2UsIGluY29ycG9yYXRpbmcgYW55Cj4gPiAgIHBhY2thZ2luZy1zcGVjaWZpYyBtb2RpZmljYXRp
b25zLgo+ID4KPiA+IFNvLCBBSVVJLCBhYm92ZSBpbXBsaWVzIHRoYXQgd2Ugc2hvdWxkIG5vdCB1
c2UgdGhlIGRhdGUgY29tbWFuZC4gQW0gSSByaWdodD8KPgo+IE5vLgo+Cj4gVGhhdCBzcGVjIGlz
IGZvciBwZW9wbGUgKnNldHRpbmcqIFNPVVJDRV9EQVRFX0VQT0NILiAgV2hpY2ggd2UgYXJlIG5v
dAo+IGRvaW5nLgo+Cj4gRm9yIGEgKmNvbnN1bWVyKiBvZiBTT1VSQ0VfREFURV9FUE9DSCwgaWYg
aXQgaXMgbm90IHNldCwgdXNpbmcgdGhlCj4gb3V0cHV0IG9mIGRhdGUgb3IgdGhlIGN1cnJlbnQg
dGltZSBvciBzb21ldGhpbmcgaXMgZmluZS4KCkFoaGguLi4gT0ssIG1ha2Ugc2VucyB0aGVuLgoK
PiA+ID4gSG93IGRvIGluIGludGVuZCB0byBjaG9vc2Ugd2hpY2ggd3JhcHBlciBzY3JpcHQgdG8g
dXNlID8KPiA+Cj4gPiBJIHRob3VnaCB0aGF0IGEgbWVjaGFuaXNtIHRvIGRpZmZlcmVudGlhdGUg
R05VIGFuZCBCU0Qgc3lzdGVtcyBleGlzdHMgaW4KPiA+IHRoZSBYZW4gYnVpbGQgc3lzdGVtLiBT
bywgSSB3YXMgZ29pbmcgdG8gcmV1c2UgaXQgc29tZWhvdy4KPgo+IElTVFIgdGhpcyBiZWluZyBz
bGlnaHRseSBjbHVtc3kuICBCdXQgZ29vZCBsdWNrIDotKS4KClRoYW5rcyBhIGxvdCEgOi0pKSkK
Cj4gPiA+IFRoaXMgcGlsZSBvZiBzdHVmZiB3aWxsIHJ1biBvbiBhd2Z1bCBsb3Qgb2YgdGltZXMg
ZHVyaW5nIGVhY2ggbWFrZSBzbwo+ID4gPiBrZWVwaW5nIGl0IG9mIHJlYXNvbmFibGUgc2l6ZSBp
cyBhIGdvb2QgcGxhbi4KPiA+ID4KPiA+ID4gTWF5YmUgaXQgd291bGQgYmUgYmV0dGVyIHRvIGhh
dmUgYSBzaW5nbGUgc2hlbGwgc2NyaXB0IHdoaWNoIG91dHB1dHMgYQo+ID4gPiB3aG9sZSBidW5j
aCBvZiB2YXJpYWJsZSBzZXR0aW5ncyBmb3IgbWFrZSB0byAkKGV2YWwgKSA/Cj4gPgo+ID4gSXQg
bG9va3MgdGhhdCB0aGlzIHZhcmlhYmxlIGlzIHJlZmVyZW5jZWQgb25jZSwgc28sIGl0IHNob3Vs
ZCBub3QgYmUgYSBwcm9ibGVtLgo+Cj4gSSB0aGluayBtYWtlJ3MgcmVjdXJzaXZlIGV4cGFuc2lv
biBzeXN0ZW0gbWF5IHJlc3VsdCBpbiB0aGVzZSBzaGVsbAo+IHJ1bmVzIGJlaW5nIGV4ZWN1dGVk
IG11bHRpcGxlIHRpbWVzLgoKSSB3aWxsIGRvdWJsZSBjaGVjayBpdC4KCkRhbmllbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
