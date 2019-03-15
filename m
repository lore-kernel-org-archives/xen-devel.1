From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/svm: Improve code generation from
 cpu_has_svm_feature()
Date: Fri, 15 Mar 2019 12:51:27 -0400
Message-ID: <d09c102f-215c-fc34-7d10-12a6483d59b2@oracle.com>
References: <1552663389-665-1-git-send-email-andrew.cooper3@citrix.com>
 <835b8a7f-104d-2c9e-f0e5-719477dd04c6@oracle.com>
 <229dcab0-f81c-beb0-f23e-e40f71bbc140@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <229dcab0-f81c-beb0-f23e-e40f71bbc140@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Brian Woods <brian.woods@amd.com>, Jan Beulich <JBeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMy8xNS8xOSAxMjoyMiBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNS8wMy8yMDE5
IDE1OjU5LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+IE9uIDMvMTUvMTkgMTE6MjMgQU0sIEFu
ZHJldyBDb29wZXIgd3JvdGU6Cj4+PiBUYWtpbmcgc3ZtX2ZlYXR1cmVfZmxhZ3MgYnkgcG9pbnRl
ciBhbmQgdXNpbmcgdGVzdF9iaXQoKSByZXN1bHRzIGluIGdlbmVyYXRlZAo+Pj4gY29kZSB3aGlj
aCBsb2FkcyBzdm1fZmVhdHVyZV9mbGFncyBpbnRvIGEgMzJiaXQgcmVnaXN0ZXIsIHRoZW4gZG9l
cyBhIGJpdHdpc2UKPj4+IG9wZXJhdGlvbi4KPj4+Cj4+PiBUaGUgbG9naWMgY2FuIGJlIGV4cHJl
c3NlZCBpbiB0ZXJtcyBvZiBhIHN0cmFpZ2h0IGJpdHdpc2Ugb3BlcmF0aW9uLCByZXN1bHRpbmcK
Pj4+IGluIHRoZSBmb2xsb3dpbmcgbWlub3IgaW1wcm92ZW1lbnQuCj4+Pgo+Pj4gICBhZGQvcmVt
b3ZlOiAwLzAgZ3Jvdy9zaHJpbms6IDAvNCB1cC9kb3duOiAwLy0xMzYgKC0xMzYpCj4+PiAgIEZ1
bmN0aW9uICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9sZCAgICAgbmV3ICAg
ZGVsdGEKPj4+ICAgc3ZtX25lc3RlZF9mZWF0dXJlc19vbl9lZmVyX3VwZGF0ZSAgICAgICAgICAg
MjgxICAgICAyNzMgICAgICAtOAo+Pj4gICBzdm1fY3JlYXRlX3ZtY2IgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDE0MDQgICAgMTM4OCAgICAgLTE2Cj4+PiAgIHN2bV92bWV4aXRfaGFuZGxl
ciAgICAgICAgICAgICAgICAgICAgICAgICAgNjI3MSAgICA2MjM5ICAgICAtMzIKPj4+ICAgc3Rh
cnRfc3ZtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgODE4ICAgICA3MzggICAg
IC04MAo+Pj4gICBUb3RhbDogQmVmb3JlPTMzNDc1NjksIEFmdGVyPTMzNDc0MzMsIGNoZyAtMC4w
MCUKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgo+PiBSZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zz
a3lAb3JhY2VsLmNvbT4KPj4KPiBJIHN1cHBvc2UgeW91J2QgbGlrZSBtZSB0byBmaXggdXAgT3Jh
Y2xlIG9uIGNvbW1pdD8gOykKCk9vcHMsIHllcyBwbGVhc2UuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
