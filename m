From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Subject: Re: [RFC PATCH 6/6] xc_version: add vm_event interface
 version
Date: Tue, 12 Feb 2019 11:25:42 -0700
Message-ID: <CABfawhk8yXjV+gLvB7Qp5yZ_L14TwQiXgcVnsdQLQHETCZA5Zw@mail.gmail.com>
References: <cover.1545245243.git.ppircalabu@bitdefender.com>
 <b1269ed5b2454c8fd3c373bc92201efe13fc8194.1545245243.git.ppircalabu@bitdefender.com>
 <5C34CF81020000780020B648@prv1-mh.provo.novell.com>
 <7bb4f60e-55d2-925e-20ae-0fe25e254199@bitdefender.com>
 <CABfawhn=Yjbd_r_NZRdkKX9SGQHbKYHuW8GmkLgrPehp5WA5HA@mail.gmail.com>
 <213b69fe-380f-e354-b828-4864555e145f@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AA3e=QT=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1gtclB-0002Fn-Vh
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 18:26:22 +0000
Received: by mail-wm1-x341.google.com with SMTP id y185so32516wmd.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Feb 2019 10:26:20 -0800 (PST)
In-Reply-To: <213b69fe-380f-e354-b828-4864555e145f@bitdefender.com>
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

T24gVHVlLCBGZWIgMTIsIDIwMTkgYXQgMTE6MjAgQU0gUmF6dmFuIENvam9jYXJ1CjxyY29qb2Nh
cnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPgo+IE9uIDIvMTIvMTkgODoxMyBQTSwgVGFtYXMg
SyBMZW5neWVsIHdyb3RlOgo+ID4gT24gVHVlLCBKYW4gOCwgMjAxOSBhdCA5OjM5IEFNIFJhenZh
biBDb2pvY2FydQo+ID4gPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+ID4+Cj4g
Pj4gT24gMS84LzE5IDY6MjcgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+Pj4+PiBPbiAxOS4x
Mi4xOCBhdCAxOTo1MiwgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPiA+Pj4+
IFNpZ25lZC1vZmYtYnk6IFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5j
b20+Cj4gPj4+Cj4gPj4+IEFuIGVtcHR5IGRlc2NyaXB0aW9uIGlzIG5vdCBoZWxwZnVsLiBUaGUg
aW1tZWRpYXRlIHF1ZXN0aW9uIGlzOiBXaHk/Cj4gPj4+IFdlIGRvbid0IGRvIHRoaXMgZm9yIG90
aGVyIGludGVyZmFjZSB2ZXJzaW9ucy4gSSdtIHVuY29udmluY2VkIGEKPiA+Pj4gc3BlY2lhbCBw
dXJwb3NlIHBpZWNlIG9mIGluZm9ybWF0aW9uIGxpa2UgdGhpcyBvbmUgYmVsb25ncyBpbnRvIHRo
ZQo+ID4+PiByYXRoZXIgZ2VuZXJpYyB2ZXJzaW9uIGh5cGVyY2FsbC4KPiA+Pgo+ID4+IEZvciBh
biBpbnRyb3NwZWN0aW9uIGFwcGxpY2F0aW9uIG1lYW50IHRvIGJlIGRlcGxveWVkIG9uIHNldmVy
YWwgWGVuCj4gPj4gdmVyc2lvbnMgd2l0aG91dCByZWNvbXBpbGluZywgaXQgaXMgaW1wb3J0YW50
IHRvIGJlIGFibGUgdG8gZGVjaWRlIGF0Cj4gPj4gcnVudGltZSB3aGF0IHNpemUgYW5kIGxheW91
dCB0aGUgdm1fZXZlbnQgc3RydWN0IGhhcy4KPiA+Pgo+ID4+IEN1cnJlbnRseSB0aGlzIGNhbiBz
b21ld2hhdCBiZSBkb25lIGJ5IGFzc29jaWF0aW5nIHRoZSBjdXJyZW50IHZlcnNpb24KPiA+PiB3
aXRoIHRoZSB2bV9ldmVudCB2ZXJzaW9uLCBidXQgdGhhdCBpcyBub3QgaWRlYWwgZm9yIG9idmlv
dXMgcmVhc29ucy4KPiA+Cj4gPiBXZSBkbyBleGFjdGx5IHRoYXQgaW4gTGliVk1JIGFuZCBpdCB3
b3JrcyBmaW5lIC0gY2FyZSB0byBlbGFib3JhdGUKPiA+IHdoYXQgcHJvYmxlbSB5b3UgaGF2ZSB3
aXRoIGRvaW5nIHRoYXQ/IFRoZXJlIGlzIGEgMToxIG1hdGNoIGJldHdlZW4KPiA+IGFueSBzdGFi
bGUgWGVuIHZlcnNpb24gYW5kIGEgdm1fZXZlbnQgaW50ZXJmYWNlIHZlcnNpb24uIEkgZG9uJ3Qg
dGhpbmsKPiA+IHdlIHdpbGwgZXZlciBoYXZlIGEgc2l0dWF0aW9uIHdoZXJlIHdlIGJ1bXAgdGhl
IHZtX2V2ZW50IGludGVyZmFjZQo+ID4gdmVyc2lvbiBidXQgbm90IHRoZSBYZW4gcmVsZWFzZSB2
ZXJzaW9uLgo+Cj4gWGVuU2VydmVyLiBBbnkgZ2l2ZW4gdmVyc2lvbiBvZiBYZW5TZXJ2ZXIgbWF5
IG9yIG1heSBub3QgZml0IHRoZSBtYXRyaXgKPiB5b3UncmUgdGFsa2luZyBhYm91dCAoYmVjYXVz
ZSBzb21lIHBhdGNoZXMgYXJlIGJhY2twb3J0ZWQsIHNvbWUgYXJlIG5vdCwKPiBldGMuKS4gSW4g
d2hpY2ggY2FzZSBpdCBhbGwgYmVjb21lcyB2ZXJ5IGNvbXBsaWNhdGVkLgoKQWggeWVzLCBpZiBj
dXN0b20gcGF0Y2hlcyBhcmUgYXBwbGllZCBvbiB0b3AgSSBjYW4gc2VlIGhvdyB0aGF0IGNvdWxk
CmJlY29tZSBhIHByb2JsZW0uCgpUaGFua3MsClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
