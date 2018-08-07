From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v5 02/15] iommu: introduce the concept of
 BFN...
Date: Tue, 7 Aug 2018 08:26:51 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D1912AE938@SHSMSX101.ccr.corp.intel.com>
References: <20180803172220.1657-1-paul.durrant@citrix.com>
 <20180803172220.1657-3-paul.durrant@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D1912AC042@SHSMSX101.ccr.corp.intel.com>
 <b34ed3dd8dd941a99b00416943dde3a8@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tozp=kw=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1fmxKT-00028r-W8
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 08:26:58 +0000
In-Reply-To: <b34ed3dd8dd941a99b00416943dde3a8@AMSPEX02CL03.citrite.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBQYXVsIER1cnJhbnQgW21haWx0bzpQYXVsLkR1cnJhbnRAY2l0cml4LmNvbV0KPiBT
ZW50OiBUdWVzZGF5LCBBdWd1c3QgNywgMjAxOCA0OjAwIFBNCj4gCj4gPiA+ICAgKgo+ID4gPiAg
ICogZ2ZuOiBHdWVzdCBGcmFtZSBOdW1iZXIKPiA+ID4gICAqICAgVGhlIHZhbHVlcyBhIGd1ZXN0
IHB1dHMgaW4gaXRzIG93biBwYWdldGFibGVzLiAgRm9yIGFuIGF1dG8tCj4gdHJhbnNsYXRlZAo+
ID4gPiBAQCAtMjYsNiArMjcsMTEgQEAKPiA+ID4gICAqICAgQSBsaW5lYXIgaWRlYSBvZiBhIGd1
ZXN0IHBoeXNpY2FsIGFkZHJlc3Mgc3BhY2UuIEZvciBhbiBhdXRvLQo+IHRyYW5zbGF0ZWQKPiA+
ID4gICAqICAgZ3Vlc3QsIHBmbiA9PSBnZm4gd2hpbGUgZm9yIGEgbm9uLXRyYW5zbGF0ZWQgZ3Vl
c3QsIHBmbiAhPSBnZm4uCj4gPiA+ICAgKgo+ID4gPiArICogYmZuOiBCdXMgRnJhbWUgTnVtYmVy
IChkZWZpbml0aW9ucyBpbiBpbmNsdWRlL3hlbi9pb21tdS5oKQo+ID4gPiArICogICBUaGUgbGlu
ZWFyIGZyYW1lIG51bWJlcnMgb2YgSU9NTVUgYWRkcmVzcyBzcGFjZS4gQWxsIGluaXRpYXRvcnMK
PiBmb3IgYQo+ID4gPiArICogICBnaXZlbiBkb21haW4gc2hhcmUgYSBzaW5nbGUgSU9NTVUgYWRk
cmVzcyBzcGFjZSBhbmQsIGJ5IGRlZmF1bHQsCj4gPiA+IFhlbiB3aWxsCj4gPiA+ICsgKiAgIGVu
c3VyZSBiZm4gPT0gcGZuLgo+ID4gPiArICoKPiA+Cj4gPiBBYm92ZSBkZXNjcmlwdGlvbiBpcyBh
IGJpdCBjb25mdXNpbmc6Cj4gPgo+ID4gLSBmb3IgJ2RvbWFpbicsIGFyZSB5b3UgdGFsa2luZyBh
Ym91dCBWTSBvciBJT01NVSBkb21haW4/IElmIHRoZQo+IGZvcm1lcgo+ID4gdGhlbiBlYWNoIGlu
aXRpYXRvciBjb3VsZCBoYXZlIGl0cyBvd24gSU9NTVUgYWRkcmVzcyBzcGFjZSB3aGVuIGEKPiB2
aXJ0dWFsCj4gPiBJT01NVSAoZWl0aGVyIHB2SU9NTVUgb3IgZW11bGF0ZWQgSU9NTVUpIGlzIGV4
cG9zZWQuCj4gPgo+IAo+IEkgbWVhbiBWTSBhbmQsIHllcywgd2hpbGUgZWFjaCBpbml0aWF0b3Ig
KmNvdWxkKiBoYXZlIGl0cyBvd24gSU9NTVUKPiBhZGRyZXNzIHNwYWNlLCB0aGF0IGlzIG5vdCB3
aGF0IHdlIGRvIGluIChvciBoYXZlIGV2ZXIgZG9uZSkgaW4gWGVuLiBJIGNhbgo+IHJlcGxhY2Ug
dGhlIHdvcmQgJ2RvbWFpbicgd2l0aCB0aGUgYWJicmV2aWF0aW9uICdWTScgaWYgeW91IGZlZWwg
aXQgbWFrZXMKPiB0aGluZ3MgY2xlYXJlci4KPiAKCmRvbWFpbiBpcyBPSyBoZXJlLiBqdXN0IHdh
bnQgdG8gY29uZmlybS4KCj4gPiAtIHNpbmNlIHlvdSB0YWxrIGFib3V0ICdieSBkZWZhdWx0Jywg
YmV0dGVyIGFsc28gdGFsayBhYm91dCBub24tZGVmYXVsdCBjYXNlLAo+ID4gaS5lLiB3aGVuIHZp
cnR1YWwgSU9NTVUgaXMgZXhwb3NlZCB0aGVuIGJmbiBpcyBhIHNlcGFyYXRlIGFkZHJlc3Mgc3Bh
Y2UKPiA+IG1hbmFnZWQgYnkgZ3Vlc3QKPiAKPiBUaGF0J3MgcHV0dGluZyB0aGUgY2FydCBiZWZv
cmUgdGhlIGhvcnNlIHJlYWxseS4gVGhlcmUgaXMgbm8gUFYtSU9NTVUgYXQKPiB0aGlzIHN0YWdl
IGluIHRoZSBzZXJpZXMuIEkgZ3Vlc3MgSSBjb3VsZCBtb2RpZnkgdGhlIGNvbW1lbnQgaW4gdGhl
IGxhdGVyCj4gcGF0Y2ggd2hlcmUgSSBhZGQgdGhlIGh5cGVyY2FsbCB0byBlbmFibGUgUFYtSU9N
TVUuCj4gCgppdCdzIGZpbmUgYXMgbG9uZyBhcyBmaW5hbGx5IHRoZSBpbmZvcm1hdGlvbiBpcyBj
b21wbGV0ZS4gCgpUaGFua3MKS2V2aW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
