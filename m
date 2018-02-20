From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] build: remove shim related targets
Date: Tue, 20 Feb 2018 15:00:01 +0000
Message-ID: <20180220150001.o4cn5576oujtt2jf@MacBook-Pro-de-Roger.local>
References: <20180220143754.31260-1-roger.pau@citrix.com>
 <631b4a9f-8430-ae06-53fb-25921e90a07d@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=6c15=fo=citrix.com=prvs=582a52a2f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eo9Ov-0002Ej-IV
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2018 15:00:13 +0000
Content-Disposition: inline
In-Reply-To: <631b4a9f-8430-ae06-53fb-25921e90a07d@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMjAsIDIwMTggYXQgMDI6NDI6MjdQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyMC8wMi8xOCAxNDozNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUgYi90b29scy9maXJtd2Fy
ZS94ZW4tZGlyL01ha2VmaWxlCj4gPiBpbmRleCA3ZmQzNmEwZTE1Li4wMWEyODUwMTk0IDEwMDY0
NAo+ID4gLS0tIGEvdG9vbHMvZmlybXdhcmUveGVuLWRpci9NYWtlZmlsZQo+ID4gKysrIGIvdG9v
bHMvZmlybXdhcmUveGVuLWRpci9NYWtlZmlsZQo+ID4gQEAgLTQ4LDEzICs0OCwxNCBAQCBzaGlt
LSVjb25maWc6ICQoRCkgRk9SQ0UKPiA+ICAJCUtDT05GSUdfQ09ORklHPSQoQ1VSRElSKS9zaGlt
LmNvbmZpZwo+ID4gIAo+ID4gIHhlbi1zaGltOiAkKEQpIHNoaW0tb2xkZGVmY29uZmlnCj4gPiAt
CSQoTUFLRSkgLUMgJChEKS94ZW4gaW5zdGFsbC1zaGltIFwKPiA+ICsJJChNQUtFKSAtQyAkKEQp
L3hlbiBidWlsZCBcCj4gPiAgCQlYRU5fQ09ORklHX0VYUEVSVD15IFwKPiA+IC0JCUtDT05GSUdf
Q09ORklHPSQoQ1VSRElSKS9zaGltLmNvbmZpZyBcCj4gPiAtCQlERVNURElSPSQoQ1VSRElSKQo+
ID4gKwkJS0NPTkZJR19DT05GSUc9JChDVVJESVIpL3NoaW0uY29uZmlnCj4gPiArCWxuIC1zZiAk
KEQpL3hlbi94ZW4geGVuLXNoaW0KPiA+ICsJbG4gLXNmICQoRCkveGVuL3hlbi1zeW1zIHhlbi1z
aGltLXN5bXMKPiAKPiBUaGlzIG1pZ2h0IGJlIGZpbmUgZm9yIGRldmVsb3BlciBidWlsZHMsIGJ1
dCBpdCB3aWxsIGJyZWFrIFJQTSAoYW5kCj4gcHJvYmFibHkgREVCKSBwYWNrYWdlcy4KPiAKPiBU
aGV5IGFyZSBzZXBhcmF0ZSBmaWxlcywgYW5kIG5lZWQgY29weWluZyBpbnRvIHBsYWNlLCB0byBh
dm9pZAo+IGludGVyYWN0aW5nIHdpdGggbGF0ZXIgcmVidWlsZHMgb2YgWGVuLgoKSSdtIG5vdCBz
dXJlIEkgZm9sbG93LCBpbnRlcmFjdGluZyB3aXRoIHJlYnVpbGRzIGluIHdoaWNoIHdheT8KClRo
ZSB0YXJnZXQgb2YgdGhvc2Ugc3ltbGlua3MgaXMgYSBmaWxlIGluICQoRCkveGVuLywgd2hpY2gg
aXMgYWxyZWFkeQp4ZW4tc2hpbSBmaXJtd2FyZSBzcGVjaWZpYyAocmVidWlsZHMgb2YgdG9wIGxl
dmVsIHhlbi8gYXJlIG5vdCBnb2luZwp0byBhZmZlY3QgdGhpcyBiaW5hcnkpLgoKVGhhbmtzLCBS
b2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
