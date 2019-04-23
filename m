From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/2] xen/pvh: correctly setup the PV EFI
 interface for dom0
Date: Tue, 23 Apr 2019 11:42:40 +0200
Message-ID: <20190423094240.ksiq2qtow44tzbmf__43849.4028685213$1556012628$gmane$org@Air-de-Roger>
References: <20190423092829.67915-1-roger.pau@citrix.com>
 <20190423092829.67915-2-roger.pau@citrix.com>
 <ec713432-338e-9d14-f626-759b0f3f94d7@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hJhn=SZ=citrix.com=prvs=009aac223=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hIrwx-0001Co-Pa
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 09:42:51 +0000
Content-Disposition: inline
In-Reply-To: <ec713432-338e-9d14-f626-759b0f3f94d7@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andy@infradead.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBcHIgMjMsIDIwMTkgYXQgMTE6MzY6MTBBTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBPbiAyMy8wNC8yMDE5IDExOjI4LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS94ZW4veGVuLW9wcy5oIGIvaW5jbHVkZS94ZW4veGVuLW9wcy5o
Cj4gPiBpbmRleCA0OTY5ODE3MTI0YTguLjUxZWY5OGU5NmQ4OCAxMDA2NDQKPiA+IC0tLSBhL2lu
Y2x1ZGUveGVuL3hlbi1vcHMuaAo+ID4gKysrIGIvaW5jbHVkZS94ZW4veGVuLW9wcy5oCj4gPiBA
QCAtMjA5LDYgKzIwOSw3IEBAIGludCB4ZW5feGxhdGVfbWFwX2JhbGxvb25lZF9wYWdlcyh4ZW5f
cGZuX3QgKipwZm5zLCB2b2lkICoqdmFkZHIsCj4gPiAgCj4gPiAgYm9vbCB4ZW5fcnVubmluZ19v
bl92ZXJzaW9uX29yX2xhdGVyKHVuc2lnbmVkIGludCBtYWpvciwgdW5zaWduZWQgaW50IG1pbm9y
KTsKPiA+ICAKPiA+ICsjaWZkZWYgQ09ORklHX1hFTl9FRkkKPiA+ICBlZmlfc3RhdHVzX3QgeGVu
X2VmaV9nZXRfdGltZShlZmlfdGltZV90ICp0bSwgZWZpX3RpbWVfY2FwX3QgKnRjKTsKPiA+ICBl
Zmlfc3RhdHVzX3QgeGVuX2VmaV9zZXRfdGltZShlZmlfdGltZV90ICp0bSk7Cj4gPiAgZWZpX3N0
YXR1c190IHhlbl9lZmlfZ2V0X3dha2V1cF90aW1lKGVmaV9ib29sX3QgKmVuYWJsZWQsIGVmaV9i
b29sX3QgKnBlbmRpbmcsCj4gPiBAQCAtMjMzLDcgKzIzNCwxMiBAQCBlZmlfc3RhdHVzX3QgeGVu
X2VmaV9xdWVyeV9jYXBzdWxlX2NhcHMoZWZpX2NhcHN1bGVfaGVhZGVyX3QgKipjYXBzdWxlcywK
PiA+ICAJCQkJCWludCAqcmVzZXRfdHlwZSk7Cj4gPiAgdm9pZCB4ZW5fZWZpX3Jlc2V0X3N5c3Rl
bShpbnQgcmVzZXRfdHlwZSwgZWZpX3N0YXR1c190IHN0YXR1cywKPiA+ICAJCQkgIHVuc2lnbmVk
IGxvbmcgZGF0YV9zaXplLCBlZmlfY2hhcjE2X3QgKmRhdGEpOwo+ID4gLQo+ID4gK2V4dGVybiB2
b2lkIHhlbl9lZmlfaW5pdChzdHJ1Y3QgYm9vdF9wYXJhbXMgKmJvb3RfcGFyYW1zKTsKPiA+ICsj
ZWxzZQo+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBfX2luaXQgeGVuX2VmaV9pbml0KHN0cnVjdCBi
b290X3BhcmFtcyAqYm9vdF9wYXJhbXMpCj4gCj4gSXMgc3RydWN0IGJvb3RfcGFyYW1zIGRlZmlu
ZWQgb24gQVJNPwoKU2VlbXMgdG8gYmUgZGVmaW5lZCBmb3IgeDg2IGFuZCBzb21lIG1pcHMgb25s
eSwgc28gSSB3aWxsIGhhdmUgdG8gZmluZAphbm90aGVyIGhlYWRlci4gV2lsbCBwb3N0IHYyIHNo
b3J0bHkuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
