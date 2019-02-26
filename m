From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/nmi: correctly check MSB of P6
 performance counter MSR in watchdog
Date: Tue, 26 Feb 2019 08:37:25 -0700
Message-ID: <5C755D35020000780021A614@prv1-mh.provo.novell.com>
References: <1551186774-30858-1-git-send-email-igor.druzhinin@citrix.com>
 <1a60c5da-2a43-114f-5b13-41ed65fba094@citrix.com>
 <5C755426020000780021A5AB@prv1-mh.provo.novell.com>
 <9ee23b2f-eded-537a-25a3-46a8a8118b06@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gyenW-0002Ws-AE
 for xen-devel@lists.xenproject.org; Tue, 26 Feb 2019 15:37:34 +0000
In-Reply-To: <9ee23b2f-eded-537a-25a3-46a8a8118b06@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjAyLjE5IGF0IDE2OjEzLCA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjYvMDIvMjAxOSAxNDo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDI2
LjAyLjE5IGF0IDE0OjI1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBP
biAyNi8wMi8yMDE5IDEzOjEyLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPj4+Cj4+Pj4gQEAgLTMy
Myw2ICszMjcsMTAgQEAgc3RhdGljIHZvaWQgc2V0dXBfcDZfd2F0Y2hkb2codW5zaWduZWQgY291
bnRlcikKPj4+PiAgICAgIHVuc2lnbmVkIGludCBldm50c2VsOwo+Pj4+ICAKPj4+PiAgICAgIG5t
aV9wZXJmY3RyX21zciA9IE1TUl9QNl9QRVJGQ1RSKDApOwo+Pj4+ICsgICAgaWYgKCBjdXJyZW50
X2NwdV9kYXRhLmNwdWlkX2xldmVsID49IDB4YSApCj4+Pj4gKyAgICAgICAgbm1pX3A2X2V2ZW50
X3dpZHRoID0gTUFTS19FWFRSKGNwdWlkX2VheCgweGEpLCAKPiBQNl9FVkVOVF9XSURUSF9NQVNL
KTsKPj4+PiArICAgIGlmICggIW5taV9wNl9ldmVudF93aWR0aCApCj4+Pj4gKyAgICAgICAgbm1p
X3A2X2V2ZW50X3dpZHRoID0gUDZfRVZFTlRfV0lEVEhfREVGQVVMVDsKPj4+Cj4+PiBUaGlzIGlz
IGNhbGxlZCBvbiBlYWNoIGNwdSwgYnV0IHdyaXRlcyB0byBhIHNoYXJlZCB2YXJpYWJsZS4gIFRo
aXMKPj4+IGVudGlyZSBibG9jayB3YW50cyB0byBiZSBzb21ldGhpbmcgbGlrZToKPj4+Cj4+PiBp
ZiAoICFubWlfcDZfZXZlbnRfd2lkdGggKQo+Pj4gICAgIG5taV9wNl9ldmVudF93aWR0aCA9IChj
dXJyZW50X2NwdV9kYXRhLmNwdWlkX2xldmVsID49IDB4YSkgPwo+Pj4gTUFTS19FWFRSKGNwdWlk
X2VheCgweGEpLCBQNl9FVkVOVF9XSURUSF9NQVNLKSA6IFA2X0VWRU5UX1dJRFRIX0RFRkFVTFQ7
Cj4+Pgo+Pj4gKHN1aXRhYmx5IHdyYXBwZWQpIHNvIGl0IGdldHMgZmlsbGVkIG9ubHkgb25jZS4K
Pj4gCj4+IFBsdXMgdGhlIGxvdyBhbmQgaGlnaCBjYXBwaW5nIG9mIHRoZSB2YWx1ZSByZWFkLCBh
cyByZXF1ZXN0ZWQgaW4KPj4gcmVwbHkgdG8gdjEuCj4gCj4gSXNuJ3QgaXQgdGhlIGNvdW50ZXIg
Y2xpcHBpbmcgeW91IHJlcXVlc3RlZCAod2hpY2ggd2FzIGltcGxlbWVudGVkIGluCj4gdjIpPyBX
aGF0IGlzIHRoZSBwb2ludCBpbiBoaWdoIGNhcHBpbmc/IElzIGl0IHNhZmUgdG8gY29udGludWUg
aWYgdGhlCj4gdmFsdWUgcmVhZCBpcyBsb3dlciB0aGFuIFA2X0VWRU5UX1dJRFRIX0RFRkFVTFQg
b3Igc2hvdWxkIEkgcGFuaWMgaGVyZT8KCkkgdGhpbmsgcGFuaWMoKWluZyBpcyBhbiBvcHBvcnR1
bmUgYWN0aW9uIGluIHRoaXMgc2l0dWF0aW9uLCBidXQgSQp3b3VsZG4ndCBtaW5kIGp1c3QgZ29p
bmcgd2l0aCAzMiBpbnN0ZWFkIGluIHRoaXMgY2FzZSwgb3IgZmFpbGluZyB0bwplbmFibGUgdGhl
IHdhdGNoZG9nLiBPbiByZWFsIGhhcmR3YXJlIHRoZSB2YWx1ZSBpc24ndCBnb2luZyB0bwpiZSBh
bnkgbG93ZXIsIGFuZCBpbiB2aXJ0dWFsaXplZCBlbnZpcm9ubWVudHMgd2UnZCBoYXZlIHRvIGZp
Z3VyZQp3aHkgdGhlIHZhbHVlIGlzIHNtYWxsZXIgYW55d2F5LgoKQXMgdG8gdGhlIGhpZ2ggY2Fw
cGluZyAtIGFzIHNhaWQgaW4gdGhlIHYxIHRocmVhZCwgSSdkIGxpa2UgdGhpcyB0bwpiZSB0aGVy
ZSBpbiBwYXJ0aWN1bGFyIGZvciB0aGUgc2hpZnQgb3BlcmF0aW9ucyB0byBub3QgYmVjb21lCnVu
ZGVmaW5lZC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
