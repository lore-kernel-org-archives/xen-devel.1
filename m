From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC Patch v4 8/8] x86/hvm: bump the maximum number
 of vcpus to 512
Date: Fri, 23 Feb 2018 01:50:05 -0700
Message-ID: <5A8FE3CD02000078001AABEB@prv-mh.provo.novell.com>
References: <1512546614-9937-1-git-send-email-chao.gao@intel.com>
 <1512546614-9937-9-git-send-email-chao.gao@intel.com>
 <20180222184627.nq3iu2xovifcm6gb@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180222184627.nq3iu2xovifcm6gb@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Chao Gao <chao.gao@intel.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAyLjE4IGF0IDE5OjQ2LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gV2VkLCBEZWMgMDYsIDIwMTcgYXQgMDM6NTA6MTRQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9odm0vaHZtX2luZm9fdGFibGUuaAo+PiArKysg
Yi94ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL2h2bV9pbmZvX3RhYmxlLmgKPj4gQEAgLTMyLDcgKzMy
LDcgQEAKPj4gICNkZWZpbmUgSFZNX0lORk9fUEFERFIgICAgICAgKChIVk1fSU5GT19QRk4gPDwg
MTIpICsgSFZNX0lORk9fT0ZGU0VUKQo+PiAgCj4+ICAvKiBNYXhpbXVtIHdlIGNhbiBzdXBwb3J0
IHdpdGggY3VycmVudCB2TEFQSUMgSUQgbWFwcGluZy4gKi8KPj4gLSNkZWZpbmUgSFZNX01BWF9W
Q1BVUyAgICAgICAgMTI4Cj4+ICsjZGVmaW5lIEhWTV9NQVhfVkNQVVMgICAgICAgIDUxMgo+IAo+
IEkgY2hlY2tlZCBhIGZldyBwbGFjZXMgd2hlcmUgdGhpcyBpcyB1c2VkLCBidW1waW5nIHRoZSBu
dW1iZXIgZG9lc24ndAo+IHNlZW0gdG8gYmUgaGFybWZ1bCBvbiB0aGUgc3VyZmFjZS4KPiAKPiBP
ZiBjb3Vyc2UgdGhlcmUgaXMgdGhlIHF1ZXN0aW9uIGhvdyBtYW55IENQVXMgY2FuIHVwc3RyZWFt
IHN1cHBvcnQsCj4gSSB0aGluayBpdCBpcyBzdGlsbCB1bmRlciBhcmd1bWVudCBhdCB0aGUgbW9t
ZW50LgoKTGVhdmluZyB0aGUgbGF0dGVyIGFzaWRlLCBpdCBpcyBuZXZlciBva2F5IHRvIHNpbXBs
eSBjaGFuZ2UgYSAjZGVmaW5lCmluIHRoZSBwdWJsaWMgaW50ZXJmYWNlLiBTZWUgZS5nLiBmYjQ0
MmUyMTcxICgieDg2XzY0OiBhbGxvdyBtb3JlCnZDUFUtcyBwZXIgZ3Vlc3QiKSwgd2hlcmUgd2Un
dmUgYWxyZWFkeSBnb25lIGEgc29tZXdoYXQgaGFyc2gKcm91dGUgYnkgZHJvcHBpbmcgdGhlIG9y
aWdpbmFsICNkZWZpbmUgYWx0b2dldGhlciAodGh1cyBhdCBsZWFzdApjYXVzaW5nIGJ1aWxkIGZh
aWx1cmVzIGZvciBjb25zdW1lcnMpLCB0YWtpbmcgdGhlIHBvc2l0aW9uIHRoYXQgaXQKd2Fzbid0
IGNvcnJlY3QgdG8gZXhwb3NlIHRoZSB2YWx1ZSBpbiB0aGUgZmlyc3QgcGxhY2UuCgpIZW5jZSBh
dCB0aGUgdmVyeSBsZWFzdCBJIGNhbid0IHNlZSBob3cgc3RydWN0IGh2bV9pbmZvX3RhYmxlCihp
biB0aGUgc2FtZSBwdWJsaWMgaGVhZGVyKSBjYW4gYmUgbGVmdCBhbG9uZSB3aXRoIHRoaXMgY2hh
bmdlLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
