From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH RFC 02/10] passthrough: split out x86 PCI
 code to x86/pci.c
Date: Mon, 26 Feb 2018 10:57:58 +0000
Message-ID: <c94e282f-99f7-9500-47a7-2ad9238695ba@arm.com>
References: <20180221214701.1646-1-wei.liu2@citrix.com>
 <20180221214701.1646-3-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=pyt4=fu=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1eqGTv-0007ek-Jq
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 10:58:07 +0000
In-Reply-To: <20180221214701.1646-3-wei.liu2@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyMS8wMi8xOCAyMTo0NiwgV2VpIExpdSB3cm90ZToKPiBNb3ZlIHRoZSBmdW5jdGlv
bnMgdGhhdCByZWZlcmVuY2UgeDg2IGh2bSBkYXRhIHN0cnVjdHVyZXMgdG8gaXRzIG93bgo+IGZp
bGUuICBSZW5hbWUgcGNpX2NsZWFuX2RwY2lfaXJxcyB0byBhcmNoX3BjaV9jbGVhbl9pcnFzLgoK
TklUOiBEb3VibGUgc3BhY2UuCgo+IAo+IFRoZXJlIGlzIHN0aWxsIG9uZSBsb2NhdGlvbiBpbiB0
aGF0IGZpbGUgd2hpY2ggcmVmZXJlbmNlcwo+IGFyY2guaHZtX2RvbWFpbiwgYnV0IGl0IGlzIGZp
bmUgYmVjYXVzZSBBUk0gZ3Vlc3QgaXMgSFZNLgoKSSBndWVzcyB5b3UgbWVhbiBodm1fZG9tYWlu
Lm1lbV9zaGFyaW5nX2VuYWJsZWQ/IElmIHNvLCB3ZSBkb24ndCBzdXBwb3J0IAptZW1vcnkgc2hh
cmluZyBvbiBBUk0uIFRoaXMgd291bGQgbmVlZCB0byBiZSBzdHViLgoKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IC0tLQo+IENjOiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ2M6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+Cj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
PiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAKPiBBUk0g
ZG9lc24ndCBzZWxlY3QgSEFTX1BDSSwgdGhhdCdzIHdoeSBBUk0gYnVpbGQgaXMgbm90IGJyb2tl
biBieQo+IHRoaXMuIEFJVUkgQVJNIHdpbGwgc2VsZWN0IEhBU19QQ0kgYXQgc29tZSBwb2ludCwg
aGVuY2UgSSBvbmx5IG1vdmUKPiB0aGUgeDg2IGJpdHMuCgpQb3RlbnRpYWxseSB0aGVyZSBhcmUg
bW9yZSB4ODYtaXNtIGluIHRoYXQgY29kZSBzdWNoIGFzIHRoZSB3YXkgdG8gCmhhbmRsZSBNU0ku
IEFueXdheSwgdGhpcyBwYXRjaCBtYWtlcyBzZW5zZSBmcm9tIGFuIEFybSBwZXJzcGVjdGl2ZToK
CkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQ2hlZXJzLAoK
LS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
