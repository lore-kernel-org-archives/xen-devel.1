From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 0/2] MMIO emulation fixes
Date: Tue, 4 Sep 2018 17:24:17 +0100
Message-ID: <7cb81824-b879-ef58-054c-7c6c67996fac@citrix.com>
References: <20180810103714.5112=3def=3dbf=3dbd1=3def=3dbf=3dbdpau?=
 =?UTF-8?Q?l.durrant@ci=3f=3d_trix.com> <fdf19f7d=ef=bf=bd1b92=ef=bf=bda9c0?=
 =?UTF-8?Q?=ef=bf=bd3602=ef=bf=bdb1c9807bf610@citrix.com> <a735b4359ccc4b278?=
 =?UTF-8?Q?330204d9790c6ac@AMSPEX02CL03.citrite.net> <5B6DAF9F02000078001DD0?=
 =?UTF-8?Q?40@prv1=ef=bf=bdmh.provo.novell.com> <e2f77af0b2394b8f859a1f2dc1a?=
 =?UTF-8?Q?91797@AMSPEX02CL03.citrite.net> <5B6DB69D02000078001DD06A@prv1?=
 =?UTF-8?B?77+9bWgucHJvdm8ubm92ZWxsLmNvbT4gPGVhYWI1YTcz77+9MjkxMO+/vTdmYjY=?=
 =?UTF-8?B?77+9ZTFmY++/vTA4NTM3ZTYzMDg4Y0BjaXRyaXguY29tPiA8OTJjYTY5ZTXvv705?=
 =?UTF-8?B?OGIx77+9NjFlNO+/vTgxN2Hvv70zODY4ZjgyOTQ3MWFAY2l0cml4LmNvbT4gPDVC?=
 =?UTF-8?Q?75521102000078001DED13@prv1=ef=bf=bdmh.provo.novell.com> <11c0c96?=
 =?UTF-8?Q?5-9af7-2cec-1420-4541e281183a@citrix.com> <5B755FBC0200007_=3d=3f?=
 =?UTF-8?Q?UTF-8=3fQ=3f8001DEDBF@suse.com> <dd3c99c2-67e3-faf1-4219-85651b89?=
 =?UTF-8?Q?1adc@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wdzn=ls=citrix.com=prvs=778137930=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fxE7z-0004vz-Mk
 for xen-devel@lists.xenproject.org; Tue, 04 Sep 2018 16:24:31 +0000
