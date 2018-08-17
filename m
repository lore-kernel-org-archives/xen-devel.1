From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v3 13/17] x86/xen: enable Hygon support to
 Xen
Date: Fri, 17 Aug 2018 00:37:53 -0400
Message-ID: <5ce011d7-3905-8b0b-e13e-0ee5163ad5bb__34525.9230038666$1534480599$gmane$org@oracle.com>
References: <cover.1533989492.git.puwen@hygon.cn>
 <2747ad959f07459000f2693a98d237e2b3149ca1.1533989493.git.puwen@hygon.cn>
 <b32887e0-df6e-fb31-d9cd-6b31961c9c2b@oracle.com>
 <0aa44410-47ec-27e2-10d9-c0dc5d2e457a@suse.com>
 <150f6a8d-33e8-a84d-f34b-17bdb7264ebe@oracle.com>
 <16c21c53-2a03-d5fe-9232-8c0e377566a7@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n0u4=la=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fqWWF-00037N-5X
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 04:37:51 +0000
In-Reply-To: <16c21c53-2a03-d5fe-9232-8c0e377566a7@hygon.cn>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pu Wen <puwen@hygon.cn>, Juergen Gross <jgross@suse.com>, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, thomas.lendacky@amd.com, bp@alien8.de, pbonzini@redhat.com, JBeulich@suse.com
Cc: linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMTYvMjAxOCAwOToyOSBBTSwgUHUgV2VuIHdyb3RlOgo+IE9uIDIwMTgvOC8xMiAyMToy
NiwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBPbiAwOC8xMi8yMDE4IDA0OjU1IEFNLCBKdWVy
Z2VuIEdyb3NzIHdyb3RlOgo+Pj4gT24gMTEvMDgvMTggMTY6MzQsIEJvcmlzIE9zdHJvdnNreSB3
cm90ZToKPj4+PiBPbiAwOC8xMS8yMDE4IDA5OjI5IEFNLCBQdSBXZW4gd3JvdGU6Cj4+Pj4+IMKg
IGJvb2wgcG11X21zcl9yZWFkKHVuc2lnbmVkIGludCBtc3IsIHVpbnQ2NF90ICp2YWwsIGludCAq
ZXJyKQo+Pj4+PiDCoCB7Cj4+Pj4+IC3CoMKgwqAgaWYgKGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRv
ciA9PSBYODZfVkVORE9SX0FNRCkgewo+Pj4+PiArwqDCoMKgIGlmIChib290X2NwdV9kYXRhLng4
Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9BTUQgfHwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGJvb3Rf
Y3B1X2RhdGEueDg2X3ZlbmRvciA9PSBYODZfVkVORE9SX0hZR09OKSB7Cj4+Pj4KPj4+PiAnaWYg
KGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciAhPSBYODZfVkVORE9SX0lOVEVMKScgcGxlYXNlLgo+
Pj4gUmVhbGx5PyBYZW4gc3VwcG9ydHMgQ2VudGF1ciwgdG9vLgo+Pgo+PiBWUE1VIGRvZXNuJ3Qg
LS0tIGh5cGVydmlzb3Igd2lsbCBub3QgaW5pdGlhbGl6ZSBpdC4gQmVzaWRlcywgdGhlCj4+IGV4
aXN0aW5nIGNvZGUgd2lsbCBzdGVlciBub24tQU1EIGV4ZWN1dGlvbiB0byBJbnRlbCwgd2hpY2gg
aXMgbm90IHJpZ2h0Cj4+IGVpdGhlci4KPj4KPj4gSSdsbCBhZGQgYSBjaGVjayB0byBiYWlsIGlm
IFZQTVUgaXMgbm90IGluaXRpYWxpemVkIHByb3Blcmx5LCB3ZSBzZWVtIHRvCj4+IGlnbm9yZSB4
ZW5fcG11X2luaXQoKSBmYWlsdXJlcy4gV2hpY2gsIEJUVywgbWFrZXMgdGhpcyBwYXRjaCByYXRo
ZXIKPj4gcG9pbnRsZXNzIHVudGlsIHRoZXJlIGlzIHN1cHBvcnQgZm9yIEh5Z29uIFhlbi4KPgo+
IFNvIHNob3VsZCBpdCBzdGlsbCBuZWVkIHRvIHRlc3QgdmVuZG9yIEh5Z29uIGhlcmUgb3Igd2Fp
dCBmb3IgeW91ciBjaGVjawo+IGRvbmU/CgoKSSdkIHByZWZlciBjaGVja2luZyBmb3IgIUludGVs
LCBhcyBJIHN1Z2dlc3RlZCBhYm92ZS4gQ2VudGF1ciB3aWxsIGZhaWwKZWl0aGVyIHdheSwgYnV0
IGJlY2F1c2Ugd2UgdXNlIHNhZmUgdmVyc2lvbnMgb2YgTVNSIGFjY2VzcyBJIG5vdyB0aGluawp3
ZSBkb24ndCBuZWVkIGFueSBleHRyYSBjaGVja3MgZm9yIHhlbl9wbXVfaW5pdCgpIHJlc3VsdC4K
Ci1ib3JpcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
