From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] xen: Add fake_s3 command-line option for
 testing
Date: Mon, 21 May 2018 16:33:00 +0100
Message-ID: <7328297b-69c8-3a86-633f-27a29b1f1bc1@citrix.com>
References: <20180521141600.5516-1-george.dunlap@citrix.com>
 <72b85eed-79e8-25da-0558-c431e71761b9@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wj6o=ii=citrix.com=prvs=672392ca3=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1fKmoL-000702-4T
 for xen-devel@lists.xenproject.org; Mon, 21 May 2018 15:33:21 +0000
In-Reply-To: <72b85eed-79e8-25da-0558-c431e71761b9@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@citrix.com>, Ben Guthro <benjamin.guthro@citrix.com>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMjEvMjAxOCAwMzoyOCBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMS8wNS8x
OCAxNToxNiwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gTW9zdCBzZXJ2ZXItY2xhc3MgaGFyZHdh
cmUgZG9lc24ndCBzdXBwb3J0IEFDUEkgUzMgc3VzcGVuZDsgYnV0IG1vc3QKPj4gYnVncyB3ZSds
bCBydW4gYWNyb3NzIHdvbid0IG5lZWQgYWN0dWFsIFMzIHRvIHRyaWdnZXIuICBBZGQgYQo+PiBj
b21tYW5kLWxpbmUgcGFyYW1ldGVyIGZvciBhICJmYWtlIiBTMywgd2hpY2ggd2lsbCBkbyBldmVy
eXRoaW5nCj4+IGR1cmluZyBzdXNwZW5kL3Jlc3RvcmUgZXhjZXB0IGFjdHVhbGx5IGNhbGxpbmcg
aW50byB0aGUgQUNQSSBTMwo+PiBoYW5kbGVyLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBCZW4gR3V0
aHJvIDxiZW5qYW1pbi5ndXRocm9AY2l0cml4LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogR2Vvcmdl
IER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgo+PiAtLS0KPj4gVGhpcyB3YXMgb3Jp
Z2luYWxseSBwb3N0ZWQgaW4gMjAxMywgYnV0IG5ldmVyIGFjdHVhbGx5IGNoZWNrZWQgaW4uCj4+
Cj4+IEkndmUgcmVtb3ZlZCBhbiBleHRyYW5lb3VzIGxpbmUsIGFuZCBjaGFuZ2VkIHRoZSB1bmRl
cnNjb3JlIGluIHRoZQo+PiBvcHRpb24gaW50byBhIGRhc2ggKGFzIEphbiBzZWVtcyB0byBwcmVm
ZXIpLgo+Pgo+PiBDb21waWxlLXRlc3RlZCBvbmx5Lgo+Pgo+PiBJZiB3ZSB3YW50IG9zc3Rlc3Qg
dG8gYmUgYWJsZSB0byB0ZXN0IHRoaXMgZnVuY3Rpb25hbGl0eSBpdCBzaG91bGQKPj4gcHJvYmFi
bHkgYmUgYmFja3BvcnRlZC4KPj4KPj4gQ0M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBjaXRy
aXguY29tPgo+PiBDQzogRGFyaW8gRmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4KPj4gQ0M6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+IENDOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IENDOiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+Cj4gCj4gYm9vbF90ID0+IGJvb2ws
IGRyb3AgdGhlIHJlZHVuZGFudCBpbml0aWFsaXNlciwgYW5kIHlvdSBuZWVkIHRvIHBhdGNoCj4g
eGVuLWNvbW1hbmQtbGluZS5tYXJrZG93bi4KCkhtbSwgYWN0dWFsbHkgLS0gd291bGQgaXQgbWFr
ZSBtb3JlIHNlbnNlIHRvIGFkZCB0aGlzIGFzIGFuIG9wdGlvbiB0bwphY3BpX3NsZWVwPyAgZS5n
LiwgImFjcGlfc2xlZXA9czNfZmFrZSI/ICAoQWxvbmcgd2l0aCBzM19iaW9zIGFuZCBzM19tb2Rl
PykKCiAtR2VvcmdlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
