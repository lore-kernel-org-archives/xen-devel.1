From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] xen: drop preempt_count() for non-debug
 builds
Date: Wed, 22 May 2019 11:39:51 +0100
Message-ID: <45de0f3d-96cd-aa06-635e-5f825a63eff2@citrix.com>
References: <20190522094549.28397-1-jgross@suse.com>
 <20190522094549.28397-3-jgross@suse.com>
 <34f128f9-190d-fdf7-0082-204ab9ccb31a@citrix.com>
 <5CE521ED02000078002314AA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Bu0R=TW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hTOfB-0003Ou-Hs
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 10:40:01 +0000
In-Reply-To: <5CE521ED02000078002314AA@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDUvMjAxOSAxMToxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjIuMDUuMTkg
YXQgMTI6MDAsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMjIvMDUv
MjAxOSAxMDo0NSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+IHByZWVtcHRfY291bnQoKSBhbmQg
dGhlIGFzc29jaWF0ZWQgcGVyLWNwdSB2YXJpYWJsZSBfX3ByZWVtcHRfY291bnQKPj4+IGFyZSB0
ZXN0ZWQgaW4gZGVidWcgYnVpbGQgb25seS4gU28gZHJvcCB0aGVtIGZvciBub24tZGVidWcgYnVp
bGRzLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KPj4gSSdkIGJlIHRlbXB0ZWQgdG8gZm9sZCBwYXRjaGVzIDIgYW5kIDMgdG9nZXRoZXIsIGJl
Y2F1c2UgdGhleSBhcmUgYm90aAo+PiB0aGUgc2FtZSBjaGFuZ2UsIGFuZCBpdCB3b3VsZCByZWR1
Y2UgdGhlIGNodXJuLgo+Pgo+PiBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4sIGlkZWFsbHkgd2l0aCB0aGUKPj4gdHdvIGZvbGRlZCBpbnRvIG9u
ZS4KPiBJJ20gYSBsaXR0bGUgc3VycHJpc2VkIGJ5IHRoaXM6IFdhc24ndCBpdCB5b3Ugd2hvIGdl
bmVyYWxseQo+IHdhbnRlZCB3aGF0IEFTU0VSVCgpIGV4cGFuZHMgdG8gKGNvbnRyb2xsZWQgYnkg
TkRFQlVHKQo+IGJlIGluZGVwZW5kZW50IG9mIENPTkZJR19ERUJVRywgYXQgc29tZSBwb2ludCBk
b3duCj4gdGhlIHJvYWQ/CgpJbiBzb21lIGlkZWFsIHdvcmxkIHllcywgYnV0IHdoYXQgaXMgcmF0
aGVyIG1vcmUgaW1wb3J0YW50IGlzIGFjdHVhbGx5CmhhdmluZyBvcHRpbWlzYXRpb24gY29udHJv
bCB1bnJlbGF0ZWQgdG8gTkRFQlVHLgoKPiBBcmVuJ3QgeW91IGV2ZW4gaGF2aW5nIEFTU0VSVCgp
cyBlbmFibGVkIGluCj4gcmVsZWFzZSBidWlsZHMgb2YgWGVuU2VydmVyLCBvciBhbSBJIG1pc3Jl
bWVtYmVyaW5nPyBJZiBzbwo+IHBhdGNoIDMgd291bGQgbW92ZSB1cyBpbiB0aGUgd3JvbmcgZGly
ZWN0aW9uLgoKV2UgYnVpbGQgYW5kIHNoaXAgYSBkZWJ1ZyBhbmQgYSByZWxlYXNlIGh5cGVydmlz
b3IuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
