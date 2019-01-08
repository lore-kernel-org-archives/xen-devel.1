From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC PATCH 2/6] tools/libxc: Define VM_EVENT type
Date: Tue, 08 Jan 2019 09:25:28 -0700
Message-ID: <5C34CEF8020000780020B645@prv1-mh.provo.novell.com>
References: <cover.1545245243.git.ppircalabu@bitdefender.com><cover.1545245243.git.ppircalabu@bitdefender.com>
 <beb32f568f2e4f3630ffd6d59f9a3b7ca0e6f3d2.1545245243.git.ppircalabu@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4mQY=PQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gguC5-000148-KX
 for xen-devel@lists.xenproject.org; Tue, 08 Jan 2019 16:25:33 +0000
In-Reply-To: <beb32f568f2e4f3630ffd6d59f9a3b7ca0e6f3d2.1545245243.git.ppircalabu@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Petre Pircalabu <ppircalabu@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjEyLjE4IGF0IDE5OjUyLCA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+IHdy
b3RlOgo+IEBAIC03OTYsNyArNzg3LDcgQEAgc3RydWN0IHhlbl9kb21jdGxfZ2Ric3hfZG9tc3Rh
dHVzIHsKPiAgICogRVhERVYgIC0gZ3Vlc3QgaGFzIFBvRCBlbmFibGVkCj4gICAqIEVCVVNZICAt
IGd1ZXN0IGhhcyBvciBoYWQgcGFnaW5nIGVuYWJsZWQsIHJpbmcgYnVmZmVyIHN0aWxsIGFjdGl2
ZQo+ICAgKi8KPiAtI2RlZmluZSBYRU5fRE9NQ1RMX1ZNX0VWRU5UX09QX1BBR0lORyAgICAgICAg
ICAgIDEKPiArI2RlZmluZSBYRU5fVk1fRVZFTlRfVFlQRV9QQUdJTkcgICAgICAgICAxCgpBc3N1
bWluZyB0aGUgcmVuYW1pbmcgaXMgZm9yIHRoZSBwdXJwb3NlIG9mIHJlLXVzZSBlbHNld2hlcmUs
CkkgdGhpbmsgdGhlc2Ugc2hvdWxkIGJlIG1vdmVkIHRvIHZtX2V2ZW50LmggdGhlbi4KCj4gKyAq
IFRoaXMgaHlwZXJjYWxsIGFsbG93cyBvbmUgdG8gY29udHJvbCB0aGUgdm1fZXZlbnQgcmluZ3Mg
KGVuYWJsZS9kaXNhYmxlKSwKPiArICogYXMgd2VsbCBhcyB0byBzaWduYWwgdG8gdGhlIGh5cGVy
dmlzb3IgdG8gcHVsbCByZXNwb25zZXMgKHJlc3VtZSkgYW5kCj4gKyAqIHJldHJpZXZlIHRoZSBl
dmVudCBjaGFubmVsIGZyb20gdGhlIGdpdmVuIHJpbmcuCj4gKyAqLwo+ICsjZGVmaW5lIFhFTl9W
TV9FVkVOVF9FTkFCTEUgICAgICAgICAgICAgICAwCj4gKyNkZWZpbmUgWEVOX1ZNX0VWRU5UX0RJ
U0FCTEUgICAgICAgICAgICAgIDEKPiArI2RlZmluZSBYRU5fVk1fRVZFTlRfUkVTVU1FICAgICAg
ICAgICAgICAgMgoKU2FtZSBwZXJoYXBzIGZvciB0aGVzZSwgYWxiZWl0IGhlcmUgeW91IGp1c3Qg
bW92ZSB0aGVtIGRvd24gYQpmZXcgbGluZXMuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
