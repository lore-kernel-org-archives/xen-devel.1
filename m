From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] iommu: leave IOMMU enabled by default
 during kexec crash transition
Date: Tue, 19 Feb 2019 21:19:20 +0000
Message-ID: <267c5ebf-7a72-8e65-966e-eefd2da2f2c0@citrix.com>
References: <1550506867-26221-1-git-send-email-igor.druzhinin@citrix.com>
 <e10e56f7-0da9-3e30-1f50-c1f9ab16dcb1@citrix.com>
 <5C6BB3920200007800217DAD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=riu8=Q2=citrix.com=prvs=9462ceaa8=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gwCoT-0007BW-QE
 for xen-devel@lists.xenproject.org; Tue, 19 Feb 2019 21:20:25 +0000
In-Reply-To: <5C6BB3920200007800217DAD@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDIvMjAxOSAwNzo0MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4KPj4+IEFuIG9wdGlvbiBp
cyBsZWZ0IGZvciBjb21wYXRpYmlsaXR5IHdpdGggYW5jaWVudCBjcmFzaCBrZXJuZWxzIHdoaWNo
Cj4+PiBkaWRuJ3QgbGlrZSB0byBoYXZlIElPTU1VIGFjdGl2ZSB1bmRlciB0aGVpciBmZWV0IG9u
IGJvb3QuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhp
bmluQGNpdHJpeC5jb20+Cj4+IFRvIHByb3ZpZGUgYSBiaXQgb2YgZXh0cmEgYmFja2dyb3VuZCwg
aXQgdHVybnMgb3V0IHRoYXQgaW4gaGluZHNpZ2h0LAo+PiB0dXJuaW5nIG9mZiB0aGUgSU9NTVUg
aW4gYSBjcmFzaCB1c3VhbGx5IG1ha2VzIHRoaW5ncyB3b3JzZSByYXRoZXIgdGhhbgo+PiBiZXR0
ZXIuCj4gRm9yIGFuIHVua25vd24gZGVmaW5pdGlvbiBvZiAidXN1YWxseSIuIENvcnJ1cHRlZCAo
SU9NTVUpIHBhZ2UKPiB0YWJsZXMgYXJlIG5vdCByZWFsbHkgYW4gaW1wb3NzaWJsZSBjcmFzaCBy
ZWFzb24uCgpBbmQ/wqAgV2h5IGlzIHRoaXMgcmVsZXZhbnQgaW4gY29udGV4dD8KCj4KPj4gSW4g
cGFydGljdWxhciwgYW55IGd1ZXN0IHdpdGggYSBQQ0kgZGV2aWNlIHdoaWNoIGhhcHBlbnMgdG8g
YWxsb2NhdGUgYQo+PiBETUEgYnVmZmVyIGluIEdGTiBzcGFjZSB3aGljaCBtYXRjaGVzIHRoZSBj
cmFzaCByZWdpb24gaW4gTUZOIHNwYWNlIHdpbGwKPj4gZW5kIHVwIGNvcnJ1cHRpbmcgdGhlIGNy
YXNoIGtlcm5lbCB3aGVuIERNQSByZW1hcHBpbmcgZ2V0cyB0dXJuZWQgb2ZmLgo+IEluZGVlZCwg
YnV0IHRoYXQncyBvbmx5IFBWSCBEb20wICh1bnN1cHBvcnRlZCBhcyBvZiB5ZXQpIG9yIFBWCj4g
RG9tMCB1c2luZyBQViBJT01NVSBmdW5jdGlvbmFsaXR5IChub3QgZXZlbiBpbiB0cmVlIGFzIG9m
IHlldCkuCgpJdCBpcyBldmVyeSBzaW5nbGUgSFZNIGd1ZXN0IHdpdGggYSBQQ0kgZGV2aWNlLgoK
VGhlIGtleGVjL2NyYXNoIHBhdGggaXMgdmVyeSBicm9rZW4gYWxyZWFkeSBpbiBYZW4gYXMgc29v
biBhcyBhbnkga2luZApvZiBQQ0kgUGFzc3Rocm91Z2ggaXMgaW4gdXNlLgoKPj4gQmVpbmcgYWJs
ZSB0byBib290IHdpdGggYW4gSU9NTVUgYWxyZWFkeSBhY3RpdmUgaXMgYmVjb21pbmcgY29tbW9u
LCBub3QKPj4gbGVhc3QgYmVjYXVzZSBvZiB0aGUgb25nb2luZyBlZmZvcnRzIHRvIGVuZm9yY2Ug
cHJlLURYRSBETUEgcHJvdGVjdGlvbgo+PiB0byBwcm90ZWN0IGFnYWluc3QgY29sZC1ib290IERN
QSByb290a2l0cy4KPiBXaGF0IGFib3V0IHRoZSBpbnRlcnJ1cHQgcmVtYXBwaW5nIHBhcnQgb2Yg
dGhlIElPTU1VIGZ1bmN0aW9uYWxpdHk/CgpXaGF0IGFib3V0IGl0P8KgIEl0IGlzIGEgbmVjZXNz
YXJ5IHBhcnQgb2YgcHJvdGVjdGlvbiBhZ2FpbnN0IHJvZ3VlIGRldmljZXMuCgp+QW5kcmV3Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
