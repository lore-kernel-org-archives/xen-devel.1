From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] x86/dmar: zap DMAR signature for dom0
 once in TBOOT case
Date: Mon, 20 Aug 2018 09:44:22 +0100
Message-ID: <91fba9e6-3639-f114-42a6-1057ce461c75@citrix.com>
References: <787bc1e4-3175-4123-80a3-74d2dc1b2d7f@default>
 <5B7A7C2702000078001DFCDF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B7A7C2702000078001DFCDF@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Zhenzhong Duan <zhenzhong.duan@oracle.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Shane Wang <shane.wang@intel.com>, Srinivas REDDY Eeda <srinivas.eeda@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen-Devel <xen-devel@lists.xen.org>, Gang Wei <gang.wei@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDgvMjAxOCAwOTozMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjAuMDguMTgg
YXQgMDU6MzIsIDx6aGVuemhvbmcuZHVhbkBvcmFjbGUuY29tPiB3cm90ZToKPj4gV2hlbiBUQk9P
VCBlbmFibGVkLCBhY3BpX3BhcnNlX2RtYXIoKSB6YXAgYSBjb3B5IG9mIERNQVIgdGFibGUgcmF0
aGVyCj4+IHRoYW4gdGhlIHJlYWwgdGFibGUsIHNvIG1ha2UgaXQgY29udHJvbGVkIGJ5IGNvbmZp
ZyBvcHRpb24gYmFzZWQgb24gdGhlCj4+IGZhY3QgdGhhdCB3ZSBhbHJlYWR5IGhhdmUgZG9uZSB0
aGUgcmVhbCB6YXBwaW5nIGluIHRib290X3BhcnNlX2RtYXJfdGFibGUoKS4KPiBJcyB0aGlzIGp1
c3QgYSBjb3NtZXRpYyBjaGFuZ2UsIG9yIGlzIHRoZXJlIGFueSBoYXJtIGRvbmUgYnkgdGhlIGV4
dHJhCj4gemFwcGluZz8KCkJlZm9yZSAxMjNjNzc5Mzc5NzUwMmIyMjIzMDBlYjcxMGNkMzg3M2Rj
Y2E0MWVlLCBjYWxsaW5nIGl0IG11bHRpcGxlCnRpbWVzIHdvdWxkIHJlcXVpcmUgYW4gZXF1aXZh
bGVudCBudW1iZXIgb2YgcmVpbnN0YXRlIGNhbGxzIGZvciBpdCB0byB3b3JrLgoKVGhhdCBjaGFu
Z2Ugd2VudCBpbnRvIFhlbiA0LjYsIHdoZXJlYXMgSSBndWVzcyB0aGlzIGlzIGEgcGF0Y2ggYmVp
bmcKdXBzdHJlYW1lZCBmcm9tIE9yYWNsZXMgNC40IHBhdGNocXVldWU/Cgp+QW5kcmV3CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
