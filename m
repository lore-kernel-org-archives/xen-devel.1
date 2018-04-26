From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PULL v9 00/16] xen: xen-domid-restrict improvements
Date: Thu, 26 Apr 2018 19:13:49 +0100
Message-ID: <23266.5853.998350.948709__42622.9135286578$1524766375$gmane$org@mariner.uk.xensource.com>
References: <1524758187-9351-1-git-send-email-ian.jackson@eu.citrix.com>
 <CAFEAcA9cumr=t7mRZ-9KtLMWAK-9nVGmRsnXjJ+pc899ePxfVg@mail.gmail.com>
 <23266.3638.876146.489411@mariner.uk.xensource.com>
 <CAFEAcA_V_XodQRGAs=PosBZ5ZPBswnbqXbp-h7REijyqBVdkJg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pghr=hp=citrix.com=prvs=647a3a28a=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fBlP2-0002Ib-Lc
 for xen-devel@lists.xenproject.org; Thu, 26 Apr 2018 18:13:56 +0000
In-Reply-To: <CAFEAcA_V_XodQRGAs=PosBZ5ZPBswnbqXbp-h7REijyqBVdkJg@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Juergen Gross <jgross@suse.com>, Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, Alistair Francis <alistair.francis@wdc.com>, Anthony PERARD <anthony.perard@citrix.com>, "open list:X86" <xen-devel@lists.xenproject.org>, Eric Blake <eblake@redhat.com>, Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
List-Id: xen-devel@lists.xenproject.org

UGV0ZXIgTWF5ZGVsbCB3cml0ZXMgKCJSZTogW1BVTEwgdjkgMDAvMTZdIHhlbjogeGVuLWRvbWlk
LXJlc3RyaWN0IGltcHJvdmVtZW50cyIpOgo+IE9uIDI2IEFwcmlsIDIwMTggYXQgMTg6MzYsIElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXguY29tPiB3cm90ZToKPiA+IEkgY2FuIGRvIHRo
YXQuICBBbHRlcm5hdGl2ZWx5IHlvdSBjb3VsZCBtYW51YWxseSB2ZXJpZnkgdGhlIHNpZ25hdHVy
ZQo+ID4gb24gbXkgZW1haWwgYW5kIG9ic2VydmUgdGhhdCBpdCBtZW50aW9ucyB0aGUgY29ycmVj
dCBjb21taXQgaGFzaC4KPiAKPiBJIGNvdWxkLCBidXQgSSBob3BlIHlvdSB3aWxsIGFwcHJlY2lh
dGUgdGhhdCBJJ20gbm90IHRlcnJpYmx5Cj4gaW50ZXJlc3RlZCBpbiB0cnlpbmcgdG8gZmF0aG9t
IHRoZSBteXN0ZXJpZXMgb2YgZ3BnIGluIG9yZGVyCj4gdG8gZGVhbCB3aXRoIGEgc2luZ2xlIHB1
bGwgcmVxdWVzdCB0aGF0IGRvZXNuJ3QgYXBwZWFyIGluCj4gdGhlIGZvcm0gdGhhdCBteSB0b29s
aW5nIGV4cGVjdHMgaXQgdG8gYmUgYW5kIHRoYXQgZXZlcnkgb3RoZXIKPiBwdWxsIHJlcXVlc3Qg
SSBkZWFsIHdpdGggY29tZXMgaW4uLi4KCkZhaXIgZW5vdWdoLgoKPiBJIGhhdmUgZml4ZWQgdGhl
IHdpa2kgcGFnZSB0byBiZSBjbGVhcmVyIGFib3V0IHdoYXQgd2UgbWVhbiBieQo+ICJzaWduZWQg
cHVsbCByZXF1ZXN0cyIuCgpUaGFua3MgOi0pLgoKPiA+IEFueXdheSwgd291bGQgeW91IGxpa2Ug
bWUgdG8gbWFrZSBhIHNpZ25lZCB0YWcgYW5kIHNlbmQgeW91IGFuCj4gPiB1bnNpZ25lZCBlbWFp
bCByZWZlcnJpbmcgdG8gaXQsIHRoZW4gPwo+IAo+IFllcywgcGxlYXNlLiAoWW91IGNhbiBzaWdu
IHRoZSBlbWFpbCBhcyB3ZWxsIGlmIHlvdSBsaWtlLCBidXQgSSdtCj4gbm90IGdvaW5nIHRvIGJl
IGNoZWNraW5nIHRoYXQsIHNvIGl0IHdpbGwgYmUgd2FzdGVkIGVmZm9ydCA6LSkpLgoKSSB3aWxs
IGRvIHRoaXMgaW4gYSBtb21lbnQuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
