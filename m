From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC 44/49] xen: round up max vcpus to
 scheduling granularity
Date: Mon, 1 Apr 2019 11:47:59 +0200
Message-ID: <6c259488-c0ab-ec96-ee09-b76a9f402901@suse.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <20190329150934.17694-45-jgross@suse.com>
 <dcf13161-a427-d9a9-9998-b97daa51f7e1@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7l/E=SD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hAtXw-0003OH-So
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 09:48:04 +0000
In-Reply-To: <dcf13161-a427-d9a9-9998-b97daa51f7e1@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDQvMjAxOSAxMDo1MCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyOS8wMy8yMDE5
IDE1OjA5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBNYWtlIHN1cmUgdGhlIG51bWJlciBvZiB2
Y3B1cyBpcyBhbHdheXMgYSBtdWx0aXBsZSBvZiB0aGUgc2NoZWR1bGluZwo+PiBncmFudWxhcml0
eS4gTm90ZSB0aGF0IHdlIGRvbid0IHN1cHBvcnQgYSBzY2hlZHVsaW5nIGdyYW51bGFyaXR5IGFi
b3ZlCj4+IG9uZSBvbiBBUk0uCj4gCj4gSSdtIGFmcmFpZCB0aGF0IEkgZG9uJ3QgdGhpbmsgdGhp
cyBpcyBhIGNsZXZlciBtb3ZlLsKgIEluIHR1cm4sIHRoaXMKPiBicmluZ3MgaW50byBxdWVzdGlv
biB0aGUgYXBwcm9hY2ggdG8gaWRsZSBoYW5kbGluZy4KPiAKPiBGaXJzdGx5LCB3aXRoIGEgcHJv
cG9zZWQgc29ja2V0IGdyYW51bGFyaXR5LCB0aGlzIHdvdWxkIGJlIDEyOCBvbiBzb21lCj4gc3lz
dGVtcyB3aGljaCBleGlzdCB0b2RheS7CoCBGdXJ0aGVybW9yZSwgY29uc2lkZXIgdGhlIGNhc2Ug
d2hlcmUKPiBjcHVwb29sMCBoYXMgYSBncmFudWxhcml0eSBvZiAxLCBhbmQgYSBzZWNvbmQgcG9v
bCBoYXMgYSBncmFudWxhcml0eSBvZgo+IDIuwqAgQSBkb21haW4gY2FuIGJlIGNyZWF0ZWQgd2l0
aCBhbiBvZGQgbnVtYmVyIG9mIHZjcHVzIGFuZCBvcGVyYXRlIGluCj4gcG9vbDAgZmluZSwgYnV0
IGNhbid0IG5vdyBiZSBtb3ZlZCB0byBwb29sMS4KCkZvciBub3cgZ3JhbnVsYXJpdHkgaXMgdGhl
IHNhbWUgZm9yIGFsbCBwb29scywgYnV0IEkgcGxhbiB0byBlbmhhbmNlCnRoYXQgaW4gZnV0dXJl
LgoKVGhlIGFuc3dlciB0byB0aGF0IHByb2JsZW0gbWlnaHQgYmUgZWl0aGVyIHRvIGFsbG93IGZv
ciBsYXRlciBhZGRpdGlvbgpvZiBkdW1teSB2Y3B1cyAoZS5nLiBieSBzaXppbmcgb25seSB0aGUg
dmNwdSBwb2ludGVyIGFycmF5IHRvIHRoZSBuZWVkZWQKbnVtYmVyKSwgb3IgdG8gcmVhbGx5IGRp
c2FsbG93IG1vdmluZyBzdWNoIGEgZG9tYWluIGJldHdlZW4gcG9vbHMuCgo+IElmIGF0IGFsbCBw
b3NzaWJsZSwgSSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gdHJ5IGFuZCByZXVzZSB0aGUg
aWRsZQo+IGNwdXMgZm9yIGhvbGVzIGxpa2UgdGhpcy7CoCBTZWVpbmcgYXMgeW91J3ZlIGJlZW4g
cGxheWluZyB3aXRoIHRoaXMgY29kZQo+IGEgbG90LCB3aGF0IGlzIHlvdXIgYXNzZXNzbWVudD8K
ClRoaXMgd291bGQgYmUgcmF0aGVyIGNvbXBsaWNhdGVkLiBJJ2QgZWl0aGVyIG5lZWQgdG8gc3dp
dGNoIHZjcHVzCmR5bmFtaWNhbGx5IGluIHNjaGVkdWxlIGl0ZW1zLCBvciBJJ2QgbmVlZCB0byBz
cGVjaWFsIGNhc2UgdGhlIGlkbGUKdmNwdXMgaW4gX2xvdHNfIG9mIHBsYWNlcy4KCgpKdWVyZ2Vu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
