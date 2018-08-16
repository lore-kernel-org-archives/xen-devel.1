From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 0/2] MMIO emulation fixes
Date: Thu, 16 Aug 2018 14:52:48 +0200
Message-ID: <a6f65e26-173a-90f4-9efb-f0b0ee895927@suse.com>
References: <20180810103714.5112=ef=bf=bd1=ef=bf=bdpaul.durrant@ci?=
 =?UTF-8?Q?trix.com> <5B6D86F30?=
 =?UTF-8?Q?2000078001DCF85@prv1=ef=bf=bdmh.provo.novell.com> <e8cff3ca6c154b?=
 =?UTF-8?Q?67a2a932af83719354@AMSPEX02CL03.citrite.net> <fdf19f7d=ef=bf=bd1b?=
 =?UTF-8?B?OTLvv71hOWMw77+9MzYwMu+/vWIxYzk4MDdiZjYxMEBjaXRyaXguY29tPiA8YTcz?=
 =?UTF-8?Q?5b4359ccc4b278330204d9790c6ac@AMSPEX02CL03.citrite.net> <5B6DAF9F?=
 =?UTF-8?Q?02000078001DD040@prv1=ef=bf=bdmh.provo.novell.com> <e2f77af0b2394?=
 =?UTF-8?Q?b8f859a1f2dc1a91797@AMSPEX02CL03.citrite.net> <5B6DB69D0200007800?=
 =?UTF-8?Q?1DD06A@prv1=ef=bf=bdmh.provo.novell.com> <eaab5a73=ef=bf=bd2910?=
 =?UTF-8?B?77+9N2ZiNu+/vWUxZmPvv70wODUzN2U2MzA4OGNAY2l0cml4LmNvbT4gPDkyY2E2?=
 =?UTF-8?B?OWU177+9OThiMe+/vTYxZTTvv704MTdh77+9Mzg2OGY4Mjk0NzFhQGNpdHJpeC5j?=
 =?UTF-8?Q?om> <5B75521102000078001DED13@prv1=ef=bf=bdmh.provo.novell.com> <?=
 =?UTF-8?Q?11c0c965-9af7-2cec-1420-4541e281183a@citrix.com> <5B755FBC0200007?=
 =?UTF-8?Q?8001DEDBF@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=egxv=k7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fqHll-0002R2-1n
 for xen-devel@lists.xenproject.org; Thu, 16 Aug 2018 12:52:53 +0000
In-Reply-To: <5B755FBC0200007?= =?UTF-8?Q?8001DEDBF@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul Durrant <paul.durrant@citrix.com>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDgvMTggMTM6MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDE2LjA4LjE4IGF0
IDEyOjU2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDE2LzA4LzE4
IDExOjI5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IEZvbGxvd2luZyBzb21lIGZ1cnRoZXIgZGlz
Y3Vzc2lvbiB3aXRoIEFuZHJldywgaGUgbG9va3MgdG8gYmUKPj4+IGNvbnZpbmNlZCB0aGF0IHRo
ZSBpc3N1ZSBpcyB0byBiZSBmaXhlZCBpbiB0aGUgYmFsbG9vbiBkcml2ZXIsCj4+PiB3aGljaCBz
byBmYXIgKGludGVudGlvbmFsbHkgYWZhaWN0KSBkb2VzIG5vdCByZW1vdmUgdGhlIGRpcmVjdAo+
Pj4gbWFwIGVudHJpZXMgZm9yIGJhbGxvb25lZCBvdXQgcGFnZXMgaW4gdGhlIEhWTSBjYXNlLiBJ
J20gbm90Cj4+PiBjb252aW5jZWQgb2YgdGhpcywgYnV0IEknZCBuZXZlcnRoZWxlc3MgbGlrZSB0
byBpbnF1aXJlIHdoZXRoZXIKPj4+IHN1Y2ggYSBjaGFuZ2UgKHJlc3VsdGluZyBpbiBzaGF0dGVy
ZWQgc3VwZXIgcGFnZSBtYXBwaW5ncykKPj4+IHdvdWxkIGJlIGFjY2VwdGFibGUgaW4gdGhlIGZp
cnN0IHBsYWNlLgo+Pgo+PiBXZSBkb24ndCB0b2xlcmF0ZSBhbnl0aGluZyBlbHNlIGluIHRoZSBk
aXJlY3RtYXAgcG9pbnRpbmcgdG8KPj4gaW52YWxpZC91bmltcGxlbWVudGVkIGZyYW1lcy4gIFdo
eSBzaG91bGQgYmFsbG9vbmluZyBiZSBhbnkgZGlmZmVyZW50Pwo+IAo+IEJlY2F1c2UgYmFsbG9v
bmluZyBpcyBzb21ldGhpbmcgdmlydHVhbGl6YXRpb24gc3BlY2lmaWMsIHdoaWNoCj4gZG9lc24n
dCBoYXZlIGFueSBlcXVpdmFsZW50IG9uIGJhcmUgaGFyZHdhcmUgKG1lbW9yeSBob3QKPiB1bnBs
dWcgZG9lc24ndCBjb21lIHF1aXRlIGNsb3NlIGVub3VnaCBpbW8sIG5vdCB0aGUgbGVhc3QKPiBi
ZWNhdXNlIHRoYXQgZG9lc24ndCB3b3JrIG9uIGEgcGFnZSBncmFudWxhciBiYXNpcykuIEhlbmNl
Cj4gd2UncmUgdG8gZGVmaW5lIHRoZSBleGFjdCBiZWhhdmlvciBoZXJlLCBhbmQgaGVuY2Ugc3Vj
aCBhCj4gZGVmaW5pdGlvbiBjb3VsZCBhcyB3ZWxsIGluY2x1ZGUgc3BlY2lhbCBiZWhhdmlvciBv
ZiBhY2Nlc3Nlcwo+IHRvIHRoZSBpbnZvbHZlZCBndWVzdC1waHlzaWNhbCBhZGRyZXNzZXMuCgpJ
ZiBJIHJlYWQgZHJpdmVycy92aXJ0aW8vdmlydGlvX2JhbGxvb24uYyBjb3JyZWN0bHkgS1ZNIGRv
ZXMgdGhlIHNhbWUKYXMgWGVuOiBiYWxsb29uZWQgcGFnZXMgYXJlIF9ub3RfIHJlbW92ZWQgZnJv
bSB0aGUgZGlyZWN0IG1hcHBpbmdzLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
