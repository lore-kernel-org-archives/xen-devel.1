From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/3] x86/mm: fix #GP(0) in switch_cr3_cr4()
Date: Tue, 5 Mar 2019 14:28:10 +0100
Message-ID: <abdd80fe-b860-f5fa-6641-4239cff1de7f@suse.com>
References: <5C7E77D1020000780021BB0B@prv1-mh.provo.novell.com>
 <5C7E78B0020000780021BB1E@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rV4c=RI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h1A7F-0006i9-6C
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 13:28:17 +0000
In-Reply-To: <5C7E78B0020000780021BB1E@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDMvMjAxOSAxNDoyNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gV2l0aCAicGNpZD1uby14
cHRpIiBhbmQgb3Bwb3NpdGUgWFBUSSBzZXR0aW5ncyBpbiB0d28gNjQtYml0IFBWIGRvbWFpbnMK
PiAoYWNoaWV2YWJsZSB3aXRoIG9uZSBvZiAieHB0aT1uby1kb20wIiBvciAieHB0aT1uby1kb211
IiksIHN3aXRjaGluZwo+IGZyb20gYSBQQ0lELWRpc2FibGVkIHRvIGEgUENJRC1lbmFibGVkIDY0
LWJpdCBQViBkb21haW4gZmFpbHMgdG8gc2V0Cj4gQ1I0LlBDSURFIGluIHRpbWUsIGFzIENSNC5Q
R0Ugd291bGQgbm90IGJlIHNldCBpbiBlaXRoZXIgKHNlZQo+IHB2X2d1ZXN0X2NyNF90b19yZWFs
X2NyNCgpLCBpbiBwYXJ0aWN1bGFyIGFzIHVzZWQgYnkgd3JpdGVfcHRiYXNlKCkpLAo+IGFuZCBo
ZW5jZSB0aGUgZWFybHkgQ1I0IHdyaXRlIHdvdWxkIGJlIHNraXBwZWQuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmVsZWFzZS1hY2tlZC1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
