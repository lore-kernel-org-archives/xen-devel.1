From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH v1] Fix p2m_set_suppress_ve
Date: Thu, 4 Apr 2019 14:54:03 +0000
Message-ID: <44BAFC90-7662-4A5C-B781-229712663926@citrix.com>
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
 <SRS0=oRVK=SG=citrix.com=prvs=990a90b7c=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hC3r4-0000EK-G4
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2019 15:00:38 +0000
In-Reply-To: <5CA6166D0200007800224A0B@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-ID: <DAFB46035384274EAE1E36347A86320E@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, Alexandru Stefan ISAILA <aisaila@bitdefender.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Cgo+IE9uIEFwciA0LCAyMDE5LCBhdCAzOjM2IFBNLCBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+IAo+Pj4+IE9uIDA0LjA0LjE5IGF0IDE1OjA5LCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4gd3JvdGU6Cj4+IEkgYWdyZWUgdGhhdCBpdCBpcyBjb25mdXNpbmcuIEl0IHdvdWxk
IGJlIGZpbmUgdG8gVU5TSEFSRSBoZXJlIGFzIHdlbGwKPj4gdG8ga2VlcCB0aGluZ3MgY29uc2lz
dGVudCBidXQgb3RoZXJ3aXNlIGl0J3Mgbm90IHJlYWxseSBhbiBpc3N1ZSBhcwo+PiB0aGUgZW50
cnkgdHlwZSBpcyBjaGVja2VkIGxhdGVyIHRvIGVuc3VyZSB0aGF0IHRoaXMgaXMgYSBwMm1fcmFt
X3J3Cj4+IGVudHJ5LiBXZSBhcmUgc2ltcGx5IHRyeWluZyB0byBrZWVwIG1lbV9zaGFyaW5nIGFu
ZCBfbW9kaWZpZWRfIGFsdHAybQo+PiBlbnRyaWVzIGV4Y2x1c2l2ZS4gU28gaXQgaXMgZmluZSB0
byBoYXZlIG1lbV9zaGFyZWQgZW50cmllcyBpbiB0aGUKPj4gaG9zdHAybSBhbmQgaGF2ZSB0aG9z
ZSBlbnRyaWVzIGJlIGNvcGllZCBpbnRvIGFsdHAybSB0YWJsZXMgbGF6aWx5LAo+PiBidXQgZm9y
IGFsdHAybSBlbnRyaWVzIHRoYXQgaGF2ZSBjaGFuZ2VkIG1lbV9hY2Nlc3MgcGVybWlzc2lvbnMg
b3IgYXJlCj4+IHJlbWFwcGVkIHdlIHdhbnQgdGhlIGVudHJpZXMgaW4gdGhlIGhvc3RwMm0gdG8g
YmUgb2YgcmVndWxhciB0eXBlLgo+PiBUaGlzIGlzIG5vdCBuZWNlc3NhcmlseSBhIHRlY2huaWNh
bCByZXF1aXJlbWVudCwgaXQncyBtb3N0bHkganVzdCB0bwo+PiByZWR1Y2UgY29tcGxleGl0eS4g
U28gaXQgd291bGQgYmUgZmluZSB0byBhZGQgVU5TSEFSRSBoZXJlIGFzIHdlbGwsIEkKPj4gZ3Vl
c3MgdGhlIG9ubHkgcmVhc29uIHdoeSBJIGhhdmVuJ3QgZG9uZSB0aGF0IGlzIGJlY2F1c2UgSSBh
bHJlYWR5Cj4+IHRyaWdnZXIgdGhlIHVuc2hhcmUgYW5kIGNvcHktdG8tYWx0cDJtIGJlZm9yZSBy
ZW1hcHBpbmcgYnkgc2V0dGluZwo+PiBkdW1teSBtZW1fYWNjZXNzIHBlcm1pc3Npb24gb24gdGhl
IGVudHJpZXMuCj4gCj4gSSdtIGFmcmFpZCBJIGRvbid0IGFncmVlIHdpdGggdGhpcyBqdXN0aWZp
Y2F0aW9uOiBtZW0tc2hhcmluZyBpcyBhYm91dAo+IGNvbnRlbnRzIG9mIHBhZ2VzLCB3aGVyZWFz
IGFsdHAybSBpcyBhYm91dCBtZXRhIGRhdGEgKHBlcm1pc3Npb25zCj4gZXRjKS4gSSBkb24ndCBz
ZWUgd2h5IG9uZSB3b3VsZCB3YW50IHRvIHVuc2hhcmUgYmVjYXVzZSBvZiBhIG1ldGEKPiBkYXRh
IGFkanVzdG1lbnQgb3RoZXIgdGhhbiBhIHBhZ2UgYmVjb21pbmcgbm9uLUNvVy13cml0YWJsZS4K
PiBFYWdlcmx5IHVuLXNoYXJpbmcgaW4gdGhlIGVuZCB1bmRlcm1pbmVzIHRoZSBpbnRlbnRpb25z
IG9mIHNoYXJpbmcuCgpSZW1lbWJlciBhbHNvIHRoYXQgYWx0cDJtcyBhbGxvdyBzb21lb25lIHRv
IHNldCBub3QganVzdCBhbHRlcm5hdGUgdmlld3Mgd2l0aCBkaWZmZXJlbnQgcGVybWlzc2lvbnMs
IGJ1dCBhbHNvIGFsdGVybmF0ZSB2aWV3cyB3aXRoIGRpZmZlcmVudCBiYWNraW5nIG1mbnMuICBD
b21iaW5pbmcgc2hhcmVkIG1mbnMgd2l0aCBhbHRlcm5hdGUgdmlld3Mgd2l0aCBkaWZmZXJlbnQg
bWZucyBvbiB0aGUgc2FtZSBnZm4gbWVhbnMgdGhhdCB5b3UgaGF2ZSB0byBiZSB2ZXJ5IGNhcmVm
dWwgbm90IHRvIGVuZCB1cCBnaXZpbmcgd3JpdGUgcGVybWlzc2lvbiB0byB0aGUgc2hhcmVkIHBh
Z2UsIHdoaWNoIHdvdWxkIGJlIGEgc2VjdXJpdHkgaXNzdWUuICBVbnNoYXJpbmcgd2hlbiBjcmVh
dGluZyBhbiBhbHRwMm0gZW50cnkgbWVhbnMgdGhhdCBhbnkgZ2l2ZW4gZ2ZuIGlzICplaXRoZXIq
IHNoYXJlZCAqb3IqIGR1cGxpY2F0ZWQgYWNyb3NzIGFsdHAybXMsIGJ1dCBub3QgYm90aDsgdGhp
cyBzaW1wbGlmaWVzIHRoZSByZWFzb25pbmcuCgogLUdlb3JnZQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
