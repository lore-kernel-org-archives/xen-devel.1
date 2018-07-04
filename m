From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH v2 1/8] xen: calculate XEN_BUILD_TIME using
 XEN_BUILD_DATE value
Date: Wed, 4 Jul 2018 18:07:43 +0200
Message-ID: <20180704160743.GF26572@olila.local.net-space.pl>
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
 <srs0=z+bn=ju=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1fakKD-0005kb-U5
 for xen-devel@lists.xenproject.org; Wed, 04 Jul 2018 16:08:13 +0000
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <royger@FreeBSD.org>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMDQsIDIwMTggYXQgMDQ6NDE6MzBQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gRGFuaWVsIEtpcGVyIHdyaXRlcyAoIlJlOiBbUEFUQ0ggdjIgMS84XSB4ZW46IGNhbGN1
bGF0ZSBYRU5fQlVJTERfVElNRSB1c2luZyBYRU5fQlVJTERfREFURSB2YWx1ZSIpOgo+ID4gT24g
V2VkLCBKdWwgMDQsIDIwMTggYXQgMDI6NTg6MTdQTSArMDEwMCwgSWFuIEphY2tzb24gd3JvdGU6
Cj4gPiA+IGV4cG9ydCBYRU5fQlVJTERfUE9TSVhfVElNRQk/PSAkKHNoZWxsIGVjaG8gJCR7U09V
UkNFX0RBVEVfRVBPQ0gtZGF0ZSArJXN9KQo+ID4KPiA+IE9LLCBidXQgd2hhdCBpZiBTT1VSQ0Vf
REFURV9FUE9DSCBpcyBub3QgZGVmaW5lZD8KPiA+ICJkYXRlIiBjb21tYW5kIGlzIG5vdCBhIGdv
b2Qgc29sdXRpb24gaGVyZS4KPgo+IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgeW91IHRoaW5rIG5v
dC4gIEkgdGhpbmsgYWxsIHRoZSB2ZXJzaW9ucyBvZgo+IGRhdGUgd2UgY2FyZSBhYm91dCB3aWxs
IGRvIHNvbWV0aGluZyBzZW5zaWJsZSB3aXRoCj4gICAgIGRhdGUgKyVzCj4KPiBJIGRvbid0IGhh
dmUgYSBGcmVlQlNEIGhvc3QgdG8gaGFuZCB0byB0ZXN0LCBDQydpbmcgUm9nZXIuCgpUaGlzIGlz
IG5vdCB0aGUgZGF0ZSBjb21tYW5kIHByb2JsZW0uIFRoaXMgaXMgbW9yZSByZWxhdGVkIHRvIFNP
VVJDRV9EQVRFX0VQT0NICnNwZWMgKGh0dHBzOi8vcmVwcm9kdWNpYmxlLWJ1aWxkcy5vcmcvc3Bl
Y3Mvc291cmNlLWRhdGUtZXBvY2gvI2lkbTU1KQp3aGljaCBjbGVhcmx5IHNheXM6CgogIFRoZSB2
YWx1ZSBNVVNUIGJlIHJlcHJvZHVjaWJsZSAoZGV0ZXJtaW5pc3RpYykgYWNyb3NzIGRpZmZlcmVu
dAogIGV4ZWN1dGlvbnMgb2YgdGhlIGJ1aWxkLCBkZXBlbmRpbmcgb25seSBvbiB0aGUgc291cmNl
IGNvZGUuIEl0IFNIT1VMRAogIGJlIHNldCB0byB0aGUgbGFzdCBtb2RpZmljYXRpb24gdGltZSBv
ZiB0aGUgc291cmNlLCBpbmNvcnBvcmF0aW5nIGFueQogIHBhY2thZ2luZy1zcGVjaWZpYyBtb2Rp
ZmljYXRpb25zLgoKU28sIEFJVUksIGFib3ZlIGltcGxpZXMgdGhhdCB3ZSBzaG91bGQgbm90IHVz
ZSB0aGUgZGF0ZSBjb21tYW5kLiBBbSBJIHJpZ2h0PwoKPiBBbHRob3VnaCBteSBydW5lIGFib3Zl
IGlzIHdyb25nIGFuZCBzaG91bGQgcmVhZAo+ICAgICBleHBvcnQgWEVOX0JVSUxEX1BPU0lYX1RJ
TUUJPz0gJChzaGVsbCBlY2hvICQke1NPVVJDRV9EQVRFX0VQT0NILSQkKGRhdGUgKyVzKX0pCj4K
PiA+IElmIG90aGVyIGd1eXMgYXJlIE9LIHdpdGggdGhhdCBJIGNhbiBwcmVwYXJlIGEgcGF0Y2gg
d2l0aCB5b3VyIFN1Z2dlc3RlZC1ieS4KPgo+IEhvdyBkbyBpbiBpbnRlbmQgdG8gY2hvb3NlIHdo
aWNoIHdyYXBwZXIgc2NyaXB0IHRvIHVzZSA/CgpJIHRob3VnaCB0aGF0IGEgbWVjaGFuaXNtIHRv
IGRpZmZlcmVudGlhdGUgR05VIGFuZCBCU0Qgc3lzdGVtcyBleGlzdHMgaW4KdGhlIFhlbiBidWls
ZCBzeXN0ZW0uIFNvLCBJIHdhcyBnb2luZyB0byByZXVzZSBpdCBzb21laG93LgoKPiBUaGlzIHBp
bGUgb2Ygc3R1ZmYgd2lsbCBydW4gb24gYXdmdWwgbG90IG9mIHRpbWVzIGR1cmluZyBlYWNoIG1h
a2Ugc28KPiBrZWVwaW5nIGl0IG9mIHJlYXNvbmFibGUgc2l6ZSBpcyBhIGdvb2QgcGxhbi4KPgo+
IE1heWJlIGl0IHdvdWxkIGJlIGJldHRlciB0byBoYXZlIGEgc2luZ2xlIHNoZWxsIHNjcmlwdCB3
aGljaCBvdXRwdXRzIGEKPiB3aG9sZSBidW5jaCBvZiB2YXJpYWJsZSBzZXR0aW5ncyBmb3IgbWFr
ZSB0byAkKGV2YWwgKSA/CgpJdCBsb29rcyB0aGF0IHRoaXMgdmFyaWFibGUgaXMgcmVmZXJlbmNl
ZCBvbmNlLCBzbywgaXQgc2hvdWxkIG5vdCBiZSBhIHByb2JsZW0uCgpEYW5pZWwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
