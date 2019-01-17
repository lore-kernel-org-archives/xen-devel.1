From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 06/11] optee: add std call handling
Date: Thu, 17 Jan 2019 20:14:08 +0000
Message-ID: <87o98ft52o.fsf@epam.com>
References: <20181218211126.6886-1-volodymyr_babchuk@epam.com>
 <20181218211126.6886-7-volodymyr_babchuk@epam.com>
 <f4b2976d-c776-1984-c9b6-ae371aa05217@arm.com> <87va2ntimz.fsf@epam.com>
 <67d7e422-246a-10db-341d-07b51cd5085f@arm.com> <87tvi7t7vn.fsf@epam.com>
 <5833586a-615d-ed88-5d2f-96e4b0c8c56f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dvot=PZ=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1gkE3J-00050r-C2
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 20:14:13 +0000
In-Reply-To: <5833586a-615d-ed88-5d2f-96e4b0c8c56f@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Volodymyr Babchuk <vlad.babchuk@gmail.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>
List-Id: xen-devel@lists.xenproject.org

Ckp1bGllbiBHcmFsbCB3cml0ZXM6Cgo+IE9uIDEvMTcvMTkgNzoxMyBQTSwgVm9sb2R5bXlyIEJh
YmNodWsgd3JvdGU6Cj4+Pj4gQWN0dWFsbHksIE9QLVRFRSBwcm90b2NvbCBoYXZlIHBvc3NpYmls
aXR5IHRvIGhhbmRsZSBsaW1pdGVkIG51bWJlciBvZgo+Pj4+IHRocmVhZHMgY29ycmVjdGx5LiBP
UC1URUUgY2FuIHJlcG9ydCB0aGF0IGFsbCB0aHJlYWRzIGFyZSBidXN5IGFuZAo+Pj4+IGNsaWVu
dCB3aWxsIHdhaXQgZm9yIGEgZnJlZSBvbmUuIFhFTiBjYW4gZG8gdGhlIHNhbWUsIGFsdGhvdWdo
IHRoaXMgaXMgbm90Cj4+Pj4gaW1wbGVtZW50ZWQgaW4gdGhpcyBwYXRjaCBzZXJpZXMuIEJ1dCBJ
IGNhbiBhZGQgdGhpcy4KPj4+Cj4+PiBDb3VsZCB5b3UgZXhwYW5kIGJ5IHdhaXQ/IFdpbGwgaXQg
YmxvY2sgaW4gT1AtVEVFL1hlbiBvciBkb2VzIGl0Cj4+PiByZXR1cm4gdG8gdGhlIGd1ZXN0Pwo+
PiBJdCByZXR1cm5zIHRvIHRoZSBndWVzdCB3aXRoIHJlc3BvbnNlIGNvZGUKPj4gT1BURUVfU01D
X1JFVFVSTl9FVEhSRUFEX0xJTUlULiBMaW51eCBkcml2ZXIgYmxvY2tzIGNhbGxpbmcgYXBwbGlj
YXRpb24KPj4gdGhyZWFkIHVudGlsIG9uZSBvZiB0aGUgY2FsbHMgdG8gT1AtVEVFIGlzIGZpbmlz
aGVkLiBUaGVuIGRyaXZlciBhd2FrZW5zCj4+IG9uZSBvZiB0aGUgYmxvY2tlZCB0aHJlYWRzLCBz
byBpdCBjYW4gcGVyZm9ybSB0aGUgY2FsbC4KPgo+IFNob3VsZG4ndCBub3QgeW91IHJldHVybiB0
aGlzIHZhbHVlIHdoZW4geW91IHJlYWNoIG91dCBNQVhfU1REX0NBTExTPwpZZXMsIEkgc2hvdWxk
LiBBcyBJIHNhaWQgZWFybGllciwgdGhpcyBpc24ndCBkb25lIHJpZ2h0IG5vdy4gQnV0CmFwcGFy
ZW50bHkgd2lsbCBiZSBkb25lIGluIHRoZSBuZXh0IHZlcnNpb24uCgo+IEFjdHVhbGx5LCBsb29r
aW5nIGF0IHRoZSBjb2RlLCB5b3UgZG9uJ3Qgc2VlbSB0byByZXR1cm4gaW4gZXJyb3IgY29kZQo+
IHdoZW4gdGhlcmUgYXJlIGEgZmFpbHVyZSBpbiB0aGUgbWVkaWF0b3IuIEluc3RlYWQgeW91IHNl
ZW0gdG8gYWx3YXlzCj4gcmV0dXJuICJmYWxzZSIuIFdoaWNoIG1lYW5zIHRoZSB2aXJ0dWFsIFNN
Q0NDIGZyYW1ld29yayB0aGlua3MgdGhlCj4gY2FsbCB3YXMgbmV2ZXIgaGFuZGxlZC4gSG93ZXZl
ciwgdGhpcyBpcyBub3QgdHJ1ZSwgeW91IGhhbmRsZWQgdGhlCj4gY2FsbCBidXQgdGhlIHRoZXJl
IHdhcyBhIGZhaWx1cmUgZHVyaW5nIGl0Lgo+Cj4gSW4gZ2VuZXJhbCwgaGFuZGxlX2NhbGwgc2hv
dWxkIHJldHVybiBmYWxzZSBvbmx5IGlmIHRoZSBjYWxsIGlzCj4gbm9uLWV4aXN0ZW50LiBJbiBh
bGwgdGhlIG90aGVyIGNhc2UsIHlvdSBzaG91bGQgZmVlZCBhIHByb3BlciByZXR1cm4KPiBieSB5
b3Vyc2VsZi4KCkFncmVlLiBBdCBmaXJzdCBJIHNlZW4gT1AtVEVFIG1lZGlhdG9yIGFzIHJlbGF0
aXZlbHkgdGhpbiBzaGltIGJldHdlZW4KZ3Vlc3QgYW5kIE9QLVRFRS4gQW5kIEkgZXhwZWN0ZWQg
dGhhdCBpdCBzaG91bGQgbm90IHJldHVybiBlcnJvcnMgdG8gYQpnb29kIGJlaGF2aW5nIGd1ZXN0
LiBCdXQgbG9naWMgYmVjb21lcyBtb3JlIGNvbXBsZXggYW5kIGluZGVlZCwgdGhlcmUKYXJlIGNh
c2VzIHdoZW4gZXZlbiBiZWhhdmluZyBndWVzdCBjYW4gZ2V0IGFuIGVycm9yLgoKLS0gCkJlc3Qg
cmVnYXJkcyxWb2xvZHlteXIgQmFiY2h1awpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
