From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.12 1/8] dom0/pvh: align allocation and
 mapping order to start address
Date: Tue, 5 Feb 2019 10:54:09 +0000
Message-ID: <b4701681-bf77-57d4-d6df-404be74ac28d@citrix.com>
References: <20190130103646.53649-1-roger.pau@citrix.com>
 <20190130103646.53649-2-roger.pau@citrix.com>
 <5C586B3E0200007800213BCA@prv1-mh.provo.novell.com>
 <20190204171108.dud4pm5wynb6cpmj@mac>
 <5C593E4A0200007800213D0F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h/kp=QM=citrix.com=prvs=93293e290=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gqyMs-0001uQ-G7
 for xen-devel@lists.xenproject.org; Tue, 05 Feb 2019 10:54:18 +0000
In-Reply-To: <5C593E4A0200007800213D0F@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDIvMjAxOSAwNzo0MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDQuMDIuMTkg
YXQgMTg6MTEsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIE1vbiwgRmViIDA0
LCAyMDE5IGF0IDA5OjQxOjM0QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24g
MzAuMDEuMTkgYXQgMTE6MzYsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Pj4gRHVl
IHRvIHRoZSByZWNlbnQgY2hhbmdlcyBpbiB0aGUgaW9tbXUgbWFwcGluZyBsb2dpYywgdGhlIHN0
YXJ0Cj4+Pj4gYWRkcmVzc2VzIHByb3ZpZGVkIG5lZWQgdG8gYmUgYWxpZ25lZCB0byB0aGUgb3Jk
ZXIgaW50ZW5kZWQgdG8gYmUKPj4+PiBtYXBwZWQuCj4+PiBJcnJlc3BlY3RpdmUgb2YgeW91ciBy
ZXBseSB0byBXZWkncyBzaW1pbGFyIHJlcXVlc3QgKHdoZXJlIHlvdSd2ZQo+Pj4gcHJvdmlkZWQg
bGlua3MgdG8gbWFpbHMgc2hvd2luZyBjcmFzaGVzKSBJJ2QgbGlrZSB5b3UgdG8gZXhwbGFpbgo+
Pj4gdGhpcyBiZXR0ZXIuIFRoaXMgaXMgaW4gcGFydGljdWxhciBiZWNhdXNlIEkgZG9uJ3QgcmVh
bGx5IHNlZSB3aGF0Cj4+PiAicmVjZW50IGNoYW5nZXMgaW4gdGhlIGlvbW11IG1hcHBpbmcgbG9n
aWMiIHlvdSB0YWxrIGFib3V0Lgo+PiBDb21taXQgNzI1YmYwMGE4N2YgKCJpb21tdSAvIHAybTog
YWRkIGEgcGFnZV9vcmRlciBwYXJhbWV0ZXIgdG8KPj4gaW9tbXVfbWFwL3VubWFwX3BhZ2UoKS4u
LiIpIGFkZGVkIHRoZSBmb2xsb3dpbmcgdHdvIGFzc2VydHMgdG8KPj4gaW9tbXVfbWFwOgo+Pgo+
PiBBU1NFUlQoSVNfQUxJR05FRChkZm5feChkZm4pLCAoMXVsIDw8IHBhZ2Vfb3JkZXIpKSk7Cj4+
IEFTU0VSVChJU19BTElHTkVEKG1mbl94KG1mbiksICgxdWwgPDwgcGFnZV9vcmRlcikpKTsKPj4K
Pj4gUHJldmlvdXNseSBpb21tdV9tYXAgd291bGQgYWRkIHVuYWxpZ25lZCBlbnRyaWVzIHdpdGhv
dXQgY29tcGxhaW5pbmcsCj4+IGJ1dCBub3cgaW4gZGVidWcgYnVpbGRzIHRoZSBhc3NlcnQgd2ls
bCB0cmlnZ2VyLgo+IFJpZ2h0LCBidXQgdGhlIGFzc2VydGlvbnMgd2VyZSBhZGRlZCB0byBlbnN1
cmUgZXhwZWN0ZWQgYmVoYXZpb3IsCj4gbm90IHRvIGNoYW5nZSBhbnl0aGluZy4KCk5vIC0gdGhp
cyBpc24ndCByZWFzb25hYmxlLgoKVGhvc2UgYXNzZXJ0aW9ucyB3ZXJlIGFkZGVkICJiZWNhdXNl
IG5vb25lIHNob3VsZCBiZSB2aW9sYXRpbmcgdGhlbSIuCgpBcyBpdCB0dXJucyBvdXQsIHRoYXQg
ZXhwZWN0YXRpb24gd2FzIGZhbHNlLsKgIFRoZXJlIGFyZSByZWFsIGNvZGVwYXRocwp3aGljaCBk
byB0cmlwIHRoaXMgYXNzZXJ0LCB3aGljaCBmdW5jdGlvbmVkIGNvcnJlY3RseSBiZWZvcmUuCgpU
aGUgdHdvIG9wdGlvbnMgYXJlIHRvIGVpdGhlciB0byBidWdmaXggdGhlIGFzc2VydGlvbiBmYWls
dXJlcyBieQpyZW1vdmluZyB0aGUgYXNzZXJ0aW9ucywgb3IgZG8gc29tZSBjb2RlIGltcHJvdmVt
ZW50IHRvIHVwZGF0ZSBjYWxsZXJzCnRvIGJlIGNvbnNpc3RlbnQgd2l0aCB0aGUgbmV3LCBkaWZm
ZXJlbnQsIGV4cGVjdGF0aW9uLgoKUm9nZXIgd2FzIGNvcnJlY3QgdG8gYmVpbmcgd2l0aC7CoCBU
aGUgSU9NTVUgY29kZSBoYXMgcmVjZW50bHkgc2hpZnRlZApleHBlY3RhdGlvbnMsIGluIGEgd2F5
IHdoaWNoIGN1cnJlbnRseSBtYWxmdW5jdGlvbnMgb25seSBpbiBkZWJ1ZyBidWlsZHMuCgp+QW5k
cmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
