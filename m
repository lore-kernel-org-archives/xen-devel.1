From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/3] x86/mm: fix #GP(0) in switch_cr3_cr4()
Date: Tue, 5 Mar 2019 13:58:40 +0000
Message-ID: <c68d32f2-625a-7ec2-212e-115acd512006@citrix.com>
References: <5C7E77D1020000780021BB0B@prv1-mh.provo.novell.com>
 <5C7E78B0020000780021BB1E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rxLf=RI=citrix.com=prvs=96038945f=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h1Aao-0001lO-OI
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 13:58:50 +0000
In-Reply-To: <5C7E78B0020000780021BB1E@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDMvMjAxOSAxMzoyNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gV2l0aCAicGNpZD1uby14
cHRpIiBhbmQgb3Bwb3NpdGUgWFBUSSBzZXR0aW5ncyBpbiB0d28gNjQtYml0IFBWIGRvbWFpbnMK
PiAoYWNoaWV2YWJsZSB3aXRoIG9uZSBvZiAieHB0aT1uby1kb20wIiBvciAieHB0aT1uby1kb211
IiksIHN3aXRjaGluZwo+IGZyb20gYSBQQ0lELWRpc2FibGVkIHRvIGEgUENJRC1lbmFibGVkIDY0
LWJpdCBQViBkb21haW4gZmFpbHMgdG8gc2V0Cj4gQ1I0LlBDSURFIGluIHRpbWUsIGFzIENSNC5Q
R0Ugd291bGQgbm90IGJlIHNldCBpbiBlaXRoZXIgKHNlZQo+IHB2X2d1ZXN0X2NyNF90b19yZWFs
X2NyNCgpLCBpbiBwYXJ0aWN1bGFyIGFzIHVzZWQgYnkgd3JpdGVfcHRiYXNlKCkpLAoKVGhpcyBp
cyBzdGFsZSB3aXRoIFhTQS0yOTMgaW4gcGxhY2UsIGFuZCBpcyBub3cgcHZfZml4dXBfZ3Vlc3Rf
Y3I0KCkKCj4gYW5kIGhlbmNlIHRoZSBlYXJseSBDUjQgd3JpdGUgd291bGQgYmUgc2tpcHBlZC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmll
d2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKQWxzbyAr
MSBmb3IgZml4aW5nIGluIDQuMTIKCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
