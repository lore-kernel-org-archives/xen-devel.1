From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 0/6] Fix XSA-155-like bugs in frontend
 drivers
Date: Tue, 1 May 2018 11:12:02 +0100
Message-ID: <20180501101202.ti7a5j72kliqitzi@citrix.com>
References: <cover.7ee732ab822b728ec486a3118ec12e9c06f0f325.1525122026.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bnqk=hu=citrix.com=prvs=6529cf07e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fDSGU-0002pk-5K
 for xen-devel@lists.xenproject.org; Tue, 01 May 2018 10:12:06 +0000
Content-Disposition: inline
In-Reply-To: <cover.7ee732ab822b728ec486a3118ec12e9c06f0f325.1525122026.git-series.marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

KERyb3AgTGludXggbGlzdHMgYW5kIHBlb3BsZSkKCk9uIE1vbiwgQXByIDMwLCAyMDE4IGF0IDEx
OjAxOjQ0UE0gKzAyMDAsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToKPiBQYXRj
aGVzIGluIG9yaWdpbmFsIFhlbiBTZWN1cml0eSBBZHZpc29yeSAxNTUgY2FyZWQgb25seSBhYm91
dCBiYWNrZW5kIGRyaXZlcnMKPiB3aGlsZSBsZWF2aW5nIGZyb250ZW5kIHBhdGNoZXMgdG8gYmUg
ImRldmVsb3BlZCBhbmQgcmVsZWFzZWQgKHB1YmxpY2x5KSBhZnRlcgo+IHRoZSBlbWJhcmdvIGRh
dGUiLiBUaGlzIGlzIHNhaWQgc2VyaWVzLgo+IAo+IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNr
aSAoNik6Cj4gICB4ZW46IEFkZCBSSU5HX0NPUFlfUkVTUE9OU0UoKQo+ICAgeGVuLW5ldGZyb250
OiBjb3B5IHJlc3BvbnNlIG91dCBvZiBzaGFyZWQgYnVmZmVyIGJlZm9yZSBhY2Nlc3NpbmcgaXQK
PiAgIHhlbi1uZXRmcm9udDogZG8gbm90IHVzZSBkYXRhIGFscmVhZHkgZXhwb3NlZCB0byBiYWNr
ZW5kCj4gICB4ZW4tbmV0ZnJvbnQ6IGFkZCByYW5nZSBjaGVjayBmb3IgVHggcmVzcG9uc2UgaWQK
PiAgIHhlbi1ibGtmcm9udDogbWFrZSBsb2NhbCBjb3B5IG9mIHJlc3BvbnNlIGJlZm9yZSB1c2lu
ZyBpdAo+ICAgeGVuLWJsa2Zyb250OiBwcmVwYXJlIHJlcXVlc3QgbG9jYWxseSwgb25seSB0aGVu
IHB1dCBpdCBvbiB0aGUgc2hhcmVkIHJpbmcKPiAKPiAgZHJpdmVycy9ibG9jay94ZW4tYmxrZnJv
bnQuYyAgICB8IDExMCArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVy
cy9uZXQveGVuLW5ldGZyb250LmMgICAgICB8ICA2MSArKysrKysrKystLS0tLS0tLS0KPiAgaW5j
bHVkZS94ZW4vaW50ZXJmYWNlL2lvL3JpbmcuaCB8ICAxNCArKysrLQo+ICAzIGZpbGVzIGNoYW5n
ZWQsIDEwNiBpbnNlcnRpb25zKCspLCA3OSBkZWxldGlvbnMoLSkKPiAKPiBiYXNlLWNvbW1pdDog
NmQwOGIwNmU2N2NkMTE3ZjY5OTJjNDY2MTFkZmI0Y2UyNjdjZDcxZQoKSWYgeW91J3JlIHJlYWxs
eSBwYXJhbm9pZCB5b3UgcHJvYmFibHkgYWxzbyB3YW50IHRvIGNvbnNpZGVyCmltcGxlbWVudGlu
ZyBtb3JlIGNoZWNrcyBmb3IgZnJvbnRlbmQuCgpTZWUgaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcv
eHNhL2Fkdmlzb3J5LTM5Lmh0bWwgZm9yIGEgcGxldGhvcmEgb2YKcG90ZW50aWFsIGlzc3Vlcy4K
CldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
