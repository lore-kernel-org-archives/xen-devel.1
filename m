From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v10 06/11] x86/entry: Organise the
 clobbering of the RSB/RAS on entry to Xen
Date: Thu, 25 Jan 2018 14:44:05 +0000
Message-ID: <cacca576-997e-a17a-8596-a8d0949b5f92@citrix.com>
References: <1516799535-5778-1-git-send-email-andrew.cooper3@citrix.com>
 <1516799535-5778-7-git-send-email-andrew.cooper3@citrix.com>
 <5A69E75C02000078001A25EE@prv-mh.provo.novell.com>
 <b75097c9-3f63-2728-db30-37a17b890dcc@citrix.com>
 <5A69FA5202000078001A2688@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A69FA5202000078001A2688@prv-mh.provo.novell.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDEvMTggMTQ6NDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI1LjAxLjE4IGF0
IDE1OjE3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDI1LzAxLzE4
IDEzOjE5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+ICBJIHRoaW5rIHdlIHdhbnQgdG8gaGF2ZSB0
aGUgc2FtZSwgdG8gcGxlYXNlIEFNRC4gSSdkCj4+PiBzdWdnZXN0IHRvIHVzZSBhbHRlcm5hdGl2
ZSBwYXRjaGluZyB0aG91Z2ggKGV4Y2VwdCBhZ2FpbiBvbiB0aGUKPj4+IElTVCBwYXRocyksIGJ1
dCB0aGVuIGFnYWluIG1heWJlIGluIGEgZm9sbG93LXVwIHBhdGNoLgo+PiBJIHRydXN0IHRoZSBs
YXRlciBwYXRjaGVzIGFyZSBzdWl0YWJsZSBpbiB0aGUgSVNUIHJlZ2FyZD8KPiBJJ3ZlIHJlc3Bv
bmRlZCB0byBwYXRjaCA3LiBXaGF0IG90aGVyIGxhdGVyIHBhdGNoZXMgaGF2ZSBhbnl0aGluZwo+
IElTVC1yZWxhdGVkPwoKTm9uZSwgYnV0IG15IHBvaW50IHdhcyB0byBpbnF1aXJlIHRoYXQgeW91
ciBJU1QgY29uY2VybiBkb2Vzbid0IGFmZmVjdAp0aGlzIHBhdGNoPwoKfkFuZHJldwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
