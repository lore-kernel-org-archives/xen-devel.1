From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v1] Fix p2m_set_suppress_ve
Date: Thu, 4 Apr 2019 08:43:30 -0600
Message-ID: <CABfawh=bYPsRVGn_SvF1HoGMqUojLeCioVXbwqYAhri46wDFKA@mail.gmail.com>
References: <20190403142620.1224-1-aisaila@bitdefender.com>
 <5CA4C9F9020000780022450F@prv1-mh.provo.novell.com>
 <aa35ec83-77d2-ffc3-c82a-96c666f97227@bitdefender.com>
 <5CA4D1880200007800224564@prv1-mh.provo.novell.com>
 <0c0c0933-bf70-ac3d-57c8-68c14827bcae@bitdefender.com>
 <7f9d8083-f115-dbb3-676d-547af38eda1c@bitdefender.com>
 <CABfawhnpk8iX=o8cHePOE8DAL+8s85S41DvSXL=DQ=gkc_8ZcA@mail.gmail.com>
 <5CA6166D0200007800224A0B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=niZd=SG=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hC3b9-0006o5-G1
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2019 14:44:11 +0000
Received: by mail-wr1-f45.google.com with SMTP id s15so4088469wra.12
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2019 07:44:07 -0700 (PDT)
In-Reply-To: <5CA6166D0200007800224A0B@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Alexandru Isaila <aisaila@bitdefender.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBcHIgNCwgMjAxOSBhdCA4OjM2IEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiA+Pj4gT24gMDQuMDQuMTkgYXQgMTU6MDksIDx0YW1hc0B0a2xlbmd5
ZWwuY29tPiB3cm90ZToKPiA+IEkgYWdyZWUgdGhhdCBpdCBpcyBjb25mdXNpbmcuIEl0IHdvdWxk
IGJlIGZpbmUgdG8gVU5TSEFSRSBoZXJlIGFzIHdlbGwKPiA+IHRvIGtlZXAgdGhpbmdzIGNvbnNp
c3RlbnQgYnV0IG90aGVyd2lzZSBpdCdzIG5vdCByZWFsbHkgYW4gaXNzdWUgYXMKPiA+IHRoZSBl
bnRyeSB0eXBlIGlzIGNoZWNrZWQgbGF0ZXIgdG8gZW5zdXJlIHRoYXQgdGhpcyBpcyBhIHAybV9y
YW1fcncKPiA+IGVudHJ5LiBXZSBhcmUgc2ltcGx5IHRyeWluZyB0byBrZWVwIG1lbV9zaGFyaW5n
IGFuZCBfbW9kaWZpZWRfIGFsdHAybQo+ID4gZW50cmllcyBleGNsdXNpdmUuIFNvIGl0IGlzIGZp
bmUgdG8gaGF2ZSBtZW1fc2hhcmVkIGVudHJpZXMgaW4gdGhlCj4gPiBob3N0cDJtIGFuZCBoYXZl
IHRob3NlIGVudHJpZXMgYmUgY29waWVkIGludG8gYWx0cDJtIHRhYmxlcyBsYXppbHksCj4gPiBi
dXQgZm9yIGFsdHAybSBlbnRyaWVzIHRoYXQgaGF2ZSBjaGFuZ2VkIG1lbV9hY2Nlc3MgcGVybWlz
c2lvbnMgb3IgYXJlCj4gPiByZW1hcHBlZCB3ZSB3YW50IHRoZSBlbnRyaWVzIGluIHRoZSBob3N0
cDJtIHRvIGJlIG9mIHJlZ3VsYXIgdHlwZS4KPiA+IFRoaXMgaXMgbm90IG5lY2Vzc2FyaWx5IGEg
dGVjaG5pY2FsIHJlcXVpcmVtZW50LCBpdCdzIG1vc3RseSBqdXN0IHRvCj4gPiByZWR1Y2UgY29t
cGxleGl0eS4gU28gaXQgd291bGQgYmUgZmluZSB0byBhZGQgVU5TSEFSRSBoZXJlIGFzIHdlbGws
IEkKPiA+IGd1ZXNzIHRoZSBvbmx5IHJlYXNvbiB3aHkgSSBoYXZlbid0IGRvbmUgdGhhdCBpcyBi
ZWNhdXNlIEkgYWxyZWFkeQo+ID4gdHJpZ2dlciB0aGUgdW5zaGFyZSBhbmQgY29weS10by1hbHRw
Mm0gYmVmb3JlIHJlbWFwcGluZyBieSBzZXR0aW5nCj4gPiBkdW1teSBtZW1fYWNjZXNzIHBlcm1p
c3Npb24gb24gdGhlIGVudHJpZXMuCj4KPiBJJ20gYWZyYWlkIEkgZG9uJ3QgYWdyZWUgd2l0aCB0
aGlzIGp1c3RpZmljYXRpb246IG1lbS1zaGFyaW5nIGlzIGFib3V0Cj4gY29udGVudHMgb2YgcGFn
ZXMsCgpUaGF0J3MgaW5jb3JyZWN0LiBNZW0gc2hhcmluZyBkb2Vzbid0IGNhcmUgYWJvdXQgdGhl
IGNvbnRlbnRzIG9mIHBhZ2VzIGF0IGFsbC4KCndoZXJlYXMgYWx0cDJtIGlzIGFib3V0IG1ldGEg
ZGF0YSAocGVybWlzc2lvbnMKPiBldGMpLiBJIGRvbid0IHNlZSB3aHkgb25lIHdvdWxkIHdhbnQg
dG8gdW5zaGFyZSBiZWNhdXNlIG9mIGEgbWV0YQo+IGRhdGEgYWRqdXN0bWVudCBvdGhlciB0aGFu
IGEgcGFnZSBiZWNvbWluZyBub24tQ29XLXdyaXRhYmxlLgo+IEVhZ2VybHkgdW4tc2hhcmluZyBp
biB0aGUgZW5kIHVuZGVybWluZXMgdGhlIGludGVudGlvbnMgb2Ygc2hhcmluZy4KCldlIGFyZSB1
bnNoYXJpbmcgdG8ga2VlcCBhbHRwMm0gYW5kIG1lbV9zaGFyaW5nIGNvbXBhdGlibGUgYnV0Cm11
dHVhbGx5IGV4Y2x1c2l2ZS4gRXZlbiBpZiB0ZWNobmljYWxseSB0aGV5IGNvdWxkIGNvLWV4aXN0
LCBsYXN0IHRpbWUKSSB3b3JrZWQgb24gdGhpcyB3ZSBjYW1lIHRvIHRoaXMgYWdyZWVtZW50IG9u
IHRoZSBtYWlsaW5nbGlzdCBhcyB0bwpyZWR1Y2UgY29tcGxleGl0eSBhbmQgdG8gbWFrZSByZXZp
ZXdpbmcgZWFzaWVyLgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
