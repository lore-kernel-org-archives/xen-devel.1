From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 5/5] amd/iommu: skip bridge devices when
 updating IOMMU page tables
Date: Thu, 15 Nov 2018 16:48:08 +0100
Message-ID: <20181115154808.s5natbctutnd7ztd@mac>
References: <20181114115740.1050-1-roger.pau@citrix.com>
 <20181114115740.1050-6-roger.pau@citrix.com>
 <5BED935B02000078001FC7A4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WGq5=N2=citrix.com=prvs=850bb4f4b=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gNJsk-0001eX-AY
 for xen-devel@lists.xenproject.org; Thu, 15 Nov 2018 15:48:38 +0000
Content-Disposition: inline
In-Reply-To: <5BED935B02000078001FC7A4@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMTUsIDIwMTggYXQgMDg6NDA6MTFBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE0LjExLjE4IGF0IDEyOjU3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gQnJpZGdlcyBhcmUgbm90IGJlaGluZCBhbiBJT01NVSwgYW5kIGFyZSBhbHJlYWR5
IHNwZWNpYWwgY2FzZWQgYW5kCj4gPiBzaWxlbnRseSBza2lwcGVkIGluIGFtZF9pb21tdV9hZGRf
ZGV2aWNlLiBBcHBseSB0aGUgc2FtZSBzcGVjaWFsCj4gPiBjYXNpbmcgd2hlbiB1cGRhdGluZyBw
YWdlIHRhYmxlcy4KPiAKPiBCdXQgYnJpZGdlcyBhbHNvIGRvbid0IGlzc3VlIEkvTyBvbiB0aGVp
ciBvd24gaWYgSSdtIG5vdCBtaXN0YWtlbi4gU28KPiB3aGF0IEknbSBtaXNzaW5nIGhlcmUgaXMg
YSB3b3JkIG9uIHRoZSBiZW5lZml0IG9mIHRoaXMgY2hhbmdlLiBJIGFsc28KPiBxdWVzdGlvbiB0
aGUgInNpbGVudGx5IiBpbiB5b3VyIHdvcmRpbmcsIHNlZWluZyB0aGUgQU1EX0lPTU1VX0RFQlVH
KCkKPiB0aGVyZS4KCkkgc2VlLCBieSBzaWxlbnRseSBJIG1lYW50IHdpdGhvdXQgdGhyb3dpbmcg
YW4gZXJyb3IsIGJ1dCBJIHRoaW5rIGp1c3QKdXNpbmcgJ3NraXBwZWQnIHdvdWxkIGJlIGNsZWFy
ZXIuCgpUaGUgYmVuZWZpdCBpcyB0aGF0IHVwZGF0ZV9wYWdpbmdfbW9kZSBkb2Vzbid0IHJldHVy
biBhbiBlcnJvciB3aGVuIGl0CmZpbmRzIGEgYnJpZGdlIGF0dGFjaGVkIHRvIERvbTAsIHdoaWNo
IHdvdWxkIGNhdXNlIHRoZSBjYWxsZXIgb2YKdXBkYXRlX3BhZ2luZ19tb2RlIChhbWRfaW9tbXVf
e3VufW1hcF9wYWdlKSB0byBjcmFzaCB0aGUgZG9tYWluLgoKSWU6IHdpdGhvdXQgdGhpcyBjaGFu
Z2UgYSBQVkggRG9tMCBydW5uaW5nIG9uIEFNRCBoYXJkd2FyZSBjcmFzaGVzCndoZW4gdGhlIElP
TU1VIHBhZ2UgdGFibGUgaXMgZXhwYW5kZWQuCgo+IFRoZSBjb2RlIGNoYW5nZSBpdHNlbGYgbG9v
a3MgZmluZSB0byBtZSwgYWxiZWl0IHBlcnNvbmFsbHkgSSdkIHByZWZlcgo+IGlmIGl0IGZ1bGx5
IG1hdGNoZWQgdGhlIG90aGVyIGNvbmRpdGlvbmFsIChpLmUuIGlmIHlvdSBmbGlwcGVkIHRoZQo+
IG9wZXJhbmRzIG9mICYmICkuIE9mIGNvdXJzZSB0aGUgc3BlY2lhbCBjYXNpbmcgb2YgdGhlIGhh
cmR3YXJlCj4gZG9tYWluIGhlcmUgaXMgc29tZXdoYXQgb2RkIGFueXdheS4KCkRvIHlvdSBtZWFu
IGJlY2F1c2UgYnJpZGdlcyB3b3VsZCBvbmx5IGJlIGV2ZXIgYXNzaWduZWQgdG8gdGhlCmhhcmR3
YXJlIGRvbWFpbj8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
