From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH] x86/vm_event: correctly gather gs_shadow
 value
Date: Wed, 1 May 2019 09:01:12 -0600
Message-ID: <CABfawhnMLKb3psg81x4FzVX8UbgGrZYzOJkYXaTxFzABsGoXtg@mail.gmail.com>
References: <20190501042249.1218-1-tamas@tklengyel.com>
 <602abffd-4cb8-c471-3adb-38d6bc3b1cb9@citrix.com>
 <CABfawhmi0UJ=K9q7y7oX1kYUBtpTZcLBk9RLnu4Uay7=CqJmpg@mail.gmail.com>
 <CABfawhkjUOJ_u+ZN7R02gZAWM-ogPncUDQKFmGnhDRgZA-zm8Q@mail.gmail.com>
 <1ce5e769-2269-0ed5-aedb-8acd580f8a94@bitdefender.com>
 <CABfawh=Q6iYej3xAEAwwJd=X_HzbU0iLLUTHby=1QDstBZf4QA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q16C=TB=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hLqk3-0006Yh-If
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 15:01:51 +0000
Received: by mail-wr1-f47.google.com with SMTP id f7so16372468wrs.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2019 08:01:49 -0700 (PDT)
In-Reply-To: <CABfawh=Q6iYej3xAEAwwJd=X_HzbU0iLLUTHby=1QDstBZf4QA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXkgMSwgMjAxOSBhdCA4OjUzIEFNIFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGts
ZW5neWVsLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIE1heSAxLCAyMDE5IGF0IDg6MjAgQU0gUmF6
dmFuIENvam9jYXJ1Cj4gPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+ID4KPiA+
IE9uIDUvMS8xOSA0OjU4IFBNLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPiA+Pj4gSXQgbWln
aHQgYmUgd29ydGggaW50cm9kdWNpbmcgYSAic3luYyBzdGF0ZSBmcm9tIGh3IiBob29rIHdoaWNo
IGNvbGxlY3RzCj4gPiA+Pj4gYWxsIHRoZSBkYXRhIHdlIGludGVuZCB0byBwYXNzIHRvIHRoZSBp
bnRyb3NwZWN0aW9uIGFnZW50Lgo+ID4gPj4KPiA+ID4+IFlvdSBtZWFuIGFkZGluZyBhbm90aGVy
IGh2bSBob29rPwo+ID4gPgo+ID4gPiBBY3R1YWxseSwgaW5zdGVhZCBvZiBhbm90aGVyIGhvb2sg
SSB0aGluayB3aGF0IHdvdWxkIG1ha2Ugc2Vuc2UgaXQgdG8KPiA+ID4ganVzdCB1cGRhdGUgdm14
X3NhdmVfdm1jc19jdHh0IHRvIGF1dG9tYXRpY2FsbHkgcmVmcmVzaCB0aGUgY2FjaGVkCj4gPiA+
IHJlZ2lzdGVyIHZhbHVlcyB3aGVuIGl0J3MgY2FsbGVkIHdpdGggInYgPT0gY3VycmVudCIuIFRo
b3VnaHRzPwo+ID4KPiA+IFRoYXQncyBwcm9iYWJseSB0aGUgYmV0dGVyIHdheSB0byBnbyBhYm91
dCBpdCwgc2luY2Ugb3RoZXJ3aXNlIHRoZQo+ID4geGNfaHZtX2dldGNvbnRleHRfcGFydGlhbCgp
IGh5cGVyY2FsbCB3aWxsIHN1ZmZlciBmcm9tIHRoZSBzYW1lIHByb2JsZW0uCj4gPiAodGhlcmUg
YXJlIHR3byB3YXlzIG9mIGdldHRpbmcgZ3Vlc3Qgc3RhdGU6IG9uZSBpcyB2aWEgdGhlIHZtX2V2
ZW50Cj4gPiBjYWNoZWQgdmFsdWVzLCB0aGUgb3RoZXIgaXMgdmlhIHRoZSBhZm9yZW1lbnRpb25l
ZCBoeXBlcmNhbGwpLgo+Cj4gVHJ1ZSwgYWx0aG91Z2ggaXNzdWluZyB0aGUgaHlwZXJjYWxsIGlu
IHRoZSB2bV9ldmVudCBjYWxsYmFjayBpcwo+IGFjdHVhbGx5IGZpbmUgLSB0aGF0J3MgaG93IEkg
Zm91bmQgdGhlIGlzc3VlIHRvIGJlZ2luIHdpdGgsIHNpbmNlIHRoZQo+IHZDUFUgd2lsbCBiZSBz
Y2hlZHVsZWQgb3V0IHdpdGggdGhlIGNhY2hlZCByZWdpc3RlcnMgcmVmcmVzaGVkIGFuZAo+IHRo
dXMgYmUgZGlmZmVyZW50IHRoZW4gd2hhdCB0aGUgdm1fZXZlbnQgaXRzZWxmIGhhZC4gQnV0IG90
aGVyIGNhbGxlcnMKPiBvZiB0aGUgaHlwZXJjYWxsIGNhbiBydW4gaW50byB0aGUgcHJvYmxlbSBp
ZiB0aGUgZ3Vlc3QvdmNwdSBpcyBub3QKPiBwYXVzZWQuCgpBY3R1YWxseSwgZG9pbmcgdGhlICJ2
ID09IGN1cnJlbnQiIGNoZWNrIHdvdWxkbid0IHJlYWxseSBkbyBhbnl0aGluZwpmb3IgdGhlIGh5
cGVyY2FsbCBzaW5jZSBpdCdzIG5vdCB0aGUgZG9tYWluIGlzc3VpbmcgdGhlIGh5cGVyY2FsbCBv
bgppdHNlbGYuIFRoZSBvbmx5IHdheSB0byBlbnN1cmUgdGhhdCBoeXBlcmNhbGwgaXMgcmV0dXJu
aW5nIGNvcnJlY3QKdmFsdWVzIHdvdWxkIGJlIHRvIHBhdXNlIHRoZSB2Q1BVLgoKVGFtYXMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
