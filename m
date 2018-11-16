From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 17/18] xen/arm: Resume Dom0 after Xen resumes
Date: Fri, 16 Nov 2018 15:06:41 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1811161505530.22115@sstabellini-ThinkPad-X260>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <855b1bb125bb3ec2a7d51dd0144787700d6568c0.camel@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Davorin Mista <dm@aggios.com>, Xen Devel <xen-devel@lists.xen.org>, Julien Grall <Julien.Grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>, Mirela Simonovic <mirela.simonovic@aggios.com>
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCAxNyBOb3YgMjAxOCwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gT24gRnJpLCAyMDE4
LTExLTE2IGF0IDIxOjU4ICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiBPbiAxNi8xMS8y
MDE4IDIxOjQxLCBNaXJlbGEgU2ltb25vdmljIHdyb3RlOgo+ID4gPiBPbiBGcmksIE5vdiAxNiwg
MjAxOCBhdCA4OjA5IFBNIFN0ZWZhbm8gU3RhYmVsbGluaQo+ID4gPiA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPiBJdCBzaG91bGQgYmUgcG9zc2libGUgdG8gZmlndXJl
IG91dCB3aGljaCBkb21haW4gbmVlZHMgdG8KPiA+ID4gPiA+IGF3YWtlbiBmcm9tCj4gPiA+ID4g
PiB0aGVyZS4KPiA+ID4gPiAKPiA+ID4gPiBBY3R1YWxseSwgZXZ0Y2huX3NlbmQgZXZlbnR1YWxs
eSB3aWxsIHRyaWdnZXIgYSBwcm9wZXIgaW50ZXJydXB0Cj4gPiA+ID4gaW5qZWN0aW9uIGludG8g
dGhlIGRvbWFpbgo+ID4gPiA+ICh4ZW4vYXJjaC9hcm0vdmdpYy5jOmFyY2hfZXZ0Y2huX2luamVj
dCksCj4gPiA+ID4gd2hpY2ggd2lsbCBuZWNlc3NhcmVseSB3YWtlIGl0IHVwLiBTbyBpdCBpcyBw
b3NzaWJsZSB0aGF0IGl0IHdpbGwKPiA+ID4gPiBhbHJlYWR5IHdvcmsgd2l0aG91dCBhbnkgbmVl
ZCBmb3IgYWRkaXRpb25hbCBjaGFuZ2VzPwo+ID4gPiA+IAo+ID4gPiAKPiA+ID4gQWJzb2x1dGVs
eSwgdGhhdCBzb3VuZHMgZ3JlYXQgOikgVGhlbiB3ZSBjb3VsZCBqdXN0IGRyb3AgdGhpcwo+ID4g
PiBwYXRjaC4KPiA+IAo+ID4gSSBkb24ndCB0aGluayB5b3UgY2FuIGRyb3AgdGhpcyBwYXRjaC4u
LiBBcyB5b3UgdGllIHRoZSBob3N0IHN1c3BlbmQKPiA+IHRvIAo+ID4gdGhlIGhhcmR3YXJlIGRv
bWFpbiBzdXNwZW5kLCBpdCBtYXkgbWFrZXMgc2Vuc2UgdG8gcmVzdW1lIGF0IHRoZSBzYW1lCj4g
PiB0aW1lLgo+ID4gCj4gRldJVywgSSB0aGluayB0aGF0IHRvby4KPiAKPiBJbiBmYWN0LCBsZXQn
cyBhc3N1bWUgYSAqZnVsbHkqIGRpc2FnZ3JlZ2F0ZWQgc2V0dXAsIHdoZXJlIGRvbTAgb25seQo+
IGhhcyB0aGUgdG9vbHN0YWNrLCB3aGlsZSBpdCBoYXMgbm8gaGFyZHdhcmUsIG5vIFBWIGJhY2tl
bmQsIGV0Yy4uLiBJZgo+IHdlIGRvbid0IHJlc3VtZSBpdCBleHBsaWNpdGx5IHRvZ2V0aGVyIHdp
dGggWGVuLCB3aG8gaXMgZ29pbmcgdG8gcmVzdW1lCj4gaXQ/IDotTwoKWWVzLCB0aGF0J3Mgcmln
aHQuIEhvd2V2ZXIsIGl0IHNob3VsZCB3b3JrIGZvciBkcml2ZXIgZG9tYWluczogdGhlcmUgaXMK
bm8gbmVlZCB0byB3YWtlIHVwIGRyaXZlciBkb21haW5zIGV4cGxpY2l0bHkgYmVjYXVzZSB0aGV5
IHdpbGwgYmUKd29rZW4gdXAgYnkgdGhlIGZyb250ZW5kcz8KCgo+IDw8VGhpcyBoYXBwZW5zIGJl
Y2F1c2UgSSBjaG9vc2UgaXQgdG8gaGFwcGVuIT4+IChSYWlzdGxpbiBNYWplcmUpCj4gLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPiBEYXJpbyBGYWdnaW9saSwgUGguRCwgaHR0cDovL2Fib3V0Lm1lL2RhcmlvLmZhZ2dpb2xp
Cj4gU29mdHdhcmUgRW5naW5lZXIgQCBTVVNFIGh0dHBzOi8vd3d3LnN1c2UuY29tLwo+IAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
