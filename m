From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2] tpm: Restore functionality to xen vtpm
 driver.
Date: Mon, 17 Sep 2018 09:54:37 -0400
Message-ID: <b82c4603-1a60-16ec-14b6-81251e114b75__45762.155581224$1537192341$gmane$org@oracle.com>
References: <20180913212551.2435-1-boris.ostrovsky@oracle.com>
 <20180916192510.GF7473@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sv8h=l7=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1g1txq-0007WA-NW
 for xen-devel@lists.xenproject.org; Mon, 17 Sep 2018 13:53:22 +0000
In-Reply-To: <20180916192510.GF7473@linux.intel.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: jgross@suse.com, "Dr . Greg Wettstein" <greg@enjellic.com>, dunlapg@umich.edu, linux-kernel@vger.kernel.org, stable@vger.kernel.org, jgg@ziepe.ca, "Dr. Greg Wettstein" <greg@wind.enjellic.com>, xen-devel@lists.xenproject.org, peterhuewe@gmx.de, linux-integrity@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gOS8xNi8xOCAzOjI1IFBNLCBKYXJra28gU2Fra2luZW4gd3JvdGU6Cj4gT24gVGh1LCBTZXAg
MTMsIDIwMTggYXQgMDU6MjU6NTFQTSAtMDQwMCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+PiBG
cm9tOiAiRHIuIEdyZWcgV2V0dHN0ZWluIiA8Z3JlZ0B3aW5kLmVuamVsbGljLmNvbT4KPj4KPj4g
RnVuY3Rpb25hbGl0eSBvZiB0aGUgeGVuLXRwbWZyb250IGRyaXZlciB3YXMgbG9zdCBzZWNvbmRh
cnkgdG8KPj4gdGhlIGludHJvZHVjdGlvbiBvZiB4ZW5idXMgbXVsdGktcGFnZSBzdXBwb3J0IGlu
IGNvbW1pdCBjY2M5ZDkwYTlhOGIKPj4gKCJ4ZW5idXNfY2xpZW50OiBFeHRlbmQgaW50ZXJmYWNl
IHRvIHN1cHBvcnQgbXVsdGktcGFnZSByaW5nIikuCj4+Cj4+IEluIHRoaXMgY29tbWl0IGEgcG9p
bnRlciB0byB0aGUgc2hhcmVkIHBhZ2UgYWRkcmVzcyB3YXMgYmVpbmcKPj4gcGFzc2VkIHRvIHRo
ZSB4ZW5idXNfZ3JhbnRfcmluZygpIGZ1bmN0aW9uIHJhdGhlciB0aGVuIHRoZQo+PiBhZGRyZXNz
IG9mIHRoZSBzaGFyZWQgcGFnZSBpdHNlbGYuICBUaGlzIHJlc3VsdGVkIGluIGEgc2l0dWF0aW9u
Cj4gSSdtIHNvcnJ5IGJ1dCBJJ20gZmFyIGZyb20gYmVpbmcgZXhwZXJ0IHdpdGggWGVuIGFuZCB0
aGlzIHNlbnRlbmNlCj4gY29uZnVzZXMgbWUgc28gbWF5YmUgY291bGQgb3BlbiBpdCB1cCBhIGJp
dC4KPgo+IEZvciBtZSAic2hhcmVkIHBhZ2UgYWRkcmVzcyIgYW5kICJhZGRyZXNzIG9mIHRoZSBz
aGFyZWQgcGFnZSIgYXJlCj4gdGhlIHNhbWUgdGhpbmcuIFdoYXQgYW0gSSBtaXNzaW5nPyBJIG1l
YW4ganVzdCBkaWZmZXJlbnQgZm9ybXMgaW4KPiBlbmdsaXNoIHRvIGRlc2NyaWJlIHRoZSBleGFj
dCBzYW1lIHRoaW5nLi4uCgp4ZW5idXNfZ3JhbnRfcmluZygpIHRha2VzIGFzIGFuIGFyZ3VtZW50
IGFkZHJlc3Mgb2YgdGhlIHJpbmcgc2hhcmVkCmJldHdlZW4gdHdvIGd1ZXN0cy4gV2hhdCBHcmVn
IHdhcyB0cnlpbmcgdG8gZGVzY3JpYmUgd2FzIHRoZSBmYWN0IHRoYXQKZXhpc3RpbmcgY29kZSBp
bnN0ZWFkIHBhc3NlcyBhZGRyZXNzIG9mIGxvY2F0aW9uIHdoZXJlIHRoaXMgYWRkcmVzcyBpcwpz
dG9yZWQgKGkuZS4gc29tZXdoYXQgc2ltaWxhciB0byBkaWZmZXJlbmNlIGJldHdlZW4gcG9pbnRl
ciBhbmQgcG9pbnRlcgp0byBhIHBvaW50ZXIpLgoKV291bGQgdGhpcyBiZSBiZXR0ZXI6CgoiSW4g
dGhpcyBjb21taXQgcG9pbnRlciB0byBsb2NhdGlvbiBvZiB0aGUgd2hlcmUgdGhlIHNoYXJlZCBw
YWdlIGFkZHJlc3MKaXMgc3RvcmVkIHdhcyBiZWluZyBwYXNzZWQgdG8gdGhlIHhlbmJ1c19ncmFu
dF9yaW5nKCkgZnVuY3Rpb24gcmF0aGVyCnRoZW4gdGhlCmFkZHJlc3Mgb2YgdGhlIHNoYXJlZCBw
YWdlIGl0c2VsZi4iCgpPciBwbGVhc2Ugc3VnZ2VzdCBhIGJldHRlciBhbHRlcm5hdGl2ZSwgSSds
bCBiZSBoYXBweSB0byBhbWVuZCB0aGUKY29tbWl0IG1lc3NhZ2UuCgoKVGhhbmtzLgotYm9yaXMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