In-Reply-To: <dd3c99c2-67e3-faf1-4219-85651b89?= =?UTF-8?Q?1adc@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul Durrant <paul.durrant@citrix.com>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDkvMTggMTc6MTEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMTYvMDgvMTggMTM6
MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxNi4wOC4xOCBhdCAxMjo1NiwgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gT24gMTYvMDgvMTggMTE6MjksIEphbiBC
ZXVsaWNoIHdyb3RlOgo+Pj4+IEZvbGxvd2luZyBzb21lIGZ1cnRoZXIgZGlzY3Vzc2lvbiB3aXRo
IEFuZHJldywgaGUgbG9va3MgdG8gYmUKPj4+PiBjb252aW5jZWQgdGhhdCB0aGUgaXNzdWUgaXMg
dG8gYmUgZml4ZWQgaW4gdGhlIGJhbGxvb24gZHJpdmVyLAo+Pj4+IHdoaWNoIHNvIGZhciAoaW50
ZW50aW9uYWxseSBhZmFpY3QpIGRvZXMgbm90IHJlbW92ZSB0aGUgZGlyZWN0Cj4+Pj4gbWFwIGVu
dHJpZXMgZm9yIGJhbGxvb25lZCBvdXQgcGFnZXMgaW4gdGhlIEhWTSBjYXNlLiBJJ20gbm90Cj4+
Pj4gY29udmluY2VkIG9mIHRoaXMsIGJ1dCBJJ2QgbmV2ZXJ0aGVsZXNzIGxpa2UgdG8gaW5xdWly
ZSB3aGV0aGVyCj4+Pj4gc3VjaCBhIGNoYW5nZSAocmVzdWx0aW5nIGluIHNoYXR0ZXJlZCBzdXBl
ciBwYWdlIG1hcHBpbmdzKQo+Pj4+IHdvdWxkIGJlIGFjY2VwdGFibGUgaW4gdGhlIGZpcnN0IHBs
YWNlLgo+Pj4gV2UgZG9uJ3QgdG9sZXJhdGUgYW55dGhpbmcgZWxzZSBpbiB0aGUgZGlyZWN0bWFw
IHBvaW50aW5nIHRvCj4+PiBpbnZhbGlkL3VuaW1wbGVtZW50ZWQgZnJhbWVzLiAgV2h5IHNob3Vs
ZCBiYWxsb29uaW5nIGJlIGFueSBkaWZmZXJlbnQ/Cj4+IEJlY2F1c2UgYmFsbG9vbmluZyBpcyBz
b21ldGhpbmcgdmlydHVhbGl6YXRpb24gc3BlY2lmaWMsIHdoaWNoCj4+IGRvZXNuJ3QgaGF2ZSBh
bnkgZXF1aXZhbGVudCBvbiBiYXJlIGhhcmR3YXJlIChtZW1vcnkgaG90Cj4+IHVucGx1ZyBkb2Vz
bid0IGNvbWUgcXVpdGUgY2xvc2UgZW5vdWdoIGltbywgbm90IHRoZSBsZWFzdAo+PiBiZWNhdXNl
IHRoYXQgZG9lc24ndCB3b3JrIG9uIGEgcGFnZSBncmFudWxhciBiYXNpcykuIEhlbmNlCj4+IHdl
J3JlIHRvIGRlZmluZSB0aGUgZXhhY3QgYmVoYXZpb3IgaGVyZSwgYW5kIGhlbmNlIHN1Y2ggYQo+
PiBkZWZpbml0aW9uIGNvdWxkIGFzIHdlbGwgaW5jbHVkZSBzcGVjaWFsIGJlaGF2aW9yIG9mIGFj
Y2Vzc2VzCj4+IHRvIHRoZSBpbnZvbHZlZCBndWVzdC1waHlzaWNhbCBhZGRyZXNzZXMuCj4gQWZ0
ZXIgZGlzY3Vzc2luZyB0aGUgaXNzdWUgd2l0aCBzb21lIEtWTSBndXlzIEkgc3RpbGwgdGhpbmsg
aXQgd291bGQgYmUKPiBiZXR0ZXIgdG8gbGVhdmUgdGhlIGJhbGxvb25lZCBwYWdlcyBtYXBwZWQg
aW4gdGhlIGRpcmVjdCBtYXAuIEtWTSBkb2VzCj4gaXQgdGhlIHNhbWUgd2F5LiBUaGV5IHJldHVy
biAic29tZXRoaW5nIiBpbiBjYXNlIHRoZSBndWVzdCB0cmllcyB0bwo+IHJlYWQgZnJvbSBzdWNo
IGEgcGFnZSAobWlnaHQgYmUgdGhlIHJlYWwgZGF0YSwgMCdzIG9yIGFsbCAxJ3MpLgo+Cj4gU28g
d2Ugc2hvdWxkIGVpdGhlciBtYXAgYW4gYWxsIDAncyBvciAxJ3MgcGFnZSB2aWEgRVBULCBvciB3
ZSBzaG91bGQKPiByZXR1cm4gMCdzIG9yIDEncyB2aWEgZW11bGF0aW9uIG9mIHRoZSByZWFkIGlu
c3RydWN0aW9uLgo+Cj4gUGVyZm9ybWFuY2Ugc2hvdWxkbid0IGJlIGEgbWFqb3IgaXNzdWUsIGFz
IHN1Y2ggcmVhZHMgc2hvdWxkIGJlIHJlYWxseQo+IHJhcmUuCgpTdWNoIHJlYWRzIHNob3VsZCBi
ZSBub24tZXhpc3RlbnQuwqAgT25lIHdheSBvciBhbm90aGVyLCB0aGVyZSdzIHN0aWxsIGEKYnVn
IHRvIGZpeCBpbiB0aGUga2VybmVsLCBiZWNhdXNlIGl0IGlzbid0IGtlZXBpbmcgc3VpdGFibGUg
dHJhY2sgb2YgdGhlCnBmbnMuCgpBcyBmb3IgaG93IFhlbiBjb3VsZCBkbyB0aGluZ3MgYmV0dGVy
Li4uCgpXZSBjb3VsZCBtYXAgYSBwYWdlIG9mIGFsbC1vbmVzIChhbGwgemVyb2VzIHdvdWxkIGRl
ZmluaXRlbHkgYmUgd3JvbmcpLApidXQgeW91J3ZlIHN0aWxsIGdvdCB0aGUgcHJvYmxlbSBvZiB3
aGF0IGhhcHBlbnMgaWYgYSB3cml0ZSBvY2N1cnMuwqAgV2UKYWJzb2x1dGVseSBjYW4ndCBzYWNy
aWZpY2UgZW5vdWdoIFJBTSB0byBmaWxsIGluIHRoZSBiYWxsb29uZWQtb3V0CmZyYW1lcyB3aXRo
IHJlYWQvd3JpdGUgZnJhbWVzLgoKSSdkIHByZWZlciBub3QgdG8gc2VlIGFueSBlbXVsYXRpb24g
aGVyZSwgYnV0IHRoYXQgaXMgbW9yZSBmb3IgYW4gYXR0YWNrCnN1cmZhY2UgbGltaXRhdGlvbiBw
b2ludCBvZiB2aWV3LsKgIHg4NiBzdGlsbCBvZmZlcnMgdXMgdGhlIG9wdGlvbiB0byBub3QKdG9s
ZXJhdGUgbWlzYWxpZ25lZCBhY2Nlc3NlcyBhbmQgdGVybWluYXRlIGVhcmx5IHdyaXRlLWRpc2Nh
cmQgd2hlbgpoaXR0aW5nIG9uZSBvZiB0aGVzZSBwYWdlcy4KCn5BbmRyZXcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
