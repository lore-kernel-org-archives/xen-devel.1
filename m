From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/svm: Remove the pdpe fields from struct
 vmcb
Date: Wed, 17 Oct 2018 10:57:26 -0400
Message-ID: <97054899-a478-a716-008b-3ee6ed244255@oracle.com>
References: <1539780468-21748-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1539780468-21748-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, Brian Woods <brian.woods@amd.com>, Jan Beulich <JBeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMTcvMTggODo0NyBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGVzZSBmaWVsZHMg
aGF2ZSBleGlzdGVkIHNpbmNlIHRoZSBTVk0gY29kZSB3YXMgZmlyc3QgaW50cm9kdWNlZC4KPgo+
IFRoZSBlYXJsaWVzdCByZWZlcmVuY2UgSSBjYW4gZmluZCBpcyBjL3MgZDFiZDE1N2ZiYzkgd2hp
Y2ggaXMgdW5mb3J1bmF0ZWx5IGEKPiByZWJhc2UgJiBzcXVhc2ggb2YgYSBzZXBhcmF0ZSBkZXYg
dHJlZS4gIExvb2tpbmcgYSB0aGUgY29tbWl0IG1lc3NhZ2UsIEknbQo+IGd1ZXNzaW5nIGl0IHdh
cyBpbnRyb2R1Y2VkIGJ5Ogo+Cj4gICA+IHVzZXI6ICAgICAgICB0d29sbGVyQHhlbi10cncxLnNp
dGUKPiAgID4gZGF0ZTogICAgICAgIFR1ZSBEZWMgMTMgMTk6NDk6NTMgMjAwNSAtMDUwMAo+ICAg
PiBmaWxlczogICAgICAgLi4uIHhlbi9pbmNsdWRlL2FzbS14ODYvc3ZtX3ZtY2IuaCAuLi4KPiAg
ID4gZGVzY3JpcHRpb246Cj4gICA+IEFkZCBTVk0gYmFzZSBmaWxlcyB0byByZXBvc2l0b3J5Lgo+
Cj4gQW55d2F5LCB0aGUgQU1EIFNETSBoYXMgbm8gbWVudGlvbiBvZiBQRFBFIGZpZWxkcyBpbiB0
aGUgVk1DQiBhbmQgbWFya3MgdGhpcwo+IHBhcnQgb2YgdGhlIFZNQ0IgYXMgcmVzZXJ2ZWQuICBU
aGUgbWFudWFsIGRvZXMgZXhwbGljaXRseSBzYXkgdGhhdCAzMmJpdCBQQUUKPiBwYWdpbmcgbWF5
IHJlYWQgdGhlIFBEUEUgZmllbGRzIGZyb20gbWVtb3J5IHJhdGhlciBmcm9tIHRoZSBDUFUgcmVn
aXN0ZXJzLgo+Cj4gQ2hhbmNlcyBhcmUgdmVyeSBnb29kIHRoYXQgdGhpcyBpcyBhIHZlc3RpZ2lh
bCByZW1uZW50IG9mIGFuIGVhcmx5IGRlc2lnbi4KPiBYZW4gZG9lc24ndCB1c2UgdGhlIGZpZWxk
cyBhdCBhbGwsIGV4Y2VwdCB0byBjb3B5IHRoZW0gb24gdmlydHVhbAo+IHZtZW50cnkvdm1leGl0
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KCgpSZXZpZXdlZC1ieTogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3Jh
Y2xlLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
