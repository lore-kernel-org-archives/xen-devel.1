From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen/tools: Fix gen-cpuid.py's ability to
 report errors
Date: Mon, 26 Nov 2018 05:38:29 -0700
Message-ID: <5BFBE94502000078001FFF69@prv1-mh.provo.novell.com>
References: <1543233787-1964-1-git-send-email-andrew.cooper3@citrix.com>
 <20181126121725.rbu42tgndap4njio@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181126121725.rbu42tgndap4njio@zion.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjExLjE4IGF0IDEzOjE3LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gTW9uLCBOb3YgMjYsIDIwMTggYXQgMTI6MDM6MDdQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPj4gYy9zIDE4NTk2OTAzICJ4ZW4vdG9vbHM6IHN1cHBvcnQgUHl0aG9uIDIgYW5kIFB5
dGhvbiAzIiB1bmZvcnR1bmF0ZWx5Cj4+IGludHJvZHVjZWQgYSBUeXBlRXJyb3Igd2hlbiBjaGFu
Z2luZyBob3cgRmFpbCBleGNlcHRpb25zIHdlcmUgcHJpbnRlZDoKPj4gCj4+ICAgL2xvY2FsL3hl
bi5naXQveGVuLy4uL3hlbi90b29scy9nZW4tY3B1aWQucHk6VHJhY2ViYWNrIChtb3N0IHJlY2Vu
dCBjYWxsIGxhc3QpOgo+PiAgICAgRmlsZSAiL2xvY2FsL3hlbi5naXQveGVuLy4uL3hlbi90b29s
cy9nZW4tY3B1aWQucHkiLCBsaW5lIDQ4MywgaW4gPG1vZHVsZT4KPj4gICAgICAgICBzeXMuc3Rk
ZXJyLndyaXRlKGUpCj4+ICAgVHlwZUVycm9yOiBleHBlY3RlZCBhIGNoYXJhY3RlciBidWZmZXIg
b2JqZWN0Cj4+IAo+PiBDb2VyY2UgZSB0byBhIHN0cmluZyBiZWZvcmUgcHJpbnRpbmcuICBXaGls
ZSBjaGFuZ2luZyB0aGlzLCBmb2xkIHRoZSB0aHJlZQo+PiB3cml0ZSgpIGNhbGxzIG1ha2luZyB1
cCB0aGUgbGluZSBpbnRvIGEgc2luZ2xlIG9uZSwgYW5kIHRha2UgdGhlIG9wcG9ydHVuaXR5Cj4+
IHRvIG5lYXRlbiB0aGUgb3V0cHV0Lgo+PiAKPj4gQSBzYW1wbGUgZXJyb3IgaXM6Cj4+IAo+PiAg
IC9sb2NhbC94ZW4uZ2l0L3hlbi90b29scy9nZW4tY3B1aWQucHk6IEZhaWw6IEFsaWFzZWQgdmFs
dWUgYmV0d2VlbiBGT08gYW5kIEJBUgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAKPiBBY2tlZC1ieTogV2VpIExpdSA8d2Vp
LmxpdTJAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
