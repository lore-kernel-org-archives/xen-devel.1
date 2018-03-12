From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 3/7] RFC arm/domain: Reject invalid
 combinations of domain creation flags
Date: Mon, 12 Mar 2018 16:32:35 +0000
Message-ID: <20180312163235.scpnygcfvvphcc5n@citrix.com>
References: <1520601522-2886-1-git-send-email-andrew.cooper3@citrix.com>
 <1520601522-2886-4-git-send-email-andrew.cooper3@citrix.com>
 <8b868679-4e3d-6fa7-5b8c-16dd6a223acc@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <8b868679-4e3d-6fa7-5b8c-16dd6a223acc@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBNYXIgMTEsIDIwMTggYXQgMDc6NTk6MTZQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIEFuZHJldywKPiAKPiBPbiAwMy8wOS8yMDE4IDAxOjE4IFBNLCBBbmRyZXcgQ29v
cGVyIHdyb3RlOgo+ID4gQVJNIGd1ZXN0cyBhcmUgSFZNIGFuZCBoYXZlIGhhcmR3YXJlIGFzc2lz
dGVkIHBhZ2luZy4gIFRoZXJlIGFyZSBubyBQViBndWVzdHMKPiA+IG9yIHNoYWRvdyBwYWdpbmcs
IGFuZCBhbGwgb3RoZXIgY3JlYXRpb24gZmxhZ3MgYXJlIHg4NiBzcGVjaWZpYy4KPiA+IAo+ID4g
U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
PiA+IC0tLQo+ID4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4KPiA+IENDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+ID4gQ0M6IElh
biBKYWNrc29uIDxJYW4uSmFja3NvbkBldS5jaXRyaXguY29tPgo+ID4gQ0M6IFdlaSBMaXUgPHdl
aS5saXUyQGNpdHJpeC5jb20+Cj4gPiAKPiA+IFJGQy4gIFRoaXMgaXMgdW50ZXN0ZWQsIGJ1dCBJ
IG5vdGljZWQgaXQgd2hlbiBwdXR0aW5nIHRvZ2V0aGVyIHRoZSBwcmVjZWVkaW5nCj4gPiBwYXRj
aC4gIFRoZXJlIGlzIGEgbW9kZXJhdGUgY2hhbmNlIHRoYXQgdGhpcyB3aWxsIGNhdXNlIHRoaW5n
cyB0byBleHBsb2RlCj4gPiBiZWNhdXNlIG9mIGhvdyBsaWJ4bCBoYW5kbGVzIEFSTSBndWVzdCBj
b25zdHJ1Y3Rpb24sIGJ1dCBzb21ldGhpbmcgYWxvbmcgdGhlc2UKPiA+IGxpbmVzIGlzIHRoZSBy
aWdodCB0aGluZyB0byBkby4KPiAKPiBUb29scyBhbmQgaHlwZXJ2aXNvciBhcmUgY29uc2lkZXJp
bmcgQVJNIGd1ZXN0cyBhcyBQVi4gU28gdGhpcyBwYXRjaCBpcwo+IGdvaW5nIHRvIGJyZWFrIGJv
b3QuIFRoZXJlIGFyZSBhbiBhY3Rpb24gKFhFTi0xMDIpIHRvIG1vdmUgQVJNIGd1ZXN0cyB0bwo+
IGJlaGF2ZSBtb3JlIGxpa2UgUFZIIGZyb20gdGhlIHRvb2xzIFBPVi4gSSBhbSBub3Qgc3VyZSB3
aGVuIEkgd2lsbCBoYXZlIHRpbWUKPiB0byBsb29rIGF0IGl0IHRob3VnaHQuCj4gCj4gRm9yIHRo
ZSB0aW1lIGJlaW5nLCBJIGFtIHdvbmRlcmluZyBpZiB3ZSBjb3VsZCBvdmVycmlkZSB0aGUgZmxh
Z3MgZm9yIEFybSBpbgo+IHRoZSB0b29sc3RhY2s/Cj4gCgpJcyB0aGF0IG5lY2Vzc2FyeT8gSSBk
b24ndCB0aGluayB0aGUgcmVzdCBvZiB0aGlzIHNlcmllcyB3aWxsIGJyZWFrIEFSTQphdCBmaXJz
dCBnbGFuY2UuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
