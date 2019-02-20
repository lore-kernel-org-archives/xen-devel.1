From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH 3/4] x86/vmx: Fix security issue when a
 guest balloons out the #VE info page
Date: Wed, 20 Feb 2019 11:45:09 +0200
Message-ID: <d93f2d4d-80bb-3422-1580-9d17911c59a4@bitdefender.com>
References: <1550614715-21161-1-git-send-email-andrew.cooper3@citrix.com>
 <1550614715-21161-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1550614715-21161-4-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi8yMC8xOSAxMjoxOCBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgbG9naWMgaW4g
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
b25zZXF1ZW5jZSBvZiB0aGlzIGlzIHRoYXQgYXJjaF92Y3B1X3VubWFwX3Jlc291cmNlcygpIG5v
dyBuZWVkcyB0byBjYWxsCj4gYWx0cDJtX3ZjcHVfZGlzYWJsZV92ZSgpIHRvIGRyb3AgdGhlIHJl
ZmVyZW5jZSBkdXJpbmcgZG9tYWluX2tpbGwoKSwgdG8gYWxsb3cKPiBhbGwgb2YgdGhlIG1lbW9y
eSB0byBiZSBmcmVlZC4KPiAKPiBGb3IgZG9tYWlucyB1c2luZyBhbHRwMm0sIHdlIGV4cGVjdCBh
IHNpbmdsZSBlbmFibGUgY2FsbCBhbmQgbm8gZGlzYWJsZSBmb3IKPiB0aGUgcmVtYWluaW5nIGxp
ZmV0aW1lIG9mIHRoZSBkb21haW4uICBIb3dldmVyLCB0byBhdm9pZCBwcm9ibGVtcyB3aXRoCj4g
Y29uY3VycmVudCBjYWxscywgdXNlIGNtcHhjaGcoKSB0byBsb2NrbGVzc2x5IG1haW50YWluIHNh
ZmV0eS4KPiAKPiBUaGlzIGRvZXNuJ3QgaGF2ZSBhbiBYU0EgYmVjYXVzZSBhbHRwMm0gaXMgbm90
IHlldCBhIHNlY3VyaXR5LXN1cHBvcnRlZAo+IGZlYXR1cmUuCj4gCj4gU2lnbmVkLW9mZi1ieTog
QW5kcmV3IENvb3BlcjxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKVGVzdGVkLWJ5OiBSYXp2
YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+CgoKVGhhbmtzLApSYXp2YW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
