From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Subject: Re: [RFC PATCH 6/6] xc_version: add vm_event interface
 version
Date: Tue, 12 Feb 2019 11:13:10 -0700
Message-ID: <CABfawhn=Yjbd_r_NZRdkKX9SGQHbKYHuW8GmkLgrPehp5WA5HA@mail.gmail.com>
References: <cover.1545245243.git.ppircalabu@bitdefender.com>
 <b1269ed5b2454c8fd3c373bc92201efe13fc8194.1545245243.git.ppircalabu@bitdefender.com>
 <5C34CF81020000780020B648@prv1-mh.provo.novell.com>
 <7bb4f60e-55d2-925e-20ae-0fe25e254199@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AA3e=QT=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1gtcZ4-0000wc-CH
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 18:13:50 +0000
Received: by mail-wm1-x341.google.com with SMTP id d15so4082335wmb.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Feb 2019 10:13:49 -0800 (PST)
In-Reply-To: <7bb4f60e-55d2-925e-20ae-0fe25e254199@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gOCwgMjAxOSBhdCA5OjM5IEFNIFJhenZhbiBDb2pvY2FydQo8cmNvam9jYXJ1
QGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4KPiBPbiAxLzgvMTkgNjoyNyBQTSwgSmFuIEJldWxp
Y2ggd3JvdGU6Cj4gPj4+PiBPbiAxOS4xMi4xOCBhdCAxOTo1MiwgPHBwaXJjYWxhYnVAYml0ZGVm
ZW5kZXIuY29tPiB3cm90ZToKPiA+PiBTaWduZWQtb2ZmLWJ5OiBQZXRyZSBQaXJjYWxhYnUgPHBw
aXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPgo+ID4KPiA+IEFuIGVtcHR5IGRlc2NyaXB0aW9uIGlz
IG5vdCBoZWxwZnVsLiBUaGUgaW1tZWRpYXRlIHF1ZXN0aW9uIGlzOiBXaHk/Cj4gPiBXZSBkb24n
dCBkbyB0aGlzIGZvciBvdGhlciBpbnRlcmZhY2UgdmVyc2lvbnMuIEknbSB1bmNvbnZpbmNlZCBh
Cj4gPiBzcGVjaWFsIHB1cnBvc2UgcGllY2Ugb2YgaW5mb3JtYXRpb24gbGlrZSB0aGlzIG9uZSBi
ZWxvbmdzIGludG8gdGhlCj4gPiByYXRoZXIgZ2VuZXJpYyB2ZXJzaW9uIGh5cGVyY2FsbC4KPgo+
IEZvciBhbiBpbnRyb3NwZWN0aW9uIGFwcGxpY2F0aW9uIG1lYW50IHRvIGJlIGRlcGxveWVkIG9u
IHNldmVyYWwgWGVuCj4gdmVyc2lvbnMgd2l0aG91dCByZWNvbXBpbGluZywgaXQgaXMgaW1wb3J0
YW50IHRvIGJlIGFibGUgdG8gZGVjaWRlIGF0Cj4gcnVudGltZSB3aGF0IHNpemUgYW5kIGxheW91
dCB0aGUgdm1fZXZlbnQgc3RydWN0IGhhcy4KPgo+IEN1cnJlbnRseSB0aGlzIGNhbiBzb21ld2hh
dCBiZSBkb25lIGJ5IGFzc29jaWF0aW5nIHRoZSBjdXJyZW50IHZlcnNpb24KPiB3aXRoIHRoZSB2
bV9ldmVudCB2ZXJzaW9uLCBidXQgdGhhdCBpcyBub3QgaWRlYWwgZm9yIG9idmlvdXMgcmVhc29u
cy4KCldlIGRvIGV4YWN0bHkgdGhhdCBpbiBMaWJWTUkgYW5kIGl0IHdvcmtzIGZpbmUgLSBjYXJl
IHRvIGVsYWJvcmF0ZQp3aGF0IHByb2JsZW0geW91IGhhdmUgd2l0aCBkb2luZyB0aGF0PyBUaGVy
ZSBpcyBhIDE6MSBtYXRjaCBiZXR3ZWVuCmFueSBzdGFibGUgWGVuIHZlcnNpb24gYW5kIGEgdm1f
ZXZlbnQgaW50ZXJmYWNlIHZlcnNpb24uIEkgZG9uJ3QgdGhpbmsKd2Ugd2lsbCBldmVyIGhhdmUg
YSBzaXR1YXRpb24gd2hlcmUgd2UgYnVtcCB0aGUgdm1fZXZlbnQgaW50ZXJmYWNlCnZlcnNpb24g
YnV0IG5vdCB0aGUgWGVuIHJlbGVhc2UgdmVyc2lvbi4KClRhbWFzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
