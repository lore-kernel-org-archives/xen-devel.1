From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v5] arch/x86: Add registers to vm_event
Date: Tue, 30 Oct 2018 09:14:26 -0600
Message-ID: <CABfawhk7E+xCVaTD5rM3o6fxSBCiGjAtXjYo8t8TBOxa36ZZBw@mail.gmail.com>
References: <20181030100651.19975-1-aisaila@bitdefender.com>
 <5BD8418902000078001F644F@prv1-mh.provo.novell.com>
 <c3323148-9cfb-3b69-59cc-aaaa012be1ff@bitdefender.com>
 <5BD85A4A02000078001F6516@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mwsw=nk=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1gHVjY-00021x-Sy
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 15:15:08 +0000
Received: by mail-ed1-f68.google.com with SMTP id b7-v6so10806461edd.9
 for <xen-devel@lists.xenproject.org>; Tue, 30 Oct 2018 08:15:07 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com.
 [209.85.221.45])
 by smtp.gmail.com with ESMTPSA id h11-v6sm514695eds.25.2018.10.30.08.15.04
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Oct 2018 08:15:05 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id w5-v6so13036435wrt.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Oct 2018 08:15:04 -0700 (PDT)
In-Reply-To: <5BD85A4A02000078001F6516@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Alexandru Isaila <aisaila@bitdefender.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBPY3QgMzAsIDIwMTggYXQgNzoxOSBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDMwLjEwLjE4IGF0IDEzOjI2LCA8cmNvam9jYXJ1QGJp
dGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4gPiBPbiAxMC8zMC8xOCAxOjMzIFBNLCBKYW4gQmV1bGlj
aCB3cm90ZToKPiA+Pj4+PiBPbiAzMC4xMC4xOCBhdCAxMTowNywgPGFpc2FpbGFAYml0ZGVmZW5k
ZXIuY29tPiB3cm90ZToKPiA+Pj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50LmgK
PiA+Pj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50LmgKPiA+Pj4gQEAgLTI5LDcg
KzI5LDcgQEAKPiA+Pj4KPiA+Pj4gICNpbmNsdWRlICJ4ZW4uaCIKPiA+Pj4KPiA+Pj4gLSNkZWZp
bmUgVk1fRVZFTlRfSU5URVJGQUNFX1ZFUlNJT04gMHgwMDAwMDAwMwo+ID4+PiArI2RlZmluZSBW
TV9FVkVOVF9JTlRFUkZBQ0VfVkVSU0lPTiAweDAwMDAwMDA0Cj4gPj4+Cj4gPj4+ICAjaWYgZGVm
aW5lZChfX1hFTl9fKSB8fCBkZWZpbmVkKF9fWEVOX1RPT0xTX18pCj4gPj4+Cj4gPj4+IEBAIC0x
NTcsNiArMTU3LDEyIEBACj4gPj4+ICAjZGVmaW5lIFZNX0VWRU5UX1g4Nl9DUjQgICAgMgo+ID4+
PiAgI2RlZmluZSBWTV9FVkVOVF9YODZfWENSMCAgIDMKPiA+Pj4KPiA+Pj4gKy8qIFRoZSBsaW1p
dCBmaWVsZCBpcyByaWdodC1zaGlmdGVkIGJ5IDEyIGJpdHMgaWYgLmFyLmcgaXMgc2V0LiAqLwo+
ID4+PiArc3RydWN0IHg4Nl9zZWxlY3Rvcl9yZWcgewo+ID4+Cj4gPj4gSSdtIHNvcnJ5IGZvciBu
b3QgaGF2aW5nIG5vdGljZWQgdGhpcyBlYXJsaWVyLCBidXQgdGhpcyBuZWVkcyBwcm9wZXIKPiA+
PiBwcmVmaXhpbmc6IE1hdGNoaW5nIHN0cnVjdCB2bV9ldmVudF9yZWdzX3g4NiwgaXQgc2hvdWxk
IGF0IGxlYXN0Cj4gPj4gYmUgcHJlZml4ZWQgYnkgdm1fZXZlbnRfLiBTdHJpY3RseSBzcGVha2lu
ZyB4ZW5fIGFzIHRoZSB2ZXJ5Cj4gPj4gZmlyc3QgdGhpbmcgd291bGQgYWxzbyBiZSByZXF1aXJl
ZCwgYnV0IEknbGwgbGVhdmUgdGhhdCB0byB0aGUgVk0KPiA+PiBldmVudCBtYWludGFpbmVycyB0
byBkZWNpZGUuIFdpdGggdGhpcwo+ID4+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Cj4gPgo+ID4gSSBhbSBmaW5lIHdpdGggZWl0aGVyIGFwcHJvYWNoIChzbyBs
ZWF2aW5nIGl0IGFzIGl0IGlzIG5vdCBhIHByb2JsZW0pLAo+ID4gc28gd2UnbGwgZ28gd2l0aCBU
YW1hcycgcHJlZmVyZW5jZS4gVGFtYXMsIHdoYXQncyB5b3VyIG9waW5pb24/Cj4KPiBGQU9EIGxl
YXZpbmcgYXMgaXMgaXMgbm90IGFuIG9wdGlvbiAtIGF0IGxlYXN0IHZtX2V2ZW50XyBuZWVkcyB0
bwo+IGJlIGFkZGVkLCB0byBub3QgY2hhbmNlIGNvbGxpc2lvbiB3aXRoIGEgZnV0dXJlIGFkZGl0
aW9uIGluIFhlbiBpdHNlbGYuCgpJIGFncmVlLCB3ZSBzaG91bGQga2VlcCB0aGluZ3MgcHJlZml4
ZWQgd2l0aCB2bV9ldmVudF8gaW4gdGhpcyBoZWFkZXIuCgpUYW1hcwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
