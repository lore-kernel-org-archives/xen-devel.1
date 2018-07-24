From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 5/6] x86/HVM: prefill cache with PDPTEs when
 possible
Date: Tue, 24 Jul 2018 01:44:09 -0600
Message-ID: <5B56D8C902000078001D6FD5@prv1-mh.provo.novell.com>
References: <5B506A6E02000078001D5D17@prv1-mh.provo.novell.com>
 <5B506CE302000078001D5D8A@prv1-mh.provo.novell.com>
 <2fa046b9-9d6f-caa0-d400-804f92332d2e@citrix.com>
 <5B507A6102000078001D5DDD@prv1-mh.provo.novell.com>
 <65e2cc63-e956-86ca-2c46-55dd0157ae9e@citrix.com>
 <5B50DA850200007800137618@prv1-mh.provo.novell.com>
 <95a0aace-ae9b-6595-978c-05a1de712f6c@citrix.com>
 <5B50DFE70200007800137635@prv1-mh.provo.novell.com>
 <4ba21c83-e1e5-fa2b-01e0-04f2b92b79aa@citrix.com>
 <5B56CF6402000078001D6F89@prv1-mh.provo.novell.com>
 <3849db3f-efe0-d0dd-e428-8f28d5a0e323@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vgmm=ki=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fhrzW-0000ht-99
 for xen-devel@lists.xenproject.org; Tue, 24 Jul 2018 07:44:18 +0000
In-Reply-To: <3849db3f-efe0-d0dd-e428-8f28d5a0e323@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjA3LjE4IGF0IDA5OjI3LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAy
NC8wNy8xOCAwOTowNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDE5LjA3LjE4IGF0IDIx
OjA3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBPaCAtIEknZCBub3Qg
bG9va2VkIGluIHRoYXQgbXVjaCBkZXRhaWwgYXQgeW91ciBhbGdvcml0aG0uICBBcyBhIGZpcnN0
Cj4+PiBndXQgZmVlbCwgdGFnZ2luZyBieSBsZXZlbCBkb2Vzbid0IHNvdW5kIGFzIGlmIGl0IHdp
bGwgaW50ZXJhY3QKPj4+IGNvcnJlY3RseSB3aXRoIGxpbmVhciBwYWdldGFibGVzLgo+Pj4KPj4+
IEJvdGggdGhlIEludGVsIGFuZCBBTUQgT1JNJ3MgbWFpbnRhaW4gcGFnaW5nIHN0cnVjdHVyZSBj
YWNoZXMgc28gSSdkCj4+PiBleHBlY3QgdGhhdCBhIGxpbmVhciBwYWdldGFibGUgZW50cnkgd291
bGQgYmUgc2VydmVkIGZyb20gdGhhdCBjYWNoZQo+Pj4gcmF0aGVyIHRoYW4gYmVpbmcgcmVhZCB0
d2ljZSBmcm9tIFJBTS4KPj4gCj4+IElzIHRoZXJlIGFueXdoZXJlIGVub3VnaCBkZXRhaWwgYWJv
dXQgdGhlIGFjdHVhbCBpbXBsZW1lbnRhdGlvbiBvZgo+PiB0aGUgcGFnaW5nIHN0cnVjdHVyZSBj
YWNoZXM/IEkgY291bGQgaW1hZ2luZSB0aGVtIGJlaW5nIHBlciBsZXZlbC4gSXQKPj4gd291bGRu
J3QgYmUgdmVyeSBkaWZmaWN1bHQgdG8gc3dpdGNoIHRvIGEgdHJpc3RhdGUgaGVyZSAobm9ybWFs
IGRhdGEsCj4+IHBhZ2UgdGFibGUsIGFuZCBQQUUgTDMpLgo+PiAKPiAKPiBGcm9tIGh0dHBzOi8v
d3d3LmNzLnJpY2UuZWR1L0NTL0FyY2hpdGVjdHVyZS9kb2NzL2JhcnItaXNjYTEwLnBkZiA6Cj4g
Cj4gVGhlcmVmb3JlLCBib3RoIEFNRCBhbmQgSW50ZWwgaGF2ZSBpbXBsZW1lbnRlZCBNTVUKPiBj
YWNoZXMgZm9yIHBhZ2UgdGFibGUgZW50cmllcyBmcm9tIHRoZSBoaWdoZXIgbGV2ZWxzIG9mIHRo
ZSB0cmVlIFszLAo+IDldLiBIb3dldmVyLCB0aGVpciBjYWNoZXMgaGF2ZSBxdWl0ZSBkaWZmZXJl
bnQgc3RydWN0dXJlLiBGb3IgZXhhbS0KPiBwbGUsIEFNROKAmXMgUGFnZSBXYWxrIENhY2hlIHN0
b3JlcyBwYWdlIHRhYmxlIGVudHJpZXMgZnJvbSBhbnkKPiBsZXZlbCBvZiB0aGUgdHJlZSwgd2hl
cmVhcyBJbnRlbCBpbXBsZW1lbnRzIGRpc3RpbmN0IGNhY2hlcyBmb3IgZWFjaAo+IGxldmVsICBv
ZiAgdGhlICB0cmVlLiAgIEFsc28sICBBTUTigJlzICBQYWdlICBXYWxrICBDYWNoZSAgaXMgIGlu
ZGV4ZWQgIGJ5Cj4gdGhlIHBoeXNpY2FsIGFkZHJlc3Mgb2YgdGhlIGNhY2hlZCBwYWdlIHRhYmxl
IGVudHJ5LCB3aGVyZWFzIEludGVs4oCZcwo+IFBhZ2luZy1TdHJ1Y3R1cmUgQ2FjaGVzIGFyZSBp
bmRleGVkIGJ5IHBvcnRpb25zIG9mIHRoZSB2aXJ0dWFsIGFkLQo+IGRyZXNzIGJlaW5nIHRyYW5z
bGF0ZWQKCk9oLCBpbnRlcmVzdGluZywgdGhhbmtzLiBCYXNpY2FsbHkgbWVhbnMgT1NlcyBhbmQg
YWxpa2UgY2FuJ3QgcmVhbGx5CnJlbHkgb24gYW55IHNwZWNpZmljIGJlaGF2aW9yLCBhbmQgaW1w
bGVtZW50YXRpb25zIGhhdmUgc29tZQpsZWV3YXkuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
