From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 17/18] xen/arm: Resume Dom0 after Xen resumes
Date: Tue, 27 Nov 2018 18:36:46 +0000
Message-ID: <826f5a0f-67cd-c544-a8a8-38d861bf80a7@arm.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-18-git-send-email-mirela.simonovic@aggios.com>
 <77c3d2c9-a1e0-a5b3-0a4e-fc6ea079b817@arm.com>
 <CAKPH-Ngdb_w+uHKFrMd_fF62pM0idQJie2RdKDtD8HbZyNV1WQ@mail.gmail.com>
 <CAKPH-NiEnpDWwT65zwczx20hZcEN4qTayQXpO4=4iye2mcky3Q@mail.gmail.com>
 <dc9b6382-490e-fd41-6fec-faf211103cee@arm.com>
 <CAKPH-Ngn1vp0oxtXs_cO5WnCJJExg5y=QQO5tck6fd1Z76ozsg@mail.gmail.com>
 <2edccbdc-5c9e-630a-27f0-1c937f926bec@arm.com>
 <alpine.DEB.2.10.1811161056400.22115@sstabellini-ThinkPad-X260>
 <alpine.DEB.2.10.1811161105070.22115@sstabellini-ThinkPad-X260>
 <CAKPH-Ni3noct-9WHGLgUCG+19MKOJnbpk_uMMGcPEQ3Kd1U11Q@mail.gmail.com>
 <6b1b7986-5ce1-b3d2-11c9-63e7b17606f7@arm.com>
 <855b1bb125bb3ec2a7d51dd0144787700d6568c0.camel@suse.com>
 <alpine.DEB.2.10.1811161505530.22115@sstabellini-ThinkPad-X260>
 <CAKPH-Ngxu7a-pxoM6+ffBYiiFa3zeUt=ns6gaYpyJpFth4xE3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=By1U=OG=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gRiE9-0006yj-Bf
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 18:36:53 +0000
In-Reply-To: <CAKPH-Ngxu7a-pxoM6+ffBYiiFa3zeUt=ns6gaYpyJpFth4xE3A@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mirela Simonovic <mirela.simonovic@aggios.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: nd@arm.com, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Davorin Mista <dm@aggios.com>, Xen Devel <xen-devel@lists.xen.org>, xen-devel <xen-devel@lists.xenproject.org>, Dario Faggioli <dfaggioli@suse.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMS8xNy8xOCA0OjAxIFBNLCBNaXJlbGEgU2ltb25vdmljIHdyb3RlOgo+IEhpLAoKSGkg
TWlyZWxhLAoKPiAKPiBPbiBTYXQsIE5vdiAxNywgMjAxOCBhdCAxMjowNiBBTSBTdGVmYW5vIFN0
YWJlbGxpbmkKPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIFNhdCwg
MTcgTm92IDIwMTgsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+Pj4gT24gRnJpLCAyMDE4LTExLTE2
IGF0IDIxOjU4ICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gT24gMTYvMTEvMjAxOCAy
MTo0MSwgTWlyZWxhIFNpbW9ub3ZpYyB3cm90ZToKPj4+Pj4gT24gRnJpLCBOb3YgMTYsIDIwMTgg
YXQgODowOSBQTSBTdGVmYW5vIFN0YWJlbGxpbmkKPj4+Pj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Pj4+Pj4+IEl0IHNob3VsZCBiZSBwb3NzaWJsZSB0byBmaWd1cmUgb3V0IHdo
aWNoIGRvbWFpbiBuZWVkcyB0bwo+Pj4+Pj4+IGF3YWtlbiBmcm9tCj4+Pj4+Pj4gdGhlcmUuCj4+
Pj4+Pgo+Pj4+Pj4gQWN0dWFsbHksIGV2dGNobl9zZW5kIGV2ZW50dWFsbHkgd2lsbCB0cmlnZ2Vy
IGEgcHJvcGVyIGludGVycnVwdAo+Pj4+Pj4gaW5qZWN0aW9uIGludG8gdGhlIGRvbWFpbgo+Pj4+
Pj4gKHhlbi9hcmNoL2FybS92Z2ljLmM6YXJjaF9ldnRjaG5faW5qZWN0KSwKPj4+Pj4+IHdoaWNo
IHdpbGwgbmVjZXNzYXJlbHkgd2FrZSBpdCB1cC4gU28gaXQgaXMgcG9zc2libGUgdGhhdCBpdCB3
aWxsCj4+Pj4+PiBhbHJlYWR5IHdvcmsgd2l0aG91dCBhbnkgbmVlZCBmb3IgYWRkaXRpb25hbCBj
aGFuZ2VzPwo+Pj4+Pj4KPj4+Pj4KPj4+Pj4gQWJzb2x1dGVseSwgdGhhdCBzb3VuZHMgZ3JlYXQg
OikgVGhlbiB3ZSBjb3VsZCBqdXN0IGRyb3AgdGhpcwo+Pj4+PiBwYXRjaC4KPj4+Pgo+Pj4+IEkg
ZG9uJ3QgdGhpbmsgeW91IGNhbiBkcm9wIHRoaXMgcGF0Y2guLi4gQXMgeW91IHRpZSB0aGUgaG9z
dCBzdXNwZW5kCj4+Pj4gdG8KPj4+PiB0aGUgaGFyZHdhcmUgZG9tYWluIHN1c3BlbmQsIGl0IG1h
eSBtYWtlcyBzZW5zZSB0byByZXN1bWUgYXQgdGhlIHNhbWUKPj4+PiB0aW1lLgo+Pj4+Cj4+PiBG
V0lXLCBJIHRoaW5rIHRoYXQgdG9vLgo+Pj4KPj4+IEluIGZhY3QsIGxldCdzIGFzc3VtZSBhICpm
dWxseSogZGlzYWdncmVnYXRlZCBzZXR1cCwgd2hlcmUgZG9tMCBvbmx5Cj4+PiBoYXMgdGhlIHRv
b2xzdGFjaywgd2hpbGUgaXQgaGFzIG5vIGhhcmR3YXJlLCBubyBQViBiYWNrZW5kLCBldGMuLi4g
SWYKPj4+IHdlIGRvbid0IHJlc3VtZSBpdCBleHBsaWNpdGx5IHRvZ2V0aGVyIHdpdGggWGVuLCB3
aG8gaXMgZ29pbmcgdG8gcmVzdW1lCj4+PiBpdD8gOi1PCj4+Cj4+IFllcywgdGhhdCdzIHJpZ2h0
LiBIb3dldmVyLCBpdCBzaG91bGQgd29yayBmb3IgZHJpdmVyIGRvbWFpbnM6IHRoZXJlIGlzCj4+
IG5vIG5lZWQgdG8gd2FrZSB1cCBkcml2ZXIgZG9tYWlucyBleHBsaWNpdGx5IGJlY2F1c2UgdGhl
eSB3aWxsIGJlCj4+IHdva2VuIHVwIGJ5IHRoZSBmcm9udGVuZHM/Cj4+Cj4gCj4gSSB0aGluayB3
ZSBhbGwgYWdyZWUsIGV4Y2VwdCBzb21lIG9mIHVzIHdlcmVuJ3Qgc28gY2xlYXIgYWJvdXQgaXQg
OikKPiBGb3Igbm93LCBkb20wIGlzc3VlcyBzdXNwZW5kIGFuZCBzaG91bGQgcmVzdW1lIGFzIHdl
bGwgd2hlbiBYZW4KPiBzdXNwZW5kcy4gVGhpcyBpcyBkb25lIGluIHRoZSBzZXJpZXMsIHJlc3Vt
ZSBpcyBjb3ZlcmVkIGJ5IHRoaXMgcGF0Y2gsCj4gYW5kIGNvbW1pdCBtZXNzYWdlIHNob3VsZCBi
ZSBjbGFyaWZpZWQuCj4gCj4gSWYgYSBkb21VIGhhcyBhIGJhY2tlbmQsIHdlIHNob3VsZCB2ZXJp
ZnkgdGhhdCBpdCBjYW4gYmUgd29rZW4tdXAgYnkKPiBhbiBldmVudCB0cmlnZ2VyZWQgYnkgYSBm
cm9udGVuZCBkcml2ZXIgaW4gYW5vdGhlciBkb21haW4uCj4gCj4gT25lIGRheSwgdGhpcyBwYXRj
aCBjb3VsZCBiZSBkcm9wcGVkL3JldmVydGVkIGlmIG9uZSBjb21lIHVwIHdpdGggYQo+IGRpZmZl
cmVudCBsb2dpYyBmb3IgdHJpZ2dlcmluZyBYZW4gc3VzcGVuZC4gVGhpcyBzaG91bGQgYmUgb2Yg
dGhlCj4gdGFibGUgZm9yIG5vdywgYnV0IGEgZ29vZCBvcHRpb24gdG8gcmVtZW1iZXIgZm9yIGZ1
dHVyZS4KClN1Y2ggY2hhbmdlIGNhbm5vdCBiZSBlYXNpbHkgZHJvcHBlZCBiZWNhdXNlIHNvbWUg
aGFyZHdhcmUgZG9tYWluIE9TIG1heSAKcmVseSBvbiB0aGF0IGJlaGF2aW9yLgoKSSBhbSBhbHNv
IGludGVyZXN0ZWQgdG8gc2VlIGhvdyB0aGlzIGlzIGdvaW5nIHRvIGZpdCB3aXRoIHRoZSBEb20w
bGVzcyAKdXNlIGNhc2UuIFRoZSBlbmQgZ29hbCBpcyB0byBoYXZlIG5vIERvbTAvSGFyZHdhcmUg
ZG9tYWluLiBTbyBob3cgZG8geW91IApleHBlY3Qgc3VzcGVuZC9yZXN1bWUgdG8gd29yayBpbiB0
aGF0IGNhc2U/IE5vdGUgdGhhdCBJIGFtIG5vdCBhc2tpbmcgdG8gCmltcGxlbWVudCBpdCA6KS4K
CkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
