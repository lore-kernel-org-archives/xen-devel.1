From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v2] tpm: Restore functionality to xen vtpm
 driver.
Date: Tue, 18 Sep 2018 00:19:00 +0300
Message-ID: <20180917211900.GD6716__7864.65087808228$1537219110$gmane$org@linux.intel.com>
References: <20180913212551.2435-1-boris.ostrovsky@oracle.com>
 <20180916192510.GF7473@linux.intel.com>
 <b82c4603-1a60-16ec-14b6-81251e114b75@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nqxc=l7=linux.intel.com=jarkko.sakkinen@srs-us1.protection.inumbo.net>)
 id 1g20vR-0005sO-9Q
 for xen-devel@lists.xenproject.org; Mon, 17 Sep 2018 21:19:21 +0000
Content-Disposition: inline
In-Reply-To: <b82c4603-1a60-16ec-14b6-81251e114b75@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: jgross@suse.com, "Dr . Greg Wettstein" <greg@enjellic.com>, dunlapg@umich.edu, linux-kernel@vger.kernel.org, stable@vger.kernel.org, jgg@ziepe.ca, "Dr. Greg Wettstein" <greg@wind.enjellic.com>, xen-devel@lists.xenproject.org, peterhuewe@gmx.de, linux-integrity@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBTZXAgMTcsIDIwMTggYXQgMDk6NTQ6MzdBTSAtMDQwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+IE9uIDkvMTYvMTggMzoyNSBQTSwgSmFya2tvIFNha2tpbmVuIHdyb3RlOgo+ID4g
T24gVGh1LCBTZXAgMTMsIDIwMTggYXQgMDU6MjU6NTFQTSAtMDQwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+ID4+IEZyb206ICJEci4gR3JlZyBXZXR0c3RlaW4iIDxncmVnQHdpbmQuZW5qZWxs
aWMuY29tPgo+ID4+Cj4gPj4gRnVuY3Rpb25hbGl0eSBvZiB0aGUgeGVuLXRwbWZyb250IGRyaXZl
ciB3YXMgbG9zdCBzZWNvbmRhcnkgdG8KPiA+PiB0aGUgaW50cm9kdWN0aW9uIG9mIHhlbmJ1cyBt
dWx0aS1wYWdlIHN1cHBvcnQgaW4gY29tbWl0IGNjYzlkOTBhOWE4Ygo+ID4+ICgieGVuYnVzX2Ns
aWVudDogRXh0ZW5kIGludGVyZmFjZSB0byBzdXBwb3J0IG11bHRpLXBhZ2UgcmluZyIpLgo+ID4+
Cj4gPj4gSW4gdGhpcyBjb21taXQgYSBwb2ludGVyIHRvIHRoZSBzaGFyZWQgcGFnZSBhZGRyZXNz
IHdhcyBiZWluZwo+ID4+IHBhc3NlZCB0byB0aGUgeGVuYnVzX2dyYW50X3JpbmcoKSBmdW5jdGlv
biByYXRoZXIgdGhlbiB0aGUKPiA+PiBhZGRyZXNzIG9mIHRoZSBzaGFyZWQgcGFnZSBpdHNlbGYu
ICBUaGlzIHJlc3VsdGVkIGluIGEgc2l0dWF0aW9uCj4gPiBJJ20gc29ycnkgYnV0IEknbSBmYXIg
ZnJvbSBiZWluZyBleHBlcnQgd2l0aCBYZW4gYW5kIHRoaXMgc2VudGVuY2UKPiA+IGNvbmZ1c2Vz
IG1lIHNvIG1heWJlIGNvdWxkIG9wZW4gaXQgdXAgYSBiaXQuCj4gPgo+ID4gRm9yIG1lICJzaGFy
ZWQgcGFnZSBhZGRyZXNzIiBhbmQgImFkZHJlc3Mgb2YgdGhlIHNoYXJlZCBwYWdlIiBhcmUKPiA+
IHRoZSBzYW1lIHRoaW5nLiBXaGF0IGFtIEkgbWlzc2luZz8gSSBtZWFuIGp1c3QgZGlmZmVyZW50
IGZvcm1zIGluCj4gPiBlbmdsaXNoIHRvIGRlc2NyaWJlIHRoZSBleGFjdCBzYW1lIHRoaW5nLi4u
Cj4gCj4geGVuYnVzX2dyYW50X3JpbmcoKSB0YWtlcyBhcyBhbiBhcmd1bWVudCBhZGRyZXNzIG9m
IHRoZSByaW5nIHNoYXJlZAo+IGJldHdlZW4gdHdvIGd1ZXN0cy4gV2hhdCBHcmVnIHdhcyB0cnlp
bmcgdG8gZGVzY3JpYmUgd2FzIHRoZSBmYWN0IHRoYXQKPiBleGlzdGluZyBjb2RlIGluc3RlYWQg
cGFzc2VzIGFkZHJlc3Mgb2YgbG9jYXRpb24gd2hlcmUgdGhpcyBhZGRyZXNzIGlzCj4gc3RvcmVk
IChpLmUuIHNvbWV3aGF0IHNpbWlsYXIgdG8gZGlmZmVyZW5jZSBiZXR3ZWVuIHBvaW50ZXIgYW5k
IHBvaW50ZXIKPiB0byBhIHBvaW50ZXIpLgoKSnVzdCB0byB1bmRlcnN0YW5kIHRoaXMgYnVnIGJl
dHRlciB3aHkgZGlkIG5vdCB0aGUgd3JvbmcgdmVyc2lvbgpjYXVzZSBhbnkgdW5kZWZpbmVkIGJl
aGF2aW9yPyBTb3VuZHMgbGlrZSBhIGZhdGFsIGJ1Zy4gRG9lcyB0aGlzCmNhdXNlIGNyYXNoZXM/
Cgo+IFdvdWxkIHRoaXMgYmUgYmV0dGVyOgo+IAo+ICJJbiB0aGlzIGNvbW1pdCBwb2ludGVyIHRv
IGxvY2F0aW9uIG9mIHRoZSB3aGVyZSB0aGUgc2hhcmVkIHBhZ2UgYWRkcmVzcwo+IGlzIHN0b3Jl
ZCB3YXMgYmVpbmcgcGFzc2VkIHRvIHRoZSB4ZW5idXNfZ3JhbnRfcmluZygpIGZ1bmN0aW9uIHJh
dGhlcgo+IHRoZW4gdGhlCj4gYWRkcmVzcyBvZiB0aGUgc2hhcmVkIHBhZ2UgaXRzZWxmLiIKClll
cywgZGVmaW5pdGVseSEKCj4gT3IgcGxlYXNlIHN1Z2dlc3QgYSBiZXR0ZXIgYWx0ZXJuYXRpdmUs
IEknbGwgYmUgaGFwcHkgdG8gYW1lbmQgdGhlCj4gY29tbWl0IG1lc3NhZ2UuCgpUaGFuayB5b3Uu
Cgo+IFRoYW5rcy4KPiAtYm9yaXMKCi9KYXJra28KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
