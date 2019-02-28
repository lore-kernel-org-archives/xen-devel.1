From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4] x86/nmi: correctly check MSB of P6
 performance counter MSR in watchdog
Date: Thu, 28 Feb 2019 14:28:55 +0100
Message-ID: <d6d85129-f9ba-c93c-2638-f98e1fbcf08b@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4XqV=RD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gzLkE-0004lz-8g
 for xen-devel@lists.xenproject.org; Thu, 28 Feb 2019 13:29:02 +0000
References: =?UTF-8?B?PDE1NTEyMDMwNDbvv70xNTU4Me+/vTHvv71naXTvv71zZW5k77+9?=
 =?UTF-8?Q?email=ef=bf=bdigor=2edruzhinin=40citrix=2ecom=3e_=3c5C76601902000?=
 =?UTF-8?B?MDc4MDAyMUE5RUNAcHJ2Me+/vW1oLnByb3ZvLm5vdmVsbC5jb20+IDxmN2ZiN2Vi?=
 =?UTF-8?Q?7-af10-7a7b-6206-7451884d5b2a=40citrix=2ecom=3e_=3c5C77AC4F020000?=
 =?UTF-8?Q?780021AF49=40suse=2ecom=3e?=
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Igor Druzhinin <igor.druzhinin@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDIvMjAxOSAxMDozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjcuMDIuMTkg
YXQgMTM6MDcsIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMjcvMDIv
MjAxOSAxMDowMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pgo+Pj4gUmV2aWV3ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+IGFsYmVpdCAuLi4KPj4+Cj4+Pj4gQEAgLTMy
Myw2ICszMjYsMTUgQEAgc3RhdGljIHZvaWQgc2V0dXBfcDZfd2F0Y2hkb2codW5zaWduZWQgY291
bnRlcikKPj4+PiAgICAgIHVuc2lnbmVkIGludCBldm50c2VsOwo+Pj4+ICAKPj4+PiAgICAgIG5t
aV9wZXJmY3RyX21zciA9IE1TUl9QNl9QRVJGQ1RSKDApOwo+Pj4+ICsgICAgaWYgKCAhbm1pX3A2
X2V2ZW50X3dpZHRoICkKPj4+PiArICAgIAlubWlfcDZfZXZlbnRfd2lkdGggPSAoY3VycmVudF9j
cHVfZGF0YS5jcHVpZF9sZXZlbCA+PSAweGEpID8KPj4+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBNQVNLX0VYVFIoY3B1aWRfZWF4KDB4YSksIFA2X0VWRU5UX1dJRFRIX01BU0spIAo+
PiA6Cj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUDZfRVZFTlRfV0lEVEhfTUlO
Owo+Pj4+ICsgICAgaWYgKCAhbm1pX3A2X2V2ZW50X3dpZHRoICkKPj4+PiArICAgICAgICBubWlf
cDZfZXZlbnRfd2lkdGggPSBQNl9FVkVOVF9XSURUSF9NSU47Cj4+Pgo+Pj4gLi4uIEkgdGhpbmsg
dGhpcyB3b3VsZCBub3cgYmV0dGVyIGJlCj4+Pgo+Pj4gICAgIGlmICggIW5taV9wNl9ldmVudF93
aWR0aCAmJiBjdXJyZW50X2NwdV9kYXRhLmNwdWlkX2xldmVsID49IDB4YSApCj4+PiAgICAgICAg
IG5taV9wNl9ldmVudF93aWR0aCA9IE1BU0tfRVhUUihjcHVpZF9lYXgoMHhhKSwgUDZfRVZFTlRf
V0lEVEhfTUFTSyk7Cj4+PiAgICAgaWYgKCAhbm1pX3A2X2V2ZW50X3dpZHRoICkKPj4+ICAgICAg
ICAgbm1pX3A2X2V2ZW50X3dpZHRoID0gUDZfRVZFTlRfV0lEVEhfTUlOOwo+Pj4KPj4+IFJlLXdy
aXRpbmcgb2Ygd2hpY2ggYWxzbyBtYWQgbWUgbm90aWNlIGEgaGFyZCB0YWIgaW4gdGhlcmUuIEkn
ZCBiZQo+Pj4gZmluZSBtYWtpbmcgdGhlIGFkanVzdG1lbnQgd2hpbGUgY29tbWl0dGluZywgYXMg
bG9uZyBhcyB5b3UgYWdyZWUuCj4+Cj4+IFRoYW5rcywgSSBhbHNvIGRpZG4ndCBsaWtlIGhvdyBp
dCBsb29rZWQgZXZlbnR1YWxseS4gSSdsbCBtYWtlIHRoZSBzYW1lCj4+IGFkanVzdG1lbnQgdG8g
bXkgY29weSBvZiB0aGUgcGF0Y2ggYXMgd2VsbCB0aGVuLgo+Pgo+Pj4gQnR3LCBjb25zaWRlcmlu
ZyB0aGUgY29tYmluYXRpb24gb2Ygc3ViamVjdCB0YWcgYW5kIENjIGxpc3QgSSB0YWtlIGl0Cj4+
PiB0aGF0IHlvdSBkb24ndCBpbnRlbmQgdGhpcyB0byBnbyBpbnRvIDQuMTI/IEkgYXNrIGJlY2F1
c2UgZ2VuZXJhbGx5Cj4+PiBJJ2QgY29uc2lkZXIgdGhpcyBhIGJhY2twb3J0aW5nIGNhbmRpZGF0
ZS4KPj4KPj4gWWVzLCBJIGRpZG4ndCBpbnRlbmQgaXQgdG8gdGFyZ2V0IDQuMTIgYXMgSSBkb24n
dCBjb25zaWRlciBpdCBhIHNlcmlvdXMKPj4gaXNzdWUgLSB3ZSd2ZSBvbmx5IHNlZW4gaXQgb24g
b25lIHR5cGUgb2YgU3VwZXJtaWNybyBtYWNoaW5lcwo+PiAodW5mb3J0dW5hdGVseSwgb3VyIGxh
YiBpcyBub3cgYWxtb3N0IDUwJSBvZiB0aGVtKSBzbyBmYXIgd2l0aCBwb29yCj4+IGltcGxlbWVu
dGF0aW9uIG9mIEVSU1QuIEJ1dCBJIHdvdWxkbid0IG1pbmQgaWYgaXQgd2FzIHNlbGVjdGVkIGFz
IGEKPj4gY2FuZGlkYXRlIGZvciA0LjEyIGFuZCBwb3RlbnRpYWwgYmFja3BvcnRpbmcuCj4gCj4g
SsO8cmdlbiwgd2hhdCBkbyB5b3UgdGhpbms/CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
