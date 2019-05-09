From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [VMI] How to add support for MOV-TO-DRx events ?
Date: Fri, 10 May 2019 00:50:29 +0300
Message-ID: <b09c9ca3-7ea7-da79-4a92-38119b5ff651@bitdefender.com>
References: <QEYcx2UUWYxlJ02osYlearQNzGJ8v6MEW5XgfTTtnx2KS5tTQakOF-DTvIEqfClWbQlZYvWoyeWkiOKp3SyWmK1NeEQChNxG5drxloJyjEI=@protonmail.com>
 <66aeafd6-a87e-2f76-e0a3-6d0ad1e6f35f@bitdefender.com>
 <bf8797be-72f8-b38a-0e61-56ed69269652@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IWQu=TJ=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hOqw8-0001Cu-K0
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 21:50:44 +0000
In-Reply-To: <bf8797be-72f8-b38a-0e61-56ed69269652@citrix.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Mathieu Tarral <mathieu.tarral@protonmail.com>, xen-devel <xen-devel@lists.xenproject.org>, Tamas K Lengyel <tamas@tklengyel.com>
List-Id: xen-devel@lists.xenproject.org

T24gNS8xMC8xOSAxMjozMSBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBXaGF0IHdlJ2xsIGhh
dmUgdG8gZG8gaXMgZW5kIHVwIGluIGEgcG9zaXRpb24gd2hlcmUgd2UgY2FuIGhhdmUgc29tZQo+
IHJlYWwgJWRyIHNldHRpbmdzIGdpdmVuIGJ5IHRoZSBWTUkgYWdlbnQsIGFuZCBzb21lIHNoYWRv
dyAlZHIgc2V0dGluZ3MKPiB3aGljaCB0aGUgZ3Vlc3QgaW50ZXJhY3RzIHdpdGguwqAgQWxzbyBJ
IHNob3VsZCB3YXJuIHlvdSBhdCB0aGlzIHBvaW50Cj4gdGhhdCwgYmVjYXVzZSBvZiBob3cgdGhl
IHJlZ2lzdGVycyB3b3JrLCBJdCB3aWxsIG5vdCBiZSBwb3NzaWJsZSB0byBoYXZlCj4gZ3Vlc3Qt
c2hhZG93ZWQgJWRyIGZ1bmN0aW9uaW5nIGF0IHRoZSBzYW1lIHRpbWUgYXMgVk1JLXByb3ZpZGVk
ICVkcgo+IHNldHRpbmdzLgo+IAo+IEkgZ3Vlc3MgdGhlIG1haW4gdXNlY2FzZSBoZXJlIGlzIHNp
bXBseSBoaWRpbmcgZnJvbSB0aGUgZ3Vlc3Qga2VybmVsCj4gdGhhdCBkZWJ1Z2dpbmcgYWN0aXZp
dGllcyBhcmUgaW4gdXNlLCBhbmQgd2UgYXJlIG9rIHRvIGJyZWFrIHRoZSByZWFsCj4gdXNlIG9m
IGdkYi9vdGhlciBpbnNpZGUgdGhlIGd1ZXN0P8KgIFJhenZhbi9UYW1hczogQXMgeW91ciB0aGUK
PiBtYWludGFpbmVycywgaXQgaXMgeW91ciBjYWxsLCB1bHRpbWF0ZWx5LgoKV2hhdCB3b3JyaWVz
IG1lIGhlcmUgaXMgdGhhdCBpbiB0aGF0IGNhc2UgaXQgYmVjb21lcyBlYXNpZXIgZm9yIGEgcm9n
dWUKYXBwbGljYXRpb24gaW5zaWRlIHRoZSBndWVzdCB0byBmaWd1cmUgb3V0IHRoYXQgdGhlIGd1
ZXN0J3MgYmVpbmcKbW9uaXRvcmVkLCBpZiBJIHVuZGVyc3RhbmQgdGhpbmdzIGNvcnJlY3RseS4K
Ck9mIGNvdXJzZSwgYSBkb20wIGludHJvc3BlY3Rpb24gYWdlbnQgbWF5IGNob29zZSB0byBzaW1w
bHkgbm90IHN1YnNjcmliZQp0byBEUiBldmVudHMsIGFuZCB0aHVzIG5vdCBhbHRlciB0aGUgY3Vy
cmVudCBmbG93IGF0IGFsbCwgd2hpY2ggbWFrZXMKdGhpbmdzIGJldHRlci4KCgpUaGFua3MsClJh
enZhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
