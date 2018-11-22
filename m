From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v6 03/11] libxl_qmp: Change
 qmp_qemu_check_version to compare version
Date: Thu, 22 Nov 2018 12:27:52 +0000
Message-ID: <20181122122752.GF2448@perard.uk.xensource.com>
References: <20181112164930.25893-1-anthony.perard@citrix.com>
 <20181112164930.25893-4-anthony.perard@citrix.com>
 <23529.46821.437745.367327@mariner.uk.xensource.com>
 <20181122122429.GE2448@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A1FS=OB=citrix.com=prvs=8577a9259=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gPo5N-0001k2-8w
 for xen-devel@lists.xenproject.org; Thu, 22 Nov 2018 12:27:57 +0000
Content-Disposition: inline
In-Reply-To: <20181122122429.GE2448@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMjIsIDIwMTggYXQgMTI6MjQ6MjlQTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gTW9uLCBOb3YgMTIsIDIwMTggYXQgMDU6MjI6NDVQTSArMDAwMCwgSWFuIEph
Y2tzb24gd3JvdGU6Cj4gPiBBbnRob255IFBFUkFSRCB3cml0ZXMgKCJbUEFUQ0ggdjYgMDMvMTFd
IGxpYnhsX3FtcDogQ2hhbmdlIHFtcF9xZW11X2NoZWNrX3ZlcnNpb24gdG8gY29tcGFyZSB2ZXJz
aW9uIik6Cj4gPiA+IFRoaXMgcGF0Y2ggbWFrZXMgdGhlIGZ1bmN0aW9uIHNpbXBsZXIgdG8gcmVh
ZC4gSXQgYWxzbyBhZGQgdGhlIGFiaWxpdHkKPiA+ID4gZm9yIGEgY2FsbGVyIHRvIHRlbGwgaWYg
UUVNVSBpcyBuZXdlciBvciBoYXZlIHRoZSBleGFjdCB2ZXJzaW9uLgo+ID4gCj4gPiBBY2tlZC1i
eTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gCj4gSSB3aWxsIGFk
ZCB0aGUgZm9sbG93aW5nIHRvIHRoZSBkb2N1bWVudCB0byBjbGFyaWZ5IHdoZW4gYSBjYWxsYmFj
ayBjYW4KPiBiZSBjYWxsZWQgKG5vdCBzeW5jaHJvbm91c2x5KS4KPiAKPiArKysgYi90b29scy9s
aWJ4bC9saWJ4bF9pbnRlcm5hbC5oCj4gQEAgLTM4OCw1ICszODgsNiBAQCBzdHJ1Y3QgbGlieGxf
X2V2X2NoaWxkIHsKPiAgICogbGlieGxfX2V2X3FtcF9zZW5kOiBJZGxlL0Nvbm5lY3RlZCAtPiBB
Y3RpdmUgKG9uIGVycm9yOiBJZGxlKQo+ICAgKiAgICBTZW5kcyBhIGNvbW1hbmQgdG8gUUVNVS4K
PiAgICogICAgY2FsbGJhY2sgd2lsbCBiZSBjYWxsZWQgd2hlbiBhIHJlc3BvbnNlIGlzIHJlY2Vp
dmVkIG9yIHdoZW4gYW4KPiAgICogICAgZXJyb3IgYXMgb2NjdXJlZC4KPiArICogICAgY2FsbGJh
Y2sgaXNuJ3QgY2FsbGVkIHN5bmNocm9ub3VzbHkuCj4gICAqCgpUaGF0IHdhcyBtZWFudCBmb3Ig
dGhlIG5leHQgcGF0Y2g6ICJsaWJ4bDogRGVzaWduIG9mIGFuIGFzeW5jIEFQSSB0bwppc3N1ZSBR
TVAgY29tbWFuZHMgdG8gUUVNVSIgLi4uICh3aGljaCBpcyBhY2tlZCBhcyB3ZWxsKS4KCi0tIApB
bnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
