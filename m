From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/3] xen: drop preempt_count() for non-debug
 builds
Date: Wed, 22 May 2019 12:20:36 +0200
Message-ID: <29eb74de-2df0-0835-a1c6-d37681779907@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aAGA=TW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hTOMS-0002OI-B4
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 10:20:40 +0000
References: =?UTF-8?B?PDIwMTkwNTIyMDk0NTQ5LjI4Mzk377+9Me+/vWpncm9zc0BzdXNl?=
 =?UTF-8?B?LmNvbT4gPDIwMTkwNTIyMDk0NTQ5LjI4Mzk377+9M++/vWpncm9zc0BzdXNlLmNv?=
 =?UTF-8?Q?m=3e_=3c34f128f9-190d-fdf7-0082-204ab9ccb31a=40citrix=2ecom=3e_?=
 =?UTF-8?Q?=3c5CE521ED02000078002314AA=40suse=2ecom=3e?=
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDUvMjAxOSAxMjoxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjIuMDUuMTkg
YXQgMTI6MDAsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMjIvMDUv
MjAxOSAxMDo0NSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+IHByZWVtcHRfY291bnQoKSBhbmQg
dGhlIGFzc29jaWF0ZWQgcGVyLWNwdSB2YXJpYWJsZSBfX3ByZWVtcHRfY291bnQKPj4+IGFyZSB0
ZXN0ZWQgaW4gZGVidWcgYnVpbGQgb25seS4gU28gZHJvcCB0aGVtIGZvciBub24tZGVidWcgYnVp
bGRzLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KPj4KPj4gSSdkIGJlIHRlbXB0ZWQgdG8gZm9sZCBwYXRjaGVzIDIgYW5kIDMgdG9nZXRoZXIs
IGJlY2F1c2UgdGhleSBhcmUgYm90aAo+PiB0aGUgc2FtZSBjaGFuZ2UsIGFuZCBpdCB3b3VsZCBy
ZWR1Y2UgdGhlIGNodXJuLgo+Pgo+PiBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4sIGlkZWFsbHkgd2l0aCB0aGUKPj4gdHdvIGZvbGRlZCBpbnRv
IG9uZS4KPiAKPiBJJ20gYSBsaXR0bGUgc3VycHJpc2VkIGJ5IHRoaXM6IFdhc24ndCBpdCB5b3Ug
d2hvIGdlbmVyYWxseQo+IHdhbnRlZCB3aGF0IEFTU0VSVCgpIGV4cGFuZHMgdG8gKGNvbnRyb2xs
ZWQgYnkgTkRFQlVHKQo+IGJlIGluZGVwZW5kZW50IG9mIENPTkZJR19ERUJVRywgYXQgc29tZSBw
b2ludCBkb3duCj4gdGhlIHJvYWQ/IEFyZW4ndCB5b3UgZXZlbiBoYXZpbmcgQVNTRVJUKClzIGVu
YWJsZWQgaW4KPiByZWxlYXNlIGJ1aWxkcyBvZiBYZW5TZXJ2ZXIsIG9yIGFtIEkgbWlzcmVtZW1i
ZXJpbmc/IElmIHNvCj4gcGF0Y2ggMyB3b3VsZCBtb3ZlIHVzIGluIHRoZSB3cm9uZyBkaXJlY3Rp
b24uCgpBIHBvc3NpYmlsaXR5IHRvIHNvbHZlIHRoYXQgd291bGQgYmUgdGhlIGFkZGl0aW9uIG9m
CkNPTkZJR19BU1NFUlQgZGVmYXVsdGluZyB0byBDT05GSUdfREVCVUcuCgoKSnVlcmdlbgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
