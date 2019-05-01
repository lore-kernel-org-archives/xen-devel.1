From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/vm_event: correctly gather gs_shadow
 value
Date: Wed, 1 May 2019 08:50:14 +0100
Message-ID: <602abffd-4cb8-c471-3adb-38d6bc3b1cb9@citrix.com>
References: <20190501042249.1218-1-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2zDm=TB=citrix.com=prvs=017a1499b=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hLk0T-0005wj-UD
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 07:50:21 +0000
In-Reply-To: <20190501042249.1218-1-tamas@tklengyel.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDUvMjAxOSAwNToyMiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IEN1cnJlbnRseSB0
aGUgZ3Nfc2hhZG93IHZhbHVlIGlzIG9ubHkgY2FjaGVkIHdoZW4gdGhlIHZDUFUgaXMgYmVpbmcg
c2NoZWR1bGVkCj4gb3V0IGJ5IFhlbi4gUmVwb3J0aW5nIHRoaXMgKHVzdWFsbHkpIHN0YWxlIHZh
bHVlIHRocm91Z2ggdm1fZXZlbnQgaXMgaW5jb3JyZWN0LAo+IHNpbmNlIGl0IGRvZXNuJ3QgcmVw
cmVzZW50IHRoZSBhY3R1YWwgc3RhdGUgb2YgdGhlIHZDUFUgYXQgdGhlIHRpbWUgdGhlIGV2ZW50
Cj4gd2FzIHJlY29yZGVkLiBUaGlzIHByZXZlbnRzIHZtX2V2ZW50IHN1YnNjcmliZXJzIGZyb20g
Y29ycmVjdGx5IGZpbmRpbmcga2VybmVsCj4gc3RydWN0dXJlcyBpbiB0aGUgZ3Vlc3Qgd2hlbiBp
dCBpcyB0cmFwcGVkIHdoaWxlIGluIHJpbmczLgo+Cj4gU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBM
ZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgo+IENjOiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pv
Y2FydUBiaXRkZWZlbmRlci5jb20+Cj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KPiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBDYzog
V2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiBDYzogUm9nZXIgUGF1IE1vbm5lIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gveDg2L3ZtX2V2ZW50LmMgfCAyICst
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni92bV9ldmVudC5jIGIveGVuL2FyY2gveDg2L3ZtX2V2ZW50
LmMKPiBpbmRleCA1MWMzNDkzYjFkLi40NDY0OTQwZGE3IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNo
L3g4Ni92bV9ldmVudC5jCj4gKysrIGIveGVuL2FyY2gveDg2L3ZtX2V2ZW50LmMKCkFjdHVhbGx5
LCBjb21lIHRvIHRoaW5rIG9mIGl0LCB0aGUgc2FtZSBpcyB0cnVlIGZvciB0aGUgU1lTRU5URVLC
oApkZXRhaWxzLCB3aGljaCBieSBkZWZhdWx0IGFyZSByZWFkL3dyaXRlIHRvIHRoZSBndWVzdCB3
aGlsZSBpdCBpcwpzY2hlZHVsZWQuwqAgQXMgYSByZXN1bHQsIHRoZSBkZXRhaWxzIHJlcG9ydGVk
IGhlcmUgd2lsbCBmcm9tIHRoZSBsYXN0CnZjcHUgY29udGV4dCBzd2l0Y2gsIGFuZCBwb3NzaWJs
eSBzdGFsZS4KCkl0IG1pZ2h0IGJlIHdvcnRoIGludHJvZHVjaW5nIGEgInN5bmMgc3RhdGUgZnJv
bSBodyIgaG9vayB3aGljaCBjb2xsZWN0cwphbGwgdGhlIGRhdGEgd2UgaW50ZW5kIHRvIHBhc3Mg
dG8gdGhlIGludHJvc3BlY3Rpb24gYWdlbnQuCgp+QW5kcmV3IwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
