From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12 1/8] dom0/pvh: align allocation and
 mapping order to start address
Date: Tue, 05 Feb 2019 00:42:02 -0700
Message-ID: <5C593E4A0200007800213D0F@prv1-mh.provo.novell.com>
References: <20190130103646.53649-1-roger.pau@citrix.com>
 <20190130103646.53649-2-roger.pau@citrix.com>
 <5C586B3E0200007800213BCA@prv1-mh.provo.novell.com>
 <20190204171108.dud4pm5wynb6cpmj@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tSsM=QM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gqvMz-0008Ls-Vm
 for xen-devel@lists.xenproject.org; Tue, 05 Feb 2019 07:42:14 +0000
In-Reply-To: <20190204171108.dud4pm5wynb6cpmj@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjAyLjE5IGF0IDE4OjExLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgRmViIDA0LCAyMDE5IGF0IDA5OjQxOjM0QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMzAuMDEuMTkgYXQgMTE6MzYsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gRHVlIHRvIHRoZSByZWNlbnQgY2hhbmdlcyBpbiB0aGUgaW9tbXUgbWFwcGlu
ZyBsb2dpYywgdGhlIHN0YXJ0Cj4+ID4gYWRkcmVzc2VzIHByb3ZpZGVkIG5lZWQgdG8gYmUgYWxp
Z25lZCB0byB0aGUgb3JkZXIgaW50ZW5kZWQgdG8gYmUKPj4gPiBtYXBwZWQuCj4+IAo+PiBJcnJl
c3BlY3RpdmUgb2YgeW91ciByZXBseSB0byBXZWkncyBzaW1pbGFyIHJlcXVlc3QgKHdoZXJlIHlv
dSd2ZQo+PiBwcm92aWRlZCBsaW5rcyB0byBtYWlscyBzaG93aW5nIGNyYXNoZXMpIEknZCBsaWtl
IHlvdSB0byBleHBsYWluCj4+IHRoaXMgYmV0dGVyLiBUaGlzIGlzIGluIHBhcnRpY3VsYXIgYmVj
YXVzZSBJIGRvbid0IHJlYWxseSBzZWUgd2hhdAo+PiAicmVjZW50IGNoYW5nZXMgaW4gdGhlIGlv
bW11IG1hcHBpbmcgbG9naWMiIHlvdSB0YWxrIGFib3V0Lgo+IAo+IENvbW1pdCA3MjViZjAwYTg3
ZiAoImlvbW11IC8gcDJtOiBhZGQgYSBwYWdlX29yZGVyIHBhcmFtZXRlciB0bwo+IGlvbW11X21h
cC91bm1hcF9wYWdlKCkuLi4iKSBhZGRlZCB0aGUgZm9sbG93aW5nIHR3byBhc3NlcnRzIHRvCj4g
aW9tbXVfbWFwOgo+IAo+IEFTU0VSVChJU19BTElHTkVEKGRmbl94KGRmbiksICgxdWwgPDwgcGFn
ZV9vcmRlcikpKTsKPiBBU1NFUlQoSVNfQUxJR05FRChtZm5feChtZm4pLCAoMXVsIDw8IHBhZ2Vf
b3JkZXIpKSk7Cj4gCj4gUHJldmlvdXNseSBpb21tdV9tYXAgd291bGQgYWRkIHVuYWxpZ25lZCBl
bnRyaWVzIHdpdGhvdXQgY29tcGxhaW5pbmcsCj4gYnV0IG5vdyBpbiBkZWJ1ZyBidWlsZHMgdGhl
IGFzc2VydCB3aWxsIHRyaWdnZXIuCgpSaWdodCwgYnV0IHRoZSBhc3NlcnRpb25zIHdlcmUgYWRk
ZWQgdG8gZW5zdXJlIGV4cGVjdGVkIGJlaGF2aW9yLApub3QgdG8gY2hhbmdlIGFueXRoaW5nLiBJ
dCB3YXMgYSBidWcgdG8gY2FsbCB0aGUgZnVuY3Rpb25zIHdpdGhvdXQKc3VpdGFibHkgYWxpZ25l
ZCBmcmFtZSBudW1iZXJzLgoKPiBNYXliZSBhZGRpbmcgYSAnRml4ZXMnIHRhZyB3b3VsZCBoZWxw
IGlkZW50aWZ5aW5nIHdoYXQgdGhpcyBjb21taXQgaXMKPiB0cnlpbmcgdG8gYWRkcmVzcz8KClll
cywgYnV0IGFzIHBlciBhYm92ZSBpdCB3b3VsZG4ndCBiZSB0aGUgY29tbWl0IGFkZGluZyB0aGUg
YXNzZXJ0aW9ucwp0aGF0IHRoZSBvbmUgaGVyZSBmaXhlcyAoYW5kIGhlbmNlIEkgdGhpbmsgdGhl
IHdvcmRpbmcgb2YgdGhlIGNvbW1pdAptZXNzYWdlIG91Z2h0IHRvIGNoYW5nZSBhcyB3ZWxsKS4K
CkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
