From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [RFC Patch v4 4/8] hvmloader: boot cpu through
 broadcast
Date: Fri, 23 Feb 2018 16:42:10 +0000
Message-ID: <20180223164210.tlhxdl56q536p5e6@MacBook-Pro-de-Roger.local>
References: <1512546614-9937-1-git-send-email-chao.gao@intel.com>
 <1512546614-9937-5-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1512546614-9937-5-git-send-email-chao.gao@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chao Gao <chao.gao@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBEZWMgMDYsIDIwMTcgYXQgMDM6NTA6MTBQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gSW50ZWwgU0RNIEV4dGVuZGVkIFhBUElDIChYMkFQSUMpIC0+ICJJbml0aWFsaXphdGlvbiBi
eSBTeXN0ZW0gU29mdHdhcmUiCj4gaGFzIHRoZSBmb2xsb3dpbmcgZGVzY3JpcHRpb246Cj4gCj4g
IlRoZSBBQ1BJIGludGVyZmFjZXMgZm9yIHRoZSB4MkFQSUMgYXJlIGRlc2NyaWJlZCBpbiBTZWN0
aW9uIDUuMiwg4oCcQUNQSSBTeXN0ZW0KPiBEZXNjcmlwdGlvbiBUYWJsZXMs4oCdIG9mIHRoZSBB
ZHZhbmNlZCBDb25maWd1cmF0aW9uIGFuZCBQb3dlciBJbnRlcmZhY2UKPiBTcGVjaWZpY2F0aW9u
LCBSZXZpc2lvbiA0LjBhIChodHRwOi8vd3d3LmFjcGkuaW5mby9zcGVjLmh0bSkuIFRoZSBkZWZh
dWx0Cj4gYmVoYXZpb3IgZm9yIEJJT1MgaXMgdG8gcGFzcyB0aGUgY29udHJvbCB0byB0aGUgb3Bl
cmF0aW5nIHN5c3RlbSB3aXRoIHRoZQo+IGxvY2FsIHgyQVBJQ3MgaW4geEFQSUMgbW9kZSBpZiBh
bGwgQVBJQyBJRHMgcmVwb3J0ZWQgYnkgQ1BVSUQuMEJIOkVEWCBhcmUgbGVzcwo+IHRoYW4gMjU1
LCBhbmQgaW4geDJBUElDIG1vZGUgaWYgdGhlcmUgYXJlIGFueSBsb2dpY2FsIHByb2Nlc3NvciBy
ZXBvcnRpbmcgYW4KPiBBUElDIElEIG9mIDI1NSBvciBncmVhdGVyLiIKPiAKPiBJbiB0aGlzIHBh
dGNoLCBodm1sb2FkZXIgZW5hYmxlcyB4MmFwaWMgbW9kZSBmb3IgYWxsIHZjcHVzIGlmIHRoZXJl
IGFyZSBjcHVzCj4gd2l0aCBBUElDIElEID4gMjU1LiBUbyB3YWtlIHVwIHByb2Nlc3NvcnMgd2hv
c2UgQVBJQyBJRCBpcyBncmVhdGVyIHRoYW4gMjU1LAo+IHRoZSBTSVBJIGlzIGJyb2FkY2FzdGVk
IHRvIGFsbCBBUHMuIEl0IGlzIHRoZSB3YXkgaG93IFNlYWJpb3Mgd2FrZXMgdXAgQVBzLgo+IEFQ
cyBtYXkgY29tcGV0ZSBmb3IgdGhlIHN0YWNrLCB0aHVzIGEgbG9jayBpcyBpbnRyb2R1Y2VkIHRv
IHByb3RlY3QgdGhlIHN0YWNrLgoKSG0sIGhvdyBhcmUgd2UgZ29pbmcgdG8gZGVhbCB3aXRoIHRo
aXMgb24gUFZIPyBodm1sb2FkZXIgZG9lc24ndCBydW4KZm9yIFBWSCBndWVzdHMsIGhlbmNlIGl0
IHNlZW1zIGxpa2Ugc3dpdGNoaW5nIHRvIHgyQVBJQyBtb2RlIHNob3VsZCBiZQpkb25lIHNvbWV3
aGVyZSBlbHNlIHRoYXQgc2hhcmVkIGJldHdlZW4gSFZNIGFuZCBQVkguCgpNYXliZSB0aGUgaHlw
ZXJjYWxsIHRoYXQgc2V0cyB0aGUgbnVtYmVyIG9mIHZDUFVzIHNob3VsZCBjaGFuZ2UgdGhlCkFQ
SUMgbW9kZT8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
