From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH RFC 0/6] Slotted channels for sync vm_events
Date: Thu, 20 Dec 2018 07:08:39 -0700
Message-ID: <CABfawhmbX4fcN_MP5MkeJywwu_ZeNyc8VfJ4CG3_jKoWdXXLkQ@mail.gmail.com>
References: <cover.1545245243.git.ppircalabu@bitdefender.com>
 <CABfawhmPgmta2LPyMraKK2eLAqcdPrjUyox4dCGZD1MRx8wJDQ@mail.gmail.com>
 <fa2d73ba16b4dacd64f900c441272296234c0c00.camel@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=urxt=O5=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1gZz0q-0008U2-LJ
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 14:09:20 +0000
Received: by mail-ed1-f67.google.com with SMTP id y20so1850528edw.9
 for <xen-devel@lists.xenproject.org>; Thu, 20 Dec 2018 06:09:19 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41])
 by smtp.gmail.com with ESMTPSA id u33sm6482018edm.88.2018.12.20.06.09.16
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Dec 2018 06:09:16 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id t27so1906991wra.6
 for <xen-devel@lists.xenproject.org>; Thu, 20 Dec 2018 06:09:16 -0800 (PST)
In-Reply-To: <fa2d73ba16b4dacd64f900c441272296234c0c00.camel@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBEZWMgMjAsIDIwMTggYXQgMzo0OCBBTSBQZXRyZSBPdmlkaXUgUElSQ0FMQUJVCjxw
cGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIDIwMTgtMTItMTkg
YXQgMTU6MzMgLTA3MDAsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+IE9uIFdlZCwgRGVjIDE5
LCAyMDE4IGF0IDExOjUyIEFNIFBldHJlIFBpcmNhbGFidQo+ID4gPHBwaXJjYWxhYnVAYml0ZGVm
ZW5kZXIuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gVGhpcyBwYXRjaHNldCBpcyBhIHJld29yayBv
ZiB0aGUgIm11bHRpLXBhZ2UgcmluZyBidWZmZXIiIGZvcgo+ID4gPiB2bV9ldmVudHMKPiA+ID4g
cGF0Y2ggYmFzZWQgb24gQW5kcmV3IENvb3BlcidzIGNvbW1lbnRzLgo+ID4gPiBGb3Igc3luY2hy
b25vdXMgdm1fZXZlbnRzIHRoZSByaW5nIHdhaXRxdWV1ZSBsb2dpYyB3YXMgdW5uZWNlc3NhcnkK
PiA+ID4gYXMgdGhlCj4gPiA+IHZjcHUgc2VuZGluZyB0aGUgcmVxdWVzdCB3YXMgYmxvY2tlZCB1
bnRpbCBhIHJlc3BvbnNlIHdhcyByZWNlaXZlZC4KPiA+ID4gVG8gc2ltcGxpZnkgdGhlIHJlcXVl
c3QvcmVzcG9uc2UgbWVjaGFuaXNtLCBhbiBhcnJheSBvZiBzbG90dGVkCj4gPiA+IGNoYW5uZWxz
Cj4gPiA+IHdhcyBjcmVhdGVkLCBvbmUgcGVyIHZjcHUuIEVhY2ggdmNwdSBwdXRzIHRoZSByZXF1
ZXN0IGluIHRoZQo+ID4gPiBjb3JyZXNwb25kaW5nIHNsb3QgYW5kIGJsb2NrcyB1bnRpbCB0aGUg
cmVzcG9uc2UgaXMgcmVjZWl2ZWQuCj4gPiA+Cj4gPiA+IEknbSBzZW5kaW5nIHRoaXMgcGF0Y2gg
YXMgYSBSRkMgYmVjYXVzZSwgd2hpbGUgSSdtIHN0aWxsIHdvcmtpbmcgb24KPiA+ID4gd2F5IHRv
Cj4gPiA+IG1lYXN1cmUgdGhlIG92ZXJhbGwgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQsIHlvdXIg
ZmVlZGJhY2sgd291bGQgYmUKPiA+ID4gYSBncmVhdAo+ID4gPiBhc3Npc3RhbmNlLgo+ID4KPiA+
IEdlbmVyYWxseSBzcGVha2luZyB0aGlzIGFwcHJvYWNoIGlzIE9LLCBidXQgSSdtIGNvbmNlcm5l
ZCB0aGF0IHdlCj4gPiB3aWxsCj4gPiBldmVudHVhbGx5IHJ1biBpbnRvIHRoZSBzYW1lIHByb2Js
ZW0gdGhhdCBicm91Z2h0IHVwIHRoZSBpZGVhIG9mCj4gPiB1c2luZwo+ID4gbXVsdGktcGFnZSBy
aW5nczogdm1fZXZlbnQgc3RydWN0dXJlcyB0aGF0IGFyZSBsYXJnZXIgdGhlbiBhIHBhZ2UuCj4g
PiBSaWdodCBub3cgdGhpcyBzZXJpZXMgYWRkcyBhIHJpbmcgZm9yIGVhY2ggdkNQVSwgd2hpY2gg
ZG9lcyBtaXRpZ2F0ZQo+ID4gc29tZSBvZiB0aGUgYm90dGxlbmVjaywgYnV0IGl0IGRvZXMgbm90
IHJlYWxseSBhZGRyZXNzIHRoZSByb290Cj4gPiBjYXVzZS4KPiA+IEl0IGFsc28gYWRkcyBzaWdu
aWZpY2FudCBjb21wbGV4aXR5IGFzIHRoZSB1c2Vyc3BhY2Ugc2lkZSBub3cgaGFzIHRvCj4gPiBt
YXAgaW4gbXVsdGlwbGUgcmluZ3MsIGVhY2ggd2l0aCBpdHMgb3duIGV2ZW50IGNoYW5uZWwgYW5k
IHBvbGxpbmcKPiA+IHJlcXVpcmVtZW50cy4KPiA+Cj4gPiBUYW1hcwo+IFRoZSBtZW1vcnkgZm9y
IHRoZSB2bV9ldmVudCAicmluZ3MiIChhY3R1YWxseSBmb3Igc3luY2hyb25vdXMgdm1fZXZlbnQK
PiBqdXN0IGFuIGFycmF5IG9mIHZtX2V2ZW50X3Nsb3Qgc3RydWN0dXJlcyAoIHN0YXRlICsgdm1f
ZXZlbnRfcmVxdWVzdCAvCj4gdm1fZXZlbnRfcmVzcG9uc2UpIGlzIGFsbG9jYXRlZCBkaXJlY3Rs
eSBmcm9tIGRvbWhlYXAgYW5kIHNwYW5zIG92ZXIgYXMKPiBtYW55IHBhZ2VzIGFzIG5lY2Vzc2Fy
eS4KCkFoLCBPSywgSSBtaXNzZWQgdGhhdC4gSW4gdGhhdCBjYXNlIHRoYXQgaXMgZmluZSA6KQoK
PiBSZWdhcmRpbmcgdGhlIHVzZXJzcGFjZSBjb21wbGV4aXR5LCB1bmZvcnR1bmF0ZWx5IEkgaGF2
ZW4ndCBoYWQgYQo+IGJldHRlciBpZGVhIChidXQgSSdtIG9wZW4gdG8gc3VnZ2VzdGlvbnMpLgo+
IEluIG9yZGVyIHRvIGhhdmUgYSBsb2NrLWZyZWUgbWVjaGFuaXNtIHRvIGFjY2VzcyB0aGUgdm1f
ZXZlbnQgZGF0YSwKPiBlYWNoIHZjcHUgc2hvdWxkIGFjY2VzcyBvbmx5IGl0cyBvd24gc2xvdCAo
cmVmZXJlbmNlZCBieSB2Y3B1X2lkKS4KPiBJIGhhdmUgdXNlZCB0aGUgIm9uZSBldmVudCBjaGFu
bmVsIHBlciBzbG90ICsgb25lIGZvciB0aGUgYXN5bmMgcmluZyIKPiBhcHByb2FjaCwgYmVjYXVz
ZSwgdG8gbXkgdW5kZXJzdGFuZGluZywgdGhlIG9ubHkgYWRkaXRpb25hbCBpbmZvcm1hdGlvbgo+
IGFuIGV2ZW50IGNoYW5uZWwgY2FuIGNhcnJ5IGlzIHRoZSB2Y3B1IG9uIHdoaWNoIGlzIHRyaWdn
ZXJlZC4KClJpZ2h0LCBhbHRlcm5hdGl2ZSB3b3VsZCBiZSB0byBoYXZlIGEgc2luZ2xlIGV2ZW50
IGNoYW5uZWwgYW5kIHRoZW4KdGhlIHVzZXJzcGFjZSBoYXMgdG8gY2hlY2sgZWFjaCBzbG90IG1h
bnVhbGx5IHRvIHNlZSB3aGljaCB3YXMKdXBkYXRlZC4gTm90IHJlYWxseSBpZGVhbCBlaXRoZXIs
IHNvIEkgd291bGQgc3RpY2sgd2l0aCB0aGUgY3VycmVudAphcHByb2FjaCB3aXRoIGhhdmluZyBt
dWx0aXBsZSBldmVudCBjaGFubmVscy4KClRoYW5rcyEKVGFtYXMKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
