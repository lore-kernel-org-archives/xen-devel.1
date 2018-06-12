From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH for-4.11] scripts/add_maintainers.pl: Don't
 call get_maintainers.pl with -f
Date: Tue, 12 Jun 2018 12:28:41 +0100
Message-ID: <5c8211fa-091e-767c-e75c-0e9777678b8c@arm.com>
References: <20180605163938.28090-1-julien.grall@arm.com>
 <cc7b7fa2-1504-f801-60fc-c3470091fc93@suse.com>
 <83574C48-EFC2-42AE-901B-488F2E52D8F4@citrix.com>
 <f0908d19-4813-2f4d-5b01-9d9b30672e27@arm.com>
 <b364326e-31c2-0635-ea70-b42d68f5d140@arm.com>
 <5B1FAC0702000078001CA5B1@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bxlg=i6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fShTi-00080u-Rf
 for xen-devel@lists.xenproject.org; Tue, 12 Jun 2018 11:28:46 +0000
In-Reply-To: <5B1FAC0702000078001CA5B1@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMi8wNi8xOCAxMjoxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTIuMDYuMTgg
YXQgMTI6NDQsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IE9uIDA2LzA2LzE4IDEx
OjA2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBPbiAwNS8wNi8xOCAxOToyNiwgTGFycyBLdXJ0
aCB3cm90ZToKPj4+PiBUaGlzIGNoYW5nZSBpbiBiZWhhdmlvdXIgd2FzIG1pc3Rha2VubHkgaW50
cm9kdWNlZCBpbiBvbmUgb2YgdGhlIGxhdGVyCj4+Pj4gcmV2aXNpb25zIChjYW4ndCByZWNhbGwg
d2hpY2gpLCB3aGVuIHdlIHJlZmFjdG9yZWQgdGhlIGNhbGwgdG8KPj4+PiBnZXRfbWFpbnRhaW5l
cnMucGwKPj4+Cj4+PiBUaGFuayB5b3UhIE90aGVyIHRoYW4gdGhhdCB0aGUgc2NyaXB0IGlzIHdv
cmtpbmcgcXVpdGUgd2VsbCBhbmQgc2F2ZSBtZQo+Pj4gdGltZSB0byBhZGQgYWxsIHRoZSBDQ3Mu
Cj4+Pgo+Pj4gSSB3aWxsIGNvbW1pdCB0aGUgcGF0Y2ggb25jZSB3ZSBicmFuY2hlZC4KPj4KPj4g
SSB3YXMgYWJvdXQgdG8gY29tbWl0IGJ1dCBJIGZvcmdvdCB0aGF0IEkgd291bGQgbmVlZCBhIGFj
ayBmcm9tIHNvbWVvbmUKPj4gaW4gIlRIRSBSRVNUIi4KPiAKPiBJJ20gYSBsaXR0bGUgY29uZnVz
ZWQsIGNvbnNpZGVyaW5nIHRoZSAib25jZSB3ZSBicmFuY2hlZCIgc3RpbGwgaW4gY29udGV4dCBo
ZXJlLgoKVG8gZ2l2ZSB0aGUgZnVsbCBzdG9yeSwgdGhlIGUtbWFpbCB3YXMgd3JpdHRlbiB3aGVu
IHN0YWdpbmcgaGFkIGEgY29tbWl0IAptb3JhdG9yaXVtIGZvciBicmFuY2hpbmcuIEhvd2V2ZXIs
IHdlIGRpZG4ndCBicmFuY2ggYW5kIHRoZSBjb21taXQgCm1vcmF0b3JpdW0gd2FzIGxpZnRlZC4g
QmVjYXVzZSB0aGUgcGF0Y2ggaXMgdGFyZ2V0aW5nIFhlbiA0LjExLCB0aGVuIGl0IAppcyBmaW5l
IHRvIGNvbW1pdCBub3cuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
