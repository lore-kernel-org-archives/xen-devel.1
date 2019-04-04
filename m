From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v1] Fix p2m_set_suppress_ve
Date: Thu, 04 Apr 2019 08:36:29 -0600
Message-ID: <5CA6166D0200007800224A0B@prv1-mh.provo.novell.com>
References: <20190403142620.1224-1-aisaila@bitdefender.com>
 <5CA4C9F9020000780022450F@prv1-mh.provo.novell.com>
 <aa35ec83-77d2-ffc3-c82a-96c666f97227@bitdefender.com>
 <5CA4D1880200007800224564@prv1-mh.provo.novell.com>
 <0c0c0933-bf70-ac3d-57c8-68c14827bcae@bitdefender.com>
 <7f9d8083-f115-dbb3-676d-547af38eda1c@bitdefender.com>
 <CABfawhnpk8iX=o8cHePOE8DAL+8s85S41DvSXL=DQ=gkc_8ZcA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/YTX=SG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hC3Tn-0005ht-5f
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2019 14:36:35 +0000
In-Reply-To: <CABfawhnpk8iX=o8cHePOE8DAL+8s85S41DvSXL=DQ=gkc_8ZcA@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, aisaila@bitdefender.com, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA0LjE5IGF0IDE1OjA5LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
SSBhZ3JlZSB0aGF0IGl0IGlzIGNvbmZ1c2luZy4gSXQgd291bGQgYmUgZmluZSB0byBVTlNIQVJF
IGhlcmUgYXMgd2VsbAo+IHRvIGtlZXAgdGhpbmdzIGNvbnNpc3RlbnQgYnV0IG90aGVyd2lzZSBp
dCdzIG5vdCByZWFsbHkgYW4gaXNzdWUgYXMKPiB0aGUgZW50cnkgdHlwZSBpcyBjaGVja2VkIGxh
dGVyIHRvIGVuc3VyZSB0aGF0IHRoaXMgaXMgYSBwMm1fcmFtX3J3Cj4gZW50cnkuIFdlIGFyZSBz
aW1wbHkgdHJ5aW5nIHRvIGtlZXAgbWVtX3NoYXJpbmcgYW5kIF9tb2RpZmllZF8gYWx0cDJtCj4g
ZW50cmllcyBleGNsdXNpdmUuIFNvIGl0IGlzIGZpbmUgdG8gaGF2ZSBtZW1fc2hhcmVkIGVudHJp
ZXMgaW4gdGhlCj4gaG9zdHAybSBhbmQgaGF2ZSB0aG9zZSBlbnRyaWVzIGJlIGNvcGllZCBpbnRv
IGFsdHAybSB0YWJsZXMgbGF6aWx5LAo+IGJ1dCBmb3IgYWx0cDJtIGVudHJpZXMgdGhhdCBoYXZl
IGNoYW5nZWQgbWVtX2FjY2VzcyBwZXJtaXNzaW9ucyBvciBhcmUKPiByZW1hcHBlZCB3ZSB3YW50
IHRoZSBlbnRyaWVzIGluIHRoZSBob3N0cDJtIHRvIGJlIG9mIHJlZ3VsYXIgdHlwZS4KPiBUaGlz
IGlzIG5vdCBuZWNlc3NhcmlseSBhIHRlY2huaWNhbCByZXF1aXJlbWVudCwgaXQncyBtb3N0bHkg
anVzdCB0bwo+IHJlZHVjZSBjb21wbGV4aXR5LiBTbyBpdCB3b3VsZCBiZSBmaW5lIHRvIGFkZCBV
TlNIQVJFIGhlcmUgYXMgd2VsbCwgSQo+IGd1ZXNzIHRoZSBvbmx5IHJlYXNvbiB3aHkgSSBoYXZl
bid0IGRvbmUgdGhhdCBpcyBiZWNhdXNlIEkgYWxyZWFkeQo+IHRyaWdnZXIgdGhlIHVuc2hhcmUg
YW5kIGNvcHktdG8tYWx0cDJtIGJlZm9yZSByZW1hcHBpbmcgYnkgc2V0dGluZwo+IGR1bW15IG1l
bV9hY2Nlc3MgcGVybWlzc2lvbiBvbiB0aGUgZW50cmllcy4KCkknbSBhZnJhaWQgSSBkb24ndCBh
Z3JlZSB3aXRoIHRoaXMganVzdGlmaWNhdGlvbjogbWVtLXNoYXJpbmcgaXMgYWJvdXQKY29udGVu
dHMgb2YgcGFnZXMsIHdoZXJlYXMgYWx0cDJtIGlzIGFib3V0IG1ldGEgZGF0YSAocGVybWlzc2lv
bnMKZXRjKS4gSSBkb24ndCBzZWUgd2h5IG9uZSB3b3VsZCB3YW50IHRvIHVuc2hhcmUgYmVjYXVz
ZSBvZiBhIG1ldGEKZGF0YSBhZGp1c3RtZW50IG90aGVyIHRoYW4gYSBwYWdlIGJlY29taW5nIG5v
bi1Db1ctd3JpdGFibGUuCkVhZ2VybHkgdW4tc2hhcmluZyBpbiB0aGUgZW5kIHVuZGVybWluZXMg
dGhlIGludGVudGlvbnMgb2Ygc2hhcmluZy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
