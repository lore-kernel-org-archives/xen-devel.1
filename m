From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 3/5] x86: Introduce struct cpu_policy to
 refer to a group of individual policies
Date: Mon, 05 Nov 2018 08:28:43 -0700
Message-ID: <5BE061AB02000078001F81AD@prv1-mh.provo.novell.com>
References: <1541416600-30056-1-git-send-email-andrew.cooper3@citrix.com>
 <1541416600-30056-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1541416600-30056-4-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjExLjE4IGF0IDEyOjE2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhpcyBpcyBwcmVwIHdvcmsgZm9yIHRoZSBmb2xsb3dpbmcgcGF0Y2ggLSBwbGVhc2Ug
cmVmZXIgdG8gaXQgYXMgd2VsbC4KPiAKPiBXaGVuIGF1ZGl0aW5nIGFuZCBtYW5pcHVsYXRpbmcg
cG9saWNpZXMsIGl0IGlzIG5lY2Vzc2FyeSB0byBkbyBzbyB3aXRoIGEKPiBjb21wbGV0ZSBzZXQg
b2YgcG9saWNpZXMsIGR1ZSB0byB0aGUgaW50ZXJkZXBlbmRlbmNlcyBvZiB0aGUgY29udGVudHMu
ICBBCj4gY29udGFpbmluZyBzdHJ1Y3R1cmUgbGlrZSB0aGlzIHdpbGwgYWxsb3cgZm9yIGNsZWFy
ZXIgQVBJcyBhbmQgY29kZS4KPiAKPiBBcyBhIGZpcnN0IHVzZXIsIHRoaXMgc3RydWN0dXJlIGlz
IGNvbnZlbmllbnQgZm9yIHRoZSBtYXBwaW5nIHVzZWQgYnkKPiBYRU5fU1lTQ1RMX2dldF9jcHVf
cG9saWN5IChpbXBsZW1lbnRlZCBpbiB0aGUgbmV4dCBwYXRjaCksIGFuZCBmb3IgYXVkaXRpbmcK
PiAobGF0ZXIgd2hlbiBYRU5fRE9NQ1RMX3NldF9jcHVfcG9saWN5IGlzIGltcGxlbWVudGVkKS4K
PiAKPiBBdCB0aGlzIHBvaW50LCB0aGUgZGlzdGluY3Rpb24gYmV0d2VlbiAqX21heCBhbmQgKl9k
ZWZhdWx0IGlzIGludHJvZHVjZWQgaW50bwo+IHRoZSBBQkkuICBGb3Igbm93LCAqX2RlZmF1bHQg
aXMgbWFwcGVkIHRvICpfbWF4LCBidXQgZnV0dXJlIGRldmVsb3BtZW50IHdvcmsKPiB3aWxsIHJl
c3VsdCBpbiAqX2RlZmF1bHQgYmVpbmcgYSBsb2dpY2FsIHN1YnNldCBvZiAqX21heC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+
IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBS
ZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
