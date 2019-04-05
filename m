From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/5] x86/cpu: Drop cpu_devs[] and
 $VENDOR_init_cpu() hooks
Date: Fri, 5 Apr 2019 10:27:38 +0100
Message-ID: <fca6e237-e4eb-0546-cef9-07786deb7c11@citrix.com>
References: <1554409592-28572-1-git-send-email-andrew.cooper3@citrix.com>
 <1554409592-28572-2-git-send-email-andrew.cooper3@citrix.com>
 <5CA718850200007800224CC8@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5CA718850200007800224CC8@prv1-mh.provo.novell.com>
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
Cc: Pu Wen <puwen@hygon.cn>, Davidwang <Davidwang@zhaoxin.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDQvMjAxOSAwOTo1NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDQuMDQuMTkg
YXQgMjI6MjYsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gVGhlc2UgaGVs
cGVycyBlYWNoIGZpbGwgaW4gYSBzaW5nbGUgY3B1X2RldnNbXSBwb2ludGVyLCBhbmQgc2luY2Ug
Yy9zCj4+IDAwYjRmNGQwZiAieDg2L2NwdWlkOiBEcm9wIGdldF9jcHVfdmVuZG9yKCkgY29tcGxl
dGVseSIsIHRoaXMgYXJyYXkgaXMgcmVhZAo+PiBleGFjdGx5IG9uY2Ugb24gYm9vdC4KPj4KPj4g
RGVsZXRlIHRoZSBob29rcyBhbmQgY3B1X2RldnNbXSwgYW5kIGhhdmUgZWFybHlfY3B1X2RldGVj
dCgpIHBpY2sgdGhlCj4+IGFwcHJvcHJpYXRlIGNwdV9kZXYgc3RydWN0dXJlIGRpcmVjdGx5Lgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gd2l0
aCBvbmUgcmVtYXJrOgo+Cj4+IEBAIC02ODcsMTAgKzY4OSw2IEBAIHN0YXRpYyBjcHVtYXNrX3Qg
Y3B1X2luaXRpYWxpemVkOwo+PiAgCj4+ICB2b2lkIF9faW5pdCBlYXJseV9jcHVfaW5pdCh2b2lk
KQo+PiAgewo+PiAtCWludGVsX2NwdV9pbml0KCk7Cj4+IC0JYW1kX2luaXRfY3B1KCk7Cj4+IC0J
Y2VudGF1cl9pbml0X2NwdSgpOwo+PiAtCXNoYW5naGFpX2luaXRfY3B1KCk7Cj4+ICAJZWFybHlf
Y3B1X2RldGVjdCgpOwo+PiAgfQo+IEkgdGhpbmsgdGhpcyBmdW5jdGlvbiBzaG91bGQgdGhlbiBn
byBhd2F5IGFzIHdlbGwsIHVubGVzcyB5b3UgaGF2ZQo+IHBsYW5zIHRvIHB1dCBuZXcgc3R1ZmYg
aW50byBpdC4gVG8gYXZvaWQgbW9kaWZ5aW5nIHRoZSBjYWxsZXIsCj4gcGVyaGFwcyBiZXN0IHRv
IHNpbXBseSByZW5hbWVkIGVhcmx5X2NwdV9kZXRlY3QoKT8gTXkgUi1iCj4gc3RhbmRzIHdpdGgg
dGhpcyBjaGFuZ2UsIGlmIHlvdSBkZWNpZGUgdG8gZm9sZCBpdCBpbi4KCkkgd2FzIGNvbnNpZGVy
aW5nIHdoZXRoZXIgdG8gZG8gdGhhdCwgc28gSSB3aWxsLgoKfkFuZHJldwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
