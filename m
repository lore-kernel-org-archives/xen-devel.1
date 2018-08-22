From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 2/2] x86/mmcfg/drhd: Move
 acpi_mmcfg_init() call before calling acpi_parse_dmar()
Date: Wed, 22 Aug 2018 09:36:49 +0200
Message-ID: <20180822073649.5hg5hygkpmw3fsoo@mac>
References: <dc0238dc-8dbd-4c04-aef8-da16e931dcb2@default>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <dc0238dc-8dbd-4c04-aef8-da16e931dcb2@default>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Cc: andrew.cooper3@citrix.com, srinivas.eeda@oracle.com, JBeulich@suse.com, manoj.gopalasetty@hpe.com, david.westwood@hpe.com, boris.ostrovsky@oracle.com, Xen-Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMjEsIDIwMTggYXQgMDk6NTM6MDhQTSAtMDcwMCwgWmhlbnpob25nIER1YW4g
d3JvdGU6Cj4gcGNpX2NvbmZfcmVhZDgoKSBuZWVkcyBwY2kgbW1jZmcgbWFwcGluZyB0byB3b3Jr
IG9uIG11bHRpcGxlIHBjaQo+IHNlZ21lbnRzIHN5c3RlbSBzdWNoIGFzIEhQRSBTdXBlcmRvbWUt
RmxleC4KPiAKPiBNb3ZlIGFjcGlfbW1jZmdfaW5pdCgpIGNhbGwgaW4gYWNwaV9ib290X2luaXQo
KSBiZWZvcmUgY2FsbGluZwo+IGFjcGlfcGFyc2VfZG1hcigpIHNvIHRoYXQgd2hlbiBwY2lfY29u
Zl9yZWFkOCgpIGlzIGNhbGxlZCBpbgo+IGFjcGlfcGFyc2VfZGV2X3Njb3BlKCksIHdlIGFscmVh
ZHkgaGF2ZSB0aGUgbWFwcGluZyBzZXQgdXAuCj4gCj4gbW1pb19yb19yYW5nZXMgaW5pdGlhbGl6
YXRpb24gaXMgYWxzbyBtb3ZlZCBhaGVhZCBhcyBpdCdzIHRoZSBvbmx5Cj4gZGVwZW5kZW5jeSBv
ZiBwY2lfbW1jZmdfYXJjaF9lbmFibGUoKSBuZWVkIHRvIGJlIG1vdmVkLiBBbHNvCj4gY2hlY2tl
ZCBjb2RlcyBiZXR3ZWVuIHRoZSBvbGQgYW5kIG5ldyBjYWxsIHNpdGVzIHRvIGVuc3VyZSB3ZQo+
IGRvbid0IGJyZWFrIGFueXRoaW5nLgo+IAo+IEZ1cnRoZXJtb3JlIE1NQ0ZHIHdpbGwgY29udGlu
dWUgdG8gbm90IHdvcmsgdGhpcyBlYXJseSAob3IKPiBtb3JlIHByZWNpc2VseSBub3QgYXQgYWxs
IHVudGlsIERvbTAgYm9vdCBoYXMgcHJvZ3Jlc3NlZCBmYXIKPiBlbm91Z2gpIGlmIHRoZSByYW5n
ZShzKSBpc24ndC9hcmVuJ3QgbWFya2VkIHJlc2VydmVkIGluIEU4MjAuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogWmhlbnpob25nIER1YW4gPHpoZW56aG9uZy5kdWFuQG9yYWNsZS5jb20+Cj4gVGVzdGVk
LWJ5OiBHb3BhbGFzZXR0eSwgTWFub2ogPG1hbm9qLmdvcGFsYXNldHR5QGhwZS5jb20+CgpMR1RN
OgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoK
SSdtIGhvd2V2ZXIgZmFpbGluZyB0byBmaW5kIHBhdGNoIDEvMiBpbiB0aGlzIHNlcmllcy4gQ291
bGQgeW91IHBsZWFzZQptYWtlIHN1cmUgdGhyZWFkaW5nIGlzIHNldHVwIGNvcnJlY3RseT8KClRo
YW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
