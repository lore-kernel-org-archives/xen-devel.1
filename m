From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v2 1/8] xen: calculate XEN_BUILD_TIME using
 XEN_BUILD_DATE value
Date: Wed, 4 Jul 2018 16:41:30 +0100
Message-ID: <23356.60074.281809.940061@mariner.uk.xensource.com>
References: <1529418946-30114-1-git-send-email-daniel.kiper@oracle.com>
 <1529418946-30114-2-git-send-email-daniel.kiper@oracle.com>
 <5B30F2B202000078001CD8E4@prv1-mh.provo.novell.com>
 <20180704120629.GJ4670@olila.local.net-space.pl>
 <23356.53881.85485.72287@mariner.uk.xensource.com>
 <20180704143957.GC26572@olila.local.net-space.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8qzb=ju=citrix.com=prvs=716786cb2=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fajuQ-0001yj-SX
 for xen-devel@lists.xenproject.org; Wed, 04 Jul 2018 15:41:34 +0000
In-Reply-To: <20180704143957.GC26572@olila.local.net-space.pl>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <royger@FreeBSD.org>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

RGFuaWVsIEtpcGVyIHdyaXRlcyAoIlJlOiBbUEFUQ0ggdjIgMS84XSB4ZW46IGNhbGN1bGF0ZSBY
RU5fQlVJTERfVElNRSB1c2luZyBYRU5fQlVJTERfREFURSB2YWx1ZSIpOgo+IE9uIFdlZCwgSnVs
IDA0LCAyMDE4IGF0IDAyOjU4OjE3UE0gKzAxMDAsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gZXhw
b3J0IFhFTl9CVUlMRF9QT1NJWF9USU1FCT89ICQoc2hlbGwgZWNobyAkJHtTT1VSQ0VfREFURV9F
UE9DSC1kYXRlICslc30pCj4gCj4gT0ssIGJ1dCB3aGF0IGlmIFNPVVJDRV9EQVRFX0VQT0NIIGlz
IG5vdCBkZWZpbmVkPwo+ICJkYXRlIiBjb21tYW5kIGlzIG5vdCBhIGdvb2Qgc29sdXRpb24gaGVy
ZS4KCkkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgeW91IHRoaW5rIG5vdC4gIEkgdGhpbmsgYWxsIHRo
ZSB2ZXJzaW9ucyBvZgpkYXRlIHdlIGNhcmUgYWJvdXQgd2lsbCBkbyBzb21ldGhpbmcgc2Vuc2li
bGUgd2l0aAogICAgZGF0ZSArJXMKCkkgZG9uJ3QgaGF2ZSBhIEZyZWVCU0QgaG9zdCB0byBoYW5k
IHRvIHRlc3QsIENDJ2luZyBSb2dlci4KCkFsdGhvdWdoIG15IHJ1bmUgYWJvdmUgaXMgd3Jvbmcg
YW5kIHNob3VsZCByZWFkCiAgICBleHBvcnQgWEVOX0JVSUxEX1BPU0lYX1RJTUUJPz0gJChzaGVs
bCBlY2hvICQke1NPVVJDRV9EQVRFX0VQT0NILSQkKGRhdGUgKyVzKX0pCgo+IElmIG90aGVyIGd1
eXMgYXJlIE9LIHdpdGggdGhhdCBJIGNhbiBwcmVwYXJlIGEgcGF0Y2ggd2l0aCB5b3VyIFN1Z2dl
c3RlZC1ieS4KCkhvdyBkbyBpbiBpbnRlbmQgdG8gY2hvb3NlIHdoaWNoIHdyYXBwZXIgc2NyaXB0
IHRvIHVzZSA/CgpUaGlzIHBpbGUgb2Ygc3R1ZmYgd2lsbCBydW4gb24gYXdmdWwgbG90IG9mIHRp
bWVzIGR1cmluZyBlYWNoIG1ha2Ugc28Ka2VlcGluZyBpdCBvZiByZWFzb25hYmxlIHNpemUgaXMg
YSBnb29kIHBsYW4uCgpNYXliZSBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gaGF2ZSBhIHNpbmdsZSBz
aGVsbCBzY3JpcHQgd2hpY2ggb3V0cHV0cyBhCndob2xlIGJ1bmNoIG9mIHZhcmlhYmxlIHNldHRp
bmdzIGZvciBtYWtlIHRvICQoZXZhbCApID8KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
