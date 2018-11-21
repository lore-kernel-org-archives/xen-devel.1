From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH 06/14] x86/hvm: Make the altp2m locking
 easier to follow
Date: Wed, 21 Nov 2018 16:43:46 +0200
Message-ID: <a1075f78-9152-d86a-ca73-bb24e1083d3e@bitdefender.com>
References: <1542806482-24030-1-git-send-email-andrew.cooper3@citrix.com>
 <1542806482-24030-7-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542806482-24030-7-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMjEvMTggMzoyMSBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBEcm9wIHRoZSBhcDJt
X2FjdGl2ZSBib29sZWFuLCBhbmQgY29uc2lzdGVudGx5IHVzZSB0aGUgdW5sb2NraW5nIGZvcm06
Cj4gCj4gICBpZiAoIHAybSAhPSBob3N0cDJtICkKPiAgICAgICAgX19wdXRfZ2ZuKHAybSwgZ2Zu
KTsKPiAgIF9fcHV0X2dmbihob3N0cDJtLCBnZm4pOwo+IAo+IHdoaWNoIG1ha2VzIGl0IGNsZWFy
IHRoYXQgd2UgYWx3YXlzIHVubG9jayB0aGUgYWx0cDJtJ3MgZ2ZuIGlmIGl0IGlzIGluIHVzZSwK
PiBhbmQgYWx3YXlzIHVubG9jayB0aGUgaG9zdHAybSdzIGdmbi4gIFRoaXMgYWxzbyBkcm9wcyB0
aGUgdGVybmFyeSBleHByZXNzaW9uCj4gaW4gdGhlIGxvZ2RpcnR5IGNhc2UuCj4gCj4gRXh0ZW5k
IHRoZSBsb2dkaXJ0eSBjb21tZW50IHRvIGlkZW50aWZ5IHdoZXJlIHRoZSBsb2NraW5nIHZpb2xh
dGlvbiBpcyBsaWFibGUKPiB0byBvY2N1ci4KPiAKPiBObyAoaW50ZW5kZWQpIG92ZXJhbGwgY2hh
bmdlIGluIGJlaGF2aW91ci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNv
am9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KCkZXSVcsIEkndmUgYWxzbyBhcHBsaWVkIHRoaXMgYW5k
IHRoZSBwcmV2aW91cyB0d28gcGF0Y2hlcyBJJ3ZlIHJldmlld2VkCnRvIHRoZSBlbmQgb2YgbXkg
YWx0cDJtIHNlcmllcyBhbmQgZ2F2ZSB0aGVtIGEgc3BpbiB3aXRoIGludHJvc3BlY3Rpb24Kd2l0
aCBubyBhcHBhcmVudCBwcm9ibGVtcy4KCgpUaGFua3MsClJhenZhbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
