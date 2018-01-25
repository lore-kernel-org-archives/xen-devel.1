From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v10 06/11] x86/entry: Organise the
 clobbering of the RSB/RAS on entry to Xen
Date: Thu, 25 Jan 2018 07:48:01 -0700
Message-ID: <5A69FC3102000078001A26B6@prv-mh.provo.novell.com>
References: <1516799535-5778-1-git-send-email-andrew.cooper3@citrix.com>
 <1516799535-5778-7-git-send-email-andrew.cooper3@citrix.com>
 <5A69E75C02000078001A25EE@prv-mh.provo.novell.com>
 <b75097c9-3f63-2728-db30-37a17b890dcc@citrix.com>
 <5A69FA5202000078001A2688@prv-mh.provo.novell.com>
 <cacca576-997e-a17a-8596-a8d0949b5f92@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <cacca576-997e-a17a-8596-a8d0949b5f92@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjAxLjE4IGF0IDE1OjQ0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjUvMDEvMTggMTQ6NDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyNS4w
MS4xOCBhdCAxNToxNywgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gT24g
MjUvMDEvMTggMTM6MTksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+ICBJIHRoaW5rIHdlIHdhbnQg
dG8gaGF2ZSB0aGUgc2FtZSwgdG8gcGxlYXNlIEFNRC4gSSdkCj4+Pj4gc3VnZ2VzdCB0byB1c2Ug
YWx0ZXJuYXRpdmUgcGF0Y2hpbmcgdGhvdWdoIChleGNlcHQgYWdhaW4gb24gdGhlCj4+Pj4gSVNU
IHBhdGhzKSwgYnV0IHRoZW4gYWdhaW4gbWF5YmUgaW4gYSBmb2xsb3ctdXAgcGF0Y2guCj4+PiBJ
IHRydXN0IHRoZSBsYXRlciBwYXRjaGVzIGFyZSBzdWl0YWJsZSBpbiB0aGUgSVNUIHJlZ2FyZD8K
Pj4gSSd2ZSByZXNwb25kZWQgdG8gcGF0Y2ggNy4gV2hhdCBvdGhlciBsYXRlciBwYXRjaGVzIGhh
dmUgYW55dGhpbmcKPj4gSVNULXJlbGF0ZWQ/Cj4gCj4gTm9uZSwgYnV0IG15IHBvaW50IHdhcyB0
byBpbnF1aXJlIHRoYXQgeW91ciBJU1QgY29uY2VybiBkb2Vzbid0IGFmZmVjdAo+IHRoaXMgcGF0
Y2g/CgpObywgaXQgd2FzIGp1c3QgdG8gcmUtZW1waGFzaXplIHRoYXQgSSB0aGluayB3ZSdkIGJl
IGJldHRlciBvZmYgbm90CnRvIHBhdGNoIGFueSBvZiB0aGUgSVNUIHJlbGF0ZWQgY29kZSBwYXRo
cy4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
