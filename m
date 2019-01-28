From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.12] arm: gic: deactivate sgi
 immediately after eoi
Date: Mon, 28 Jan 2019 13:16:07 +0100
Message-ID: <ded857d2-d6d1-7d07-724a-2cbf670627d1@suse.com>
References: <20190124125210.6038-1-peng.fan@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Swqu=QE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1go5ph-00067S-Rw
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 12:16:09 +0000
In-Reply-To: <20190124125210.6038-1-peng.fan@nxp.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Peng Fan <peng.fan@nxp.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, "julien.grall@arm.com" <julien.grall@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDEvMjAxOSAxMzo0MywgUGVuZyBGYW4gd3JvdGU6Cj4gT24gaS5NWDgsIHdlIGltcGxl
bWVudGVkIHBhcnRpdGlvbiByZWJvb3Qgd2hpY2ggbWVhbnMgQ29ydGV4LUEgcmVib290Cj4gd2ls
bCBub3QgaW1wYWN0IE00IGNvcmVzIGFuZCBTeXN0ZW0gY29udHJvbCBVbml0IGNvcmUuIEhvd2V2
ZXIgR0lDdjMKPiBpcyBub3QgcmVzZXQgYmVjYXVzZSB3ZSBhbHNvIG5lZWQgdG8gc3VwcG9ydCBB
NzIgQ2x1c3RlciByZWJvb3Qgd2l0aG91dAo+IGFmZmVjdGluZyBBNTMgQ2x1c3Rlci4KPiAKPiBU
aGUgZ2ljLXYzIGNvbnRyb2xsZXIgaXMgY29uZmlndXJlZCB3aXRoIEVPSW1vZGUgdG8gMSwgc28g
ZHVyaW5nIHhlbgo+IHJlYm9vdCwgdGhlcmUgaXMgYSBmdW5jdGlvbiBjYWxsICJzbXBfY2FsbF9m
dW5jdGlvbihoYWx0X3RoaXNfY3B1LCBOVUxMLCAwKTsiCj4gLGJ1dCBoYWx0X3RoaXNfY3B1IG5l
dmVyIHJldHVybiwgdGhhdCBtZWFucyBvdGhlciBDUFVzIGhhdmUgbm8gY2hhbmNlIHRvCj4gZGVh
Y3RpdmUgdGhlIFNHSSBpbnRlcnJ1cHQsIGJlY2F1c2UgdGhlIGRlYWN0aXZhdGVfaXJxIG9wZXJh
dGlvbiBpcyBhdAo+IHRoZSBlbmQgb2YgZG9fc2dpLiBEdXJpbmcgeGVuIGJvb3RpbmcgYWdhaW4s
IENQVTAgd2lsbCBpc3N1ZQo+IEdJQ19TR0lfQ0FMTF9GVU5DVElPTiB0byBvdGhlciBDUFVzLiBC
ZWNhdXNlIEdJQ19TR0lfQ0FMTF9GVU5DVElPTiBvZgo+IG90aGVyIENQVXMgYXJlIGFjdGl2ZSBk
dXJpbmcgdGhlIGxhc3QgcmVib290LCBpbnRlcnJ1cHRzIGNvdWxkIG5vdCBiZQo+IHRyaWdnZXJl
ZCB1bmxlc3Mgd2UgZGVhY3RpdmF0ZSB0aGUgaW50ZXJydXB0IGZpcnN0Lgo+IAo+IFRvIGZpeCB0
aGlzIGlzc3VlLCBsZXQncyBtb3ZlIHRoZSBkZWFjdGl2YXRlX2lycSBvcGVyYXRpb24ganVzdCBh
ZnRlcgo+IGVvaV9pcnEsIHRoZW4gdGhlIFNHSSBpbnRlcnJ1cHQgd2lsbCBiZSBpbiBkZWFjdGl2
ZSBzdGF0ZSB3aGVuCj4gc21wX2NhbGxfZnVuY3Rpb25faW50ZXJydXB0Lgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPgoKUmVsZWFzZS1hY2tlZC1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
