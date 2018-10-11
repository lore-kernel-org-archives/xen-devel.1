From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: Ping: [PATCH v3 0/4] x86/HVM: implement memory read
 caching
Date: Thu, 11 Oct 2018 10:15:36 -0600
Message-ID: <5BBF772802000078001F0CAD@prv1-mh.provo.novell.com>
References: <5B97BEB202000078001E73FB@prv1-mh.provo.novell.com>
 <5BAA42D102000078001EBBEB@prv1-mh.provo.novell.com>
 <5BB34A1102000078001EDABE@prv1-mh.provo.novell.com>
 <57c23678-c8e6-d6d8-f0de-38a48b8936f2@citrix.com>
 <5BB368C902000078001EDBAF@prv1-mh.provo.novell.com>
 <525825CF-D14C-4EA5-8B43-8F72BD7BC7CA@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=dolx=mx=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gAdci-0003ec-QN
 for xen-devel@lists.xenproject.org; Thu, 11 Oct 2018 16:15:40 +0000
In-Reply-To: <525825CF-D14C-4EA5-8B43-8F72BD7BC7CA@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjEwLjE4IGF0IDE3OjU0LCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKCj4+IE9uIE9jdCAyLCAyMDE4LCBhdCAxOjQ3IFBNLCBKYW4gQmV1bGljaCA8SkJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOgo+PiAKPj4+Pj4gT24gMDIuMTAuMTggYXQgMTI6NTEsIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gCj4+PiBUaGlzIGRvZXNuJ3QgYmVoYXZlIGxp
a2UgcmVhbCBoYXJkd2FyZSwgYW5kIGRlZmluaXRlbHkgZG9lc24ndCBiZWhhdmUgYXMKPj4+IG5h
bWVkIC0gInN0cnVjdCBodm1lbXVsX2NhY2hlIiBpcyBzaW1wbHkgZmFsc2UuICBJZiBpdCB3ZXJl
IG5hbWVkCj4+PiBodm1lbXVsX3BzYyAob3Igc29tZSBvdGhlciB2YXJpYXRpb24gb24gUGFnaW5n
IFN0cnVjdHVyZSBDYWNoZSkgdGhlbiBpdAo+Pj4gd291bGRuJ3QgYmUgc28gYmFkLCBhcyB0aGUg
aW5kaXZpZHVhbCBsZXZlbHMgZG8gbWFrZSBtb3JlIHNlbnNlIGluIHRoYXQKPj4+IGNvbnRleHQK
Pj4gCj4+IEFzIHByZXZpb3VzbHkgcG9pbnRlZCBvdXQgKHdpdGhvdXQgYW55IHN1Z2dlc3Rpb24g
Y29taW5nIGJhY2sgZnJvbQo+PiB5b3UpLCBJIGNob3NlIHRoZSBuYW1lICJjYWNoZSIgZm9yIHRo
ZSBsYWNrIG9mIGEgYmV0dGVyIHRlcm0uIEhvd2V2ZXIsCj4+IEkgY2VydGFpbmx5IGRpc2FncmVl
IHdpdGggbmFtaW5nIGl0IFBTQyBvciBzb21lIHN1Y2gsIGFzIGl0cyBsZXZlbCB6ZXJvCj4+IGlz
IGludGVudGlvbmFsbHkgdGhlcmUgdG8gYmUgZXZlbnR1YWxseSB1c2VkIGZvciBub24tcGFnaW5n
LXN0cnVjdHVyZQo+PiBkYXRhLgo+IAo+IEkgY2FuIHRoaW5rIG9mIGxvdHMgb2YgZGVzY3JpcHRp
dmUgbmFtZXMgd2hpY2ggY291bGQgeWllbGQgdW5pcXVlIAo+IHRocmVlLWxldHRlciBhY3Jvbnlt
czoKPiAKPiBMb2dpY2FsIFJlYWQgU2VxdWVuY2UKPiBMb2dpY2FsIFJlYWQgU2VyaWVzCj4gTG9n
aWNhbCBSZWFkIFJlY29yZAo+IFJlYWQgQ29uc2lzdGVuY3kgU3RydWN0dXJlCj4gQ29uc2lzdGVu
dCBSZWFkIFN0cnVjdHVyZQo+IENvbnNpc3RlbnQgUmVhZCBSZWNvcmQKPiBFbXVsYXRpb24gUmVh
ZCBSZWNvcmQKPiBb4oCmXQoKV2VsbCwgSSdtIG5vdCBzdXJlIExSUywgTFJSLCBSQ1MsIENSUywg
Q1JSLCBvciBFUlIgd291bGQgYmUKZWFzaWx5IHJlY29nbml6YWJsZSBhcyB3aGF0IHRoZXkgc3Rh
bmQgZm9yLiBUbyBiZSBob25lc3QgSSdkCnByZWZlciBhIG5vbi1hY3JvbnltLiBEaWQgeW91IHNl
ZSBteSBjb25zaWRlcmF0aW9uIHRvd2FyZHMKImxhdGNoIj8KCkphbgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
