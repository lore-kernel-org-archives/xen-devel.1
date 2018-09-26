From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: Ping: [PATCH] x86: improve vCPU selection in
 pagetable_dying()
Date: Wed, 26 Sep 2018 01:04:02 -0600
Message-ID: <5BAB2F6202000078001EBF97@prv1-mh.provo.novell.com>
References: <5B96796B02000078001E6CF4@prv1-mh.provo.novell.com>
 <5BA0F33302000078001E9717@prv1-mh.provo.novell.com>
 <15752d56-8300-698d-085a-6795bd75f634@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=an3h=mi=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g53ri-0006vs-Rg
 for xen-devel@lists.xenproject.org; Wed, 26 Sep 2018 07:04:06 +0000
In-Reply-To: <15752d56-8300-698d-085a-6795bd75f634@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjA5LjE4IGF0IDE4OjIyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTgvMDkvMTggMTM6NDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxMC4w
OS4xOCBhdCAxNjowMiwgPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPj4+IFJhdGhlciB0aGFu
IHVuY29uZGl0aW9uYWxseSB1c2luZyB2Q1BVIDAsIHVzZSB0aGUgY3VycmVudCB2Q1BVIGlmIHRo
ZQo+Pj4gc3ViamVjdCBkb21haW4gaXMgdGhlIGN1cnJlbnQgb25lLgo+Pj4KPj4+IFNpZ25lZC1v
ZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBXaGF0IGltcHJvdmVt
ZW50IGlzIHRoaXMgaW50ZW5kZWQgdG8gYnJpbmc/CgpJJ3ZlIGNvbWUgYWNyb3NzIHRoaXMgcXVp
dGUgYSB3aGlsZSBhZ28gd2hlbiBpbnZlc3RpZ2F0aW5nIHBvc3NpYmx5CmRhbmdlcm91cyB1c2Vz
IG9mIGQtPnZjcHVbXSwgd2VsbCBiZWZvcmUgeW91ciBzZXJpZXMgdG8gaW1wcm92ZSB0aGUKc2l0
dWF0aW9uIHRoZXJlLiBJIGdlbmVyYWxseSBjb25zaWRlciBpdCB3cm9uZyB0byBoYXJkIGNvZGUg
dXNlIG9mCmQtPnZjcHVbMF0gd2hlbmV2ZXIgaXQgY2FuIGJlIGF2b2lkZWQuCgo+IFNoYWRvd3Mg
YXJlIHBlci1kb21haW4sIGFuZCB0aGUgZ21mbiBpbiBxdWVzdGlvbiBpcyBwYXNzZWQgaW4gYnkg
dGhlCj4gY2FsbGVyLiAgQUZBQ0lULCBpdCBpcyBhIGxvZ2ljYWwgYnVnIHRoYXQgdGhhdCB0aGUg
Y2FsbGJhY2sgdGFrZXMgYSB2Y3B1Cj4gcmF0aGVyIHRoYW4gYSBkb21haW4gaW4gdGhlIGZpcnN0
IHBsYWNlLgoKRGlkIHlvdSBsb29rIGF0IHRoZSAzLWxldmVsIHZhcmlhbnQgb2Ygc2hfcGFnZXRh
YmxlX2R5aW5nKCk/IEl0IHZlcnkKY2xlYXJseSByZWFkcyB0aGUgZ2l2ZW4gdkNQVSdzIENSMy4g
TG9va2luZyBhdCB0aGluZ3MgYWdhaW4gKGluIHBhcnRpY3VsYXIKdGhlIGNvbW1lbnQgYWhlYWQg
b2YgcGFnZXRhYmxlX2R5aW5nKCkpIEkgbm93IGFjdHVhbGx5IHdvbmRlciB3aHkKSFZNT1BfcGFn
ZXRhYmxlX2R5aW5nIGlzIHBlcm1pdHRlZCB0byBiZSBjYWxsZWQgYnkgb3RoZXIgdGhhbiBhIGRv
bWFpbgpmb3IgaXRzZWxmLiBUaGVyZSdzIG5vIHVzZSBvZiBpdCBpbiB0aGUgdG9vbCBzdGFjay4g
RGlzYWxsb3dpbmcgdGhlIHVudXNlZApjYXNlIHdvdWxkIG1lYW4gdGhlIGZhc3QtcGF0aCBsb2dp
YyBpbiBzaF9wYWdldGFibGVfZHlpbmcoKSBjb3VsZApiZWNvbWUgdGhlIG9ubHkgdmFsaWQvaW1w
bGVtZW50ZWQgY2FzZS4gVGltPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
