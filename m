From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 10/16] x86: don't setup legacy syscall
 vector when !CONFIG_PV
Date: Mon, 22 Oct 2018 12:21:01 +0100
Message-ID: <de402941-79c3-8f6d-9d10-324f07088f46@citrix.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <88a2440e85ce60162b6d7284530be7a2ab8ccbbc.1539959287.git-series.wei.liu2@citrix.com>
 <0818388d-cdf7-2581-cc2a-bbb15f5cee17@citrix.com>
 <20181022111235.az4o3k7wcewhiorq@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tti2=nc=citrix.com=prvs=826755171=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gEYGd-0002zj-JX
 for xen-devel@lists.xenproject.org; Mon, 22 Oct 2018 11:21:03 +0000
In-Reply-To: <20181022111235.az4o3k7wcewhiorq@zion.uk.xensource.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMTAvMTggMTI6MTIsIFdlaSBMaXUgd3JvdGU6Cj4gT24gRnJpLCBPY3QgMTksIDIwMTgg
YXQgMDU6MDk6NDNQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTkvMTAvMTgg
MTU6MjgsIFdlaSBMaXUgd3JvdGU6Cj4+PiBQdXQgdGhlIGNvZGUgaW4gc21wYm9vdC5jIHVuZGVy
IENPTkZJR19QVi4gTm90IHRoYXQgd2UgZG9uJ3QgbmVlZCB0bwo+Pj4gc2V0IHVwIGEgc3R1YiBo
ZXJlIGJlY2F1c2UgZW50cnkuUyBhbHJlYWR5IGRvZXMgdGhhdC4KPj4+Cj4+PiBTaWduZWQtb2Zm
LWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+PiBUaGUgc3R1YiBpc24ndCB0aGUg
cHVycG9zZSBvZiB0aGUgY29kZS7CoCBUaGlzIGNvZGUgaXMgdG8gc3dpdGNoIGJldHdlZW4KPj4g
U1lTX0RFU0NfdHJhcF9nYXRlIGFuZCBTWVNfREVTQ19pcnFfZ2F0ZSBkZXBlbmRpbmcgb24gd2hl
dGhlciB3ZSdyZQo+PiBpbnRlbmRpbmcgdG8gdXNlIFhQVEkuwqAgQWxsIG90aGVyIGRldGFpbHMg
aW4gdGhlIElEVCBlbnRyeSBhcmUgYWxyZWFkeQo+PiBjb25maWd1cmVkIGNvcnJlY3RseSBmb3Ig
aW50ODBfZGlyZWN0X3RyYXAuCj4+Cj4+IFRoZSBwYXRjaCBpcyBmaW5lLCBidXQgd2l0aCBhbiB0
d2Vha2VkIGNvbW1pdCBtZXNzYWdlLCBSZXZpZXdlZC1ieToKPj4gQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBJIGhhdmUgdXBkYXRlZCB0aGUgY29tbWl0IG1lc3Nh
Z2UgdG8gdGhlIGZvbGxvd2luZzoKPgo+IFRoZSBjb2RlIHNuaXBwZXQgaXMgdG8gc3dpdGNoIGJl
dHdlZW4gU1lTX0RFQ1NfdHJhcF9nYXRlIGFuZAo+IFNZU19ERVNDX2lycV9nYXRlIGRlcGVuZGlu
ZyBvbiB3aGV0aGVyIFhQVEkgaXMgdXNlZC4gV2hlbiBQViBpcyBkaXNhYmxlZAo+IHRoZXJlIGlz
IG5vIG5lZWQgdG8gc3dpdGNoLgo+Cj4gRG9lcyB0aGF0IGxvb2sgT0sgdG8geW91PwoKWXVwLgoK
fkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
