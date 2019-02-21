From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH v2 3/4] x86/vmx: Fix security issue when a
 guest balloons out the #VE info page
Date: Thu, 21 Feb 2019 23:28:25 +0200
Message-ID: <63664e71-390d-5105-6e7d-ece6126f55c0@bitdefender.com>
References: <1550614715-21161-4-git-send-email-andrew.cooper3@citrix.com>
 <1550780337-638-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1550780337-638-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi8yMS8xOSAxMDoxOCBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgbG9naWMgaW4g
YWx0cDJtX3ZjcHVfe2VuLGRpc31hYmxlX3ZlKCkgYW5kIHZteF92Y3B1X3VwZGF0ZV92bWZ1bmNf
dmUoKSBpcwo+IGRhbmdlcm91cy4gIEFmdGVyICNWRSBoYXMgYmVlbiBzZXQgdXAsIHRoZSBndWVz
dCBjYW4gYmFsbG9vbiBvdXQgYW5kIGZyZWUgdGhlCj4gbm9taW5hdGVkIEdGTiwgYWZ0ZXIgd2hp
Y2ggdGhlIHByb2Nlc3NvciBtYXkgd3JpdGUgdG8gaXQuICBBbHNvLCB0aGUgdW5sb2NrZWQKPiBH
Rk4gcXVlcnkgbWVhbnMgdGhlIE1GTiBpcyBzdGFsZSBieSB0aGUgdGltZSBpdCBpcyB1c2VkLiAg
QWx0ZXJuYXRpdmVseSwgYQo+IGd1ZXN0IGNhbiByYWNlIHR3byBkaXNhYmxlIGNhbGxzIHRvIGNh
dXNlIG9uZSBWTUNTIHRvIHN0aWxsIHJlZmVyZW5jZSB0aGUKPiBub21pbmF0ZWQgR0ZOIGFmdGVy
IHRoZSB0cmFja2luZyBpbmZvcm1hdGlvbiB3YXMgZHJvcHBlZC4KPiAKPiBSZXdvcmsgdGhlIGxv
Z2ljIGZyb20gc2NyYXRjaCB0byBtYWtlIGl0IHNhZmUuCj4gCj4gSG9sZCBhbiBleHRyYSBwYWdl
IHJlZmVyZW5jZSBvbiB0aGUgdW5kZXJseWluZyBmcmFtZSwgdG8gYWNjb3VudCBmb3IgdGhlCj4g
Vk1DUydzIHJlZmVyZW5jZS4gIFRoaXMgbWVhbnMgdGhhdCBpZiB0aGUgR0ZOIGdldHMgYmFsbG9v
bmVkIG91dCwgaXQgaXNuJ3QKPiBmcmVlZCBiYWNrIHRvIFhlbiB1bnRpbCAjVkUgaXMgZGlzYWJs
ZWQsIGFuZCB0aGUgVk1DUyBubyBsb25nZXIgcmVmZXJzIHRvIHRoZQo+IHBhZ2UuCj4gCj4gQSBj
b25zZXF1ZW5jZSBvZiB0aGlzIGlzIHRoYXQgYWx0cDJtX3ZjcHVfZGlzYWJsZV92ZSgpIG5lZWRz
IHRvIGJlIGNhbGxlZAo+IGR1cmluZyB0aGUgZG9tYWluX2tpbGwoKSBwYXRoLCB0byBkcm9wIHRo
ZSByZWZlcmVuY2UgZm9yIGRvbWFpbnMgd2hpY2ggc2h1dAo+IGRvd24gd2l0aCAjVkUgc3RpbGwg
ZW5hYmxlZC4KPiAKPiBGb3IgZG9tYWlucyB1c2luZyBhbHRwMm0sIHdlIGV4cGVjdCBhIHNpbmds
ZSBlbmFibGUgY2FsbCBhbmQgbm8gZGlzYWJsZSBmb3IKPiB0aGUgcmVtYWluaW5nIGxpZmV0aW1l
IG9mIHRoZSBkb21haW4uICBIb3dldmVyLCB0byBhdm9pZCBwcm9ibGVtcyB3aXRoCj4gY29uY3Vy
cmVudCBjYWxscywgdXNlIGNtcHhjaGcoKSB0byBsb2NrbGVzc2x5IG1haW50YWluIHNhZmV0eS4K
PiAKPiBUaGlzIGRvZXNuJ3QgaGF2ZSBhbiBYU0EgYmVjYXVzZSBhbHRwMm0gaXMgbm90IHlldCBh
IHNlY3VyaXR5LXN1cHBvcnRlZAo+IGZlYXR1cmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBSZWxlYXNlLWFja2VkLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpUZXN0ZWQtYnk6IFJhenZhbiBDb2pvY2Fy
dSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
