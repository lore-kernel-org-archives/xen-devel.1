From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v2 6/6] RFC: tools/dm_restrict: Enable QEMU
 sandboxing
Date: Mon, 24 Sep 2018 14:04:51 +0100
Message-ID: <23464.57587.641742.948316@mariner.uk.xensource.com>
References: <20180921170428.13771-1-george.dunlap@citrix.com>
 <20180921170428.13771-6-george.dunlap@citrix.com>
 <23464.49451.531992.450514@mariner.uk.xensource.com>
 <e8886878-a7d8-3cc5-3396-69215716fe78@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=i3mt=mg=citrix.com=prvs=798356c8e=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1g4QXt-0008QQ-8G
 for xen-devel@lists.xenproject.org; Mon, 24 Sep 2018 13:05:01 +0000
In-Reply-To: <e8886878-a7d8-3cc5-3396-69215716fe78@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJSZTogW1BBVENIIHYyIDYvNl0gUkZDOiB0b29scy9kbV9y
ZXN0cmljdDogRW5hYmxlIFFFTVUgc2FuZGJveGluZyIpOgo+IEZyb20gcWVtdS1kZXByaXYubWQ6
Cj4gCj4gYGVsZXZhdGVwcml2aWxlZ2VzYCBpcyBjdXJyZW50bHkgcmVxdWlyZWQgdG8gYWxsb3cg
YC1ydW5hc2AgdG8gd29yay4KPiBSZW1vdmluZyB0aGlzIHJlcXVpcmVtZW50IHdvdWxkIG1lYW4g
bWFraW5nIHN1cmUgdGhhdCB0aGUgdWlkIGNoYW5nZQo+IGhhcHBlbmVkIGJlZm9yZSB0aGUgc2Vj
Y29tcDIgY2FsbCwgcGVyaGFwcyBieSBjaGFuZ2luZyB0aGUgdWlkIGJlZm9yZQo+IGV4ZWN1dGlu
ZyBRRU1VLiAgKEJ1dCB0aGlzIHdvdWxkIHRoZW4gcmVxdWlyZSBvdGhlciBjaGFuZ2VzIHRvIGNy
ZWF0ZQo+IHRoZSBRTVAgc29ja2V0LCBWTkMgc29ja2V0LCBhbmQgc28gb24pLgo+IAo+IFNob3Vs
ZCBJIEMmUCB0aGlzIGludG8gYSBjb21tZW50IGhlcmU/CgpZZXMuCgpJIHRoaW5rIHRoZSBjb25j
bHVzaW9uIEkgd291bGQgZHJhdyBmcm9tIHRoYXQgY29tbWVudCBpcyBub3QgdGhhdCB0aGUKdWlk
IGNoYW5nZSBzaG91bGQgaGFwcGVuIGJlZm9yZSBleGVjJ2luZyBxZW11LCBidXQgdGhhdCB0aGUg
c2VjY29tcApjYWxsIGluIHFlbXUgaXMgbWFkZSB0b28gZWFybHkuICBCdXQgZmluZS4KCj4gPiBJ
biB0aGlzIHN5bnRheCwgd2hhdCBoYXBwZW5zIHdpdGggdW5tZW50aW9uZWQgYWJpbGl0aWVzID8K
PiAKPiBHb29kIHF1ZXN0aW9uIC0tIHRoZSAtaGVscCBkb2Vzbid0IHNlZW0gdG8gc2F5LiAgTG9v
a2luZyBhdCB0aGUgY29kZQo+IChxZW11LXNlY2NvbXAuYzpwYXJzZV9zYW5kYm94KCkpIGZvciB0
aG9zZSB3aG8gd2FudCB0byBmb2xsb3cgYWxvbmcgYXQKPiBob21lKSwgaXQgc2VlbXMgZGlmZmVy
ZW50IG9wdGlvbnMgaGF2ZSBkaWZmZXJlbnQgZGVmYXVsdCB2YWx1ZXMgKHdoaWNoCj4gYXJlIG5v
dCBtZW50aW9uZWQpIC0tIG9ic29sZXRlIGlzIGRlZmF1bHQgZGVueSwgYnV0IHNwYXduLAo+IGVs
ZXZhdGVwcml2aWxlZ2VzLCBhbmQgcmVzb3VyY3NlY29udHJvbCBhcmUgZGVmYXVsdCBhbGxvdy4K
CkVyay4gIEkgZ3Vlc3Mgd2UgY291bGQgcGFyc2UgLWhlbHAgb3V0cHV0IDotLy4KCldoYXQgYWJv
dXQgY2FwYWJpbGl0aWVzIG5vdCBrbm93biB0byB0aGUgcWVtdSBzb3VyY2UgY29kZSA/CgpJYW4u
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
