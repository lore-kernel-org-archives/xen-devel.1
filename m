From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Subject: Re: [PATCH RESEND v3 1/2] x86/mmcfg: Rename
 pt_pci_init() and call it in acpi_mmcfg_init()
Date: Mon, 27 Aug 2018 16:57:14 +0800
Message-ID: <d369a5e2-f8ff-d0f4-b8e5-3041c35b0860@oracle.com>
References: <2a59b3e6-692d-45ee-aedb-0ddcb280602c@default>
 <5B83B34B02000078001E2048@prv1-mh.provo.novell.com>
Reply-To: zhenzhong.duan@oracle.com
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B83B34B02000078001E2048@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-Devel <xen-devel@lists.xen.org>, manoj.gopalasetty@hpe.com, david.westwood@hpe.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Srinivas REDDY Eeda <srinivas.eeda@oracle.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

5ZyoIDIwMTgvOC8yNyAxNjoxNiwgSmFuIEJldWxpY2gg5YaZ6YGTOgo+Pj4+IE9uIDIyLjA4LjE4
IGF0IDExOjE2LCA8emhlbnpob25nLmR1YW5Ab3JhY2xlLmNvbT4gd3JvdGU6Cj4+IEdpdmVuIHdo
YXQgcHRfcGNpX2luaXQoKSBhY3R1YWxseSBkb2VzLCByZW5hbWUgaXQgcHJvcGVybHkgYW5kIG1v
dmUgaXRzCj4+IGRlY2xhcmF0aW9uIHRvIHBjaS5oLCBtb3ZlIHRoZSBvbmx5IGNhbGwgaW4gYWNw
aV9tbWNmZ19pbml0KCkuCj4+Cj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBaaGVuemhvbmcgRHVhbiA8emhlbnpob25nLmR1YW5Ab3JhY2xlLmNvbT4KPj4gVGVz
dGVkLWJ5OiBHb3BhbGFzZXR0eSwgTWFub2ogPG1hbm9qLmdvcGFsYXNldHR5QGhwZS5jb20+Cj4+
IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gUGxlYXNlIGF2
b2lkIG5lZWRsZXNzIHJlLXNlbmRpbmcgb2YgcGF0Y2hlcyB0aGF0IGhhdmUgYWxyZWFkeQo+IGdv
bmUgaW4uIFJvZ2VyJ3MgcmVtYXJrIHJlZ2FyZGluZyB0aGUgcXVlc3Rpb25hYmxlIHNvbGl0YXJ5
IHYzCj4gMi8yIHdhcyBjb3JyZWN0LCBqdXN0IHRoYXQgeW91IHNob3VsZCBoYXZlIGRyb3BwZWQg
dGhlIDIvMgo+IGluc3RlYWQgb2YgcmUtc2VuZGluZyBhbiBhbHJlYWR5IGFwcGxpZWQgcGF0Y2gu
Ck9rLgpUbyBhdm9pZCBlbmRsZXNzIHJlc2VuZGluZywgSSdsbCBmb2xsb3cgdGhhdCB3YXkgbmV4
dCB0aW1lLgoKVGhhbmtzClpoZW56aG9uZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
