From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 1/4] xen/arm: gic: Ensure we have an ISB
 between ack and do_IRQ()
Date: Tue, 20 Nov 2018 18:47:12 +0000
Message-ID: <4ceea0f6-ede1-420a-d3b7-80c4584739ce@arm.com>
References: <20181023181709.11883-1-julien.grall@arm.com>
 <20181023181709.11883-2-julien.grall@arm.com>
 <6098937f-98de-bff9-6c48-5575a45875e0@epam.com>
 <57ee191b-be21-701e-ef19-4ed4df1cf289@arm.com>
 <77f72cc9-6548-afd9-3766-23326b3551d9@epam.com>
 <6acf65ef-4302-c403-32ba-1d88ab954265@epam.com>
 <22f7ebc8-c74b-0d8e-4847-9d3df9bcf5db@arm.com>
 <3622e468-8f44-1e31-138f-db58ca3835ff@epam.com>
 <2090f5b4-22ff-38bc-3d47-6dbb6d7fccfb@epam.com>
 <6d1c980b-b316-f634-7793-0aca4b34aa85@arm.com>
 <VI1PR0302MB26882FD1B2445807F8C2B026E6C60@VI1PR0302MB2688.eurprd03.prod.outlook.com>
 <5ad76791-075d-e588-2669-e01c79674f0d@gmail.com>
 <CAF3u54CmW32NwN0q73LaXwnj2wUt72uuq9LGPRQ3RNMzZTV==Q@mail.gmail.com>
 <d260c074-6107-a5d1-94c8-fdb019585135@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <d260c074-6107-a5d1-94c8-fdb019585135@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, Julien Grall <julien.grall@gmail.com>
Cc: "andre.przywara@arm.com" <andre.przywara@arm.com>, Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, Andrii Anisov <Andrii_Anisov@epam.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyMC8xMS8yMDE4IDE4OjEwLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIEp1bGll
biwKPiAKPiAKPiBPbiAxOS4xMS4xOCAxODo0MiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBUaGVy
ZSBhcmUgbm8gaXNzdWUgYWJvdXQgcHJvY2Vzc2luZyBJUlFzIGJlZm9yZSB0aGUgc3luY3MuIEl0
IGlzIHRoZSBzYW1lIGFzIAo+PiBpZiBhbiBJUlEgd2FzIHJhaXNlZCBmcm9tIGlsYSBkaWZmZXJl
bnQgcENQVXMuCj4+IFNvIHdoeSBkbyB5b3UgbmVlZCB0aGF0Pwo+IAo+ICBGcm9tIG15IHVuZGVy
c3RhbmRpbmcgb2YgZ2ljLXZnaWMgY29kZSAob2xkIHZnaWMpLCBmb3IgdGhlIElSUXMgdGFyZ2V0
aW5nIHRoZSAKPiBgY3VycmVudGAgdmNwdSwgaXQgbGVhZHMgdG8gYSBmYXN0ZXIgcHJvY2Vzc2lu
ZyB1bmRlciBpbnRlcnJ1cHRzIHN0b3JtIAo+IGNvbmRpdGlvbnMuIElmIGl0IHdhcyBhbGwgTFJz
IHNldCBvbiBwcmV2aW91cyBzd2l0Y2ggdG8gYSBndWVzdCwgYSB0aGUgSVJRIHdpbGwgCj4gaGF2
ZSBhIGNoYW5jZSB0byBnbyBkaXJlY3RseSB0byBMUiBpbnN0ZWFkIG9mIHNldHRpbmcgb24gbHJf
cGVuZGluZyBxdWV1ZS4gQWxzbyAKPiBpbmZsaWdodF9pcnFzIHF1ZXVlIGhhdmUgYSBjaGFuY2Ug
dG8gYmUgc2hvcnRlciB0byBpbnNlcnQuCgpEbyB5b3UgaGF2ZSBhY3R1YWwgbnVtYmVycz8gQWxz
byB0byBiZSBvbiB0aGUgc2FtZSBwYWdlLCB3aGF0IGlzIHlvdXIgZGVmaW5pdGlvbiAKb2YgaW50
ZXJydXB0cyBzdG9ybT8KCkJlYXIgaW4gbWluZCB0aGF0IHRoZSBvbGQgdkdJQyB3aWxsIGJlIHBo
YXNlZCBvdXQgc29vbi4gSWYgeW91IGFyZSB3b3JyaWVkIGFib3V0IApwZXJmb3JtYW5jZSwgdGhl
biBJIHdvdWxkIHJlY29tbWVuZCB0byB0cnkgdGhlIG5ldyB2R0lDIGFuZCBzZWUgd2hldGhlciBp
dCBpbXByb3Zlcy4KCj4gTW9yZW92ZXIsIG1heWJlIHlvdSBjYW4gZXhwbGFpbiBtZSwgd2hhdCdz
IHRoZSBwb2ludCBvZiBpbnRlcnJ1cHRzIGVuYWJsaW5nIAo+IGJlZm9yZSBmb3IgYGRvX0lSUSgp
YCBjYWxsPyBUaG9zZSBpbnRlcnJ1cHRzIHdvdWxkIGJlIGdyYWJiZWQgYW5kIHByb2Nlc3NlZCAK
PiBhbnl3YXksIGR1cmluZyBydW4gdGhyb3VnaCB0aGUgbG9vcCBpbiBgZ2ljX2ludGVycnVwdCgp
YC4gU28gSSBzZWUgdGhlIG9ubHkgCj4gb3V0Y29tZSBvZiBpbnRlcnJ1cHRzIGVuYWJsaW5nIC0g
c3BlbmRpbmcgbW9yZSB0aW1lIGZvciBjb250ZXh0IHN3aXRjaGVzLgoKV2VsbCwgaWYgeW91IHJl
LWVuYWJsZSB0aGUgaW50ZXJydXB0cyB5b3UgZ2l2ZSBhIGNoYW5jZSBmb3IgaGlnaGVyIHByaW9y
aXR5IAppbnRlcnJ1cHRzIHRvIGNvbWUgdXAuIFRoaXMgd2lsbCBub3QgaGFwcGVuIGlmIHlvdSBo
YXZlIGludGVycnVwdHMgZGlzYWJsZWQuCgpCdXQgeW91IHNlZW0gdG8gYmFzZSB5b3VyIGFzc3Vt
cHRpb24gb24gaW50ZXJydXB0cyBzdG9ybSAoeWV0IHRvIGJlIGRlZmluZWQpLiBJZiAKeW91IGhh
dmUgYW4gaW50ZXJydXB0IHN0b3JtLCB0aGVuIHlvdSBhcmUgYWxyZWFkeSBkb29tZWQgYXMgeW91
ciBndWVzdC9YZW4gd2lsbCAKbm90IGhhdmUgdGltZSB0byBkbyBhbnkgb3RoZXIgd29yay4KCklu
IGFueSBjYXNlLCB5b3UgbmVlZCB0byBwcm92aWRlIG51bWJlciB0byBzdXBwb3J0IHlvdXIgb3B0
aW1pemF0aW9uLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
