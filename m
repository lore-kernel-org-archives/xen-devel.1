From: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v9 00/16] xen: xen-domid-restrict improvements
Date: Thu, 26 Apr 2018 18:41:37 +0100
Message-ID: <CAFEAcA_V_XodQRGAs=PosBZ5ZPBswnbqXbp-h7REijyqBVdkJg__27037.1481929489$1524764438$gmane$org@mail.gmail.com>
References: <1524758187-9351-1-git-send-email-ian.jackson@eu.citrix.com>
 <CAFEAcA9cumr=t7mRZ-9KtLMWAK-9nVGmRsnXjJ+pc899ePxfVg@mail.gmail.com>
 <23266.3638.876146.489411@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hssd=hp=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1fBku8-0008ON-1F
 for xen-devel@lists.xenproject.org; Thu, 26 Apr 2018 17:42:00 +0000
Received: by mail-ot0-x231.google.com with SMTP id p2-v6so30357142otf.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Apr 2018 10:41:58 -0700 (PDT)
In-Reply-To: <23266.3638.876146.489411@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Alistair Francis <alistair.francis@wdc.com>, Anthony PERARD <anthony.perard@citrix.com>, "open list:X86" <xen-devel@lists.xenproject.org>, Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjYgQXByaWwgMjAxOCBhdCAxODozNiwgSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJp
eC5jb20+IHdyb3RlOgo+IFBldGVyIE1heWRlbGwgd3JpdGVzICgiUmU6IFtQVUxMIHY5IDAwLzE2
XSB4ZW46IHhlbi1kb21pZC1yZXN0cmljdCBpbXByb3ZlbWVudHMiKToKPj4gSGkgLS0gbXkgYXBw
bHktcHVsbHJlcSBzY3JpcHQgdGhpbmtzIHRoaXMgaXNuJ3QgYSBzaWduZWQgdGFnOgo+Pgo+PiBl
cnJvcjogcmVtb3Rlcy9pd2ovZm9yLXVwc3RyZWFtLmRlcHJpdi0yOiBjYW5ub3QgdmVyaWZ5IGEg
bm9uLXRhZyBvYmplY3Qgb2YKPj4gdHlwZSBjb21taXQuIERvZXMgbm90IGFwcGVhciB0byBiZSBh
IHNpZ25lZCB0YWcKPgo+IEl0IGlzbid0LiAgSXQncyBub3QgYSB0YWcgYXQgYWxsLiAgSXQncyBh
IGJyYW5jaC4KPgo+PiBXZSBvbmx5IGFwcGx5IHNpZ25lZC10YWcgcHVsbCByZXF1ZXN0cyB0aGVz
ZSBkYXlzOyBjb3VsZCB5b3UKPj4gY3JlYXRlIGFuZCBzaWduIGEgdGFnIGFuZCByZXNlbmQgdGhl
IHB1bGxyZXEsIHBsZWFzZT8gKFlvdQo+PiBvbmx5IG5lZWQgdG8gcmVzZW5kIHRoZSBjb3ZlciBs
ZXR0ZXIsIG5vdCB0aGUgd2hvbGUgc2V0IG9mCj4+IHBhdGNoZXMuKQo+Cj4gSSBjYW4gZG8gdGhh
dC4gIEFsdGVybmF0aXZlbHkgeW91IGNvdWxkIG1hbnVhbGx5IHZlcmlmeSB0aGUgc2lnbmF0dXJl
Cj4gb24gbXkgZW1haWwgYW5kIG9ic2VydmUgdGhhdCBpdCBtZW50aW9ucyB0aGUgY29ycmVjdCBj
b21taXQgaGFzaC4KCkkgY291bGQsIGJ1dCBJIGhvcGUgeW91IHdpbGwgYXBwcmVjaWF0ZSB0aGF0
IEknbSBub3QgdGVycmlibHkKaW50ZXJlc3RlZCBpbiB0cnlpbmcgdG8gZmF0aG9tIHRoZSBteXN0
ZXJpZXMgb2YgZ3BnIGluIG9yZGVyCnRvIGRlYWwgd2l0aCBhIHNpbmdsZSBwdWxsIHJlcXVlc3Qg
dGhhdCBkb2Vzbid0IGFwcGVhciBpbgp0aGUgZm9ybSB0aGF0IG15IHRvb2xpbmcgZXhwZWN0cyBp
dCB0byBiZSBhbmQgdGhhdCBldmVyeSBvdGhlcgpwdWxsIHJlcXVlc3QgSSBkZWFsIHdpdGggY29t
ZXMgaW4uLi4KCj4+IChodHRwczovL3dpa2kucWVtdS5vcmcvQ29udHJpYnV0ZS9TdWJtaXRBUHVs
bFJlcXVlc3QKPj4gaXMgb3VyIHByb2Nlc3MgZG9jdW1lbnRhdGlvbiBvbiBwdWxsIHJlcXVlc3Rz
LCBidXQgSSB0aGluawo+PiBldmVyeXRoaW5nIGVsc2Ugd2l0aCB0aGlzIG9uZSBpcyBmaW5lLikK
Pgo+IEkgcmVhZCB0aGF0LiAgSXQgZG9lcyBub3Qgc2F5IHRoYXQgdGhlIHB1bGwgcmVxdWVzdCBt
dXN0IHJlZmVyIHRvIGEKPiBzaWduZWQgdGFnLiAgSXQgc2F5cyB0aGF0IHRoZSBwdWxsIHJlcXVl
c3QgbXVzdCBiZSBzaWduZWQsIHNvIEkgc2lnbmVkCj4gbXkgcHVsbCByZXF1ZXN0IGJ5IGZlZWRp
bmcgdGhlIGVtYWlsIGJvZHkgdG8gZ251cGcuCgpJIGhhdmUgZml4ZWQgdGhlIHdpa2kgcGFnZSB0
byBiZSBjbGVhcmVyIGFib3V0IHdoYXQgd2UgbWVhbiBieQoic2lnbmVkIHB1bGwgcmVxdWVzdHMi
LgoKPiBBbnl3YXksIHdvdWxkIHlvdSBsaWtlIG1lIHRvIG1ha2UgYSBzaWduZWQgdGFnIGFuZCBz
ZW5kIHlvdSBhbgo+IHVuc2lnbmVkIGVtYWlsIHJlZmVycmluZyB0byBpdCwgdGhlbiA/CgpZZXMs
IHBsZWFzZS4gKFlvdSBjYW4gc2lnbiB0aGUgZW1haWwgYXMgd2VsbCBpZiB5b3UgbGlrZSwgYnV0
IEknbQpub3QgZ29pbmcgdG8gYmUgY2hlY2tpbmcgdGhhdCwgc28gaXQgd2lsbCBiZSB3YXN0ZWQg
ZWZmb3J0IDotKSkuCgp0aGFua3MKLS0gUE1NCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
