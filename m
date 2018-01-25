From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 3/6] xen/pvshim: identity pin shim vCPUs to
 pCPUs
Date: Thu, 25 Jan 2018 09:14:55 +0000
Message-ID: <20180125091455.iurb5qby4ckd26tt@MacBook-Pro-de-Roger.local>
References: <20180117094814.32772-1-roger.pau@citrix.com>
 <20180117094814.32772-4-roger.pau@citrix.com>
 <CAFLBxZaU48jzDX91CByN4jBShmB_fAXi=rYVLWsm3cwz8=6uHQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=xhpm=eu=citrix.com=prvs=5564e4040=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eedci-0004v7-FS
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2018 09:15:08 +0000
Content-Disposition: inline
In-Reply-To: <CAFLBxZaU48jzDX91CByN4jBShmB_fAXi=rYVLWsm3cwz8=6uHQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMjQsIDIwMTggYXQgMDY6MDM6MjhQTSArMDAwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBPbiBXZWQsIEphbiAxNywgMjAxOCBhdCA5OjQ4IEFNLCBSb2dlciBQYXUgTW9ubmUg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToKPiA+IFNpbmNlIFZDUFVPUF97dXAvZG93bn0g
YWxyZWFkeSBpZGVudGl0eSBwaW5zIHZDUFUgaG90cGx1ZyB0byBwQ1BVCj4gPiBob3RwbHVnIGFs
c28gcGluIHRoZSB2Q1BVcyB0byB0aGUgcENQVXMgaW4gdGhlIHNjaGVkdWxlci4gVGhpcyBwcmV2
ZW50Cj4gPiB2Q1BVIG1pZ3JhdGlvbiBhbmQgc2hvdWxkIGltcHJvdmUgcGVyZm9ybWFuY2UuCj4g
Pgo+ID4gV2hpbGUgdGhlcmUgYWxzbyB1c2UgX19jcHVtYXNrX3NldF9jcHUgaW5zdGVhZCBvZiBj
cHVtYXNrX3NldF9jcHUsCj4gPiB0aGVyZSdzIG5vIG5lZWQgdG8gdXNlIHRoZSBsb2NrZWQgdmFy
aWFudC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KPiAKPiBTb3JyeSwgSSBqdXN0IHJlYWxpemVkIHRoaXMgLS0gd2UgYWxyZWFk
eSBoYXZlIGEgd2F5IHRvIHBpbiBhIFZNIDE6MQo+IC0tIGQtPmlzX3Bpbm5lZCBzaG91bGQgZG8g
d2hhdCB5b3Ugd2FudCBoZXJlIHdpdGhvdXQgaGF2aW5nIHRvCj4gc3BlY2lhbC1jYXNlIHRoZSBw
dnNoaW0uCj4gCj4gSXQgc2VlbXMgbGlrZSBzb21ldGhpbmcgbGlrZSB0aGUgYXR0YWNoZWQgbWln
aHQgYmUgYmV0dGVyIChjb21waWxlLXRlc3RlZCBvbmx5KS4KCkkgaGF2ZW4ndCB0ZXN0ZWQgdGhl
IHByb3Bvc2VkIHBhdGNoLCBidXQgdGhlcmUncyBhIHBlY3VsaWFyaXR5IG9mIHRoZQpzaGltIHRo
YXQgSSB0aGluayBtYWtlcyB0aGlzIGFwcHJvYWNoIGludmFsaWQuCgpXaGVuIFhlbiBpcyBib290
ZWQgaW4gc2hpbSBtb2RlIHRoZSBBUHMgYXJlIG5ldmVyIHN0YXJ0ZWQsIHdoaWNoIG1lYW5zCnRo
YXQgZG9tMF9jcHVzIG9ubHkgY29udGFpbnMgdGhlIEJTUCwgYW5kIHRoYXQgYWxsb2NfdmNwdSBp
cyBhbHdheXMKZ29pbmcgdG8gYmUgY2FsbGVkIHdpdGggY3B1ID09IDAuIFRoaXMgaW4gdHVybiBt
ZWFucyB0aGF0CnNjaGVkX2luaXRfdmNwdSBpcyBhbHNvIGFsd2F5cyBjYWxsZWQgd2l0aCBjcHVf
aWQgPT0gMCwgYW5kIGlmCmlzX3Bpbm5lZCBpcyBzZXQgaXQgd291bGQgZm9yY2UgYWxsIHZDUFVz
IHRvIGJlIHBpbm5lZCB0byB0aGUgQlNQCkFGQUlDVC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
