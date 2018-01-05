From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH RFC v1 28/74] x86: initialise shared_info
	page
Date: Fri, 5 Jan 2018 14:40:17 +0000
Message-ID: <7ec84001-5e4a-f58c-b492-8da87ff2ee94@citrix.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-29-wei.liu2@citrix.com>
 <5A4F9597020000780019B65C@prv-mh.provo.novell.com>
 <2adb4a74-916f-714d-4441-d10ecdbf6b7a@citrix.com>
 <20180105142818.n22b72upfl6stoxu@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=oku2=ea=citrix.com=prvs=536ec9109=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eXTAp-0004iU-IB
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2018 14:40:43 +0000
In-Reply-To: <20180105142818.n22b72upfl6stoxu@MacBook-Pro-de-Roger.local>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, wei.liu2@citrix.com, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDEvMTggMTQ6MjgsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gRnJpLCBKYW4g
MDUsIDIwMTggYXQgMDI6MjA6MTZQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24g
MDUvMDEvMTggMTQ6MTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMDQuMDEuMTggYXQg
MTQ6MDUsIDx3ZWkubGl1MkBjaXRyaXguY29tPiB3cm90ZToKPj4+PiAtLS0gYS94ZW4vYXJjaC94
ODYvZ3Vlc3QveGVuLmMKPj4+PiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuLmMKPj4+PiBA
QCAtNzIsNiArNzIsMzAgQEAgdm9pZCBfX2luaXQgcHJvYmVfaHlwZXJ2aXNvcih2b2lkKQo+Pj4+
ICAgICAgeGVuX2d1ZXN0ID0gdHJ1ZTsKPj4+PiAgfQo+Pj4+ICAKPj4+PiArc3RhdGljIHZvaWQg
bWFwX3NoYXJlZF9pbmZvKHN0cnVjdCBlODIwbWFwICplODIwKQo+Pj4+ICt7Cj4+Pj4gKyAgICBw
YWRkcl90IGZyYW1lID0gMHhmZjAwMDAwMDsgLyogVE9ETzogSGFyZGNvZGVkIGJlc2lkZSBtYWdp
YyBmcmFtZXMuICovCj4+PiBXaGF0IGFyZSB0aGUgcGxhbnMgaGVyZT8KPj4gTm90aGluZyBpbW1l
ZGlhdGVseS7CoCBUaGlzIGlzIGNvbXBhdGlibGUgd2l0aCBhbGwgdmVyc2lvbnMgb2YgbGlieGMg
aW4KPj4gZXhpc3RhbmNlLCBidXQgd2UgbmVlZCB0byBzdGFydCBhIHRocmVhZCBkaXNjdXNzaW5n
IEhWTSBndWVzdCBwaHlzaWNhbAo+PiBhZGRyZXNzIHNwYWNlLgo+IFBhdGNoZXMgNDMvNDQvNDUg
cmVtb3ZlIHRoaXMgaGFyZGNvZGluZy4KCk9oIHNvcnJ5IC0gSSdtIGV2ZW4gbW9yZSBvdXQgb2Yg
ZGF0ZSB0aGFuIEkgdGhvdWdodCBJIHdhcy4KCkknbGwgZ2V0IGJhY2sgdG8gbXkgb3RoZXIgd29y
ay4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
