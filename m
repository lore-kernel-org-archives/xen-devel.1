From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Subject: Re: [PATCH] xen/grant: Mute gcc warning in
 steal_linear_address()
Date: Thu, 30 Aug 2018 16:10:16 +0800
Message-ID: <75ebc583-b2fe-0871-0da4-23984ab2fb4e@oracle.com>
References: <037428ab-4f89-4068-9ad4-1ded955cf9fd@default>
 <5B87A4F602000078001E35FF@prv1-mh.provo.novell.com>
Reply-To: zhenzhong.duan@oracle.com
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B87A4F602000078001E35FF@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Srinivas REDDY Eeda <srinivas.eeda@oracle.com>, Wei Liu <wei.liu2@citrix.com>, Xen-Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

5ZyoIDIwMTgvOC8zMCAxNjowNCwgSmFuIEJldWxpY2gg5YaZ6YGTOgo+Pj4+IE9uIDMwLjA4LjE4
IGF0IDA2OjA2LCA8emhlbnpob25nLmR1YW5Ab3JhY2xlLmNvbT4gd3JvdGU6Cj4+IE1vdmUgcmVm
ZXJlbmNlIG9mIG9sMWUgYWhlYWQgb3IgZWxzZSB3ZSBzZWUgYmVsb3cgd2FybmluZy4KPj4KPj4g
Y2MxOiB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycwo+PiBncmFudF90YWJsZS5jOiBJ
biBmdW5jdGlvbiAncmVwbGFjZV9ncmFudF9wdl9tYXBwaW5nJzoKPj4gZ3JhbnRfdGFibGUuYzox
NDI6IHdhcm5pbmc6ICdvbDFlLmwxJyBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVkIGluIHRoaXMK
Pj4gZnVuY3Rpb24KPj4KPj4gU2lnbmVkLW9mZi1ieTogWmhlbnpob25nIER1YW4gPHpoZW56aG9u
Zy5kdWFuQG9yYWNsZS5jb20+Cj4gCj4gSSdtIGZpbmUgd2l0aCB0aGUgY2hhbmdlLCBidXQgZ29p
bmcgZm9yd2FyZCBwbGVhc2UgYmUgbW9yZSBzcGVjaWZpYwo+IHdpdGggeW91ciBkZXNjcmlwdGlv
bnM6IFdoZXRoZXIgb3Igbm90IHdhcm5pbmdzIGdldCBlbWl0dGVkIGZvciBhCj4gY2VydGFpbiBw
aWVjZSBvZiBjb2RlIG9mdGVuIGhpZ2hseSBkZXBlbmRzIG9uIGNvbXBpbGVyIHZlcnNpb24uIExl
dAo+IHVzIGtub3cgd2hpY2ggdmVyc2lvbiB5b3UndmUgcnVuIHRoaXMgaW50byB3aXRoLiBGb3Ig
dGhlIHJlY29yZCwgSSdtCj4gYnVpbGRpbmcgb24gYSB3aWRlIHJhbmdlIG9mIGdjYyB2ZXJzaW9u
cyBldmVyeSBvbmNlIGluIGEgd2hpbGUsIGFuZAo+IEkndmUgbm90IGNvbWUgYWNyb3NzIHRoaXMg
d2FybmluZyBzbyBmYXIgKG9yIGVsc2UgSSB3b3VsZCBoYXZlIHNlbnQKPiBhIHBhdGNoKS4gVGhl
IHJlYWxseSBvbGQgdmVyc2lvbnMgKDQuMS54IGZvciBleGFtcGxlKSBjYW4ndCByZWFsbHkgYmUK
PiB1c2VkIGFueW1vcmUgZm9yIGNlcnRhaW4gb3RoZXIgcmVhc29ucyBhbnl3YXksIGFuZCBJIHRo
aW5rIGl0J3MKPiBhYm91dCB0aW1lIHdlIGF0IGxlYXN0IHJhaXNlIHRoZSBiYXIgYSBsaXR0bGUg
KGFsc28gZm9yIGJpbnV0aWxzLCB3aGljaAo+IGlpcmMgd2FzIHRoZSBhY3R1YWwgcHJvYmxlbSB3
aXRoIGhlcmUsIHVzaW5nIGEgdmVyc2lvbiBtYXRjaGluZyBpbgo+IG9yaWdpbmFsIHJlbGVhc2Ug
dGltZSB3aXRoIGdjYyA0LjEueCkuCgpnY2MgdmVyc2lvbiA0LjEuMiAyMDA4MDcwNCAoUmVkIEhh
dCA0LjEuMi01NSkKClRoYW5rcwpaaGVuemhvbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
