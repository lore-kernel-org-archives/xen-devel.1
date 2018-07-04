From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v2 1/8] xen: calculate XEN_BUILD_TIME using
 XEN_BUILD_DATE value
Date: Wed, 4 Jul 2018 17:30:54 +0100
Message-ID: <23356.63038.529901.339878@mariner.uk.xensource.com>
References: <1529418946-30114-1-git-send-email-daniel.kiper@oracle.com>
 <1529418946-30114-2-git-send-email-daniel.kiper@oracle.com>
 <5B30F2B202000078001CD8E4@prv1-mh.provo.novell.com>
 <20180704120629.GJ4670@olila.local.net-space.pl>
 <23356.53881.85485.72287@mariner.uk.xensource.com>
 <20180704143957.GC26572@olila.local.net-space.pl>
 <23356.60074.281809.940061@mariner.uk.xensource.com>
 <20180704160743.GF26572@olila.local.net-space.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8qzb=ju=citrix.com=prvs=716786cb2=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fakgc-0000UF-8d
 for xen-devel@lists.xenproject.org; Wed, 04 Jul 2018 16:31:22 +0000
In-Reply-To: <20180704160743.GF26572@olila.local.net-space.pl>
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
IDA0LCAyMDE4IGF0IDA0OjQxOjMwUE0gKzAxMDAsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4gSSBk
b24ndCBoYXZlIGEgRnJlZUJTRCBob3N0IHRvIGhhbmQgdG8gdGVzdCwgQ0MnaW5nIFJvZ2VyLgo+
IAo+IFRoaXMgaXMgbm90IHRoZSBkYXRlIGNvbW1hbmQgcHJvYmxlbS4gVGhpcyBpcyBtb3JlIHJl
bGF0ZWQgdG8gU09VUkNFX0RBVEVfRVBPQ0gKPiBzcGVjIChodHRwczovL3JlcHJvZHVjaWJsZS1i
dWlsZHMub3JnL3NwZWNzL3NvdXJjZS1kYXRlLWVwb2NoLyNpZG01NSkKPiB3aGljaCBjbGVhcmx5
IHNheXM6Cj4KPiAgIFRoZSB2YWx1ZSBNVVNUIGJlIHJlcHJvZHVjaWJsZSAoZGV0ZXJtaW5pc3Rp
YykgYWNyb3NzIGRpZmZlcmVudAo+ICAgZXhlY3V0aW9ucyBvZiB0aGUgYnVpbGQsIGRlcGVuZGlu
ZyBvbmx5IG9uIHRoZSBzb3VyY2UgY29kZS4gSXQgU0hPVUxECj4gICBiZSBzZXQgdG8gdGhlIGxh
c3QgbW9kaWZpY2F0aW9uIHRpbWUgb2YgdGhlIHNvdXJjZSwgaW5jb3Jwb3JhdGluZyBhbnkKPiAg
IHBhY2thZ2luZy1zcGVjaWZpYyBtb2RpZmljYXRpb25zLgo+IAo+IFNvLCBBSVVJLCBhYm92ZSBp
bXBsaWVzIHRoYXQgd2Ugc2hvdWxkIG5vdCB1c2UgdGhlIGRhdGUgY29tbWFuZC4gQW0gSSByaWdo
dD8KCk5vLgoKVGhhdCBzcGVjIGlzIGZvciBwZW9wbGUgKnNldHRpbmcqIFNPVVJDRV9EQVRFX0VQ
T0NILiAgV2hpY2ggd2UgYXJlIG5vdApkb2luZy4KCkZvciBhICpjb25zdW1lciogb2YgU09VUkNF
X0RBVEVfRVBPQ0gsIGlmIGl0IGlzIG5vdCBzZXQsIHVzaW5nIHRoZQpvdXRwdXQgb2YgZGF0ZSBv
ciB0aGUgY3VycmVudCB0aW1lIG9yIHNvbWV0aGluZyBpcyBmaW5lLgoKPiA+IEhvdyBkbyBpbiBp
bnRlbmQgdG8gY2hvb3NlIHdoaWNoIHdyYXBwZXIgc2NyaXB0IHRvIHVzZSA/Cj4gCj4gSSB0aG91
Z2ggdGhhdCBhIG1lY2hhbmlzbSB0byBkaWZmZXJlbnRpYXRlIEdOVSBhbmQgQlNEIHN5c3RlbXMg
ZXhpc3RzIGluCj4gdGhlIFhlbiBidWlsZCBzeXN0ZW0uIFNvLCBJIHdhcyBnb2luZyB0byByZXVz
ZSBpdCBzb21laG93LgoKSVNUUiB0aGlzIGJlaW5nIHNsaWdodGx5IGNsdW1zeS4gIEJ1dCBnb29k
IGx1Y2sgOi0pLgoKPiA+IFRoaXMgcGlsZSBvZiBzdHVmZiB3aWxsIHJ1biBvbiBhd2Z1bCBsb3Qg
b2YgdGltZXMgZHVyaW5nIGVhY2ggbWFrZSBzbwo+ID4ga2VlcGluZyBpdCBvZiByZWFzb25hYmxl
IHNpemUgaXMgYSBnb29kIHBsYW4uCj4gPgo+ID4gTWF5YmUgaXQgd291bGQgYmUgYmV0dGVyIHRv
IGhhdmUgYSBzaW5nbGUgc2hlbGwgc2NyaXB0IHdoaWNoIG91dHB1dHMgYQo+ID4gd2hvbGUgYnVu
Y2ggb2YgdmFyaWFibGUgc2V0dGluZ3MgZm9yIG1ha2UgdG8gJChldmFsICkgPwo+IAo+IEl0IGxv
b2tzIHRoYXQgdGhpcyB2YXJpYWJsZSBpcyByZWZlcmVuY2VkIG9uY2UsIHNvLCBpdCBzaG91bGQg
bm90IGJlIGEgcHJvYmxlbS4KCkkgdGhpbmsgbWFrZSdzIHJlY3Vyc2l2ZSBleHBhbnNpb24gc3lz
dGVtIG1heSByZXN1bHQgaW4gdGhlc2Ugc2hlbGwKcnVuZXMgYmVpbmcgZXhlY3V0ZWQgbXVsdGlw
bGUgdGltZXMuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
