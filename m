From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v3 10/15] argo: implement the notify op
Date: Tue, 15 Jan 2019 00:32:37 -0800
Message-ID: <CACMJ4GYKume9QUx9EC8ARovQza0XQej+LAOgv7Dy1EKKEVKvWw@mail.gmail.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-11-git-send-email-christopher.w.clark@gmail.com>
 <CAPLaKK4qaUb7nky6AueJbA1LJfm9fHtw0G_9d0i44Ja2UvOPrA@mail.gmail.com>
 <CACMJ4Gbq4-hE1+eEd3XxQorG_cw57Atz6GcNE+10erZ1osF=uw@mail.gmail.com>
 <20190115080616.o6o22qvcrdpwddpf@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rejp=PX=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gjK9U-0007Gp-0c
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 08:32:52 +0000
Received: by mail-lj1-x241.google.com with SMTP id k19-v6so1530707lji.11
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jan 2019 00:32:50 -0800 (PST)
In-Reply-To: <20190115080616.o6o22qvcrdpwddpf@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMTUsIDIwMTkgYXQgMTI6MDYgQU0gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBKYW4gMTQsIDIwMTkgYXQgMTA6NTM6
NTRQTSAtMDgwMCwgQ2hyaXN0b3BoZXIgQ2xhcmsgd3JvdGU6Cj4gPiBPbiBUaHUsIEphbiAxMCwg
MjAxOSBhdCA0OjIyIEFNIFJvZ2VyIFBhdSBNb25uw6kgPHJveWdlckBmcmVlYnNkLm9yZz4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+ICBPbiBNb24sIEphbiA3LCAyMDE5IGF0IDg6NDQgQU0gQ2hyaXN0b3Bo
ZXIgQ2xhcmsKPiA+ID4gPGNocmlzdG9waGVyLncuY2xhcmtAZ21haWwuY29tPiB3cm90ZToKPiA+
ID4gPiArCj4gPiA+ID4gKyAgICBhcmdvX2RwcmludGsoImZpbGxfcmluZ19kYXRhOiBlbnQucmlu
Zy5kb21haW49JXUsZW50LnJpbmcucG9ydD0leFxuIiwKPiA+ID4gPiArICAgICAgICAgICAgICAg
ICBlbnQucmluZy5kb21haW5faWQsIGVudC5yaW5nLnBvcnQpOwo+ID4gPiA+ICsKPiA+ID4gPiAr
ICAgIGVudC5mbGFncyA9IDA7Cj4gPiA+Cj4gPiA+IFBsZWFzZSBtZW1zZXQgZW50IHRvIDAgb3Ig
aW5pdGlhbGl6ZSBpdCB0byB7IH0sIG9yIGVsc2UgeW91IGFyZQo+ID4gPiBsZWFraW5nIGh5cGVy
dmlzb3Igc3RhY2sgZGF0YSB0byB0aGUgZ3Vlc3QgaW4gdGhlIHBhZGRpbmcgZmllbGQuCj4gPgo+
ID4gb2sgLSBJJ3ZlIGFkZGVkIHRoZSBpbml0aWFsaXplciwgdGhhbmtzLgo+ID4gV2FzIGl0IHJl
YWxseSBsZWFraW5nIHN0YWNrIGRhdGEgdGhvdWdoIGJlY2F1c2UgdGhlIHN0cnVjdCBzaG91bGQg
aGF2ZQo+ID4gYmVlbiBmdWxseSBwb3B1bGF0ZWQsIGluY2x1ZGluZyB0aGUgcGFkZGluZyBmaWVs
ZCwgd2l0aCB0aGUKPiA+IF9fY29weV9mcm9tX2d1ZXN0IGFib3ZlPwo+Cj4gVGhhdCdzIG15IGJh
ZCwgdGhlcmUgd2FzIG5vIGxlYWsgaGVyZS4gSSBzb21laG93IG1pc3NlZCB0aGUKPiBjb3B5X2Zy
b21fZ3Vlc3QgYWJvdmUsIGV2ZW4gd2hlbiBJIG1hZGUgYSBjb21tZW50IG9uIGl0LiBQbGVhc2Ug
bGVhdmUKPiB0aGUgY29kZSBhcy1pcy4KCm9rIC0gdGhhbmtzIGZvciB0aGUgcXVpY2sgcmVzcG9u
c2UuIEkndmUgdGFrZW4gdGhlIGluaXRpYWxpemVyIGJhY2sgb3V0LgoKQ2hyaXN0b3BoZXIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
