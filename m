From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] mm/page_alloc: fix MEMF_no_dma
 allocations for single NUMA
Date: Tue, 08 Jan 2019 08:52:27 -0700
Message-ID: <5C34C73B020000780020B5ED@prv1-mh.provo.novell.com>
References: <20190108154530.11400-1-sergey.dyasli@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20190108154530.11400-1-sergey.dyasli@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjAxLjE5IGF0IDE2OjQ1LCA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPiB3cm90
ZToKPiBDdXJyZW50bHkgZG1hX2JpdHNpemUgaXMgemVybyBieSBkZWZhdWx0IG9uIHNpbmdsZSBO
VU1BIG5vZGUgbWFjaGluZXMuCj4gVGhpcyBtYWtlcyBhbGwgYWxsb2NfZG9taGVhcF9wYWdlcygp
IGNhbGxzIHdpdGggTUVNRl9ub19kbWEgcmV0dXJuIE5VTEwuCj4gCj4gVGhlcmUgaXMgb25seSAx
IHVzZXIgb2YgTUVNRl9ub19kbWE6IGRvbTBfbWVtZmxhZ3MsIHdoaWNoIGFyZSB1c2VkCj4gZHVy
aW5nIG1lbW9yeSBhbGxvY2F0aW9uIGZvciBEb20wLiBGYWlsaW5nIGFsbG9jYXRpb24gd2l0aCBk
ZWZhdWx0Cj4gZG9tMF9tZW1mbGFncyBpcyBlc3BlY2lhbGx5IHNldmVyZSBmb3IgdGhlIFBWIERv
bTAgY2FzZTogaXQgbWFrZXMKPiBhbGxvY19jaHVuaygpIHRvIHVzZSBzdWJvcHRpbWFsIDJNQiBh
bGxvY2F0aW9uIGFsZ29yaXRobSB3aXRoIGEgc2VhcmNoCj4gZm9yIGhpZ2hlciBtZW1vcnkgYWRk
cmVzc2VzLgo+IAo+IFRoaXMgY2FuIGxlYWQgdG8gdGhlIE5NSSB3YXRjaGRvZyB0aW1lb3V0IGR1
cmluZyBQViBEb20wIGNvbnN0cnVjdGlvbgo+IG9uIHNvbWUgbWFjaGluZXMsIHdoaWNoIGNhbiBi
ZSB3b3JrZWQgYXJvdW5kIGJ5IHNwZWNpZnlpbmcgImRtYV9iaXRzIgo+IGluIFhlbidzIGNtZGxp
bmUgbWFudWFsbHkuCj4gCj4gRml4IHRoZSBpc3N1ZSBieSBpZ25vcmluZyBNRU1GX25vX2RtYSBp
biBjYXNlcyB3aGVuIGRtYV9iaXRzaXplIGlzIHplcm8sCj4gd2hpY2ggbWVhbnMgdGhlcmUgaXMg
bm8gRE1BIHpvbmUuIFRoaXMgc2hvdWxkbid0IGNhdXNlIGFueSBpc3N1ZXMgZm9yCj4gRG9tMCBi
ZWNhdXNlIGFsbG9jX2hlYXBfcGFnZXMoKSB3aWxsIGZpcnN0IHVzZSBoaWdoZXIgbWVtb3J5IGFk
ZHJlc3Nlcwo+IGZvciBzYXRpc2Z5aW5nIG1lbW9yeSBhbGxvY2F0aW9uIHJlcXVlc3RzLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4K
ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cihjb3VsZCBhbHNv
IGJlIFN1Z2dlc3RlZC1ieSkKCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
