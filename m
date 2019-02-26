From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/nmi: correctly check MSB of P6
 performance counter MSR in watchdog
Date: Tue, 26 Feb 2019 07:49:57 -0700
Message-ID: <5C755215020000780021A598@prv1-mh.provo.novell.com>
References: <1551186774-30858-1-git-send-email-igor.druzhinin@citrix.com>
 <1a60c5da-2a43-114f-5b13-41ed65fba094@citrix.com>
 <6c77cefc-4c33-4fe5-ae8c-e3563832c684@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gye3Y-0006JO-JH
 for xen-devel@lists.xenproject.org; Tue, 26 Feb 2019 14:50:04 +0000
In-Reply-To: <6c77cefc-4c33-4fe5-ae8c-e3563832c684@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjAyLjE5IGF0IDE0OjM2LCA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjYvMDIvMjAxOSAxMzoyNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjYv
MDIvMjAxOSAxMzoxMiwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IAo+Pj4gQEAgLTMyMyw2ICsz
MjcsMTAgQEAgc3RhdGljIHZvaWQgc2V0dXBfcDZfd2F0Y2hkb2codW5zaWduZWQgY291bnRlcikK
Pj4+ICAgICAgdW5zaWduZWQgaW50IGV2bnRzZWw7Cj4+PiAgCj4+PiAgICAgIG5taV9wZXJmY3Ry
X21zciA9IE1TUl9QNl9QRVJGQ1RSKDApOwo+Pj4gKyAgICBpZiAoIGN1cnJlbnRfY3B1X2RhdGEu
Y3B1aWRfbGV2ZWwgPj0gMHhhICkKPj4+ICsgICAgICAgIG5taV9wNl9ldmVudF93aWR0aCA9IE1B
U0tfRVhUUihjcHVpZF9lYXgoMHhhKSwgCj4gUDZfRVZFTlRfV0lEVEhfTUFTSyk7Cj4+PiArICAg
IGlmICggIW5taV9wNl9ldmVudF93aWR0aCApCj4+PiArICAgICAgICBubWlfcDZfZXZlbnRfd2lk
dGggPSBQNl9FVkVOVF9XSURUSF9ERUZBVUxUOwo+PiAKPj4gVGhpcyBpcyBjYWxsZWQgb24gZWFj
aCBjcHUsIGJ1dCB3cml0ZXMgdG8gYSBzaGFyZWQgdmFyaWFibGUuICBUaGlzCj4+IGVudGlyZSBi
bG9jayB3YW50cyB0byBiZSBzb21ldGhpbmcgbGlrZToKPj4gCj4+IGlmICggIW5taV9wNl9ldmVu
dF93aWR0aCApCj4+ICAgICBubWlfcDZfZXZlbnRfd2lkdGggPSAoY3VycmVudF9jcHVfZGF0YS5j
cHVpZF9sZXZlbCA+PSAweGEpID8KPj4gTUFTS19FWFRSKGNwdWlkX2VheCgweGEpLCBQNl9FVkVO
VF9XSURUSF9NQVNLKSA6IFA2X0VWRU5UX1dJRFRIX0RFRkFVTFQ7Cj4+IAo+PiAoc3VpdGFibHkg
d3JhcHBlZCkgc28gaXQgZ2V0cyBmaWxsZWQgb25seSBvbmNlLgo+PiAKPiAKPiBUaGlzIHBhdHRl
cm4gc2VlbXMgdG8gcGVyc2lzdCBvdmVyIHRoZSB3aG9sZSBmaWxlIC0gc2VlIG5taV9wZXJmY3Ry
X21zcgo+IGFib3ZlIG9yIHNldHVwX3A0X3dhdGNoZG9nLCBldGMuIEkgZWl0aGVyIG5lZWQgdG8g
Zml4IGFsbCBvZiB0aGVtIG9yCj4gbGVhdmUgaXQgbGlrZSB0aGF0IGFzIGl0J3Mgbm90IGhhcm1m
dWwgb3IgYW55dGhpbmcuCgpJIGRvbid0IHRoaW5rIGl0IGh1cnRzIHRvIGRvIGJldHRlciB0aGFu
IHRoZSBzdXJyb3VuZGluZyBjb2RlCmZvciBuZXcgY29kZSBhZGRpdGlvbnMsIHdpdGhvdXQgYXMg
YSBwcmVyZXEgZml4aW5nIGFsbCBwcmlvcgpsZXNzIG9wdGltYWwgY29kaW5nIChidXQgeW91J3Jl
IG9mIGNvdXJzZSB3ZWxjb21lIHRvIGRvIHNvKS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
