From: Greg KH <greg@kroah.com>
Subject: Re: [stable] xen/pciback: Don't disable PCI_COMMAND on
 PCI device reset.
Date: Tue, 4 Jun 2019 07:48:09 +0200
Message-ID: <20190604054809.GA16504__27833.5572265618$1559627378$gmane$org@kroah.com>
References: <1559229415.24330.2.camel@codethink.co.uk>
 <0e6ebb5c-ff43-6d65-bcba-6ac5e60aa472@oracle.com>
 <20190603080036.GF7814@kroah.com>
 <1559563359.24330.8.camel@codethink.co.uk>
 <d3358f62-3e53-4468-782c-7b4466d34c0a@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QJG0=UD=kroah.com=greg@srs-us1.protection.inumbo.net>)
 id 1hY2Iz-0003dw-GL
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 05:48:17 +0000
Content-Disposition: inline
In-Reply-To: <d3358f62-3e53-4468-782c-7b4466d34c0a@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Prarit Bhargava <prarit@redhat.com>, xen-devel@lists.xenproject.org, Ben Hutchings <ben.hutchings@codethink.co.uk>, stable <stable@vger.kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDM6MTA6NTVQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAwMy8wNi8yMDE5IDE0OjAyLCBCZW4gSHV0Y2hpbmdzIHdyb3RlOgo+ID4gT24g
TW9uLCAyMDE5LTA2LTAzIGF0IDEwOjAwICswMjAwLCBHcmVnIEtIIHdyb3RlOgo+ID4+IE9uIFRo
dSwgTWF5IDMwLCAyMDE5IGF0IDA3OjAyOjM0UE0gLTA3MDAsIEtvbnJhZCBSemVzenV0ZWsgV2ls
ayB3cm90ZToKPiA+Pj4gT24gNS8zMC8xOSA4OjE2IEFNLCBCZW4gSHV0Y2hpbmdzIHdyb3RlOgo+
ID4+Pj4gSSdtIGxvb2tpbmcgYXQgQ1ZFLTIwMTUtODU1MyB3aGljaCBpcyBmaXhlZCBieToKPiA+
Pj4+Cj4gPj4+PiBjb21taXQgNzY4MWYzMWVjOWNkYWNhYjRmZDEwNTcwYmU5MjRmMmNlZjY2Njli
YQo+ID4+Pj4gQXV0aG9yOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNs
ZS5jb20+Cj4gPj4+PiBEYXRlOsKgwqDCoFdlZCBGZWIgMTMgMTg6MjE6MzEgMjAxOSAtMDUwMAo+
ID4+Pj4KPiA+Pj4+IMKgwqDCoMKgwqB4ZW4vcGNpYmFjazogRG9uJ3QgZGlzYWJsZSBQQ0lfQ09N
TUFORCBvbiBQQ0kgZGV2aWNlIHJlc2V0Lgo+ID4+Pj4KPiA+Pj4+IEknbSBhd2FyZSB0aGF0IHRo
aXMgY2hhbmdlIGlzIGluY29tcGF0aWJsZSB3aXRoIHFlbXUgPCAyLjUsIGJ1dCB0aGF0J3MKPiA+
Pj4+IG5vdyBxdWl0ZSBvbGQuwqDCoERvIHlvdSB0aGluayBpdCBtYWtlcyBzZW5zZSB0byBhcHBs
eSB0aGlzIGNoYW5nZSB0bwo+ID4+Pj4gc29tZSBzdGFibGUgYnJhbmNoZXM/Cj4gPj4+Pgo+ID4+
Pj4gQmVuLgo+ID4+Pj4KPiA+Pj4KPiA+Pj4gSGV5IEJlbiwKPiA+Pj4KPiA+Pj4gPHNocnVncz4g
TXkgb3BpbmlvbiBpcyB0byBkcm9wIGl0LCBidXQgaWYgSnVlcmdlbiB0aGlua3MgaXQgbWFrZXMg
c2Vuc2UgdG8KPiA+Pj4gYmFja3BvcnQgSSBhbSBub3QgZ29pbmcgdG8gYXJndWUuCj4gPj4KPiA+
PiBPaywgSSd2ZSBxdWV1ZWQgdGhpcyB1cCBub3csIHRoYW5rcy4KPiA+IAo+ID4gSnVlcmdlbiBz
YWlkOgo+ID4gCj4gPj4gSSdtIHdpdGggS29ucmFkIGhlcmUuCj4gPiAKPiA+IHNvIHVubGVzcyBJ
J20gdmVyeSBjb25mdXNlZCB0aGlzIHNob3VsZCAqbm90KiBiZSBhcHBsaWVkIHRvIHN0YWJsZQo+
ID4gYnJhbmNoZXMuCj4gCj4gInNob3VsZCBub3QiIGlzIGEgbGl0dGxlIGJpdCBoYXJkLiBJIGRp
ZG4ndCBvcHQgZm9yIGFkZGluZyBpdCwgYnV0IEkKPiBkb24ndCBvYmplY3QgdG8gYWRkIGl0IGVp
dGhlciAobGlrZSBLb25yYWQgOi0pICkuCgpPaywgSSd2ZSBhZGRlZCBpdCBhcyBpdCBkb2VzIGZp
eCBhIENWRSwgYW5kIGlmIEkgZG9uJ3QsIEknbGwgZ2V0IG9kZAplbWFpbHMgNiBtb250aHMgZnJv
bSBub3cgYXNraW5nIHdoeSBJIGRpZG4ndCBpbmNsdWRlIGl0Li4uCgp0aGFua3MsCgpncmVnIGst
aAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
