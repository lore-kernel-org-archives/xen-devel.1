From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4] x86/nmi: correctly check MSB of P6
 performance counter MSR in watchdog
Date: Thu, 28 Feb 2019 02:39:27 -0700
Message-ID: <5C77AC4F020000780021AF49@prv1-mh.provo.novell.com>
References: <1551203046-15581-1-git-send-email-igor.druzhinin@citrix.com>
 <5C766019020000780021A9EC@prv1-mh.provo.novell.com>
 <f7fb7eb7-af10-7a7b-6206-7451884d5b2a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mBo3=RD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gzIAB-0004OL-21
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 09:39:35 +0000
In-Reply-To: <f7fb7eb7-af10-7a7b-6206-7451884d5b2a@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Igor Druzhinin <igor.druzhinin@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjAyLjE5IGF0IDEzOjA3LCA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjcvMDIvMjAxOSAxMDowMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IAo+PiBSZXZp
ZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiBhbGJlaXQgLi4uCj4+
IAo+Pj4gQEAgLTMyMyw2ICszMjYsMTUgQEAgc3RhdGljIHZvaWQgc2V0dXBfcDZfd2F0Y2hkb2co
dW5zaWduZWQgY291bnRlcikKPj4+ICAgICAgdW5zaWduZWQgaW50IGV2bnRzZWw7Cj4+PiAgCj4+
PiAgICAgIG5taV9wZXJmY3RyX21zciA9IE1TUl9QNl9QRVJGQ1RSKDApOwo+Pj4gKyAgICBpZiAo
ICFubWlfcDZfZXZlbnRfd2lkdGggKQo+Pj4gKyAgICAJbm1pX3A2X2V2ZW50X3dpZHRoID0gKGN1
cnJlbnRfY3B1X2RhdGEuY3B1aWRfbGV2ZWwgPj0gMHhhKSA/Cj4+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBNQVNLX0VYVFIoY3B1aWRfZWF4KDB4YSksIFA2X0VWRU5UX1dJRFRIX01B
U0spIAo+IDoKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFA2X0VWRU5UX1dJRFRI
X01JTjsKPj4+ICsgICAgaWYgKCAhbm1pX3A2X2V2ZW50X3dpZHRoICkKPj4+ICsgICAgICAgIG5t
aV9wNl9ldmVudF93aWR0aCA9IFA2X0VWRU5UX1dJRFRIX01JTjsKPj4gCj4+IC4uLiBJIHRoaW5r
IHRoaXMgd291bGQgbm93IGJldHRlciBiZQo+PiAKPj4gICAgIGlmICggIW5taV9wNl9ldmVudF93
aWR0aCAmJiBjdXJyZW50X2NwdV9kYXRhLmNwdWlkX2xldmVsID49IDB4YSApCj4+ICAgICAgICAg
bm1pX3A2X2V2ZW50X3dpZHRoID0gTUFTS19FWFRSKGNwdWlkX2VheCgweGEpLCBQNl9FVkVOVF9X
SURUSF9NQVNLKTsKPj4gICAgIGlmICggIW5taV9wNl9ldmVudF93aWR0aCApCj4+ICAgICAgICAg
bm1pX3A2X2V2ZW50X3dpZHRoID0gUDZfRVZFTlRfV0lEVEhfTUlOOwo+PiAKPj4gUmUtd3JpdGlu
ZyBvZiB3aGljaCBhbHNvIG1hZCBtZSBub3RpY2UgYSBoYXJkIHRhYiBpbiB0aGVyZS4gSSdkIGJl
Cj4+IGZpbmUgbWFraW5nIHRoZSBhZGp1c3RtZW50IHdoaWxlIGNvbW1pdHRpbmcsIGFzIGxvbmcg
YXMgeW91IGFncmVlLgo+IAo+IFRoYW5rcywgSSBhbHNvIGRpZG4ndCBsaWtlIGhvdyBpdCBsb29r
ZWQgZXZlbnR1YWxseS4gSSdsbCBtYWtlIHRoZSBzYW1lCj4gYWRqdXN0bWVudCB0byBteSBjb3B5
IG9mIHRoZSBwYXRjaCBhcyB3ZWxsIHRoZW4uCj4gCj4+IEJ0dywgY29uc2lkZXJpbmcgdGhlIGNv
bWJpbmF0aW9uIG9mIHN1YmplY3QgdGFnIGFuZCBDYyBsaXN0IEkgdGFrZSBpdAo+PiB0aGF0IHlv
dSBkb24ndCBpbnRlbmQgdGhpcyB0byBnbyBpbnRvIDQuMTI/IEkgYXNrIGJlY2F1c2UgZ2VuZXJh
bGx5Cj4+IEknZCBjb25zaWRlciB0aGlzIGEgYmFja3BvcnRpbmcgY2FuZGlkYXRlLgo+IAo+IFll
cywgSSBkaWRuJ3QgaW50ZW5kIGl0IHRvIHRhcmdldCA0LjEyIGFzIEkgZG9uJ3QgY29uc2lkZXIg
aXQgYSBzZXJpb3VzCj4gaXNzdWUgLSB3ZSd2ZSBvbmx5IHNlZW4gaXQgb24gb25lIHR5cGUgb2Yg
U3VwZXJtaWNybyBtYWNoaW5lcwo+ICh1bmZvcnR1bmF0ZWx5LCBvdXIgbGFiIGlzIG5vdyBhbG1v
c3QgNTAlIG9mIHRoZW0pIHNvIGZhciB3aXRoIHBvb3IKPiBpbXBsZW1lbnRhdGlvbiBvZiBFUlNU
LiBCdXQgSSB3b3VsZG4ndCBtaW5kIGlmIGl0IHdhcyBzZWxlY3RlZCBhcyBhCj4gY2FuZGlkYXRl
IGZvciA0LjEyIGFuZCBwb3RlbnRpYWwgYmFja3BvcnRpbmcuCgpKw7xyZ2VuLCB3aGF0IGRvIHlv
dSB0aGluaz8KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
