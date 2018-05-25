From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/5] x86: move definition of struct
 cpuid_leaf to cpuid.h
Date: Fri, 25 May 2018 14:11:37 +0100
Message-ID: <065d508b-deb2-2731-e394-33fb1b36eab9@citrix.com>
References: <20180524160522.757-1-wei.liu2@citrix.com>
 <20180524160522.757-2-wei.liu2@citrix.com>
 <5B07F87402000078001C5E96@prv1-mh.provo.novell.com>
 <20180525120309.6j743pvgwucldvxp@citrix.com>
 <5B080A0E02000078001C5EED@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=j+m0=im=citrix.com=prvs=676bf93bc=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fMCVQ-00056A-To
 for xen-devel@lists.xenproject.org; Fri, 25 May 2018 13:11:40 +0000
In-Reply-To: <5B080A0E02000078001C5EED@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjUvMDUvMTggMTQ6MDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI1LjA1LjE4IGF0
IDE0OjAzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIEZyaSwgTWF5IDI1LCAy
MDE4IGF0IDA1OjUwOjEyQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMjQu
MDUuMTggYXQgMTg6MDUsIDx3ZWkubGl1MkBjaXRyaXguY29tPiB3cm90ZToKPj4+PiBUaGlzIGlz
IGEgc3RlcCB0b3dhcmRzIGNvbnNvbGlkYXRpbmcgcmVsZXZhbnQgZGF0YSBzdHJ1Y3R1cmVzIGFu
ZAo+Pj4+IGRlZmluZXMgdG8gb25lIGxvY2F0aW9uLgo+Pj4gU29ydCBvZiBjb250cmFyeSB0byB3
aGF0IHRoZSBwYXRjaCBkb2VzIC0gaXQgY29udmVydHMgb25lIGluc3RhbmNlIG9mIHRoZQo+Pj4g
c3RydWN0dXJlIHRvIHR3byBvZiB0aGVtLgo+PiBCdXQgaXNuJ3QgdGhpcyB0ZXN0IGhhcm5lc3Mg
YW4gZXhjZXB0aW9uIHRvIGhvdyB0aGluZ3MgYXJlIG5vcm1hbGx5Cj4+IGRvbmU/IEkgZG9uJ3Qg
dGhpbmsgeDg2IGluc24gZW11bGF0b3IgaXMgYXMgc3RhbmRhbG9uZSBhcyBvdGhlcgo+PiBjb21w
b25lbnRzLgo+IEZBT0Q6IEkgZG9uJ3QgcmVhbGx5IG1pbmQgdGhlIG1vdmVtZW50LiBJIGRvIHRo
aW5rLCB0aG91Z2gsIHRoYXQgdGhlCj4gZGVzY3JpcHRpb24gZG9lc24ndCBtYXRjaCB3aGF0IHRo
ZSBwYXRjaCBkb2VzLgo+Cj4+IEkgbmV2ZXIgdW5kZXJzdG9vZCB3aHkgY3B1aWRfbGVhZiB3YXMg
cHV0IGludG8geDg2X2VtdWxhdGUuaCBpbiB0aGUKPj4gZmlyc3QgcGxhY2UuIEkgdHJpZWQgdG8g
Y29udmVydCBpdCB0byB1c2UgY3B1aWQuaCBidXQgdGhhdCBvcGVuZWQgYW4KPj4gZXZlbiBiaWdn
ZXIgY2FuIG9mIHdvcm1zLgo+IEkgZ3Vlc3MgdGhhdCdzIHRoZSByZWFzb24geW91J3JlIGxvb2tp
bmcgZm9yLgoKWWVzIC0gY3B1aWRfbGVhZiBpcyB1c2VkIGluIHRoZSBjcHVpZCgpIGhvb2ssIHdo
aWNoIGlzIHdoeSBpdCBpcwpuZWNlc3NhcnkgaGVyZS7CoCBUaGF0IHNhaWQsIGJ5IHNwbGl0dGlu
ZyBpdCAoYW5kIG90aGVyIGJpdHMpIG91dCBpbnRvIGEKc2hhcmVkIGhlYWRlciwgdGhpcyBkaXNl
bnRhbmdsZXMgaXRzZWxmIG5pY2VseS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
